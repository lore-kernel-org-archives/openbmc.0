Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender1.zohomail.com [74.201.84.157])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id ADD4A1A03FF
 for <openbmc@lists.ozlabs.org>; Fri, 23 Oct 2015 04:59:29 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1445536765361909.2012653932738;
 Thu, 22 Oct 2015 10:59:25 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux 06/13] misc/bt-host: unify device name to bt-host
Date: Thu, 22 Oct 2015 12:59:06 -0500
Message-Id: <1445536753-14352-7-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 22 Oct 2015 17:59:30 -0000

From: Jeremy Kerr <jk@ozlabs.org>

We have 'bt' in a few places, 'bt-host' in others. Unify on bt-host.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 drivers/misc/bt-host.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/misc/bt-host.c b/drivers/misc/bt-host.c
index 6aa215e..90713c5 100644
--- a/drivers/misc/bt-host.c
+++ b/drivers/misc/bt-host.c
@@ -15,7 +15,7 @@
 #include <linux/timer.h>
 #include <linux/jiffies.h>
 
-#define DEVICE_NAME	"bt"
+#define DEVICE_NAME	"bt-host"
 #define BT_NUM_DEVS	1
 
 #define BT_IO_BASE	0xe4
@@ -220,7 +220,7 @@ static const struct file_operations bt_host_fops = {
 
 static struct miscdevice bt_host_miscdev = {
 	.minor		= MISC_DYNAMIC_MINOR,
-	.name		= "bt",
+	.name		= DEVICE_NAME,
 	.fops		= &bt_host_fops,
 };
 
@@ -319,7 +319,7 @@ static const struct of_device_id bt_host_match[] = {
 
 static struct platform_driver bt_host_driver = {
 	.driver = {
-		.name		= "bt-host",
+		.name		= DEVICE_NAME,
 		.owner		= THIS_MODULE,
 		.of_match_table = bt_host_match,
 	},
-- 
2.6.0
