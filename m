Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-pa0-x243.google.com (mail-pa0-x243.google.com
 [IPv6:2607:f8b0:400e:c03::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3swhjY0ZB1zDt4Q
 for <openbmc@lists.ozlabs.org>; Sat, 15 Oct 2016 09:14:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=DOefZTXV; 
 dkim-atps=neutral
Received: by mail-pa0-x243.google.com with SMTP id os4so2458452pac.3
 for <openbmc@lists.ozlabs.org>; Fri, 14 Oct 2016 15:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=rOayd6yqQEjURZInnL08jFgLHqOngbsNasG/b6YyVuo=;
 b=DOefZTXV8ihAvG8DvBWV8pd2i9KScQ7znAwCCdoJJaymb8tB3KtaDt4BdjYh6J4f7j
 9rpqXDHIBa3yBAdLzUR9mwVdB++TdzM7OO84V74WSWEBy/7m3qt649hH1Qjp5h9NswC9
 RkNOD6sE3meOYtY92B5inSX1Z6KxrLZ9beInv4YOQSzfyhf/iLSCYjkMo+htNlcP9akI
 h+J99Ev+REgU9LIPbvUiUZtsOER+B5E1K3pYr0xkgyRdLv83A2kdYCUA9y+TS/85A30W
 zM2Mg2US4OMxEUEyTkf0NYG6zQwZd9zxwN91xotyj9bwerWIkDqVCkev+zGp1tSeQWB4
 3PbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=rOayd6yqQEjURZInnL08jFgLHqOngbsNasG/b6YyVuo=;
 b=V6tV44fH7rNuyDjS4FwmEXk0Kg7HLuAjVaPkeLiwt2doOkLC8q5OXf7A0GujusEKG6
 bpL7YerGpMmTU3s1e4KCZW/+/Slk6Q48R8f/kyjX29gGy2B7cQeTZNmrHEWWS30FGLka
 MqV1nPIZmVjCGWMswXjWR7vHQWlCH/CX/AVeCbW7BDbo/GJc29CrFKWiIrb1IFX7CESX
 QAQJR0LUaswO6tYfwMM4Sf3ScAZuwZTOQxexe54l5REHoq3EkCCBczpUr2WkyS2wfjOV
 1xxWoxoisWbabWmS8+mXpESQJG8x6hSblO6Ps/UZusTAxe+hd+ZcutR3Ab+Ymm8iTVM5
 8aNA==
X-Gm-Message-State: AA6/9RnbuMvp/2i/hq5rQ0PNVdn4yAbgpK7jtcLOz7oRGib5dNlD43DCkCvQhWa6tJkD3g==
X-Received: by 10.66.9.227 with SMTP id d3mr18312360pab.43.1476483295517;
 Fri, 14 Oct 2016 15:14:55 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id p7sm29848874paa.3.2016.10.14.15.14.54
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Fri, 14 Oct 2016 15:14:54 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH linux v4 05/20] fsi: Add fake master driver
Date: Fri, 14 Oct 2016 17:14:27 -0500
Message-Id: <1476483282-85971-6-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailer: git-send-email 2.7.4 (Apple Git-66)
In-Reply-To: <1476483282-85971-1-git-send-email-christopher.lee.bostic@gmail.com>
References: <1476483282-85971-1-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Fri, 14 Oct 2016 22:14:57 -0000

From: Jeremy Kerr <jk@ozlabs.org>

For debugging, add a fake master driver, that only supports reads,
returning a fixed set of data.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 drivers/fsi/Kconfig           | 10 +++++
 drivers/fsi/Makefile          |  1 +
 drivers/fsi/fsi-master-fake.c | 96 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 107 insertions(+)
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
index 0000000..50aac0b
--- /dev/null
+++ b/drivers/fsi/fsi-master-fake.c
@@ -0,0 +1,96 @@
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
+
-- 
1.8.2.2
