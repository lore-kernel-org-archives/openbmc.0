Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 7FCB21A030A
 for <openbmc@lists.ozlabs.org>; Fri, 23 Oct 2015 04:59:22 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1445536759180508.97533262931665;
 Thu, 22 Oct 2015 10:59:19 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux 03/13] misc/bt-host: fix whitespace issues
Date: Thu, 22 Oct 2015 12:59:03 -0500
Message-Id: <1445536753-14352-4-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 22 Oct 2015 17:59:23 -0000

From: Jeremy Kerr <jk@ozlabs.org>

No functional changes.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 drivers/misc/bt-host.c | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/misc/bt-host.c b/drivers/misc/bt-host.c
index 46e4341..f9d1034 100644
--- a/drivers/misc/bt-host.c
+++ b/drivers/misc/bt-host.c
@@ -48,11 +48,12 @@
 dev_t bt_host_devt;
 
 struct bt_host {
-	struct device dev;
-	void *base;
-	wait_queue_head_t queue;
-	unsigned int ctrl;
-	struct timer_list poll_timer;
+	struct device		dev;
+	void			*base;
+	int			open_count;
+	wait_queue_head_t	queue;
+	unsigned int		ctrl;
+	struct timer_list	poll_timer;
 };
 
 static struct bt_host *bt_host;
@@ -85,7 +86,8 @@ static void clr_h2b_atn(struct bt_host *bt_host)
 static void set_b_busy(struct bt_host *bt_host)
 {
 	if (!(bt_inb(bt_host, BT_CTRL) & BT_CTRL_B_BUSY))
-		bt_outb(bt_host, BT_CTRL_B_BUSY, BT_CTRL);}
+		bt_outb(bt_host, BT_CTRL_B_BUSY, BT_CTRL);
+}
 
 static void clr_b_busy(struct bt_host *bt_host)
 {
@@ -120,7 +122,7 @@ static int bt_host_open(struct inode *inode, struct file *file)
 }
 
 static ssize_t bt_host_read(struct file *file, char __user *buf,
-			    size_t count, loff_t *ppos)
+				size_t count, loff_t *ppos)
 {
 	char __user *p = buf;
 	char len;
@@ -131,8 +133,7 @@ static ssize_t bt_host_read(struct file *file, char __user *buf,
 	WARN_ON(*ppos);
 
 	if (wait_event_interruptible(bt_host->queue,
-				     bt_inb(bt_host, BT_CTRL)
-				     & BT_CTRL_H2B_ATN))
+				bt_inb(bt_host, BT_CTRL) & BT_CTRL_H2B_ATN))
 		return -ERESTARTSYS;
 
 	set_b_busy(bt_host);
@@ -158,7 +159,7 @@ static ssize_t bt_host_read(struct file *file, char __user *buf,
 }
 
 static ssize_t bt_host_write(struct file *file, const char __user *buf,
-			     size_t count, loff_t *ppos)
+				size_t count, loff_t *ppos)
 {
 	const char __user *p = buf;
 	char c;
@@ -171,9 +172,9 @@ static ssize_t bt_host_write(struct file *file, const char __user *buf,
 	/* There's no interrupt for clearing host busy so we have to
 	 * poll */
 	if (wait_event_interruptible(bt_host->queue,
-				     !(bt_inb(bt_host, BT_CTRL) &
-				       (BT_CTRL_H_BUSY | BT_CTRL_B2H_ATN))))
-	    return -ERESTARTSYS;
+				!(bt_inb(bt_host, BT_CTRL) &
+					(BT_CTRL_H_BUSY | BT_CTRL_B2H_ATN))))
+		return -ERESTARTSYS;
 
 	clr_wr_ptr(bt_host);
 
@@ -192,9 +193,8 @@ static ssize_t bt_host_write(struct file *file, const char __user *buf,
 
 static int bt_host_release(struct inode *inode, struct file *file)
 {
-       set_b_busy(bt_host);
-
-       return 0;
+	set_b_busy(bt_host);
+	return 0;
 }
 
 static unsigned int bt_host_poll(struct file *file, poll_table *wait)
@@ -225,7 +225,7 @@ static const struct file_operations bt_host_fops = {
 static struct miscdevice bt_host_miscdev = {
 	.minor		= MISC_DYNAMIC_MINOR,
 	.name		= "bt",
-	.fops  		= &bt_host_fops,
+	.fops		= &bt_host_fops,
 };
 
 static void poll_timer(unsigned long data)
@@ -265,7 +265,7 @@ static int bt_host_probe(struct platform_device *pdev)
 	}
 
 	bt_host->base = devm_ioremap_nocache(&pdev->dev, res->start,
-					     resource_size(res));
+						resource_size(res));
 	if (!bt_host->base) {
 		rc = -ENOMEM;
 		goto out_free;
@@ -291,7 +291,7 @@ static int bt_host_probe(struct platform_device *pdev)
 		  BT_CR0_EN_CLR_SLV_WRP |
 		  BT_CR0_ENABLE_IBT,
 		  bt_host->base + BT_CR0);
-	
+
 	clr_b_busy(bt_host);
 
 	return 0;
-- 
2.6.0
