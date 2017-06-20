Return-Path: <brendanhiggins@google.com>
Received: from mail-pg0-x22f.google.com (mail-pg0-x22f.google.com
 [IPv6:2607:f8b0:400e:c05::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wsgc93JcszDqhp
 for <openbmc@lists.ozlabs.org>; Wed, 21 Jun 2017 07:15:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="KytdHgpM"; 
 dkim-atps=neutral
Received: by mail-pg0-x22f.google.com with SMTP id f185so67923713pgc.0
 for <openbmc@lists.ozlabs.org>; Tue, 20 Jun 2017 14:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=G5EXECoJCGWBlouNglyu1COoTGl00Wv3lw8y5xy3iWw=;
 b=KytdHgpMmGygipzP0pDdIHW7mSAbitIT1MR6JhFVm5g+AoKUkRJn6RK7cVVsyiTlcC
 Zw48TS+aXB0DbAgHEJP0FDGqf9P0yvHhPL4qE6u5wdn49+GDoax7GLuwginGlZbVuM9k
 znEpOTsxfB1lBtB8rl9f/0Gnk2XornTmIeHrAvYx23e9s27etvBFO9KtRZMUlJZfbnZE
 pFYXYQ5I1mhWJdwJ+E/AbOgF5eyHkUoxq/BLC7UJGWBnI3eVwIJ0xhQ3YdftQ18QjpoL
 hWMC7+gtSEZbcvX05xlbYHp+pykM2oUFXzlofBTpe89BXRII6krM394Rv9PC8XRaPBFG
 w+OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=G5EXECoJCGWBlouNglyu1COoTGl00Wv3lw8y5xy3iWw=;
 b=JowI/RmKLZO1YCMCvUJu6WCfCiUUXBCR36RdeUXIQyx7LQxAY+C85pP9itt3v00FgK
 iAzei3HJVKBeumeQkqtPA5cybH9Fx7BUXKjRUVs4etAzfs3e65oVNQHxWE/ndbo1Vl6L
 mfEoCl3wse6/ikD9z8t7SqoCh+ZoJeqeT/RgqzB9o8kU6nGUqLpv1VjVjGgIhE8baxuB
 YWsSwRFFjW9d0aJ7WLG7Ec5zoTq1NpRH07kUOWpvrKwjFxiX5ghf2vszNm4RzN06FwpL
 hSAoiKLwXyRZQfgkP3rtIFv3OHXKZlaJSnbXSmMLzhNVSS0r52JtT5khx+OrgFLjqeCW
 qrKg==
X-Gm-Message-State: AKS2vOxzx3ch/1oQUXMBq0THJgrIsuihV5q0/sP4L0qrAzc8vrQk0Wv3
 DmO3Pg3Ypd+B1hB3
X-Received: by 10.98.64.6 with SMTP id n6mr32390043pfa.196.1497993335528;
 Tue, 20 Jun 2017 14:15:35 -0700 (PDT)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id a69sm29012015pfg.91.2017.06.20.14.15.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 20 Jun 2017 14:15:34 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: wsa@the-dreams.de, robh+dt@kernel.org, mark.rutland@arm.com,
 gregkh@linuxfoundation.org, davem@davemloft.net, mchehab@kernel.org,
 joel@jms.id.au, martin.petersen@oracle.com, benh@kernel.crashing.org
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH v11 4/4] i2c: aspeed: added slave support for Aspeed I2C driver
Date: Tue, 20 Jun 2017 14:15:16 -0700
Message-Id: <20170620211516.13095-5-brendanhiggins@google.com>
X-Mailer: git-send-email 2.13.1.611.g7e3b11ae1-goog
In-Reply-To: <20170620211516.13095-1-brendanhiggins@google.com>
References: <20170620211516.13095-1-brendanhiggins@google.com>
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
X-List-Received-Date: Tue, 20 Jun 2017 21:15:38 -0000

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
Changes for v8:
  - None
Changes for v9:
  - None
Changes for v10:
  - None
Changes for v11:
  - Use i2c_{get|set}_adapdata instead of adapter->algo_data
---
 drivers/i2c/busses/i2c-aspeed.c | 201 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 201 insertions(+)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index 55f241f2cfcc..f19348328a71 100644
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
@@ -101,6 +103,9 @@
 #define ASPEED_I2CD_M_TX_CMD				BIT(1)
 #define ASPEED_I2CD_M_START_CMD				BIT(0)
 
+/* 0x18 : I2CD Slave Device Address Register   */
+#define ASPEED_I2CD_DEV_ADDR_MASK			GENMASK(6, 0)
+
 enum aspeed_i2c_master_state {
 	ASPEED_I2C_MASTER_START,
 	ASPEED_I2C_MASTER_TX_FIRST,
@@ -111,6 +116,15 @@ enum aspeed_i2c_master_state {
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
@@ -130,6 +144,10 @@ struct aspeed_i2c_bus {
 	int				cmd_err;
 	/* Protected only by i2c_lock_bus */
 	int				master_xfer_result;
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+	struct i2c_client		*slave;
+	enum aspeed_i2c_slave_state	slave_state;
+#endif /* CONFIG_I2C_SLAVE */
 };
 
 static int aspeed_i2c_reset(struct aspeed_i2c_bus *bus);
@@ -202,6 +220,110 @@ static int aspeed_i2c_recover_bus(struct aspeed_i2c_bus *bus)
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
 /* precondition: bus.lock has been acquired. */
 static void aspeed_i2c_do_start(struct aspeed_i2c_bus *bus)
 {
@@ -427,6 +549,13 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
 {
 	struct aspeed_i2c_bus *bus = dev_id;
 
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+	if (aspeed_i2c_slave_irq(bus)) {
+		dev_dbg(bus->dev, "irq handled by slave.\n");
+		return IRQ_HANDLED;
+	}
+#endif /* CONFIG_I2C_SLAVE */
+
 	return aspeed_i2c_master_irq(bus) ? IRQ_HANDLED : IRQ_NONE;
 }
 
@@ -474,9 +603,75 @@ static u32 aspeed_i2c_functionality(struct i2c_adapter *adap)
 	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL | I2C_FUNC_SMBUS_BLOCK_DATA;
 }
 
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+/* precondition: bus.lock has been acquired. */
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
+	struct aspeed_i2c_bus *bus = i2c_get_adapdata(client->adapter);
+	unsigned long flags;
+
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
+	struct aspeed_i2c_bus *bus = i2c_get_adapdata(client->adapter);
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
@@ -551,6 +746,12 @@ static int aspeed_i2c_init(struct aspeed_i2c_bus *bus,
 	writel(readl(bus->base + ASPEED_I2C_FUN_CTRL_REG) | fun_ctrl_reg,
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
2.13.1.611.g7e3b11ae1-goog
