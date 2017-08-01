Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xLyck2P9TzDsRw
 for <openbmc@lists.ozlabs.org>; Tue,  1 Aug 2017 10:58:46 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v710wiCd071175
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jul 2017 20:58:44 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2c2ch0pmx6-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jul 2017 20:58:37 -0400
Received: from localhost
 by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Mon, 31 Jul 2017 20:58:36 -0400
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e14.ny.us.ibm.com (146.89.104.201) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 31 Jul 2017 20:58:35 -0400
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v710wY2623986292; Tue, 1 Aug 2017 00:58:34 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E745DAC041;
 Mon, 31 Jul 2017 20:58:48 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.85.136.69])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP id 9035EAC03F;
 Mon, 31 Jul 2017 20:58:48 -0400 (EDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.12 02/10] drivers/hwmon/occ: Add command transport
 method for P8 and P9
Date: Mon, 31 Jul 2017 19:58:19 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1501549107-22323-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1501549107-22323-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17080100-0052-0000-0000-000002489698
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007462; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00895763; UDB=6.00448041; IPR=6.00675950; 
 BA=6.00005503; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016472; XFM=3.00000015;
 UTC=2017-08-01 00:58:36
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17080100-0053-0000-0000-00005184C31F
Message-Id: <1501549107-22323-3-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-31_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1708010012
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Aug 2017 00:58:46 -0000

From: "Edward A. James" <eajames@us.ibm.com>

For the P8 OCC, add the procedure to send a command to the OCC over I2C
bus. This involves writing the OCC command registers with serial
communication operations (SCOMs) interpreted by the I2C slave. For the
P9 OCC, add a procedure to use the OCC in-kernel API to send a command
to the OCC through the SBE engine.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/occ/p8_i2c.c | 184 ++++++++++++++++++++++++++++++++++++++++++++-
 drivers/hwmon/occ/p9_sbe.c |  50 +++++++++++-
 2 files changed, 232 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/occ/p8_i2c.c b/drivers/hwmon/occ/p8_i2c.c
index 025471f..745fb52 100644
--- a/drivers/hwmon/occ/p8_i2c.c
+++ b/drivers/hwmon/occ/p8_i2c.c
@@ -11,9 +11,26 @@
 #include <linux/errno.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
+#include <linux/occ.h>
+#include <linux/sched.h>
+#include <asm/unaligned.h>
 
 #include "common.h"
 
