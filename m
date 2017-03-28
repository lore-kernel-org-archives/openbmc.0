Return-Path: <brendanhiggins@google.com>
Received: from mail-pg0-x22f.google.com (mail-pg0-x22f.google.com
 [IPv6:2607:f8b0:400e:c05::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vsfDN4Wl7zDqbG
 for <openbmc@lists.ozlabs.org>; Tue, 28 Mar 2017 16:13:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ZUomdQGa"; 
 dkim-atps=neutral
Received: by mail-pg0-x22f.google.com with SMTP id g2so60961598pge.3
 for <openbmc@lists.ozlabs.org>; Mon, 27 Mar 2017 22:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=hyKAqtkr9i1JZSYcbM5oihn94emESWGEOGX8a1SC5aA=;
 b=ZUomdQGaK8dVpLLDprLaKof7FQ7iBx8ntEJp+X+wdUD+9g+bQohWRZiu85h/mui0TS
 yCn9WbllbuDotaW9VOqoQjVwPxZa2Rx/ULtHHF50j4KqCbasIdb1LuRQC90e2C36L+Ri
 FFN+lDi2IP71dzNOWivW//ovALvApdTkoiwKJ4Sa50PQZI8nhUna2Q85m755tf8egsRS
 PN7aQTW4JYSmpTjYJYT7pZsjQBXheeOSjDn/CEuHkWuML+Vh/rPXLz78JOXPEEiUSkpf
 xWjVNvME7Qwewpt7+qW8QSpVjwpkMsDOsMt1RvpDx3EQAvuMwBKfx0jHUaFPofLgVG5/
 tMSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=hyKAqtkr9i1JZSYcbM5oihn94emESWGEOGX8a1SC5aA=;
 b=DrbjkCXiTbez9g8ySoufHXNkfOOhNLh9UUrBi29cfTznsehIdAWQBCu5WGCrd3K9vB
 C33fnSzkYauBBi+4mPFy16vGakJci7xGYQ42kM0TxcScjkmq6SAGeX0AZG0jQibYpIY2
 JDaUq92Rax/6Usia098iy78RKrRV/Km1oNe0ssFJde83xWwsXvJ5+wIu4vl146pt0aGU
 YGuVFmtOnP6roCqmChhbA/VSFI7Oe8Ry5R2twil6VL9ds4aImZ0Ei2yCmECZnYd2o5kc
 5qoa3IiedMQHJ8T9duURj4xlqfVsnIyy+rDmxji+WdXkD6g1ugKR7pRwgfKccQkdfQC0
 O4ng==
X-Gm-Message-State: AFeK/H0wVwXRNzNZygNaQ7z20eEC9Z6y+99r6HTlzbZrJk8YsURh2T+Oni+LQ2odzRpzbkyI
X-Received: by 10.98.219.3 with SMTP id f3mr29138603pfg.181.1490677986316;
 Mon, 27 Mar 2017 22:13:06 -0700 (PDT)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id p19sm368233pfl.15.2017.03.27.22.13.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 27 Mar 2017 22:13:05 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: wsa@the-dreams.de, robh+dt@kernel.org, mark.rutland@arm.com,
 tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com,
 joel@jms.id.au, vz@mleia.com, mouse@mayc.ru, clg@kaod.org
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 benh@kernel.crashing.org, Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH v6 4/5] i2c: aspeed: added driver for Aspeed I2C
Date: Mon, 27 Mar 2017 22:12:25 -0700
Message-Id: <20170328051226.21677-5-brendanhiggins@google.com>
X-Mailer: git-send-email 2.12.2.564.g063fe858b8-goog
In-Reply-To: <20170328051226.21677-1-brendanhiggins@google.com>
References: <20170328051226.21677-1-brendanhiggins@google.com>
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
X-List-Received-Date: Tue, 28 Mar 2017 05:13:09 -0000

Added initial master support for Aspeed I2C controller. Supports
fourteen busses present in AST24XX and AST25XX BMC SoCs by Aspeed.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
---
Changes for v2:
  - Added single module_init (multiple was breaking some builds).
Changes for v3:
  - Removed "bus" device tree param; now extracted from bus address offset
Changes for v4:
  - I2C adapter number is now generated dynamically unless specified in alias.
Changes for v5:
  - Removed irq_chip used to multiplex IRQ and replaced it with dummy_irq_chip
    along with some other IRQ cleanup.
  - Addressed comments from Cedric, and Vladimir, mostly stylistic things and
    using devm managed resources.
  - Increased max clock frequency before the bus is put in HighSpeed mode, as
    per Kachalov's comment.
Changes for v6:
  - No longer arbitrarily restrict bus to be slave xor master.
  - Pulled out "struct aspeed_i2c_controller" as a interrupt controller.
  - Pulled out slave support into its own commit.
  - Rewrote code that sets clock divider register because the original version
    set it incorrectly.
  - Rewrote the aspeed_i2c_master_irq handler because the old method of
    completing a completion in between restarts was too slow causing devices to
    misbehave.
  - Added support for I2C_M_RECV_LEN which I had incorrectly said was supported
    before.
  - Addressed other comments from Vladimir.
---
 drivers/i2c/busses/Kconfig      |  10 +
 drivers/i2c/busses/Makefile     |   1 +
 drivers/i2c/busses/i2c-aspeed.c | 610 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 621 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-aspeed.c

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 8adc0f1d7ad0..e5ea5641a874 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -326,6 +326,16 @@ config I2C_POWERMAC
 
 comment "I2C system bus drivers (mostly embedded / system-on-chip)"
 
+config I2C_ASPEED
+	tristate "Aspeed AST2xxx SoC I2C Controller"
+	depends on ARCH_ASPEED
+	help
+	  If you say yes to this option, support will be included for the
+	  Aspeed AST2xxx SoC I2C controller.
+
+	  This driver can also be built as a module.  If so, the module
+	  will be called i2c-aspeed.
+
 config I2C_AT91
 	tristate "Atmel AT91 I2C Two-Wire interface (TWI)"
 	depends on ARCH_AT91
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index 30b60855fbcd..e84604b9bf3b 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -29,6 +29,7 @@ obj-$(CONFIG_I2C_HYDRA)		+= i2c-hydra.o
 obj-$(CONFIG_I2C_POWERMAC)	+= i2c-powermac.o
 
 # Embedded system I2C/SMBus host controller drivers
+obj-$(CONFIG_I2C_ASPEED)	+= i2c-aspeed.o
 obj-$(CONFIG_I2C_AT91)		+= i2c-at91.o
 obj-$(CONFIG_I2C_AU1550)	+= i2c-au1550.o
 obj-$(CONFIG_I2C_AXXIA)		+= i2c-axxia.o
diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
new file mode 100644
index 000000000000..04266acc6c46
--- /dev/null
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -0,0 +1,610 @@
+/*
+ *  Aspeed 24XX/25XX I2C Interrupt Controller.
+ *
+ *  Copyright (C) 2012-2017 ASPEED Technology Inc.
+ *  Copyright 2017 IBM Corporation
+ *  Copyright 2017 Google, Inc.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License version 2 as
+ *  published by the Free Software Foundation.
+ */
+
+#include <linux/clk.h>
+#include <linux/completion.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/irq.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/irqdomain.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+/* I2C Register */
+#define ASPEED_I2C_FUN_CTRL_REG				0x00
+#define ASPEED_I2C_AC_TIMING_REG1			0x04
+#define ASPEED_I2C_AC_TIMING_REG2			0x08
+#define ASPEED_I2C_INTR_CTRL_REG			0x0c
+#define ASPEED_I2C_INTR_STS_REG				0x10
+#define ASPEED_I2C_CMD_REG				0x14
+#define ASPEED_I2C_DEV_ADDR_REG				0x18
+#define ASPEED_I2C_BYTE_BUF_REG				0x20
+
+/* Global Register Definition */
+/* 0x00 : I2C Interrupt Status Register  */
+/* 0x08 : I2C Interrupt Target Assignment  */
+
+/* Device Register Definition */
+/* 0x00 : I2CD Function Control Register  */
+#define ASPEED_I2CD_MULTI_MASTER_DIS			BIT(15)
+#define ASPEED_I2CD_SDA_DRIVE_1T_EN			BIT(8)
+#define ASPEED_I2CD_M_SDA_DRIVE_1T_EN			BIT(7)
+#define ASPEED_I2CD_M_HIGH_SPEED_EN			BIT(6)
+#define ASPEED_I2CD_MASTER_EN				BIT(0)
+
+/* 0x04 : I2CD Clock and AC Timing Control Register #1 */
+#define ASPEED_I2CD_TIME_SCL_HIGH_SHIFT			16
+#define ASPEED_I2CD_TIME_SCL_HIGH_MASK			GENMASK(19, 16)
+#define ASPEED_I2CD_TIME_SCL_LOW_SHIFT			12
+#define ASPEED_I2CD_TIME_SCL_LOW_MASK			GENMASK(15, 12)
+#define ASPEED_I2CD_TIME_BASE_DIVISOR_MASK		GENMASK(3, 0)
+#define ASPEED_I2CD_TIME_SCL_REG_MAX			GENMASK(3, 0)
+/* 0x08 : I2CD Clock and AC Timing Control Register #2 */
+#define ASPEED_NO_TIMEOUT_CTRL				0
+
+/* 0x0c : I2CD Interrupt Control Register &
+ * 0x10 : I2CD Interrupt Status Register
+ *
+ * These share bit definitions, so use the same values for the enable &
+ * status bits.
+ */
+#define ASPEED_I2CD_INTR_SDA_DL_TIMEOUT			BIT(14)
+#define ASPEED_I2CD_INTR_BUS_RECOVER_DONE		BIT(13)
+#define ASPEED_I2CD_INTR_SCL_TIMEOUT			BIT(6)
+#define ASPEED_I2CD_INTR_ABNORMAL			BIT(5)
+#define ASPEED_I2CD_INTR_NORMAL_STOP			BIT(4)
+#define ASPEED_I2CD_INTR_ARBIT_LOSS			BIT(3)
+#define ASPEED_I2CD_INTR_RX_DONE			BIT(2)
+#define ASPEED_I2CD_INTR_TX_NAK				BIT(1)
+#define ASPEED_I2CD_INTR_TX_ACK				BIT(0)
+#define ASPEED_I2CD_INTR_ERROR						       \
+		(ASPEED_I2CD_INTR_ARBIT_LOSS |				       \
+		 ASPEED_I2CD_INTR_ABNORMAL |				       \
+		 ASPEED_I2CD_INTR_SCL_TIMEOUT |				       \
+		 ASPEED_I2CD_INTR_SDA_DL_TIMEOUT)
+#define ASPEED_I2CD_INTR_ALL						       \
+		(ASPEED_I2CD_INTR_SDA_DL_TIMEOUT |			       \
+		 ASPEED_I2CD_INTR_BUS_RECOVER_DONE |			       \
+		 ASPEED_I2CD_INTR_SCL_TIMEOUT |				       \
+		 ASPEED_I2CD_INTR_ABNORMAL |				       \
+		 ASPEED_I2CD_INTR_NORMAL_STOP |				       \
+		 ASPEED_I2CD_INTR_ARBIT_LOSS |				       \
+		 ASPEED_I2CD_INTR_RX_DONE |				       \
+		 ASPEED_I2CD_INTR_TX_NAK |				       \
+		 ASPEED_I2CD_INTR_TX_ACK)
+
+/* 0x14 : I2CD Command/Status Register   */
+#define ASPEED_I2CD_SCL_LINE_STS			BIT(18)
+#define ASPEED_I2CD_SDA_LINE_STS			BIT(17)
+#define ASPEED_I2CD_BUS_BUSY_STS			BIT(16)
+#define ASPEED_I2CD_BUS_RECOVER_CMD			BIT(11)
+
+/* Command Bit */
+#define ASPEED_I2CD_M_STOP_CMD				BIT(5)
+#define ASPEED_I2CD_M_S_RX_CMD_LAST			BIT(4)
+#define ASPEED_I2CD_M_RX_CMD				BIT(3)
+#define ASPEED_I2CD_S_TX_CMD				BIT(2)
+#define ASPEED_I2CD_M_TX_CMD				BIT(1)
+#define ASPEED_I2CD_M_START_CMD				BIT(0)
+
+enum aspeed_i2c_master_state {
+	ASPEED_I2C_MASTER_START,
+	ASPEED_I2C_MASTER_TX_FIRST,
+	ASPEED_I2C_MASTER_TX,
+	ASPEED_I2C_MASTER_RX,
+	ASPEED_I2C_MASTER_STOP,
+	ASPEED_I2C_MASTER_INACTIVE,
+};
+
+struct aspeed_i2c_bus {
+	struct i2c_adapter		adap;
+	struct device			*dev;
+	void __iomem			*base;
+	/* Synchronizes I/O mem access to base. */
+	spinlock_t			lock;
+	struct completion		cmd_complete;
+	int				irq;
+	/* Transaction state. */
+	enum aspeed_i2c_master_state	master_state;
+	struct i2c_msg			*msgs;
+	size_t				buf_index;
+	size_t				msgs_index;
+	size_t				msgs_size;
+	bool				send_stop;
+	int				cmd_err;
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+	struct i2c_client		*slave;
+	enum aspeed_i2c_slave_state	slave_state;
+#endif
+};
+
+static inline void aspeed_i2c_write(struct aspeed_i2c_bus *bus, u32 val,
+				    u32 reg)
+{
+	writel(val, bus->base + reg);
+}
+
+static inline u32 aspeed_i2c_read(struct aspeed_i2c_bus *bus, u32 reg)
+{
+	return readl(bus->base + reg);
+}
+
+static int aspeed_i2c_recover_bus(struct aspeed_i2c_bus *bus)
+{
+	unsigned long time_left, flags;
+	int ret = 0;
+	u32 command;
+
+	spin_lock_irqsave(&bus->lock, flags);
+	command = aspeed_i2c_read(bus, ASPEED_I2C_CMD_REG);
+
+	if (command & ASPEED_I2CD_SDA_LINE_STS) {
+		/* Bus is idle: no recovery needed. */
+		if (command & ASPEED_I2CD_SCL_LINE_STS)
+			goto out;
+		dev_dbg(bus->dev, "bus hung (state %x), attempting recovery\n",
+			command);
+
+		aspeed_i2c_write(bus, ASPEED_I2CD_M_STOP_CMD,
+				 ASPEED_I2C_CMD_REG);
+		reinit_completion(&bus->cmd_complete);
+		spin_unlock_irqrestore(&bus->lock, flags);
+
+		time_left = wait_for_completion_timeout(
+				&bus->cmd_complete, bus->adap.timeout);
+
+		spin_lock_irqsave(&bus->lock, flags);
+		if (time_left == 0)
+			ret = -ETIMEDOUT;
+		else if (bus->cmd_err)
+			ret = -EIO;
+	/* Bus error. */
+	} else {
+		dev_dbg(bus->dev, "bus hung (state %x), attempting recovery\n",
+			command);
+
+		aspeed_i2c_write(bus, ASPEED_I2CD_BUS_RECOVER_CMD,
+				 ASPEED_I2C_CMD_REG);
+		reinit_completion(&bus->cmd_complete);
+		spin_unlock_irqrestore(&bus->lock, flags);
+
+		time_left = wait_for_completion_timeout(
+				&bus->cmd_complete, bus->adap.timeout);
+
+		spin_lock_irqsave(&bus->lock, flags);
+		if (time_left == 0)
+			ret = -ETIMEDOUT;
+		else if (bus->cmd_err)
+			ret = -EIO;
+		/* Recovery failed. */
+		else if (!(aspeed_i2c_read(bus, ASPEED_I2C_CMD_REG) &
+			   ASPEED_I2CD_SDA_LINE_STS))
+			ret = -EIO;
+	}
+
+out:
+	spin_unlock_irqrestore(&bus->lock, flags);
+
+	return ret;
+}
+
+static void do_start(struct aspeed_i2c_bus *bus)
+{
+	u32 command = ASPEED_I2CD_M_START_CMD | ASPEED_I2CD_M_TX_CMD;
+	struct i2c_msg *msg = &bus->msgs[bus->msgs_index];
+	u8 slave_addr = msg->addr << 1;
+
+	bus->master_state = ASPEED_I2C_MASTER_START;
+	bus->buf_index = 0;
+
+	if (msg->flags & I2C_M_RD) {
+		slave_addr |= 1;
+		command |= ASPEED_I2CD_M_RX_CMD;
+		/* Need to let the hardware know to NACK after RX. */
+		if (msg->len == 1 && !(msg->flags & I2C_M_RECV_LEN))
+			command |= ASPEED_I2CD_M_S_RX_CMD_LAST;
+	}
+
+	aspeed_i2c_write(bus, slave_addr, ASPEED_I2C_BYTE_BUF_REG);
+	aspeed_i2c_write(bus, command, ASPEED_I2C_CMD_REG);
+}
+
+static void do_stop(struct aspeed_i2c_bus *bus)
+{
+	bus->master_state = ASPEED_I2C_MASTER_STOP;
+	aspeed_i2c_write(bus, ASPEED_I2CD_M_STOP_CMD,
+			 ASPEED_I2C_CMD_REG);
+}
+
+static void aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus)
+{
+	struct i2c_msg *msg = &bus->msgs[bus->msgs_index];
+	u32 irq_status, status_ack = 0, command = 0;
+	u8 recv_byte;
+
+	spin_lock(&bus->lock);
+	irq_status = aspeed_i2c_read(bus, ASPEED_I2C_INTR_STS_REG);
+
+	if (irq_status & ASPEED_I2CD_INTR_ERROR ||
+	    (!bus->msgs && bus->master_state != ASPEED_I2C_MASTER_STOP)) {
+		dev_dbg(bus->dev, "received error interrupt: 0x%08x",
+			irq_status);
+		bus->cmd_err = -EIO;
+		do_stop(bus);
+		goto out_no_complete;
+	}
+
+	if (irq_status & ASPEED_I2CD_INTR_BUS_RECOVER_DONE) {
+		bus->master_state = ASPEED_I2C_MASTER_INACTIVE;
+		status_ack |= ASPEED_I2CD_INTR_BUS_RECOVER_DONE;
+		goto out_complete;
+	}
+
+	if (bus->master_state == ASPEED_I2C_MASTER_START) {
+		if (!(irq_status & ASPEED_I2CD_INTR_TX_ACK)) {
+			dev_dbg(bus->dev,
+				"no slave present at %02x", msg->addr);
+			status_ack |= ASPEED_I2CD_INTR_TX_NAK;
+			bus->cmd_err = -EIO;
+			do_stop(bus);
+			goto out_no_complete;
+		} else {
+			status_ack |= ASPEED_I2CD_INTR_TX_ACK;
+			if (msg->flags & I2C_M_RD)
+				bus->master_state = ASPEED_I2C_MASTER_RX;
+			else
+				bus->master_state = ASPEED_I2C_MASTER_TX_FIRST;
+		}
+	}
+
+	switch (bus->master_state) {
+	case ASPEED_I2C_MASTER_TX:
+		if (irq_status & ASPEED_I2CD_INTR_TX_NAK) {
+			dev_dbg(bus->dev, "slave NACKed TX");
+			status_ack |= ASPEED_I2CD_INTR_TX_NAK;
+			bus->cmd_err = -EIO;
+			do_stop(bus);
+			goto out_no_complete;
+		} else if (!(irq_status & ASPEED_I2CD_INTR_TX_ACK)) {
+			dev_err(bus->dev, "slave failed to ACK TX");
+			goto out_complete;
+		}
+		status_ack |= ASPEED_I2CD_INTR_TX_ACK;
+		/* fallthrough intended */
+	case ASPEED_I2C_MASTER_TX_FIRST:
+		if (bus->buf_index < msg->len) {
+			bus->master_state = ASPEED_I2C_MASTER_TX;
+			aspeed_i2c_write(bus, msg->buf[bus->buf_index++],
+					 ASPEED_I2C_BYTE_BUF_REG);
+			aspeed_i2c_write(bus, ASPEED_I2CD_M_TX_CMD,
+					 ASPEED_I2C_CMD_REG);
+		} else if (bus->msgs_index + 1 < bus->msgs_size) {
+			bus->msgs_index++;
+			do_start(bus);
+		} else {
+			do_stop(bus);
+		}
+		goto out_no_complete;
+	case ASPEED_I2C_MASTER_RX:
+		if (!(irq_status & ASPEED_I2CD_INTR_RX_DONE)) {
+			dev_err(bus->dev, "master failed to RX");
+			goto out_complete;
+		}
+		status_ack |= ASPEED_I2CD_INTR_RX_DONE;
+
+		recv_byte = aspeed_i2c_read(bus, ASPEED_I2C_BYTE_BUF_REG) >> 8;
+		msg->buf[bus->buf_index++] = recv_byte;
+
+		if (msg->flags & I2C_M_RECV_LEN &&
+		    recv_byte <= I2C_SMBUS_BLOCK_MAX) {
+			msg->len = recv_byte +
+					((msg->flags & I2C_CLIENT_PEC) ? 2 : 1);
+			msg->flags &= ~I2C_M_RECV_LEN;
+		}
+
+		if (bus->buf_index < msg->len) {
+			bus->master_state = ASPEED_I2C_MASTER_RX;
+			command = ASPEED_I2CD_M_RX_CMD;
+			if (bus->buf_index + 1 == msg->len)
+				command |= ASPEED_I2CD_M_S_RX_CMD_LAST;
+			aspeed_i2c_write(bus, command, ASPEED_I2C_CMD_REG);
+		} else if (bus->msgs_index + 1 < bus->msgs_size) {
+			bus->msgs_index++;
+			do_start(bus);
+		} else {
+			do_stop(bus);
+		}
+		goto out_no_complete;
+	case ASPEED_I2C_MASTER_STOP:
+		if (!(irq_status & ASPEED_I2CD_INTR_NORMAL_STOP)) {
+			dev_err(bus->dev, "master failed to STOP");
+			bus->cmd_err = -EIO;
+		}
+		status_ack |= ASPEED_I2CD_INTR_NORMAL_STOP;
+
+		bus->master_state = ASPEED_I2C_MASTER_INACTIVE;
+		goto out_complete;
+	case ASPEED_I2C_MASTER_INACTIVE:
+		dev_err(bus->dev,
+			"master received interrupt 0x%08x, but is inactive",
+			irq_status);
+		bus->cmd_err = -EIO;
+		goto out_complete;
+	default:
+		WARN(1, "unknown master state\n");
+		bus->master_state = ASPEED_I2C_MASTER_INACTIVE;
+		bus->cmd_err = -EIO;
+		goto out_complete;
+	}
+
+out_complete:
+	complete(&bus->cmd_complete);
+out_no_complete:
+	if (irq_status != status_ack)
+		dev_err(bus->dev,
+			"irq handled != irq. expected 0x%08x, but was 0x%08x\n",
+			irq_status, status_ack);
+	aspeed_i2c_write(bus, irq_status, ASPEED_I2C_INTR_STS_REG);
+	spin_unlock(&bus->lock);
+}
+
+static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
+{
+	struct aspeed_i2c_bus *bus = dev_id;
+
+	aspeed_i2c_master_irq(bus);
+	return IRQ_HANDLED;
+}
+
+static int aspeed_i2c_master_xfer(struct i2c_adapter *adap,
+				  struct i2c_msg *msgs, int num)
+{
+	struct aspeed_i2c_bus *bus = adap->algo_data;
+	unsigned long time_left, flags;
+	int ret = 0;
+
+	bus->cmd_err = 0;
+
+	/* If bus is busy, attempt recovery. We assume a single master
+	 * environment.
+	 */
+	if (aspeed_i2c_read(bus, ASPEED_I2C_CMD_REG) &
+	    ASPEED_I2CD_BUS_BUSY_STS) {
+		ret = aspeed_i2c_recover_bus(bus);
+		if (ret)
+			return ret;
+	}
+
+	spin_lock_irqsave(&bus->lock, flags);
+	bus->msgs = msgs;
+	bus->msgs_index = 0;
+	bus->msgs_size = num;
+
+	do_start(bus);
+	reinit_completion(&bus->cmd_complete);
+	spin_unlock_irqrestore(&bus->lock, flags);
+
+	time_left = wait_for_completion_timeout(&bus->cmd_complete,
+						bus->adap.timeout);
+
+	spin_lock_irqsave(&bus->lock, flags);
+	bus->msgs = NULL;
+	if (time_left == 0)
+		ret = -ETIMEDOUT;
+	else
+		ret = bus->cmd_err;
+	spin_unlock_irqrestore(&bus->lock, flags);
+
+	/* If nothing went wrong, return number of messages transferred. */
+	if (ret >= 0)
+		return bus->msgs_index + 1;
+	else
+		return ret;
+}
+
+static u32 aspeed_i2c_functionality(struct i2c_adapter *adap)
+{
+	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL | I2C_FUNC_SMBUS_BLOCK_DATA;
+}
+
+static const struct i2c_algorithm aspeed_i2c_algo = {
+	.master_xfer	= aspeed_i2c_master_xfer,
+	.functionality	= aspeed_i2c_functionality,
+};
+
+static u32 aspeed_i2c_get_clk_reg_val(u32 divisor)
+{
+	u32 base_clk, clk_high, clk_low, tmp;
+
+	/*
+	 * The actual clock frequency of SCL is:
+	 *	SCL_freq = base_freq * (SCL_high + SCL_low)
+	 *		 = APB_freq / divisor
+	 * where base_freq is a programmable clock divider; its value is
+	 *	base_freq = 1 << base_clk
+	 * SCL_high is the number of base_freq clock cycles that SCL stays high
+	 * and SCL_low is the number of base_freq clock cycles that SCL stays
+	 * low for a period of SCL.
+	 * The actual register has a minimum SCL_high and SCL_low minimum of 1;
+	 * thus, they start counting at zero. So
+	 *	SCL_high = clk_high + 1
+	 *	SCL_low	 = clk_low + 1
+	 * Thus,
+	 *	SCL_freq = (1 << base_clk) * (clk_high + 1 + clk_low + 1)
+	 * The documentation recommends clk_high >= 8 and clk_low >= 7 when
+	 * possible; this last constraint gives us the following solution:
+	 */
+	base_clk = divisor > 32 ? ilog2(divisor / 16 - 1) : 0;
+	tmp = divisor / (1 << base_clk);
+	clk_high = tmp / 2 + tmp % 2;
+	clk_low = tmp - clk_high;
+
+	clk_high -= 1;
+	clk_low -= 1;
+
+	return ((clk_high << ASPEED_I2CD_TIME_SCL_HIGH_SHIFT)
+		& ASPEED_I2CD_TIME_SCL_HIGH_MASK)
+			| ((clk_low << ASPEED_I2CD_TIME_SCL_LOW_SHIFT)
+			   & ASPEED_I2CD_TIME_SCL_LOW_MASK)
+			| (base_clk & ASPEED_I2CD_TIME_BASE_DIVISOR_MASK);
+}
+
+static int aspeed_i2c_init_clk(struct aspeed_i2c_bus *bus,
+			       struct platform_device *pdev)
+{
+	u32 clk_freq, divisor;
+	struct clk *pclk;
+	int ret;
+
+	pclk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(pclk)) {
+		dev_err(&pdev->dev, "clk_get failed\n");
+		return PTR_ERR(pclk);
+	}
+	ret = of_property_read_u32(pdev->dev.of_node,
+				   "clock-frequency", &clk_freq);
+	if (ret < 0) {
+		dev_err(&pdev->dev,
+			"Could not read clock-frequency property\n");
+		clk_freq = 100000;
+	}
+	divisor = clk_get_rate(pclk) / clk_freq;
+	/* We just need the clock rate, we don't actually use the clk object. */
+	devm_clk_put(&pdev->dev, pclk);
+
+	/* Set AC Timing */
+	if (clk_freq / 1000 > 1000) {
+		aspeed_i2c_write(bus, aspeed_i2c_read(bus,
+						      ASPEED_I2C_FUN_CTRL_REG) |
+				ASPEED_I2CD_M_HIGH_SPEED_EN |
+				ASPEED_I2CD_M_SDA_DRIVE_1T_EN |
+				ASPEED_I2CD_SDA_DRIVE_1T_EN,
+				ASPEED_I2C_FUN_CTRL_REG);
+
+		aspeed_i2c_write(bus, 0x3, ASPEED_I2C_AC_TIMING_REG2);
+		aspeed_i2c_write(bus, aspeed_i2c_get_clk_reg_val(divisor),
+				 ASPEED_I2C_AC_TIMING_REG1);
+	} else {
+		aspeed_i2c_write(bus, aspeed_i2c_get_clk_reg_val(divisor),
+				 ASPEED_I2C_AC_TIMING_REG1);
+		aspeed_i2c_write(bus, ASPEED_NO_TIMEOUT_CTRL,
+				 ASPEED_I2C_AC_TIMING_REG2);
+	}
+
+	return 0;
+}
+
+static int aspeed_i2c_probe_bus(struct platform_device *pdev)
+{
+	struct aspeed_i2c_bus *bus;
+	struct resource *res;
+	int ret;
+
+	bus = devm_kzalloc(&pdev->dev, sizeof(*bus), GFP_KERNEL);
+	if (!bus)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	bus->base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(bus->base)) {
+		dev_err(&pdev->dev, "failed to devm_ioremap_resource\n");
+		return PTR_ERR(bus->base);
+	}
+
+	bus->irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
+	ret = devm_request_irq(&pdev->dev, bus->irq, aspeed_i2c_bus_irq,
+			       IRQF_SHARED, dev_name(&pdev->dev), bus);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "failed to request interrupt\n");
+		return ret;
+	}
+
+	/* Initialize the I2C adapter */
+	spin_lock_init(&bus->lock);
+	init_completion(&bus->cmd_complete);
+	bus->adap.owner = THIS_MODULE;
+	bus->adap.retries = 0;
+	bus->adap.timeout = 5 * HZ;
+	bus->adap.algo = &aspeed_i2c_algo;
+	bus->adap.algo_data = bus;
+	bus->adap.dev.parent = &pdev->dev;
+	bus->adap.dev.of_node = pdev->dev.of_node;
+	snprintf(bus->adap.name, sizeof(bus->adap.name), "Aspeed i2c");
+
+	bus->dev = &pdev->dev;
+
+	/* reset device: disable master & slave functions */
+	aspeed_i2c_write(bus, 0, ASPEED_I2C_FUN_CTRL_REG);
+
+	ret = aspeed_i2c_init_clk(bus, pdev);
+	if (ret < 0)
+		return ret;
+
+	/* Enable Master Mode */
+	aspeed_i2c_write(bus, aspeed_i2c_read(bus, ASPEED_I2C_FUN_CTRL_REG) |
+		      ASPEED_I2CD_MASTER_EN |
+		      ASPEED_I2CD_MULTI_MASTER_DIS, ASPEED_I2C_FUN_CTRL_REG);
+
+	/* Set interrupt generation of I2C controller */
+	aspeed_i2c_write(bus, ASPEED_I2CD_INTR_ALL, ASPEED_I2C_INTR_CTRL_REG);
+
+	ret = i2c_add_adapter(&bus->adap);
+	if (ret < 0)
+		return ret;
+
+	platform_set_drvdata(pdev, bus);
+
+	dev_info(bus->dev, "i2c bus %d registered, irq %d\n",
+		 bus->adap.nr, bus->irq);
+
+	return 0;
+}
+
+static int aspeed_i2c_remove_bus(struct platform_device *pdev)
+{
+	struct aspeed_i2c_bus *bus = platform_get_drvdata(pdev);
+
+	i2c_del_adapter(&bus->adap);
+
+	return 0;
+}
+
+static const struct of_device_id aspeed_i2c_bus_of_table[] = {
+	{ .compatible = "aspeed,ast2400-i2c-bus", },
+	{ .compatible = "aspeed,ast2500-i2c-bus", },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, aspeed_i2c_bus_of_table);
+
+static struct platform_driver aspeed_i2c_bus_driver = {
+	.probe		= aspeed_i2c_probe_bus,
+	.remove		= aspeed_i2c_remove_bus,
+	.driver		= {
+		.name		= "ast-i2c-bus",
+		.of_match_table	= aspeed_i2c_bus_of_table,
+	},
+};
+module_platform_driver(aspeed_i2c_bus_driver);
+
+MODULE_AUTHOR("Brendan Higgins <brendanhiggins@google.com>");
+MODULE_DESCRIPTION("Aspeed I2C Bus Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.12.2.564.g063fe858b8-goog
