Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x244.google.com (mail-oi0-x244.google.com
 [IPv6:2607:f8b0:4003:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s0g4m3x49zDqR4
 for <openbmc@lists.ozlabs.org>; Fri, 29 Jul 2016 04:15:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=NQuPaSuf; 
 dkim-atps=neutral
Received: by mail-oi0-x244.google.com with SMTP id c199so5260602oig.1
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jul 2016 11:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id;
 bh=rScVfV3nugEt1JGh6yf9WvP9x/cWWiCLPrULB9ryNPw=;
 b=NQuPaSuf4UgPz3aLj5HEqbcoY7o7BO2oHvRMw7SEBT+Iblr4G2f+ubqz2xevj7EGYW
 L6kj44hIPN7+1sjpQbCmPMjOLW6vPIjzxOIHfSYYIhf8SDmarY5/QkHx0P7sQeW7Dx9A
 kCBKSorb8gZ5XDZhRRMnJJ6BIExq42K1rpb6o752yfAFA15rqtspWB7CqnLudiJTqdqJ
 doJLDiLFH0t3n0pF+BVSTKaBeYJ3O4INnZh77qctKYGvGZOQnYIjOz+3TQR2x8vVjiu6
 qVFB7dQk5b5DWgxPDOOUxlvfNgUTViStCWXpqr7Yf+CiE8wH/JOtU+S3A5CcE0HN0yaA
 fNNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=rScVfV3nugEt1JGh6yf9WvP9x/cWWiCLPrULB9ryNPw=;
 b=U7yRDCw2xJokchzyMDmFwlPA0oPE652xnzxrFX2y2I462lbQ4LH9gu3Rd62g0iOipA
 rYrLhraHTlkIllOBL/Q0Rde1KDZYh+OOuE3udB4fWWnNcago8cIQ6bH32753f/Iyu5VE
 qSw+yuqeBA0Yn2ngI9UbW0TPulDgolrzK1OLkdAyPbkinKyGjsg8nBVQMHRCsABG1R5V
 76i558G4Ex2L4mkKnXYsu46W4wQlkCPqPjN2Q80KSFcJUQLAgTlM3cJykkVJ3RVRw9Jv
 5Nvd4i5OTDqHLcrRoqL6Tacp2bNUNQFedtqaIN60wCwsatNAwJcQAYFOo0JcCzEYWzpB
 2a9g==
X-Gm-Message-State: AEkoouvGqMkU73Pfs/4Uixb3XrNTtNqfLsSovekStU8BWhIKTxVQi0MjQdQTRWZsdhEIfA==
X-Received: by 10.157.44.139 with SMTP id p11mr21285932otb.176.1469729701715; 
 Thu, 28 Jul 2016 11:15:01 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id u8sm5088273otb.5.2016.07.28.11.15.01
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Thu, 28 Jul 2016 11:15:01 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux v4 1/4] drivers/fsi: Initial stubs for FSI device driver.
Date: Thu, 28 Jul 2016 13:14:55 -0500
Message-Id: <1469729698-37246-1-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailer: git-send-email 2.7.4 (Apple Git-66)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Jul 2016 18:15:05 -0000

From: Christopher Bostic <cbostic@us.ibm.com>

Signed-off-by: Christopher Bostic <cbostic@us.ibm.com>
---

Changes to this patch based on reviewer feedback

V2:
- Removed enums in fsiinit.h and replaced with #defines
- Added proper file copyright and license headers
- Added certificate of origin
- Removed version string
- Replace kobject with struct device in struct fsidd
- Suggestions to implement standard bus_type will be implemented in
  later patches

V3:
- Removed white space
- Suggestions to add Kconfig will be added in follow on patches

V4:
- Removed blank line at end of fsiinit.c
---
 drivers/Makefile      |  1 +
 drivers/fsi/Makefile  |  5 +++++
 drivers/fsi/fsiinit.c | 53 +++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/fsi/fsiinit.h | 41 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 100 insertions(+)
 create mode 100644 drivers/fsi/Makefile
 create mode 100644 drivers/fsi/fsiinit.c
 create mode 100644 drivers/fsi/fsiinit.h

diff --git a/drivers/Makefile b/drivers/Makefile
index 795d0ca..63019ff 100644
--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -172,3 +172,4 @@ obj-$(CONFIG_STM)		+= hwtracing/stm/
 obj-$(CONFIG_ANDROID)		+= android/
 obj-$(CONFIG_NVMEM)		+= nvmem/
 obj-$(CONFIG_FPGA)		+= fpga/
+obj-$(CONFIG_FSI)		+= fsi/
diff --git a/drivers/fsi/Makefile b/drivers/fsi/Makefile
new file mode 100644
index 0000000..f547c08
--- /dev/null
+++ b/drivers/fsi/Makefile
@@ -0,0 +1,5 @@
+#
+# Makefile for the FSI bus specific drivers.
+#
+
+obj-y		+= fsiinit.o
diff --git a/drivers/fsi/fsiinit.c b/drivers/fsi/fsiinit.c
new file mode 100644
index 0000000..a9e3381
--- /dev/null
+++ b/drivers/fsi/fsiinit.c
@@ -0,0 +1,53 @@
+/*
+ * FSI Master device driver
+ *
+ * Copyright 2016 IBM Corp.
+ *
+ * Christopher Bostic <cbostic@us.ibm.com>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version
+ * 2 of the License, or (at your option) any later version.
+ */
+
+#include <linux/init.h>
+#include <linux/module.h>
+#include "fsiinit.h"
+
+MODULE_AUTHOR("Christopher Bostic cbostic@us.ibm.com");
+MODULE_DESCRIPTION("FSI master device driver");
+
+#define FSIDD_MAJOR	0		/* FSI device driver major */
+#define	FSIDD_TOSTR(x)	#x
+#define	FSIDD_VERNO	4000
+#define	FSIDD_VER(x)	FSIDD_TOSTR(x)
+
+struct fsidd fsidd = {		/* FSI device driver structure definition */
+	.magic = FSI_DD_MAGIC,
+	.strno = FSI_DD_STRNO,
+};
+
+static int fsi_start(void)
+{
+	int rc = 0;
+
+	printk("FSI DD v:%d installation ok\n", FSIDD_VERNO);
+	return rc;
+}
+
+static void fsi_exit(void)
+{
+}
+
+static int __init fsi_init(void)
+{
+	int rc = 0;
+
+	/* Set up the host controller */
+	fsi_start();
+	return rc;
+}
+
+module_init(fsi_init);
+module_exit(fsi_exit);
diff --git a/drivers/fsi/fsiinit.h b/drivers/fsi/fsiinit.h
new file mode 100644
index 0000000..70c3e13
--- /dev/null
+++ b/drivers/fsi/fsiinit.h
@@ -0,0 +1,41 @@
+/*
+ * FSI Master device driver structure definitions and defines
+ *
+ * Copyright 2016 IBM Corp.
+ *
+ * Christopher Bostic <cbostic@us.ibm.com>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version
+ * 2 of the License, or (at your option) any later version.
+ */
+
+#ifndef DRIVERS_FSIINIT_H
+#define DRIVERS_FSIINIT_H
+
+#include <linux/kernel.h>
+#include <linux/types.h>
+#include <linux/device.h>
+#include <linux/workqueue.h>
+#include <linux/hrtimer.h>
+
+#define FSI_DD_MAGIC	0x64644632	/* ddF2 */
+#define FSI_DD_STRNO	0x1		/* Structure version number */
+
+struct fsidd {				/* FSI Main structure */
+	unsigned long magic;		/* Magic number */
+	unsigned long strno;		/* Structure version number */
+	dev_t major;			/* Major number of device */
+	struct workqueue_struct *hotp_wq;	/* Hot plug work queue */
+	wait_queue_head_t error_wq;	/* Wait queue for port errors */
+	wait_queue_head_t lbus_wq;	/* Wait queue for lbus events */
+	wait_queue_head_t irq_wq;	/* Wait queue for IRQ loops */
+	wait_queue_head_t link_wq;	/* Wait queue for link changes */
+	unsigned long state;		/* State driver is in */
+	struct device dev;		/* Anchor point in /sys/kernel */
+};
+
+#define	to_fsidd(a)		container_of(a, struct fsidd, kobj)
+
+#endif /* DRIVERS_FSIINIT_H */
-- 
1.8.2.2
