Return-Path: <3ZbQ_WwwKB6wNQZVMYUZRMUdSaaSXQ.OaYabQZNYOXUefe.alXMNe.adS@flex--benjaminfair.bounces.google.com>
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=flex--benjaminfair.bounces.google.com
 (client-ip=2607:f8b0:400c:c05::249; helo=mail-vk0-x249.google.com;
 envelope-from=3zbq_wwwkb6wnqzvmyuzrmudsaasxq.oayabqznyoxuefe.alxmne.ads@flex--benjaminfair.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="h2SUU9NY"; 
 dkim-atps=neutral
Received: from mail-vk0-x249.google.com (mail-vk0-x249.google.com
 [IPv6:2607:f8b0:400c:c05::249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41Mjqf1m3mzDqHx
 for <openbmc@lists.ozlabs.org>; Sat,  7 Jul 2018 04:26:47 +1000 (AEST)
Received: by mail-vk0-x249.google.com with SMTP id p79-v6so4931806vkd.3
 for <openbmc@lists.ozlabs.org>; Fri, 06 Jul 2018 11:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:date:message-id:subject:from:to:cc;
 bh=PSdTW+d0e7yZIQKWMY45aV6yuMW5pKLzDpdNCvk5jQQ=;
 b=h2SUU9NYZqN2lkVNFWCkkUDvYtngYS5LLUUswB37mIipaSfXn0yUMxLFJ0S5KT2gJc
 J9wkWmsTXKtnDWyRbh/8Ut4VrTwo90d2CzKwsaiWG2ewIFqog02Zw2nypDB4djyKE2Pi
 KrFAXmq4gXz1EdL+2DZf5aGhkLya5EPm5FuXx/m5NT0OGX9ZmDx8Wkl5JAW2VeoY9zZc
 /zdYBjf9hdGW+cqiwRyZDTukHqPz5OWjbHHy7s0t2ymK4xLWROeQqsyRUXs/1Lp5jvHL
 GevHw8sZg8Mu3tOEAknDQcuM4gXcscpIPwKRpEuC8pUihrGUlkiBWyeuaeJ8dhW49XfE
 JzJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to:cc;
 bh=PSdTW+d0e7yZIQKWMY45aV6yuMW5pKLzDpdNCvk5jQQ=;
 b=eoFz4XqLxt985fyGjNV0YY18Nos70O1o8xWXFEZnYXDgZhGz4Lulsua0hx1If/aywV
 rAXNIdB5j8hbQr5CLKkvrbD8/nX3zZG/d9vUtVUauGNPFe50l0m9wteqIopP/7ZUNJtR
 tgFzCuKKu6hebngwbiOBFQV8cQbAwWnwTOo04vYaMDLZFX74XQl9QzHzOeSDby0bkf6e
 EWtfmjjZVstmd5zooNev/xR3puoWtuCInTvwqD7hHjoEQyqkmFrJJ+yrjDtdOPfBZ2mW
 zfmLmzUtUrQxW62Bk9hHOmxcUmwMUnGJekumn8VqXHUISQIOuIeLlu/Yr6iFA66Rzvw3
 mgrA==
X-Gm-Message-State: APt69E2+BxwiNXrJP/a1xc/qut/Zw0qD3goxCs49J2lQJAjqyVkEGRXm
 nMAnP1YQANlQM2VGw6zW/ukp46xQbc6381S/RKU=
X-Google-Smtp-Source: AAOMgpdYDBd5fvVbsOmpQ7YamjyapTNAdmUQEuTRQLgr50H+aouEFDdUISLYF/I7RVeidJymw6AyFdJR77+Leq325fU=
MIME-Version: 1.0
X-Received: by 2002:a1f:b10c:: with SMTP id
 a12-v6mr4986932vkf.112.1530901605264; 
 Fri, 06 Jul 2018 11:26:45 -0700 (PDT)
Date: Fri,  6 Jul 2018 11:25:32 -0700
Message-Id: <20180706182531.137362-1-benjaminfair@google.com>
X-Mailer: git-send-email 2.18.0.203.gfac676dfb9-goog
Subject: [PATCH] drivers/misc: Aspeed LPC snoop output using misc chardev
From: Benjamin Fair <benjaminfair@google.com>
To: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org, linux-aspeed@lists.ozlabs.org
Cc: Robert Lippert <rlippert@google.com>, Patrick Venture <venture@google.com>,
 Benjamin Fair <benjaminfair@google.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Jul 2018 18:26:55 -0000

From: Robert Lippert <rlippert@google.com>

Provides the data bytes snooped over the LPC snoop bus to userspace
as a (blocking) misc character device.

Bytes output from the host using LPC I/O transactions to the snooped port
can be watched or retrieved from the character device using a simple
command like this:
~#  od -w1 -A n -t x1 /dev/aspeed-lpc-snoop0
 10
 de
 ad
 c0
 ff
 ee

Signed-off-by: Robert Lippert <rlippert@google.com>
Signed-off-by: Patrick Venture <venture@google.com>
Signed-off-by: Benjamin Fair <benjaminfair@google.com>
---
 drivers/misc/aspeed-lpc-snoop.c | 84 +++++++++++++++++++++++++++++----
 1 file changed, 74 insertions(+), 10 deletions(-)

diff --git a/drivers/misc/aspeed-lpc-snoop.c b/drivers/misc/aspeed-lpc-snoop.c
index cb78c98bc78d..2feb4347d67f 100644
--- a/drivers/misc/aspeed-lpc-snoop.c
+++ b/drivers/misc/aspeed-lpc-snoop.c
@@ -16,12 +16,15 @@
 
 #include <linux/bitops.h>
 #include <linux/interrupt.h>
+#include <linux/fs.h>
 #include <linux/kfifo.h>
 #include <linux/mfd/syscon.h>
+#include <linux/miscdevice.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/poll.h>
 #include <linux/regmap.h>
 
 #define DEVICE_NAME	"aspeed-lpc-snoop"
@@ -59,20 +62,70 @@ struct aspeed_lpc_snoop_model_data {
 	unsigned int has_hicrb_ensnp;
 };
 
+struct aspeed_lpc_snoop_channel {
+	struct kfifo		fifo;
+	wait_queue_head_t	wq;
+	struct miscdevice	miscdev;
+};
+
 struct aspeed_lpc_snoop {
 	struct regmap		*regmap;
 	int			irq;
-	struct kfifo		snoop_fifo[NUM_SNOOP_CHANNELS];
+	struct aspeed_lpc_snoop_channel chan[NUM_SNOOP_CHANNELS];
+};
+
+static struct aspeed_lpc_snoop_channel *snoop_file_to_chan(struct file *file)
+{
+	return container_of(file->private_data,
+			    struct aspeed_lpc_snoop_channel,
+			    miscdev);
+}
+
+static ssize_t snoop_file_read(struct file *file, char __user *buffer,
+				size_t count, loff_t *ppos)
+{
+	struct aspeed_lpc_snoop_channel *chan = snoop_file_to_chan(file);
+	unsigned int copied;
+	int ret = 0;
+
+	if (kfifo_is_empty(&chan->fifo)) {
+		if (file->f_flags & O_NONBLOCK)
+			return -EAGAIN;
+		ret = wait_event_interruptible(chan->wq,
+				!kfifo_is_empty(&chan->fifo));
+		if (ret == -ERESTARTSYS)
+			return -EINTR;
+	}
+	ret = kfifo_to_user(&chan->fifo, buffer, count, &copied);
+
+	return ret ? ret : copied;
+}
+
+static unsigned int snoop_file_poll(struct file *file,
+				    struct poll_table_struct *pt)
+{
+	struct aspeed_lpc_snoop_channel *chan = snoop_file_to_chan(file);
+
+	poll_wait(file, &chan->wq, pt);
+	return !kfifo_is_empty(&chan->fifo) ? POLLIN : 0;
+}
+
+static const struct file_operations snoop_fops = {
+	.owner  = THIS_MODULE,
+	.read   = snoop_file_read,
+	.poll   = snoop_file_poll,
+	.llseek = noop_llseek,
 };
 
 /* Save a byte to a FIFO and discard the oldest byte if FIFO is full */
-static void put_fifo_with_discard(struct kfifo *fifo, u8 val)
+static void put_fifo_with_discard(struct aspeed_lpc_snoop_channel *chan, u8 val)
 {
-	if (!kfifo_initialized(fifo))
+	if (!kfifo_initialized(&chan->fifo))
 		return;
-	if (kfifo_is_full(fifo))
-		kfifo_skip(fifo);
-	kfifo_put(fifo, val);
+	if (kfifo_is_full(&chan->fifo))
+		kfifo_skip(&chan->fifo);
+	kfifo_put(&chan->fifo, val);
+	wake_up_interruptible(&chan->wq);
 }
 
 static irqreturn_t aspeed_lpc_snoop_irq(int irq, void *arg)
@@ -97,12 +150,12 @@ static irqreturn_t aspeed_lpc_snoop_irq(int irq, void *arg)
 	if (reg & HICR6_STR_SNP0W) {
 		u8 val = (data & SNPWDR_CH0_MASK) >> SNPWDR_CH0_SHIFT;
 
-		put_fifo_with_discard(&lpc_snoop->snoop_fifo[0], val);
+		put_fifo_with_discard(&lpc_snoop->chan[0], val);
 	}
 	if (reg & HICR6_STR_SNP1W) {
 		u8 val = (data & SNPWDR_CH1_MASK) >> SNPWDR_CH1_SHIFT;
 
-		put_fifo_with_discard(&lpc_snoop->snoop_fifo[1], val);
+		put_fifo_with_discard(&lpc_snoop->chan[1], val);
 	}
 
 	return IRQ_HANDLED;
@@ -139,12 +192,22 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 	const struct aspeed_lpc_snoop_model_data *model_data =
 		of_device_get_match_data(dev);
 
+	init_waitqueue_head(&lpc_snoop->chan[channel].wq);
 	/* Create FIFO datastructure */
-	rc = kfifo_alloc(&lpc_snoop->snoop_fifo[channel],
+	rc = kfifo_alloc(&lpc_snoop->chan[channel].fifo,
 			 SNOOP_FIFO_SIZE, GFP_KERNEL);
 	if (rc)
 		return rc;
 
+	lpc_snoop->chan[channel].miscdev.minor = MISC_DYNAMIC_MINOR;
+	lpc_snoop->chan[channel].miscdev.name =
+		devm_kasprintf(dev, GFP_KERNEL, "%s%d", DEVICE_NAME, channel);
+	lpc_snoop->chan[channel].miscdev.fops = &snoop_fops;
+	lpc_snoop->chan[channel].miscdev.parent = dev;
+	rc = misc_register(&lpc_snoop->chan[channel].miscdev);
+	if (rc)
+		return rc;
+
 	/* Enable LPC snoop channel at requested port */
 	switch (channel) {
 	case 0:
@@ -191,7 +254,8 @@ static void aspeed_lpc_disable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 		return;
 	}
 
-	kfifo_free(&lpc_snoop->snoop_fifo[channel]);
+	kfifo_free(&lpc_snoop->chan[channel].fifo);
+	misc_deregister(&lpc_snoop->chan[channel].miscdev);
 }
 
 static int aspeed_lpc_snoop_probe(struct platform_device *pdev)
-- 
2.18.0.203.gfac676dfb9-goog
