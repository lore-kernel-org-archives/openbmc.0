Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FC6D1A0401
 for <openbmc@lists.ozlabs.org>; Fri, 23 Oct 2015 04:59:37 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1445536774604811.0943125495825;
 Thu, 22 Oct 2015 10:59:34 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux 12/13] misc/bt-host: remove bt_host->ctrl
Date: Thu, 22 Oct 2015 12:59:12 -0500
Message-Id: <1445536753-14352-13-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 22 Oct 2015 17:59:37 -0000

From: Jeremy Kerr <jk@ozlabs.org>

... nothing uses it.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 drivers/misc/bt-host.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/misc/bt-host.c b/drivers/misc/bt-host.c
index d90797d..29f3104 100644
--- a/drivers/misc/bt-host.c
+++ b/drivers/misc/bt-host.c
@@ -51,7 +51,6 @@ struct bt_host {
 	void			*base;
 	int			open_count;
 	wait_queue_head_t	queue;
-	unsigned int		ctrl;
 	struct timer_list	poll_timer;
 };
 
@@ -247,7 +246,6 @@ static const struct file_operations bt_host_fops = {
 static void poll_timer(unsigned long data)
 {
 	struct bt_host *bt_host = (void *)data;
-	bt_host->ctrl = bt_inb(bt_host, BT_CTRL);
 	bt_host->poll_timer.expires += msecs_to_jiffies(500);
 	wake_up(&bt_host->queue);
 	add_timer(&bt_host->poll_timer);
-- 
2.6.0
