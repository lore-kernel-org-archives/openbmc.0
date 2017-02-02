Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vDx2c6p2jzDqBY
 for <openbmc@lists.ozlabs.org>; Fri,  3 Feb 2017 10:26:16 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v12NIekU083886
 for <openbmc@lists.ozlabs.org>; Thu, 2 Feb 2017 18:26:14 -0500
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0b-001b2d01.pphosted.com with ESMTP id 28c8yvk8wu-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 02 Feb 2017 18:26:14 -0500
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 2 Feb 2017 16:26:13 -0700
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 2 Feb 2017 16:26:10 -0700
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id D30AB1FF0021;
 Thu,  2 Feb 2017 16:25:47 -0700 (MST)
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v12NQ96m10551652; Thu, 2 Feb 2017 16:26:09 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B533978051;
 Thu,  2 Feb 2017 16:26:09 -0700 (MST)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP id 5104078038;
 Thu,  2 Feb 2017 16:26:09 -0700 (MST)
From: eajames@linux.vnet.ibm.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, alistair@popple.id.au, benh@kernel.crashing.org,
 "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux v1 4/8] drivers: fsi: Add i2c client driver
Date: Thu,  2 Feb 2017 17:25:57 -0600
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1486077964-11346-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1486077964-11346-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17020223-0008-0000-0000-0000071CA3D4
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006545; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000201; SDB=6.00816378; UDB=6.00398660; IPR=6.00593813; 
 BA=6.00005112; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014159; XFM=3.00000011;
 UTC=2017-02-02 23:26:12
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17020223-0009-0000-0000-00003F9243AC
Message-Id: <1486077964-11346-2-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-02_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702020219
X-Mailman-Approved-At: Fri, 03 Feb 2017 11:12:45 +1100
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
X-List-Received-Date: Thu, 02 Feb 2017 23:26:17 -0000

From: "Edward A. James" <eajames@us.ibm.com>

stub for I2C driver over FSI

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/fsi/Kconfig       |   6 ++
 drivers/fsi/Makefile      |   1 +
 drivers/fsi/i2c/Makefile  |   1 +
 drivers/fsi/i2c/iic-fsi.c | 166 ++++++++++++++++++++++++++++++++++++++++++++++
 drivers/fsi/i2c/iic-fsi.h |  29 ++++++++
 drivers/fsi/i2c/iic-int.h |  80 ++++++++++++++++++++++
 6 files changed, 283 insertions(+)
 create mode 100644 drivers/fsi/i2c/Makefile
 create mode 100644 drivers/fsi/i2c/iic-fsi.c
 create mode 100644 drivers/fsi/i2c/iic-fsi.h
 create mode 100644 drivers/fsi/i2c/iic-int.h

diff --git a/drivers/fsi/Kconfig b/drivers/fsi/Kconfig
index 0fa265c..c78b9b6e 100644
--- a/drivers/fsi/Kconfig
+++ b/drivers/fsi/Kconfig
@@ -24,6 +24,12 @@ config FSI_SCOM
 	---help---
 	This option enables an FSI based SCOM device driver.
 
+config FSI_I2C
+	tristate "I2C FSI client device driver"
+	depends on FSI
+	---help---
+	This option enables an FSI based I2C device driver.
+
 endif
 
 endmenu
diff --git a/drivers/fsi/Makefile b/drivers/fsi/Makefile
index 3466f08..3a106ba 100644
--- a/drivers/fsi/Makefile
+++ b/drivers/fsi/Makefile
@@ -2,3 +2,4 @@
 obj-$(CONFIG_FSI) += fsi-core.o
 obj-$(CONFIG_FSI_MASTER_GPIO) += fsi-master-gpio.o
 obj-$(CONFIG_FSI_SCOM) += fsi-scom.o
