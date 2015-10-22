Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 6CD491A03A3
 for <openbmc@lists.ozlabs.org>; Fri, 23 Oct 2015 04:59:35 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1445536771909264.02147131136485;
 Thu, 22 Oct 2015 10:59:31 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux 10/13] misc/bt-host: Avoid global bt_host
Date: Thu, 22 Oct 2015 12:59:10 -0500
Message-Id: <1445536753-14352-11-git-send-email-patches@stwcx.xyz>
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

Rather than having a global bt_host, use references from the
file & miscdev. This removes the restriction on the number of bt-host
devices.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 drivers/misc/bt-host.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/misc/bt-host.c b/drivers/misc/bt-host.c
index 6621aed..4f37374 100644
--- a/drivers/misc/bt-host.c
+++ b/drivers/misc/bt-host.c
@@ -16,7 +16,6 @@
 #include <linux/jiffies.h>
 
 #define DEVICE_NAME	"bt-host"
-#define BT_NUM_DEVS	1
 
 #define BT_IO_BASE	0xe4
 #define BT_IRQ		10
@@ -55,8 +54,6 @@ struct bt_host {
 	struct timer_list	poll_timer;
 };
 
-static struct bt_host *bt_host;
-
 static u8 bt_inb(struct bt_host *bt_host, int reg)
 {
 	return ioread8(bt_host->base + reg);
@@ -109,9 +106,14 @@ static void bt_write(struct bt_host *bt_host, u8 c)
 	bt_outb(bt_host, c, BT_BMC2HOST);
 }
 
+static struct bt_host *file_bt_host(struct file *file)
+{
+	return container_of(file->private_data, struct bt_host, miscdev);
+}
+
 static int bt_host_open(struct inode *inode, struct file *file)
 {
-	file->private_data = bt_host;
+	struct bt_host *bt_host = file_bt_host(file);
 
 	clr_b_busy(bt_host);
 
@@ -121,6 +123,7 @@ static int bt_host_open(struct inode *inode, struct file *file)
 static ssize_t bt_host_read(struct file *file, char __user *buf,
 				size_t count, loff_t *ppos)
 {
+	struct bt_host *bt_host = file_bt_host(file);
 	char __user *p = buf;
 	u8 len;
 
@@ -158,6 +161,7 @@ static ssize_t bt_host_read(struct file *file, char __user *buf,
 static ssize_t bt_host_write(struct file *file, const char __user *buf,
 				size_t count, loff_t *ppos)
 {
+	struct bt_host *bt_host = file_bt_host(file);
 	const char __user *p = buf;
 	u8 c;
 
@@ -190,12 +194,14 @@ static ssize_t bt_host_write(struct file *file, const char __user *buf,
 
 static int bt_host_release(struct inode *inode, struct file *file)
 {
+	struct bt_host *bt_host = file_bt_host(file);
 	set_b_busy(bt_host);
 	return 0;
 }
 
 static unsigned int bt_host_poll(struct file *file, poll_table *wait)
 {
+	struct bt_host *bt_host = file_bt_host(file);
 	uint8_t ctrl = bt_inb(bt_host, BT_CTRL);
 	unsigned int mask = 0;
 
@@ -221,6 +227,7 @@ static const struct file_operations bt_host_fops = {
 
 static void poll_timer(unsigned long data)
 {
+	struct bt_host *bt_host = (void *)data;
 	bt_host->ctrl = bt_inb(bt_host, BT_CTRL);
 	bt_host->poll_timer.expires += msecs_to_jiffies(500);
 	wake_up(&bt_host->queue);
@@ -229,6 +236,7 @@ static void poll_timer(unsigned long data)
 
 static int bt_host_probe(struct platform_device *pdev)
 {
+	struct bt_host *bt_host;
 	struct device *dev;
 	struct resource *res;
 	int rc;
@@ -239,11 +247,6 @@ static int bt_host_probe(struct platform_device *pdev)
 	dev = &pdev->dev;
 	dev_info(dev, "Found bt host device\n");
 
-	if (bt_host) {
-		dev_err(dev, "Multiple bt hosts not supported\n");
-		return -ENOMEM;
-	}
-
 	bt_host = devm_kzalloc(dev, sizeof(*bt_host), GFP_KERNEL);
 	if (!bt_host)
 		return -ENOMEM;
@@ -278,6 +281,7 @@ static int bt_host_probe(struct platform_device *pdev)
 
 	init_timer(&bt_host->poll_timer);
 	bt_host->poll_timer.function = poll_timer;
+	bt_host->poll_timer.data = (unsigned long)bt_host;
 	bt_host->poll_timer.expires = jiffies + msecs_to_jiffies(10);
 	add_timer(&bt_host->poll_timer);
 
-- 
2.6.0
