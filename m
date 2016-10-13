Return-Path: <jaghu@google.com>
Received: from mail-pf0-x234.google.com (mail-pf0-x234.google.com
 [IPv6:2607:f8b0:400e:c00::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3svX4b30fKzDsxY
 for <openbmc@lists.ozlabs.org>; Thu, 13 Oct 2016 11:42:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=AoFSUq3d; 
 dkim-atps=neutral
Received: by mail-pf0-x234.google.com with SMTP id 128so26425471pfz.0
 for <openbmc@lists.ozlabs.org>; Wed, 12 Oct 2016 17:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=lE6fbjIISQqnt9xz/YUTIKkzyZN2NjdfHdRkXN5OPfQ=;
 b=AoFSUq3desRZxYEBT27ZEJq9kSbar9pvF5FMzcThmRsbdV5ONNFr5gz1aeH+PaP5+8
 jsQVDnSaYp4Lho27nGGGva9lm4kBDXnc9ZEDUTe9bdjYDVU0x0NTNJl1akCT/a8RwaOB
 Bl4Ea1exd3Trh44SVE6FuC9q1odVTXw+3Acw8IhP3oTnHs74UXgGVpSq7rEcyvu+sG2F
 0kUR6vV84Bc0xj9WigToev3n/z1p3yhBn5cEYmT8xS8yTr8/yD9N/vFD/seRm/QUCgjc
 ci+K3viXNpEtEehdX4lDOuaiX8izuzcIXPpeJIV7xOAyIctRa7V7swbmBAxqTOCQRzWg
 zGDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=lE6fbjIISQqnt9xz/YUTIKkzyZN2NjdfHdRkXN5OPfQ=;
 b=byfumz90/JxPiy+yAw17pHQxXkeKrw12A7jFmlbdQ+oecJEk51it8/lSIgek9p71cJ
 3OneBjq6bxiFaGBKfXjz9Y33FSTb/7Oxz9lRp9Qg5R40v98FQYrLSg2hoTshvwQsRRSx
 OWk+KWdeEmCjiO0+U+6AEMweV2xJ1w905LWVODfRQwi4j4S3qNEY2sfQcQmdXIRorggp
 2+XR8xGneqdktNwCVVOUOw11EKjYV2mn4Ee3F0E3BN1kpVcPQ6Qkskea3nnqy7QjgP3K
 btX/9w8A6cWt8KlddptZMtGyn6pcwNEaw5QX+cf05VnUJLR4hqNev9+T15DIn65Dim6B
 3dCw==
X-Gm-Message-State: AA6/9RmO7NiwDgcUknxky4cjHP0MswR9AIHk00IABIajQLkpiQig8aIduFm7z8BYYhF0hauJ
X-Received: by 10.98.12.208 with SMTP id 77mr5874959pfm.14.1476319341244;
 Wed, 12 Oct 2016 17:42:21 -0700 (PDT)
Received: from jaghu22.svl.corp.google.com ([100.123.242.38])
 by smtp.gmail.com with ESMTPSA id v86sm14450239pfa.91.2016.10.12.17.42.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 12 Oct 2016 17:42:20 -0700 (PDT)
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Subject: [PATCH linux v1 2/3] drivers: misc: Character driver to update BMC
 post code
Date: Wed, 12 Oct 2016 17:41:44 -0700
Message-Id: <1476319305-29981-3-git-send-email-jaghu@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1476319305-29981-1-git-send-email-jaghu@google.com>
References: <1476319305-29981-1-git-send-email-jaghu@google.com>
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
X-List-Received-Date: Thu, 13 Oct 2016 00:42:23 -0000

Character driver - On state change, the BMC will write its POST code to the
character device. The POST code is then sent to update-postcard platform
driver for display on the POST card. The BMC POST code consists of 3 digits

Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
---
 drivers/misc/Kconfig               |   8 +++
 drivers/misc/Makefile              |   1 +
 drivers/misc/update-bmc-postcode.c | 123 +++++++++++++++++++++++++++++++++++++
 3 files changed, 132 insertions(+)
 create mode 100644 drivers/misc/update-bmc-postcode.c

diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index d65b83f..69dc3b6 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -815,6 +815,14 @@ config ASPEED_BT_IPMI_HOST
 	help
 	  Support for the Aspeed BT ipmi host.

+config ASPEED_UPDATE_BMC_POSTCODE
+	tristate "Character driver for BMC POST code update"
+	depends on ASPEED_UPDATE_POSTCARD
+	help
+	 On state change, the BMC will write its POST code to the
+	 character device. The POST code is then sent to update-postcard platform
+	 driver for display on the POST card
+
 source "drivers/misc/c2port/Kconfig"
 source "drivers/misc/eeprom/Kconfig"
 source "drivers/misc/cb710/Kconfig"
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index 730c6c2..dce20cb 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -59,3 +59,4 @@ obj-$(CONFIG_CXL_BASE)		+= cxl/
 obj-$(CONFIG_PANEL)             += panel.o
 obj-$(CONFIG_ASPEED_UPDATE_POSTCARD)    += update-postcard.o
 obj-$(CONFIG_ASPEED_BT_IPMI_HOST)	+= bt-host.o
+obj-$(CONFIG_ASPEED_UPDATE_BMC_POSTCODE)	+= update-bmc-postcode.o
diff --git a/drivers/misc/update-bmc-postcode.c b/drivers/misc/update-bmc-postcode.c
new file mode 100644
index 0000000..8e368a4
--- /dev/null
+++ b/drivers/misc/update-bmc-postcode.c
@@ -0,0 +1,123 @@
+/*
+ * Character driver - On state change, the BMC will write its POST code to the
+ * character device. The POST code is then sent to update-postcard platform
+ * driver for display on the POST card. The BMC POST code consists of 3 digits.
+ */
+
+#include <linux/module.h>
+#include <linux/version.h>
+#include <linux/kernel.h>
+#include <linux/types.h>
+#include <linux/kdev_t.h>
+#include <linux/fs.h>
+#include <linux/device.h>
+#include <linux/cdev.h>
+#include <linux/uaccess.h>
+#include <linux/ctype.h>
+
+#include "update-postcard.h"
+
+#define MAX_POSTCODE_SIZE 3
+
+static dev_t bmc_state_dev;
+static struct cdev c_dev;
+static struct class *bmc_state_class;
+
+static int bmc_state_open(struct inode *i, struct file *f)
+{
+	return 0;
+}
+
+static int bmc_state_close(struct inode *i, struct file *f)
+{
+	return 0;
+}
+
+static ssize_t bmc_state_read(struct file *f, char __user *buf, size_t
+				len, loff_t *off)
+{
+	return 0;
+}
+
+/* Write post code from bmc to the correct variable */
+static ssize_t bmc_state_write(struct file *f, const char __user *buf,
+				size_t len, loff_t *off)
+{
+	char tmp[MAX_POSTCODE_SIZE];
+	int length = len - 1;
+	int i;
+
+	if (length != MAX_POSTCODE_SIZE) {
+		return -EINVAL;
+	}
+
+	if (copy_from_user(tmp, buf, length) != 0) {
+		return -EFAULT;
+	}
+
+	for (i = 0; i < MAX_POSTCODE_SIZE; i++) {
+		if (!isxdigit(tmp[i]))
+			return -EINVAL;
+	}
+
+	update_postcode(tmp);
+	return len;
+}
+
+static const struct file_operations bmc_state_fops = {
+
+	.owner = THIS_MODULE,
+	.open = bmc_state_open,
+	.release = bmc_state_close,
+	.read = bmc_state_read,
+	.write = bmc_state_write
+};
+
+static int __init update_bmc_pc_init(void)
+{
+	if (alloc_chrdev_region(&bmc_state_dev, 0, 1, "bmc_state") < 0) {
+		return -1;
+	}
+
+	bmc_state_class = class_create(THIS_MODULE, "bmc_state");
+	if (bmc_state_class == NULL) {
+		goto unregister;
+		return -1;
+	}
+
+	if (device_create(bmc_state_class, NULL, bmc_state_dev,
+		NULL, "current_state") == NULL) {
+		goto class_destroy;
+		return -1;
+	}
+
+	cdev_init(&c_dev, &bmc_state_fops);
+	if (cdev_add(&c_dev, bmc_state_dev, 1) == -1) {
+		goto device_destroy;
+		return -1;
+	}
+
+	return 0;
+
+device_destroy:
+		device_destroy(bmc_state_class, bmc_state_dev);
+class_destroy:
+		class_destroy(bmc_state_class);
+unregister:
+		unregister_chrdev_region(bmc_state_dev, 1);
+	return -1;
+}
+
+static void __exit update_bmc_pc_exit(void)
+{
+	cdev_del(&c_dev);
+	device_destroy(bmc_state_class, bmc_state_dev);
+	class_destroy(bmc_state_class);
+	unregister_chrdev_region(bmc_state_dev, 1);
+}
+
+module_init(update_bmc_pc_init);
+module_exit(update_bmc_pc_exit);
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>");
+MODULE_DESCRIPTION("Character driver - update bmc postcode");
--
2.8.0.rc3.226.g39d4020
