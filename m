Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x241.google.com (mail-oi0-x241.google.com
 [IPv6:2607:f8b0:4003:c06::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMXsd4qsRzDvjC
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 13:41:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="uMx6wAOE"; 
 dkim-atps=neutral
Received: by mail-oi0-x241.google.com with SMTP id m75so1348330oig.1
 for <openbmc@lists.ozlabs.org>; Sun, 20 Nov 2016 18:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=UCMCq4jMtMNzuOI/0wlkOKjsTgfjdjiisD3FG6g2xvY=;
 b=uMx6wAOEclLrMJU0eRUsEvHUJsM70w2s04CwNLdvFu/hLhQbdS+e+rkTiG8CjKxSJe
 i+qeVXcKN+B5uMG+XFVXA3s0GviK56NbNlZQQvccZwSI8ugvb5/u3KU+W5Sd8CYUfZ9m
 ljhjopWG2wTWk5ePydqIfjoytksy6GJvQt2SiIST1vjoQlNZ8pkUVjoYmZ9cUV/2IZlq
 lPiDu61ujnKcBu6XzaVF1akNPWZDfbJgRxVEJCXxDvDtSJuGEfYmP/wZbM0EqwTEb09K
 f1VQVF2wMIR2q5U7STZXGl9tT+xcNpXPutbDyz/j1NnAtsJs+AV4B3DB4T0xT9VsudDw
 TlIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=UCMCq4jMtMNzuOI/0wlkOKjsTgfjdjiisD3FG6g2xvY=;
 b=OZ1p/KGQUg+7M0ERgKL279fGP+VuOab1ctN09liRrOVW+l7Wvh0Nh98fShoDrvCh4N
 EEQmT6XaxtRJhxqi/7Sm+56aYlUC3eHKpOUB5j7EsyX+lY9jOLRE2TUSpJNKVoIRY0kj
 J0/883Y8HMWEfsUkcHkST/H7Mxy5nW5/T7vhOVs/hyhdn9Ytvwnn7rKeAj1UhJ1mNP06
 1o13Raki/Nj0p3ng7uHf9J/a8bmTz3SF5t+CD2dpd2dyD7YfX5m357N1D5UXCxpsUWmG
 30oabpOhuVC+Vyp9mnSbUZgN2OWjpyNDyfXqzxTj478wOV6mMl4bafzFg2iEHXODAf/6
 IfIw==
X-Gm-Message-State: AKaTC00pYoX6zcZ5hH0B64gMc64v8nE4Dvt9vn94ysfdRD92RavqBHpE8teigWmVR0Q6Xg==
X-Received: by 10.157.29.8 with SMTP id m8mr6871795otm.18.1479696067981;
 Sun, 20 Nov 2016 18:41:07 -0800 (PST)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id 73sm6432307otf.16.2016.11.20.18.41.06
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sun, 20 Nov 2016 18:41:07 -0800 (PST)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org, gustavo.padovan@collabora.co.uk,
 gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch, jthumshirn@suse.de,
 dan.j.williams@intel.com, sre@kernel.org, clg@kaod.org,
 k.kozlowski@samsung.com
Cc: jk@ozlabs.org, joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 benh@kernel.crashing.org, alistair@popple.id.au,
 Chris Bostic <cbostic@us.ibm.com>
Subject: [PATCH linux 10/19] fsi: Implement slave initialisation
Date: Sun, 20 Nov 2016 20:40:39 -0600
Message-Id: <1479696048-75851-11-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailer: git-send-email 2.7.4 (Apple Git-66)
In-Reply-To: <1479696048-75851-1-git-send-email-christopher.lee.bostic@gmail.com>
References: <1479696048-75851-1-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailman-Approved-At: Mon, 21 Nov 2016 13:57:36 +1100
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
X-List-Received-Date: Mon, 21 Nov 2016 02:41:10 -0000

From: Jeremy Kerr <jk@ozlabs.org>

Create fsi_slave devices during the master scan.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
Signed-off-by: Chris Bostic <cbostic@us.ibm.com>
---
 drivers/fsi/fsi-core.c | 55 ++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 53 insertions(+), 2 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index b8d53d5..2aa6394 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -18,10 +18,14 @@
 #include <linux/device.h>
 #include <linux/fsi.h>
 #include <linux/module.h>
+#include <linux/slab.h>
 
 #include "fsi-master.h"
 
 #define FSI_N_SLAVES	4
+#define FSI_SLAVE_CONF_CRC_SHIFT        4
+#define FSI_SLAVE_CONF_CRC_MASK         0x0000000f
+#define FSI_SLAVE_CONF_DATA_BITS        28
 
 static atomic_t master_idx = ATOMIC_INIT(-1);
 
@@ -56,12 +60,59 @@ uint8_t fsi_crc4(uint8_t c, uint64_t x, int bits)
 EXPORT_SYMBOL_GPL(fsi_crc4);
 
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
+	uint8_t crc;
+
+	rc = master->read(master, link, slave_id, 0, &chip_id, sizeof(chip_id));
+	if (rc) {
+		dev_warn(master->dev, "can't read slave %02x:%02x: %d\n",
+				link, slave_id, rc);
+		return -ENODEV;
+	}
+	crc = fsi_crc4(0, chip_id >> FSI_SLAVE_CONF_CRC_SHIFT,
+			FSI_SLAVE_CONF_DATA_BITS);
+	if (crc != (chip_id & FSI_SLAVE_CONF_CRC_MASK)) {
+		dev_warn(master->dev, "slave %02x:%02x invalid chip id CRC!\n",
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