+#define OCC_TIMEOUT_MS			1000
+#define OCC_CMD_IN_PRG_WAIT_MS		50
+
+/* OCB (on-chip control bridge - interface to OCC) registers */
+#define OCB_DATA1			0x6B035
+#define OCB_ADDR			0x6B070
+#define OCB_DATA3			0x6B075
+
+/* OCC SRAM address space */
+#define OCC_SRAM_ADDR_CMD		0xFFFF6000
+#define OCC_SRAM_ADDR_RESP		0xFFFF7000
+
+#define OCC_DATA_ATTN			0x20010000
+
 struct p8_i2c_occ {
 	struct occ occ;
 	struct i2c_client *client;
@@ -21,9 +38,174 @@ struct p8_i2c_occ {
 
 #define to_p8_i2c_occ(x)	container_of((x), struct p8_i2c_occ, occ)
 
+static int p8_i2c_occ_getscom(struct i2c_client *client, u32 address, u8 *data)
+{
+	ssize_t rc;
+	__be64 buf;
+	struct i2c_msg msgs[2];
+
+	/* p8 i2c slave requires shift */
+	address <<= 1;
+
+	msgs[0].addr = client->addr;
+	msgs[0].flags = client->flags & I2C_M_TEN;
+	msgs[0].len = sizeof(u32);
+	/* address is a scom address; bus-endian */
+	msgs[0].buf = (char *)&address;
+
+	/* data from OCC is big-endian */
+	msgs[1].addr = client->addr;
+	msgs[1].flags = (client->flags & I2C_M_TEN) | I2C_M_RD;
+	msgs[1].len = sizeof(u64);
+	msgs[1].buf = (char *)&buf;
+
+	rc = i2c_transfer(client->adapter, msgs, 2);
+	if (rc < 0)
+		return rc;
+
+	*(u64 *)data = be64_to_cpu(buf);
+
+	return 0;
+}
+
+static int p8_i2c_occ_putscom(struct i2c_client *client, u32 address, u8 *data)
+{
+	u32 buf[3];
+	ssize_t rc;
+
+	/* p8 i2c slave requires shift */
+	address <<= 1;
+
+	/* address is bus-endian; data passed through from user as-is */
+	buf[0] = address;
+	memcpy(&buf[1], &data[4], sizeof(u32));
+	memcpy(&buf[2], data, sizeof(u32));
+
+	rc = i2c_master_send(client, (const char *)buf, sizeof(buf));
+	if (rc < 0)
+		return rc;
+	else if (rc != sizeof(buf))
+		return -EIO;
+
+	return 0;
+}
+
+static int p8_i2c_occ_putscom_u32(struct i2c_client *client, u32 address,
+				  u32 data0, u32 data1)
+{
+	u8 buf[8];
+
+	memcpy(buf, &data0, 4);
+	memcpy(buf + 4, &data1, 4);
+
+	return p8_i2c_occ_putscom(client, address, buf);
+}
+
+static int p8_i2c_occ_putscom_be(struct i2c_client *client, u32 address,
+				 u8 *data)
+{
+	__be32 data0, data1;
+
+	memcpy(&data0, data, 4);
+	memcpy(&data1, data + 4, 4);
+
+	return p8_i2c_occ_putscom_u32(client, address, be32_to_cpu(data0),
+				      be32_to_cpu(data1));
+}
+
 static int p8_i2c_occ_send_cmd(struct occ *occ, u8 *cmd)
 {
-	return -EOPNOTSUPP;
+	int i, rc;
+	unsigned long start;
+	u16 data_length;
+	const unsigned long timeout = msecs_to_jiffies(OCC_TIMEOUT_MS);
+	const long int wait_time = msecs_to_jiffies(OCC_CMD_IN_PRG_WAIT_MS);
+	struct p8_i2c_occ *p8_i2c_occ = to_p8_i2c_occ(occ);
+	struct i2c_client *client = p8_i2c_occ->client;
+	struct occ_response *resp = &occ->resp;
+
+	start = jiffies;
+
+	/* set sram address for command */
+	rc = p8_i2c_occ_putscom_u32(client, OCB_ADDR, OCC_SRAM_ADDR_CMD, 0);
+	if (rc)
+		return rc;
+
+	/* write command (expected to already be BE), we need bus-endian... */
+	rc = p8_i2c_occ_putscom_be(client, OCB_DATA3, cmd);
+	if (rc)
+		return rc;
+
+	/* trigger OCC attention */
+	rc = p8_i2c_occ_putscom_u32(client, OCB_DATA1, OCC_DATA_ATTN, 0);
+	if (rc)
+		return rc;
+
+	do {
+		/* set sram address for response */
+		rc = p8_i2c_occ_putscom_u32(client, OCB_ADDR,
+					    OCC_SRAM_ADDR_RESP, 0);
+		if (rc)
+			return rc;
+
+		rc = p8_i2c_occ_getscom(client, OCB_DATA3, (u8 *)resp);
+		if (rc)
+			return rc;
+
+		/* wait for OCC */
+		if (resp->return_status == OCC_RESP_CMD_IN_PRG) {
+			rc = -EALREADY;
+
+			if (time_after(jiffies, start + timeout))
+				break;
+
+			set_current_state(TASK_INTERRUPTIBLE);
+			schedule_timeout(wait_time);
+		}
+	} while (rc);
+
+	/* check the OCC response */
+	switch (resp->return_status) {
+	case OCC_RESP_CMD_IN_PRG:
+		rc = -ETIMEDOUT;
+		break;
+	case OCC_RESP_SUCCESS:
+		rc = 0;
+		break;
+	case OCC_RESP_CMD_INVAL:
+	case OCC_RESP_CMD_LEN_INVAL:
+	case OCC_RESP_DATA_INVAL:
+	case OCC_RESP_CHKSUM_ERR:
+		rc = -EINVAL;
+		break;
+	case OCC_RESP_INT_ERR:
+	case OCC_RESP_BAD_STATE:
+	case OCC_RESP_CRIT_EXCEPT:
+	case OCC_RESP_CRIT_INIT:
+	case OCC_RESP_CRIT_WATCHDOG:
+	case OCC_RESP_CRIT_OCB:
+	case OCC_RESP_CRIT_HW:
+		rc = -EREMOTEIO;
+		break;
+	default:
+		rc = -EPROTO;
+	}
+
+	if (rc < 0)
+		return rc;
+
+	data_length = get_unaligned_be16(&resp->data_length);
+	if (data_length > OCC_RESP_DATA_BYTES)
+		return -EMSGSIZE;
+
+	/* fetch the rest of the response data */
+	for (i = 8; i < data_length + 7; i += 8) {
+		rc = p8_i2c_occ_getscom(client, OCB_DATA3, ((u8 *)resp) + i);
+		if (rc)
+			return rc;
+	}
+
+	return 0;
 }
 
 static int p8_i2c_occ_probe(struct i2c_client *client,
diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
index 58c3bb2..667d190 100644
--- a/drivers/hwmon/occ/p9_sbe.c
+++ b/drivers/hwmon/occ/p9_sbe.c
@@ -10,6 +10,7 @@
 #include <linux/device.h>
 #include <linux/errno.h>
 #include <linux/module.h>
+#include <linux/occ.h>
 #include <linux/platform_device.h>
 
 #include "common.h"
@@ -23,7 +24,54 @@ struct p9_sbe_occ {
 
 static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
 {
-	return -EOPNOTSUPP;
+	int rc;
+	struct occ_client *client;
+	struct occ_response *resp = &occ->resp;
+	struct p9_sbe_occ *p9_sbe_occ = to_p9_sbe_occ(occ);
+
+	client = occ_drv_open(p9_sbe_occ->sbe, 0);
+	if (!client)
+		return -ENODEV;
+
+	/* skip first byte (sequence number), OCC driver handles it */
+	rc = occ_drv_write(client, (const char *)&cmd[1], 7);
+	if (rc < 0)
+		goto err;
+
+	rc = occ_drv_read(client, (char *)resp, sizeof(*resp));
+	if (rc < 0)
+		goto err;
+
+	/* check the OCC response */
+	switch (resp->return_status) {
+	case OCC_RESP_CMD_IN_PRG:
+		rc = -ETIMEDOUT;
+		break;
+	case OCC_RESP_SUCCESS:
+		rc = 0;
+		break;
+	case OCC_RESP_CMD_INVAL:
+	case OCC_RESP_CMD_LEN_INVAL:
+	case OCC_RESP_DATA_INVAL:
+	case OCC_RESP_CHKSUM_ERR:
+		rc = -EINVAL;
+		break;
+	case OCC_RESP_INT_ERR:
+	case OCC_RESP_BAD_STATE:
+	case OCC_RESP_CRIT_EXCEPT:
+	case OCC_RESP_CRIT_INIT:
+	case OCC_RESP_CRIT_WATCHDOG:
+	case OCC_RESP_CRIT_OCB:
+	case OCC_RESP_CRIT_HW:
+		rc = -EREMOTEIO;
+		break;
+	default:
+		rc = -EPROTO;
+	}
+
+err:
+	occ_drv_release(client);
+	return rc;
 }
 
 static int p9_sbe_occ_probe(struct platform_device *pdev)
-- 
1.8.3.1
