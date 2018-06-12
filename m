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
 by lists.ozlabs.org (Postfix) with ESMTPS id 414dVq5gggzF4FS
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jun 2018 15:20:03 +1000 (AEST)
Received: from pasglop.ozlabs.ibm.com (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w5C5JDa6008698;
 Tue, 12 Jun 2018 00:19:25 -0500
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: openbmc@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [RFC PATCH 4/5] fsi/scom: Add register definitions
Date: Tue, 12 Jun 2018 15:19:10 +1000
Message-Id: <20180612051911.20690-5-benh@kernel.crashing.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180612051911.20690-1-benh@kernel.crashing.org>
References: <20180612051911.20690-1-benh@kernel.crashing.org>
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
X-List-Received-Date: Tue, 12 Jun 2018 05:20:04 -0000

Add a few more register and bit definitions, also define and use
SCOM_READ_CMD (which is 0 but it makes the code clearer)

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 drivers/fsi/fsi-scom.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/fsi/fsi-scom.c b/drivers/fsi/fsi-scom.c
index 6ddfb6021420..e98573ecdae1 100644
--- a/drivers/fsi/fsi-scom.c
+++ b/drivers/fsi/fsi-scom.c
@@ -30,8 +30,25 @@
 #define SCOM_DATA0_REG		0x00
 #define SCOM_DATA1_REG		0x04
 #define SCOM_CMD_REG		0x08
+#define SCOM_FSI2PIB_RESET_REG	0x18
+#define SCOM_STATUS_REG		0x1C /* Read */
+#define SCOM_PIB_RESET_REG	0x1C /* Write */
 
+/* Command register */
 #define SCOM_WRITE_CMD		0x80000000
+#define SCOM_READ_CMD		0x00000000
+
+/* Status register bits */
+#define SCOM_STATUS_ERR_SUMMARY		0x80000000
+#define SCOM_STATUS_PROTECTION		0x01000000
+#define SCOM_STATUS_PIB_ABORT		0x00100000
+#define SCOM_STATUS_PIB_RESP_MASK	0x00007000
+#define SCOM_STATUS_PIB_RESP_SHIFT	12
+
+#define SCOM_STATUS_ANY_ERR		(SCOM_STATUS_ERR_SUMMARY | \
+					 SCOM_STATUS_PROTECTION | \
+					 SCOM_STATUS_PIB_ABORT | \
+					 SCOM_STATUS_PIB_RESP_MASK)
 
 struct scom_device {
 	struct list_head link;
@@ -85,7 +102,7 @@ static int get_scom(struct scom_device *scom_dev, uint64_t *value,
 
 	mutex_lock(&scom_dev->lock);
 	*value = 0ULL;
-	data = cpu_to_be32(addr);
+	data = cpu_to_be32(SCOM_READ_CMD | addr);
 	rc = fsi_device_write(scom_dev->fsi_dev, SCOM_CMD_REG, &data,
 				sizeof(uint32_t));
 	if (rc)
-- 
2.17.0
