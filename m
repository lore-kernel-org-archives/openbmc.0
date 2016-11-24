Return-Path: <maxims@google.com>
Received: from mail-pf0-x236.google.com (mail-pf0-x236.google.com
 [IPv6:2607:f8b0:400e:c00::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tPKnH6PHmzDvpd
 for <openbmc@lists.ozlabs.org>; Thu, 24 Nov 2016 11:28:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="o2LDNKcK"; 
 dkim-atps=neutral
Received: by mail-pf0-x236.google.com with SMTP id 189so5939255pfz.3
 for <openbmc@lists.ozlabs.org>; Wed, 23 Nov 2016 16:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=pDVOU9UlJwnDi62qbl+kla7ZvLyW/HetM6UkclCxqXo=;
 b=o2LDNKcK46nsqtIz9dhYh8D1c9dV8XrnKI+XDu7Fw8Y76fTuJNWRXDfKITq5xMoXb2
 4kR3yhK+yeurxntb52MgnpZHt39WvZc14nsHRxbB/0SPD6gRfKkhBD9DeToFIxMtbe1E
 vjgAuCoVDIaCT27OQUW6XJzIYNtQFiYN+MSFrNZ9nhAla2QCrEjQIkjyJgq2vLO7BxB+
 CLkWMMSCJNo4nZTBGX3t3rf9rm4JTlUZtQjI6HJwjd4uaONzIamYmyKby5OEMNwEK+Im
 4bzar0NpYmA9dyPX7q5xfFt0YV+oQtewGsB982i7B/BJ/hrmEV9mrWu2Q0wpQVLnKRVP
 0ALg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=pDVOU9UlJwnDi62qbl+kla7ZvLyW/HetM6UkclCxqXo=;
 b=HjYugtx32Ea4BpQBScZ5E6HkoJsM607WmCOKW37KYPeTYfSbFo6rYAzE4ijlm94Y3Y
 jH9LPiqgaVuK1JVlfoetOMKgmLefCkNoZzcD5PSDR/F0ZG3/YYXoqKU6GzTKX9dnClsM
 OnWSdoMFHqlMDJ1DUe9oZ1SPvxhICrT5JhtYJg6zzo2OAGP1+Yn/FRJyQnB11khjMw3U
 N2NzaWAj/Vm3mwdTc3p94C9l2qrBuZmkbeGh0UL919fUJK6gXwnNSe01qRK0mz6qbsli
 sCShKBGazfAgNUMnmtuFuy9u6P5ioO+ME99ybNsnKmD/g+njW1f/EGK6n0SPh1AeVSSO
 f5PQ==
X-Gm-Message-State: AKaTC02e3njX/uSTBaT9AjV60mToQI2mxBXB1CTaQb1mTPNBTcD2JnfqaLIa1uJtijUviKdJ
X-Received: by 10.99.141.193 with SMTP id z184mr9992629pgd.23.1479947313682;
 Wed, 23 Nov 2016 16:28:33 -0800 (PST)
Received: from mxsl.svl.corp.google.com ([100.123.242.80])
 by smtp.gmail.com with ESMTPSA id d1sm55255435pfb.76.2016.11.23.16.28.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 23 Nov 2016 16:28:33 -0800 (PST)
From: Maxim Sloyko <maxims@google.com>
To: sjg@chromium.org
Cc: openbmc@lists.ozlabs.org,
	Maxim Sloyko <maxims@google.com>
Subject: [PATCH u-boot v2 6/6] aspeed: I2C driver
Date: Wed, 23 Nov 2016 16:28:12 -0800
Message-Id: <1479947292-121635-6-git-send-email-maxims@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1479947292-121635-1-git-send-email-maxims@google.com>
References: <1479858976-139210-1-git-send-email-maxims@google.com>
 <1479947292-121635-1-git-send-email-maxims@google.com>
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
X-List-Received-Date: Thu, 24 Nov 2016 00:28:36 -0000

The driver is very limited: only single master mode is supported
and only byte-by-byte synchronous reads and writes are supported,
no Pool Buffers or DMA.

Signed-off-by: Maxim Sloyko <maxims@google.com>
---
Changes for v1:
	- Style fixes: blank lines, line formatting, dropped inline from definitions
	- More documentation for CONFIG_SYS_I2C_AST
	- Use standard ETIMEOUT error
	- Documented struct ast_i2c
	- Documented get_clk_reg_val function
	- Rewritten get_clk_reg_val to use register masks and shifts defined in ast_i2c.h
	- Dropped AST_ prefix from AST_I2CD_ defines
Changes for v2:
	- More style fixes for things missed in v1
	- Return error from ast_i2c_xfer on deblock failure
---
 drivers/i2c/Kconfig   |   9 ++
 drivers/i2c/Makefile  |   1 +
 drivers/i2c/ast_i2c.c | 335 ++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/i2c/ast_i2c.h | 130 ++++++++++++++++++++
 4 files changed, 475 insertions(+)
 create mode 100644 drivers/i2c/ast_i2c.c
 create mode 100644 drivers/i2c/ast_i2c.h

diff --git a/drivers/i2c/Kconfig b/drivers/i2c/Kconfig
index 6e22bba..425766a 100644
--- a/drivers/i2c/Kconfig
+++ b/drivers/i2c/Kconfig
@@ -90,6 +90,15 @@ config SYS_I2C_DW_ENABLE_STATUS_UNSUPPORTED
 	  enable status register. This config option can be enabled in such
 	  cases.

+config SYS_I2C_AST
+	bool "Aspeed I2C Controller"
+	depends on DM_I2C
+	help
+	  Say yes here to select Aspeed I2C Host Controller. The driver
+	  supports AST2500 and AST2400 controllers, but is very limited.
+	  Only single master mode is supported and only byte-by-byte
+	  synchronous reads and writes are supported, no Pool Buffers or DMA.
+
 config SYS_I2C_INTEL
 	bool "Intel I2C/SMBUS driver"
 	depends on DM_I2C
diff --git a/drivers/i2c/Makefile b/drivers/i2c/Makefile
index 167424d..89e046e 100644
--- a/drivers/i2c/Makefile
+++ b/drivers/i2c/Makefile
@@ -16,6 +16,7 @@ obj-$(CONFIG_PCA9564_I2C) += pca9564_i2c.o
 obj-$(CONFIG_TSI108_I2C) += tsi108_i2c.o
 obj-$(CONFIG_SH_SH7734_I2C) += sh_sh7734_i2c.o
 obj-$(CONFIG_SYS_I2C) += i2c_core.o
+obj-$(CONFIG_SYS_I2C_AST) += ast_i2c.o
 obj-$(CONFIG_SYS_I2C_CADENCE) += i2c-cdns.o
 obj-$(CONFIG_SYS_I2C_DAVINCI) += davinci_i2c.o
 obj-$(CONFIG_SYS_I2C_DW) += designware_i2c.o
diff --git a/drivers/i2c/ast_i2c.c b/drivers/i2c/ast_i2c.c
new file mode 100644
index 0000000..c8ad635
--- /dev/null
+++ b/drivers/i2c/ast_i2c.c
@@ -0,0 +1,335 @@
+/*
+ * Copyright (C) 2012-2020  ASPEED Technology Inc.
+ * Copyright 2016 IBM Corporation
+ * Copyright 2016 Google, Inc.
+ *
+ * SPDX-License-Identifier:	GPL-2.0+
+ */
+
+#include <common.h>
+#include <dm.h>
+#include <fdtdec.h>
+#include <i2c.h>
+
+#include <asm/arch/ast_scu.h>
+#include <asm/arch/regs-scu.h>
+#include <asm/io.h>
+#include <errno.h>
+
+#include "ast_i2c.h"
+
+#define I2C_TIMEOUT_US 100000
+#define I2C_SLEEP_STEP_US 20
+
+DECLARE_GLOBAL_DATA_PTR;
+
+/*
+ * Device private data
+ */
+struct ast_i2c {
+	/* Device registers */
+	struct ast_i2c_regs *regs;
+	/* I2C speed in Hz */
+	int speed;
+};
+
+/*
+ * Given desired divider ratio, return the value that needs to be set
+ * in Clock and AC Timing Control register
+ */
+static u32 get_clk_reg_val(ulong divider_ratio)
+{
+	ulong inc = 0, div;
+	ulong scl_low, scl_high, data;
+
+	for (div = 0; divider_ratio >= 16; div++) {
+		inc |= (divider_ratio & 1);
+		divider_ratio >>= 1;
+	}
+	divider_ratio += inc;
+	scl_low = (divider_ratio >> 1) - 1;
+	scl_high = divider_ratio - scl_low - 2;
+	data = I2CD_CACTC_BASE
+			| (scl_high << I2CD_TCKHIGH_SHIFT)
+			| (scl_low << I2CD_TCKLOW_SHIFT)
+			| (div << I2CD_BASE_DIV_SHIFT);
+
+	return data;
+}
+
+static void ast_i2c_clear_interrupts(struct ast_i2c_regs *i2c_base)
+{
+	writel(~0, &i2c_base->isr);
+}
+
+static void ast_i2c_init_bus(struct ast_i2c *i2c_bus)
+{
+	/* Reset device */
+	writel(0, &i2c_bus->regs->fcr);
+	/* Enable Master Mode. Assuming single-master */
+	debug("Enable Master for %p\n", i2c_bus->regs);
+	writel(I2CD_MASTER_EN
+	       | I2CD_M_SDA_LOCK_EN
+	       | I2CD_MULTI_MASTER_DIS | I2CD_M_SCL_DRIVE_EN,
+	       &i2c_bus->regs->fcr);
+	debug("FCR: %p\n", &i2c_bus->regs->fcr);
+	/* Enable Interrupts */
+	writel(I2CD_INTR_TX_ACK
+	       | I2CD_INTR_TX_NAK
+	       | I2CD_INTR_RX_DONE
+	       | I2CD_INTR_BUS_RECOVER_DONE
+	       | I2CD_INTR_NORMAL_STOP
+	       | I2CD_INTR_ABNORMAL, &i2c_bus->regs->icr);
+}
+
+static int ast_i2c_ofdata_to_platdata(struct udevice *dev)
+{
+	struct ast_i2c *i2c_bus = dev_get_priv(dev);
+	struct ast_i2c_regs *i2c_base =
+	    (struct ast_i2c_regs *)dev_get_addr(dev);
+
+	if (IS_ERR(i2c_base))
+		return PTR_ERR(i2c_base);
+
+	i2c_bus->regs = i2c_base;
+
+	return 0;
+}
+
+static int ast_i2c_probe(struct udevice *dev)
+{
+	struct ast_i2c *i2c_bus = dev_get_priv(dev);
+
+	debug("Enabling I2C%u\n", dev->seq);
+	ast_scu_enable_i2c(dev->seq);
+
+	ast_i2c_init_bus(i2c_bus);
+
+	return 0;
+}
+
+static inline int ast_i2c_wait_isr(struct ast_i2c_regs *i2c_base, u32 flag)
+{
+	int timeout = I2C_TIMEOUT_US;
+
+	while (!(readl(&i2c_base->isr) & flag) && timeout > 0) {
+		udelay(I2C_SLEEP_STEP_US);
+		timeout -= I2C_SLEEP_STEP_US;
+	}
+
+	ast_i2c_clear_interrupts(i2c_base);
+	if (timeout <= 0)
+		return -ETIMEDOUT;
+
+	return 0;
+}
+
+static inline int ast_i2c_send_stop(struct ast_i2c_regs *i2c_base)
+{
+	writel(I2CD_M_STOP_CMD, &i2c_base->csr);
+
+	return ast_i2c_wait_isr(i2c_base, I2CD_INTR_NORMAL_STOP);
+}
+
+static inline int ast_i2c_wait_tx(struct ast_i2c_regs *i2c_base)
+{
+	int timeout = I2C_TIMEOUT_US;
+	u32 flag = I2CD_INTR_TX_ACK | I2CD_INTR_TX_NAK;
+	u32 status = readl(&i2c_base->isr) & flag;
+	int ret = 0;
+
+	while (!status && timeout > 0) {
+		status = readl(&i2c_base->isr) & flag;
+		udelay(I2C_SLEEP_STEP_US);
+		timeout -= I2C_SLEEP_STEP_US;
+	}
+
+	if (status == I2CD_INTR_TX_NAK)
+		ret = -EREMOTEIO;
+
+	if (timeout <= 0)
+		ret = -ETIMEDOUT;
+
+	ast_i2c_clear_interrupts(i2c_base);
+
+	return ret;
+}
+
+static int ast_i2c_start_txn(struct ast_i2c_regs *i2c_base, uint devaddr)
+{
+	/* Start and Send Device Address */
+	writel(devaddr, &i2c_base->trbbr);
+	writel(I2CD_M_START_CMD | I2CD_M_TX_CMD, &i2c_base->csr);
+
+	return ast_i2c_wait_tx(i2c_base);
+}
+
+static int ast_i2c_read_data(struct ast_i2c *i2c_bus, u8 chip_addr, u8 *buffer,
+			     size_t len, bool send_stop)
+{
+	struct ast_i2c_regs *i2c_base = i2c_bus->regs;
+	int i2c_error =
+	    ast_i2c_start_txn(i2c_base, (chip_addr << 1) | I2C_M_RD);
+	u32 i2c_cmd = I2CD_M_RX_CMD;
+
+	if (i2c_error < 0)
+		return i2c_error;
+
+	for (; len > 0; len--, buffer++) {
+		if (len == 1)
+			i2c_cmd |= I2CD_M_S_RX_CMD_LAST;
+		writel(i2c_cmd, &i2c_base->csr);
+		i2c_error = ast_i2c_wait_isr(i2c_base, I2CD_INTR_RX_DONE);
+		if (i2c_error < 0)
+			return i2c_error;
+		*buffer = (readl(&i2c_base->trbbr) & I2CD_RX_DATA_MASK)
+				>> I2CD_RX_DATA_SHIFT;
+	}
+	ast_i2c_clear_interrupts(i2c_base);
+
+	if (send_stop)
+		return ast_i2c_send_stop(i2c_base);
+
+	return 0;
+}
+
+static int ast_i2c_write_data(struct ast_i2c *i2c_bus, u8 chip_addr, u8
+			      *buffer, size_t len, bool send_stop)
+{
+	struct ast_i2c_regs *i2c_base = i2c_bus->regs;
+	int i2c_error = ast_i2c_start_txn(i2c_base, (chip_addr << 1));
+
+	if (i2c_error < 0)
+		return i2c_error;
+
+	for (; len > 0; len--, buffer++) {
+		writel(*buffer, &i2c_base->trbbr);
+		writel(I2CD_M_TX_CMD, &i2c_base->csr);
+		i2c_error = ast_i2c_wait_tx(i2c_base);
+		if (i2c_error < 0)
+			return i2c_error;
+	}
+
+	if (send_stop)
+		return ast_i2c_send_stop(i2c_base);
+
+	return 0;
+}
+
+static int ast_i2c_deblock(struct udevice *dev)
+{
+	struct ast_i2c *i2c_bus = dev_get_priv(dev);
+	struct ast_i2c_regs *i2c_base = i2c_bus->regs;
+	u32 csr = readl(&i2c_base->csr);
+	bool sda_high = csr & I2CD_SDA_LINE_STS;
+	bool scl_high = csr & I2CD_SCL_LINE_STS;
+
+	int ret = 0;
+
+	if (sda_high && scl_high) {
+		/* Bus is idle, no deblocking needed. */
+		return 0;
+	} else if (sda_high) {
+		/* Send stop command */
+		debug("Unterminated TXN in (%x), sending stop\n", csr);
+		ret = ast_i2c_send_stop(i2c_base);
+	} else if (scl_high) {
+		/* Possibly stuck slave */
+		debug("Bus stuck (%x), attempting recovery\n", csr);
+		writel(I2CD_BUS_RECOVER_CMD, &i2c_base->csr);
+		ret = ast_i2c_wait_isr(i2c_base, I2CD_INTR_BUS_RECOVER_DONE);
+	} else {
+		/* Just try to reinit the device. */
+		ast_i2c_init_bus(i2c_bus);
+	}
+
+	return ret;
+}
+
+static int ast_i2c_xfer(struct udevice *dev, struct i2c_msg *msg, int nmsgs)
+{
+	struct ast_i2c *i2c_bus = dev_get_priv(dev);
+	int ret = ast_i2c_deblock(dev);
+
+	if (ret < 0)
+		return ret;
+	debug("i2c_xfer: %d messages\n", nmsgs);
+	for (; nmsgs > 0; nmsgs--, msg++) {
+		if (msg->flags & I2C_M_RD) {
+			debug("i2c_read: chip=0x%x, len=0x%x, flags=0x%x\n",
+			      msg->addr, msg->len, msg->flags);
+			ret = ast_i2c_read_data(i2c_bus, msg->addr, msg->buf,
+						msg->len, (nmsgs == 1));
+		} else {
+			debug("i2c_write: chip=0x%x, len=0x%x, flags=0x%x\n",
+			      msg->addr, msg->len, msg->flags);
+			ret = ast_i2c_write_data(i2c_bus, msg->addr, msg->buf,
+						 msg->len, (nmsgs == 1));
+		}
+		if (ret) {
+			debug("%s: error (%d)\n", __func__, ret);
+			return -EREMOTEIO;
+		}
+	}
+
+	return 0;
+}
+
+static int ast_i2c_set_speed(struct udevice *dev, unsigned int speed)
+{
+	struct ast_i2c *i2c_bus = dev_get_priv(dev);
+	struct ast_i2c_regs *i2c_base = i2c_bus->regs;
+	ulong pclk, divider;
+
+	debug("Setting speed ofr I2C%d to <%u>\n", dev->seq, speed);
+	if (!speed) {
+		debug("No valid speed specified\n");
+		return -EINVAL;
+	}
+
+	pclk = ast_get_apbclk();
+	divider = pclk / speed;
+
+	i2c_bus->speed = speed;
+	if (speed > 400000) {
+		debug("Enabling High Speed\n");
+		setbits_le32(&i2c_base->fcr, I2CD_M_HIGH_SPEED_EN
+			     | I2CD_M_SDA_DRIVE_1T_EN
+			     | I2CD_SDA_DRIVE_1T_EN);
+		writel(0x3, &i2c_base->cactcr2);
+		writel(get_clk_reg_val(divider), &i2c_base->cactcr1);
+	} else {
+		debug("Enabling Normal Speed\n");
+		writel(get_clk_reg_val(divider), &i2c_base->cactcr1);
+		writel(I2CD_NO_TIMEOUT_CTRL, &i2c_base->cactcr2);
+	}
+
+	ast_i2c_clear_interrupts(i2c_base);
+
+	return 0;
+}
+
+static const struct dm_i2c_ops ast_i2c_ops = {
+	.xfer = ast_i2c_xfer,
+	.set_bus_speed = ast_i2c_set_speed,
+	.deblock = ast_i2c_deblock,
+};
+
+static const struct udevice_id ast_i2c_ids[] = {
+	{.compatible = "aspeed,ast2400-i2c-controller",},
+	{.compatible = "aspeed,ast2400-i2c-bus",},
+	{},
+};
+
+/* Tell GNU Indent to keep this as is: */
+/* *INDENT-OFF* */
+U_BOOT_DRIVER(i2c_aspeed) = {
+	.name = "i2c_aspeed",
+	.id = UCLASS_I2C,
+	.of_match = ast_i2c_ids,
+	.probe = ast_i2c_probe,
+	.ofdata_to_platdata = ast_i2c_ofdata_to_platdata,
+	.priv_auto_alloc_size = sizeof(struct ast_i2c),
+	.ops = &ast_i2c_ops,
+};
+/* *INDENT-ON* */
diff --git a/drivers/i2c/ast_i2c.h b/drivers/i2c/ast_i2c.h
new file mode 100644
index 0000000..ecdb4fe
--- /dev/null
+++ b/drivers/i2c/ast_i2c.h
@@ -0,0 +1,130 @@
+/*
+ * Copyright (C) 2012-2020  ASPEED Technology Inc.
+ * Copyright 2016 IBM Corporation
+ * Copyright 2016 Google, Inc.
+ *
+ * SPDX-License-Identifier:	GPL-2.0+
+ */
+#ifndef __AST_I2C_H_
+#define __AST_I2C_H_
+
+struct ast_i2c_regs {
+	u32 fcr;
+	u32 cactcr1;
+	u32 cactcr2;
+	u32 icr;
+	u32 isr;
+	u32 csr;
+	u32 sdar;
+	u32 pbcr;
+	u32 trbbr;
+#ifdef CONFIG_TARGET_AST_G5
+	u32 dma_mbar;
+	u32 dma_tlr;
+#endif
+};
+
+/* Device Register Definition */
+/* 0x00 : I2CD Function Control Register  */
+#define I2CD_BUFF_SEL_MASK				(0x7 << 20)
+#define I2CD_BUFF_SEL(x)				(x << 20)
+#define I2CD_M_SDA_LOCK_EN			(0x1 << 16)
+#define I2CD_MULTI_MASTER_DIS			(0x1 << 15)
+#define I2CD_M_SCL_DRIVE_EN		(0x1 << 14)
+#define I2CD_MSB_STS					(0x1 << 9)
+#define I2CD_SDA_DRIVE_1T_EN			(0x1 << 8)
+#define I2CD_M_SDA_DRIVE_1T_EN		(0x1 << 7)
+#define I2CD_M_HIGH_SPEED_EN		(0x1 << 6)
+#define I2CD_DEF_ADDR_EN				(0x1 << 5)
+#define I2CD_DEF_ALERT_EN				(0x1 << 4)
+#define I2CD_DEF_ARP_EN					(0x1 << 3)
+#define I2CD_DEF_GCALL_EN				(0x1 << 2)
+#define I2CD_SLAVE_EN					(0x1 << 1)
+#define I2CD_MASTER_EN					(0x1)
+
+/* 0x04 : I2CD Clock and AC Timing Control Register #1 */
+/* Base register value. These bits are always set by the driver. */
+#define I2CD_CACTC_BASE			0xfff00300
+#define I2CD_TCKHIGH_SHIFT			16
+#define I2CD_TCKLOW_SHIFT			12
+#define I2CD_THDDAT_SHIFT			10
+#define I2CD_TO_DIV_SHIFT			8
+#define I2CD_BASE_DIV_SHIFT			0
+
+/* 0x08 : I2CD Clock and AC Timing Control Register #2 */
+#define I2CD_tTIMEOUT					1
+#define I2CD_NO_TIMEOUT_CTRL			0
+
+/* 0x0c : I2CD Interrupt Control Register &
+ * 0x10 : I2CD Interrupt Status Register
+ *
+ * These share bit definitions, so use the same values for the enable &
+ * status bits.
+ */
+#define I2CD_INTR_SDA_DL_TIMEOUT			(0x1 << 14)
+#define I2CD_INTR_BUS_RECOVER_DONE			(0x1 << 13)
+#define I2CD_INTR_SMBUS_ALERT			(0x1 << 12)
+#define I2CD_INTR_SMBUS_ARP_ADDR			(0x1 << 11)
+#define I2CD_INTR_SMBUS_DEV_ALERT_ADDR		(0x1 << 10)
+#define I2CD_INTR_SMBUS_DEF_ADDR			(0x1 << 9)
+#define I2CD_INTR_GCALL_ADDR			(0x1 << 8)
+#define I2CD_INTR_SLAVE_MATCH			(0x1 << 7)
+#define I2CD_INTR_SCL_TIMEOUT			(0x1 << 6)
+#define I2CD_INTR_ABNORMAL				(0x1 << 5)
+#define I2CD_INTR_NORMAL_STOP			(0x1 << 4)
+#define I2CD_INTR_ARBIT_LOSS			(0x1 << 3)
+#define I2CD_INTR_RX_DONE				(0x1 << 2)
+#define I2CD_INTR_TX_NAK				(0x1 << 1)
+#define I2CD_INTR_TX_ACK				(0x1 << 0)
+
+/* 0x14 : I2CD Command/Status Register   */
+#define I2CD_SDA_OE					(0x1 << 28)
+#define I2CD_SDA_O					(0x1 << 27)
+#define I2CD_SCL_OE					(0x1 << 26)
+#define I2CD_SCL_O					(0x1 << 25)
+#define I2CD_TX_TIMING				(0x1 << 24)
+#define I2CD_TX_STATUS				(0x1 << 23)
+
+/* Tx State Machine */
+#define I2CD_IDLE					0x0
+#define I2CD_MACTIVE				0x8
+#define I2CD_MSTART					0x9
+#define I2CD_MSTARTR				0xa
+#define I2CD_MSTOP					0xb
+#define I2CD_MTXD					0xc
+#define I2CD_MRXACK					0xd
+#define I2CD_MRXD					0xe
+#define I2CD_MTXACK				0xf
+#define I2CD_SWAIT					0x1
+#define I2CD_SRXD					0x4
+#define I2CD_STXACK				0x5
+#define I2CD_STXD					0x6
+#define I2CD_SRXACK				0x7
+#define I2CD_RECOVER				0x3
+
+#define I2CD_SCL_LINE_STS				(0x1 << 18)
+#define I2CD_SDA_LINE_STS				(0x1 << 17)
+#define I2CD_BUS_BUSY_STS				(0x1 << 16)
+#define I2CD_SDA_OE_OUT_DIR				(0x1 << 15)
+#define I2CD_SDA_O_OUT_DIR				(0x1 << 14)
+#define I2CD_SCL_OE_OUT_DIR				(0x1 << 13)
+#define I2CD_SCL_O_OUT_DIR				(0x1 << 12)
+#define I2CD_BUS_RECOVER_CMD			(0x1 << 11)
+#define I2CD_S_ALT_EN				(0x1 << 10)
+#define I2CD_RX_DMA_ENABLE				(0x1 << 9)
+#define I2CD_TX_DMA_ENABLE				(0x1 << 8)
+
+/* Command Bit */
+#define I2CD_RX_BUFF_ENABLE				(0x1 << 7)
+#define I2CD_TX_BUFF_ENABLE				(0x1 << 6)
+#define I2CD_M_STOP_CMD					(0x1 << 5)
+#define I2CD_M_S_RX_CMD_LAST			(0x1 << 4)
+#define I2CD_M_RX_CMD					(0x1 << 3)
+#define I2CD_S_TX_CMD					(0x1 << 2)
+#define I2CD_M_TX_CMD					(0x1 << 1)
+#define I2CD_M_START_CMD				0x1
+
+#define I2CD_RX_DATA_SHIFT			8
+#define I2CD_RX_DATA_MASK			(0xff << I2CD_RX_DATA_SHIFT)
+
+#endif				/* __AST_I2C_H_ */
--
2.8.0.rc3.226.g39d4020
