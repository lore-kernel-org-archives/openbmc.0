Return-Path: <jaghu@google.com>
Received: from mail-pf0-x22c.google.com (mail-pf0-x22c.google.com
 [IPv6:2607:f8b0:400e:c00::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t8KCq0JhnzDvPs
 for <openbmc@lists.ozlabs.org>; Thu,  3 Nov 2016 07:17:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=U56rzQUJ; 
 dkim-atps=neutral
Received: by mail-pf0-x22c.google.com with SMTP id n85so17442657pfi.1
 for <openbmc@lists.ozlabs.org>; Wed, 02 Nov 2016 13:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Q6KjdiHodl4bqu+2njHbO8cH62jgmUUFhx4A7HIpRjs=;
 b=U56rzQUJqlKtj3u5u6DMv1XRb9+ZWhYNt3zhccxqmudaU7g+5hribpyKqrZDmqBY+s
 jtoN7zlcGacox39/Mc2W0fMs63SPUf0JIAapvSWdu5+Jp3pqcdFaLRKklDtaoJwQIa/s
 1aIXef0GrTTy1a/J3t0m+tLcbEtjbqHqnF1CggkFRodFucY8E+nR6kLyxHSHbBQD0svc
 ekLvhmETubfdfSJiY91EHiXqE53qklQDDKBvewdE58yDDo2WZMIHVG+78Xzb40aQpmrq
 xSKDVIAQmHskPsiiH6gj2Rjg58Rz/ikF4EWsjeyq0P7ZvXc/za/R0tMJ7TurEAdlpUaB
 QXmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Q6KjdiHodl4bqu+2njHbO8cH62jgmUUFhx4A7HIpRjs=;
 b=am9bOaJ7JgWfOr0TwQNzMYnPPYfosEKC33XPMV0EqKoAWqhDRYFSY25PW1hFGdaKy/
 jtLB4BsH7kn1zgDFPDMcRpbmQ1jljbT9cyf7nO0I7Vzpn+is+hEcVkeUjiKh63xfN0wX
 irpHfBC3onM+NAclbmQAm5DL4YSVAga19iR0Zg1nyBv/WhnkjUXkYRk8+o3/PyHLYBaU
 R4EfO/anbHoPYcfWoDgpdibpSzwFNMBPkdi2fV4XyJ8FGNv6YbgEOI6tjcOnkApeZ/Pq
 YGTfx8WwYvXGwiuQvFKRgwu1Dkt2mWE7NPsX5NP9HFrkuhWefjiW6rGGARz/1uiujbGa
 igTQ==
X-Gm-Message-State: ABUngvcypfkKhry1yeQu8Jd909h2eTcqGSEqJV6mc2vEbskWsD0S2pIdqxr18vd7A50+iGaU
X-Received: by 10.98.95.193 with SMTP id t184mr9983552pfb.85.1478117876950;
 Wed, 02 Nov 2016 13:17:56 -0700 (PDT)
Received: from jaghu22.svl.corp.google.com ([100.123.242.38])
 by smtp.gmail.com with ESMTPSA id v66sm6774318pfa.33.2016.11.02.13.17.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 02 Nov 2016 13:17:55 -0700 (PDT)
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
To: joel@jms.id.au,
	openbmc@lists.ozlabs.org
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Subject: [PATCH linux v4 1/3] drivers: misc: Character device driver for seven
 segment display
Date: Wed,  2 Nov 2016 13:17:43 -0700
Message-Id: <1478117865-32103-2-git-send-email-jaghu@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1478117865-32103-1-git-send-email-jaghu@google.com>
References: <1478117865-32103-1-git-send-email-jaghu@google.com>
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
X-List-Received-Date: Wed, 02 Nov 2016 20:17:59 -0000

Character device driver which implements the user-space
API for letting a user write to two 7-segment displays including
any conversion methods necessary to map the user input
to two 7-segment displays.

Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
---
v2:
- Renamed driver as suggested by Rick
- Made the character driver generic so that the character device can attach
-  to any compatible display drivers as suggested by Rick

v3:
- Provide support for user to also read the current display data as suggested
-  by Rick
- Picked more descriptive names for variables as suggested by Rick
- Made the header name same as .c file name as suggested by Rick
- Made the guards match header name as suggested by Rick
- Picked a more descriptive name for setup_cdev function as suggested by Rick

v4:
- Provided changelog entry as suggested by Joel

 drivers/misc/Kconfig          |   8 ++
 drivers/misc/Makefile         |   1 +
 drivers/misc/seven_seg_disp.c | 198 ++++++++++++++++++++++++++++++++++++++++++
 drivers/misc/seven_seg_disp.h |  35 ++++++++
 4 files changed, 242 insertions(+)
 create mode 100644 drivers/misc/seven_seg_disp.c
 create mode 100644 drivers/misc/seven_seg_disp.h

diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 4617ddc..8020088 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -804,6 +804,14 @@ config PANEL_BOOT_MESSAGE
 	  An empty message will only clear the display at driver init time. Any other
 	  printf()-formatted message is valid with newline and escape codes.

+config SEVEN_SEGMENT_DISPLAY
+	tristate "Character driver for seven segment display support"
+	help
+	  Character device driver which implements the user-space
+	  API for letting a user write to two 7-segment displays including
+	  any conversion methods necessary to map the user input
+	  to two 7-segment displays.
+
 config ASPEED_BT_IPMI_HOST
 	tristate "BT IPMI host driver"
 	help
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index 724861b..718dc2b 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -57,4 +57,5 @@ obj-$(CONFIG_ECHO)		+= echo/
 obj-$(CONFIG_VEXPRESS_SYSCFG)	+= vexpress-syscfg.o
 obj-$(CONFIG_CXL_BASE)		+= cxl/
 obj-$(CONFIG_PANEL)             += panel.o
+obj-$(CONFIG_SEVEN_SEGMENT_DISPLAY)	+= seven_seg_disp.o
 obj-$(CONFIG_ASPEED_BT_IPMI_HOST)	+= bt-host.o
diff --git a/drivers/misc/seven_seg_disp.c b/drivers/misc/seven_seg_disp.c
new file mode 100644
index 0000000..f9dd67a
--- /dev/null
+++ b/drivers/misc/seven_seg_disp.c
@@ -0,0 +1,198 @@
+/*
+ * Seven segment display character driver
+ * * Copyright (c) 2016 Google, Inc
+ *
+ * * This program is free software; you can redistribute it and/or modify
+ * * it under the terms of the GNU General Public License version 2 as
+ * * published by the Free Software Foundation.
+ *
+ */
+
+#include <linux/module.h>
+#include <linux/version.h>
+#include <linux/kernel.h>
+#include <linux/types.h>
+#include <linux/kdev_t.h>
+#include <linux/fs.h>
+#include <linux/uaccess.h>
+#include <linux/ctype.h>
+#include <linux/of.h>
+#include <linux/io.h>
+#include <linux/slab.h>
+#include <linux/platform_device.h>
+
+#include "seven_seg_disp.h"
+
+#define LED_DOT 0x01
+
+/*
+ * 0   1   2   3   4   5   6   7   8   9   A   B   C   D   E   F
+ *  _       _   _       _   _   _   _   _   _       _       _   _
+ * | |   |  _|  _| |_| |_  |_    | |_| |_| |_| |_  |    _| |_  |_
+ * |_|   | |_   _|   |  _| |_|   | |_|   | | | |_| |_  |_| |_  |
+ *
+ * data[7:1] = led[a:g]
+ */
+const u8 seven_seg_bits[] = {
+	0xFC, 0x60, 0xDA, 0xF2, 0x66, 0xB6, 0xBE, 0xE0,
+	0xFE, 0xF6, 0xEE, 0x3E, 0x9C, 0x7A, 0x9E, 0x8E
+	};
+
+/*
+ * 0   1   2   3   4   5   6   7   8   9   A   B   C   D   E   F
+ *      _       _   _                              _            _
+ *     |   |_  |_| |_  _   _   _   _   _   _   _  |_    _|  _| | |
+ *     |_  |_  |   |                               _|  |_| |_| | |
+ *
+ * data[7:1] = led[a:g]
+ */
+const u8 special_seven_seg_bits[] = {
+	0x00, 0x9C, 0x1E, 0xCE, 0x8E, 0x02, 0x02, 0x02,
+	0x02, 0x02, 0x02, 0x02, 0xB6, 0x7A, 0x7A, 0xEC
+	};
+
+static dev_t seven_seg_devno;
+static struct class *seven_seg_disp_class;
+
+static int seven_seg_disp_open(struct inode *inode, struct file *filp)
+{
+	struct seven_seg_disp_dev *disp_dev;
+
+	disp_dev = container_of(inode->i_cdev,
+				 struct seven_seg_disp_dev, cdev);
+	filp->private_data = disp_dev;
+	return 0;
+}
+
+static int seven_seg_disp_close(struct inode *inode, struct file *filp)
+{
+	filp->private_data = NULL;
+	return 0;
+}
+
+static ssize_t seven_seg_disp_read(struct file *filp, char __user *buf, size_t
+				len, loff_t *off)
+{
+	struct seven_seg_disp_dev *disp_dev = filp->private_data;
+
+	if (copy_to_user(buf, disp_dev->seven_seg_disp_data_array,
+				MAX_DISP_CHAR_SIZE) != 0) {
+		return -EFAULT;
+	}
+
+	return 0;
+}
+
+static u16 convert_to_disp_data(char *buf)
+{
+	u8 low_display;
+	u8 high_display;
+	u16 led_value;
+
+	low_display = seven_seg_bits[hex_to_bin(buf[2])];
+
+	high_display = (buf[0] == '1') ?
+	special_seven_seg_bits[hex_to_bin(buf[1])] :
+	seven_seg_bits[hex_to_bin(buf[1])];
+
+	led_value = low_display | (high_display << 8);
+	if (buf[0] == '1') {
+		led_value |= LED_DOT | (LED_DOT << 8);
+	}
+
+	return led_value;
+}
+
+static ssize_t seven_seg_disp_write(struct file *filp, const char __user *buf,
+				size_t len, loff_t *off)
+{
+	int length = len - 1;
+	int i;
+
+	struct seven_seg_disp_dev *disp_dev = filp->private_data;
+
+	if (length != MAX_DISP_CHAR_SIZE) {
+		return -EINVAL;
+	}
+
+	if (copy_from_user(disp_dev->seven_seg_disp_data_array,
+				buf, length) != 0) {
+		return -EFAULT;
+	}
+
+	for (i = 0; i < MAX_DISP_CHAR_SIZE; i++) {
+		if (!isxdigit(disp_dev->seven_seg_disp_data_array[i]))
+			return -EINVAL;
+	}
+
+	disp_dev->current_seven_seg_disp_data = convert_to_disp_data(
+			disp_dev->seven_seg_disp_data_array);
+	disp_dev->update_seven_seg_data(&disp_dev->parent,
+			disp_dev->current_seven_seg_disp_data);
+
+	return len;
+}
+
+static const struct file_operations seven_seg_disp_fops = {
+
+	.owner = THIS_MODULE,
+	.open = seven_seg_disp_open,
+	.release = seven_seg_disp_close,
+	.read = seven_seg_disp_read,
+	.write = seven_seg_disp_write
+};
+
+void seven_seg_rem_cdev(struct seven_seg_disp_dev *disp_dev)
+{
+	cdev_del(&disp_dev->cdev);
+	device_destroy(seven_seg_disp_class, seven_seg_devno);
+}
+
+int seven_seg_setup_cdev(struct seven_seg_disp_dev *disp_dev,
+	void (*update_disp_data)(struct device *, u16 data))
+{
+	struct device *dev;
+	int err;
+
+	dev = device_create(seven_seg_disp_class, &disp_dev->parent,
+			seven_seg_devno,
+			NULL, "seven_seg_disp_val");
+	if (dev == NULL)
+		return -1;
+	disp_dev->dev = dev;
+	disp_dev->update_seven_seg_data = update_disp_data;
+
+	cdev_init(&disp_dev->cdev, &seven_seg_disp_fops);
+	err = cdev_add(&disp_dev->cdev, seven_seg_devno, 1);
+	if (err)
+		device_destroy(seven_seg_disp_class, seven_seg_devno);
+	return err;
+}
+
+static int __init seven_seg_disp_init(void)
+{
+	if (alloc_chrdev_region(&seven_seg_devno, 0, 1, "disp_state") < 0) {
+		return -1;
+	}
+
+	seven_seg_disp_class = class_create(THIS_MODULE, "disp_state");
+	if (seven_seg_disp_class == NULL) {
+		goto unreg_chrdev;
+	}
+
+unreg_chrdev:
+	unregister_chrdev_region(seven_seg_devno, 1);
+	return -1;
+}
+
+static void __exit seven_seg_disp_exit(void)
+{
+	class_destroy(seven_seg_disp_class);
+	unregister_chrdev_region(seven_seg_devno, 1);
+}
+
+module_init(seven_seg_disp_init);
+module_exit(seven_seg_disp_exit);
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>");
+MODULE_DESCRIPTION("Seven segment display character driver");
diff --git a/drivers/misc/seven_seg_disp.h b/drivers/misc/seven_seg_disp.h
new file mode 100644
index 0000000..13ac780
--- /dev/null
+++ b/drivers/misc/seven_seg_disp.h
@@ -0,0 +1,35 @@
+/*
+ * Seven segment display support
+ * * Copyright (c) 2016 Google, Inc
+ *
+ * * This program is free software; you can redistribute it and/or modify
+ * * it under the terms of the GNU General Public License version 2 as
+ * * published by the Free Software Foundation.
+ *
+ */
+
+#ifndef SEVEN_SEG_DISP_H
+#define SEVEN_SEG_DISP_H
+
+#include <linux/device.h>
+#include <linux/cdev.h>
+
+#define MAX_DISP_CHAR_SIZE 3
+
+#define DEFAULT_REFRESH_INTERVAL 1000
+
+struct seven_seg_disp_dev {
+	u16 current_seven_seg_disp_data;
+	char seven_seg_disp_data_array[MAX_DISP_CHAR_SIZE];
+	struct device parent;
+	struct device *dev;
+	struct cdev cdev;
+	void (*update_seven_seg_data)(struct device *, u16 data);
+};
+
+int seven_seg_setup_cdev(struct seven_seg_disp_dev *disp_dev,
+	void (*update_disp_data)(struct device *, u16 data));
+
+void seven_seg_rem_cdev(struct seven_seg_disp_dev *disp_dev);
+
+#endif
--
2.8.0.rc3.226.g39d4020
