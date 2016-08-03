Return-Path: <brendanhiggins@google.com>
Received: from mail-pf0-x234.google.com (mail-pf0-x234.google.com
 [IPv6:2607:f8b0:400e:c00::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s4R6m0JzJzDqRt
 for <openbmc@lists.ozlabs.org>; Thu,  4 Aug 2016 07:29:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=DR2NYXMe; 
 dkim-atps=neutral
Received: by mail-pf0-x234.google.com with SMTP id h186so80836105pfg.3
 for <openbmc@lists.ozlabs.org>; Wed, 03 Aug 2016 14:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=mi016QrXjNmbOXrk8RDl+rAjTeyveij4L7dvXs5klrQ=;
 b=DR2NYXMe3/xM1uVJWc1LQA2j28BPrglvACGoapSelY2iYMWXzm+bd7zg+ttDIMaYha
 ueI/YjTpYd8trBfg6ZNBCp0cTR+8AGHXkahKVJmwGSkpfcjMMwwwJN/YvJJgbtteIpGK
 JfwyXGbKvNjBTsNEjZHK71AqK2DuN6pKzEX67IDYWNKvmyXryaZXbehVe62+OCelrYod
 4oc+esxgDN2J+8h+8hEjXSLSFWcw9QQNFmPaAzSB3oaejw6UJ/QHo8h1gl39tp3+Ofr9
 +O9O4wQXaasGF8xyDJwyB4DEKBy9Uuf5bTla762PCGk/4izrtJQtt5xu7p+Dp+2Y835S
 +bKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=mi016QrXjNmbOXrk8RDl+rAjTeyveij4L7dvXs5klrQ=;
 b=Wn+PuLcqRbjuRppu+X8rlRWeLRYV/8jPBrGkWzhltRCUPfF0WTs7qj0XW6q73FsTVt
 MbWedKO4HigXvj3sWLQC6tYAPztTxbhVkNE4QBqikZV8fNDKTOpM8NS5S2JikrAxrBbh
 6/Xq2vldJIJv5KBwxJugSWXhyheky4aesccTiQ91v2Av9EYaRMUggaxAAcVDly4tj3jY
 HaEN/pcanB/CwvqxgNrfRxk8c8DDM3KWnBk3ZjMbpHqFbQi+I5rNFu2YA21wQu2js7TD
 Ut1fq590Kf23wzD+Y6hYkOa8UJ5pWcQZi/jjLrwgKSsyP/z9f4FOQbOXqzDuRa+QBWqg
 DUiQ==
X-Gm-Message-State: AEkoouvLYn3xYU06fDycXy2Tx1o1fsf5KSq0SpHEF/XpaoRspfGklYWN3rsOXdbdu/k5P2HG
X-Received: by 10.98.12.18 with SMTP id u18mr119569062pfi.89.1470259789753;
 Wed, 03 Aug 2016 14:29:49 -0700 (PDT)
Received: from mactruck.mtv.corp.google.com ([172.18.64.18])
 by smtp.gmail.com with ESMTPSA id e72sm14823356pfb.49.2016.08.03.14.29.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 03 Aug 2016 14:29:49 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: openbmc@lists.ozlabs.org
Cc: Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH] i2c: aspeed: added support for slave mode
Date: Wed,  3 Aug 2016 14:28:28 -0700
Message-Id: <1470259708-12453-2-git-send-email-brendanhiggins@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1470259708-12453-1-git-send-email-brendanhiggins@google.com>
References: <CACPK8XehcSGvyBkdVB_kxZyFWzPr8qwseRzfp-mZG7hnZFnSUw@mail.gmail.com>
 <1470259708-12453-1-git-send-email-brendanhiggins@google.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Aug 2016 21:29:52 -0000

Added slave mode irq handler as well as reg_slave and unreg_slave
functions to the i2c-aspeed's i2c_algorithm.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
---
 drivers/i2c/busses/i2c-aspeed.c | 202 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 198 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index b8e8199..89ffa12 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -197,6 +197,7 @@
 #define AST_I2CD_M_START_CMD				(0x1 )		
 
 /* 0x18 : I2CD Slave Device Address Register   */
+#define AST_I2CD_DEV_ADDR_MASK                          ((0x1 << 7) - 1)
 
 /* 0x1C : I2CD Pool Buffer Control Register   */
 #define AST_I2CD_RX_BUF_ADDR_GET(x)				((x>> 24)& 0xff)
@@ -225,6 +226,17 @@
 
 static const int ast_i2c_n_busses = 14;
 
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+enum ast_i2c_slave_state {
+	AST_I2C_SLAVE_START,
+	AST_I2C_SLAVE_READ_REQUESTED,
+	AST_I2C_SLAVE_READ_PROCESSED,
+	AST_I2C_SLAVE_WRITE_REQUESTED,
+	AST_I2C_SLAVE_WRITE_RECEIVED,
+	AST_I2C_SLAVE_STOP,
+};
+#endif
+
 struct ast_i2c_bus {
 	/* TODO: find a better way to do this */
 	struct ast_i2c_dev *i2c_dev;
@@ -233,6 +245,10 @@ struct ast_i2c_bus {
 	void __iomem	*base;			/* virtual */	
 	u32 state;				//I2C xfer mode state matchine 
 	struct i2c_adapter adap;
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+	struct i2c_client *slave;
+	enum ast_i2c_slave_state slave_state;
+#endif
 	u32		bus_clk;
 	struct clk	*pclk;
 	int		irq;
@@ -318,7 +334,6 @@ static void ast_i2c_dev_init(struct ast_i2c_bus *bus)
 	ast_i2c_write(bus, ast_i2c_read(bus, I2C_FUN_CTRL_REG)
 			| AST_I2CD_MASTER_EN, I2C_FUN_CTRL_REG);
 
-
 	/* Set interrupt generation of I2C controller */
 	ast_i2c_write(bus, AST_I2CD_INTR_SDA_DL_TIMEOUT |
 			AST_I2CD_INTR_BUS_RECOVER_DONE |
@@ -529,10 +544,105 @@ static void ast_i2c_master_xfer_done(struct ast_i2c_bus *bus)
 		complete(&bus->cmd_complete);
 }
 
-static irqreturn_t ast_i2c_bus_irq(int irq, void *dev_id)
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+static bool ast_i2c_slave_irq(struct ast_i2c_bus *bus)
 {
-	struct ast_i2c_bus *bus = dev_id;
+	bool irq_handled = true;
+	u32 command;
+	u32 irq_status;
+	u32 status_ack = 0;
+	u8 value;
+	enum i2c_slave_event event;
+	struct i2c_client *slave = bus->slave;
 
+	spin_lock(&bus->cmd_lock);
+	if (!slave) {
+		irq_handled = false;
+		goto out;
+	}
+	command = ast_i2c_read(bus, I2C_CMD_REG);
+	irq_status = ast_i2c_read(bus, I2C_INTR_STS_REG);
+
+	/* Slave was requested, restart state machine. */
+	if (irq_status & AST_I2CD_INTR_SLAVE_MATCH) {
+		status_ack |= AST_I2CD_INTR_SLAVE_MATCH;
+		bus->slave_state = AST_I2C_SLAVE_START;
+	}
+	/* Slave is not currently active, irq was for someone else. */
+	if (bus->slave_state == AST_I2C_SLAVE_STOP) {
+		irq_handled = false;
+		goto out;
+	}
+
+	dev_dbg(bus->dev, "slave irq status 0x%08x, cmd 0x%08x\n",
+		irq_status, command);
+
+	/* Slave was sent something. */
+	if (irq_status & AST_I2CD_INTR_RX_DONE) {
+		value = ast_i2c_read(bus, I2C_BYTE_BUF_REG) >> 8;
+		/* Handle address frame. */
+		if (bus->slave_state == AST_I2C_SLAVE_START) {
+			if (value & 0x1)
+				bus->slave_state = AST_I2C_SLAVE_READ_REQUESTED;
+			else
+				bus->slave_state =
+						AST_I2C_SLAVE_WRITE_REQUESTED;
+		}
+		status_ack |= AST_I2CD_INTR_RX_DONE;
+	}
+
+	/* Slave was asked to stop. */
+	if (irq_status & AST_I2CD_INTR_NORMAL_STOP ||
+	    irq_status & AST_I2CD_INTR_TX_NAK) {
+		if (irq_status & AST_I2CD_INTR_NORMAL_STOP)
+			status_ack |= AST_I2CD_INTR_NORMAL_STOP;
+		else
+			status_ack |= AST_I2CD_INTR_TX_NAK;
+		bus->slave_state = AST_I2C_SLAVE_STOP;
+	}
+
+	if (bus->slave_state == AST_I2C_SLAVE_READ_REQUESTED ||
+	    bus->slave_state == AST_I2C_SLAVE_READ_PROCESSED) {
+		if (bus->slave_state == AST_I2C_SLAVE_READ_REQUESTED) {
+			event = I2C_SLAVE_READ_REQUESTED;
+			if (irq_status & AST_I2CD_INTR_TX_ACK)
+				dev_err(bus->dev,
+					"Unexpected ACK on read request.\n");
+		} else {
+			status_ack |= AST_I2CD_INTR_TX_ACK;
+			event = I2C_SLAVE_READ_PROCESSED;
+			if (!(irq_status & AST_I2CD_INTR_TX_ACK))
+				dev_err(bus->dev,
+					"Expected ACK after processed read.\n");
+		}
+		bus->slave_state = AST_I2C_SLAVE_READ_PROCESSED;
+
+		i2c_slave_event(slave, event, &value);
+		ast_i2c_write(bus, value, I2C_BYTE_BUF_REG);
+		ast_i2c_write(bus, AST_I2CD_S_TX_CMD, I2C_CMD_REG);
+	} else if (bus->slave_state == AST_I2C_SLAVE_WRITE_REQUESTED) {
+		bus->slave_state = AST_I2C_SLAVE_WRITE_RECEIVED;
+		i2c_slave_event(slave, I2C_SLAVE_WRITE_REQUESTED, &value);
+	} else if (bus->slave_state == AST_I2C_SLAVE_WRITE_RECEIVED) {
+		i2c_slave_event(slave, I2C_SLAVE_WRITE_RECEIVED, &value);
+	} else if (bus->slave_state == AST_I2C_SLAVE_STOP) {
+		i2c_slave_event(slave, I2C_SLAVE_STOP, &value);
+	}
+
+	if (status_ack != irq_status)
+		dev_err(bus->dev,
+			"irq handled != irq. expected %x, but was %x\n",
+			irq_status, status_ack);
+	ast_i2c_write(bus, status_ack, I2C_INTR_STS_REG);
+
+out:
+	spin_unlock(&bus->cmd_lock);
+	return irq_handled;
+}
+#endif
+
+static bool ast_i2c_master_irq(struct ast_i2c_bus *bus)
+{
 	const u32 errs = AST_I2CD_INTR_ARBIT_LOSS |
 		AST_I2CD_INTR_ABNORMAL |
 		AST_I2CD_INTR_SCL_TIMEOUT |
@@ -550,7 +660,11 @@ static irqreturn_t ast_i2c_bus_irq(int irq, void *dev_id)
 	sts &= 0x7fff;
 	bus->state = cmd >> 19 & 0xf;
 
-	/* ack everything */
+	/*
+	 * ack everything - this is safe because this driver makes master mode
+	 * and slave mode mutually exclusive on a single bus; thus, it is not
+	 * possible for a master to steal a slave IRQ in this way.
+	 */
 	ast_i2c_write(bus, sts, I2C_INTR_STS_REG);
 
 	bus->cmd_err |= sts & errs;
@@ -575,6 +689,24 @@ static irqreturn_t ast_i2c_bus_irq(int irq, void *dev_id)
 
 	spin_unlock(&bus->cmd_lock);
 
+	return true;
+}
+
+static irqreturn_t ast_i2c_bus_irq(int irq, void *dev_id)
+{
+	struct ast_i2c_bus *bus = dev_id;
+
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+	if (ast_i2c_slave_irq(bus)) {
+		dev_dbg(bus->dev, "irq handled by slave.\n");
+		return IRQ_HANDLED;
+	}
+#endif
+	if (ast_i2c_master_irq(bus)) {
+		dev_dbg(bus->dev, "irq handled by master.\n");
+		return IRQ_HANDLED;
+	}
+	dev_err(bus->dev, "irq not handled properly!\n");
 	return IRQ_HANDLED;
 }
 
@@ -674,9 +806,71 @@ static u32 ast_i2c_functionality(struct i2c_adapter *adap)
 	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL | I2C_FUNC_SMBUS_BLOCK_DATA;
 }
 
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+static int ast_i2c_reg_slave(struct i2c_client *client)
+{
+	struct ast_i2c_bus *bus;
+	unsigned long flags;
+	u32 addr_reg_val;
+	u32 func_ctrl_reg_val;
+
+	bus = client->adapter->algo_data;
+	spin_lock_irqsave(&bus->cmd_lock, flags);
+	if (bus->slave) {
+		spin_unlock_irqrestore(&bus->cmd_lock, flags);
+		return -EINVAL;
+	}
+
+	/* Set slave addr. */
+	addr_reg_val = ast_i2c_read(bus, I2C_DEV_ADDR_REG);
+	addr_reg_val &= ~AST_I2CD_DEV_ADDR_MASK;
+	addr_reg_val |= client->addr & AST_I2CD_DEV_ADDR_MASK;
+	ast_i2c_write(bus, addr_reg_val, I2C_DEV_ADDR_REG);
+
+	/* Switch from master mode to slave mode. */
+	func_ctrl_reg_val = ast_i2c_read(bus, I2C_FUN_CTRL_REG);
+	func_ctrl_reg_val &= ~AST_I2CD_MASTER_EN;
+	func_ctrl_reg_val |= AST_I2CD_SLAVE_EN;
+	ast_i2c_write(bus, func_ctrl_reg_val, I2C_FUN_CTRL_REG);
+
+	bus->slave = client;
+	bus->slave_state = AST_I2C_SLAVE_STOP;
+	spin_unlock_irqrestore(&bus->cmd_lock, flags);
+	return 0;
+}
+
+static int ast_i2c_unreg_slave(struct i2c_client *client)
+{
+	struct ast_i2c_bus *bus = client->adapter->algo_data;
+	unsigned long flags;
+	u32 addr_reg_val;
+	u32 func_ctrl_reg_val;
+
+	spin_lock_irqsave(&bus->cmd_lock, flags);
+	if (!bus->slave) {
+		spin_unlock_irqrestore(&bus->cmd_lock, flags);
+		return -EINVAL;
+	}
+
+	/* Switch from slave mode to master mode. */
+	func_ctrl_reg_val = ast_i2c_read(bus, I2C_FUN_CTRL_REG);
+	func_ctrl_reg_val &= ~AST_I2CD_SLAVE_EN;
+	func_ctrl_reg_val |= AST_I2CD_MASTER_EN;
+	ast_i2c_write(bus, func_ctrl_reg_val, I2C_FUN_CTRL_REG);
+
+	bus->slave = NULL;
+	spin_unlock_irqrestore(&bus->cmd_lock, flags);
+	return 0;
+}
+#endif
+
 static const struct i2c_algorithm i2c_ast_algorithm = {
 	.master_xfer	= ast_i2c_xfer,
 	.functionality	= ast_i2c_functionality,
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+	.reg_slave	= ast_i2c_reg_slave,
+	.unreg_slave	= ast_i2c_unreg_slave,
+#endif
 };
 
 static int ast_i2c_probe_bus(struct platform_device *pdev)
-- 
2.8.0.rc3.226.g39d4020
