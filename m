Return-Path: <brendanhiggins@google.com>
Received: from mail-pg0-x22b.google.com (mail-pg0-x22b.google.com
 [IPv6:2607:f8b0:400e:c05::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xPND05MQrzDqJ0
 for <openbmc@lists.ozlabs.org>; Sat,  5 Aug 2017 09:19:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="k3oYWSNq"; 
 dkim-atps=neutral
Received: by mail-pg0-x22b.google.com with SMTP id l64so13093096pge.5
 for <openbmc@lists.ozlabs.org>; Fri, 04 Aug 2017 16:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Q5tQvUy4jgxszCRPVCc/iKzsLp3wI4p97bR0g4ubkhI=;
 b=k3oYWSNqT+Ic31eLbU7TI2f8Xpz1gvShlxsz+LFouU04i9BvnASbeszj5CejqCVG3X
 /QeY7iuYc3f54jbw8BLwCoKTa9egO/uBRnT/fA9Nsn8xjN/iVVIyAHmaDwQXJSN+10/4
 CYAIWy9yskY3F+8iIa4zN1Li8pw/H686gxdgjRTPR0ZNi8XwDqHkx5QyVpT0fH6PHBge
 ECOyTkBF/G/tvAl/bZdtenIB/hKel17ujHqMIU1ylS/FH22kwGxtH8qAr11nMZIl9A2A
 tsd53EIobX5LoY9aUUraBtjOcoFqCqgd0GjChBhvhx71XcI8nmYzcFUe8Bu1Z5EJGuWr
 +xWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Q5tQvUy4jgxszCRPVCc/iKzsLp3wI4p97bR0g4ubkhI=;
 b=An31WUGuIF5Na84WELtdAHoM1MHc5w0bix0vWIGOVIM2AyH6p9bguoO9aelHv5Mv2a
 c4R+1MINgHSI5W2J3mue3QKFe90cTR0DD0hhkHI8UEcMFRH23uSX6WJAT93FE9HztOGG
 5JwlylBHBipOVEx/H1pFWy4EbxuA3xVQXul+WoBFDV7XnvZvsXJnVE0Eu1xgHw0gbKJ6
 QNBCHCLPvju9UdWf4ebGfLORmGMfVDK5Qjq7WFfpKm5BBbgCGM1Eq+unLmila+ntr56H
 UlXaD//fPjzBzDMqGuK2gl1rx0d0zm6fbpziIXVgVR5Z1zp2rFWi58Lyk2CNQZj5fmtb
 nIww==
X-Gm-Message-State: AIVw1102VoKPV5Iwwpyu7fUjbJmLB3oLXLTzeE39K+c6U8OPM2/fXHCJ
 KkZfz+I5+GiXX6UE
X-Received: by 10.99.125.11 with SMTP id y11mr4015058pgc.19.1501888750756;
 Fri, 04 Aug 2017 16:19:10 -0700 (PDT)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id g1sm4976817pfk.92.2017.08.04.16.19.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 04 Aug 2017 16:19:10 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: corbet@lwn.net, robh+dt@kernel.org, mark.rutland@arm.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, minyard@acm.org, joel@jms.id.au,
 benh@kernel.crashing.org
Cc: linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH v1 3/3] ipmi: bt-i2c: added IPMI Block Transfer over I2C BMC
 side
Date: Fri,  4 Aug 2017 16:18:54 -0700
Message-Id: <20170804231854.19730-4-brendanhiggins@google.com>
X-Mailer: git-send-email 2.14.0.rc1.383.gd1ce394fe2-goog
In-Reply-To: <20170804231854.19730-1-brendanhiggins@google.com>
References: <20170804231854.19730-1-brendanhiggins@google.com>
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
X-List-Received-Date: Fri, 04 Aug 2017 23:19:13 -0000

The IPMI definition of the Block Transfer protocol defines the hardware
registers and behavior in addition to the message format and messaging
semantics. This implements a new protocol that uses IPMI Block Transfer
messages and semantics on top of a standard I2C interface. This protocol
has the same BMC side file system interface as "ipmi-bt-host".

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
---
 drivers/char/Kconfig                    |   1 +
 drivers/char/Makefile                   |   1 +
 drivers/char/ipmi_bmc/Kconfig           |  22 ++
 drivers/char/ipmi_bmc/Makefile          |   5 +
 drivers/char/ipmi_bmc/ipmi_bmc_bt_i2c.c | 346 ++++++++++++++++++++++++++++++++
 include/linux/ipmi_bmc.h                |  76 +++++++
 6 files changed, 451 insertions(+)
 create mode 100644 drivers/char/ipmi_bmc/Kconfig
 create mode 100644 drivers/char/ipmi_bmc/Makefile
 create mode 100644 drivers/char/ipmi_bmc/ipmi_bmc_bt_i2c.c
 create mode 100644 include/linux/ipmi_bmc.h

diff --git a/drivers/char/Kconfig b/drivers/char/Kconfig
index ccd239ab879f..2a6ca2325a45 100644
--- a/drivers/char/Kconfig
+++ b/drivers/char/Kconfig
@@ -195,6 +195,7 @@ config POWERNV_OP_PANEL
 	  If unsure, say M here to build it as a module called powernv-op-panel.
 
 source "drivers/char/ipmi/Kconfig"
+source "drivers/char/ipmi_bmc/Kconfig"
 
 config DS1620
 	tristate "NetWinder thermometer support"
diff --git a/drivers/char/Makefile b/drivers/char/Makefile
index 53e33720818c..9e143186fa30 100644
--- a/drivers/char/Makefile
+++ b/drivers/char/Makefile
@@ -58,4 +58,5 @@ js-rtc-y = rtc.o
 
 obj-$(CONFIG_TILE_SROM)		+= tile-srom.o
 obj-$(CONFIG_XILLYBUS)		+= xillybus/
+obj-$(CONFIG_IPMI_BMC)		+= ipmi_bmc/
 obj-$(CONFIG_POWERNV_OP_PANEL)	+= powernv-op-panel.o
diff --git a/drivers/char/ipmi_bmc/Kconfig b/drivers/char/ipmi_bmc/Kconfig
new file mode 100644
index 000000000000..26c8e0cb765c
--- /dev/null
+++ b/drivers/char/ipmi_bmc/Kconfig
@@ -0,0 +1,22 @@
+#
+# IPMI BMC configuration
+#
+
+menuconfig IPMI_BMC
+	tristate 'IPMI BMC core'
+	help
+	  This enables the BMC-side IPMI drivers.
+
+	  If unsure, say N.
+
+if IPMI_BMC
+
+config IPMI_BMC_BT_I2C
+	depends on I2C
+	select I2C_SLAVE
+	tristate 'Generic I2C BT IPMI BMC driver'
+	help
+	  Provides a driver that uses IPMI Block Transfer messages and
+	  semantics on top of plain old I2C.
+
+endif # IPMI_BMC
diff --git a/drivers/char/ipmi_bmc/Makefile b/drivers/char/ipmi_bmc/Makefile
new file mode 100644
index 000000000000..dfe5128f8158
--- /dev/null
+++ b/drivers/char/ipmi_bmc/Makefile
@@ -0,0 +1,5 @@
+#
+# Makefile for the ipmi bmc drivers.
+#
+
+obj-$(CONFIG_IPMI_BMC_BT_I2C) += ipmi_bmc_bt_i2c.o
diff --git a/drivers/char/ipmi_bmc/ipmi_bmc_bt_i2c.c b/drivers/char/ipmi_bmc/ipmi_bmc_bt_i2c.c
new file mode 100644
index 000000000000..686b83fa42a4
--- /dev/null
+++ b/drivers/char/ipmi_bmc/ipmi_bmc_bt_i2c.c
@@ -0,0 +1,346 @@
+/*
+ * Copyright 2017 Google Inc.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/errno.h>
+#include <linux/i2c.h>
+#include <linux/ipmi_bmc.h>
+#include <linux/miscdevice.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/poll.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/wait.h>
+
+#define PFX "IPMI BMC BT-I2C: "
+
+/*
+ * TODO: This is "bt-host" to match the bt-host driver; however, I think this is
+ * unclear in the context of a CPU side driver. Should probably name this
+ * and the DEVICE_NAME in bt-host to something like "bt-bmc" or "bt-slave".
+ */
+#define DEVICE_NAME	"ipmi-bt-host"
+
+static const unsigned long request_queue_max_len = 256;
+
+struct bt_request_elem {
+	struct list_head	list;
+	struct bt_msg		request;
+};
+
+struct bt_i2c_slave {
+	struct i2c_client	*client;
+	struct miscdevice	miscdev;
+	struct bt_msg		request;
+	struct list_head	request_queue;
+	atomic_t		request_queue_len;
+	struct bt_msg		response;
+	bool			response_in_progress;
+	size_t			msg_idx;
+	spinlock_t		lock;
+	wait_queue_head_t	wait_queue;
+	struct mutex		file_mutex;
+};
+
+static int receive_bt_request(struct bt_i2c_slave *bt_slave, bool non_blocking,
+			      struct bt_msg *bt_request)
+{
+	int res;
+	unsigned long flags;
+	struct bt_request_elem *queue_elem;
+
+	if (!non_blocking) {
+try_again:
+		res = wait_event_interruptible(
+				bt_slave->wait_queue,
+				atomic_read(&bt_slave->request_queue_len));
+		if (res)
+			return res;
+	}
+
+	spin_lock_irqsave(&bt_slave->lock, flags);
+	if (!atomic_read(&bt_slave->request_queue_len)) {
+		spin_unlock_irqrestore(&bt_slave->lock, flags);
+		if (non_blocking)
+			return -EAGAIN;
+		goto try_again;
+	}
+
+	if (list_empty(&bt_slave->request_queue)) {
+		pr_err(PFX "request_queue was empty despite nonzero request_queue_len\n");
+		return -EIO;
+	}
+	queue_elem = list_first_entry(&bt_slave->request_queue,
+				      struct bt_request_elem, list);
+	memcpy(bt_request, &queue_elem->request, sizeof(*bt_request));
+	list_del(&queue_elem->list);
+	kfree(queue_elem);
+	atomic_dec(&bt_slave->request_queue_len);
+	spin_unlock_irqrestore(&bt_slave->lock, flags);
+	return 0;
+}
+
+static int send_bt_response(struct bt_i2c_slave *bt_slave, bool non_blocking,
+			    struct bt_msg *bt_response)
+{
+	int res;
+	unsigned long flags;
+
+	if (!non_blocking) {
+try_again:
+		res = wait_event_interruptible(bt_slave->wait_queue,
+					       !bt_slave->response_in_progress);
+		if (res)
+			return res;
+	}
+
+	spin_lock_irqsave(&bt_slave->lock, flags);
+	if (bt_slave->response_in_progress) {
+		spin_unlock_irqrestore(&bt_slave->lock, flags);
+		if (non_blocking)
+			return -EAGAIN;
+		goto try_again;
+	}
+
+	memcpy(&bt_slave->response, bt_response, sizeof(*bt_response));
+	bt_slave->response_in_progress = true;
+	spin_unlock_irqrestore(&bt_slave->lock, flags);
+	return 0;
+}
+
+static inline struct bt_i2c_slave *to_bt_i2c_slave(struct file *file)
+{
+	return container_of(file->private_data, struct bt_i2c_slave, miscdev);
+}
+
+static ssize_t bt_read(struct file *file, char __user *buf, size_t count,
+		       loff_t *ppos)
+{
+	struct bt_i2c_slave *bt_slave = to_bt_i2c_slave(file);
+	struct bt_msg msg;
+	ssize_t ret;
+
+	mutex_lock(&bt_slave->file_mutex);
+	ret = receive_bt_request(bt_slave, file->f_flags & O_NONBLOCK, &msg);
+	if (ret < 0)
+		goto out;
+	count = min_t(size_t, count, bt_msg_len(&msg));
+	if (copy_to_user(buf, &msg, count)) {
+		ret = -EFAULT;
+		goto out;
+	}
+
+out:
+	mutex_unlock(&bt_slave->file_mutex);
+	if (ret < 0)
+		return ret;
+	else
+		return count;
+}
+
+static ssize_t bt_write(struct file *file, const char __user *buf, size_t count,
+			loff_t *ppos)
+{
+	struct bt_i2c_slave *bt_slave = to_bt_i2c_slave(file);
+	struct bt_msg msg;
+	ssize_t ret;
+
+	if (count > sizeof(msg))
+		return -EINVAL;
+
+	if (copy_from_user(&msg, buf, count) || count < bt_msg_len(&msg))
+		return -EINVAL;
+
+	mutex_lock(&bt_slave->file_mutex);
+	ret = send_bt_response(bt_slave, file->f_flags & O_NONBLOCK, &msg);
+	mutex_unlock(&bt_slave->file_mutex);
+
+	if (ret < 0)
+		return ret;
+	else
+		return count;
+}
+
+static unsigned int bt_poll(struct file *file, poll_table *wait)
+{
+	struct bt_i2c_slave *bt_slave = to_bt_i2c_slave(file);
+	unsigned int mask = 0;
+
+	mutex_lock(&bt_slave->file_mutex);
+	poll_wait(file, &bt_slave->wait_queue, wait);
+
+	if (atomic_read(&bt_slave->request_queue_len))
+		mask |= POLLIN;
+	if (!bt_slave->response_in_progress)
+		mask |= POLLOUT;
+	mutex_unlock(&bt_slave->file_mutex);
+	return mask;
+}
+
+static const struct file_operations bt_fops = {
+	.owner		= THIS_MODULE,
+	.read		= bt_read,
+	.write		= bt_write,
+	.poll		= bt_poll,
+};
+
+/* Called with bt_slave->lock held. */
+static int handle_request(struct bt_i2c_slave *bt_slave)
+{
+	struct bt_request_elem *queue_elem;
+
+	if (atomic_read(&bt_slave->request_queue_len) >= request_queue_max_len)
+		return -EFAULT;
+	queue_elem = kmalloc(sizeof(*queue_elem), GFP_KERNEL);
+	if (!queue_elem)
+		return -ENOMEM;
+	memcpy(&queue_elem->request, &bt_slave->request, sizeof(struct bt_msg));
+	list_add(&queue_elem->list, &bt_slave->request_queue);
+	atomic_inc(&bt_slave->request_queue_len);
+	wake_up_all(&bt_slave->wait_queue);
+	return 0;
+}
+
+/* Called with bt_slave->lock held. */
+static int complete_response(struct bt_i2c_slave *bt_slave)
+{
+	/* Invalidate response in buffer to denote it having been sent. */
+	bt_slave->response.len = 0;
+	bt_slave->response_in_progress = false;
+	wake_up_all(&bt_slave->wait_queue);
+	return 0;
+}
+
+static int bt_i2c_slave_cb(struct i2c_client *client,
+			   enum i2c_slave_event event, u8 *val)
+{
+	struct bt_i2c_slave *bt_slave = i2c_get_clientdata(client);
+	u8 *buf;
+
+	spin_lock(&bt_slave->lock);
+	switch (event) {
+	case I2C_SLAVE_WRITE_REQUESTED:
+		bt_slave->msg_idx = 0;
+		break;
+
+	case I2C_SLAVE_WRITE_RECEIVED:
+		buf = (u8 *) &bt_slave->request;
+		if (bt_slave->msg_idx >= sizeof(struct bt_msg))
+			break;
+
+		buf[bt_slave->msg_idx++] = *val;
+		if (bt_slave->msg_idx >= bt_msg_len(&bt_slave->request))
+			handle_request(bt_slave);
+		break;
+
+	case I2C_SLAVE_READ_REQUESTED:
+		buf = (u8 *) &bt_slave->response;
+		bt_slave->msg_idx = 0;
+		*val = buf[bt_slave->msg_idx];
+		/*
+		 * Do not increment buffer_idx here, because we don't know if
+		 * this byte will be actually used. Read Linux I2C slave docs
+		 * for details.
+		 */
+		break;
+
+	case I2C_SLAVE_READ_PROCESSED:
+		buf = (u8 *) &bt_slave->response;
+		if (bt_slave->response.len &&
+		    bt_slave->msg_idx < bt_msg_len(&bt_slave->response)) {
+			*val = buf[++bt_slave->msg_idx];
+		} else {
+			*val = 0;
+		}
+		if (bt_slave->msg_idx + 1 >= bt_msg_len(&bt_slave->response))
+			complete_response(bt_slave);
+		break;
+
+	case I2C_SLAVE_STOP:
+		bt_slave->msg_idx = 0;
+		break;
+
+	default:
+		break;
+	}
+	spin_unlock(&bt_slave->lock);
+
+	return 0;
+}
+
+static int bt_i2c_probe(struct i2c_client *client,
+			const struct i2c_device_id *id)
+{
+	struct bt_i2c_slave *bt_slave;
+	int ret;
+
+	bt_slave = devm_kzalloc(&client->dev, sizeof(*bt_slave),
+				GFP_KERNEL);
+	if (!bt_slave)
+		return -ENOMEM;
+
+	spin_lock_init(&bt_slave->lock);
+	init_waitqueue_head(&bt_slave->wait_queue);
+	atomic_set(&bt_slave->request_queue_len, 0);
+	bt_slave->response_in_progress = false;
+	INIT_LIST_HEAD(&bt_slave->request_queue);
+
+	mutex_init(&bt_slave->file_mutex);
+
+	bt_slave->miscdev.minor = MISC_DYNAMIC_MINOR;
+	bt_slave->miscdev.name = DEVICE_NAME;
+	bt_slave->miscdev.fops = &bt_fops;
+	bt_slave->miscdev.parent = &client->dev;
+	ret = misc_register(&bt_slave->miscdev);
+	if (ret)
+		return ret;
+
+	bt_slave->client = client;
+	i2c_set_clientdata(client, bt_slave);
+	ret = i2c_slave_register(client, bt_i2c_slave_cb);
+	if (ret) {
+		misc_deregister(&bt_slave->miscdev);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int bt_i2c_remove(struct i2c_client *client)
+{
+	struct bt_i2c_slave *bt_slave = i2c_get_clientdata(client);
+
+	i2c_slave_unregister(client);
+	misc_deregister(&bt_slave->miscdev);
+	return 0;
+}
+
+static const struct i2c_device_id bt_i2c_id[] = {
+	{"ipmi-bmc-bt-i2c", 0},
+	{},
+};
+MODULE_DEVICE_TABLE(i2c, bt_i2c_id);
+
+static struct i2c_driver bt_i2c_driver = {
+	.driver = {
+		.name		= "ipmi-bmc-bt-i2c",
+	},
+	.probe		= bt_i2c_probe,
+	.remove		= bt_i2c_remove,
+	.id_table	= bt_i2c_id,
+};
+module_i2c_driver(bt_i2c_driver);
+
+MODULE_AUTHOR("Brendan Higgins <brendanhiggins@google.com>");
+MODULE_DESCRIPTION("BMC-side IPMI Block Transfer over I2C.");
+MODULE_LICENSE("GPL v2");
diff --git a/include/linux/ipmi_bmc.h b/include/linux/ipmi_bmc.h
new file mode 100644
index 000000000000..d0885c0bf190
--- /dev/null
+++ b/include/linux/ipmi_bmc.h
@@ -0,0 +1,76 @@
+/*
+ * Copyright 2017 Google Inc.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ */
+
+#ifndef __LINUX_IPMI_BMC_H
+#define __LINUX_IPMI_BMC_H
+
+#include <linux/bug.h>
+#include <linux/list.h>
+#include <linux/mutex.h>
+#include <linux/types.h>
+
+#define BT_MSG_PAYLOAD_LEN_MAX 252
+
+/**
+ * struct bt_msg - Block Transfer IPMI message.
+ * @len: Length of the message, not including this field.
+ * @netfn_lun: 6-bit netfn field definining the category of message and 2-bit
+ *             lun field used for routing.
+ * @seq: Sequence number used to associate requests with responses.
+ * @cmd: Command within a netfn category.
+ * @payload: Variable length field. May have specific requirements based on
+ *           netfn/cmd pair.
+ *
+ * Use bt_msg_len() to determine the total length of a message (including
+ * the @len field) rather than reading it directly.
+ */
+struct bt_msg {
+	u8 len;
+	u8 netfn_lun;
+	u8 seq;
+	u8 cmd;
+	u8 payload[BT_MSG_PAYLOAD_LEN_MAX];
+} __packed;
+
+/**
+ * bt_msg_len() - Determine the total length of a Block Transfer message.
+ * @bt_msg: Pointer to the message.
+ *
+ * This function calculates the length of an IPMI Block Transfer message
+ * including the length field itself.
+ *
+ * Return: Length of @bt_msg.
+ */
+static inline u32 bt_msg_len(struct bt_msg *bt_msg)
+{
+	return bt_msg->len + 1;
+}
+
+/**
+ * bt_msg_payload_to_len() - Calculate the len field of a Block Transfer message
+ *                           given the length of the payload.
+ * @payload_len: Length of the payload.
+ *
+ * Return: len field of the Block Transfer message which contains this payload.
+ */
+static inline u8 bt_msg_payload_to_len(u8 payload_len)
+{
+	if (unlikely(payload_len > BT_MSG_PAYLOAD_LEN_MAX)) {
+		payload_len = BT_MSG_PAYLOAD_LEN_MAX;
+		WARN(1, "BT message payload is too large. Truncating to %u.\n",
+		     BT_MSG_PAYLOAD_LEN_MAX);
+	}
+	return payload_len + 3;
+}
+
+#endif /* __LINUX_IPMI_BMC_H */
-- 
2.14.0.rc1.383.gd1ce394fe2-goog
