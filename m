Return-Path: <jaghu@google.com>
Received: from mail-pf0-x232.google.com (mail-pf0-x232.google.com
 [IPv6:2607:f8b0:400e:c00::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t7B0d4mhBzDvNL
 for <openbmc@lists.ozlabs.org>; Tue,  1 Nov 2016 10:49:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=lynrgVPy; 
 dkim-atps=neutral
Received: by mail-pf0-x232.google.com with SMTP id 189so30972756pfz.3
 for <openbmc@lists.ozlabs.org>; Mon, 31 Oct 2016 16:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=i0Rk+Pe7Ewz+w17gBAVrw01S0ZgOTsE68kCOnSRIwSY=;
 b=lynrgVPybKvnAZblr1HtZiZKtAa7wrWNYsMKry4HsvPWLivMfqMTmvZ46FkZS+3JMm
 XZfTk8jK/iSh0IBZwFkPf5r+HnNoZrJTvqAcwbqAOT9Swe4IJtguFkIxROj5NrvSyC7w
 yDI7vFFQgIOFKFXLSrzUFjNkb8qaY3n6KWdLqsABBPXVZkJLbcMBmDJwhmIkmy+vQAL/
 /FVO60EzsZ+qGmp+4ykYy29jR0pwhAZp8PWpmkyaWkl5k3iWMIeXSTXwahmbf/a8QOT2
 s8aMvJWShx6oSn/OiaVgTSTuz4yfoC88tapxIntAGZP7sWPUR6u0yZuyzZhJC2YO6dv+
 aBMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=i0Rk+Pe7Ewz+w17gBAVrw01S0ZgOTsE68kCOnSRIwSY=;
 b=RFTYpXhhWSp4yg43bWT4/URN57VbxGpdgOZDXOb6e8t2UaVe2nLDHl2Uh8OrvA05Sd
 oY8vdTk6hgXW29+I00HiOFXS6w0749En/qib672q6VDpa2DiJGPB80TNuzrEG32WOGhC
 95CJj0ldakAkilFJagR+03XhuC+UgkWZfIqvj35tiRjOaCiU4VRbB8lEUHVKofWB+Fc5
 arz7vzExaFZo0Cj7ApOFYxodVC7nOiyBrrB/mmKT5ZedoAYLmC/hm+2vl6TakHPlPj0x
 cYV0QjpiyLNMnnCsPFDGV9yeJe3wX9zEEcD/aKARzud6MT9h+SxI49dVT2DwH8rH2CKx
 vCtg==
X-Gm-Message-State: ABUngvc6m4GwO2dTQ8pCYqq15VSIF2VwCV/ChiWy+KeE3s/PG83pMIC/taXtuvm61dSF0V+7
X-Received: by 10.98.51.134 with SMTP id z128mr54236607pfz.163.1477957759851; 
 Mon, 31 Oct 2016 16:49:19 -0700 (PDT)
Received: from jaghu22.svl.corp.google.com ([100.123.242.38])
 by smtp.gmail.com with ESMTPSA id v84sm37824374pfd.91.2016.10.31.16.49.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 31 Oct 2016 16:49:18 -0700 (PDT)
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
To: joel@jms.id.au,
	openbmc@lists.ozlabs.org
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Subject: [PATCH linux v3 1/3] drivers: misc: Character driver for seven
 segment display
Date: Mon, 31 Oct 2016 16:49:10 -0700
Message-Id: <1477957752-4831-2-git-send-email-jaghu@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1477957752-4831-1-git-send-email-jaghu@google.com>
References: <1477957752-4831-1-git-send-email-jaghu@google.com>
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
X-List-Received-Date: Mon, 31 Oct 2016 23:49:22 -0000

The character device driver implements the user-space API for letting
a user write to the display including any conversion methods necessary
to map the user input to a 7-segment display.

Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
---
 drivers/misc/Kconfig          |   5 ++
 drivers/misc/Makefile         |   1 +
 drivers/misc/seven_seg_disp.c | 200 ++++++++++++++++++++++++++++++++++++++++++
 drivers/misc/seven_seg_disp.h |  35 ++++++++
 4 files changed, 241 insertions(+)
 create mode 100644 drivers/misc/seven_seg_disp.c
 create mode 100644 drivers/misc/seven_seg_disp.h

diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 4617ddc..cf07817 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -804,6 +804,11 @@ config PANEL_BOOT_MESSAGE
 	  An empty message will only clear the display at driver init time. Any other
 	  printf()-formatted message is valid with newline and escape codes.

+config SEVEN_SEGMENT_DISPLAY
+	tristate "Character driver for seven segment display support"
+	help
+	  Character driver for seven segment display support
+
 config ASPEED_BT_IPMI_HOST
 	tristate "BT IPMI host driver"
 	help
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index 724861b..f2072b1 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -57,4 +57,5 @@ obj-$(CONFIG_ECHO)		+= echo/
 obj-$(CONFIG_VEXPRESS_SYSCFG)	+= vexpress-syscfg.o
 obj-$(CONFIG_CXL_BASE)		+= cxl/
 obj-$(CONFIG_PANEL)             += panel.o
+obj-$(SEVEN_SEGMENT_DISPLAY)	+= seven_seg_disp.o
 obj-$(CONFIG_ASPEED_BT_IPMI_HOST)	+= bt-host.o
diff --git a/drivers/misc/seven_seg_disp.c b/drivers/misc/seven_seg_disp.c
new file mode 100644
index 0000000..3d92fc6
--- /dev/null
+++ b/drivers/misc/seven_seg_disp.c
@@ -0,0 +1,200 @@
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
+EXPORT_SYMBOL(seven_seg_rem_cdev);
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
+EXPORT_SYMBOL(seven_seg_setup_cdev);
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
