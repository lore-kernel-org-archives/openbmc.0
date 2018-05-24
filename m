Return-Path: <benh@kernel.crashing.org>
Authentication-Results: lists.ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40ryHn0r59zF1Dt
 for <openbmc@lists.ozlabs.org>; Thu, 24 May 2018 15:15:00 +1000 (AEST)
Received: from pasglop.ozlabs.ibm.com (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w4O5EU5j003638;
 Thu, 24 May 2018 00:14:33 -0500
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13 02/10] fsi/gpio: Use relative-addressing
 commands
Date: Thu, 24 May 2018 15:14:21 +1000
Message-Id: <20180524051429.4638-2-benh@kernel.crashing.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180524051429.4638-1-benh@kernel.crashing.org>
References: <20180524051429.4638-1-benh@kernel.crashing.org>
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
X-List-Received-Date: Thu, 24 May 2018 05:15:02 -0000

From: Jeremy Kerr <jk@ozlabs.org>

FSI CFAMs support shorter commands that use a relative (or same) address
as the last. This change introduces a last_addr to the master state, and
uses it for subsequent reads/writes, and performs relative addressing
when a subsequent read/write is in range.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 drivers/fsi/fsi-master-gpio.c | 102 ++++++++++++++++++++++++++++++----
 1 file changed, 91 insertions(+), 11 deletions(-)

diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
index d50ea4849377..0a6799bda294 100644
--- a/drivers/fsi/fsi-master-gpio.c
+++ b/drivers/fsi/fsi-master-gpio.c
@@ -28,6 +28,8 @@
 #define	FSI_GPIO_CMD_DPOLL      0x2
 #define	FSI_GPIO_CMD_TERM	0x3f
 #define FSI_GPIO_CMD_ABS_AR	0x4
+#define FSI_GPIO_CMD_REL_AR	0x5
+#define FSI_GPIO_CMD_SAME_AR	0x3	/* but only a 2-bit opcode... */
 
 
 #define	FSI_GPIO_DPOLL_CLOCKS	50      /* < 21 will cause slave to hang */
@@ -52,6 +54,8 @@
 #define	FSI_GPIO_MSG_RESPID_SIZE	2
 #define	FSI_GPIO_PRIME_SLAVE_CLOCKS	20
 
+#define LAST_ADDR_INVALID		0x1
+
 struct fsi_master_gpio {
 	struct fsi_master	master;
 	struct device		*dev;
@@ -64,6 +68,7 @@ struct fsi_master_gpio {
 	struct gpio_desc	*gpio_mux;	/* Mux control */
 	bool			external_mode;
 	bool			no_delays;
+	uint32_t		last_addr;
 };
 
 #define CREATE_TRACE_POINTS
@@ -205,22 +210,89 @@ static void msg_push_crc(struct fsi_gpio_msg *msg)
 	msg_push_bits(msg, crc, 4);
 }
 
+static bool check_same_address(struct fsi_master_gpio *master, int id,
+		uint32_t addr)
+{
+	/* this will also handle LAST_ADDR_INVALID */
+	return master->last_addr == (((id & 0x3) << 21) | (addr & ~0x3));
+}
+
+static bool check_relative_address(struct fsi_master_gpio *master, int id,
+		uint32_t addr, uint32_t *rel_addrp)
+{
+	uint32_t last_addr = master->last_addr;
+	int32_t rel_addr;
+
+	if (last_addr == LAST_ADDR_INVALID)
+		return false;
+
+	/* We may be in 23-bit addressing mode, which uses the id as the
+	 * top two address bits. So, if we're referencing a different ID,
+	 * use absolute addresses.
+	 */
+	if (((last_addr >> 21) & 0x3) != id)
+		return false;
+
+	/* remove the top two bits from any 23-bit addressing */
+	last_addr &= (1 << 21) - 1;
+
+	/* We know that the addresses are limited to 21 bits, so this won't
+	 * overflow the signed rel_addr */
+	rel_addr = addr - last_addr;
+	if (rel_addr > 255 || rel_addr < -256)
+		return false;
+
+	*rel_addrp = (uint32_t)rel_addr;
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
@@ -237,7 +309,10 @@ static void build_abs_ar_command(struct fsi_gpio_msg *cmd,
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
@@ -481,8 +556,9 @@ static int fsi_master_gpio_read(struct fsi_master *_master, int link,
 		return -ENODEV;
 
 	mutex_lock(&master->cmd_lock);
-	build_abs_ar_command(&cmd, id, addr, size, NULL);
+	build_ar_command(master, &cmd, id, addr, size, NULL);
 	rc = fsi_master_gpio_xfer(master, id, &cmd, size, val);
+	last_address_update(master, id, rc == 0, addr);
 	mutex_unlock(&master->cmd_lock);
 
 	return rc;
@@ -499,8 +575,9 @@ static int fsi_master_gpio_write(struct fsi_master *_master, int link,
 		return -ENODEV;
 
 	mutex_lock(&master->cmd_lock);
-	build_abs_ar_command(&cmd, id, addr, size, val);
+	build_ar_command(master, &cmd, id, addr, size, val);
 	rc = fsi_master_gpio_xfer(master, id, &cmd, 0, NULL);
+	last_address_update(master, id, rc == 0, addr);
 	mutex_unlock(&master->cmd_lock);
 
 	return rc;
@@ -519,6 +596,7 @@ static int fsi_master_gpio_term(struct fsi_master *_master,
 	mutex_lock(&master->cmd_lock);
 	build_term_command(&cmd, id);
 	rc = fsi_master_gpio_xfer(master, id, &cmd, 0, NULL);
+	last_address_update(master, id, false, 0);
 	mutex_unlock(&master->cmd_lock);
 
 	return rc;
@@ -552,6 +630,7 @@ static int fsi_master_gpio_break(struct fsi_master *_master, int link)
 	clock_toggle(master, FSI_POST_BREAK_CLOCKS);
 
 	spin_unlock_irqrestore(&master->bit_lock, flags);
+	last_address_update(master, 0, false, 0);
 	mutex_unlock(&master->cmd_lock);
 
 	/* Wait for logic reset to take effect */
@@ -662,6 +741,7 @@ static int fsi_master_gpio_probe(struct platform_device *pdev)
 	master->dev = &pdev->dev;
 	master->master.dev.parent = master->dev;
 	master->master.dev.of_node = of_node_get(dev_of_node(master->dev));
+	master->last_addr = LAST_ADDR_INVALID;
 
 	gpio = devm_gpiod_get(&pdev->dev, "clock", 0);
 	if (IS_ERR(gpio)) {
-- 
2.17.0
