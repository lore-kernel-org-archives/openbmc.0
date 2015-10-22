Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 003BE1A030A
 for <openbmc@lists.ozlabs.org>; Fri, 23 Oct 2015 04:59:18 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 144553675631597.75918980438905;
 Thu, 22 Oct 2015 10:59:16 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux 01/13] misc/bt-host: Fix compile warnings
Date: Thu, 22 Oct 2015 12:59:01 -0500
Message-Id: <1445536753-14352-2-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 22 Oct 2015 17:59:20 -0000

From: Jeremy Kerr <jk@ozlabs.org>

We have a bunch of unused functions.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 drivers/misc/bt-host.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/drivers/misc/bt-host.c b/drivers/misc/bt-host.c
index 1f6e1c4..395c28f 100644
--- a/drivers/misc/bt-host.c
+++ b/drivers/misc/bt-host.c
@@ -80,11 +80,6 @@ static void clr_wr_ptr(struct bt_host *bt_host)
 	bt_outb(bt_host, BT_CTRL_CLR_WR_PTR, BT_CTRL);
 }
 
-static int h2b_atn(struct bt_host *bt_host)
-{
-	return !!(bt_inb(bt_host, BT_CTRL) & BT_CTRL_H2B_ATN);
-}
-
 static void clr_h2b_atn(struct bt_host *bt_host)
 {
 	bt_outb(bt_host, BT_CTRL_H2B_ATN, BT_CTRL);
@@ -106,16 +101,6 @@ static void set_b2h_atn(struct bt_host *bt_host)
 	bt_outb(bt_host, BT_CTRL_B2H_ATN, BT_CTRL);
 }
 
-static int b2h_atn(struct bt_host *bt_host)
-{
-	return !!(bt_inb(bt_host, BT_CTRL) & BT_CTRL_B2H_ATN);
-}
-
-static int h_busy(struct bt_host *bt_host)
-{
-	return !!(bt_inb(bt_host, BT_CTRL) & BT_CTRL_H_BUSY);
-}
-
 static char bt_read(struct bt_host *bt_host)
 {
 	char result = bt_inb(bt_host, BT_BMC2HOST);
@@ -258,7 +243,7 @@ static int bt_host_probe(struct platform_device *pdev)
 {
 	struct device *dev;
 	struct resource *res;
-	int rc, devno = MKDEV(MAJOR(bt_host_devt), 0);
+	int rc;
 
 	if (!pdev || !pdev->dev.of_node)
 		return -ENODEV;
-- 
2.6.0