+obj-$(CONFIG_FSI_I2C) += i2c/
diff --git a/drivers/fsi/i2c/Makefile b/drivers/fsi/i2c/Makefile
new file mode 100644
index 0000000..f9f9048
--- /dev/null
+++ b/drivers/fsi/i2c/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_FSI_I2C) += iic-fsi.o
diff --git a/drivers/fsi/i2c/iic-fsi.c b/drivers/fsi/i2c/iic-fsi.c
new file mode 100644
index 0000000..51a15a4
--- /dev/null
+++ b/drivers/fsi/i2c/iic-fsi.c
@@ -0,0 +1,166 @@
+/*
+ *   Copyright (c) International Business Machines Corp., 2006, 2010, 2012
+ *
+ *   This program is free software;  you can redistribute it and/or modify
+ *   it under the terms of the GNU General Public License as published by
+ *   the Free Software Foundation; either version 2 of the License, or
+ *   (at your option) any later version.
+ *
+ *   This program is distributed in the hope that it will be useful,
+ *   but WITHOUT ANY WARRANTY;  without even the implied warranty of
+ *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
+ *   the GNU General Public License for more details.
+ *
+ *   You should have received a copy of the GNU General Public License
+ *   along with this program;  if not, write to the Free Software
+ *   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+ */
+
+/*
+ * This file contains the architecture independent IIC FSI code.
+ */
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/fsi.h>
+#include <asm/io.h>
+#include <linux/mm.h>
+#include <linux/interrupt.h>
+#include "iic-int.h"
+#include "iic-fsi.h"
+
+#include <linux/delay.h>
+#include <linux/moduleparam.h>
+
+struct class* iic_fsi_class = 0;
+dev_t iic_devnum_start = 0;
+
+static const char iic_fsi_version[] = "3.0";
+
+int iic_fsi_probe(struct device *dev);
+int iic_fsi_remove(struct device *dev);
+
+struct iic_reg_access fsi_reg_access =
+{
+	.bus_readb = readb_wrap,
+	.bus_readh = readh_wrap,
+	.bus_readw = readw_wrap,
+	.bus_writeb = writeb_wrap,
+	.bus_writeh = writeh_wrap,
+	.bus_writew = writew_wrap,
+};
+
+static const struct fsi_device_id i2c_ids[] = {
+	{
+		.engine_type = FSI_ENGID_I2C,
+		.version = FSI_VERSION_ANY,
+	},
+	{
+		.engine_type = FSI_ENGID_I2C_BB,
+		.version = FSI_VERSION_ANY,
+	},
+	{ 0 }
+};
+
+static const struct fsi_driver i2c_drv = {
+	.id_table = i2c_ids,
+	.drv = {
+		.name = "iic_fsi_dd",
+		.bus = &fsi_bus_type,
+		.probe = iic_fsi_probe,
+		.remove = iic_fsi_remove,
+	}
+};
+
+/*
+ * Called when an FSI IIC engine is plugged in.  
+ * Causes creation of the /dev entry.
+ * Not allowed to access engine registers in this function.
+ *
+ */
+int iic_fsi_probe(struct device *dev)
+{
+	return 0;
+}
+
+/* This function is called when a link is removed or the driver is unloaded.
+ * It's job is to remove the device from the device hierarchy including 
+ * removal from sysfs (this is where device files get removed).
+ */
+int iic_fsi_remove(struct device* dev)
+{
+	return 0;
+}
+
+/*
+ * Initialize this module.  Creates a class for fsi connected iic devices and
+ * allocates device numbers for them.
+ */
+static int __init iic_fsi_init(void)
+{
+	int rc = 0;
+
+	IENTER();
+
+	rc = alloc_chrdev_region(&iic_devnum_start,
+			0, /*starting minor number*/
+			IIC_FSI_MAX_DEVS,
+			"iic-fsi");
+	if(rc)
+	{
+		 IFLDe(1, "master alloc_chrdev_region failed: rc = %d\n", rc);
+		 return rc;
+	}
+
+	iic_fsi_class = class_create(THIS_MODULE, "iic-fsi");
+	if (IS_ERR(iic_fsi_class))
+	{
+		IFLDe(1, "class_create failed: rc=%ld", 
+				PTR_ERR(iic_fsi_class));
+		goto exit_class_create;
+	}
+	/* Register this driver with the FSI infrastructure */
+	rc = fsi_driver_register(&i2c_drv);
+	if(rc)
+	{
+		IFLDe(1, "fsidrv_register failed: %d", rc);
+		goto exit_drv_register;
+	}
+
+	printk("IIC FSI support loaded, ver. %s\n", iic_fsi_version);
+
+	IEXIT(rc);
+	return rc;
+
+exit_drv_register:
+	class_destroy(iic_fsi_class);
+exit_class_create:
+	unregister_chrdev_region(iic_devnum_start, IIC_FSI_MAX_DEVS);
+	IEXIT(rc);
+	return rc;
+}
+
+static void __exit iic_fsi_exit(void)
+{
+	IENTER();
+	IDBGd(0, "fisdrv_unregister()\n");
+	fsi_driver_unregister(&i2c_drv);
+	IDBGd(0, "unregister_chrdev_region()\n");
+	unregister_chrdev_region(iic_devnum_start, IIC_FSI_MAX_DEVS);
+	if(iic_fsi_class)
+	{
+		IDBGd(0, "class_destroy\n");
+		class_destroy(iic_fsi_class);
+	}
+	printk("IIC FSI support unloaded.\n");
+	IEXIT(0);
+}
+
+module_init(iic_fsi_init);
+module_exit(iic_fsi_exit);
+
+MODULE_AUTHOR("Eddie James <eajames@us.ibm.com>");
+MODULE_DESCRIPTION("IIC FSI Driver");
+MODULE_LICENSE("GPL");
+
diff --git a/drivers/fsi/i2c/iic-fsi.h b/drivers/fsi/i2c/iic-fsi.h
new file mode 100644
index 0000000..4decb2c
--- /dev/null
+++ b/drivers/fsi/i2c/iic-fsi.h
@@ -0,0 +1,29 @@
+/*
+ *   Copyright (c) International Business Machines Corp., 2006
+ *
+ *   This program is free software;  you can redistribute it and/or modify
+ *   it under the terms of the GNU General Public License as published by
+ *   the Free Software Foundation; either version 2 of the License, or
+ *   (at your option) any later version.
+ *
+ *   This program is distributed in the hope that it will be useful,
+ *   but WITHOUT ANY WARRANTY;  without even the implied warranty of
+ *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
+ *   the GNU General Public License for more details.
+ *
+ *   You should have received a copy of the GNU General Public License
+ *   along with this program;  if not, write to the Free Software
+ *   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+ */
+
+#ifndef IIC_FSI_H
+#define IIC_FSI_H
+
+/*
+ * we don't know ahead of time how many minors will be needed as this is based 
+ * on platform type and the possibility of sparsely populated FRU's on special 
+ * systems so picking a safely large number
+ */
+#define IIC_FSI_MAX_DEVS	1024
+
+#endif
diff --git a/drivers/fsi/i2c/iic-int.h b/drivers/fsi/i2c/iic-int.h
new file mode 100644
index 0000000..545b2c3
--- /dev/null
+++ b/drivers/fsi/i2c/iic-int.h
@@ -0,0 +1,80 @@
+/*
+ *   Copyright (c) International Business Machines Corp., 2006, 2012
+ *
+ *   This program is free software;  you can redistribute it and/or modify
+ *   it under the terms of the GNU General Public License as published by
+ *   the Free Software Foundation; either version 2 of the License, or
+ *   (at your option) any later version.
+ *
+ *   This program is distributed in the hope that it will be useful,
+ *   but WITHOUT ANY WARRANTY;  without even the implied warranty of
+ *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
+ *   the GNU General Public License for more details.
+ *
+ *   You should have received a copy of the GNU General Public License
+ *   along with this program;  if not, write to the Free Software
+ *   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+ */
+
+#ifndef IIC_INT_H
+#define IIC_INT_H
+#include <linux/list.h>
+#include <linux/spinlock.h>
+#include <linux/fs.h>
+#include <linux/kobject.h>
+#include <linux/cdev.h>
+#include <linux/device.h>
+#include <linux/kdev_t.h>
+#include <linux/wait.h>
+#include <linux/i2cfsi.h>
+#include <linux/semaphore.h>
+#include <linux/fsi.h>
+#include <asm/atomic.h>
+
+#define FSI_ENGID_I2C		0x7
+#define FSI_ENGID_I2C_BB	0x17
+
+#ifdef FSI_I2C_DEBUG
+#define IDBGs(num, msg, args...) printk(msg, ## args)
+#define IDBGd(num, msg, args...) printk(msg, ## args)
+#define IDBGf(num, msg, args...) printk(msg, ## args)
+#define IDBGl(num, msg, args...) printk(msg, ## args)
+#else
+#define IDBGs(num, msg, args...)
+#define IDBGd(num, msg, args...)
+#define IDBGf(num, msg, args...)
+#define IDBGl(num, msg, args...)
+#endif
+
+#define IENTER()
+#define IEXIT(RC)
+
+/* IFLDx traces will not get compiled out */
+#define IFLDe(num, msg, args...)\
+	printk("ERR: "msg, ## args)
+#define IFLDi(num, msg, args...)\
+	printk(msg, ## args)
+
+#ifdef FSI_I2C_DEBUG
+#define IFLDs(num, msg, args...) printk(msg, ## args)
+#define IFLDd(num, msg, args...) printk(msg, ## args)
+#define IFLDf(num, msg, args...) printk(msg, ## args)
+#define IFLDl(num, msg, args...) printk(msg, ## args)
+#else
+#define IFLDs(num, msg, args...)
+#define IFLDd(num, msg, args...)
+#define IFLDf(num, msg, args...)
+#define IFLDl(num, msg, args...)
+#endif
+
+struct iic_reg_access
+{
+    int (*bus_readb)(iic_eng_t*, unsigned int, unsigned char*, iic_ffdc_t**);
+    int (*bus_readh)(iic_eng_t*, unsigned int, unsigned short*, iic_ffdc_t**);
+    int (*bus_readw)(iic_eng_t*, unsigned int, unsigned long*, iic_ffdc_t**);
+    int (*bus_writeb)(iic_eng_t*, unsigned int, unsigned char, iic_ffdc_t**);
+    int (*bus_writeh)(iic_eng_t*, unsigned int, unsigned short, iic_ffdc_t**);
+    int (*bus_writew)(iic_eng_t*, unsigned int, unsigned long, iic_ffdc_t**);
+};
+
+#endif
-- 
1.8.3.1
