Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 79A551A030A
 for <openbmc@lists.ozlabs.org>; Fri, 23 Oct 2015 04:59:21 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1445536757799979.4906677615439;
 Thu, 22 Oct 2015 10:59:17 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux 02/13] misc/bt-host: remove unused members of struct
 bt_host
Date: Thu, 22 Oct 2015 12:59:02 -0500
Message-Id: <1445536753-14352-3-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 22 Oct 2015 17:59:22 -0000

From: Jeremy Kerr <jk@ozlabs.org>

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 drivers/misc/bt-host.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/misc/bt-host.c b/drivers/misc/bt-host.c
index 395c28f..46e4341 100644
--- a/drivers/misc/bt-host.c
+++ b/drivers/misc/bt-host.c
@@ -9,7 +9,6 @@
 #include <linux/device.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
-#include <linux/cdev.h>
 #include <linux/io.h>
 #include <linux/delay.h>
 #include <linux/miscdevice.h>
@@ -50,9 +49,7 @@ dev_t bt_host_devt;
 
 struct bt_host {
 	struct device dev;
-	struct cdev cdev;
 	void *base;
-	int open_count;
 	wait_queue_head_t queue;
 	unsigned int ctrl;
 	struct timer_list poll_timer;
-- 
2.6.0
