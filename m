Return-Path: <maxims@google.com>
Received: from mail-pa0-x22a.google.com (mail-pa0-x22a.google.com
 [IPv6:2607:f8b0:400e:c03::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sk7W96qQLzDrW6
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 03:44:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=Z0R9deuI; 
 dkim-atps=neutral
Received: by mail-pa0-x22a.google.com with SMTP id qn7so7713110pac.3
 for <openbmc@lists.ozlabs.org>; Tue, 27 Sep 2016 10:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=mrxE+JaQ2qBzHSmHINHVgaM41RAe9Zvx8YRhUAlKaUA=;
 b=Z0R9deuIsTFJ1OIrsqYfd77Zsr1kgNG7bLm2raOvByg80HCQ1m5yafg+mkVW1wnHE8
 BLgd6/+2LUw79otpb8wa2Ny6L5Q2wCF+DACoJ0EjpbNHaze13BXFSPpYsfDwCZrFk9So
 1EhJuNT62adVKO3pkzglKxboC/vRR3unxBHnjcc/I7OuCH/QWlSAGoni+nudUYx+pb9x
 QgJn66S9KTIzud0FHv4o3ui+7od1dtFq5Bfmr4OBgmlwa2hYI/m1jifo3GcF4CIlhdxT
 0GCxz9cxePTDAYjo3blkxlSOS4bdtUlA074cVLJSyHtKezMUgfsf6nGZwWS2G3sU5VsR
 Nq+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=mrxE+JaQ2qBzHSmHINHVgaM41RAe9Zvx8YRhUAlKaUA=;
 b=MjU3Bx1N+3cWe3Bxl926nBBoYsVMRbRgTNvtv4HIf5mgT+coekoW4U6H8spp7DoHid
 mwJtt2rzXbLoIZ8JZ1/tI8EWEFpVTutRcttBwqvZmS3Bi7nb7DMTmkdh76JsjCxhWEnQ
 PJfiMDzwsAgpcjF6qJk/4CzVmsBrA4gyzgNsvgxvO6xbGCKd9Omvs3VKAB69PXiVL6wQ
 uz63s4gTohzw9yCGIvJ9BzuSUDr1Xf26CAaDiSLgoaV2hFVbsPsaQjKNEf2KduGOEzhT
 QbH1mBZuenkEmuFXiRxLXpkEfyAKOuxiB7jxzSNNAlOBLCTf0YjmCr5stRjqXUdNeDC9
 0Tdw==
X-Gm-Message-State: AA6/9RmUQ9OLW/DPgBSfwYjyrArtsrw2bcm59lH3EoTaK/mLwtOsW43nYK0nHK0qV8x/xo/g
X-Received: by 10.66.156.225 with SMTP id wh1mr41111496pab.128.1474998259522; 
 Tue, 27 Sep 2016 10:44:19 -0700 (PDT)
Received: from mxsl.svl.corp.google.com ([100.123.242.80])
 by smtp.gmail.com with ESMTPSA id af17sm1542129pac.14.2016.09.27.10.44.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 27 Sep 2016 10:44:18 -0700 (PDT)
From: maxims@google.com
To: openbmc@lists.ozlabs.org
Subject: [PATCH 3/3] aspeed/g5: I2C driver.
Date: Tue, 27 Sep 2016 10:43:34 -0700
Message-Id: <1474998214-12720-3-git-send-email-maxims@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1474998214-12720-1-git-send-email-maxims@google.com>
References: <1474306018-101166-1-git-send-email-maxims@google.com>
 <1474998214-12720-1-git-send-email-maxims@google.com>
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
X-List-Received-Date: Tue, 27 Sep 2016 17:44:22 -0000

From: Maxim Sloyko <maxims@google.com>

The driver is very limited: only single master mode is supported
and only byte-by-byte synchronous reads and writes are supported,
no Pool Buffers or DMA.
---
 drivers/i2c/Kconfig   |   6 +
 drivers/i2c/Makefile  |   1 +
 drivers/i2c/ast_i2c.c | 306 ++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/i2c/ast_i2c.h | 155 +++++++++++++++++++++++++
 4 files changed, 468 insertions(+)
 create mode 100644 drivers/i2c/ast_i2c.c
 create mode 100644 drivers/i2c/ast_i2c.h

diff --git a/drivers/i2c/Kconfig b/drivers/i2c/Kconfig
index 9324c6c..6501e91 100644
--- a/drivers/i2c/Kconfig
+++ b/drivers/i2c/Kconfig
@@ -65,6 +65,12 @@ config SYS_I2C_CADENCE
 	  Say yes here to select Cadence I2C Host Controller. This controller is
 	  e.g. used by Xilinx Zynq.
 
+config SYS_I2C_AST
+	tristate "Aspeed I2C Controller"
+	depends on DM_I2C
+	help
+	  Say yes here to select Aspeed I2C Host Controller.
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
index 0000000..c7bc199
--- /dev/null
+++ b/drivers/i2c/ast_i2c.c
@@ -0,0 +1,306 @@
+/*
+ * Copyright (C) 2016 Google, Inc
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
+#define RETURN_IF_ERROR(expr) do {\
+	int err = (expr);\
+	if (err < 0) {\
+		return err;\
+	}\
+} while (0)
+
+static u32 __get_clk_reg_val(u32 divider_ratio)
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
+static inline void __ast_i2c_clear_interrupts(struct ast_i2c_regs *i2c_base)
+{
+	writel(~0, &i2c_base->isr);
+}
+
+static int __ast_i2c_init_bus(struct ast_i2c *i2c_bus)
+{
+	/* Reset device */
+	writel(0, &i2c_bus->regs->fcr);
+	/* Enable Master Mode. Assuming single-master. */
+	debug("Enable Master for %p\n", i2c_bus->regs);
+	setbits_le32(&i2c_bus->regs->fcr,
+		     AST_I2CD_MASTER_EN
+		     | AST_I2CD_M_SDA_LOCK_EN
+		     | AST_I2CD_MULTI_MASTER_DIS | AST_I2CD_M_SCL_DRIVE_EN);
+	debug("FCR: %p\n", &i2c_bus->regs->fcr);
+	/* Enable Interrupts */
+	writel(AST_I2CD_INTR_TX_ACK
+	       | AST_I2CD_INTR_TX_NAK
+	       | AST_I2CD_INTR_RX_DONE
+	       | AST_I2CD_INTR_BUS_RECOVER_DONE
+	       | AST_I2CD_INTR_NORMAL_STOP
+	       | AST_I2CD_INTR_ABNORMAL, &i2c_bus->regs->icr);
+	return 0;
+}
+
+static int ast_i2c_probe(struct udevice *dev)
+{
+	struct ast_i2c *i2c_bus = dev_get_priv(dev);
+
+	debug("Enabling I2C%u \n", dev->seq);
+	ast_scu_enable_i2c(dev->seq);
+
+	i2c_bus->id = dev->seq;
+	struct ast_i2c_regs *i2c_base =
+	    (struct ast_i2c_regs *)dev_get_addr(dev);
+	i2c_bus->regs = i2c_base;
+
+	return __ast_i2c_init_bus(i2c_bus);
+}
+
+static inline int __ast_i2c_wait_isr(struct ast_i2c_regs *i2c_base, u32 flag)
+{
+	int timeout = I2C_TIMEOUT_US;
+	while (!(readl(&i2c_base->isr) & flag) && timeout > 0) {
+		udelay(I2C_SLEEP_STEP);
+		timeout -= I2C_SLEEP_STEP;
+	}
+
+	__ast_i2c_clear_interrupts(i2c_base);
+	if (timeout <= 0)
+		return -EI2C_TIMEOUT;
+	return 0;
+}
+
+static inline int __ast_i2c_send_stop(struct ast_i2c_regs *i2c_base)
+{
+	writel(AST_I2CD_M_STOP_CMD, &i2c_base->csr);
+	RETURN_IF_ERROR(__ast_i2c_wait_isr
+			(i2c_base, AST_I2CD_INTR_NORMAL_STOP));
+	return 0;
+}
+
+static inline int __ast_i2c_wait_tx(struct ast_i2c_regs *i2c_base)
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
+	if (status == AST_I2CD_INTR_TX_NAK) {
+		ret = -EREMOTEIO;
+	}
+
+	if (timeout <= 0) {
+		ret = -EI2C_TIMEOUT;
+	}
+
+	__ast_i2c_clear_interrupts(i2c_base);
+	return ret;
+}
+
+static inline int __ast_i2c_start_txn(struct ast_i2c_regs *i2c_base, u8 devaddr)
+{
+	/* Start and Send Device Address */
+	writel(devaddr, &i2c_base->trbbr);
+	writel(AST_I2CD_M_START_CMD | AST_I2CD_M_TX_CMD, &i2c_base->csr);
+	RETURN_IF_ERROR(__ast_i2c_wait_tx(i2c_base));
+	return 0;
+}
+
+static int __ast_i2c_read_data(struct ast_i2c *i2c_bus, u8 chip, u8 *buffer,
+			       int len)
+{
+	int i2c_error = 0;
+	struct ast_i2c_regs *i2c_base = i2c_bus->regs;
+
+	i2c_error = __ast_i2c_start_txn(i2c_base, (chip << 1) | I2C_M_RD);
+
+	if (!i2c_error) {
+		u32 i2c_cmd = AST_I2CD_M_RX_CMD;
+		for (; len > 0; len--, buffer++) {
+			if (len == 1) {
+				i2c_cmd |= AST_I2CD_M_S_RX_CMD_LAST;
+			}
+			writel(i2c_cmd, &i2c_base->csr);
+			RETURN_IF_ERROR(__ast_i2c_wait_isr
+					(i2c_base, AST_I2CD_INTR_RX_DONE));
+			*buffer = AST_I2CD_RX_DATA_BUF_GET(readl(&i2c_base->trbbr));
+		}
+		__ast_i2c_clear_interrupts(i2c_base);
+	}
+	RETURN_IF_ERROR(__ast_i2c_send_stop(i2c_base));
+
+	return i2c_error;
+}
+
+static int __ast_i2c_write_data(struct ast_i2c *i2c_bus, u8 chip, u8 *buffer,
+				int len)
+{
+	int i2c_error = 0;
+	struct ast_i2c_regs *i2c_base = i2c_bus->regs;
+
+	i2c_error = __ast_i2c_start_txn(i2c_base, (chip << 1));
+	for (; len > 0 && 0 == i2c_error; len--, buffer++) {
+		writel(*buffer, &i2c_base->trbbr);
+		writel(AST_I2CD_M_TX_CMD, &i2c_base->csr);
+		i2c_error = __ast_i2c_wait_tx(i2c_base);
+	}
+	RETURN_IF_ERROR(__ast_i2c_send_stop(i2c_base));
+	return i2c_error;
+}
+
+static int ast_i2c_deblock(struct udevice *dev)
+{
+	struct ast_i2c *i2c_bus = dev_get_priv(dev);
+	struct ast_i2c_regs *i2c_base = i2c_bus->regs;
+
+	u32 csr = readl(&i2c_base->csr);
+	debug("Bus hung (%x), attempting recovery\n", csr);
+
+	bool sda_high = csr & AST_I2CD_SDA_LINE_STS;
+	bool scl_high = csr & AST_I2CD_SCL_LINE_STS;
+	if (sda_high && scl_high) {
+		/* Bus is idle, no deblocking needed. */
+		return 0;
+	} else if (sda_high) {
+		/* Send stop command */
+		RETURN_IF_ERROR(__ast_i2c_send_stop(i2c_base));
+	} else if (scl_high) {
+		/* Possibly stuck slave */
+		writel(AST_I2CD_BUS_RECOVER_CMD, &i2c_base->csr);
+		RETURN_IF_ERROR(__ast_i2c_wait_isr
+				(i2c_base, AST_I2CD_INTR_BUS_RECOVER_DONE));
+	} else {
+		/* Just try to reinit the device. */
+		RETURN_IF_ERROR(__ast_i2c_init_bus(i2c_bus));
+	}
+
+	return 0;
+}
+
+static int ast_i2c_xfer(struct udevice *dev, struct i2c_msg *msg, int nmsgs)
+{
+	struct ast_i2c *i2c_bus = dev_get_priv(dev);
+	int ret;
+
+	debug("i2c_xfer: %d messages\n", nmsgs);
+	for (; nmsgs > 0; nmsgs--, msg++) {
+		/* TODO: use this for repeated start */
+		bool next_is_read = nmsgs > 1 && (msg[1].flags & I2C_M_RD);
+
+		if (msg->flags & I2C_M_RD) {
+			debug("i2c_read: chip=0x%x, len=0x%x, flags=0x%x\n",
+			      msg->addr, msg->len, msg->flags);
+			ret =
+			    __ast_i2c_read_data(i2c_bus, msg->addr, msg->buf,
+						msg->len);
+		} else {
+			debug("i2c_write: chip=0x%x, len=0x%x, flags=0x%x\n",
+			      msg->addr, msg->len, msg->flags);
+			ret =
+			    __ast_i2c_write_data(i2c_bus, msg->addr, msg->buf,
+						 msg->len);
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
+		writel(__get_clk_reg_val(divider), &i2c_base->cactcr1);
+	} else {
+		debug("Enabling Normal Speed\n");
+		writel(__get_clk_reg_val(divider), &i2c_base->cactcr1);
+		writel(AST_NO_TIMEOUT_CTRL, &i2c_base->cactcr2);
+	}
+
+	__ast_i2c_clear_interrupts(i2c_base);
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
index 0000000..e221b41
--- /dev/null
+++ b/drivers/i2c/ast_i2c.h
@@ -0,0 +1,155 @@
+/*
+ * Copyright (C) 2016 Google, Inc
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
+#define AST_I2CD_BUFF_SEL(x) 				(x << 20)	// page 0 ~ 7
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
+#define AST_I2CD_MASTER_EN					(0x1 )
+
+/* 0x04 : I2CD Clock and AC Timing Control Register #1 */
+#define AST_I2CD_tBUF						(0x1 << 28)	// 0~7
+#define AST_I2CD_tHDSTA						(0x1 << 24)	// 0~7
+#define AST_I2CD_tACST						(0x1 << 20)	// 0~7
+#define AST_I2CD_tCKHIGH					(0x1 << 16)	// 0~7
+#define AST_I2CD_tCKLOW						(0x1 << 12)	// 0~7
+#define AST_I2CD_tHDDAT						(0x1 << 10)	// 0~7
+#define AST_I2CD_CLK_TO_BASE_DIV			(0x1 << 8)	// 0~3
+#define AST_I2CD_CLK_BASE_DIV				(0x1 )	// 0~0xf
+
+/* 0x08 : I2CD Clock and AC Timing Control Register #2 */
+#define AST_I2CD_tTIMEOUT					(0x1 )	// 0~7
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
+#define AST_I2CD_TX_TIMING				(0x1 << 24)	// 0 ~3
+#define AST_I2CD_TX_STATUS				(0x1 << 23)
+
+// Tx State Machine
+#define AST_I2CD_IDLE	 				0x0
+#define AST_I2CD_MACTIVE				0x8
+#define AST_I2CD_MSTART					0x9
+#define AST_I2CD_MSTARTR				0xa
+#define AST_I2CD_MSTOP					0xb
+#define AST_I2CD_MTXD					0xc
+#define AST_I2CD_MRXACK					0xd
+#define AST_I2CD_MRXD 					0xe
+#define AST_I2CD_MTXACK 				0xf
+#define AST_I2CD_SWAIT					0x1
+#define AST_I2CD_SRXD 					0x4
+#define AST_I2CD_STXACK 				0x5
+#define AST_I2CD_STXD					0x6
+#define AST_I2CD_SRXACK 				0x7
+#define AST_I2CD_RECOVER 				0x3
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
+// 0 : DMA Buffer, 1: Pool Buffer
+//AST1070 DMA register
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
+#define AST_I2CD_M_START_CMD				(0x1 )
+
+/* 0x18 : I2CD Slave Device Address Register   */
+
+/* 0x1C : I2CD Pool Buffer Control Register   */
+#define AST_I2CD_RX_BUF_ADDR_GET(x)				(((x) >> 24) & 0xff)
+#define AST_I2CD_RX_BUF_END_ADDR_SET(x)			((x) << 16)
+#define AST_I2CD_TX_DATA_BUF_END_SET(x)			(((x) & 0xff) << 8)
+#define AST_I2CD_RX_DATA_BUF_GET(x)			(((x) >> 8) & 0xff)
+#define AST_I2CD_BUF_BASE_ADDR_SET(x)			((x) & 0x3f)
+
+/* 0x20 : I2CD Transmit/Receive Byte Buffer Register   */
+#define AST_I2CD_GET_MODE(x)					(((x) >> 8) & 0x1)
+
+#define AST_I2CD_RX_BYTE_BUFFER					(0xff << 8)
+#define AST_I2CD_TX_BYTE_BUFFER					(0xff )
+
+//1. usage flag , 2 size,       3. request address
+/* Use platform_data instead of module parameters */
+/* Fast Mode = 400 kHz, Standard = 100 kHz */
+//static int clock = 100; /* Default: 100 kHz */
+
+#define AST_I2CD_CMDS	(AST_I2CD_BUS_RECOVER_CMD_EN | \
+			 AST_I2CD_M_STOP_CMD | \
+			 AST_I2CD_M_S_RX_CMD_LAST | \
+			 AST_I2CD_M_RX_CMD | \
+			 AST_I2CD_M_TX_CMD | \
+			 AST_I2CD_M_START_CMD)
+
+#endif				/* _ASPEED_REGS_I2C_H_ */
-- 
2.8.0.rc3.226.g39d4020
