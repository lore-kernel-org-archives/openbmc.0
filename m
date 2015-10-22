Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender1.zohomail.com [74.201.84.157])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id C5AC61A040E
 for <openbmc@lists.ozlabs.org>; Fri, 23 Oct 2015 04:59:26 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1445536763141311.25992336778154;
 Thu, 22 Oct 2015 10:59:23 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux 05/13] misc/bt-host: remove chrdev_region,
 use module_platform_driver
Date: Thu, 22 Oct 2015 12:59:05 -0500
Message-Id: <1445536753-14352-6-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 22 Oct 2015 17:59:27 -0000

From: Jeremy Kerr <jk@ozlabs.org>

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 drivers/misc/bt-host.c | 32 +-------------------------------
 1 file changed, 1 insertion(+), 31 deletions(-)

diff --git a/drivers/misc/bt-host.c b/drivers/misc/bt-host.c
index a75734d..6aa215e 100644
--- a/drivers/misc/bt-host.c
+++ b/drivers/misc/bt-host.c
@@ -45,8 +45,6 @@
 #define   BT_INTMASK_B2H_IRQ		0x02
 #define   BT_INTMASK_BMC_HWRST		0x80
 
-dev_t bt_host_devt;
-
 struct bt_host {
 	struct device		dev;
 	void			*base;
@@ -329,35 +327,7 @@ static struct platform_driver bt_host_driver = {
 	.remove = bt_host_remove,
 };
 
-static int __init bt_host_init(void)
-{
-	int rc;
-
-	rc = alloc_chrdev_region(&bt_host_devt, 0, BT_NUM_DEVS, "bt");
-	if (rc) {
-		pr_err("bt-host: Could not allocate chardev region\n");
-		return rc;
-	}
-
-	rc = platform_driver_register(&bt_host_driver);
-	if (rc) {
-		pr_err("bt-host: Could not register platform device\n");
-		goto out_chardev;
-	}
-
-	return 0;
-
-out_chardev:
-	unregister_chrdev_region(bt_host_devt, BT_NUM_DEVS);
-	return rc;
-}
-module_init(bt_host_init);
-
-static void __exit bt_host_exit(void)
-{
-	platform_driver_unregister(&bt_host_driver);
-}
-module_exit(bt_host_exit);
+module_platform_driver(bt_host_driver);
 
 MODULE_DEVICE_TABLE(of, bt_host_match);
 MODULE_LICENSE("GPL");
-- 
2.6.0
