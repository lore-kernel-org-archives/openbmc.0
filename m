Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender1.zohomail.com [74.201.84.157])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id B99121A03BE
 for <openbmc@lists.ozlabs.org>; Fri, 23 Oct 2015 04:59:35 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1445536773321744.2738226657416;
 Thu, 22 Oct 2015 10:59:33 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux 11/13] misc/bt-host: Add ioctl to assert SMS_ATN
Date: Thu, 22 Oct 2015 12:59:11 -0500
Message-Id: <1445536753-14352-12-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445536753-14352-1-git-send-email-patches@stwcx.xyz>
References: <1445536753-14352-1-git-send-email-patches@stwcx.xyz>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Oct 2015 17:59:36 -0000

From: Jeremy Kerr <jk@ozlabs.org>

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 drivers/misc/bt-host.c       | 19 +++++++++++++++++++
 include/uapi/linux/Kbuild    |  1 +
 include/uapi/linux/bt-host.h | 18 ++++++++++++++++++
 3 files changed, 38 insertions(+)
 create mode 100644 include/uapi/linux/bt-host.h

diff --git a/drivers/misc/bt-host.c b/drivers/misc/bt-host.c
index 4f37374..d90797d 100644
--- a/drivers/misc/bt-host.c
+++ b/drivers/misc/bt-host.c
@@ -14,6 +14,7 @@
 #include <linux/miscdevice.h>
 #include <linux/timer.h>
 #include <linux/jiffies.h>
+#include <linux/bt-host.h>
 
 #define DEVICE_NAME	"bt-host"
 
@@ -106,6 +107,11 @@ static void bt_write(struct bt_host *bt_host, u8 c)
 	bt_outb(bt_host, c, BT_BMC2HOST);
 }
 
+static void set_sms_atn(struct bt_host *bt_host)
+{
+	bt_outb(bt_host, BT_CTRL_SMS_ATN, BT_CTRL);
+}
+
 static struct bt_host *file_bt_host(struct file *file)
 {
 	return container_of(file->private_data, struct bt_host, miscdev);
@@ -192,6 +198,18 @@ static ssize_t bt_host_write(struct file *file, const char __user *buf,
 	return p - buf;
 }
 
+static long bt_host_ioctl(struct file *file, unsigned int cmd,
+		unsigned long param)
+{
+	struct bt_host *bt_host = file_bt_host(file);
+	switch (cmd) {
+	case BT_HOST_IOCTL_SMS_ATN:
+		set_sms_atn(bt_host);
+		return 0;
+	}
+	return -EINVAL;
+}
+
 static int bt_host_release(struct inode *inode, struct file *file)
 {
 	struct bt_host *bt_host = file_bt_host(file);
@@ -223,6 +241,7 @@ static const struct file_operations bt_host_fops = {
 	.write		= bt_host_write,
 	.release	= bt_host_release,
 	.poll		= bt_host_poll,
+	.unlocked_ioctl	= bt_host_ioctl,
 };
 
 static void poll_timer(unsigned long data)
diff --git a/include/uapi/linux/Kbuild b/include/uapi/linux/Kbuild
index 1ff9942..712ab82 100644
--- a/include/uapi/linux/Kbuild
+++ b/include/uapi/linux/Kbuild
@@ -74,6 +74,7 @@ header-y += bpf_common.h
 header-y += bpf.h
 header-y += bpqether.h
 header-y += bsg.h
+header-y += bt-host.h
 header-y += btrfs.h
 header-y += can.h
 header-y += capability.h
diff --git a/include/uapi/linux/bt-host.h b/include/uapi/linux/bt-host.h
new file mode 100644
index 0000000..a4298d9
--- /dev/null
+++ b/include/uapi/linux/bt-host.h
@@ -0,0 +1,18 @@
+/*
+ * Copyright 2015 IBM Corp.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version
+ * 2 of the License, or (at your option) any later version.
+ */
+
+#ifndef _UAPI_LINUX_BT_HOST_H
+#define _UAPI_LINUX_BT_HOST_H
+
+#include <linux/ioctl.h>
+
+#define __BT_HOST_IOCTL_MAGIC	0xb1
+#define BT_HOST_IOCTL_SMS_ATN	_IO(__BT_HOST_IOCTL_MAGIC, 0x00)
+
+#endif /* _UAPI_LINUX_BT_HOST_H */
-- 
2.6.0
