Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t6Wrs35mzzDvWW
 for <openbmc@lists.ozlabs.org>; Mon, 31 Oct 2016 09:10:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=ogJehKLc; 
 dkim-atps=neutral
Received: by mail-oi0-x242.google.com with SMTP id v84so2662114oie.2
 for <openbmc@lists.ozlabs.org>; Sun, 30 Oct 2016 15:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Jdp5c4+veAfWrvg4GEbViZVEuCmmmYtDvrPnTg7J91M=;
 b=ogJehKLcSt5Gr2K8qapEjiwqv9O5kxADEjvggZc0xs8y8+FwlD0ubIbVT1mPBZkSnI
 ZPnf7bxANwFkzzk/smCZrPBc4NaikgJVS6HicCJh2aIcSuO6LB1bFeil1VZpudDFpHXJ
 djQYNpSRiuOWNiawRNgsC/8vnTB8MA/oTPoL5tHmb6cj6CFaYa6246xE9m2YuB1GecOY
 IVljR7KzOXCeOIfXEGn4v6eC1U8YW8PMnmamv7vwSi6/hxT/VLlC5IjG2lGSL8SNVf7K
 vKA+txfpKA1D7IA8xhJBbgOBB8tssH789eZwneE1aX79ls9taFDgLrGJ8ftrfgDO5qGB
 +ayQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Jdp5c4+veAfWrvg4GEbViZVEuCmmmYtDvrPnTg7J91M=;
 b=Kkg3Pbs0ga9RkcJ/ssLEVv37Z+iiKDKxlXDscCQ7g0z2w+jCQEf8zveNKJ9MOlZhHs
 Eo0gJTMSivqr0A0bUnO7umcJ2/kAf2endAQYssYtdzByIgbz5moc1QMUJc+LrvkLvse+
 V+vqIUAEP24vmHt1jBSl/KtqtLmjgCSHjOHMKFi+Odknmil/t3BmQTW9qElfGNVxxUre
 eO2gZ0shREIpfs0ZgjXxkVcNEdV6f4YxBKlSaIEkCq09GPcyBSyafb0ReZe42/xghi7Q
 JFuVQIVXjaBu9gTo715OYA4TmsD8D2/IL7Rg+IGPVQJyDyrcSJAiI+2wW/9mzl6eON6Q
 RrbA==
X-Gm-Message-State: ABUngvcywPBoNqNc64fIyqDl2BnRVtFMseJ0i9P/B0rh5mzx3UEb/LIig0MLls+q28/9fA==
X-Received: by 10.202.4.78 with SMTP id 75mr2533985oie.128.1477865419732;
 Sun, 30 Oct 2016 15:10:19 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id q59sm7585484ota.20.2016.10.30.15.10.18
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sun, 30 Oct 2016 15:10:19 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH linux v6 10/18] fsi: Implement slave initialisation
Date: Sun, 30 Oct 2016 17:09:31 -0500
Message-Id: <1477865379-11566-30-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailer: git-send-email 2.7.4 (Apple Git-66)
In-Reply-To: <1477865379-11566-1-git-send-email-christopher.lee.bostic@gmail.com>
References: <1477865379-11566-1-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Sun, 30 Oct 2016 22:10:21 -0000

From: Jeremy Kerr <jk@ozlabs.org>

Create fsi_slave devices during the master scan.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 drivers/fsi/fsi-core.c | 51 ++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 49 insertions(+), 2 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 2d22320..4282370 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -18,6 +18,7 @@
 #include <linux/device.h>
 #include <linux/fsi.h>
 #include <linux/module.h>
+#include <linux/slab.h>
 
 #include "fsi-master.h"
 
@@ -60,12 +61,58 @@ static bool check_crc4_u32(uint32_t x)
 }
 
 /* FSI slave support */
+
+static void fsi_slave_release(struct device *dev)
+{
+	struct fsi_slave *slave = to_fsi_slave(dev);
+
+	kfree(slave);
+}
+
 static int fsi_slave_init(struct fsi_master *master,
 		int link, uint8_t slave_id)
 {
-	/* todo: initialise slave device, perform engine scan */
+	struct fsi_slave *slave;
+	uint32_t chip_id;
+	int rc;
+
+	rc = master->read(master, link, slave_id, 0, &chip_id, sizeof(chip_id));
+	if (rc) {
+		dev_warn(master->dev, "can't read slave %02x:%02x: %d\n",
+				link, slave_id, rc);
+		return -ENODEV;
+	}
+
+	chip_id = be32_to_cpu(chip_id);
+	if (!check_crc4_u32(chip_id)) {
+		dev_warn(master->dev, "slave %02x:%02x: invalid chip id CRC!\n",
+				link, slave_id);
+		return -EIO;
+	}
+
+	pr_debug("fsi: found chip %08x at %02x:%02x:%02x\n",
+			master->idx, chip_id, link, slave_id);
+
+	/* we can communicate with a slave; create devices and scan */
+	slave = kzalloc(sizeof(*slave), GFP_KERNEL);
+	if (!slave)
+		return -ENOMEM;
+
+	slave->master = master;
+	slave->id = slave_id;
+	slave->dev.parent = master->dev;
+	slave->dev.release = fsi_slave_release;
+
+	dev_set_name(&slave->dev, "slave@%02x:%02x", link, slave_id);
+	rc = device_register(&slave->dev);
+	if (rc < 0) {
+		dev_warn(master->dev, "failed to create slave device: %d\n",
+				rc);
+		put_device(&slave->dev);
+		return rc;
+	}
 
-	return -ENODEV;
+	return rc;
 }
 
 /* FSI master support */
-- 
1.8.2.2
