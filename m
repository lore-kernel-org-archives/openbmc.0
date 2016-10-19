Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-it0-x244.google.com (mail-it0-x244.google.com
 [IPv6:2607:f8b0:4001:c0b::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sznhh45nTzDt2L
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 10:09:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=WoRLUXjp; 
 dkim-atps=neutral
Received: by mail-it0-x244.google.com with SMTP id 66so3131747itl.3
 for <openbmc@lists.ozlabs.org>; Wed, 19 Oct 2016 16:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=uQGw1kamjRIz9sSH+lBpHPuCl8NZGVvizyqJMq3a+uE=;
 b=WoRLUXjp9WmJ9VwaJbnfRahCb0Ucpsxmb9QGc7O6Op2w6h8DIoRMFHsT1VVONU4u9H
 AzoqAdk3VVk/st9YMXHxF2IEpFhQt5B8YIq5mFbb39fN2bvmhfzNcynjel3VfModTR14
 7KG8fSgWkrnAwXobW3watWNuJF9E9Kyx4W+r9f3JX/PRbSGgNPberiAwfNLf7oSanExu
 czwaOw/1boOkzGbgtfDO9TtAKbNrTNHZt6ogJj7b177vYbol+gwsUgoiFXN9p+SmZbkP
 ZQtwURrvMxTF/C9Lf71rXibDifJX1Qa8rzTQ9/T8Xdc5gMPVNNq3t2oT+5DovcxmzHMY
 c6JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=uQGw1kamjRIz9sSH+lBpHPuCl8NZGVvizyqJMq3a+uE=;
 b=Y7wxx0TvSXG6AuA2IfmCdkxJ809Dl7S27iNAS3aZB8JaJI7Y07C1da9i6oZKKPRb6+
 5PSNpvwuxI6mk3EJ+rf5njjHTxoJGbz1HE0bcaoqQ7zYmEm5mLMDWNSdqcxvC2wjppdd
 RezfAYdy0hDezOo3YFTwe4GrsGvivvB3l8GKOENvXusBMAny5dsApsfjcxmzpK25sWO/
 K9sxLvroCv5DcANmPWDIzT9O98tQjoNmAcTk1fNNVdgcK36AMQS1xhmKfMevGMoOdf/K
 /1VemZRYL0z5C+668673Qt9yFyKs+cGwpcOAsKyrJcifVOCSQvjjzqEtleMlLhtvP9Ih
 BNnQ==
X-Gm-Message-State: AA6/9Rn0syLlbHE4QtSb57L0Gjx1AFaVtYUUeqYT60wQyIyS2/UhjxXaxx0EAU9onIz2Vg==
X-Received: by 10.157.60.70 with SMTP id j6mr4684315ote.183.1476918594778;
 Wed, 19 Oct 2016 16:09:54 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id n196sm15487618oig.8.2016.10.19.16.09.54
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Wed, 19 Oct 2016 16:09:54 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Jeremy Kerr <jk@ozlabs.org>, Chris Bostic <cbostic@us.ibm.com>
Subject: [PATCH linux v5 05/18] fsi: Add fake master driver
Date: Wed, 19 Oct 2016 18:09:33 -0500
Message-Id: <1476918586-13475-6-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailer: git-send-email 2.7.4 (Apple Git-66)
In-Reply-To: <1476918586-13475-1-git-send-email-christopher.lee.bostic@gmail.com>
References: <1476918586-13475-1-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Wed, 19 Oct 2016 23:09:57 -0000

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
