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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40qmQl3hGhzDqL5
 for <openbmc@lists.ozlabs.org>; Tue, 22 May 2018 16:46:55 +1000 (AEST)
Received: from pasglop.ozlabs.ibm.com (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w4M6kZOX004709;
 Tue, 22 May 2018 01:46:35 -0500
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13 1/3] fsi/scom: Add mutex around FSI2PIB accesses
Date: Tue, 22 May 2018 16:46:28 +1000
Message-Id: <20180522064630.19466-1-benh@kernel.crashing.org>
X-Mailer: git-send-email 2.17.0
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
X-List-Received-Date: Tue, 22 May 2018 06:46:56 -0000

Otherwise, multiple clients can open the driver and attempt
to access the PIB at the same time, thus clobbering each other
in the process.

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 drivers/fsi/fsi-scom.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/fsi/fsi-scom.c b/drivers/fsi/fsi-scom.c
index c8eb5e5b94a7..3cba0eb645e1 100644
--- a/drivers/fsi/fsi-scom.c
+++ b/drivers/fsi/fsi-scom.c
@@ -37,6 +37,7 @@ struct scom_device {
 	struct list_head link;
 	struct fsi_device *fsi_dev;
 	struct miscdevice mdev;
+	struct mutex lock;
 	char	name[32];
 	int idx;
 };
@@ -53,21 +54,26 @@ static int put_scom(struct scom_device *scom_dev, uint64_t value,
 	int rc;
 	uint32_t data;
 
+	mutex_lock(&scom_dev->lock);
+
 	data = cpu_to_be32((value >> 32) & 0xffffffff);
 	rc = fsi_device_write(scom_dev->fsi_dev, SCOM_DATA0_REG, &data,
 				sizeof(uint32_t));
 	if (rc)
-		return rc;
+		goto bail;
 
 	data = cpu_to_be32(value & 0xffffffff);
 	rc = fsi_device_write(scom_dev->fsi_dev, SCOM_DATA1_REG, &data,
 				sizeof(uint32_t));
 	if (rc)
-		return rc;
+		goto bail;
 
 	data = cpu_to_be32(SCOM_WRITE_CMD | addr);
-	return fsi_device_write(scom_dev->fsi_dev, SCOM_CMD_REG, &data,
+	rc = fsi_device_write(scom_dev->fsi_dev, SCOM_CMD_REG, &data,
 				sizeof(uint32_t));
+ bail:
+	mutex_unlock(&scom_dev->lock);
+	return rc;
 }
 
 static int get_scom(struct scom_device *scom_dev, uint64_t *value,
@@ -76,27 +82,31 @@ static int get_scom(struct scom_device *scom_dev, uint64_t *value,
 	uint32_t result, data;
 	int rc;
 
+
+	mutex_lock(&scom_dev->lock);
 	*value = 0ULL;
 	data = cpu_to_be32(addr);
 	rc = fsi_device_write(scom_dev->fsi_dev, SCOM_CMD_REG, &data,
 				sizeof(uint32_t));
 	if (rc)
-		return rc;
+		goto bail;
 
 	rc = fsi_device_read(scom_dev->fsi_dev, SCOM_DATA0_REG, &result,
 				sizeof(uint32_t));
 	if (rc)
-		return rc;
+		goto bail;
 
 	*value |= (uint64_t)cpu_to_be32(result) << 32;
 	rc = fsi_device_read(scom_dev->fsi_dev, SCOM_DATA1_REG, &result,
 				sizeof(uint32_t));
 	if (rc)
-		return rc;
+		goto bail;
 
 	*value |= cpu_to_be32(result);
 
-	return 0;
+ bail:
+	mutex_unlock(&scom_dev->lock);
+	return rc;
 }
 
 static ssize_t scom_read(struct file *filep, char __user *buf, size_t len,
@@ -183,6 +193,7 @@ static int scom_probe(struct device *dev)
 	if (!scom)
 		return -ENOMEM;
 
+	mutex_init(&scom->lock);
 	scom->idx = ida_simple_get(&scom_ida, 1, INT_MAX, GFP_KERNEL);
 	snprintf(scom->name, sizeof(scom->name), "scom%d", scom->idx);
 	scom->fsi_dev = fsi_dev;
-- 
2.17.0
