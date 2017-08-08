Return-Path: <brendanhiggins@google.com>
Received: from mail-pg0-x22a.google.com (mail-pg0-x22a.google.com
 [IPv6:2607:f8b0:400e:c05::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xRL8k2Dd4zDqkp
 for <openbmc@lists.ozlabs.org>; Tue,  8 Aug 2017 13:53:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Q8oIlE0B"; 
 dkim-atps=neutral
Received: by mail-pg0-x22a.google.com with SMTP id v189so9508578pgd.2
 for <openbmc@lists.ozlabs.org>; Mon, 07 Aug 2017 20:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=xt3fqns7il16WEYQkVEUwP0TUDaxn906zYHVt54yS8o=;
 b=Q8oIlE0BagLk2zZ+I5KDb66wpIXH+ZkoAByuF5V5c9zRwsVvjPpbaoTir8xNJaxZF9
 kJOfO4Vb1b+y4OAkH3iCn9uMt+NS3SkGoS8HPSvmszY+DkzYpZThtjx0ZKgiRVhVf0Ny
 jN8X13lX7crOBpFSPC4zwx3jFJE191tVPuIMH8/IYxq7hfCY/HZCogCiTTgvNI8AYAfd
 jrxg4/s8cADmqPrgQEJ/sZStykqT0T7tFXfZOcftwrsOu+iTbpHb8DA2xjH87OQRi2Ts
 JwK94xiKjHbrXL+zEiZWe2nIO156obEr6e651XBdIBLHtGx2JOLTs7R6fqxpPFpC/zeA
 sgSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=xt3fqns7il16WEYQkVEUwP0TUDaxn906zYHVt54yS8o=;
 b=QYvcHR2bPlFfOr7RL6+y28oAYrK9tovoJFvv5B54gsJgTx++b4tzWdXdfcrZX5Sf1N
 Ql1Zn0uKv5nlx7rT3tDnoiL2yvP3xR7id0zeNPkr/VOaLxBSXgjW+SXY8Ph90JOqrVg9
 cXf6Dbe3rgd3paGUYmf8W1+LBVjPr5tot/8z1hI97zMFon1inuJp6Rthv02xyApk8TGs
 oMKE8YrmgEA1yBKg8xvCa5rULKecY8I2uoS+kXG4o2mn2TkLFJC36yDI5dbAfwVNPyLq
 OAUh22uUT1W6cjJC5nOoaTnnG7GlRpp2VXuetqG+bEb4QPz8d3/yPdLsFB2jkPcNHzk0
 v8cg==
X-Gm-Message-State: AHYfb5hTwGUXqL+X4+m2WNVMlNnppwsQK0T1V3TaRI2GzUF2jXLcT5QA
 dAGTOVBZIadRbonl
X-Received: by 10.99.0.149 with SMTP id 143mr2728726pga.243.1502164388475;
 Mon, 07 Aug 2017 20:53:08 -0700 (PDT)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id f2sm375767pgc.17.2017.08.07.20.53.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 07 Aug 2017 20:53:07 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: minyard@acm.org, benjaminfair@google.com, clg@kaod.org, joel@jms.id.au,
 andrew@aj.id.au
Cc: openipmi-developer@lists.sourceforge.net, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Brendan Higgins <brendanhiggins@google.com>
Subject: [RFC v1 2/4] ipmi_bmc: device interface to IPMI BMC framework
Date: Mon,  7 Aug 2017 20:52:59 -0700
Message-Id: <20170808035301.1980-3-brendanhiggins@google.com>
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
X-List-Received-Date: Tue, 08 Aug 2017 03:53:11 -0000

From: Benjamin Fair <benjaminfair@google.com>

This creates a char device which allows userspace programs to send and
receive IPMI messages. Messages are only routed to userspace if no other
kernel driver can handle them.

Signed-off-by: Benjamin Fair <benjaminfair@google.com>
Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
---
 drivers/char/ipmi_bmc/Kconfig            |   6 +
 drivers/char/ipmi_bmc/Makefile           |   1 +
 drivers/char/ipmi_bmc/ipmi_bmc_devintf.c | 241 +++++++++++++++++++++++++++++++
 3 files changed, 248 insertions(+)
 create mode 100644 drivers/char/ipmi_bmc/ipmi_bmc_devintf.c

diff --git a/drivers/char/ipmi_bmc/Kconfig b/drivers/char/ipmi_bmc/Kconfig
index b6af38455702..262a17866aa2 100644
--- a/drivers/char/ipmi_bmc/Kconfig
+++ b/drivers/char/ipmi_bmc/Kconfig
@@ -11,6 +11,12 @@ menuconfig IPMI_BMC
 
 if IPMI_BMC
 
+config IPMI_BMC_DEVICE_INTERFACE
+	tristate 'Device interface for BMC-side IPMI'
+	help
+	  This provides a file interface to the IPMI BMC core so userland
+	  processes may use IPMI.
+
 config IPMI_BMC_BT_I2C
 	depends on I2C
 	select I2C_SLAVE
diff --git a/drivers/char/ipmi_bmc/Makefile b/drivers/char/ipmi_bmc/Makefile
index 9c7cd48d899f..ead8abffbd11 100644
--- a/drivers/char/ipmi_bmc/Makefile
+++ b/drivers/char/ipmi_bmc/Makefile
@@ -3,5 +3,6 @@
 #
 
 obj-$(CONFIG_IPMI_BMC) += ipmi_bmc.o
+obj-$(CONFIG_IPMI_BMC_DEVICE_INTERFACE) += ipmi_bmc_devintf.o
 obj-$(CONFIG_IPMI_BMC_BT_I2C) += ipmi_bmc_bt_i2c.o
 obj-$(CONFIG_ASPEED_BT_IPMI_BMC) += ipmi_bmc_bt_aspeed.o
diff --git a/drivers/char/ipmi_bmc/ipmi_bmc_devintf.c b/drivers/char/ipmi_bmc/ipmi_bmc_devintf.c
new file mode 100644
index 000000000000..2421237ed575
--- /dev/null
+++ b/drivers/char/ipmi_bmc/ipmi_bmc_devintf.c
@@ -0,0 +1,241 @@
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
+#include <linux/atomic.h>
+#include <linux/delay.h>
+#include <linux/fs.h>
+#include <linux/io.h>
+#include <linux/ipmi_bmc.h>
+#include <linux/kfifo.h>
+#include <linux/log2.h>
+#include <linux/miscdevice.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/poll.h>
+#include <linux/sched.h>
+#include <linux/slab.h>
+#include <linux/timer.h>
+#include <linux/uaccess.h>
+#include <linux/wait.h>
+
+#define PFX "IPMI BMC devintf: "
+
+#define DEVICE_NAME "ipmi-bt-host"
+
+/* Must be a power of two */
+#define REQUEST_FIFO_SIZE roundup_pow_of_two(BT_MSG_SEQ_MAX)
+
+struct bmc_devintf_data {
+	struct miscdevice	miscdev;
+	struct ipmi_bmc_device	bmc_device;
+	struct ipmi_bmc_ctx	*bmc_ctx;
+	wait_queue_head_t	wait_queue;
+	/* FIFO of waiting messages */
+	DECLARE_KFIFO(requests, struct bt_msg, REQUEST_FIFO_SIZE);
+};
+
+static inline struct bmc_devintf_data *file_to_bmc_devintf_data(
+		struct file *file)
+{
+	return container_of(file->private_data, struct bmc_devintf_data,
+			    miscdev);
+}
+
+static ssize_t ipmi_bmc_devintf_read(struct file *file, char __user *buf,
+				     size_t count, loff_t *ppos)
+{
+	struct bmc_devintf_data *devintf_data = file_to_bmc_devintf_data(file);
+	bool non_blocking = file->f_flags & O_NONBLOCK;
+	struct bt_msg msg;
+
+	if (non_blocking && kfifo_is_empty(&devintf_data->requests)) {
+		return -EAGAIN;
+	} else if (!non_blocking) {
+		if (wait_event_interruptible(devintf_data->wait_queue,
+				!kfifo_is_empty(&devintf_data->requests)))
+			return -ERESTARTSYS;
+	}
+
+	/* TODO(benjaminfair): eliminate this extra copy */
+	if (unlikely(!kfifo_get(&devintf_data->requests, &msg))) {
+		pr_err(PFX "Unable to read request from fifo\n");
+		return -EIO;
+	}
+
+	/* TODO(benjaminfair): handle partial reads of a message */
+	if (count > bt_msg_len(&msg))
+		count = bt_msg_len(&msg);
+
+	if (copy_to_user(buf, &msg, count))
+		return -EFAULT;
+
+	return count;
+}
+
+static ssize_t ipmi_bmc_devintf_write(struct file *file, const char __user *buf,
+				      size_t count, loff_t *ppos)
+{
+	struct bmc_devintf_data *devintf_data = file_to_bmc_devintf_data(file);
+	bool non_blocking = file->f_flags & O_NONBLOCK;
+	struct bt_msg msg;
+	ssize_t ret = 0;
+
+	if (count > sizeof(struct bt_msg))
+		return -EINVAL;
+
+	if (copy_from_user(&msg, buf, count))
+		return -EFAULT;
+
+	if (count != bt_msg_len(&msg))
+		return -EINVAL;
+
+	ret = ipmi_bmc_send_response(devintf_data->bmc_ctx, &msg);
+
+	/* Try again if blocking is allowed */
+	while (!non_blocking && ret == -EAGAIN) {
+		if (wait_event_interruptible(devintf_data->wait_queue,
+				ipmi_bmc_is_response_open(
+						devintf_data->bmc_ctx)))
+			return -ERESTARTSYS;
+
+		ret = ipmi_bmc_send_response(devintf_data->bmc_ctx, &msg);
+	}
+
+	if (ret < 0)
+		return ret;
+	else
+		return count;
+}
+
+static unsigned int ipmi_bmc_devintf_poll(struct file *file, poll_table *wait)
+{
+	struct bmc_devintf_data *devintf_data = file_to_bmc_devintf_data(file);
+	unsigned int mask = 0;
+
+	poll_wait(file, &devintf_data->wait_queue, wait);
+
+	if (!kfifo_is_empty(&devintf_data->requests))
+		mask |= POLLIN;
+	if (ipmi_bmc_is_response_open(devintf_data->bmc_ctx))
+		mask |= POLLOUT;
+
+	return mask;
+}
+
+static const struct file_operations ipmi_bmc_fops = {
+	.owner		= THIS_MODULE,
+	.read		= ipmi_bmc_devintf_read,
+	.write		= ipmi_bmc_devintf_write,
+	.poll		= ipmi_bmc_devintf_poll,
+};
+
+static inline struct bmc_devintf_data *device_to_bmc_devintf_data(
+		struct ipmi_bmc_device *device)
+{
+	return container_of(device, struct bmc_devintf_data, bmc_device);
+}
+
+static int ipmi_bmc_devintf_handle_request(struct ipmi_bmc_device *device,
+					   struct bt_msg *bt_request)
+{
+	struct bmc_devintf_data *devintf_data =
+		device_to_bmc_devintf_data(device);
+
+	if (!bt_request->len)
+		return -EINVAL;
+
+	if (!kfifo_put(&devintf_data->requests, *bt_request))
+		return -EBUSY;
+
+	wake_up_all(&devintf_data->wait_queue);
+
+	return 0;
+}
+
+static bool ipmi_bmc_devintf_match_request(struct ipmi_bmc_device *device,
+					   struct bt_msg *bt_request)
+{
+	/* Since this is a default device, match all requests */
+	return true;
+}
+
+static void ipmi_bmc_devintf_signal_response_open(
+		struct ipmi_bmc_device *device)
+{
+	struct bmc_devintf_data *devintf_data =
+		device_to_bmc_devintf_data(device);
+
+	wake_up_all(&devintf_data->wait_queue);
+}
+
+/*
+ * TODO: if we want to support multiple interfaces, initialize this global
+ * variable elsewhere
+ */
+static struct bmc_devintf_data *devintf_data;
+
+static int __init init_ipmi_bmc_devintf(void)
+{
+	int ret;
+
+	devintf_data = kzalloc(sizeof(*devintf_data), GFP_KERNEL);
+	if (!devintf_data)
+		return -ENOMEM;
+
+	init_waitqueue_head(&devintf_data->wait_queue);
+	INIT_KFIFO(devintf_data->requests);
+
+	devintf_data->bmc_device.handle_request =
+		ipmi_bmc_devintf_handle_request;
+	devintf_data->bmc_device.match_request =
+		ipmi_bmc_devintf_match_request;
+	devintf_data->bmc_device.signal_response_open =
+		ipmi_bmc_devintf_signal_response_open;
+
+	devintf_data->miscdev.minor = MISC_DYNAMIC_MINOR;
+	devintf_data->miscdev.name = DEVICE_NAME;
+	devintf_data->miscdev.fops = &ipmi_bmc_fops;
+
+	devintf_data->bmc_ctx = ipmi_bmc_get_global_ctx();
+
+	ret = ipmi_bmc_register_default_device(devintf_data->bmc_ctx,
+					       &devintf_data->bmc_device);
+	if (ret) {
+		pr_err(PFX "unable to register IPMI BMC device\n");
+		return ret;
+	}
+
+	ret = misc_register(&devintf_data->miscdev);
+	if (ret) {
+		ipmi_bmc_unregister_default_device(devintf_data->bmc_ctx,
+						   &devintf_data->bmc_device);
+		pr_err(PFX "unable to register misc device\n");
+		return ret;
+	}
+
+	pr_info(PFX "initialized\n");
+	return 0;
+}
+module_init(init_ipmi_bmc_devintf);
+
+static void __exit exit_ipmi_bmc_devintf(void)
+{
+	misc_deregister(&devintf_data->miscdev);
+	WARN_ON(ipmi_bmc_unregister_default_device(devintf_data->bmc_ctx,
+						   &devintf_data->bmc_device));
+}
+module_exit(exit_ipmi_bmc_devintf);
+
+MODULE_AUTHOR("Benjamin Fair <benjaminfair@google.com>");
+MODULE_DESCRIPTION("Device file interface to IPMI Block Transfer core.");
+MODULE_LICENSE("GPL v2");
-- 
2.14.0.rc1.383.gd1ce394fe2-goog
