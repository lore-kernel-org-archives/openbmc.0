Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="mqph+91C"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="LbptwFk0"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zhwlS20jgzF1G7
 for <openbmc@lists.ozlabs.org>; Thu, 15 Feb 2018 23:37:20 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 2B4DB20E2C;
 Thu, 15 Feb 2018 07:37:18 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 15 Feb 2018 07:37:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=3Flw5bKwz0akDe0/p
 tqR6J/RXTK9/iHsm1mrNeGeBhw=; b=mqph+91CPAbGnWOszeAYdljRyKxcm1JOZ
 nVPm7WRV9uvIYblj5cPinJxUOu6V/Ta/3I91PnZwqYxPQ5KDKw2uTbe1XtJhRO2s
 sMXCUY0u78Vx3dIjpeTkVtPSc5q+WzH4qVWonLiaRW4hw8NuA9gaf2/W2VbeKbXY
 ZVXL8Bo09ecArt8+1R8iQXGr8gdwqD4SxW8gkayZmGteWIrdEPTZIYWvJ8/f9+Ti
 cdKcguzvKJegKd6bOWdj8qjXIOBLyhL3WurHu/QAIicDnXTW649mAUA7En2POSrF
 xLHPx4KFo65+caQDldenQHI3bs9a6i5qTOpfEzYwOztvTBiZs3mJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=3Flw5bKwz0akDe0/ptqR6J/RXTK9/iHsm1mrNeGeBhw=; b=LbptwFk0
 UpYTCp7ctoGk9ypVkGGa9cp9nkjUT8o8EZUNb0G/Ms9e0T6JhycMDFBsBLPXjPjq
 wQ9TTJ8wFChd94jYOQ8snOzcf2AYjOrLDYzjMVktXY8Ebx2eYDUw5xTlcOc/Vo9X
 fa57gI3881DbzDYaFzUyiXBd6SeBjhJHwYzkMdvtvijUmz/KnQhyKIZNbpv3+lFC
 CCwnur3Z8wM+DKoz6iiYhRsRCqwemOEVUGULEg93H/9SbAISFNLP0xsZoK2if7E/
 e0nMaEYVWhgq7Nil33ac+3M13zTk4POiFmbX1VFpVuxL2gu42keoA/1hffNPKcfn
 eu6DGR08H1ohGg==
X-ME-Sender: <xms:_n6FWqADTgazR2wqZZWX89nVkrFuyOcCFP4bohaZ8VQz12g1mNtFmw>
Received: from dave.aj.id.au (ppp118-210-154-2.bras1.adl6.internode.on.net
 [118.210.154.2])
 by mail.messagingengine.com (Postfix) with ESMTPA id 829AE7E542;
 Thu, 15 Feb 2018 07:37:15 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au, jk@ozlabs.org, eajames@linux.vnet.ibm.com,
 bradleyb@fuzziesquirrel.com, cbostic@linux.vnet.ibm.com
Cc: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 15/16] fsi: gpio: Update to upstream
Date: Thu, 15 Feb 2018 23:06:05 +1030
Message-Id: <20180215123606.25777-16-andrew@aj.id.au>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180215123606.25777-1-andrew@aj.id.au>
References: <20180215123606.25777-1-andrew@aj.id.au>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Feb 2018 12:37:25 -0000

Patch was generated against v4.14.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/fsi/fsi-master-gpio.c | 97 ++++++++++++++++++-------------------------
 1 file changed, 40 insertions(+), 57 deletions(-)

diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
index 485ecb88b115..b53e7a304891 100644
--- a/drivers/fsi/fsi-master-gpio.c
+++ b/drivers/fsi/fsi-master-gpio.c
@@ -2,14 +2,15 @@
  * A FSI master controller, using a simple GPIO bit-banging interface
  */
 
-#include <linux/platform_device.h>
-#include <linux/gpio/consumer.h>
-#include <linux/module.h>
-#include <linux/of.h>
+#include <linux/crc4.h>
 #include <linux/delay.h>
-#include <linux/fsi.h>
 #include <linux/device.h>
+#include <linux/fsi.h>
+#include <linux/gpio/consumer.h>
 #include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 
