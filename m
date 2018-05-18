Return-Path: <benh@kernel.crashing.org>
Authentication-Results: lists.ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40n9Gt68ChzF29h
 for <openbmc@lists.ozlabs.org>; Fri, 18 May 2018 11:16:06 +1000 (AEST)
Received: from pasglop.ozlabs.ibm.com (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w4I1FK0h015236;
 Thu, 17 May 2018 20:15:27 -0500
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH v2 linux dev-4.13 3/3] fsi/fsi-occ: Simple conversion to new
 sbefifo driver
Date: Fri, 18 May 2018 11:15:17 +1000
Message-Id: <20180518011517.10045-3-benh@kernel.crashing.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180518011517.10045-1-benh@kernel.crashing.org>
References: <20180518011517.10045-1-benh@kernel.crashing.org>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 18 May 2018 01:16:08 -0000

Replace open/close/write/read API with the simple submit()
API and the helper to parse status.

This doesn't yet extract FFDC

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 drivers/fsi/Makefile       |   2 +-
 drivers/fsi/fsi-occ.c      | 202 +++++++++++++++++--------------------
 drivers/hwmon/occ/Makefile |   2 +-
 3 files changed, 94 insertions(+), 112 deletions(-)

diff --git a/drivers/fsi/Makefile b/drivers/fsi/Makefile
index f331e929423c..75fdc6d8cfc4 100644
--- a/drivers/fsi/Makefile
+++ b/drivers/fsi/Makefile
@@ -4,4 +4,4 @@ obj-$(CONFIG_FSI_MASTER_HUB) += fsi-master-hub.o
 obj-$(CONFIG_FSI_MASTER_GPIO) += fsi-master-gpio.o
 obj-$(CONFIG_FSI_SCOM) += fsi-scom.o
 obj-$(CONFIG_FSI_SBEFIFO) += fsi-sbefifo.o
-#obj-$(CONFIG_FSI_OCC) += fsi-occ.o
+obj-$(CONFIG_FSI_OCC) += fsi-occ.o
diff --git a/drivers/fsi/fsi-occ.c b/drivers/fsi/fsi-occ.c
index d368b62e5471..bdee26096688 100644
--- a/drivers/fsi/fsi-occ.c
+++ b/drivers/fsi/fsi-occ.c
@@ -36,6 +36,13 @@
 #define OCC_CMD_DATA_BYTES	4090
 #define OCC_RESP_DATA_BYTES	4089
 
+/*
+ * Assume we don't have FFDC, if we do we'll overflow and
+ * fail the command. This needs to be big enough for simple
+ * commands as well.
+ */
+#define OCC_SBE_STATUS_WORDS	16
+
 #define OCC_TIMEOUT_MS		1000
 #define OCC_CMD_IN_PRG_WAIT_MS	50
 
@@ -447,110 +454,71 @@ static int occ_verify_checksum(struct occ_response *resp, u16 data_length)
 	return 0;
 }
 
