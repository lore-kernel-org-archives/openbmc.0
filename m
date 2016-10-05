Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x244.google.com (mail-oi0-x244.google.com
 [IPv6:2607:f8b0:4003:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sq7M70NDyzDrPK
 for <openbmc@lists.ozlabs.org>; Thu,  6 Oct 2016 07:54:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=G3LoC0jZ; 
 dkim-atps=neutral
Received: by mail-oi0-x244.google.com with SMTP id o93so4737362oik.0
 for <openbmc@lists.ozlabs.org>; Wed, 05 Oct 2016 13:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=bxEqnA/yyPq/VWP2/7tNrEYHytB6CJh4ph8PR9kRf20=;
 b=G3LoC0jZGg28Ln1EQ23ZACnuB5OgARr3VgpfAOwFaSlCLNpSVElBVb+N2u3dOVy0d0
 +QnDLpfeuH/jpeLPWPLk2j9E3GFk7RsPmd1K0GIAUG4EFM6P9TKm5WbAHLQ5GNna5aMf
 gkvjuBR4kuRch4iCA9NlUeVrpJyOJVSxtqQCmH8fZhQMYLMu8TpGHzrHDeOUNyVq8oBy
 shEa6G+lu9BlhaBtGvZRMRmQLbtWchiuxjiFvk2p26R4lViKGcrwQQT7WuuCvmG953vJ
 xIqzQwLjyI5OJvMG0ekVzpGGq7AWhG4Xh1nQPMMXV3t4v9vbonh34KfgCpw0yervNvPO
 4cCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=bxEqnA/yyPq/VWP2/7tNrEYHytB6CJh4ph8PR9kRf20=;
 b=JKgSR1Wf+pKlXA+tSKMWKeU56oRXKkihTOibHnU0rK8K0F+IiRCnrvp4Ks8ZioWhGn
 rnwRVeI1HfVg4MH5eV0O9Jt0Ss06II5BS188zZmAM6mhqrKBP8tWKbfAklp6Y+VZ+Z5f
 q7i3q/TOeMEi7wIpc3UykjexeTid62SDWQWUhcEvFAM19KTLqcMg+H2y5a5dawsftSDk
 K48WNgDjpPaCpu2Zj1IuVDjBVFCPzsDAmp8t8RUJckhckHgLN50yVfv01Nbwf5dirr03
 wJ4RP7PuOGNZQ338kfgeI+QhQTZy4N6SCO7GURgT4G3Xx1deO5JAEUZNXKdOdT4gfG0H
 H9jg==
X-Gm-Message-State: AA6/9RlziS68L/5DYnStQoU5sreiJh7Ofb/I5SW3m9O6VFLapyVYx9iKzmXQRsaWCGX5eQ==
X-Received: by 10.202.204.144 with SMTP id c138mr1987168oig.138.1475700881355; 
 Wed, 05 Oct 2016 13:54:41 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id i18sm3206459oib.12.2016.10.05.13.54.40
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Wed, 05 Oct 2016 13:54:41 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH linux 10/15] fsi: Implement slave initialisation
Date: Wed,  5 Oct 2016 15:54:23 -0500
Message-Id: <1475700868-75737-11-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailer: git-send-email 2.7.4 (Apple Git-66)
In-Reply-To: <1475700868-75737-1-git-send-email-christopher.lee.bostic@gmail.com>
References: <1475700868-75737-1-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Wed, 05 Oct 2016 20:54:43 -0000

From: Jeremy Kerr <jk@ozlabs.org>

Create fsi_slave devices during the master scan.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 drivers/fsi/fsi-core.c | 50 ++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 48 insertions(+), 2 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 24538ae..49a8e14 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -18,6 +18,7 @@
 #include <linux/device.h>
 #include <linux/fsi.h>
 #include <linux/module.h>
+#include <linux/slab.h>
 
 #include "fsi-master.h"
 
@@ -58,12 +59,57 @@ static bool check_crc4(uint32_t x)
 }
 
 /* FSI slave support */
+
+static void fsi_slave_release(struct device *dev)
+{
+	struct fsi_slave *slave = to_fsi_slave(dev);
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
+	if (!check_crc4(chip_id)) {
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
