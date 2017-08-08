Return-Path: <brendanhiggins@google.com>
Received: from mail-pf0-x231.google.com (mail-pf0-x231.google.com
 [IPv6:2607:f8b0:400e:c00::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xRL8m6wzmzDqp8
 for <openbmc@lists.ozlabs.org>; Tue,  8 Aug 2017 13:53:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="TIDLBpnC"; 
 dkim-atps=neutral
Received: by mail-pf0-x231.google.com with SMTP id c28so9313300pfe.3
 for <openbmc@lists.ozlabs.org>; Mon, 07 Aug 2017 20:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=wPhqqWrY3PWD1kuScipuhidOeB3vbFSutIsl6yTeo1U=;
 b=TIDLBpnCGWn2B5fTQ/ofyMaSerLf78X9qNDC6Hj/+a76pTVOzAZaePUNJLIvln7xJT
 tLHjYtz8nv0EhfQLd0e+GRfUOkZ2tXV71vFRmy4HYNcOAcbYzq+JvyIAZSDijxuT/qgm
 FXOiF5/xLu4CkVQdxA0470eCfnZc3wKScjJJkRaNoCq/hx7Ukhvf3elHHAj8PkNKow95
 0QmakuarOVEu942s8wYcaJUokyQc1raif6Ru4DnKoj+jqu4RAWUsfTsYXnFhDZsqC+7q
 W6CILYSSd7NdI7krbYPaYUZJOsod1W7M1IUqcR86rpCML0GATJoteSPYQJhLD/xSPvBi
 m9ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=wPhqqWrY3PWD1kuScipuhidOeB3vbFSutIsl6yTeo1U=;
 b=P8IIfAHA40kX8ICsi9A5U3IWTSOSw+sQlEEsGMug0vXtvcxZ37EBOou/QvyIqFBovq
 rao/KsbiICCiskoUFLYMexXPZbVJY73SFRe+gJRDRGqXqYhPHw7WPEJ2U5myEFmVg0JQ
 zhN3W/wPiMUcIGfLOS37X18IOYBYfUCGL609oqV8wmp3rZSQ32T5zTRdIFx+zspIa1RZ
 D1B4FxOnfk5pvAHX+leEq0/Yquf6bTydVy5GRw5FZqpkYDgysQVGvU9bYlOhOcXizIm+
 Zhh235aiMqU+eJ+qAOTMOfSf0ulMuMkjX5zjocfDpY5CQZxG8Jl/GfaNbAAnwtoq0GiC
 d7aw==
X-Gm-Message-State: AHYfb5gTIlazH0gFNBlgIHXnfRbZNt5A9G2a4P6d2LoDa1cxrMQjGvKC
 LF7fuRfLYcb3g0HL
X-Received: by 10.99.158.10 with SMTP id s10mr2713772pgd.113.1502164390778;
 Mon, 07 Aug 2017 20:53:10 -0700 (PDT)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id f2sm375767pgc.17.2017.08.07.20.53.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 07 Aug 2017 20:53:09 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: minyard@acm.org, benjaminfair@google.com, clg@kaod.org, joel@jms.id.au,
 andrew@aj.id.au
Cc: openipmi-developer@lists.sourceforge.net, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Brendan Higgins <brendanhiggins@google.com>
Subject: [RFC v1 4/4] ipmi_bmc: bt-aspeed: port driver to IPMI BMC framework
Date: Mon,  7 Aug 2017 20:53:01 -0700
Message-Id: <20170808035301.1980-5-brendanhiggins@google.com>
X-Mailer: git-send-email 2.14.0.rc1.383.gd1ce394fe2-goog
In-Reply-To: <20170808035301.1980-1-brendanhiggins@google.com>
References: <20170808035301.1980-1-brendanhiggins@google.com>
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
X-List-Received-Date: Tue, 08 Aug 2017 03:53:13 -0000

From: Benjamin Fair <benjaminfair@google.com>

The driver was handling interaction with userspace on its own. This
patch changes it to use the functionality of the ipmi_bmc framework
instead.

Note that this removes the ability for the BMC to set SMS_ATN by making
an ioctl. If this functionality is required, it can be added back in
with a later patch.

Signed-off-by: Benjamin Fair <benjaminfair@google.com>
Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
---
 drivers/char/ipmi_bmc/ipmi_bmc_bt_aspeed.c | 258 +++++++++--------------------
 include/uapi/linux/bt-bmc.h                |  18 --
 2 files changed, 74 insertions(+), 202 deletions(-)
 delete mode 100644 include/uapi/linux/bt-bmc.h

diff --git a/drivers/char/ipmi_bmc/ipmi_bmc_bt_aspeed.c b/drivers/char/ipmi_bmc/ipmi_bmc_bt_aspeed.c
index 70d434bc1cbf..7c8082c511ee 100644
--- a/drivers/char/ipmi_bmc/ipmi_bmc_bt_aspeed.c
+++ b/drivers/char/ipmi_bmc/ipmi_bmc_bt_aspeed.c
@@ -7,25 +7,19 @@
  * 2 of the License, or (at your option) any later version.
  */
 
-#include <linux/atomic.h>
-#include <linux/bt-bmc.h>
 #include <linux/errno.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/ipmi_bmc.h>
 #include <linux/mfd/syscon.h>
-#include <linux/miscdevice.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
-#include <linux/poll.h>
 #include <linux/regmap.h>
 #include <linux/sched.h>
 #include <linux/timer.h>
 
-/*
- * This is a BMC device used to communicate to the host
- */
-#define DEVICE_NAME	"ipmi-bt-host"
+#define DEVICE_NAME "ipmi-bmc-bt-aspeed"
 
 #define BT_IO_BASE	0xe4
 #define BT_IRQ		10
@@ -61,18 +55,17 @@
 #define BT_BMC_BUFFER_SIZE 256
 
 struct bt_bmc {
+	struct ipmi_bmc_bus	bus;
 	struct device		dev;
-	struct miscdevice	miscdev;
+	struct ipmi_bmc_ctx	*bmc_ctx;
+	struct bt_msg		request;
 	struct regmap		*map;
 	int			offset;
 	int			irq;
-	wait_queue_head_t	queue;
 	struct timer_list	poll_timer;
-	struct mutex		mutex;
+	spinlock_t		lock;
 };
 
-static atomic_t open_count = ATOMIC_INIT(0);
-
 static const struct regmap_config bt_regmap_cfg = {
 	.reg_bits = 32,
 	.val_bits = 32,
@@ -158,27 +151,28 @@ static ssize_t bt_writen(struct bt_bmc *bt_bmc, u8 *buf, size_t n)
 	return n;
 }
 
+/* TODO(benjaminfair): support ioctl BT_BMC_IOCTL_SMS_ATN */
 static void set_sms_atn(struct bt_bmc *bt_bmc)
 {
 	bt_outb(bt_bmc, BT_CTRL_SMS_ATN, BT_CTRL);
 }
 
-static struct bt_bmc *file_bt_bmc(struct file *file)
+/* Called with bt_bmc->lock held */
+static bool __is_request_avail(struct bt_bmc *bt_bmc)
 {
-	return container_of(file->private_data, struct bt_bmc, miscdev);
+	return bt_inb(bt_bmc, BT_CTRL) & BT_CTRL_H2B_ATN;
 }
 
-static int bt_bmc_open(struct inode *inode, struct file *file)
+static bool is_request_avail(struct bt_bmc *bt_bmc)
 {
-	struct bt_bmc *bt_bmc = file_bt_bmc(file);
+	unsigned long flags;
+	bool result;
 
-	if (atomic_inc_return(&open_count) == 1) {
-		clr_b_busy(bt_bmc);
-		return 0;
-	}
+	spin_lock_irqsave(&bt_bmc->lock, flags);
+	result = __is_request_avail(bt_bmc);
+	spin_unlock_irqrestore(&bt_bmc->lock, flags);
 
-	atomic_dec(&open_count);
-	return -EBUSY;
+	return result;
 }
 
 /*
@@ -194,67 +188,43 @@ static int bt_bmc_open(struct inode *inode, struct file *file)
  *    Length  NetFn/LUN  Seq     Cmd     Data
  *
  */
-static ssize_t bt_bmc_read(struct file *file, char __user *buf,
-			   size_t count, loff_t *ppos)
+static void get_request(struct bt_bmc *bt_bmc)
 {
-	struct bt_bmc *bt_bmc = file_bt_bmc(file);
-	u8 len;
-	int len_byte = 1;
-	u8 kbuffer[BT_BMC_BUFFER_SIZE];
-	ssize_t ret = 0;
-	ssize_t nread;
+	u8 *request_buf = (u8 *) &bt_bmc->request;
+	unsigned long flags;
 
-	if (!access_ok(VERIFY_WRITE, buf, count))
-		return -EFAULT;
+	spin_lock_irqsave(&bt_bmc->lock, flags);
 
-	WARN_ON(*ppos);
-
-	if (wait_event_interruptible(bt_bmc->queue,
-				     bt_inb(bt_bmc, BT_CTRL) & BT_CTRL_H2B_ATN))
-		return -ERESTARTSYS;
-
-	mutex_lock(&bt_bmc->mutex);
-
-	if (unlikely(!(bt_inb(bt_bmc, BT_CTRL) & BT_CTRL_H2B_ATN))) {
-		ret = -EIO;
-		goto out_unlock;
+	if (!__is_request_avail(bt_bmc)) {
+		spin_unlock_irqrestore(&bt_bmc->lock, flags);
+		return;
 	}
 
 	set_b_busy(bt_bmc);
 	clr_h2b_atn(bt_bmc);
 	clr_rd_ptr(bt_bmc);
 
-	/*
-	 * The BT frames start with the message length, which does not
-	 * include the length byte.
-	 */
-	kbuffer[0] = bt_read(bt_bmc);
-	len = kbuffer[0];
-
-	/* We pass the length back to userspace as well */
-	if (len + 1 > count)
-		len = count - 1;
-
-	while (len) {
-		nread = min_t(ssize_t, len, sizeof(kbuffer) - len_byte);
-
-		bt_readn(bt_bmc, kbuffer + len_byte, nread);
-
-		if (copy_to_user(buf, kbuffer, nread + len_byte)) {
-			ret = -EFAULT;
-			break;
-		}
-		len -= nread;
-		buf += nread + len_byte;
-		ret += nread + len_byte;
-		len_byte = 0;
-	}
+	bt_bmc->request.len = bt_read(bt_bmc);
+	bt_readn(bt_bmc, request_buf + 1, bt_bmc->request.len);
 
 	clr_b_busy(bt_bmc);
+	ipmi_bmc_handle_request(bt_bmc->bmc_ctx, &bt_bmc->request);
+
+	spin_unlock_irqrestore(&bt_bmc->lock, flags);
+}
+
+static bool bt_bmc_is_response_open(struct ipmi_bmc_bus *bus)
+{
+	struct bt_bmc *bt_bmc = container_of(bus, struct bt_bmc, bus);
+	bool response_in_progress;
+	unsigned long flags;
+
+	spin_lock_irqsave(&bt_bmc->lock, flags);
+	response_in_progress = bt_inb(bt_bmc, BT_CTRL) & (BT_CTRL_H_BUSY |
+							  BT_CTRL_B2H_ATN);
+	spin_unlock_irqrestore(&bt_bmc->lock, flags);
 
-out_unlock:
-	mutex_unlock(&bt_bmc->mutex);
-	return ret;
+	return !response_in_progress;
 }
 
 /*
@@ -263,122 +233,38 @@ static ssize_t bt_bmc_read(struct file *file, char __user *buf,
  *    Byte 1  Byte 2     Byte 3  Byte 4  Byte 5  Byte 6:N
  *    Length  NetFn/LUN  Seq     Cmd     Code    Data
  */
-static ssize_t bt_bmc_write(struct file *file, const char __user *buf,
-			    size_t count, loff_t *ppos)
+static int bt_bmc_send_response(struct ipmi_bmc_bus *bus,
+				struct bt_msg *bt_response)
 {
-	struct bt_bmc *bt_bmc = file_bt_bmc(file);
-	u8 kbuffer[BT_BMC_BUFFER_SIZE];
-	ssize_t ret = 0;
-	ssize_t nwritten;
+	struct bt_bmc *bt_bmc = container_of(bus, struct bt_bmc, bus);
+	unsigned long flags;
 
-	/*
-	 * send a minimum response size
-	 */
-	if (count < 5)
-		return -EINVAL;
-
-	if (!access_ok(VERIFY_READ, buf, count))
-		return -EFAULT;
-
-	WARN_ON(*ppos);
-
-	/*
-	 * There's no interrupt for clearing bmc busy so we have to
-	 * poll
-	 */
-	if (wait_event_interruptible(bt_bmc->queue,
-				     !(bt_inb(bt_bmc, BT_CTRL) &
-				       (BT_CTRL_H_BUSY | BT_CTRL_B2H_ATN))))
-		return -ERESTARTSYS;
-
-	mutex_lock(&bt_bmc->mutex);
-
-	if (unlikely(bt_inb(bt_bmc, BT_CTRL) &
-		     (BT_CTRL_H_BUSY | BT_CTRL_B2H_ATN))) {
-		ret = -EIO;
-		goto out_unlock;
+	spin_lock_irqsave(&bt_bmc->lock, flags);
+	if (!bt_bmc_is_response_open(bus)) {
+		spin_unlock_irqrestore(&bt_bmc->lock, flags);
+		return -EAGAIN;
 	}
 
 	clr_wr_ptr(bt_bmc);
-
-	while (count) {
-		nwritten = min_t(ssize_t, count, sizeof(kbuffer));
-		if (copy_from_user(&kbuffer, buf, nwritten)) {
-			ret = -EFAULT;
-			break;
-		}
-
-		bt_writen(bt_bmc, kbuffer, nwritten);
-
-		count -= nwritten;
-		buf += nwritten;
-		ret += nwritten;
-	}
-
+	bt_writen(bt_bmc, (u8 *) bt_response, bt_msg_len(bt_response));
 	set_b2h_atn(bt_bmc);
 
-out_unlock:
-	mutex_unlock(&bt_bmc->mutex);
-	return ret;
-}
-
-static long bt_bmc_ioctl(struct file *file, unsigned int cmd,
-			 unsigned long param)
-{
-	struct bt_bmc *bt_bmc = file_bt_bmc(file);
-
-	switch (cmd) {
-	case BT_BMC_IOCTL_SMS_ATN:
-		set_sms_atn(bt_bmc);
-		return 0;
-	}
-	return -EINVAL;
-}
-
-static int bt_bmc_release(struct inode *inode, struct file *file)
-{
-	struct bt_bmc *bt_bmc = file_bt_bmc(file);
-
-	atomic_dec(&open_count);
-	set_b_busy(bt_bmc);
+	spin_unlock_irqrestore(&bt_bmc->lock, flags);
 	return 0;
 }
 
-static unsigned int bt_bmc_poll(struct file *file, poll_table *wait)
-{
-	struct bt_bmc *bt_bmc = file_bt_bmc(file);
-	unsigned int mask = 0;
-	u8 ctrl;
-
-	poll_wait(file, &bt_bmc->queue, wait);
-
-	ctrl = bt_inb(bt_bmc, BT_CTRL);
-
-	if (ctrl & BT_CTRL_H2B_ATN)
-		mask |= POLLIN;
-
-	if (!(ctrl & (BT_CTRL_H_BUSY | BT_CTRL_B2H_ATN)))
-		mask |= POLLOUT;
-
-	return mask;
-}
-
-static const struct file_operations bt_bmc_fops = {
-	.owner		= THIS_MODULE,
-	.open		= bt_bmc_open,
-	.read		= bt_bmc_read,
-	.write		= bt_bmc_write,
-	.release	= bt_bmc_release,
-	.poll		= bt_bmc_poll,
-	.unlocked_ioctl	= bt_bmc_ioctl,
-};
-
 static void poll_timer(unsigned long data)
 {
 	struct bt_bmc *bt_bmc = (void *)data;
 
 	bt_bmc->poll_timer.expires += msecs_to_jiffies(500);
-	wake_up(&bt_bmc->queue);
+
+	if (bt_bmc_is_response_open(&bt_bmc->bus))
+		ipmi_bmc_signal_response_open(bt_bmc->bmc_ctx);
+
+	if (is_request_avail(bt_bmc))
+		get_request(bt_bmc);
+
 	add_timer(&bt_bmc->poll_timer);
 }
 
@@ -399,7 +285,12 @@ static irqreturn_t bt_bmc_irq(int irq, void *arg)
 	/* ack pending IRQs */
 	regmap_write(bt_bmc->map, bt_bmc->offset + BT_CR2, reg);
 
-	wake_up(&bt_bmc->queue);
+	if (bt_bmc_is_response_open(&bt_bmc->bus))
+		ipmi_bmc_signal_response_open(bt_bmc->bmc_ctx);
+
+	if (is_request_avail(bt_bmc))
+		get_request(bt_bmc);
+
 	return IRQ_HANDLED;
 }
 
@@ -474,16 +365,14 @@ static int bt_bmc_probe(struct platform_device *pdev)
 			return rc;
 	}
 
-	mutex_init(&bt_bmc->mutex);
-	init_waitqueue_head(&bt_bmc->queue);
+	spin_lock_init(&bt_bmc->lock);
+	bt_bmc->bus.send_response = bt_bmc_send_response;
+	bt_bmc->bus.is_response_open = bt_bmc_is_response_open;
+	bt_bmc->bmc_ctx = ipmi_bmc_get_global_ctx();
 
-	bt_bmc->miscdev.minor	= MISC_DYNAMIC_MINOR,
-		bt_bmc->miscdev.name	= DEVICE_NAME,
-		bt_bmc->miscdev.fops	= &bt_bmc_fops,
-		bt_bmc->miscdev.parent = dev;
-	rc = misc_register(&bt_bmc->miscdev);
+	rc = ipmi_bmc_register_bus(bt_bmc->bmc_ctx, &bt_bmc->bus);
 	if (rc) {
-		dev_err(dev, "Unable to register misc device\n");
+		dev_err(dev, "Unable to register IPMI BMC bus\n");
 		return rc;
 	}
 
@@ -514,11 +403,12 @@ static int bt_bmc_probe(struct platform_device *pdev)
 static int bt_bmc_remove(struct platform_device *pdev)
 {
 	struct bt_bmc *bt_bmc = dev_get_drvdata(&pdev->dev);
+	int rc;
 
-	misc_deregister(&bt_bmc->miscdev);
+	rc = ipmi_bmc_unregister_bus(bt_bmc->bmc_ctx, &bt_bmc->bus);
 	if (!bt_bmc->irq)
 		del_timer_sync(&bt_bmc->poll_timer);
-	return 0;
+	return rc;
 }
 
 static const struct of_device_id bt_bmc_match[] = {
diff --git a/include/uapi/linux/bt-bmc.h b/include/uapi/linux/bt-bmc.h
deleted file mode 100644
index d9ec766a63d0..000000000000
--- a/include/uapi/linux/bt-bmc.h
+++ /dev/null
@@ -1,18 +0,0 @@
-/*
- * Copyright (c) 2015-2016, IBM Corporation.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License
- * as published by the Free Software Foundation; either version
- * 2 of the License, or (at your option) any later version.
- */
-
-#ifndef _UAPI_LINUX_BT_BMC_H
-#define _UAPI_LINUX_BT_BMC_H
-
-#include <linux/ioctl.h>
-
-#define __BT_BMC_IOCTL_MAGIC	0xb1
-#define BT_BMC_IOCTL_SMS_ATN	_IO(__BT_BMC_IOCTL_MAGIC, 0x00)
-
-#endif /* _UAPI_LINUX_BT_BMC_H */
-- 
2.14.0.rc1.383.gd1ce394fe2-goog
