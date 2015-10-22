Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id B5E5D1A0406
 for <openbmc@lists.ozlabs.org>; Fri, 23 Oct 2015 04:59:25 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1445536761069153.46908083739436;
 Thu, 22 Oct 2015 10:59:21 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux 04/13] misc/bt-host: use explicit u8 type for bt
 registers
Date: Thu, 22 Oct 2015 12:59:04 -0500
Message-Id: <1445536753-14352-5-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 22 Oct 2015 17:59:26 -0000

From: Jeremy Kerr <jk@ozlabs.org>

.. to avoid any issues with signed vs unsigned types.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 drivers/misc/bt-host.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/misc/bt-host.c b/drivers/misc/bt-host.c
index f9d1034..a75734d 100644
--- a/drivers/misc/bt-host.c
+++ b/drivers/misc/bt-host.c
@@ -58,12 +58,12 @@ struct bt_host {
 
 static struct bt_host *bt_host;
 
-static char bt_inb(struct bt_host *bt_host, int reg)
+static u8 bt_inb(struct bt_host *bt_host, int reg)
 {
 	return ioread8(bt_host->base + reg);
 }
 
-static void bt_outb(struct bt_host *bt_host, char data, int reg)
+static void bt_outb(struct bt_host *bt_host, u8 data, int reg)
 {
 	iowrite8(data, bt_host->base + reg);
 }
@@ -100,14 +100,12 @@ static void set_b2h_atn(struct bt_host *bt_host)
 	bt_outb(bt_host, BT_CTRL_B2H_ATN, BT_CTRL);
 }
 
-static char bt_read(struct bt_host *bt_host)
+static u8 bt_read(struct bt_host *bt_host)
 {
-	char result = bt_inb(bt_host, BT_BMC2HOST);
-
-	return result;
+	return bt_inb(bt_host, BT_BMC2HOST);
 }
 
-static void bt_write(struct bt_host *bt_host, char c)
+static void bt_write(struct bt_host *bt_host, u8 c)
 {
 	bt_outb(bt_host, c, BT_BMC2HOST);
 }
@@ -125,7 +123,7 @@ static ssize_t bt_host_read(struct file *file, char __user *buf,
 				size_t count, loff_t *ppos)
 {
 	char __user *p = buf;
-	char len;
+	u8 len;
 
 	if (!access_ok(VERIFY_WRITE, buf, count))
 		return -EFAULT;
@@ -162,7 +160,7 @@ static ssize_t bt_host_write(struct file *file, const char __user *buf,
 				size_t count, loff_t *ppos)
 {
 	const char __user *p = buf;
-	char c;
+	u8 c;
 
 	if (!access_ok(VERIFY_READ, buf, count))
 		return -EFAULT;
-- 
2.6.0
