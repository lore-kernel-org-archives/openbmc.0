Return-Path: <joel.stan@gmail.com>
Received: from mail-pf0-x241.google.com (mail-pf0-x241.google.com
 [IPv6:2607:f8b0:400e:c00::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x3kW201qFzDqj8
 for <openbmc@lists.ozlabs.org>; Fri,  7 Jul 2017 16:01:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="McWHyzub"; 
 dkim-atps=neutral
Received: by mail-pf0-x241.google.com with SMTP id c24so3209538pfe.1
 for <openbmc@lists.ozlabs.org>; Thu, 06 Jul 2017 23:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=jUbOMBPNDUCgBaD9h5OoYFV4KOZXNQpWJbGCMUSHCU0=;
 b=McWHyzubrrs4wGL3Bg6ti2F8wtIgniwiurYBr93gaatSJip415e/pK+Yg0f3G0cQZg
 /3JeuZKZpcpR0ToeowHwAGe887kbi//eEq6bbEbSTRF0VBV5J1PJLvre3JnjPHy2Q4wr
 aRZisNNJRezJvxYT96N1gjh9P3fov/hd6uS3g2Emh5JriBNWLYpvbIGa10vvvy4MxFRO
 YVggVLTDWMHSQMWewnQuMvyphriTzBAThS+oXp9Vn+MPamjp4v/C7SJIxGSHw+SCrJhy
 bYQD0XNM6PsXJ7cegCXq20461KiTVlPTOxottJuP8OhH4tF7X+fFdJrw0N4vNBP9wGKj
 yzjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=jUbOMBPNDUCgBaD9h5OoYFV4KOZXNQpWJbGCMUSHCU0=;
 b=BSkQCDYJNoqrs6wfO6JgjTM/Bk3K8mQeqNQDi3IocMaehRhnorTDwsnpG2jwX7TogF
 ddEW1I0ROLt9Ec6IH2Z4XEnZnGXds1SyQ4lABG6FKkJCvS4jRdRWQLURxkJcML74MBc4
 hie8w7MtXYPXo1Yat5nRFCvsqwPfJKxHqC/j/xiosZZDC1zUSi7B4v0RswtqH7g6wATx
 EG3tkv8bdckM6QCONBoyhbRDCc3hOl/dc5CXHIQb6d75QnKWG50lXXK0xXqi9cGvjWNl
 UomdVNdQN4IymtLz7DkFONlUpFcK82PihIw/ZwfLvDbV2ZRV7Xxinkt1xdiKQ/VSImdK
 mALw==
X-Gm-Message-State: AIVw112jRGEoXLENhsU3yiqafbXRng3tuX3sZyBm9ijRdcCJ2X14hzlA
 SVcXigCpJR1xTWYBRUI=
X-Received: by 10.98.47.194 with SMTP id v185mr3113115pfv.62.1499407259502;
 Thu, 06 Jul 2017 23:00:59 -0700 (PDT)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id r84sm3924877pfa.57.2017.07.06.23.00.56
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Thu, 06 Jul 2017 23:00:58 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Fri, 07 Jul 2017 15:30:53 +0930
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Cc: Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH linux dev-4.10] fsi: occ: Fix spin_lock_irq errors
Date: Fri,  7 Jul 2017 15:30:52 +0930
Message-Id: <20170707060052.3471-1-joel@jms.id.au>
X-Mailer: git-send-email 2.13.2
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Jul 2017 06:01:02 -0000

We are seeing warnings whenever this driver is in use:

 WARNING: CPU: 0 PID: 991 at kernel/softirq.c:162 __local_bh_enable_ip+0xa0/0xe0
 CPU: 0 PID: 991 Comm: openpower-occ-c Not tainted 4.10.17-00313-g9165bdc8c418 #497
 Hardware name: ASpeed SoC
 [<80010060>] (unwind_backtrace) from [<8000d924>] (show_stack+0x20/0x24)
 [<8000d924>] (show_stack) from [<801daedc>] (dump_stack+0x20/0x28)
 [<801daedc>] (dump_stack) from [<80018d04>] (__warn+0xe0/0x108)
 [<80018d04>] (__warn) from [<80018df8>] (warn_slowpath_null+0x30/0x38)
 [<80018df8>] (warn_slowpath_null) from [<8001c350>] (__local_bh_enable_ip+0xa0/0xe0)
 [<8001c350>] (__local_bh_enable_ip) from [<803afdd0>] (unix_release_sock+0x68/0x250)
 [<803afdd0>] (unix_release_sock) from [<803affe4>] (unix_release+0x2c/0x3c)
 [<803affe4>] (unix_release) from [<803153a8>] (sock_release+0x2c/0xa0)
 [<803153a8>] (sock_release) from [<80315438>] (sock_close+0x1c/0x24)
 [<80315438>] (sock_close) from [<800e3e60>] (__fput+0x94/0x1c4)
 [<800e3e60>] (__fput) from [<800e3ff8>] (____fput+0x18/0x1c)
 [<800e3ff8>] (____fput) from [<80031d34>] (task_work_run+0x78/0xa0)
 [<80031d34>] (task_work_run) from [<8001b2b4>] (do_exit+0x274/0x8e0)
 [<8001b2b4>] (do_exit) from [<8001b9b8>] (do_group_exit+0x4c/0xb4)
 [<8001b9b8>] (do_group_exit) from [<800253a4>] (get_signal+0x290/0x5b4)
 [<800253a4>] (get_signal) from [<8000ccf0>] (do_signal+0xd4/0x3dc)
 [<8000ccf0>] (do_signal) from [<8000d1d4>] (do_work_pending+0xac/0xbc)
 [<8000d1d4>] (do_work_pending) from [<8000a58c>] (slow_work_pending+0xc/0x20)

The driver lack spin_unlock_irq calls when releasing locks. Add them.
Also add whitespace around the locking calls so they stand out.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
Eddie, the locking in this driver is a bit scary. We need to get the driver
properly reviewed as a priority, or else it will need to be removed from the
tree until it is fixed.

This patch is enough to avoid confusing users with WARN_ONs. It's not a full
review or fix for the locking.

 drivers/fsi/occ.c | 43 ++++++++++++++++++++++++++++---------------
 1 file changed, 28 insertions(+), 15 deletions(-)

diff --git a/drivers/fsi/occ.c b/drivers/fsi/occ.c
index f43ae51cd2e0..d984e519a80e 100644
--- a/drivers/fsi/occ.c
+++ b/drivers/fsi/occ.c
@@ -123,9 +123,11 @@ static void occ_enqueue_xfr(struct occ_xfr *xfr)
 	struct occ *occ = client->occ;
 
 	spin_lock_irq(&occ->list_lock);
+
 	empty = list_empty(&occ->xfrs);
 	list_add_tail(&xfr->link, &occ->xfrs);
-	spin_unlock(&occ->list_lock);
+
+	spin_unlock_irq(&occ->list_lock);
 
 	if (empty)
 		queue_work(occ_wq, &occ->work);
@@ -175,6 +177,7 @@ static ssize_t occ_read_common(struct occ_client *client, char __user *ubuf,
 		return -EINVAL;
 
 	spin_lock_irq(&client->lock);
+
 	if (!test_bit(CLIENT_XFR_PENDING, &client->flags)) {
 		/* we just finished reading all data, return 0 */
 		if (client->read_offset) {
@@ -193,15 +196,17 @@ static ssize_t occ_read_common(struct occ_client *client, char __user *ubuf,
 		}
 
 		set_bit(XFR_WAITING, &xfr->flags);
-		spin_unlock(&client->lock);
+
+		spin_unlock_irq(&client->lock);
 
 		rc = wait_event_interruptible(client->wait,
 			test_bit(XFR_COMPLETE, &xfr->flags) ||
 			test_bit(XFR_CANCELED, &xfr->flags));
 
 		spin_lock_irq(&client->lock);
+
 		if (test_bit(XFR_CANCELED, &xfr->flags)) {
-			spin_unlock(&client->lock);
+			spin_unlock_irq(&client->lock);
 			kfree(client);
 			return -EBADFD;
 		}
@@ -236,7 +241,7 @@ static ssize_t occ_read_common(struct occ_client *client, char __user *ubuf,
 	rc = bytes;
 
 done:
-	spin_unlock(&client->lock);
+	spin_unlock_irq(&client->lock);
 	return rc;
 }
 
@@ -307,7 +312,7 @@ static ssize_t occ_write_common(struct occ_client *client,
 	rc = len;
 
 done:
-	spin_unlock(&client->lock);
+	spin_unlock_irq(&client->lock);
 	return rc;
 }
 
@@ -331,36 +336,39 @@ static int occ_release_common(struct occ_client *client)
 	struct occ *occ = client->occ;
 
 	spin_lock_irq(&client->lock);
+
 	if (!test_bit(CLIENT_XFR_PENDING, &client->flags)) {
-		spin_unlock(&client->lock);
+		spin_unlock_irq(&client->lock);
 		kfree(client);
 		return 0;
 	}
 
 	spin_lock_irq(&occ->list_lock);
+
 	set_bit(XFR_CANCELED, &xfr->flags);
 	if (!test_bit(XFR_IN_PROGRESS, &xfr->flags)) {
 		/* already deleted from list if complete */
 		if (!test_bit(XFR_COMPLETE, &xfr->flags))
 			list_del(&xfr->link);
 
-		spin_unlock(&occ->list_lock);
+		spin_unlock_irq(&occ->list_lock);
 
 		if (test_bit(XFR_WAITING, &xfr->flags)) {
 			/* blocking read; let reader clean up */
 			wake_up_interruptible(&client->wait);
-			spin_unlock(&client->lock);
+			spin_unlock_irq(&client->lock);
 			return 0;
 		}
 
-		spin_unlock(&client->lock);
+		spin_unlock_irq(&client->lock);
+
 		kfree(client);
 		return 0;
 	}
 
 	/* operation is in progress; let worker clean up*/
-	spin_unlock(&occ->list_lock);
-	spin_unlock(&client->lock);
+	spin_unlock_irq(&occ->list_lock);
+	spin_unlock_irq(&client->lock);
 	return 0;
 }
 
@@ -563,15 +571,16 @@ static void occ_worker(struct work_struct *work)
 
 again:
 	spin_lock_irq(&occ->list_lock);
+
 	xfr = list_first_entry(&occ->xfrs, struct occ_xfr, link);
 	if (!xfr) {
-		spin_unlock(&occ->list_lock);
+		spin_unlock_irq(&occ->list_lock);
 		return;
 	}
 
 	set_bit(XFR_IN_PROGRESS, &xfr->flags);
 
-	spin_unlock(&occ->list_lock);
+	spin_unlock_irq(&occ->list_lock);
 	mutex_lock(&occ->occ_lock);
 
 	rc = occ_putsram(sbefifo, 0xFFFBE000, xfr->buf,
@@ -611,16 +620,20 @@ static void occ_worker(struct work_struct *work)
 
 	/* lock client to prevent race with read() */
 	spin_lock_irq(&client->lock);
+
 	set_bit(XFR_COMPLETE, &xfr->flags);
 	waiting = test_bit(XFR_WAITING, &xfr->flags);
-	spin_unlock(&client->lock);
+
+	spin_unlock_irq(&client->lock);
 
 	spin_lock_irq(&occ->list_lock);
+
 	clear_bit(XFR_IN_PROGRESS, &xfr->flags);
 	list_del(&xfr->link);
 	empty = list_empty(&occ->xfrs);
 	canceled = test_bit(XFR_CANCELED, &xfr->flags);
-	spin_unlock(&occ->list_lock);
+
+	spin_unlock_irq(&occ->list_lock);
 
 	if (waiting)
 		wake_up_interruptible(&client->wait);
-- 
2.13.2
