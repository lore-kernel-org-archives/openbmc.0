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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40n9jX0n99zF29S
 for <openbmc@lists.ozlabs.org>; Fri, 18 May 2018 11:35:43 +1000 (AEST)
Received: from pasglop.ozlabs.ibm.com (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w4I1Z2Vk016295;
 Thu, 17 May 2018 20:35:13 -0500
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13 3/4] fsi/occ: Nicer error messages when talking
 to a host that isn't ready
Date: Fri, 18 May 2018 11:34:59 +1000
Message-Id: <20180518013500.18005-3-benh@kernel.crashing.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180518013500.18005-1-benh@kernel.crashing.org>
References: <20180518013500.18005-1-benh@kernel.crashing.org>
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
X-List-Received-Date: Fri, 18 May 2018 01:35:45 -0000

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 drivers/fsi/fsi-occ.c      | 12 ++++++++++++
 drivers/hwmon/occ/common.c |  9 +++++++--
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/fsi/fsi-occ.c b/drivers/fsi/fsi-occ.c
index 7a5afa78fb6b..4bda1b435ecb 100644
--- a/drivers/fsi/fsi-occ.c
+++ b/drivers/fsi/fsi-occ.c
@@ -484,6 +484,10 @@ static int occ_getsram(struct device *sbefifo, u32 address, u8 *data,
 		rc = sbefifo_submit(sbefifo, cmd, 5, resp, &resp_len);
 		if (rc == 0)
 			rc = sbefifo_parse_status(0xa403, resp, resp_len, &resp_len);
+		if (rc == -ESHUTDOWN) {
+			pr_info("occ: Host not ready\n");
+			return rc;
+		}
 		if (rc) {
 			if (rc < 0)
 				pr_err("occ: FSI error %d, retrying sram read\n", rc);
@@ -548,6 +552,10 @@ static int occ_putsram(struct device *sbefifo, u32 address, u8 *data,
 
 		resp_len = OCC_SBE_STATUS_WORDS;
 		rc = sbefifo_submit(sbefifo, buf, cmd_len, buf, &resp_len);
+		if (rc == -ESHUTDOWN) {
+			pr_info("occ: Host not ready\n");
+			return rc;
+		}
 		if (rc == 0)
 			rc = sbefifo_parse_status(0xa404, buf, resp_len, &resp_len);
 		if (rc) {
@@ -604,6 +612,10 @@ static int occ_trigger_attn(struct device *sbefifo)
 		buf[6] = 0;
 
 		rc = sbefifo_submit(sbefifo, buf, 7, buf, &resp_len);
+		if (rc == -ESHUTDOWN) {
+			pr_info("occ: Host not ready\n");
+			return rc;
+		}
 		if (rc == 0)
 			rc = sbefifo_parse_status(0xa404, buf, resp_len, &resp_len);
 		if (rc) {
diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
index 88c32915b8bf..10f5c0586d47 100644
--- a/drivers/hwmon/occ/common.c
+++ b/drivers/hwmon/occ/common.c
@@ -1350,8 +1350,13 @@ int occ_setup(struct occ *occ, const char *name)
 	/* no need to lock */
 	rc = occ_poll(occ);
 	if (rc < 0) {
-		dev_err(occ->bus_dev, "failed to get OCC poll response: %d\n",
-			rc);
+		/*
+		 * If the error is -ESHUTDOWN, fail silently, as this happen in
+		 * normal circumstances when the driver is loaded too early
+		 */
+		if (rc != -ESHUTDOWN)
+			dev_err(occ->bus_dev, "failed to get OCC poll response: %d\n",
+				rc);
 		return rc;
 	}
 
-- 
2.17.0
