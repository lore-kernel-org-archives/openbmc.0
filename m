Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id CCBCE1A051F
 for <openbmc@lists.ozlabs.org>; Thu, 22 Oct 2015 13:31:29 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 14454810860051019.4337937944342;
 Wed, 21 Oct 2015 19:31:26 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux] drivers/misc/bt-host: Add ioctl() for SMSATN
Date: Wed, 21 Oct 2015 21:31:21 -0500
Message-Id: <1445481081-29500-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445481081-29500-1-git-send-email-patches@stwcx.xyz>
References: <1445481081-29500-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 22 Oct 2015 02:31:30 -0000

From: Cyril Bur <cyrilbur@gmail.com>

---
 drivers/misc/bt-host.c       | 17 +++++++++++++++++
 include/uapi/linux/Kbuild    |  1 +
 include/uapi/linux/bt-host.h | 16 ++++++++++++++++
 3 files changed, 34 insertions(+)
 create mode 100644 include/uapi/linux/bt-host.h

diff --git a/drivers/misc/bt-host.c b/drivers/misc/bt-host.c
index 1f6e1c4..1b68483 100644
--- a/drivers/misc/bt-host.c
+++ b/drivers/misc/bt-host.c
@@ -15,6 +15,7 @@
 #include <linux/miscdevice.h>
 #include <linux/timer.h>
 #include <linux/jiffies.h>
+#include <linux/bt-host.h>
 
 #define DEVICE_NAME	"bt"
 #define BT_NUM_DEVS	1
@@ -101,6 +102,11 @@ static void clr_b_busy(struct bt_host *bt_host)
 		bt_outb(bt_host, BT_CTRL_B_BUSY, BT_CTRL);
 }
 
+static void set_sms_atn(struct bt_host *bt_host)
+{
+	bt_outb(bt_host, BT_CTRL_SMS_ATN, BT_CTRL);
+}
+
 static void set_b2h_atn(struct bt_host *bt_host)
 {
 	bt_outb(bt_host, BT_CTRL_B2H_ATN, BT_CTRL);
@@ -231,6 +237,16 @@ static unsigned int bt_host_poll(struct file *file, poll_table *wait)
 	return mask;
 }
 
+static long bt_host_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
+{
+	switch (cmd) {
+	case BT_HOST_IOCTL_SMS_ATN:
+		set_sms_atn(bt_host);
+		return 0;
+	default:
+		return -ENOIOCTLCMD;
+	}
+}
 static const struct file_operations bt_host_fops = {
 	.owner		= THIS_MODULE,
 	.open		= bt_host_open,
@@ -238,6 +254,7 @@ static const struct file_operations bt_host_fops = {
 	.write		= bt_host_write,
 	.release	= bt_host_release,
 	.poll		= bt_host_poll,
+	.unlocked_ioctl	= bt_host_ioctl,
 };
 
 static struct miscdevice bt_host_miscdev = {
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
index 0000000..801a726
--- /dev/null
+++ b/include/uapi/linux/bt-host.h
@@ -0,0 +1,16 @@
+/*
+ * include/linux/bt-host.h
+ *
+ */
+
+#ifndef _UAPI_LINUX_BT_HOST_H
+#define _UAPI_LINUX_BT_HOST_H
+
+#include <linux/types.h>
+#include <linux/ioctl.h>
+#include <linux/irqnr.h>
+
+#define BT_HOST_IOCTL_MAGIC	0xb1
+#define BT_HOST_IOCTL_SMS_ATN	_IO( BT_HOST_IOCTL_MAGIC, 0x00 )
+
+#endif /* _UAPI_LINUX_BT_HOST_H */
-- 
2.6.0
