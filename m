Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40hRxp0dFNzF2TN
 for <openbmc@lists.ozlabs.org>; Thu, 10 May 2018 18:59:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="E5lY6NqL"; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1023)
 id 40hRxn5JmJz9s3Z; Thu, 10 May 2018 18:59:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1525942797; bh=HOA6FArbJnxFBer2EOk7Sha+ddWuLmLaOkxgxvnplyQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=E5lY6NqLZdevnfKVGL1thQbvFVqND+9/rz/wlmY+UJ+0GJkWkNDonye2Sl4XjZQjM
 8GB4Ho79ZyQZiJkUBflroFt0a9fblFIU9ltCJHx2azA5cyUmuLgRApQvpxwM3hU+XO
 /Gchz/pXlfxENWGSiuQ0Gkfr/VglS0KYGC6bcaNpZ1XEYMKoIeUgBFPaZr6wu3sImG
 SsKdtvJlRadl41MfPcRV4pVsoINtLuXSuUs7+Fb5wK6CFDSt8s0n0HxDff7bikBZB8
 1qRfTkXwyd4vgK5BxXHgM2YMsq56brqBSN+TK9tU5NkkGjXbth8G22blxLe4ow3rFO
 d4jN4XuK9ptJA==
From: Jeremy Kerr <jk@ozlabs.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13 2/2] fsi/gpio: wip: Use relative-addressing
 commands
Date: Thu, 10 May 2018 16:59:38 +0800
Message-Id: <20180510085938.27137-2-jk@ozlabs.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180510085938.27137-1-jk@ozlabs.org>
References: <20180510085938.27137-1-jk@ozlabs.org>
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
X-List-Received-Date: Thu, 10 May 2018 08:59:58 -0000

FSI CFAMs support shorter commands that use a relative (or same) address
as the last. This change introduces a last_addr to the master state, and
uses it for subsequent reads/writes, and performs relative addressing
when a subsequent read/write is in range.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 drivers/fsi/fsi-master-gpio.c | 109 +++++++++++++++++++++++++++++++++++++-----
 1 file changed, 98 insertions(+), 11 deletions(-)

diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
index d8895dffe754..50b6ebdb8b77 100644
--- a/drivers/fsi/fsi-master-gpio.c
+++ b/drivers/fsi/fsi-master-gpio.c
@@ -28,6 +28,8 @@
 #define	FSI_GPIO_CMD_DPOLL      0x2
 #define	FSI_GPIO_CMD_TERM	0x3f
 #define FSI_GPIO_CMD_ABS_AR	0x4
+#define FSI_GPIO_CMD_REL_AR	0x5
+#define FSI_GPIO_CMD_SAME_AR	0x3	/* but only a 2-bit opcode... */
 
 #define	FSI_GPIO_DPOLL_CLOCKS	100      /* < 21 will cause slave to hang */
 
@@ -51,6 +53,8 @@
 #define	FSI_GPIO_MSG_RESPID_SIZE	2
 #define	FSI_GPIO_PRIME_SLAVE_CLOCKS	100
 
+#define LAST_ADDR_INVALID		0x1
+
 struct fsi_master_gpio {
 	struct fsi_master	master;
 	struct device		*dev;
@@ -62,6 +66,8 @@ struct fsi_master_gpio {
 	struct gpio_desc	*gpio_enable;	/* FSI enable */
 	struct gpio_desc	*gpio_mux;	/* Mux control */
 	bool			external_mode;
+
+	uint32_t		last_addr;
 };
 
 #define CREATE_TRACE_POINTS
@@ -192,22 +198,95 @@ static void msg_push_crc(struct fsi_gpio_msg *msg)
 	msg_push_bits(msg, crc, 4);
 }
 
+static bool check_same_address(struct fsi_master_gpio *master, int id,
+		uint32_t addr)
+{
+	/* this will also handle LAST_ADDR_INVALID */
+	return master->last_addr == ((id & 0x3) << 21) && (addr & ~0x3);
+}
+
+static bool check_relative_address(struct fsi_master_gpio *master, int id,
+		uint32_t addr, uint32_t *rel_addrp)
+{
+	uint32_t word_addr, last_addr = master->last_addr;
+	int16_t rel_addr;
+
+	if (last_addr == LAST_ADDR_INVALID)
+		return false;
+
+	/* We may be in 23-bit addressing mode, which uses the id as the
+	 * top two address bits. So, if we're referencing a different ID,
+	 * use absolute addresses
+	 */
+	if (((last_addr >> 21) & 0x3) != id)
+		return false;
+
+	word_addr = addr & ~0x3;
+
+	/* calculate offset, including sign bit (at 0x100) */
+	if (word_addr > last_addr) {
+		if (word_addr - last_addr > 255)
+			return false;
+		rel_addr = word_addr - last_addr;
+	} else {
+		if (last_addr - word_addr > 255)
+			return false;
+		rel_addr = (word_addr - last_addr) & 0xff;
+		rel_addr |= 0x100;
+	}
+
+	rel_addr |= addr & 0x3;
+	*rel_addrp = rel_addr;
+
+	return true;
+}
+
+static void last_address_update(struct fsi_master_gpio *master,
+		int id, bool valid, uint32_t addr)
+{
+	if (!valid)
+		master->last_addr = LAST_ADDR_INVALID;
+	else
+		master->last_addr = ((id & 0x3) << 21) | (addr & ~0x3);
+}
+
 /*
- * Encode an Absolute Address command
+ * Encode an Absolute/Relative/Same Address command
  */
