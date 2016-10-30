Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t6Wrl5WL6zDvXh
 for <openbmc@lists.ozlabs.org>; Mon, 31 Oct 2016 09:10:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=nh0G0Z3y; 
 dkim-atps=neutral
Received: by mail-oi0-x242.google.com with SMTP id 62so5826525oif.1
 for <openbmc@lists.ozlabs.org>; Sun, 30 Oct 2016 15:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=uQGw1kamjRIz9sSH+lBpHPuCl8NZGVvizyqJMq3a+uE=;
 b=nh0G0Z3ysS3OuGSlCVCdKNAKp78GMBn5dXIvQa+YghuU81cDPANSNN1mUkYJpTvqKH
 sYgjCs+85dTdB7foFg8hP2B2i7TXpKAhHgv3WRue5puZAyi47O4kJJs1dXhqXketq23Z
 1M/wi0p0xSO7l846PF/OvSlf1URtjfqqf+IRUNz0IQ1/oOYeSFpgw4urPHyer1cU3n3m
 woFKfCiuhwLCoUj2seyHPSJuY6Cpx1MUetIdAn2FajDWBYUo+MqVm+72iPgLW5ewFUnA
 IB9zSoKpLvFTSvXnp0sRzBs9M4y1wCGKw3nlCEKdK7q63yJsGYRYvGVSoWHqSKq9QJgA
 2iew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=uQGw1kamjRIz9sSH+lBpHPuCl8NZGVvizyqJMq3a+uE=;
 b=DXB/JOGySkhzEeVoM0KbB9a00HXA4hW5hhGaymFkaRjSr6A742YE6HvBCnK+7pptQA
 bWpz6VcJF+Fdzb2FSJERusEJspTujMcKoaXdZX6Ciuw6UBiIc1y3TSWeivK+syEAPZBY
 vVGj7kWqMJUCH3+lAN/xo68z8jBUM3PC9FZvVqWFro/yl3dUS9e5PWOuLvT7YLNaIhNd
 phYjSgKyyvbVbriZibtBvCVXbxvtoKKtIMd4NMUUsmUvKQKKFfKmDx5lV+UoWcyFnnUk
 jUzY/GSiU2lgXGD9Z0sNF5o1CGXvTqyviU5QO1a2pUVx9rj/KYno89cNPQTGERhjeAL2
 4GXA==
X-Gm-Message-State: ABUngvfAjczNt+9HK3Ige1OTqc9VgSmsGAjOMiOToC4y0JAN6bOeFALP+FffWAMLjH9pbQ==
X-Received: by 10.202.80.8 with SMTP id e8mr24423164oib.20.1477865414043;
 Sun, 30 Oct 2016 15:10:14 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id q59sm7585484ota.20.2016.10.30.15.10.12
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sun, 30 Oct 2016 15:10:13 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Jeremy Kerr <jk@ozlabs.org>, Chris Bostic <cbostic@us.ibm.com>
Subject: [PATCH linux v6 05/18] fsi: Add fake master driver
Date: Sun, 30 Oct 2016 17:09:26 -0500
Message-Id: <1477865379-11566-25-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Sun, 30 Oct 2016 22:10:16 -0000

From: Jeremy Kerr <jk@ozlabs.org>

For debugging, add a fake master driver, that only supports reads,
returning a fixed set of data.

Includes changes from Chris Bostic <cbostic@us.ibm.com>.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
Signed-off-by: Chris Bostic <cbostic@us.ibm.com>
---
 drivers/fsi/Kconfig           | 10 +++++
 drivers/fsi/Makefile          |  1 +
 drivers/fsi/fsi-master-fake.c | 95 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 106 insertions(+)
 create mode 100644 drivers/fsi/fsi-master-fake.c

diff --git a/drivers/fsi/Kconfig b/drivers/fsi/Kconfig
index 04c1a0e..f065dbe 100644
--- a/drivers/fsi/Kconfig
+++ b/drivers/fsi/Kconfig
@@ -9,4 +9,14 @@ config FSI
 	---help---
 	  FSI - the FRU Support Interface - is a simple bus for low-level
 	  access to POWER-based hardware.
+
+if FSI
+
+config FSI_MASTER_FAKE
+	tristate "Fake FSI master"
+	depends on FSI
+	---help---
+	This option enables a fake FSI master driver for debugging.
+endif
+
 endmenu
diff --git a/drivers/fsi/Makefile b/drivers/fsi/Makefile
index db0e5e7..847c00c 100644
--- a/drivers/fsi/Makefile
+++ b/drivers/fsi/Makefile
@@ -1,2 +1,3 @@
 
 obj-$(CONFIG_FSI) += fsi-core.o
+obj-$(CONFIG_FSI_MASTER_FAKE) += fsi-master-fake.o
diff --git a/drivers/fsi/fsi-master-fake.c b/drivers/fsi/fsi-master-fake.c
new file mode 100644
index 0000000..ec1ed5e
--- /dev/null
+++ b/drivers/fsi/fsi-master-fake.c
@@ -0,0 +1,95 @@
+/*
+ * Fake FSI master driver for FSI development
+ *
+ * Copyright (C) IBM Corporation 2016
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/platform_device.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+
+#include "fsi-master.h"
+
+const uint8_t data[] = {
+	0xc0, 0x02, 0x08, 0x03,	/* chip id */
+	0x80, 0x01, 0x11, 0x00,	/* peek */
+	0x80, 0x01, 0x20, 0x3e,	/* slave */
+	0x00, 0x01, 0x10, 0xa5,	/* i2c */
+};
+
+
+static int fsi_master_fake_read(struct fsi_master *_master, int link,
+		uint8_t slave, uint32_t addr, void *val, size_t size)
+{
+	if (link != 0)
+		return -ENODEV;
+
+	if (addr + size > sizeof(data))
+		memset(val, 0, size);
+	else
+		memcpy(val, data + addr, size);
+
+	return 0;
+}
+
+static int fsi_master_fake_write(struct fsi_master *_master, int link,
+		uint8_t slave, uint32_t addr, const void *val, size_t size)
+{
+	if (link != 0)
+		return -ENODEV;
+
+	return -EACCES;
+}
+
+static int fsi_master_fake_probe(struct platform_device *pdev)
+{
+	struct fsi_master *master;
+
+	master = devm_kzalloc(&pdev->dev, sizeof(*master), GFP_KERNEL);
+	if (!master)
+		return -ENOMEM;
+
+	master->dev = &pdev->dev;
+	master->n_links = 1;
+	master->read = fsi_master_fake_read;
+	master->write = fsi_master_fake_write;
+
+	return fsi_master_register(master);
+}
+
+static const struct of_device_id fsi_master_fake_match[] = {
+	{ .compatible = "ibm,fsi-master-fake" },
+	{ },
+};
+
+static struct platform_driver fsi_master_fake_driver = {
+	.driver = {
+		.name		= "fsi-master-fake",
+		.of_match_table	= fsi_master_fake_match,
+	},
+	.probe	= fsi_master_fake_probe,
+};
+
+static int __init fsi_master_fake_init(void)
+{
+	struct device_node *np;
+
+	platform_driver_register(&fsi_master_fake_driver);
+
+	for_each_compatible_node(np, NULL, "ibm,fsi-master-fake")
+		of_platform_device_create(np, NULL, NULL);
+
+	return 0;
+}
+
+module_init(fsi_master_fake_init);
-- 
1.8.2.2