-static int occ_write_sbefifo(struct sbefifo_client *client, const char *buf,
-			     ssize_t len)
-{
-	int rc;
-	ssize_t total = 0;
-
-	do {
-		rc = sbefifo_drv_write(client, &buf[total], len - total);
-		if (rc < 0)
-			return rc;
-		else if (!rc)
-			break;
-
-		total += rc;
-	} while (total < len);
-
-	return (total == len) ? 0 : -ENOSPC;
-}
-
-static int occ_read_sbefifo(struct sbefifo_client *client, char *buf,
-			    ssize_t len)
-{
-	int rc;
-	ssize_t total = 0;
-
-	do {
-		rc = sbefifo_drv_read(client, &buf[total], len - total);
-		if (rc < 0)
-			return rc;
-		else if (!rc)
-			break;
-
-		total += rc;
-	} while (total < len);
-
-	return (total == len) ? 0 : -ENODATA;
-}
-
 static int occ_getsram(struct device *sbefifo, u32 address, u8 *data,
 		       ssize_t len)
 {
-	int rc;
-	u8 *resp;
-	__be32 buf[5];
 	u32 data_len = ((len + 7) / 8) * 8;	/* must be multiples of 8 B */
-	struct sbefifo_client *client;
+	size_t resp_len, resp_data_len;
+	__be32 *resp, cmd[5];
+	int rc;
 
 	/*
 	 * Magic sequence to do SBE getsram command. SBE will fetch data from
 	 * specified SRAM address.
 	 */
-	buf[0] = cpu_to_be32(0x5);
-	buf[1] = cpu_to_be32(0xa403);
-	buf[2] = cpu_to_be32(1);
-	buf[3] = cpu_to_be32(address);
-	buf[4] = cpu_to_be32(data_len);
-
-	client = sbefifo_drv_open(sbefifo, 0);
-	if (!client)
-		return -ENODEV;
-
-	rc = occ_write_sbefifo(client, (const char *)buf, sizeof(buf));
-	if (rc)
-		goto done;
-
-	resp = kzalloc(data_len, GFP_KERNEL);
-	if (!resp) {
-		rc = -ENOMEM;
-		goto done;
-	}
+	cmd[0] = cpu_to_be32(0x5);
+	cmd[1] = cpu_to_be32(0xa403);
+	cmd[2] = cpu_to_be32(1);
+	cmd[3] = cpu_to_be32(address);
+	cmd[4] = cpu_to_be32(data_len);
+
+	resp_len = (data_len >> 2) + OCC_SBE_STATUS_WORDS;
+	resp = kzalloc(resp_len << 2 , GFP_KERNEL);
+	if (!resp)
+		return -ENOMEM;
 
-	rc = occ_read_sbefifo(client, (char *)resp, data_len);
+	rc = sbefifo_submit(sbefifo, cmd, 5, resp, &resp_len);
 	if (rc)
 		goto free;
-
-	/* check for good response */
-	rc = occ_read_sbefifo(client, (char *)buf, 8);
+	rc = sbefifo_parse_status(0xa403, resp, resp_len, &resp_len);
 	if (rc)
 		goto free;
 
-	if ((be32_to_cpu(buf[0]) == data_len) &&
-	    (be32_to_cpu(buf[1]) == 0xC0DEA403))
-		memcpy(data, resp, len);
-	else
+	resp_data_len = be32_to_cpu(resp[resp_len - 1]);
+	if (resp_data_len != data_len) {
+		pr_err("occ: SRAM read expected %d bytes got %d\n",
+		       data_len, resp_data_len);
 		rc = -EBADMSG;
+	} else {
+		memcpy(data, resp, len);
+	}
 
 free:
+	/* Convert positive SBEI status */
+	if (rc > 0) {
+		pr_err("occ: SRAM read returned failure status: %08x\n", rc);
+		rc = -EBADMSG;
+	}
 	kfree(resp);
-
-done:
-	sbefifo_drv_release(client);
 	return rc;
 }
 
 static int occ_putsram(struct device *sbefifo, u32 address, u8 *data,
 		       ssize_t len)
 {
-	int rc;
-	__be32 *buf;
+	size_t cmd_len, buf_len, resp_len, resp_data_len;
 	u32 data_len = ((len + 7) / 8) * 8;	/* must be multiples of 8 B */
-	size_t cmd_len = data_len + 20;
-	struct sbefifo_client *client;
+	__be32 *buf;
+	int rc;
 
-	buf = kzalloc(cmd_len, GFP_KERNEL);
+	/*
+	 * We use the same buffer for command and response, make
+	 * sure it's big enough
+	 */
+	resp_len = OCC_SBE_STATUS_WORDS;
+	cmd_len = (data_len >> 2) + 5;
+	buf_len = max(cmd_len, resp_len);
+	buf = kzalloc(buf_len << 2, GFP_KERNEL);
 	if (!buf)
 		return -ENOMEM;
 
@@ -558,7 +526,7 @@ static int occ_putsram(struct device *sbefifo, u32 address, u8 *data,
 	 * Magic sequence to do SBE putsram command. SBE will transfer
 	 * data to specified SRAM address.
 	 */
-	buf[0] = cpu_to_be32(0x5 + (data_len / 4));
+	buf[0] = cpu_to_be32(cmd_len);
 	buf[1] = cpu_to_be32(0xa404);
 	buf[2] = cpu_to_be32(1);
 	buf[3] = cpu_to_be32(address);
@@ -566,37 +534,43 @@ static int occ_putsram(struct device *sbefifo, u32 address, u8 *data,
 
 	memcpy(&buf[5], data, len);
 
-	client = sbefifo_drv_open(sbefifo, 0);
-	if (!client) {
-		rc = -ENODEV;
-		goto free;
-	}
-
-	rc = occ_write_sbefifo(client, (const char *)buf, cmd_len);
+	rc = sbefifo_submit(sbefifo, buf, cmd_len, buf, &resp_len);
 	if (rc)
-		goto done;
-
-	rc = occ_read_sbefifo(client, (char *)buf, 8);
+		goto free;
+	rc = sbefifo_parse_status(0xa404, buf, resp_len, &resp_len);
 	if (rc)
-		goto done;
+		goto free;
 
-	/* check for good response */
-	if ((be32_to_cpu(buf[0]) != data_len) ||
-	    (be32_to_cpu(buf[1]) != 0xC0DEA404))
+	if (resp_len != 1) {
+		pr_err("occ: SRAM write response lenght invalid: %d\n",
+		       resp_len);
 		rc = -EBADMSG;
-
-done:
-	sbefifo_drv_release(client);
+	} else {
+		resp_data_len = be32_to_cpu(buf[0]);
+		if (resp_data_len != data_len) {
+			pr_err("occ: SRAM write expected %d bytes got %d\n",
+			       data_len, resp_data_len);
+			rc = -EBADMSG;
+		}
+	}
 free:
+	/* Convert positive SBEI status */
+	if (rc > 0) {
+		pr_err("occ: SRAM write returned failure status: %08x\n", rc);
+		rc = -EBADMSG;
+	}
 	kfree(buf);
 	return rc;
 }
 
 static int occ_trigger_attn(struct device *sbefifo)
 {
+	__be32 buf[OCC_SBE_STATUS_WORDS];
+	size_t resp_len, resp_data_len;
 	int rc;
-	__be32 buf[7];
-	struct sbefifo_client *client;
+
+	BUILD_BUG_ON(OCC_SBE_STATUS_WORDS < 7);
+	resp_len = OCC_SBE_STATUS_WORDS;
 
 	buf[0] = cpu_to_be32(0x5 + 0x2);        /* Chip-op length in words */
 	buf[1] = cpu_to_be32(0xa404);           /* PutOCCSRAM */
@@ -606,24 +580,32 @@ static int occ_trigger_attn(struct device *sbefifo)
 	buf[5] = cpu_to_be32(0x20010000);       /* Trigger OCC attention */
 	buf[6] = 0;
 
-	client = sbefifo_drv_open(sbefifo, 0);
-	if (!client)
-		return -ENODEV;
-
-	rc = occ_write_sbefifo(client, (const char *)buf, sizeof(buf));
+	rc = sbefifo_submit(sbefifo, buf, 7, buf, &resp_len);
 	if (rc)
-		goto done;
-
-	rc = occ_read_sbefifo(client, (char *)buf, 8);
+		goto error;
+	rc = sbefifo_parse_status(0xa404, buf, resp_len, &resp_len);
 	if (rc)
-		goto done;
+		goto error;
 
-	/* check for good response */
-	if ((be32_to_cpu(buf[0]) != 8) || (be32_to_cpu(buf[1]) != 0xC0DEA404))
+	if (resp_len != 1) {
+		pr_err("occ: SRAM attn response lenght invalid: %d\n",
+		       resp_len);
 		rc = -EBADMSG;
+	} else {
+		resp_data_len = be32_to_cpu(buf[0]);
+		if (resp_data_len != 8) {
+			pr_err("occ: SRAM attn expected 8 bytes got %d\n",
+			       resp_data_len);
+			rc = -EBADMSG;
+		}
+	}
+ error:
+	/* Convert positive SBEI status */
+	if (rc > 0) {
+		pr_err("occ: SRAM attn returned failure status: %08x\n", rc);
+		rc = -EBADMSG;
+	}
 
-done:
-	sbefifo_drv_release(client);
 
 	return rc;
 }
diff --git a/drivers/hwmon/occ/Makefile b/drivers/hwmon/occ/Makefile
index ca6d25ae9da8..ab5c3e965ccb 100644
--- a/drivers/hwmon/occ/Makefile
+++ b/drivers/hwmon/occ/Makefile
@@ -1,7 +1,7 @@
 occ-hwmon-objs := common.o
 
 ifeq ($(CONFIG_SENSORS_OCC_P9_SBE), y)
-#occ-hwmon-objs += p9_sbe.o
+occ-hwmon-objs += p9_sbe.o
 endif
 
 ifeq ($(CONFIG_SENSORS_OCC_P8_I2C), y)
-- 
2.17.0