-static void build_abs_ar_command(struct fsi_gpio_msg *cmd,
-		uint8_t id, uint32_t addr, size_t size, const void *data)
+static void build_ar_command(struct fsi_master_gpio *master,
+		struct fsi_gpio_msg *cmd, uint8_t id,
+		uint32_t addr, size_t size, const void *data)
 {
+	int i, addr_bits, opcode_bits;
 	bool write = !!data;
-	uint8_t ds;
-	int i;
+	uint8_t ds, opcode;
+	uint32_t rel_addr;
 
 	cmd->bits = 0;
 	cmd->msg = 0;
 
-	msg_push_bits(cmd, id, 2);
-	msg_push_bits(cmd, FSI_GPIO_CMD_ABS_AR, 3);
-	msg_push_bits(cmd, write ? 0 : 1, 1);
+	/* we have 21 bits of address max */
+	addr &= ((1 << 21) - 1);
+
+	/* cmd opcodes are variable length - SAME_AR is only two bits */
+	opcode_bits = 3;
+
+	if (check_same_address(master, id, addr)) {
+		/* we still address the byte offset within the word */
+		addr_bits = 2;
+		opcode_bits = 2;
+		opcode = FSI_GPIO_CMD_SAME_AR;
+
+	} else if (check_relative_address(master, id, addr, &rel_addr)) {
+		/* 8 bits plus sign */
+		addr_bits = 9;
+		addr = rel_addr;
+		opcode = FSI_GPIO_CMD_REL_AR;
+
+	} else {
+		addr_bits = 21;
+		opcode = FSI_GPIO_CMD_ABS_AR;
+	}
 
 	/*
 	 * The read/write size is encoded in the lower bits of the address
@@ -224,7 +303,10 @@ static void build_abs_ar_command(struct fsi_gpio_msg *cmd,
 	if (size == 4)
 		addr |= 1;
 
-	msg_push_bits(cmd, addr & ((1 << 21) - 1), 21);
+	msg_push_bits(cmd, id, 2);
+	msg_push_bits(cmd, opcode, opcode_bits);
+	msg_push_bits(cmd, write ? 0 : 1, 1);
+	msg_push_bits(cmd, addr, addr_bits);
 	msg_push_bits(cmd, ds, 1);
 	for (i = 0; write && i < size; i++)
 		msg_push_bits(cmd, ((uint8_t *)data)[i], 8);
@@ -468,8 +550,9 @@ static int fsi_master_gpio_read(struct fsi_master *_master, int link,
 		return -ENODEV;
 
 	mutex_lock(&master->cmd_lock);
-	build_abs_ar_command(&cmd, id, addr, size, NULL);
+	build_ar_command(master, &cmd, id, addr, size, NULL);
 	rc = fsi_master_gpio_xfer(master, id, &cmd, size, val);
+	last_address_update(master, id, rc == 0, addr);
 	mutex_unlock(&master->cmd_lock);
 
 	return rc;
@@ -486,8 +569,9 @@ static int fsi_master_gpio_write(struct fsi_master *_master, int link,
 		return -ENODEV;
 
 	mutex_lock(&master->cmd_lock);
-	build_abs_ar_command(&cmd, id, addr, size, val);
+	build_ar_command(master, &cmd, id, addr, size, val);
 	rc = fsi_master_gpio_xfer(master, id, &cmd, 0, NULL);
+	last_address_update(master, id, rc == 0, addr);
 	mutex_unlock(&master->cmd_lock);
 
 	return rc;
@@ -506,6 +590,7 @@ static int fsi_master_gpio_term(struct fsi_master *_master,
 	mutex_lock(&master->cmd_lock);
 	build_term_command(&cmd, id);
 	rc = fsi_master_gpio_xfer(master, id, &cmd, 0, NULL);
+	last_address_update(master, id, false, 0);
 	mutex_unlock(&master->cmd_lock);
 
 	return rc;
@@ -539,6 +624,7 @@ static int fsi_master_gpio_break(struct fsi_master *_master, int link)
 	clock_toggle(master, FSI_POST_BREAK_CLOCKS);
 
 	spin_unlock_irqrestore(&master->bit_lock, flags);
+	last_address_update(master, 0, false, 0);
 	mutex_unlock(&master->cmd_lock);
 
 	/* Wait for logic reset to take effect */
@@ -649,6 +735,7 @@ static int fsi_master_gpio_probe(struct platform_device *pdev)
 	master->dev = &pdev->dev;
 	master->master.dev.parent = master->dev;
 	master->master.dev.of_node = of_node_get(dev_of_node(master->dev));
+	master->last_addr = LAST_ADDR_INVALID;
 
 	gpio = devm_gpiod_get(&pdev->dev, "clock", 0);
 	if (IS_ERR(gpio)) {
-- 
2.14.1
