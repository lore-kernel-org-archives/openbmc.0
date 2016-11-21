Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMXsX2J8TzDvjC
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 13:41:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="v6aMKQX1"; 
 dkim-atps=neutral
Received: by mail-oi0-x242.google.com with SMTP id f201so16439607oib.0
 for <openbmc@lists.ozlabs.org>; Sun, 20 Nov 2016 18:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=uQGw1kamjRIz9sSH+lBpHPuCl8NZGVvizyqJMq3a+uE=;
 b=v6aMKQX1vXLY67E3kMDI+YOVAU34eTe795jnA6ZZQpk1yyqIgUDUYXjIz0QO1SnQbW
 K6qtblX3K5JXbDPgaNm9qzO6olDUSMHUwn/Et2gKPtetmj940SZi9kSX4B7ld0Vryrzm
 aOHgeOuK2eYm7yrIJvV8L7+pCqvPybF2zI+DAZ3gq0qU0/ywttmfaVokgrBwNVfsCDYj
 UsvenrmIm4JSQ6okVlHzp4zSn9GU/+VFhdXShw5td+nVc274yTKWAJyAGvQg6WD2xLqH
 hpEonbIYqnfTSlve8R+iDENP5iQEZUb88+IpGMPGa/X6cPZXIonkUEAT2j73J3ybHT+H
 SSHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=uQGw1kamjRIz9sSH+lBpHPuCl8NZGVvizyqJMq3a+uE=;
 b=jEz3rKiPfbvTpy1joVMPoI06lvHiKJplL1F1utT2K5jxCz9Ak5OaIH0ffOthKlPG1h
 kEPssxXFn51FFZ3vHZeWfzNkLkDmhxDSyWt19GZZZYuGOStdSuhQGR3p6jdFLcLTecJV
 BtURlra7sQIhj2jWIr/GsjnThlycnzrbwLInpPnlF0Hp9h/HO9rAXIoReOgyn9s4dSGg
 nTENpkKu4DUCmXZZWLSzrWrWXJ0WYZEixbdFOBoVPZE2JzgGskrfMEXE5qHk2XLS7qmL
 Cg3HeXQjUeJ6Y7vSl36EuohMt629Gan7mm+Cyaj/ssd/OzwCj2Xam6KMsFGA2piC4B+9
 MT/w==
X-Gm-Message-State: AKaTC02nn2Mx86+LzsJikTbaYu3NkwV9+nuMI1XGr2To4njX7uQI++PExGkxTCBZLEdlMQ==
X-Received: by 10.157.17.120 with SMTP id p53mr6999151otp.182.1479696062593;
 Sun, 20 Nov 2016 18:41:02 -0800 (PST)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id 73sm6432307otf.16.2016.11.20.18.41.01
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sun, 20 Nov 2016 18:41:02 -0800 (PST)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org, gustavo.padovan@collabora.co.uk,
 gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch, jthumshirn@suse.de,
 dan.j.williams@intel.com, sre@kernel.org, clg@kaod.org,
 k.kozlowski@samsung.com
Cc: jk@ozlabs.org, joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 benh@kernel.crashing.org, alistair@popple.id.au,
 Chris Bostic <cbostic@us.ibm.com>
Subject: [PATCH linux 05/19] fsi: Add fake master driver
Date: Sun, 20 Nov 2016 20:40:34 -0600
Message-Id: <1479696048-75851-6-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Mon, 21 Nov 2016 02:41:04 -0000

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
