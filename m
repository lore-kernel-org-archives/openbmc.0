Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com
 [IPv6:2607:f8b0:4003:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rgMlg5CzPzDr2t
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jul 2016 00:45:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=GAIKJwbu; 
 dkim-atps=neutral
Received: by mail-oi0-x243.google.com with SMTP id d132so7800545oig.2
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 07:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=k3NI33p9mFmzcONLO/0kf/UgHCrA16czgiHv7ycG/tY=;
 b=GAIKJwbuLEpDsyAPh4u/WmQzSDLd8kFeBSaIkb4dClklUq9Zf8DIdtgYEU3CgvJ6sB
 glcA1u/YCXTRciVbobOrQ+O0bqbM8kYa7SoqmvJGEjaHu6uW0TBWgQkSgrsRzjtgppMy
 /1dA9uo8KVpz3Gi5L2IwQkcAz4zNWn1F2Mnxa191eulPR4JZi1Vi+tQWCRAPxTImKE6Y
 TPfNfhC7Zo0uVWsJ23cs8k5EY4ORazlled/tuoNcrNHga5ORdpVEVmsIzAGEVcgOW+3c
 pLFwd44ZR/Mi8Zwl93XWnDyiX6zH7zcje9KUrVZJu/n/PjV6xxvsgRY2yLZ6fDgXCPBn
 78NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=k3NI33p9mFmzcONLO/0kf/UgHCrA16czgiHv7ycG/tY=;
 b=NORs1PRp8udhj3w3fTShRRWsqSsE2Bqcp2egvUIe02qvKduCIqSU1aB+XvwpDbO51k
 B7F4NkpGaTz1tHbcvZZ6VyFRqP7XBWmtW6pwvRFixsobU0FFU5EuLrKAjGF3wrppgwtm
 Easv8twhdo8OJ9JcU2MHP6Gh37OJr0lvxsyd2sYs42pOG1Wh7cUmMEVgtLqZN+CJ+B9l
 MPGiYQu2RUrCS+p/9rRy98guzM/q+d9O+zDWVppVY4e0O/+5MNRfF2reydyYqULAReqE
 M8dW5NcPWstBJgaicOkGa86tvexVh31M14VZ14bjNTVp5ARFedSyM+2c1WRJyd8vKymp
 yntg==
X-Gm-Message-State: ALyK8tJEZFh45MTybVApBG0kdYoQMSYkIsTzkdboSPIiuRo2ySUYsoBFo2ydcV6KHu5nq5ElfmjKVhuAZXu8Vw==
X-Received: by 10.157.41.169 with SMTP id n38mr10625450otb.158.1467297917165; 
 Thu, 30 Jun 2016 07:45:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.214.140 with HTTP; Thu, 30 Jun 2016 07:45:16 -0700 (PDT)
From: Christopher Bostic <christopher.lee.bostic@gmail.com>
Date: Thu, 30 Jun 2016 09:45:16 -0500
Message-ID: <CAA0LjjVo9krV7-7iuh4EBuuX-fN4+exjCocD4ZUqVJRmO6t7iA@mail.gmail.com>
Subject: [PATCH linux] drivers/fsi: Initial stubs for FSI device driver
To: openbmc@lists.ozlabs.org
Content-Type: text/plain; charset=UTF-8
X-Mailman-Approved-At: Fri, 01 Jul 2016 07:30:52 +1000
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
X-List-Received-Date: Thu, 30 Jun 2016 14:45:20 -0000

 Initial stubs for FSI device driver.

Signed-off-by: Christopher Bostic <cbostic@us.ibm.com>
---
 drivers/Makefile      |  1 +
 drivers/fsi/Makefile  |  5 +++++
 drivers/fsi/fsiinit.c | 57 +++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/fsi/fsiinit.h | 41 ++++++++++++++++++++++++++++++++++++
 4 files changed, 104 insertions(+)
 create mode 100644 drivers/fsi/Makefile
 create mode 100644 drivers/fsi/fsiinit.c
 create mode 100644 drivers/fsi/fsiinit.h

diff --git a/drivers/Makefile b/drivers/Makefile
index 795d0ca..8ea7c58 100644
--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -172,3 +172,4 @@ obj-$(CONFIG_STM)           += hwtracing/stm/
 obj-$(CONFIG_ANDROID)          += android/
 obj-$(CONFIG_NVMEM)            += nvmem/
 obj-$(CONFIG_FPGA)             += fpga/
+obj-$(CONFIG_FSI)                          += fsi/
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
+obj-y          += fsiinit.o
diff --git a/drivers/fsi/fsiinit.c b/drivers/fsi/fsiinit.c
new file mode 100644
index 0000000..d692ea3
--- /dev/null
+++ b/drivers/fsi/fsiinit.c
@@ -0,0 +1,57 @@
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
+#define FSIDD_MAJOR    0               /* FSI device driver major */
+#define        FSIDD_TOSTR(x)  #x
+#define        FSIDD_VERNO     4000
+#define        FSIDD_VER(x)    FSIDD_TOSTR(x)
+
+struct fsidd fsidd = {         /* FSI device driver structure definition */
+       .magic = FSI_DD_MAGIC,
+       .strno = FSI_DD_STRNO,
+};
+
+
+static int fsi_start(void)
+{
+       int rc = 0;
+
+
+       printk("FSI DD v:%d installation ok\n", FSIDD_VERNO);
+       return rc;
+}
+
+static void fsi_exit(void)
+{
+
+}
+
+static int __init fsi_init(void)
+{
+       int rc = 0;
+
+       /* Set up the host controller */
+       fsi_start();
+       return rc;
+}
+
+module_init(fsi_init);
+module_exit(fsi_exit);
+
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
+#define FSI_DD_MAGIC   0x64644632      /* ddF2 */
+#define FSI_DD_STRNO   0x1             /* Structure version number */
+
+struct fsidd {                         /* FSI Main structure */
+       unsigned long magic;            /* Magic number */
+       unsigned long strno;            /* Structure version number */
+       dev_t major;                    /* Major number of device */
+       struct workqueue_struct *hotp_wq;       /* Hot plug work queue */
+       wait_queue_head_t error_wq;     /* Wait queue for port errors */
+       wait_queue_head_t lbus_wq;      /* Wait queue for lbus events */
+       wait_queue_head_t irq_wq;       /* Wait queue for IRQ loops */
+       wait_queue_head_t link_wq;      /* Wait queue for link changes */
+       unsigned long state;            /* State driver is in */
+       struct device dev;              /* Anchor point in /sys/kernel */
+};
+
+#define        to_fsidd(a)             container_of(a, struct fsidd, kobj)
+
+#endif /* DRIVERS_FSIINIT_H */
-- 
1.8.2.2
