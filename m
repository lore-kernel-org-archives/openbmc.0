Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="kykfa3WH"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="lLLX3SG2"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zhwlS3bt8zF1GL
 for <openbmc@lists.ozlabs.org>; Thu, 15 Feb 2018 23:37:23 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3846E20E6B;
 Thu, 15 Feb 2018 07:37:21 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 15 Feb 2018 07:37:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=s/xScEoWomCQLimpz
 HVUwEMpEtcGuBmd+5pLiGRe4uQ=; b=kykfa3WHI7/eW+JFeIWv7da7c2tmyRl3v
 7XKP+bPhSENVPw2Od4fj6iGeirSisemmXd0NTw6PlLTZEGKr6d+JgUGR/oN/RUAZ
 5WZX3FStFM7AcwoLSZZarJ70/JxXV0JbwBVlifjV9UPyV+6+t43FlljeWyb2Qt3y
 9lRHML3OlPZemQwBBzoHjmtaPJhTlRPbo3UWandZiFlsHaObDMqJwjhnSWFq6vPD
 gtZfuqDwex2f5Fhc1KWXONi3lldGsmpqryNPT6pyMF+147Ukg5CvsUYcRl6po6mv
 7xrhHwRQQyKjl/cih4iIeCBlp4BMYkAD5yd+N3YgvYIQWzGEkmFJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=s/xScEoWomCQLimpzHVUwEMpEtcGuBmd+5pLiGRe4uQ=; b=lLLX3SG2
 jXv/fZk7mIOJH0ko35JKQERZ27UyvInvLSImMyL2pPbaTVpU07mFMss6xJyAlJ8p
 MChAIRgtyaAefugDZRY4HeaYQgWJIgZGqALG/7gXtAm34yMScoxjI6Lo8jBjVq/v
 iqSafJ0bhgxndWiFz9KLUPpUE59YuCnOPqb0V8SwBFHU0EFT+IfC4toQBD1gSIwx
 7RHQRj5jP7g6y+TJEmd3yJBKCqxoVEUbjnlQh6OTiT5YqhDvUfvpmGF8Na5i21Gi
 39HO9c1eKG+qAPm5fninDNmJIN2/9EU7BD2LUFTO9DDmoFRerIekMv/nAmCMDRZ+
 LbYM+Y3AjET5/A==
X-ME-Sender: <xms:AX-FWuIYRu5qzt01JeCdBj7Z15OhV8fYyssZ6sjlhDWI8cfFTm0a7Q>
Received: from dave.aj.id.au (ppp118-210-154-2.bras1.adl6.internode.on.net
 [118.210.154.2])
 by mail.messagingengine.com (Postfix) with ESMTPA id 707B87E542;
 Thu, 15 Feb 2018 07:37:18 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au, jk@ozlabs.org, eajames@linux.vnet.ibm.com,
 bradleyb@fuzziesquirrel.com, cbostic@linux.vnet.ibm.com
Cc: openbmc@lists.ozlabs.org,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-4.10 16/16] fsi: gpio: Use a mutex to protect
 transfers
Date: Thu, 15 Feb 2018 23:06:06 +1030
Message-Id: <20180215123606.25777-17-andrew@aj.id.au>
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
X-List-Received-Date: Thu, 15 Feb 2018 12:37:26 -0000

From: Jeremy Kerr <jk@ozlabs.org>

Reduce time spent with interrupts disabled by limiting the critical sections to
bitbanging FSI symbols. We only need to ensure exclusive use of the bus for an
entire transfer, not that the transfer be performed in atomic context.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/fsi/fsi-master-gpio.c | 92 ++++++++++++++++++++++++++++++++-----------
 1 file changed, 68 insertions(+), 24 deletions(-)

diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
index b53e7a304891..04b0b48f4d03 100644
--- a/drivers/fsi/fsi-master-gpio.c
+++ b/drivers/fsi/fsi-master-gpio.c
@@ -54,7 +54,8 @@
 struct fsi_master_gpio {
 	struct fsi_master	master;
 	struct device		*dev;
-	spinlock_t		cmd_lock;	/* Lock for commands */
+	struct mutex		cmd_lock;	/* mutex for command ordering */
+	spinlock_t		bit_lock;	/* lock for clocking bits out */
 	struct gpio_desc	*gpio_clk;
 	struct gpio_desc	*gpio_data;
 	struct gpio_desc	*gpio_trans;	/* Voltage translator */
@@ -270,10 +271,13 @@ static int read_one_response(struct fsi_master_gpio *master,
 		uint8_t data_size, struct fsi_gpio_msg *msgp, uint8_t *tagp)
 {
 	struct fsi_gpio_msg msg;
-	uint8_t tag;
+	unsigned long flags;
 	uint32_t crc;
+	uint8_t tag;
 	int i;
 
+	spin_lock_irqsave(&master->bit_lock, flags);
+
 	/* wait for the start bit */
 	for (i = 0; i < FSI_GPIO_MTOE_COUNT; i++) {
 		msg.bits = 0;
@@ -286,6 +290,7 @@ static int read_one_response(struct fsi_master_gpio *master,
 		dev_dbg(master->dev,
 			"Master time out waiting for response\n");
 		fsi_master_gpio_error(master, FSI_GPIO_MTOE);
+		spin_unlock_irqrestore(&master->bit_lock, flags);
 		return -EIO;
 	}
 
@@ -304,6 +309,8 @@ static int read_one_response(struct fsi_master_gpio *master,
 	/* read CRC */
 	serial_in(master, &msg, FSI_GPIO_CRC_SIZE);
 
+	spin_unlock_irqrestore(&master->bit_lock, flags);
+
 	/* we have a whole message now; check CRC */
 	crc = crc4(0, 1, 1);
 	crc = crc4(crc, msg.msg, msg.bits);
@@ -324,12 +331,16 @@ static int read_one_response(struct fsi_master_gpio *master,
 static int issue_term(struct fsi_master_gpio *master, uint8_t slave)
 {
 	struct fsi_gpio_msg cmd;
+	unsigned long flags;
 	uint8_t tag;
 	int rc;
 
 	build_term_command(&cmd, slave);
+
+	spin_lock_irqsave(&master->bit_lock, flags);
 	serial_out(master, &cmd);
 	echo_delay(master);
+	spin_unlock_irqrestore(&master->bit_lock, flags);
 
 	rc = read_one_response(master, 0, NULL, &tag);
 	if (rc < 0) {
@@ -349,6 +360,7 @@ static int poll_for_response(struct fsi_master_gpio *master,
 {
 	struct fsi_gpio_msg response, cmd;
 	int busy_count = 0, rc, i;
+	unsigned long flags;
 	uint8_t tag;
 	uint8_t *data_byte = data;
 
@@ -377,15 +389,20 @@ static int poll_for_response(struct fsi_master_gpio *master,
 		 * d-poll, not indicated in the hardware protocol
 		 * spec. < 20 clocks causes slave to hang, 21 ok.
 		 */
-		clock_zeros(master, FSI_GPIO_DPOLL_CLOCKS);
 		if (busy_count++ < FSI_GPIO_MAX_BUSY) {
 			build_dpoll_command(&cmd, slave);
+			spin_lock_irqsave(&master->bit_lock, flags);
+			clock_zeros(master, FSI_GPIO_DPOLL_CLOCKS);
 			serial_out(master, &cmd);
 			echo_delay(master);
+			spin_unlock_irqrestore(&master->bit_lock, flags);
 			goto retry;
 		}
 		dev_warn(master->dev,
 			"ERR slave is stuck in busy state, issuing TERM\n");
+		spin_lock_irqsave(&master->bit_lock, flags);
+		clock_zeros(master, FSI_GPIO_DPOLL_CLOCKS);
+		spin_unlock_irqrestore(&master->bit_lock, flags);
 		issue_term(master, slave);
 		rc = -EIO;
 		break;
@@ -404,25 +421,41 @@ static int poll_for_response(struct fsi_master_gpio *master,
 		trace_fsi_master_gpio_poll_response_busy(master, busy_count);
 
 	/* Clock the slave enough to be ready for next operation */
+	spin_lock_irqsave(&master->bit_lock, flags);
 	clock_zeros(master, FSI_GPIO_PRIME_SLAVE_CLOCKS);
+	spin_unlock_irqrestore(&master->bit_lock, flags);
 	return rc;
 }
 
+static int send_request(struct fsi_master_gpio *master,
+		struct fsi_gpio_msg *cmd)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&master->bit_lock, flags);
+	if (master->external_mode) {
+		spin_unlock_irqrestore(&master->bit_lock, flags);
+		return -EBUSY;
+	}
+	serial_out(master, cmd);
+	echo_delay(master);
+	spin_unlock_irqrestore(&master->bit_lock, flags);
+
+	return 0;
+}
+
 static int fsi_master_gpio_xfer(struct fsi_master_gpio *master, uint8_t slave,
 		struct fsi_gpio_msg *cmd, size_t resp_len, void *resp)
 {
-	unsigned long flags;
 	int rc;
 
-	spin_lock_irqsave(&master->cmd_lock, flags);
-	if (master->external_mode) {
-		spin_unlock_irqrestore(&master->cmd_lock, flags);
-		return -EBUSY;
-	}
-	serial_out(master, cmd);
-	echo_delay(master);
-	rc = poll_for_response(master, slave, resp_len, resp);
-	spin_unlock_irqrestore(&master->cmd_lock, flags);
+	mutex_lock(&master->cmd_lock);
+
+	rc = send_request(master, cmd);
+	if (!rc)
+		rc = poll_for_response(master, slave, resp_len, resp);
+
+	mutex_unlock(&master->cmd_lock);
 
 	return rc;
 }
@@ -476,11 +509,14 @@ static int fsi_master_gpio_break(struct fsi_master *_master, int link)
 
 	trace_fsi_master_gpio_break(master);
 
-	spin_lock_irqsave(&master->cmd_lock, flags);
+	mutex_lock(&master->cmd_lock);
 	if (master->external_mode) {
-		spin_unlock_irqrestore(&master->cmd_lock, flags);
+		mutex_unlock(&master->cmd_lock);
 		return -EBUSY;
 	}
+
+	spin_lock_irqsave(&master->bit_lock, flags);
+
 	set_sda_output(master, 1);
 	sda_out(master, 1);
 	clock_toggle(master, FSI_PRE_BREAK_CLOCKS);
@@ -489,7 +525,9 @@ static int fsi_master_gpio_break(struct fsi_master *_master, int link)
 	echo_delay(master);
 	sda_out(master, 1);
 	clock_toggle(master, FSI_POST_BREAK_CLOCKS);
-	spin_unlock_irqrestore(&master->cmd_lock, flags);
+
+	spin_unlock_irqrestore(&master->bit_lock, flags);
+	mutex_unlock(&master->cmd_lock);
 
 	/* Wait for logic reset to take effect */
 	udelay(200);
@@ -499,6 +537,8 @@ static int fsi_master_gpio_break(struct fsi_master *_master, int link)
 
 static void fsi_master_gpio_init(struct fsi_master_gpio *master)
 {
+	unsigned long flags;
+
 	gpiod_direction_output(master->gpio_mux, 1);
 	gpiod_direction_output(master->gpio_trans, 1);
 	gpiod_direction_output(master->gpio_enable, 1);
@@ -506,7 +546,9 @@ static void fsi_master_gpio_init(struct fsi_master_gpio *master)
 	gpiod_direction_output(master->gpio_data, 1);
 
 	/* todo: evaluate if clocks can be reduced */
+	spin_lock_irqsave(&master->bit_lock, flags);
 	clock_zeros(master, FSI_INIT_CLOCKS);
+	spin_unlock_irqrestore(&master->bit_lock, flags);
 }
 
 static void fsi_master_gpio_init_external(struct fsi_master_gpio *master)
@@ -521,18 +563,17 @@ static void fsi_master_gpio_init_external(struct fsi_master_gpio *master)
 static int fsi_master_gpio_link_enable(struct fsi_master *_master, int link)
 {
 	struct fsi_master_gpio *master = to_fsi_master_gpio(_master);
-	unsigned long flags;
 	int rc = -EBUSY;
 
 	if (link != 0)
 		return -ENODEV;
 
-	spin_lock_irqsave(&master->cmd_lock, flags);
+	mutex_lock(&master->cmd_lock);
 	if (!master->external_mode && master->gpio_enable) {
 		gpiod_set_value(master->gpio_enable, 1);
 		rc = 0;
 	}
-	spin_unlock_irqrestore(&master->cmd_lock, flags);
+	mutex_unlock(&master->cmd_lock);
 
 	return rc;
 }
@@ -550,7 +591,7 @@ static ssize_t external_mode_store(struct device *dev,
 		struct device_attribute *attr, const char *buf, size_t count)
 {
 	struct fsi_master_gpio *master = dev_get_drvdata(dev);
-	unsigned long flags, val;
+	unsigned long val;
 	bool external_mode;
 	int err;
 
@@ -560,10 +601,10 @@ static ssize_t external_mode_store(struct device *dev,
 
 	external_mode = !!val;
 
-	spin_lock_irqsave(&master->cmd_lock, flags);
+	mutex_lock(&master->cmd_lock);
 
 	if (external_mode == master->external_mode) {
-		spin_unlock_irqrestore(&master->cmd_lock, flags);
+		mutex_unlock(&master->cmd_lock);
 		return count;
 	}
 
@@ -572,7 +613,8 @@ static ssize_t external_mode_store(struct device *dev,
 		fsi_master_gpio_init_external(master);
 	else
 		fsi_master_gpio_init(master);
-	spin_unlock_irqrestore(&master->cmd_lock, flags);
+
+	mutex_unlock(&master->cmd_lock);
 
 	fsi_master_rescan(&master->master);
 
@@ -594,6 +636,7 @@ static int fsi_master_gpio_probe(struct platform_device *pdev)
 
 	master->dev = &pdev->dev;
 	master->master.dev.parent = master->dev;
+	master->master.dev.of_node = of_node_get(dev_of_node(master->dev));
 
 	gpio = devm_gpiod_get(&pdev->dev, "clock", 0);
 	if (IS_ERR(gpio)) {
@@ -639,7 +682,8 @@ static int fsi_master_gpio_probe(struct platform_device *pdev)
 	master->master.send_break = fsi_master_gpio_break;
 	master->master.link_enable = fsi_master_gpio_link_enable;
 	platform_set_drvdata(pdev, master);
-	spin_lock_init(&master->cmd_lock);
+	spin_lock_init(&master->bit_lock);
+	mutex_init(&master->cmd_lock);
 
 	fsi_master_gpio_init(master);
 
-- 
2.14.1
