Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-qk0-x243.google.com (mail-qk0-x243.google.com
 [IPv6:2607:f8b0:400d:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sKJ0t0VmhzDrcX
 for <openbmc@lists.ozlabs.org>; Thu, 25 Aug 2016 05:54:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=OX+1IvF0; 
 dkim-atps=neutral
Received: by mail-qk0-x243.google.com with SMTP id r128so2017427qkc.1
 for <openbmc@lists.ozlabs.org>; Wed, 24 Aug 2016 12:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=4dojCjppsrLG0yP6wBIOJd2oV9hfB7UUYZx883n0Vwk=;
 b=OX+1IvF0UALsrrLdMiiRD2KisJ9jAuXvZpbK3BaMYsszb2n9/sYEuJQClOPA2GqhD/
 varpIbo6QNejGnYjhoVDIz2NXZ57dffDImnQ64dp9pt7+0OV1jHVU76ivPpyXdWAuJJ3
 7VL3Igr0UMbSl2BaK+zRenGIdWlHI3ikZeV4jvyk7nxoFgDweoycNkFE4c94wcmInk0j
 8wpCfUoW8G96I99nt5rYW/WSDjtOGHBoYHJjfEnHjXWcCOYQ0L6W9eptWnZOe15e+cNB
 4rxKktIZxLSHnRG8hBJAYfRzxxiGSGXA8/kzbaU8bLtQcv2iTjfTI0l0dQhWi/HW2OWN
 aGxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=4dojCjppsrLG0yP6wBIOJd2oV9hfB7UUYZx883n0Vwk=;
 b=kwbVanvEa76xUTi0VDsafYK/YGZNNsrGjRm7S/2mJd4komR94tri/DtSl9dnp0Pkf6
 Ffx5s7Jz+Kgte5bz8zpknDIjYYl7ouHoD1ldSZHZ6nr3BzZ8qYoL3esYPMRfdgfO6Wd4
 4dLJQeCEks4cZ9Kr6vlbaEy8oFwcOdKHwdFjua6T57x+GWJb1sunlbM0YV0TFAqbMp5X
 LM9lL7fMsScffTgXE9Fad6cXCwERVw2RdIuNPzF6WBLtV/4Zohc8wbIRJpF+mNDwTQM4
 r+0MrOrGbLPnGRTpXDB/TlDwuXwZLagtzEiaTfaFdsogIu9cRSbodfaTLRSv+rPrewJG
 0Hmg==
X-Gm-Message-State: AE9vXwMActqjoN0elJy4gvPm8juZdmcNB3ne9rB6pVp/NqKxfs04hAJKlA6iSJIkYrzKqQ==
X-Received: by 10.55.17.132 with SMTP id 4mr5632449qkr.67.1472068459647;
 Wed, 24 Aug 2016 12:54:19 -0700 (PDT)
Received: from christophersmbp.austin.ibm.com ([32.97.110.51])
 by smtp.gmail.com with ESMTPSA id n6sm3544238qkf.36.2016.08.24.12.54.18
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Wed, 24 Aug 2016 12:54:19 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux v5 1/7] drivers/fsi: Initial stubs for FSI device driver.
Date: Wed, 24 Aug 2016 14:54:06 -0500
Message-Id: <1472068452-32048-2-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailer: git-send-email 2.7.4 (Apple Git-66)
In-Reply-To: <1472068452-32048-1-git-send-email-christopher.lee.bostic@gmail.com>
References: <1472068452-32048-1-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Wed, 24 Aug 2016 19:54:22 -0000

From: Christopher Bostic <cbostic@us.ibm.com>

Initial stubs for the Flexible Support Interface (FSI) device driver.
Provides support for FSI serial communications across generic I/O
or dedicated master hardware.

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

V5:
- Move fsiinit.h container_of macros from patch2 in series to patch1
- Replace printk with dev_dbg
- Add Kconfig for FSI function
- Remove structure number field from struct fsicfam
- Rename fsidefines.h to fsi_private.h
- Move all internal only accessible structs and data to fsi_private.h
- Move all globally accessible interfaces and structs to fsi.h
- Remove struct fsidd from fsi_private.h
- Remove EXPORT_SYMBOL(prim) from fsiinit.c
- Add further comments on what fsimaster_build_init() does in fsiinit.c
- Rename goto tag 'out1' to 'err' in fsi_start()
- Remove gotos where its simply to return immediately
- Remove all volatile spcifiers on register data types
- Remove explicit read/write memory barriers in I/O access code
- Rename local_* register accessors to virt_master* to clarify purpose
- Condense/resuse virtual_master* register accessor functions
- Rename FSI_IS_SU/CU_REG to CLEAR/SET_MASK for readability
- Rename fsimaster read_f/writef methods to read_reg/write_reg
- Change u8 to bool where true/false is intended
- Change variable names from p-> to master-> to improve readability
- Initialize all pointers to NULL;
- Rename struct fsimaster registers pointer to base
- fsimaster_reset(): reuse existing variables to cut down on total number
- Replace u32[2] data types with u64 where appropriate
- Remove unnecessary error checking in fsimaster_reset()
- Remove unnecessary return codes and error checking for low level register access
- Remove bitfield types
- Remove redundant fsi_nextbit() utility and repace with __clz()
- Rename FSI_PLUG_CHECK to indicate it is a time quantity.
- Clarify the hot plug state check in plugmgr()
- Change unsigned char/short/long to u8/u16/u32 where appropriate
- Remove fsi_calloc wrapper
- Remove use of kzalloc
---
 drivers/Kconfig       |  2 ++
 drivers/Makefile      |  1 +
 drivers/fsi/Kconfig   |  7 +++++++
 drivers/fsi/Makefile  |  5 +++++
 drivers/fsi/fsiinit.c | 53 +++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/fsi/fsiinit.h | 41 +++++++++++++++++++++++++++++++++++++++
 6 files changed, 109 insertions(+)
 create mode 100644 drivers/fsi/Kconfig
 create mode 100644 drivers/fsi/Makefile
 create mode 100644 drivers/fsi/fsiinit.c
 create mode 100644 drivers/fsi/fsiinit.h

diff --git a/drivers/Kconfig b/drivers/Kconfig
index d2ac339..6dd9f61 100644
--- a/drivers/Kconfig
+++ b/drivers/Kconfig
@@ -198,4 +198,6 @@ source "drivers/hwtracing/intel_th/Kconfig"
 
 source "drivers/fpga/Kconfig"
 
+source "drivers/fsi/Kconfig"
+
 endmenu
diff --git a/drivers/Makefile b/drivers/Makefile
index 795d0ca..63019ff 100644
--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -172,3 +172,4 @@ obj-$(CONFIG_STM)		+= hwtracing/stm/
 obj-$(CONFIG_ANDROID)		+= android/
 obj-$(CONFIG_NVMEM)		+= nvmem/
 obj-$(CONFIG_FPGA)		+= fpga/
+obj-$(CONFIG_FSI)		+= fsi/
diff --git a/drivers/fsi/Kconfig b/drivers/fsi/Kconfig
new file mode 100644
index 0000000..36f29c9
--- /dev/null
+++ b/drivers/fsi/Kconfig
@@ -0,0 +1,7 @@
+menu "FSI Support"
+
+config FSI
+	tristate "FSI bus support"
+	help
+	   Enables FSI bus support.
+endmenu
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
index 0000000..767c0c3
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
+	dev_dbg(&fsidd.dev, "FSI DD v:%d installation ok\n", FSIDD_VERNO);
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
index 0000000..93662533
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
+#define	to_fsidd_prim(a)	container_of(a, struct fsidd, pri_master)
+
+#endif /* DRIVERS_FSIINIT_H */
-- 
1.8.2.2
