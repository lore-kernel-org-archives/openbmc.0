Return-Path: <brendanhiggins@google.com>
Received: from mail-pf0-x22c.google.com (mail-pf0-x22c.google.com
 [IPv6:2607:f8b0:400e:c00::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wBZNb3h6FzDqC4
 for <openbmc@lists.ozlabs.org>; Tue, 25 Apr 2017 04:18:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Wi/ZPWhD"; 
 dkim-atps=neutral
Received: by mail-pf0-x22c.google.com with SMTP id a188so16095451pfa.0
 for <openbmc@lists.ozlabs.org>; Mon, 24 Apr 2017 11:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ZNOSw+Q4KAdqaeeMhPOjxOJ4ym5qGZKmEIdkVGxcNo4=;
 b=Wi/ZPWhDsS8XUvVRVumH5SgSCNnQV6ybjkg934sm10KKwZODDeSgZ2dqyoIeYvaIop
 tnFgASuUCX2S0a4EpMJ70z/6bGYHCRCgMScZ/CTvV8V4eieUjRBLte3xoQOC6RJEt0gL
 G6l728V1rj11sCXTrMyIrVWsikvZSZkGRcJvd4v5gVixFwjTyZYvEsYfG5N6ovRwe0JC
 L1fl+5K1mc8HU67l/ug6kom0tAZISrpwQJ3breeL6HrGF7gPlrIAWT30LhVI8CBaJGmp
 lOt77+3YGLIm2QNuYINsHlcwxVTp/e1edvLMeko3WBzVK2Xq1mLjFw7GGjNeNunJP2M3
 OJZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ZNOSw+Q4KAdqaeeMhPOjxOJ4ym5qGZKmEIdkVGxcNo4=;
 b=er2eJIGzxkc4/X9NO8ecFskwunBxYhNeGgKSvllhYtJGzZzU6BefPancR8Q/ibtb7/
 mswabJ5V1xQDnxidHHuCp5VDE+DcjJDC7abiH0JDYAeQlKRCwnPxtAhd/nYI9dMQwp42
 orqMUGRy6kzpPleKTO8ojT6jXVLh/NCB02sn7vKjUpK24rof3DQ9BV6WgWn3N+Pma2hI
 3Q0ZZRwiEFG+rIJ47EOLgz5Way2AU1okf/CI4dSQNlZouz/j8LRpuxkLUDdoQHh0pSUz
 U7QMIV9yUQovrKRMZCM16GFLi9PRGqNJacUnd/dm+GnsU6I9a21tPHasYp+EVzjqgAvo
 gIPA==
X-Gm-Message-State: AN3rC/5p0OPS+cb8BhB7wjF7h0ESsTepnH05Ns9pJk2iH3XzLS6/A4mv
 j9X17JCFSP1T+znz
X-Received: by 10.84.236.79 with SMTP id h15mr27222007pln.110.1493057933356;
 Mon, 24 Apr 2017 11:18:53 -0700 (PDT)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id 65sm32220630pgc.1.2017.04.24.11.18.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 24 Apr 2017 11:18:52 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: wsa@the-dreams.de, robh+dt@kernel.org, mark.rutland@arm.com,
 tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com,
 joel@jms.id.au, vz@mleia.com, mouse@mayc.ru, clg@kaod.org,
 benh@kernel.crashing.org
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH v7 5/5] i2c: aspeed: added slave support for Aspeed I2C driver
Date: Mon, 24 Apr 2017 11:18:18 -0700
Message-Id: <20170424181818.2754-6-brendanhiggins@google.com>
X-Mailer: git-send-email 2.12.2.816.g2cccc81164-goog
In-Reply-To: <20170424181818.2754-1-brendanhiggins@google.com>
References: <20170424181818.2754-1-brendanhiggins@google.com>
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
X-List-Received-Date: Mon, 24 Apr 2017 18:18:56 -0000

Added slave support for Aspeed I2C controller. Supports fourteen busses
present in AST24XX and AST25XX BMC SoCs by Aspeed.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
---
Added in v6:
  - Pulled slave support out of initial driver commit into its own commit.
  - No longer arbitrarily restrict bus to be slave xor master.
Changes for v7:
  - Added hardware reset function
  - Marked functions that need to be called with the lock held as "unlocked"
  - Did some cleanup
---
 drivers/i2c/busses/i2c-aspeed.c | 201 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 201 insertions(+)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index 778bcaa4ccf4..7bd2328eb0fb 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -49,6 +49,7 @@
 #define ASPEED_I2CD_SDA_DRIVE_1T_EN			BIT(8)
 #define ASPEED_I2CD_M_SDA_DRIVE_1T_EN			BIT(7)
 #define ASPEED_I2CD_M_HIGH_SPEED_EN			BIT(6)
+#define ASPEED_I2CD_SLAVE_EN				BIT(1)
 #define ASPEED_I2CD_MASTER_EN				BIT(0)
 
 /* 0x04 : I2CD Clock and AC Timing Control Register #1 */
@@ -69,6 +70,7 @@
  */
 #define ASPEED_I2CD_INTR_SDA_DL_TIMEOUT			BIT(14)
 #define ASPEED_I2CD_INTR_BUS_RECOVER_DONE		BIT(13)
+#define ASPEED_I2CD_INTR_SLAVE_MATCH			BIT(7)
 #define ASPEED_I2CD_INTR_SCL_TIMEOUT			BIT(6)
 #define ASPEED_I2CD_INTR_ABNORMAL			BIT(5)
 #define ASPEED_I2CD_INTR_NORMAL_STOP			BIT(4)
@@ -106,6 +108,9 @@
 #define ASPEED_I2CD_M_TX_CMD				BIT(1)
 #define ASPEED_I2CD_M_START_CMD				BIT(0)
 
+/* 0x18 : I2CD Slave Device Address Register   */
+#define ASPEED_I2CD_DEV_ADDR_MASK			GENMASK(6, 0)
+
 enum aspeed_i2c_master_state {
 	ASPEED_I2C_MASTER_START,
 	ASPEED_I2C_MASTER_TX_FIRST,
@@ -116,6 +121,15 @@ enum aspeed_i2c_master_state {
 	ASPEED_I2C_MASTER_INACTIVE,
 };
 
+enum aspeed_i2c_slave_state {
+	ASPEED_I2C_SLAVE_START,
+	ASPEED_I2C_SLAVE_READ_REQUESTED,
+	ASPEED_I2C_SLAVE_READ_PROCESSED,
+	ASPEED_I2C_SLAVE_WRITE_REQUESTED,
+	ASPEED_I2C_SLAVE_WRITE_RECEIVED,
+	ASPEED_I2C_SLAVE_STOP,
+};
+
 struct aspeed_i2c_bus {
 	struct i2c_adapter		adap;
 	struct device			*dev;
@@ -132,6 +146,10 @@ struct aspeed_i2c_bus {
 	size_t				msgs_count;
 	bool				send_stop;
 	int				cmd_err;
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+	struct i2c_client		*slave;
+	enum aspeed_i2c_slave_state	slave_state;
+#endif /* CONFIG_I2C_SLAVE */
 };
 
 static int aspeed_i2c_reset(struct aspeed_i2c_bus *bus);
@@ -203,6 +221,110 @@ static int aspeed_i2c_recover_bus(struct aspeed_i2c_bus *bus)
 	return aspeed_i2c_reset(bus);
 }
 
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+static bool aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus)
+{
+	u32 command, irq_status, status_ack = 0;
+	struct i2c_client *slave = bus->slave;
+	bool irq_handled = true;
+	u8 value;
+
+	spin_lock(&bus->lock);
+	if (!slave) {
+		irq_handled = false;
+		goto out;
+	}
+
+	command = readl(bus->base + ASPEED_I2C_CMD_REG);
+	irq_status = readl(bus->base + ASPEED_I2C_INTR_STS_REG);
+
+	/* Slave was requested, restart state machine. */
+	if (irq_status & ASPEED_I2CD_INTR_SLAVE_MATCH) {
+		status_ack |= ASPEED_I2CD_INTR_SLAVE_MATCH;
+		bus->slave_state = ASPEED_I2C_SLAVE_START;
+	}
+
+	/* Slave is not currently active, irq was for someone else. */
+	if (bus->slave_state == ASPEED_I2C_SLAVE_STOP) {
+		irq_handled = false;
+		goto out;
+	}
+
+	dev_dbg(bus->dev, "slave irq status 0x%08x, cmd 0x%08x\n",
+		irq_status, command);
+
+	/* Slave was sent something. */
+	if (irq_status & ASPEED_I2CD_INTR_RX_DONE) {
+		value = readl(bus->base + ASPEED_I2C_BYTE_BUF_REG) >> 8;
+		/* Handle address frame. */
+		if (bus->slave_state == ASPEED_I2C_SLAVE_START) {
+			if (value & 0x1)
+				bus->slave_state =
+						ASPEED_I2C_SLAVE_READ_REQUESTED;
+			else
+				bus->slave_state =
+						ASPEED_I2C_SLAVE_WRITE_REQUESTED;
+		}
+		status_ack |= ASPEED_I2CD_INTR_RX_DONE;
+	}
+
+	/* Slave was asked to stop. */
+	if (irq_status & ASPEED_I2CD_INTR_NORMAL_STOP) {
+		status_ack |= ASPEED_I2CD_INTR_NORMAL_STOP;
+		bus->slave_state = ASPEED_I2C_SLAVE_STOP;
+	}
+	if (irq_status & ASPEED_I2CD_INTR_TX_NAK) {
+		status_ack |= ASPEED_I2CD_INTR_TX_NAK;
+		bus->slave_state = ASPEED_I2C_SLAVE_STOP;
+	}
+
+	switch (bus->slave_state) {
+	case ASPEED_I2C_SLAVE_READ_REQUESTED:
+		if (irq_status & ASPEED_I2CD_INTR_TX_ACK)
+			dev_err(bus->dev, "Unexpected ACK on read request.\n");
+		bus->slave_state = ASPEED_I2C_SLAVE_READ_PROCESSED;
+
+		i2c_slave_event(slave, I2C_SLAVE_READ_REQUESTED, &value);
+		writel(value, bus->base + ASPEED_I2C_BYTE_BUF_REG);
+		writel(ASPEED_I2CD_S_TX_CMD, bus->base + ASPEED_I2C_CMD_REG);
+		break;
+	case ASPEED_I2C_SLAVE_READ_PROCESSED:
+		status_ack |= ASPEED_I2CD_INTR_TX_ACK;
+		if (!(irq_status & ASPEED_I2CD_INTR_TX_ACK))
+			dev_err(bus->dev,
+				"Expected ACK after processed read.\n");
+		i2c_slave_event(slave, I2C_SLAVE_READ_PROCESSED, &value);
+		writel(value, bus->base + ASPEED_I2C_BYTE_BUF_REG);
+		writel(ASPEED_I2CD_S_TX_CMD, bus->base + ASPEED_I2C_CMD_REG);
+		break;
+	case ASPEED_I2C_SLAVE_WRITE_REQUESTED:
+		bus->slave_state = ASPEED_I2C_SLAVE_WRITE_RECEIVED;
+		i2c_slave_event(slave, I2C_SLAVE_WRITE_REQUESTED, &value);
+		break;
+	case ASPEED_I2C_SLAVE_WRITE_RECEIVED:
+		i2c_slave_event(slave, I2C_SLAVE_WRITE_RECEIVED, &value);
+		break;
+	case ASPEED_I2C_SLAVE_STOP:
+		i2c_slave_event(slave, I2C_SLAVE_STOP, &value);
+		break;
+	default:
+		dev_err(bus->dev, "unhandled slave_state: %d\n",
+			bus->slave_state);
+		break;
+	}
+
+	if (status_ack != irq_status)
+		dev_err(bus->dev,
+			"irq handled != irq. expected %x, but was %x\n",
+			irq_status, status_ack);
+	writel(status_ack, bus->base + ASPEED_I2C_INTR_STS_REG);
+
+out:
+	spin_unlock(&bus->lock);
+	return irq_handled;
+}
+#endif /* CONFIG_I2C_SLAVE */
+
 static void __aspeed_i2c_do_start(struct aspeed_i2c_bus *bus)
 {
 	u32 command = ASPEED_I2CD_M_START_CMD | ASPEED_I2CD_M_TX_CMD;
@@ -391,6 +513,13 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
 {
 	struct aspeed_i2c_bus *bus = dev_id;
 
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+	if (aspeed_i2c_slave_irq(bus)) {
+		dev_dbg(bus->dev, "irq handled by slave.\n");
+		return IRQ_HANDLED;
+	}
+#endif /* CONFIG_I2C_SLAVE */
+
 	if (aspeed_i2c_master_irq(bus))
 		return IRQ_HANDLED;
 	else
@@ -449,9 +578,75 @@ static u32 aspeed_i2c_functionality(struct i2c_adapter *adap)
 	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL | I2C_FUNC_SMBUS_BLOCK_DATA;
 }
 
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+static void __aspeed_i2c_reg_slave(struct aspeed_i2c_bus *bus, u16 slave_addr)
+{
+	u32 addr_reg_val, func_ctrl_reg_val;
+
+	/* Set slave addr. */
+	addr_reg_val = readl(bus->base + ASPEED_I2C_DEV_ADDR_REG);
+	addr_reg_val &= ~ASPEED_I2CD_DEV_ADDR_MASK;
+	addr_reg_val |= slave_addr & ASPEED_I2CD_DEV_ADDR_MASK;
+	writel(addr_reg_val, bus->base + ASPEED_I2C_DEV_ADDR_REG);
+
+	/* Turn on slave mode. */
+	func_ctrl_reg_val = readl(bus->base + ASPEED_I2C_FUN_CTRL_REG);
+	func_ctrl_reg_val |= ASPEED_I2CD_SLAVE_EN;
+	writel(func_ctrl_reg_val, bus->base + ASPEED_I2C_FUN_CTRL_REG);
+}
+
+static int aspeed_i2c_reg_slave(struct i2c_client *client)
+{
+	struct aspeed_i2c_bus *bus;
+	unsigned long flags;
+
+	bus = client->adapter->algo_data;
+	spin_lock_irqsave(&bus->lock, flags);
+	if (bus->slave) {
+		spin_unlock_irqrestore(&bus->lock, flags);
+		return -EINVAL;
+	}
+
+	__aspeed_i2c_reg_slave(bus, client->addr);
+
+	bus->slave = client;
+	bus->slave_state = ASPEED_I2C_SLAVE_STOP;
+	spin_unlock_irqrestore(&bus->lock, flags);
+
+	return 0;
+}
+
+static int aspeed_i2c_unreg_slave(struct i2c_client *client)
+{
+	struct aspeed_i2c_bus *bus = client->adapter->algo_data;
+	u32 func_ctrl_reg_val;
+	unsigned long flags;
+
+	spin_lock_irqsave(&bus->lock, flags);
+	if (!bus->slave) {
+		spin_unlock_irqrestore(&bus->lock, flags);
+		return -EINVAL;
+	}
+
+	/* Turn off slave mode. */
+	func_ctrl_reg_val = readl(bus->base + ASPEED_I2C_FUN_CTRL_REG);
+	func_ctrl_reg_val &= ~ASPEED_I2CD_SLAVE_EN;
+	writel(func_ctrl_reg_val, bus->base + ASPEED_I2C_FUN_CTRL_REG);
+
+	bus->slave = NULL;
+	spin_unlock_irqrestore(&bus->lock, flags);
+
+	return 0;
+}
+#endif /* CONFIG_I2C_SLAVE */
+
 static const struct i2c_algorithm aspeed_i2c_algo = {
 	.master_xfer	= aspeed_i2c_master_xfer,
 	.functionality	= aspeed_i2c_functionality,
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+	.reg_slave	= aspeed_i2c_reg_slave,
+	.unreg_slave	= aspeed_i2c_unreg_slave,
+#endif /* CONFIG_I2C_SLAVE */
 };
 
 static u32 aspeed_i2c_get_clk_reg_val(u32 divisor)
@@ -559,6 +754,12 @@ static int __aspeed_i2c_init(struct aspeed_i2c_bus *bus,
 	       ASPEED_I2CD_MULTI_MASTER_DIS,
 	       bus->base + ASPEED_I2C_FUN_CTRL_REG);
 
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+	/* If slave has already been registered, re-enable it. */
+	if (bus->slave)
+		__aspeed_i2c_reg_slave(bus, bus->slave->addr);
+#endif /* CONFIG_I2C_SLAVE */
+
 	/* Set interrupt generation of I2C controller */
 	writel(ASPEED_I2CD_INTR_ALL, bus->base + ASPEED_I2C_INTR_CTRL_REG);
 
-- 
2.12.2.816.g2cccc81164-goog
