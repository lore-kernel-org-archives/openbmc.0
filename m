Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 559FC1A03A1
 for <openbmc@lists.ozlabs.org>; Fri, 23 Oct 2015 04:59:33 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1445536770499517.1004422981777;
 Thu, 22 Oct 2015 10:59:30 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux 09/13] misc/bt-host: Use a dynamic miscdev
Date: Thu, 22 Oct 2015 12:59:09 -0500
Message-Id: <1445536753-14352-10-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 22 Oct 2015 17:59:33 -0000

From: Jeremy Kerr <jk@ozlabs.org>

No need to use a global miscdev here.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 drivers/misc/bt-host.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/misc/bt-host.c b/drivers/misc/bt-host.c
index f96137e..6621aed 100644
--- a/drivers/misc/bt-host.c
+++ b/drivers/misc/bt-host.c
@@ -47,6 +47,7 @@
 
 struct bt_host {
 	struct device		dev;
+	struct miscdevice	miscdev;
 	void			*base;
 	int			open_count;
 	wait_queue_head_t	queue;
@@ -218,12 +219,6 @@ static const struct file_operations bt_host_fops = {
 	.poll		= bt_host_poll,
 };
 
-static struct miscdevice bt_host_miscdev = {
-	.minor		= MISC_DYNAMIC_MINOR,
-	.name		= DEVICE_NAME,
-	.fops		= &bt_host_fops,
-};
-
 static void poll_timer(unsigned long data)
 {
 	bt_host->ctrl = bt_inb(bt_host, BT_CTRL);
@@ -253,6 +248,8 @@ static int bt_host_probe(struct platform_device *pdev)
 	if (!bt_host)
 		return -ENOMEM;
 
+	dev_set_drvdata(&pdev->dev, bt_host);
+
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res) {
 		dev_err(dev, "Unable to find resources\n");
@@ -269,8 +266,11 @@ static int bt_host_probe(struct platform_device *pdev)
 
 	init_waitqueue_head(&bt_host->queue);
 
-	bt_host_miscdev.parent = dev;
-	rc = misc_register(&bt_host_miscdev);
+	bt_host->miscdev.minor	= MISC_DYNAMIC_MINOR,
+	bt_host->miscdev.name	= DEVICE_NAME,
+	bt_host->miscdev.fops	= &bt_host_fops,
+	bt_host->miscdev.parent = dev;
+	rc = misc_register(&bt_host->miscdev);
 	if (rc) {
 		dev_err(dev, "Unable to register device\n");
 		goto out_unmap;
@@ -303,8 +303,9 @@ out_free:
 
 static int bt_host_remove(struct platform_device *pdev)
 {
+	struct bt_host *bt_host = dev_get_drvdata(&pdev->dev);
 	del_timer_sync(&bt_host->poll_timer);
-	misc_deregister(&bt_host_miscdev);
+	misc_deregister(&bt_host->miscdev);
 	devm_iounmap(&pdev->dev, bt_host->base);
 	devm_kfree(&pdev->dev, bt_host);
 	bt_host = NULL;
-- 
2.6.0
