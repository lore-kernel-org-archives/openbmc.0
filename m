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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40qmRl39V1zDqgK
 for <openbmc@lists.ozlabs.org>; Tue, 22 May 2018 16:47:47 +1000 (AEST)
Received: from pasglop.ozlabs.ibm.com (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w4M6kZOZ004709;
 Tue, 22 May 2018 01:46:38 -0500
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13 3/3] fsi/scom: Fixup endian annotations
Date: Tue, 22 May 2018 16:46:30 +1000
Message-Id: <20180522064630.19466-3-benh@kernel.crashing.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180522064630.19466-1-benh@kernel.crashing.org>
References: <20180522064630.19466-1-benh@kernel.crashing.org>
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
X-List-Received-Date: Tue, 22 May 2018 06:47:48 -0000

Use the proper annotated type __be32 and fixup the
accessor used for get_scom()

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 drivers/fsi/fsi-scom.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/fsi/fsi-scom.c b/drivers/fsi/fsi-scom.c
index 8a608db0aa07..6ddfb6021420 100644
--- a/drivers/fsi/fsi-scom.c
+++ b/drivers/fsi/fsi-scom.c
@@ -51,8 +51,8 @@ static DEFINE_IDA(scom_ida);
 static int put_scom(struct scom_device *scom_dev, uint64_t value,
 		    uint32_t addr)
 {
+	__be32 data;
 	int rc;
-	uint32_t data;
 
 	mutex_lock(&scom_dev->lock);
 
@@ -79,7 +79,7 @@ static int put_scom(struct scom_device *scom_dev, uint64_t value,
 static int get_scom(struct scom_device *scom_dev, uint64_t *value,
 		    uint32_t addr)
 {
-	uint32_t result, data;
+	__be32 result, data;
 	int rc;
 
 
@@ -96,14 +96,13 @@ static int get_scom(struct scom_device *scom_dev, uint64_t *value,
 	if (rc)
 		goto bail;
 
-	*value |= (uint64_t)cpu_to_be32(result) << 32;
+	*value |= (uint64_t)be32_to_cpu(result) << 32;
 	rc = fsi_device_read(scom_dev->fsi_dev, SCOM_DATA1_REG, &result,
 				sizeof(uint32_t));
 	if (rc)
 		goto bail;
 
-	*value |= cpu_to_be32(result);
-
+	*value |= be32_to_cpu(result);
  bail:
 	mutex_unlock(&scom_dev->lock);
 	return rc;
-- 
2.17.0
