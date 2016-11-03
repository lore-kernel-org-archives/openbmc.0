Return-Path: <maxims@google.com>
Received: from mail-pf0-x22c.google.com (mail-pf0-x22c.google.com
 [IPv6:2607:f8b0:400e:c00::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t8tSb54dszDvPT
 for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2016 05:15:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=KaQEWLGf; 
 dkim-atps=neutral
Received: by mail-pf0-x22c.google.com with SMTP id n85so35655414pfi.1
 for <openbmc@lists.ozlabs.org>; Thu, 03 Nov 2016 11:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=OLqgtsmmUYwSQqhOz7FlE+CHbUUz09f9x2DajcJ5zJE=;
 b=KaQEWLGfcmOxxLw5K8PzJadhpDPweKLqgNtterZxrm5C2YpxsiKfvIJ4ROGzA7Uxl3
 C08AvNaBWEjQMJ+Yyv+MERhOADMM/4KxyuPF7k+w0ws9VTdNWPjwSjS0OlIO1humg+u2
 4VLZ3VBpOaoTpVTkZiQ/xB0OsYrHUysd5oJiyoSGdtG+Hu3cO+/pGEkfExe7tXNOOPX2
 qN8XY76xcDxR3Somr4SwbyPMvtMvsll/95koqT/OPmZmYn1lJxGHMJV2H2qMNsn7fDzF
 3kQgrcNTaqafIs0ClXrvmru8yj8l/e3G+1McJy39YBy08gXKeuGaFaai981MeC1NSKgf
 ejOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=OLqgtsmmUYwSQqhOz7FlE+CHbUUz09f9x2DajcJ5zJE=;
 b=dcFEOyfm7C/Y6L7MrX+BmuO0GVHJ/CvqUl4ckc2f5C2OReSdCRLfn1t6NEWT6tWr7Y
 EyNTMrSsbCaECNbF0orN1OtWONiOg0CYkO3uiaBTxxQN4pny975fw+UyWv4YyuoE4/qZ
 rA4loJZP1APsXPQ82zjbr1O7oji6WUmpl3tm4Nbx4jpUMUtzJw41M6VcM0nwVdY10rAo
 eAEx/OsNqR0e8ibyaMpd49I+2S8Jhz/jCR9EZ57kHv6tMxkmlxsaj05L8jj/E/OqrzZh
 Da+K7P5BayJf91QonTR1Csx3ld7LJf/SSqtUOZa5f9qMlhsgvSzSuyb/GkLFauXm7r1F
 Milg==
X-Gm-Message-State: ABUngvdqD+APuBEcYDLFMdRL8Xue8Kzco+pBKgLVKHQ3PC1o4ifsm44Mr2ysjrQsr8E950r7
X-Received: by 10.98.71.218 with SMTP id p87mr17641302pfi.125.1478196957316;
 Thu, 03 Nov 2016 11:15:57 -0700 (PDT)
Received: from mxsl.svl.corp.google.com ([100.123.242.80])
 by smtp.gmail.com with ESMTPSA id h5sm14297843pfg.86.2016.11.03.11.15.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 03 Nov 2016 11:15:56 -0700 (PDT)
From: maxims@google.com
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot 5/5] aspeed: I2C driver.
Date: Thu,  3 Nov 2016 11:15:04 -0700
Message-Id: <1478196904-143229-5-git-send-email-maxims@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1478196904-143229-1-git-send-email-maxims@google.com>
References: <1478196904-143229-1-git-send-email-maxims@google.com>
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
X-List-Received-Date: Thu, 03 Nov 2016 18:16:00 -0000

From: Maxim Sloyko <maxims@google.com>

The driver is very limited: only single master mode is supported
and only byte-by-byte synchronous reads and writes are supported,
no Pool Buffers or DMA.

Signed-off-by: Maxim Sloyko <maxims@google.com>
---
 drivers/i2c/Kconfig   |   7 ++
 drivers/i2c/Makefile  |   1 +
 drivers/i2c/ast_i2c.c | 305 ++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/i2c/ast_i2c.h | 143 +++++++++++++++++++++++
 4 files changed, 456 insertions(+)
 create mode 100644 drivers/i2c/ast_i2c.c
 create mode 100644 drivers/i2c/ast_i2c.h

diff --git a/drivers/i2c/Kconfig b/drivers/i2c/Kconfig
index 6e22bba..720c475 100644
--- a/drivers/i2c/Kconfig
+++ b/drivers/i2c/Kconfig
@@ -90,6 +90,13 @@ config SYS_I2C_DW_ENABLE_STATUS_UNSUPPORTED
 	  enable status register. This config option can be enabled in such
 	  cases.
 
+config SYS_I2C_AST
+	bool "Aspeed I2C Controller"
+	depends on DM_I2C
+	help
+	  Say yes here to select Aspeed I2C Host Controller. The driver
+	  supports AST2500 and AST2400 controllers.
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
index 0000000..f2c132e
--- /dev/null
+++ b/drivers/i2c/ast_i2c.c
@@ -0,0 +1,305 @@
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
+
+#include "ast_i2c.h"
+
+#define I2C_TIMEOUT_US (100000)
+#define I2C_SLEEP_STEP (20)
+#define EI2C_TIMEOUT (1001)
+
+DECLARE_GLOBAL_DATA_PTR;
+
+struct ast_i2c {
+	u32 id;
+	struct ast_i2c_regs *regs;
+	int speed;
+};
+
+static u32 get_clk_reg_val(u32 divider_ratio)
+{
+	unsigned int inc = 0, div;
+	u32 scl_low, scl_high, data;
+
+	for (div = 0; divider_ratio >= 16; div++) {
+		inc |= (divider_ratio & 1);
+		divider_ratio >>= 1;
+	}
+	divider_ratio += inc;
+	scl_low = (divider_ratio >> 1) - 1;
+	scl_high = divider_ratio - scl_low - 2;
+	data = 0x77700300 | (scl_high << 16) | (scl_low << 12) | div;
+	return data;
+}
+
+static inline void ast_i2c_clear_interrupts(struct ast_i2c_regs *i2c_base)
+{
+	writel(~0, &i2c_base->isr);
+}
+
+static void ast_i2c_init_bus(struct ast_i2c *i2c_bus)
+{
+	/* Reset device */
+	writel(0, &i2c_bus->regs->fcr);
+	/* Enable Master Mode. Assuming single-master. */
+	debug("Enable Master for %p\n", i2c_bus->regs);
+	writel(AST_I2CD_MASTER_EN
+	       | AST_I2CD_M_SDA_LOCK_EN
+	       | AST_I2CD_MULTI_MASTER_DIS | AST_I2CD_M_SCL_DRIVE_EN,
+	       &i2c_bus->regs->fcr);
+	debug("FCR: %p\n", &i2c_bus->regs->fcr);
+	/* Enable Interrupts */
+	writel(AST_I2CD_INTR_TX_ACK
+	       | AST_I2CD_INTR_TX_NAK
+	       | AST_I2CD_INTR_RX_DONE
+	       | AST_I2CD_INTR_BUS_RECOVER_DONE
+	       | AST_I2CD_INTR_NORMAL_STOP
+	       | AST_I2CD_INTR_ABNORMAL, &i2c_bus->regs->icr);
+}
+
+static int ast_i2c_probe(struct udevice *dev)
+{
+	struct ast_i2c *i2c_bus = dev_get_priv(dev);
+
+	debug("Enabling I2C%u\n", dev->seq);
+	ast_scu_enable_i2c(dev->seq);
+
+	i2c_bus->id = dev->seq;
+	struct ast_i2c_regs *i2c_base =
+	    (struct ast_i2c_regs *)dev_get_addr(dev);
+	i2c_bus->regs = i2c_base;
+
+	ast_i2c_init_bus(i2c_bus);
+	return 0;
+}
+
+static inline int ast_i2c_wait_isr(struct ast_i2c_regs *i2c_base, u32 flag)
+{
+	int timeout = I2C_TIMEOUT_US;
+	while (!(readl(&i2c_base->isr) & flag) && timeout > 0) {
+		udelay(I2C_SLEEP_STEP);
+		timeout -= I2C_SLEEP_STEP;
+	}
+
+	ast_i2c_clear_interrupts(i2c_base);
+	if (timeout <= 0)
+		return -EI2C_TIMEOUT;
+	return 0;
+}
+
+static inline int ast_i2c_send_stop(struct ast_i2c_regs *i2c_base)
+{
+	writel(AST_I2CD_M_STOP_CMD, &i2c_base->csr);
+	return ast_i2c_wait_isr(i2c_base, AST_I2CD_INTR_NORMAL_STOP);
+}
+
+static inline int ast_i2c_wait_tx(struct ast_i2c_regs *i2c_base)
+{
+	int timeout = I2C_TIMEOUT_US;
+	u32 flag = AST_I2CD_INTR_TX_ACK | AST_I2CD_INTR_TX_NAK;
+	u32 status = readl(&i2c_base->isr) & flag;
+	while (!status && timeout > 0) {
+		status = readl(&i2c_base->isr) & flag;
+		udelay(I2C_SLEEP_STEP);
+		timeout -= I2C_SLEEP_STEP;
+	}
+
+	int ret = 0;
+	if (status == AST_I2CD_INTR_TX_NAK)
+		ret = -EREMOTEIO;
+
+	if (timeout <= 0)
+		ret = -EI2C_TIMEOUT;
+
+	ast_i2c_clear_interrupts(i2c_base);
+	return ret;
+}
+
+static inline int ast_i2c_start_txn(struct ast_i2c_regs *i2c_base, u8 devaddr)
+{
+	/* Start and Send Device Address */
+	writel(devaddr, &i2c_base->trbbr);
+	writel(AST_I2CD_M_START_CMD | AST_I2CD_M_TX_CMD, &i2c_base->csr);
+	return ast_i2c_wait_tx(i2c_base);
+}
+
+static int ast_i2c_read_data(struct ast_i2c *i2c_bus, u8 chip_addr, u8 *buffer,
+			     size_t len, bool send_stop)
+{
+	struct ast_i2c_regs *i2c_base = i2c_bus->regs;
+
+	int i2c_error =
+	    ast_i2c_start_txn(i2c_base, (chip_addr << 1) | I2C_M_RD);
+	if (i2c_error < 0)
+		return i2c_error;
+
+	u32 i2c_cmd = AST_I2CD_M_RX_CMD;
+	for (; len > 0; len--, buffer++) {
+		if (len == 1)
+			i2c_cmd |= AST_I2CD_M_S_RX_CMD_LAST;
+		writel(i2c_cmd, &i2c_base->csr);
+		i2c_error = ast_i2c_wait_isr(i2c_base, AST_I2CD_INTR_RX_DONE);
+		if (i2c_error < 0)
+			return i2c_error;
+		*buffer = AST_I2CD_RX_DATA_BUF_GET(readl(&i2c_base->trbbr));
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
+
+	int i2c_error = ast_i2c_start_txn(i2c_base, (chip_addr << 1));
+	if (i2c_error < 0)
+		return i2c_error;
+
+	for (; len > 0; len--, buffer++) {
+		writel(*buffer, &i2c_base->trbbr);
+		writel(AST_I2CD_M_TX_CMD, &i2c_base->csr);
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
+
+	u32 csr = readl(&i2c_base->csr);
+
+	int deblock_error = 0;
+	bool sda_high = csr & AST_I2CD_SDA_LINE_STS;
+	bool scl_high = csr & AST_I2CD_SCL_LINE_STS;
+	if (sda_high && scl_high) {
+		/* Bus is idle, no deblocking needed. */
+		return 0;
+	} else if (sda_high) {
+		/* Send stop command */
+		debug("Unterminated TXN in (%x), sending stop\n", csr);
+		deblock_error = ast_i2c_send_stop(i2c_base);
+	} else if (scl_high) {
+		/* Possibly stuck slave */
+		debug("Bus stuck (%x), attempting recovery\n", csr);
+		writel(AST_I2CD_BUS_RECOVER_CMD, &i2c_base->csr);
+		deblock_error = ast_i2c_wait_isr(
+			i2c_base, AST_I2CD_INTR_BUS_RECOVER_DONE);
+	} else {
+		/* Just try to reinit the device. */
+		ast_i2c_init_bus(i2c_bus);
+	}
+
+	return deblock_error;
+}
+
+static int ast_i2c_xfer(struct udevice *dev, struct i2c_msg *msg, int nmsgs)
+{
+	struct ast_i2c *i2c_bus = dev_get_priv(dev);
+	int ret;
+
+	(void)ast_i2c_deblock(dev);
+	debug("i2c_xfer: %d messages\n", nmsgs);
+	for (; nmsgs > 0; nmsgs--, msg++) {
+		if (msg->flags & I2C_M_RD) {
+			debug("i2c_read: chip=0x%x, len=0x%x, flags=0x%x\n",
+			      msg->addr, msg->len, msg->flags);
+			ret =
+			    ast_i2c_read_data(i2c_bus, msg->addr, msg->buf,
+						msg->len, (nmsgs == 1));
+		} else {
+			debug("i2c_write: chip=0x%x, len=0x%x, flags=0x%x\n",
+			      msg->addr, msg->len, msg->flags);
+			ret =
+			    ast_i2c_write_data(i2c_bus, msg->addr, msg->buf,
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
+	debug("Setting speed ofr I2C%d to <%u>\n", dev->seq, speed);
+	if (!speed) {
+		debug("No valid speed specified.\n");
+		return -EINVAL;
+	}
+	struct ast_i2c *i2c_bus = dev_get_priv(dev);
+
+	i2c_bus->speed = speed;
+	/* TODO: get this from device tree */
+	u32 pclk = ast_get_apbclk();
+	u32 divider = pclk / speed;
+
+	struct ast_i2c_regs *i2c_base = i2c_bus->regs;
+	if (speed > 400000) {
+		debug("Enabling High Speed\n");
+		setbits_le32(&i2c_base->fcr, AST_I2CD_M_HIGH_SPEED_EN
+			     | AST_I2CD_M_SDA_DRIVE_1T_EN
+			     | AST_I2CD_SDA_DRIVE_1T_EN);
+		writel(0x3, &i2c_base->cactcr2);
+		writel(get_clk_reg_val(divider), &i2c_base->cactcr1);
+	} else {
+		debug("Enabling Normal Speed\n");
+		writel(get_clk_reg_val(divider), &i2c_base->cactcr1);
+		writel(AST_NO_TIMEOUT_CTRL, &i2c_base->cactcr2);
+	}
+
+	ast_i2c_clear_interrupts(i2c_base);
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
+	.priv_auto_alloc_size = sizeof(struct ast_i2c),
+	.ops = &ast_i2c_ops,
+};
+/* *INDENT-ON* */
diff --git a/drivers/i2c/ast_i2c.h b/drivers/i2c/ast_i2c.h
new file mode 100644
index 0000000..8926fd2
--- /dev/null
+++ b/drivers/i2c/ast_i2c.h
@@ -0,0 +1,143 @@
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
+	uint32_t fcr;
+	uint32_t cactcr1;
+	uint32_t cactcr2;
+	uint32_t icr;
+	uint32_t isr;
+	uint32_t csr;
+	uint32_t sdar;
+	uint32_t pbcr;
+	uint32_t trbbr;
+#ifdef CONFIG_TARGET_AST_G5
+	uint32_t dma_mbar;
+	uint32_t dma_tlr;
+#endif
+};
+
+/* Device Register Definition */
+/* 0x00 : I2CD Function Control Register  */
+#define AST_I2CD_BUFF_SEL_MASK				(0x7 << 20)
+#define AST_I2CD_BUFF_SEL(x)				(x << 20)
+#define AST_I2CD_M_SDA_LOCK_EN			(0x1 << 16)
+#define AST_I2CD_MULTI_MASTER_DIS			(0x1 << 15)
+#define AST_I2CD_M_SCL_DRIVE_EN		(0x1 << 14)
+#define AST_I2CD_MSB_STS					(0x1 << 9)
+#define AST_I2CD_SDA_DRIVE_1T_EN			(0x1 << 8)
+#define AST_I2CD_M_SDA_DRIVE_1T_EN		(0x1 << 7)
+#define AST_I2CD_M_HIGH_SPEED_EN		(0x1 << 6)
+#define AST_I2CD_DEF_ADDR_EN				(0x1 << 5)
+#define AST_I2CD_DEF_ALERT_EN				(0x1 << 4)
+#define AST_I2CD_DEF_ARP_EN					(0x1 << 3)
+#define AST_I2CD_DEF_GCALL_EN				(0x1 << 2)
+#define AST_I2CD_SLAVE_EN					(0x1 << 1)
+#define AST_I2CD_MASTER_EN					(0x1)
+
+/* 0x04 : I2CD Clock and AC Timing Control Register #1 */
+#define AST_I2CD_tBUF						(0x1 << 28)
+#define AST_I2CD_tHDSTA						(0x1 << 24)
+#define AST_I2CD_tACST						(0x1 << 20)
+#define AST_I2CD_tCKHIGH					(0x1 << 16)
+#define AST_I2CD_tCKLOW						(0x1 << 12)
+#define AST_I2CD_tHDDAT						(0x1 << 10)
+#define AST_I2CD_CLK_TO_BASE_DIV			(0x1 << 8)
+#define AST_I2CD_CLK_BASE_DIV				(0x1)
+
+/* 0x08 : I2CD Clock and AC Timing Control Register #2 */
+#define AST_I2CD_tTIMEOUT					(0x1)
+#define AST_NO_TIMEOUT_CTRL					0x0
+
+/* 0x0c : I2CD Interrupt Control Register &
+ * 0x10 : I2CD Interrupt Status Register
+ *
+ * These share bit definitions, so use the same values for the enable &
+ * status bits.
+ */
+#define AST_I2CD_INTR_SDA_DL_TIMEOUT			(0x1 << 14)
+#define AST_I2CD_INTR_BUS_RECOVER_DONE			(0x1 << 13)
+#define AST_I2CD_INTR_SMBUS_ALERT			(0x1 << 12)
+#define AST_I2CD_INTR_SMBUS_ARP_ADDR			(0x1 << 11)
+#define AST_I2CD_INTR_SMBUS_DEV_ALERT_ADDR		(0x1 << 10)
+#define AST_I2CD_INTR_SMBUS_DEF_ADDR			(0x1 << 9)
+#define AST_I2CD_INTR_GCALL_ADDR			(0x1 << 8)
+#define AST_I2CD_INTR_SLAVE_MATCH			(0x1 << 7)
+#define AST_I2CD_INTR_SCL_TIMEOUT			(0x1 << 6)
+#define AST_I2CD_INTR_ABNORMAL				(0x1 << 5)
+#define AST_I2CD_INTR_NORMAL_STOP			(0x1 << 4)
+#define AST_I2CD_INTR_ARBIT_LOSS			(0x1 << 3)
+#define AST_I2CD_INTR_RX_DONE				(0x1 << 2)
+#define AST_I2CD_INTR_TX_NAK				(0x1 << 1)
+#define AST_I2CD_INTR_TX_ACK				(0x1 << 0)
+
+/* 0x14 : I2CD Command/Status Register   */
+#define AST_I2CD_SDA_OE					(0x1 << 28)
+#define AST_I2CD_SDA_O					(0x1 << 27)
+#define AST_I2CD_SCL_OE					(0x1 << 26)
+#define AST_I2CD_SCL_O					(0x1 << 25)
+#define AST_I2CD_TX_TIMING				(0x1 << 24)
+#define AST_I2CD_TX_STATUS				(0x1 << 23)
+
+/* Tx State Machine */
+#define AST_I2CD_IDLE					0x0
+#define AST_I2CD_MACTIVE				0x8
+#define AST_I2CD_MSTART					0x9
+#define AST_I2CD_MSTARTR				0xa
+#define AST_I2CD_MSTOP					0xb
+#define AST_I2CD_MTXD					0xc
+#define AST_I2CD_MRXACK					0xd
+#define AST_I2CD_MRXD					0xe
+#define AST_I2CD_MTXACK				0xf
+#define AST_I2CD_SWAIT					0x1
+#define AST_I2CD_SRXD					0x4
+#define AST_I2CD_STXACK				0x5
+#define AST_I2CD_STXD					0x6
+#define AST_I2CD_SRXACK				0x7
+#define AST_I2CD_RECOVER				0x3
+
+#define AST_I2CD_SCL_LINE_STS				(0x1 << 18)
+#define AST_I2CD_SDA_LINE_STS				(0x1 << 17)
+#define AST_I2CD_BUS_BUSY_STS				(0x1 << 16)
+#define AST_I2CD_SDA_OE_OUT_DIR				(0x1 << 15)
+#define AST_I2CD_SDA_O_OUT_DIR				(0x1 << 14)
+#define AST_I2CD_SCL_OE_OUT_DIR				(0x1 << 13)
+#define AST_I2CD_SCL_O_OUT_DIR				(0x1 << 12)
+#define AST_I2CD_BUS_RECOVER_CMD			(0x1 << 11)
+#define AST_I2CD_S_ALT_EN				(0x1 << 10)
+#define AST_I2CD_RX_DMA_ENABLE				(0x1 << 9)
+#define AST_I2CD_TX_DMA_ENABLE				(0x1 << 8)
+
+/* Command Bit */
+#define AST_I2CD_RX_BUFF_ENABLE				(0x1 << 7)
+#define AST_I2CD_TX_BUFF_ENABLE				(0x1 << 6)
+#define AST_I2CD_M_STOP_CMD					(0x1 << 5)
+#define AST_I2CD_M_S_RX_CMD_LAST			(0x1 << 4)
+#define AST_I2CD_M_RX_CMD					(0x1 << 3)
+#define AST_I2CD_S_TX_CMD					(0x1 << 2)
+#define AST_I2CD_M_TX_CMD					(0x1 << 1)
+#define AST_I2CD_M_START_CMD				(0x1)
+
+/* 0x18 : I2CD Slave Device Address Register   */
+
+/* 0x1C : I2CD Pool Buffer Control Register   */
+#define AST_I2CD_RX_BUF_ADDR_GET(x)			(((x) >> 24) & 0xff)
+#define AST_I2CD_RX_BUF_END_ADDR_SET(x)			((x) << 16)
+#define AST_I2CD_TX_DATA_BUF_END_SET(x)			(((x) & 0xff) << 8)
+#define AST_I2CD_RX_DATA_BUF_GET(x)			(((x) >> 8) & 0xff)
+#define AST_I2CD_BUF_BASE_ADDR_SET(x)			((x) & 0x3f)
+
+/* 0x20 : I2CD Transmit/Receive Byte Buffer Register   */
+#define AST_I2CD_GET_MODE(x)				(((x) >> 8) & 0x1)
+
+#define AST_I2CD_RX_BYTE_BUFFER					(0xff << 8)
+#define AST_I2CD_TX_BYTE_BUFFER					(0xff)
+
+#endif				/* __AST_I2C_H_ */
-- 
2.8.0.rc3.226.g39d4020
