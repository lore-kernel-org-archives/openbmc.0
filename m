Return-Path: <brendanhiggins@google.com>
Received: from mail-pg0-x229.google.com (mail-pg0-x229.google.com
 [IPv6:2607:f8b0:400e:c05::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xRL8l4VS2zDqp8
 for <openbmc@lists.ozlabs.org>; Tue,  8 Aug 2017 13:53:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="qJiGozh2"; 
 dkim-atps=neutral
Received: by mail-pg0-x229.google.com with SMTP id u185so9543279pgb.1
 for <openbmc@lists.ozlabs.org>; Mon, 07 Aug 2017 20:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=xBfs8amTSQPovmkQy9Gwwp9+tPhXekLb+uzPb+aUQk0=;
 b=qJiGozh26oXqOPvWr9L6CtXVW/rYyXykAktDV1l7dNDSk3ZZfnepOI4RwLJfxi+BJk
 vCWVR7WCRzLidCrP48k9ns7XRX6Ci3bTqZyfCSCPo0si2WJsPUwSiVt3JWKgotzuNakd
 ACruEAIn2ol7+gFoGyRFldHPyL3JedLbw41vUWojPCkivFIGEw1XijGbFG4GTN6CxVi9
 wjtADTJtHzDSAJ6RMeKcC8VENXUIn0sEfRLaG84FcSlZaxMkoP7W4XAJ6Hj88Zu39W7J
 c/O2oGD5xaANZgeLiNZo6ZQBOSK7oDBTMeV8e8uwPdmm1f+90c9XFmTGhSmO3U1luizU
 LQ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=xBfs8amTSQPovmkQy9Gwwp9+tPhXekLb+uzPb+aUQk0=;
 b=j81SAtmCiqqtqI0zI75MNZetWRSIs2H7gNYlugHbk1InpKteT1UgHllP5CM7h30SSD
 Cz4ZsCdcatUYkHKlM9hC4OLtPPTxduZgJdM1e8js73WRdq8oHA/belgEs36lVmijmEdy
 Fpe4UCz0gnj2kwqqFTATAUxwmlV10mF8gO2VSq5NrfUxJtJG9oEKsWFNa8wEBxGFYa2l
 4V3soZqMXoNNnfOHy+WwKi0axbIq9TekVZjOgzOMm/yrNu2pzzFfynv+5Xdwolr+k0nF
 tHi+xbQaYeT0+EVMCp9OKhq/HzEqdZCjMcGNsKzXq0thsek7Rf6SBhZ8AZ0c+/s7sSl2
 wmOQ==
X-Gm-Message-State: AHYfb5gnridacHy7x2D3sWZCt/6tzglSx7jxL2UqT4XeriNlhnp/tCV7
 hfCJUwGgCfvxqLid
X-Received: by 10.98.211.93 with SMTP id q90mr3007151pfg.107.1502164389475;
 Mon, 07 Aug 2017 20:53:09 -0700 (PDT)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id f2sm375767pgc.17.2017.08.07.20.53.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 07 Aug 2017 20:53:08 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: minyard@acm.org, benjaminfair@google.com, clg@kaod.org, joel@jms.id.au,
 andrew@aj.id.au
Cc: openipmi-developer@lists.sourceforge.net, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Brendan Higgins <brendanhiggins@google.com>
Subject: [RFC v1 3/4] ipmi_bmc: bt-i2c: port driver to IPMI BMC framework
Date: Mon,  7 Aug 2017 20:53:00 -0700
Message-Id: <20170808035301.1980-4-brendanhiggins@google.com>
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
X-List-Received-Date: Tue, 08 Aug 2017 03:53:12 -0000

From: Benjamin Fair <benjaminfair@google.com>

Instead of handling interaction with userspace and providing a file
interface, rely on the IPMI BMC framework to do this. This simplifies
the logic and eliminates duplicate code.

Signed-off-by: Benjamin Fair <benjaminfair@google.com>
Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
---
 drivers/char/ipmi_bmc/ipmi_bmc_bt_i2c.c | 202 +++++---------------------------
 1 file changed, 28 insertions(+), 174 deletions(-)

diff --git a/drivers/char/ipmi_bmc/ipmi_bmc_bt_i2c.c b/drivers/char/ipmi_bmc/ipmi_bmc_bt_i2c.c
index 686b83fa42a4..6665aa9d4300 100644
--- a/drivers/char/ipmi_bmc/ipmi_bmc_bt_i2c.c
+++ b/drivers/char/ipmi_bmc/ipmi_bmc_bt_i2c.c
@@ -14,102 +14,51 @@
 #include <linux/errno.h>
 #include <linux/i2c.h>
 #include <linux/ipmi_bmc.h>
-#include <linux/miscdevice.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
-#include <linux/poll.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
-#include <linux/wait.h>
 
 #define PFX "IPMI BMC BT-I2C: "
 
-/*
- * TODO: This is "bt-host" to match the bt-host driver; however, I think this is
- * unclear in the context of a CPU side driver. Should probably name this
- * and the DEVICE_NAME in bt-host to something like "bt-bmc" or "bt-slave".
- */
-#define DEVICE_NAME	"ipmi-bt-host"
-
-static const unsigned long request_queue_max_len = 256;
-
-struct bt_request_elem {
-	struct list_head	list;
-	struct bt_msg		request;
-};
-
 struct bt_i2c_slave {
+	struct ipmi_bmc_bus	bus;
 	struct i2c_client	*client;
-	struct miscdevice	miscdev;
+	struct ipmi_bmc_ctx	*bmc_ctx;
 	struct bt_msg		request;
-	struct list_head	request_queue;
-	atomic_t		request_queue_len;
 	struct bt_msg		response;
 	bool			response_in_progress;
 	size_t			msg_idx;
 	spinlock_t		lock;
-	wait_queue_head_t	wait_queue;
-	struct mutex		file_mutex;
 };
 
-static int receive_bt_request(struct bt_i2c_slave *bt_slave, bool non_blocking,
-			      struct bt_msg *bt_request)
+static bool bt_i2c_is_response_open(struct ipmi_bmc_bus *bus)
 {
-	int res;
+	struct bt_i2c_slave *bt_slave;
+	bool response_in_progress;
 	unsigned long flags;
-	struct bt_request_elem *queue_elem;
-
-	if (!non_blocking) {
-try_again:
-		res = wait_event_interruptible(
-				bt_slave->wait_queue,
-				atomic_read(&bt_slave->request_queue_len));
-		if (res)
-			return res;
-	}
 
-	spin_lock_irqsave(&bt_slave->lock, flags);
-	if (!atomic_read(&bt_slave->request_queue_len)) {
-		spin_unlock_irqrestore(&bt_slave->lock, flags);
-		if (non_blocking)
-			return -EAGAIN;
-		goto try_again;
-	}
+	bt_slave = container_of(bus, struct bt_i2c_slave, bus);
 
-	if (list_empty(&bt_slave->request_queue)) {
-		pr_err(PFX "request_queue was empty despite nonzero request_queue_len\n");
-		return -EIO;
-	}
-	queue_elem = list_first_entry(&bt_slave->request_queue,
-				      struct bt_request_elem, list);
-	memcpy(bt_request, &queue_elem->request, sizeof(*bt_request));
-	list_del(&queue_elem->list);
-	kfree(queue_elem);
-	atomic_dec(&bt_slave->request_queue_len);
+	spin_lock_irqsave(&bt_slave->lock, flags);
+	response_in_progress = bt_slave->response_in_progress;
 	spin_unlock_irqrestore(&bt_slave->lock, flags);
-	return 0;
+
+	return !response_in_progress;
 }
 
-static int send_bt_response(struct bt_i2c_slave *bt_slave, bool non_blocking,
-			    struct bt_msg *bt_response)
+static int bt_i2c_send_response(struct ipmi_bmc_bus *bus,
+				struct bt_msg *bt_response)
 {
-	int res;
+	struct bt_i2c_slave *bt_slave;
 	unsigned long flags;
 
-	if (!non_blocking) {
-try_again:
-		res = wait_event_interruptible(bt_slave->wait_queue,
-					       !bt_slave->response_in_progress);
-		if (res)
-			return res;
-	}
+	bt_slave = container_of(bus, struct bt_i2c_slave, bus);
 
 	spin_lock_irqsave(&bt_slave->lock, flags);
 	if (bt_slave->response_in_progress) {
 		spin_unlock_irqrestore(&bt_slave->lock, flags);
-		if (non_blocking)
-			return -EAGAIN;
-		goto try_again;
+		return -EAGAIN;
 	}
 
 	memcpy(&bt_slave->response, bt_response, sizeof(*bt_response));
@@ -118,106 +67,13 @@ static int send_bt_response(struct bt_i2c_slave *bt_slave, bool non_blocking,
 	return 0;
 }
 
-static inline struct bt_i2c_slave *to_bt_i2c_slave(struct file *file)
-{
-	return container_of(file->private_data, struct bt_i2c_slave, miscdev);
-}
-
-static ssize_t bt_read(struct file *file, char __user *buf, size_t count,
-		       loff_t *ppos)
-{
-	struct bt_i2c_slave *bt_slave = to_bt_i2c_slave(file);
-	struct bt_msg msg;
-	ssize_t ret;
-
-	mutex_lock(&bt_slave->file_mutex);
-	ret = receive_bt_request(bt_slave, file->f_flags & O_NONBLOCK, &msg);
-	if (ret < 0)
-		goto out;
-	count = min_t(size_t, count, bt_msg_len(&msg));
-	if (copy_to_user(buf, &msg, count)) {
-		ret = -EFAULT;
-		goto out;
-	}
-
-out:
-	mutex_unlock(&bt_slave->file_mutex);
-	if (ret < 0)
-		return ret;
-	else
-		return count;
-}
-
-static ssize_t bt_write(struct file *file, const char __user *buf, size_t count,
-			loff_t *ppos)
-{
-	struct bt_i2c_slave *bt_slave = to_bt_i2c_slave(file);
-	struct bt_msg msg;
-	ssize_t ret;
-
-	if (count > sizeof(msg))
-		return -EINVAL;
-
-	if (copy_from_user(&msg, buf, count) || count < bt_msg_len(&msg))
-		return -EINVAL;
-
-	mutex_lock(&bt_slave->file_mutex);
-	ret = send_bt_response(bt_slave, file->f_flags & O_NONBLOCK, &msg);
-	mutex_unlock(&bt_slave->file_mutex);
-
-	if (ret < 0)
-		return ret;
-	else
-		return count;
-}
-
-static unsigned int bt_poll(struct file *file, poll_table *wait)
-{
-	struct bt_i2c_slave *bt_slave = to_bt_i2c_slave(file);
-	unsigned int mask = 0;
-
-	mutex_lock(&bt_slave->file_mutex);
-	poll_wait(file, &bt_slave->wait_queue, wait);
-
-	if (atomic_read(&bt_slave->request_queue_len))
-		mask |= POLLIN;
-	if (!bt_slave->response_in_progress)
-		mask |= POLLOUT;
-	mutex_unlock(&bt_slave->file_mutex);
-	return mask;
-}
-
-static const struct file_operations bt_fops = {
-	.owner		= THIS_MODULE,
-	.read		= bt_read,
-	.write		= bt_write,
-	.poll		= bt_poll,
-};
-
-/* Called with bt_slave->lock held. */
-static int handle_request(struct bt_i2c_slave *bt_slave)
-{
-	struct bt_request_elem *queue_elem;
-
-	if (atomic_read(&bt_slave->request_queue_len) >= request_queue_max_len)
-		return -EFAULT;
-	queue_elem = kmalloc(sizeof(*queue_elem), GFP_KERNEL);
-	if (!queue_elem)
-		return -ENOMEM;
-	memcpy(&queue_elem->request, &bt_slave->request, sizeof(struct bt_msg));
-	list_add(&queue_elem->list, &bt_slave->request_queue);
-	atomic_inc(&bt_slave->request_queue_len);
-	wake_up_all(&bt_slave->wait_queue);
-	return 0;
-}
-
 /* Called with bt_slave->lock held. */
 static int complete_response(struct bt_i2c_slave *bt_slave)
 {
 	/* Invalidate response in buffer to denote it having been sent. */
 	bt_slave->response.len = 0;
 	bt_slave->response_in_progress = false;
-	wake_up_all(&bt_slave->wait_queue);
+	ipmi_bmc_signal_response_open(bt_slave->bmc_ctx);
 	return 0;
 }
 
@@ -240,7 +96,8 @@ static int bt_i2c_slave_cb(struct i2c_client *client,
 
 		buf[bt_slave->msg_idx++] = *val;
 		if (bt_slave->msg_idx >= bt_msg_len(&bt_slave->request))
-			handle_request(bt_slave);
+			ipmi_bmc_handle_request(bt_slave->bmc_ctx,
+						&bt_slave->request);
 		break;
 
 	case I2C_SLAVE_READ_REQUESTED:
@@ -290,26 +147,24 @@ static int bt_i2c_probe(struct i2c_client *client,
 		return -ENOMEM;
 
 	spin_lock_init(&bt_slave->lock);
-	init_waitqueue_head(&bt_slave->wait_queue);
-	atomic_set(&bt_slave->request_queue_len, 0);
 	bt_slave->response_in_progress = false;
-	INIT_LIST_HEAD(&bt_slave->request_queue);
+	bt_slave->bus.send_response = bt_i2c_send_response;
+	bt_slave->bus.is_response_open = bt_i2c_is_response_open;
 
-	mutex_init(&bt_slave->file_mutex);
+	bt_slave->bmc_ctx = ipmi_bmc_get_global_ctx();
 
-	bt_slave->miscdev.minor = MISC_DYNAMIC_MINOR;
-	bt_slave->miscdev.name = DEVICE_NAME;
-	bt_slave->miscdev.fops = &bt_fops;
-	bt_slave->miscdev.parent = &client->dev;
-	ret = misc_register(&bt_slave->miscdev);
-	if (ret)
+	ret = ipmi_bmc_register_bus(bt_slave->bmc_ctx, &bt_slave->bus);
+	if (ret) {
+		pr_err(PFX "Failed to register IPMI BMC bus\n");
 		return ret;
+	}
 
 	bt_slave->client = client;
 	i2c_set_clientdata(client, bt_slave);
 	ret = i2c_slave_register(client, bt_i2c_slave_cb);
+
 	if (ret) {
-		misc_deregister(&bt_slave->miscdev);
+		ipmi_bmc_unregister_bus(bt_slave->bmc_ctx, &bt_slave->bus);
 		return ret;
 	}
 
@@ -321,8 +176,7 @@ static int bt_i2c_remove(struct i2c_client *client)
 	struct bt_i2c_slave *bt_slave = i2c_get_clientdata(client);
 
 	i2c_slave_unregister(client);
-	misc_deregister(&bt_slave->miscdev);
-	return 0;
+	return ipmi_bmc_unregister_bus(bt_slave->bmc_ctx, &bt_slave->bus);
 }
 
 static const struct i2c_device_id bt_i2c_id[] = {
-- 
2.14.0.rc1.383.gd1ce394fe2-goog
