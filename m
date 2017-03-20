Return-Path: <hs@denx.de>
X-Greylist: delayed 510 seconds by postgrey-1.36 at bilbo;
 Mon, 20 Mar 2017 17:44:17 AEDT
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vmmdF50nKzDq5g
 for <openbmc@lists.ozlabs.org>; Mon, 20 Mar 2017 17:44:17 +1100 (AEDT)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 3vmmRM3KV2z3hjm1;
 Mon, 20 Mar 2017 07:35:43 +0100 (CET)
Received: from localhost (dynscan01.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 3vmmRM209Hz3jgXw;
 Mon, 20 Mar 2017 07:35:43 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan01.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id IdWey_fMKOuc; Mon, 20 Mar 2017 07:35:41 +0100 (CET)
X-Auth-Info: tBMZ+47uXLQlpsW4o2SyzGLUUKGiqZY6jl8MQ6TL+V8=
Received: from localhost.localdomain (82.131.206.51.pool.invitel.hu
 [82.131.206.51])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 20 Mar 2017 07:35:41 +0100 (CET)
Reply-To: hs@denx.de
Subject: Re: [PATCH 11/17] aspeed: Add I2C Driver
References: <20170316213624.140344-1-maxims@google.com>
 <20170316213624.140344-12-maxims@google.com>
To: Maxim Sloyko <maxims@google.com>
Cc: u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 openbmc@lists.ozlabs.org
From: Heiko Schocher <hs@denx.de>
Message-ID: <58CF783C.20009@denx.de>
Date: Mon, 20 Mar 2017 07:35:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <20170316213624.140344-12-maxims@google.com>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Mon, 20 Mar 2017 06:44:18 -0000

Hello Maxim,

Am 16.03.2017 um 22:36 schrieb Maxim Sloyko:
> Add Device Model based I2C driver for ast2500/ast2400 SoCs.
> The driver is very limited, it only supports master mode and
> synchronous byte-by-byte reads/writes, no DMA or Pool Buffers.
>
> Signed-off-by: Maxim Sloyko <maxims@google.com>
> ---
>
>   drivers/i2c/Kconfig   |   9 ++
>   drivers/i2c/Makefile  |   1 +
>   drivers/i2c/ast_i2c.c | 355 ++++++++++++++++++++++++++++++++++++++++++++++++++
>   drivers/i2c/ast_i2c.h | 132 +++++++++++++++++++
>   4 files changed, 497 insertions(+)
>   create mode 100644 drivers/i2c/ast_i2c.c
>   create mode 100644 drivers/i2c/ast_i2c.h

Thanks for this patch. Just nitpick:

[...]
> diff --git a/drivers/i2c/ast_i2c.c b/drivers/i2c/ast_i2c.c
> new file mode 100644
> index 0000000000..0b60b08cf2
> --- /dev/null
> +++ b/drivers/i2c/ast_i2c.c
> @@ -0,0 +1,355 @@
> +/*
> + * Copyright (C) 2012-2020  ASPEED Technology Inc.
> + * Copyright 2016 IBM Corporation
> + * Copyright 2017 Google, Inc.
> + *
> + * SPDX-License-Identifier:	GPL-2.0+
> + */
> +
> +#include <common.h>
> +#include <clk.h>
> +#include <dm.h>
> +#include <errno.h>
> +#include <fdtdec.h>
> +#include <i2c.h>
> +#include <asm/io.h>
> +#include <asm/arch/scu_ast2500.h>
> +
> +#include "ast_i2c.h"
> +
> +#define I2C_TIMEOUT_US 100000
> +#define I2C_SLEEP_STEP_US 20
> +
> +#define HIGHSPEED_TTIMEOUT		3
> +
> +DECLARE_GLOBAL_DATA_PTR;
> +
> +/*
> + * Device private data
> + */
> +struct ast_i2c_priv {
> +	/* This device's clock */
> +	struct clk clk;
> +	/* Device registers */
> +	struct ast_i2c_regs *regs;
> +	/* I2C speed in Hz */
> +	int speed;
> +};
> +
> +/*
> + * Given desired divider ratio, return the value that needs to be set
> + * in Clock and AC Timing Control register
> + */
> +static u32 get_clk_reg_val(ulong divider_ratio)
> +{
> +	ulong inc = 0, div;
> +	ulong scl_low, scl_high, data;
> +
> +	for (div = 0; divider_ratio >= 16; div++) {
> +		inc |= (divider_ratio & 1);
> +		divider_ratio >>= 1;
> +	}
> +	divider_ratio += inc;
> +	scl_low = (divider_ratio >> 1) - 1;
> +	scl_high = divider_ratio - scl_low - 2;
> +	data = I2CD_CACTC_BASE
> +			| (scl_high << I2CD_TCKHIGH_SHIFT)
> +			| (scl_low << I2CD_TCKLOW_SHIFT)
> +			| (div << I2CD_BASE_DIV_SHIFT);
> +
> +	return data;
> +}
> +
> +static void ast_i2c_clear_interrupts(struct udevice *dev)
> +{
> +	struct ast_i2c_priv *priv = dev_get_priv(dev);
> +
> +	writel(~0, &priv->regs->isr);
> +}
> +
> +static void ast_i2c_init_bus(struct udevice *dev)
> +{
> +	struct ast_i2c_priv *priv = dev_get_priv(dev);
> +
> +	/* Reset device */
> +	writel(0, &priv->regs->fcr);
> +	/* Enable Master Mode. Assuming single-master */
> +	writel(I2CD_MASTER_EN
> +	       | I2CD_M_SDA_LOCK_EN
> +	       | I2CD_MULTI_MASTER_DIS | I2CD_M_SCL_DRIVE_EN,
> +	       &priv->regs->fcr);
> +	/* Enable Interrupts */
> +	writel(I2CD_INTR_TX_ACK
> +	       | I2CD_INTR_TX_NAK
> +	       | I2CD_INTR_RX_DONE
> +	       | I2CD_INTR_BUS_RECOVER_DONE
> +	       | I2CD_INTR_NORMAL_STOP
> +	       | I2CD_INTR_ABNORMAL, &priv->regs->icr);
> +}
> +
> +static int ast_i2c_ofdata_to_platdata(struct udevice *dev)
> +{
> +	struct ast_i2c_priv *priv = dev_get_priv(dev);
> +	int ret;
> +
> +	priv->regs = dev_get_addr_ptr(dev);
> +	if (IS_ERR(priv->regs))
> +		return PTR_ERR(priv->regs);
> +
> +	ret = clk_get_by_index(dev, 0, &priv->clk);
> +	if (ret < 0) {
> +		debug("%s: Can't get clock for %s: %d\n", __func__, dev->name,
> +		      ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int ast_i2c_probe(struct udevice *dev)
> +{
> +	struct ast2500_scu *scu;
> +
> +	debug("Enabling I2C%u\n", dev->seq);
> +
> +	/*
> +	 * Get all I2C devices out of Reset.
> +	 * Only needs to be done once, but doing it for every
> +	 * device does not hurt.
> +	 */
> +	scu = ast_get_scu();
> +	ast_scu_unlock(scu);
> +	clrbits_le32(&scu->sysreset_ctrl1, SCU_SYSRESET_I2C);
> +	ast_scu_lock(scu);
> +
> +	ast_i2c_init_bus(dev);
> +
> +	return 0;
> +}
> +
> +static int ast_i2c_wait_isr(struct udevice *dev, u32 flag)
> +{
> +	struct ast_i2c_priv *priv = dev_get_priv(dev);
> +	int timeout = I2C_TIMEOUT_US;
> +
> +	while (!(readl(&priv->regs->isr) & flag) && timeout > 0) {
> +		udelay(I2C_SLEEP_STEP_US);
> +		timeout -= I2C_SLEEP_STEP_US;
> +	}
> +
> +	ast_i2c_clear_interrupts(dev);
> +	if (timeout <= 0)
> +		return -ETIMEDOUT;
> +
> +	return 0;
> +}
> +
> +static int ast_i2c_send_stop(struct udevice *dev)
> +{
> +	struct ast_i2c_priv *priv = dev_get_priv(dev);
> +
> +	writel(I2CD_M_STOP_CMD, &priv->regs->csr);
> +
> +	return ast_i2c_wait_isr(dev, I2CD_INTR_NORMAL_STOP);
> +}
> +
> +static int ast_i2c_wait_tx(struct udevice *dev)
> +{
> +	struct ast_i2c_priv *priv = dev_get_priv(dev);
> +	int timeout = I2C_TIMEOUT_US;
> +	u32 flag = I2CD_INTR_TX_ACK | I2CD_INTR_TX_NAK;
> +	u32 status = readl(&priv->regs->isr) & flag;
> +	int ret = 0;
> +
> +	while (!status && timeout > 0) {
> +		status = readl(&priv->regs->isr) & flag;
> +		udelay(I2C_SLEEP_STEP_US);
> +		timeout -= I2C_SLEEP_STEP_US;
> +	}
> +
> +	if (status == I2CD_INTR_TX_NAK)
> +		ret = -EREMOTEIO;
> +
> +	if (timeout <= 0)
> +		ret = -ETIMEDOUT;
> +
> +	ast_i2c_clear_interrupts(dev);
> +
> +	return ret;
> +}
> +
> +static int ast_i2c_start_txn(struct udevice *dev, uint devaddr)
> +{
> +	struct ast_i2c_priv *priv = dev_get_priv(dev);

add an empty line here please.

> +	/* Start and Send Device Address */
> +	writel(devaddr, &priv->regs->trbbr);
> +	writel(I2CD_M_START_CMD | I2CD_M_TX_CMD, &priv->regs->csr);
> +
> +	return ast_i2c_wait_tx(dev);
> +}
> +
> +static int ast_i2c_read_data(struct udevice *dev, u8 chip_addr, u8 *buffer,
> +			     size_t len, bool send_stop)
> +{
> +	struct ast_i2c_priv *priv = dev_get_priv(dev);
> +	u32 i2c_cmd = I2CD_M_RX_CMD;
> +	int ret;
> +
> +	ret = ast_i2c_start_txn(dev, (chip_addr << 1) | I2C_M_RD);
> +	if (ret < 0)
> +		return ret;
> +
> +	for (; len > 0; len--, buffer++) {
> +		if (len == 1)
> +			i2c_cmd |= I2CD_M_S_RX_CMD_LAST;
> +		writel(i2c_cmd, &priv->regs->csr);
> +		ret = ast_i2c_wait_isr(dev, I2CD_INTR_RX_DONE);
> +		if (ret < 0)
> +			return ret;
> +		*buffer = (readl(&priv->regs->trbbr) & I2CD_RX_DATA_MASK)
> +				>> I2CD_RX_DATA_SHIFT;
> +	}
> +	ast_i2c_clear_interrupts(dev);
> +
> +	if (send_stop)
> +		return ast_i2c_send_stop(dev);
> +
> +	return 0;
> +}
> +
> +static int ast_i2c_write_data(struct udevice *dev, u8 chip_addr, u8
> +			      *buffer, size_t len, bool send_stop)
> +{
> +	struct ast_i2c_priv *priv = dev_get_priv(dev);
> +	int ret;
> +
> +	ret = ast_i2c_start_txn(dev, (chip_addr << 1));
> +	if (ret < 0)
> +		return ret;
> +
> +	for (; len > 0; len--, buffer++) {
> +		writel(*buffer, &priv->regs->trbbr);
> +		writel(I2CD_M_TX_CMD, &priv->regs->csr);
> +		ret = ast_i2c_wait_tx(dev);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	if (send_stop)
> +		return ast_i2c_send_stop(dev);
> +
> +	return 0;
> +}
> +
> +static int ast_i2c_deblock(struct udevice *dev)
> +{
> +	struct ast_i2c_priv *priv = dev_get_priv(dev);
> +	struct ast_i2c_regs *regs = priv->regs;
> +	u32 csr = readl(&regs->csr);
> +	bool sda_high = csr & I2CD_SDA_LINE_STS;
> +	bool scl_high = csr & I2CD_SCL_LINE_STS;
> +	int ret = 0;
> +
> +	if (sda_high && scl_high) {
> +		/* Bus is idle, no deblocking needed. */
> +		return 0;
> +	} else if (sda_high) {
> +		/* Send stop command */
> +		debug("Unterminated TXN in (%x), sending stop\n", csr);
> +		ret = ast_i2c_send_stop(dev);
> +	} else if (scl_high) {
> +		/* Possibly stuck slave */
> +		debug("Bus stuck (%x), attempting recovery\n", csr);
> +		writel(I2CD_BUS_RECOVER_CMD, &regs->csr);
> +		ret = ast_i2c_wait_isr(dev, I2CD_INTR_BUS_RECOVER_DONE);
> +	} else {
> +		/* Just try to reinit the device. */
> +		ast_i2c_init_bus(dev);
> +	}
> +
> +	return ret;
> +}
> +
> +static int ast_i2c_xfer(struct udevice *dev, struct i2c_msg *msg, int nmsgs)
> +{
> +	int ret;
> +
> +	ret = ast_i2c_deblock(dev);
> +	if (ret < 0)
> +		return ret;

here too.

Beside of this, as this patch is in a patchserie which goes not
through i2c tree, you can add my:

Acked-by: Heiko Schocher <hs@denx.de>

bye,
Heiko
-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
