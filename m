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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40qmQn1BgKzDqR4
 for <openbmc@lists.ozlabs.org>; Tue, 22 May 2018 16:46:56 +1000 (AEST)
Received: from pasglop.ozlabs.ibm.com (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w4M6kZOY004709;
 Tue, 22 May 2018 01:46:37 -0500
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13 2/3] fsi/scom: Whitespace fixes
Date: Tue, 22 May 2018 16:46:29 +1000
Message-Id: <20180522064630.19466-2-benh@kernel.crashing.org>
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
X-List-Received-Date: Tue, 22 May 2018 06:46:57 -0000

No functional changes

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 drivers/fsi/fsi-scom.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/fsi/fsi-scom.c b/drivers/fsi/fsi-scom.c
index 3cba0eb645e1..8a608db0aa07 100644
--- a/drivers/fsi/fsi-scom.c
+++ b/drivers/fsi/fsi-scom.c
@@ -49,7 +49,7 @@ static struct list_head scom_devices;
 static DEFINE_IDA(scom_ida);
 
 static int put_scom(struct scom_device *scom_dev, uint64_t value,
-			uint32_t addr)
+		    uint32_t addr)
 {
 	int rc;
 	uint32_t data;
@@ -77,7 +77,7 @@ static int put_scom(struct scom_device *scom_dev, uint64_t value,
 }
 
 static int get_scom(struct scom_device *scom_dev, uint64_t *value,
-			uint32_t addr)
+		    uint32_t addr)
 {
 	uint32_t result, data;
 	int rc;
@@ -110,7 +110,7 @@ static int get_scom(struct scom_device *scom_dev, uint64_t *value,
 }
 
 static ssize_t scom_read(struct file *filep, char __user *buf, size_t len,
-			loff_t *offset)
+			 loff_t *offset)
 {
 	int rc;
 	struct miscdevice *mdev =
@@ -136,7 +136,7 @@ static ssize_t scom_read(struct file *filep, char __user *buf, size_t len,
 }
 
 static ssize_t scom_write(struct file *filep, const char __user *buf,
-			size_t len, loff_t *offset)
+			  size_t len, loff_t *offset)
 {
 	int rc;
 	struct miscdevice *mdev = filep->private_data;
-- 
2.17.0
