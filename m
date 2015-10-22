Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DDBE1A03BC
 for <openbmc@lists.ozlabs.org>; Fri, 23 Oct 2015 04:59:39 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1445536775897925.1336646414102;
 Thu, 22 Oct 2015 10:59:35 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux 13/13] misc/bt-host: read bt ctrl state after poll_wait
Date: Thu, 22 Oct 2015 12:59:13 -0500
Message-Id: <1445536753-14352-14-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 22 Oct 2015 17:59:40 -0000

From: Jeremy Kerr <jk@ozlabs.org>

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 drivers/misc/bt-host.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/bt-host.c b/drivers/misc/bt-host.c
index 29f3104..bf1e4ac 100644
--- a/drivers/misc/bt-host.c
+++ b/drivers/misc/bt-host.c
@@ -219,11 +219,13 @@ static int bt_host_release(struct inode *inode, struct file *file)
 static unsigned int bt_host_poll(struct file *file, poll_table *wait)
 {
 	struct bt_host *bt_host = file_bt_host(file);
-	uint8_t ctrl = bt_inb(bt_host, BT_CTRL);
 	unsigned int mask = 0;
+	uint8_t ctrl;
 
 	poll_wait(file, &bt_host->queue, wait);
 
+	ctrl = bt_inb(bt_host, BT_CTRL);
+
 	if (ctrl & BT_CTRL_H2B_ATN)
 		mask |= POLLIN;
 
-- 
2.6.0
