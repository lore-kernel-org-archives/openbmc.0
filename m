Return-Path: <jaghu@google.com>
Received: from mail-pa0-x235.google.com (mail-pa0-x235.google.com
 [IPv6:2607:f8b0:400e:c03::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3syPqT5ZsTzDvHv
 for <openbmc@lists.ozlabs.org>; Tue, 18 Oct 2016 04:11:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=IbAhHc0j; 
 dkim-atps=neutral
Received: by mail-pa0-x235.google.com with SMTP id vu5so64087600pab.0
 for <openbmc@lists.ozlabs.org>; Mon, 17 Oct 2016 10:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id;
 bh=BIng1v2Xz8yF2oWSi/ZCpFief4IdqoJ8rzHKtzNDKjM=;
 b=IbAhHc0jEqQNZmAlsBmYnJ5y8cWVfyMwsZvzcsqzE5B9HBD7E3vVAh0lXacesvAdFp
 Uwr3s0/jrIxOw+8C8dZle5gh2Nm0ArbtG3vekDYHEN5BwJ25q1cw4ykPyNf/zmWE9HOB
 6IoQ5nfJNZE9lJ8ay8ws0J+ngEVQYX9oTP6Md6ZKyLygCRuLO7gL0qETh9ma2ySmywaL
 QDovpKVDKAvtXgnI0w0Lz2VWwVDmqx29EmDjgeV/GsvYx3ilTiEWAmqLbwNZYTHlOlk1
 Sg6KYHFS0xjtb0HBl1GouBWswEud3Y+cDoWD1ZmaUa4/oVFeDsGLgZa5LFNXTzaf4M2Y
 Cd4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=BIng1v2Xz8yF2oWSi/ZCpFief4IdqoJ8rzHKtzNDKjM=;
 b=XOLtN6a4zpdHR1XHXQ5hT5nj/SpWF54SX81UTos/X25sPSvd55lkNKJoIAmFD+XPh3
 lgomKTAbCZ8n9Jzl3CkclOIA5PE4KZS8WSL8RKVaNIDhKdUeMHxuq2qoyoIa66P/UTdY
 bqbjsjZWeKSkjDNzVjHFKFmpIrZidEaRjJwwxhh92FhS1Jak2S6VnyqZaNh8vHPUSeXC
 ynMZS8c0ikKqvo3iAlEaOUIoGd334D9Kx8SnTu6haLX79KvBdZGyDaFkQETEZm2tegxZ
 na5QG2LGjBQymQIVFOEimBsMZj1y5gk+X+f3YrkVzmWtGBiP+3cqQ4CrqRSJnTLhd/yt
 +BWw==
X-Gm-Message-State: AA6/9RnoMFny4f108937pQCeCIqz4z+LWneN3nulqCTWaqFeBbLn05P6Y/Ccp733+++EFhWW
X-Received: by 10.66.122.143 with SMTP id ls15mr32527108pab.190.1476724258980; 
 Mon, 17 Oct 2016 10:10:58 -0700 (PDT)
Received: from jaghu22.svl.corp.google.com ([100.123.242.38])
 by smtp.gmail.com with ESMTPSA id w65sm49482473pfd.48.2016.10.17.10.10.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 17 Oct 2016 10:10:57 -0700 (PDT)
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, raltherr@google.com, xow@google.com,
 Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Subject: [PATCH linux v2 1/3] drivers: misc: Character driver for seven
 segment display
Date: Mon, 17 Oct 2016 10:10:46 -0700
Message-Id: <1476724248-15796-1-git-send-email-jaghu@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
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
X-List-Received-Date: Mon, 17 Oct 2016 17:11:02 -0000

The character device driver implements the user-space API for letting
a user write to the display including any conversion methods necessary
to map the user input to a 7-segment display.

Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
---
 drivers/misc/Kconfig          |   5 ++
 drivers/misc/Makefile         |   1 +
 drivers/misc/seven_seg_disp.c | 192 ++++++++++++++++++++++++++++++++++++++++++
 drivers/misc/seven_seg_gen.h  |  32 +++++++
 4 files changed, 230 insertions(+)
 create mode 100644 drivers/misc/seven_seg_disp.c
 create mode 100644 drivers/misc/seven_seg_gen.h

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
index 0000000..88df4a0
--- /dev/null
+++ b/drivers/misc/seven_seg_disp.c
@@ -0,0 +1,192 @@
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
+
+#include "seven_seg_gen.h"
+
+#define MAX_DISP_CHAR_SIZE 3
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
+	char tmp[MAX_DISP_CHAR_SIZE];
+	int length = len - 1;
+	int i;
+	u8 result;
+
+	struct seven_seg_disp_dev *disp_dev;
+
+	if (length != MAX_DISP_CHAR_SIZE) {
+		return -EINVAL;
+	}
+
+	if (copy_from_user(tmp, buf, length) != 0) {
+		return -EFAULT;
+	}
+
+	for (i = 0; i < MAX_DISP_CHAR_SIZE; i++) {
+		if (!isxdigit(tmp[i]))
+			return -EINVAL;
+	}
+
+	result = convert_to_disp_data(tmp);
+
+	disp_dev = filp->private_data;
+	disp_dev->update_seven_seg_data(&disp_dev->parent, result);
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
+void rem_cdev(struct seven_seg_disp_dev *disp_dev)
+{
+	cdev_del(&disp_dev->cdev);
+	device_destroy(seven_seg_disp_class, seven_seg_devno);
+}
+
+int setup_cdev(struct device parent,
+	struct seven_seg_disp_dev *disp_dev,
+	void (*update_disp_data)(struct device *, u16 data))
+{
+	struct device *dev;
+	int err;
+
+	dev = device_create(seven_seg_disp_class, &parent, seven_seg_devno,
+			NULL, "seven_seg_disp_val");
+	if (dev == NULL)
+		return -1;
+	disp_dev->parent = parent;
+	disp_dev->dev = dev;
+	disp_dev->update_seven_seg_data = update_disp_data;
+	cdev_init(&disp_dev->cdev, &seven_seg_disp_fops);
+	disp_dev->cdev.ops = &seven_seg_disp_fops;
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
+		goto unregister;
+		return -1;
+	}
+
+unregister:
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
diff --git a/drivers/misc/seven_seg_gen.h b/drivers/misc/seven_seg_gen.h
new file mode 100644
index 0000000..5748a18
--- /dev/null
+++ b/drivers/misc/seven_seg_gen.h
@@ -0,0 +1,32 @@
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
+#ifndef SEVEN_SEG_H
+#define SEVEN_SEG_H
+
+#include <linux/device.h>
+#include <linux/cdev.h>
+
+#define DEFAULT_REFRESH_INTERVAL 1000
+
+struct seven_seg_disp_dev {
+	struct device parent;
+	struct device *dev;
+	struct cdev cdev;
+	void (*update_seven_seg_data)(struct device *, u16 data);
+};
+
+int setup_cdev(struct device parent,
+	struct seven_seg_disp_dev *disp_dev,
+	void (*update_disp_data)(struct device *, u16 data));
+
+void rem_cdev(struct seven_seg_disp_dev *disp_dev);
+
+#endif
--
2.8.0.rc3.226.g39d4020