@@ -50,11 +51,10 @@
 #define	FSI_GPIO_MSG_RESPID_SIZE	2
 #define	FSI_GPIO_PRIME_SLAVE_CLOCKS	100
 
-static DEFINE_SPINLOCK(fsi_gpio_cmd_lock);	/* lock around fsi commands */
-
 struct fsi_master_gpio {
 	struct fsi_master	master;
 	struct device		*dev;
+	spinlock_t		cmd_lock;	/* Lock for commands */
 	struct gpio_desc	*gpio_clk;
 	struct gpio_desc	*gpio_data;
 	struct gpio_desc	*gpio_trans;	/* Voltage translator */
@@ -102,14 +102,12 @@ static void sda_out(struct fsi_master_gpio *master, int value)
 static void set_sda_input(struct fsi_master_gpio *master)
 {
 	gpiod_direction_input(master->gpio_data);
-	if (master->gpio_trans)
-		gpiod_set_value(master->gpio_trans, 0);
+	gpiod_set_value(master->gpio_trans, 0);
 }
 
 static void set_sda_output(struct fsi_master_gpio *master, int value)
 {
-	if (master->gpio_trans)
-		gpiod_set_value(master->gpio_trans, 1);
+	gpiod_set_value(master->gpio_trans, 1);
 	gpiod_direction_output(master->gpio_data, value);
 }
 
@@ -130,7 +128,7 @@ static void serial_in(struct fsi_master_gpio *master, struct fsi_gpio_msg *msg,
 		clock_toggle(master, 1);
 		in_bit = sda_in(master);
 		msg->msg <<= 1;
-		msg->msg |= ~in_bit & 0x1;	/* Data is negative active */
+		msg->msg |= ~in_bit & 0x1;	/* Data is active low */
 	}
 	msg->bits += num_bits;
 
@@ -141,7 +139,7 @@ static void serial_out(struct fsi_master_gpio *master,
 			const struct fsi_gpio_msg *cmd)
 {
 	uint8_t bit;
-	uint64_t msg = ~cmd->msg;	/* Data is negative active */
+	uint64_t msg = ~cmd->msg;	/* Data is active low */
 	uint64_t sda_mask = 0x1ULL << (cmd->bits - 1);
 	uint64_t last_bit = ~0;
 	int next_bit;
@@ -185,16 +183,17 @@ static void msg_push_crc(struct fsi_gpio_msg *msg)
 	top = msg->bits & 0x3;
 
 	/* start bit, and any non-aligned top bits */
-	crc = fsi_crc4(0,
-			1 << top | msg->msg >> (msg->bits - top),
-			top + 1);
+	crc = crc4(0, 1 << top | msg->msg >> (msg->bits - top), top + 1);
 
 	/* aligned bits */
-	crc = fsi_crc4(crc, msg->msg, msg->bits - top);
+	crc = crc4(crc, msg->msg, msg->bits - top);
 
 	msg_push_bits(msg, crc, 4);
 }
 
+/*
+ * Encode an Absolute Address command
+ */
 static void build_abs_ar_command(struct fsi_gpio_msg *cmd,
 		uint8_t id, uint32_t addr, size_t size, const void *data)
 {
@@ -271,7 +270,7 @@ static int read_one_response(struct fsi_master_gpio *master,
 		uint8_t data_size, struct fsi_gpio_msg *msgp, uint8_t *tagp)
 {
 	struct fsi_gpio_msg msg;
-	uint8_t id, tag;
+	uint8_t tag;
 	uint32_t crc;
 	int i;
 
@@ -283,7 +282,7 @@ static int read_one_response(struct fsi_master_gpio *master,
 		if (msg.msg)
 			break;
 	}
-	if (i >= FSI_GPIO_MTOE_COUNT) {
+	if (i == FSI_GPIO_MTOE_COUNT) {
 		dev_dbg(master->dev,
 			"Master time out waiting for response\n");
 		fsi_master_gpio_error(master, FSI_GPIO_MTOE);
@@ -296,12 +295,9 @@ static int read_one_response(struct fsi_master_gpio *master,
 	/* Read slave ID & response tag */
 	serial_in(master, &msg, 4);
 
-	id = (msg.msg >> FSI_GPIO_MSG_RESPID_SIZE) & 0x3;
 	tag = msg.msg & 0x3;
 
-	/* if we have an ACK, and we're expecting data, clock the
-	 * data in too
-	 */
+	/* If we have an ACK and we're expecting data, clock the data in too */
 	if (tag == FSI_GPIO_RESP_ACK && data_size)
 		serial_in(master, &msg, data_size * 8);
 
@@ -309,8 +305,8 @@ static int read_one_response(struct fsi_master_gpio *master,
 	serial_in(master, &msg, FSI_GPIO_CRC_SIZE);
 
 	/* we have a whole message now; check CRC */
-	crc = fsi_crc4(0, 1, 1);
-	crc = fsi_crc4(crc, msg.msg, msg.bits);
+	crc = crc4(0, 1, 1);
+	crc = crc4(crc, msg.msg, msg.bits);
 	if (crc) {
 		dev_dbg(master->dev, "ERR response CRC\n");
 		fsi_master_gpio_error(master, FSI_GPIO_CRC_INVAL);
@@ -336,7 +332,7 @@ static int issue_term(struct fsi_master_gpio *master, uint8_t slave)
 	echo_delay(master);
 
 	rc = read_one_response(master, 0, NULL, &tag);
-	if (rc) {
+	if (rc < 0) {
 		dev_err(master->dev,
 				"TERM failed; lost communication with slave\n");
 		return -EIO;
@@ -354,6 +350,7 @@ static int poll_for_response(struct fsi_master_gpio *master,
 	struct fsi_gpio_msg response, cmd;
 	int busy_count = 0, rc, i;
 	uint8_t tag;
+	uint8_t *data_byte = data;
 
 retry:
 	rc = read_one_response(master, size, &response, &tag);
@@ -369,8 +366,7 @@ static int poll_for_response(struct fsi_master_gpio *master,
 			val &= (1ull << (size * 8)) - 1;
 
 			for (i = 0; i < size; i++) {
-				((uint8_t *)data)[size-i-1] =
-					val & 0xff;
+				data_byte[size-i-1] = val;
 				val >>= 8;
 			}
 		}
@@ -418,15 +414,15 @@ static int fsi_master_gpio_xfer(struct fsi_master_gpio *master, uint8_t slave,
 	unsigned long flags;
 	int rc;
 
-	spin_lock_irqsave(&fsi_gpio_cmd_lock, flags);
+	spin_lock_irqsave(&master->cmd_lock, flags);
 	if (master->external_mode) {
-		spin_unlock_irqrestore(&fsi_gpio_cmd_lock, flags);
+		spin_unlock_irqrestore(&master->cmd_lock, flags);
 		return -EBUSY;
 	}
 	serial_out(master, cmd);
 	echo_delay(master);
 	rc = poll_for_response(master, slave, resp_len, resp);
-	spin_unlock_irqrestore(&fsi_gpio_cmd_lock, flags);
+	spin_unlock_irqrestore(&master->cmd_lock, flags);
 
 	return rc;
 }
@@ -470,9 +466,6 @@ static int fsi_master_gpio_term(struct fsi_master *_master,
 	return fsi_master_gpio_xfer(master, id, &cmd, 0, NULL);
 }
 
-/*
- * Issue a break command on link
- */
 static int fsi_master_gpio_break(struct fsi_master *_master, int link)
 {
 	struct fsi_master_gpio *master = to_fsi_master_gpio(_master);
@@ -483,9 +476,9 @@ static int fsi_master_gpio_break(struct fsi_master *_master, int link)
 
 	trace_fsi_master_gpio_break(master);
 
-	spin_lock_irqsave(&fsi_gpio_cmd_lock, flags);
+	spin_lock_irqsave(&master->cmd_lock, flags);
 	if (master->external_mode) {
-		spin_unlock_irqrestore(&fsi_gpio_cmd_lock, flags);
+		spin_unlock_irqrestore(&master->cmd_lock, flags);
 		return -EBUSY;
 	}
 	set_sda_output(master, 1);
@@ -496,7 +489,7 @@ static int fsi_master_gpio_break(struct fsi_master *_master, int link)
 	echo_delay(master);
 	sda_out(master, 1);
 	clock_toggle(master, FSI_POST_BREAK_CLOCKS);
-	spin_unlock_irqrestore(&fsi_gpio_cmd_lock, flags);
+	spin_unlock_irqrestore(&master->cmd_lock, flags);
 
 	/* Wait for logic reset to take effect */
 	udelay(200);
@@ -506,12 +499,9 @@ static int fsi_master_gpio_break(struct fsi_master *_master, int link)
 
 static void fsi_master_gpio_init(struct fsi_master_gpio *master)
 {
-	if (master->gpio_mux)
-		gpiod_direction_output(master->gpio_mux, 1);
-	if (master->gpio_trans)
-		gpiod_direction_output(master->gpio_trans, 1);
-	if (master->gpio_enable)
-		gpiod_direction_output(master->gpio_enable, 1);
+	gpiod_direction_output(master->gpio_mux, 1);
+	gpiod_direction_output(master->gpio_trans, 1);
+	gpiod_direction_output(master->gpio_enable, 1);
 	gpiod_direction_output(master->gpio_clk, 1);
 	gpiod_direction_output(master->gpio_data, 1);
 
@@ -537,12 +527,12 @@ static int fsi_master_gpio_link_enable(struct fsi_master *_master, int link)
 	if (link != 0)
 		return -ENODEV;
 
-	spin_lock_irqsave(&fsi_gpio_cmd_lock, flags);
+	spin_lock_irqsave(&master->cmd_lock, flags);
 	if (!master->external_mode && master->gpio_enable) {
 		gpiod_set_value(master->gpio_enable, 1);
 		rc = 0;
 	}
-	spin_unlock_irqrestore(&fsi_gpio_cmd_lock, flags);
+	spin_unlock_irqrestore(&master->cmd_lock, flags);
 
 	return rc;
 }
@@ -570,10 +560,10 @@ static ssize_t external_mode_store(struct device *dev,
 
 	external_mode = !!val;
 
-	spin_lock_irqsave(&fsi_gpio_cmd_lock, flags);
+	spin_lock_irqsave(&master->cmd_lock, flags);
 
 	if (external_mode == master->external_mode) {
-		spin_unlock_irqrestore(&fsi_gpio_cmd_lock, flags);
+		spin_unlock_irqrestore(&master->cmd_lock, flags);
 		return count;
 	}
 
@@ -582,7 +572,7 @@ static ssize_t external_mode_store(struct device *dev,
 		fsi_master_gpio_init_external(master);
 	else
 		fsi_master_gpio_init(master);
-	spin_unlock_irqrestore(&fsi_gpio_cmd_lock, flags);
+	spin_unlock_irqrestore(&master->cmd_lock, flags);
 
 	fsi_master_rescan(&master->master);
 
@@ -592,10 +582,6 @@ static ssize_t external_mode_store(struct device *dev,
 static DEVICE_ATTR(external_mode, 0664,
 		external_mode_show, external_mode_store);
 
-static void fsi_master_gpio_release(struct device *dev)
-{
-}
-
 static int fsi_master_gpio_probe(struct platform_device *pdev)
 {
 	struct fsi_master_gpio *master;
@@ -608,8 +594,6 @@ static int fsi_master_gpio_probe(struct platform_device *pdev)
 
 	master->dev = &pdev->dev;
 	master->master.dev.parent = master->dev;
-	master->master.dev.of_node = of_node_get(dev_of_node(master->dev));
-	master->master.dev.release = fsi_master_gpio_release;
 
 	gpio = devm_gpiod_get(&pdev->dev, "clock", 0);
 	if (IS_ERR(gpio)) {
@@ -655,6 +639,7 @@ static int fsi_master_gpio_probe(struct platform_device *pdev)
 	master->master.send_break = fsi_master_gpio_break;
 	master->master.link_enable = fsi_master_gpio_link_enable;
 	platform_set_drvdata(pdev, master);
+	spin_lock_init(&master->cmd_lock);
 
 	fsi_master_gpio_init(master);
 
@@ -662,9 +647,7 @@ static int fsi_master_gpio_probe(struct platform_device *pdev)
 	if (rc)
 		return rc;
 
-	fsi_master_register(&master->master);
-
-	return 0;
+	return fsi_master_register(&master->master);
 }
 
 
-- 
2.14.1
