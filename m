Return-Path: <maxims@google.com>
Received: from mail-it0-x22f.google.com (mail-it0-x22f.google.com
 [IPv6:2607:f8b0:4001:c0b::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w7RbY4K3CzDqBP
 for <openbmc@lists.ozlabs.org>; Thu, 20 Apr 2017 02:02:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="CvAf0zAb"; 
 dkim-atps=neutral
Received: by mail-it0-x22f.google.com with SMTP id 70so36186770ita.0
 for <openbmc@lists.ozlabs.org>; Wed, 19 Apr 2017 09:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=sRU/txzmWML0+AQlimDV/Ee6UMilmdps2tWQHjk6/wE=;
 b=CvAf0zAbYkeKBmU9WDYyw7flt/D9JVcnEZbCAaAbYbE30uF4rYq+NQN06S79iBo14M
 l8SkWETfclTJstUCqKMLb/yGaLDrHGyWyh88mhthe4yICn2y+jyUj9IzMd/0M+P9G7kq
 9zWBOSnm98YgQvaAdHlovxubrgDKmncW0HnyOhP6TK+NCQz/ReD1RJBSCwxuhqWeyQn/
 YbmU3sATG11QKn6S721IyjoayPupnKFk1XNxwMbuhQ7m2Hb0ujFtdC/WVLFYfaPMEgMQ
 CvWQLffPVvEaBpBsbGSzOQhKjNH2y5JbRHTkKmZLCPF5GzKjES0nIbCouufxxg+4CzWX
 qtCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=sRU/txzmWML0+AQlimDV/Ee6UMilmdps2tWQHjk6/wE=;
 b=EKcXWHmGu1o9qTIGBiRYJ7O99sWUpSr8PU/sNrM/YAejlJstMFYf24mcaLjs00mazk
 ZcZly5Xx+uSVcPWLAaER1mk18FS8t8R0pVftw0zoBzavjRrT5m50GfyCk+N/4drZ+BfJ
 erTPUwtUJeAb42abZKKsLk1mKS0yKnlsp13HDpyatjhDfSigXTNvRedwGEvmlj3E6/Wx
 4x4CYyTb6OjiHgP6vRKVe/bAOYjox6PvBTPwHQ1gPO3ZOEMIroEK2aFmn7T/Et2rLD98
 UBdW25pr/vZioT8M4L31hNQ9Jei22bgEQJXxVCQYyrXpt6Hx09YlF9P3ZWVvyEdEn5k6
 byqA==
X-Gm-Message-State: AN3rC/6vxeX2vl68R9jYWx4efHEZC5GfGRtqhu/h+FzQznxE9RIugSaA
 MFzSv/WNDYhu36Inv0G2lF3WAlNyNdFi
X-Received: by 10.36.82.144 with SMTP id d138mr21513214itb.24.1492617748676;
 Wed, 19 Apr 2017 09:02:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.185.7 with HTTP; Wed, 19 Apr 2017 09:02:27 -0700 (PDT)
In-Reply-To: <58F750EC.8080904@denx.de>
References: <20170417190034.71945-1-maxims@google.com>
 <20170417190034.71945-12-maxims@google.com>
 <58F750EC.8080904@denx.de>
From: Maxim Sloyko <maxims@google.com>
Date: Wed, 19 Apr 2017 09:02:27 -0700
Message-ID: <CAFR_W8pXNAN8q4W4hpsH5as_brSOHzwC6JMfrNyrxTJNp3ChDA@mail.gmail.com>
Subject: Re: [PATCH v1 11/15] aspeed: Add I2C Driver
To: Heiko Schocher <hs@denx.de>
Cc: Simon Glass <sjg@chromium.org>, U-Boot Mailing List <u-boot@lists.denx.de>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Wed, 19 Apr 2017 16:02:34 -0000

On Wed, Apr 19, 2017 at 4:58 AM, Heiko Schocher <hs@denx.de> wrote:
> Hello Maxim,
>
> Am 17.04.2017 um 21:00 schrieb Maxim Sloyko:
>>
>> Add Device Model based I2C driver for ast2500/ast2400 SoCs.
>> The driver is very limited, it only supports master mode and
>> synchronous byte-by-byte reads/writes, no DMA or Pool Buffers.
>>
>> Signed-off-by: Maxim Sloyko <maxims@google.com>
>>
>> ---
>>
>> Changes in v1:
>> - Style fixes
>>
>>
>> ---
>>   drivers/i2c/Kconfig   |   9 ++
>>   drivers/i2c/Makefile  |   1 +
>>   drivers/i2c/ast_i2c.c | 357
>> ++++++++++++++++++++++++++++++++++++++++++++++++++
>>   drivers/i2c/ast_i2c.h | 132 +++++++++++++++++++
>>   4 files changed, 499 insertions(+)
>>   create mode 100644 drivers/i2c/ast_i2c.c
>>   create mode 100644 drivers/i2c/ast_i2c.h
>
>
> Is this "version 2" from the patch you posted in march?

Yes, sorry, I think I forgot to add proper "In-Reply-To" header.

>
> Acked-by: Heiko Schocher <hs@denx.de>
>
> bye,
> Heiko
>
>>
>> diff --git a/drivers/i2c/Kconfig b/drivers/i2c/Kconfig
>> index 39f62daf5d..e661a308b0 100644
>> --- a/drivers/i2c/Kconfig
>> +++ b/drivers/i2c/Kconfig
>> @@ -100,6 +100,15 @@ config SYS_I2C_DW_ENABLE_STATUS_UNSUPPORTED
>>           enable status register. This config option can be enabled in
>> such
>>           cases.
>>
>> +config SYS_I2C_ASPEED
>> +       bool "Aspeed I2C Controller"
>> +       depends on DM_I2C && ARCH_ASPEED
>> +       help
>> +         Say yes here to select Aspeed I2C Host Controller. The driver
>> +         supports AST2500 and AST2400 controllers, but is very limited.
>> +         Only single master mode is supported and only byte-by-byte
>> +         synchronous reads and writes are supported, no Pool Buffers or
>> DMA.
>> +
>>   config SYS_I2C_INTEL
>>         bool "Intel I2C/SMBUS driver"
>>         depends on DM_I2C
>> diff --git a/drivers/i2c/Makefile b/drivers/i2c/Makefile
>> index 7c86198863..229fd476db 100644
>> --- a/drivers/i2c/Makefile
>> +++ b/drivers/i2c/Makefile
>> @@ -16,6 +16,7 @@ obj-$(CONFIG_PCA9564_I2C) += pca9564_i2c.o
>>   obj-$(CONFIG_TSI108_I2C) += tsi108_i2c.o
>>   obj-$(CONFIG_SH_SH7734_I2C) += sh_sh7734_i2c.o
>>   obj-$(CONFIG_SYS_I2C) += i2c_core.o
>> +obj-$(CONFIG_SYS_I2C_ASPEED) += ast_i2c.o
>>   obj-$(CONFIG_SYS_I2C_AT91) += at91_i2c.o
>>   obj-$(CONFIG_SYS_I2C_CADENCE) += i2c-cdns.o
>>   obj-$(CONFIG_SYS_I2C_DAVINCI) += davinci_i2c.o
>> diff --git a/drivers/i2c/ast_i2c.c b/drivers/i2c/ast_i2c.c
>> new file mode 100644
>> index 0000000000..16dfb57066
>> --- /dev/null
>> +++ b/drivers/i2c/ast_i2c.c
>> @@ -0,0 +1,357 @@
>> +/*
>> + * Copyright (C) 2012-2020  ASPEED Technology Inc.
>> + * Copyright 2016 IBM Corporation
>> + * Copyright 2017 Google, Inc.
>> + *
>> + * SPDX-License-Identifier:    GPL-2.0+
>> + */
>> +
>> +#include <common.h>
>> +#include <clk.h>
>> +#include <dm.h>
>> +#include <errno.h>
>> +#include <fdtdec.h>
>> +#include <i2c.h>
>> +#include <asm/io.h>
>> +#include <asm/arch/scu_ast2500.h>
>> +
>> +#include "ast_i2c.h"
>> +
>> +#define I2C_TIMEOUT_US 100000
>> +#define I2C_SLEEP_STEP_US 20
>> +
>> +#define HIGHSPEED_TTIMEOUT             3
>> +
>> +DECLARE_GLOBAL_DATA_PTR;
>> +
>> +/*
>> + * Device private data
>> + */
>> +struct ast_i2c_priv {
>> +       /* This device's clock */
>> +       struct clk clk;
>> +       /* Device registers */
>> +       struct ast_i2c_regs *regs;
>> +       /* I2C speed in Hz */
>> +       int speed;
>> +};
>> +
>> +/*
>> + * Given desired divider ratio, return the value that needs to be set
>> + * in Clock and AC Timing Control register
>> + */
>> +static u32 get_clk_reg_val(ulong divider_ratio)
>> +{
>> +       ulong inc = 0, div;
>> +       ulong scl_low, scl_high, data;
>> +
>> +       for (div = 0; divider_ratio >= 16; div++) {
>> +               inc |= (divider_ratio & 1);
>> +               divider_ratio >>= 1;
>> +       }
>> +       divider_ratio += inc;
>> +       scl_low = (divider_ratio >> 1) - 1;
>> +       scl_high = divider_ratio - scl_low - 2;
>> +       data = I2CD_CACTC_BASE
>> +                       | (scl_high << I2CD_TCKHIGH_SHIFT)
>> +                       | (scl_low << I2CD_TCKLOW_SHIFT)
>> +                       | (div << I2CD_BASE_DIV_SHIFT);
>> +
>> +       return data;
>> +}
>> +
>> +static void ast_i2c_clear_interrupts(struct udevice *dev)
>> +{
>> +       struct ast_i2c_priv *priv = dev_get_priv(dev);
>> +
>> +       writel(~0, &priv->regs->isr);
>> +}
>> +
>> +static void ast_i2c_init_bus(struct udevice *dev)
>> +{
>> +       struct ast_i2c_priv *priv = dev_get_priv(dev);
>> +
>> +       /* Reset device */
>> +       writel(0, &priv->regs->fcr);
>> +       /* Enable Master Mode. Assuming single-master */
>> +       writel(I2CD_MASTER_EN
>> +              | I2CD_M_SDA_LOCK_EN
>> +              | I2CD_MULTI_MASTER_DIS | I2CD_M_SCL_DRIVE_EN,
>> +              &priv->regs->fcr);
>> +       /* Enable Interrupts */
>> +       writel(I2CD_INTR_TX_ACK
>> +              | I2CD_INTR_TX_NAK
>> +              | I2CD_INTR_RX_DONE
>> +              | I2CD_INTR_BUS_RECOVER_DONE
>> +              | I2CD_INTR_NORMAL_STOP
>> +              | I2CD_INTR_ABNORMAL, &priv->regs->icr);
>> +}
>> +
>> +static int ast_i2c_ofdata_to_platdata(struct udevice *dev)
>> +{
>> +       struct ast_i2c_priv *priv = dev_get_priv(dev);
>> +       int ret;
>> +
>> +       priv->regs = dev_get_addr_ptr(dev);
>> +       if (IS_ERR(priv->regs))
>> +               return PTR_ERR(priv->regs);
>> +
>> +       ret = clk_get_by_index(dev, 0, &priv->clk);
>> +       if (ret < 0) {
>> +               debug("%s: Can't get clock for %s: %d\n", __func__,
>> dev->name,
>> +                     ret);
>> +               return ret;
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>> +static int ast_i2c_probe(struct udevice *dev)
>> +{
>> +       struct ast2500_scu *scu;
>> +
>> +       debug("Enabling I2C%u\n", dev->seq);
>> +
>> +       /*
>> +        * Get all I2C devices out of Reset.
>> +        * Only needs to be done once, but doing it for every
>> +        * device does not hurt.
>> +        */
>> +       scu = ast_get_scu();
>> +       ast_scu_unlock(scu);
>> +       clrbits_le32(&scu->sysreset_ctrl1, SCU_SYSRESET_I2C);
>> +       ast_scu_lock(scu);
>> +
>> +       ast_i2c_init_bus(dev);
>> +
>> +       return 0;
>> +}
>> +
>> +static int ast_i2c_wait_isr(struct udevice *dev, u32 flag)
>> +{
>> +       struct ast_i2c_priv *priv = dev_get_priv(dev);
>> +       int timeout = I2C_TIMEOUT_US;
>> +
>> +       while (!(readl(&priv->regs->isr) & flag) && timeout > 0) {
>> +               udelay(I2C_SLEEP_STEP_US);
>> +               timeout -= I2C_SLEEP_STEP_US;
>> +       }
>> +
>> +       ast_i2c_clear_interrupts(dev);
>> +       if (timeout <= 0)
>> +               return -ETIMEDOUT;
>> +
>> +       return 0;
>> +}
>> +
>> +static int ast_i2c_send_stop(struct udevice *dev)
>> +{
>> +       struct ast_i2c_priv *priv = dev_get_priv(dev);
>> +
>> +       writel(I2CD_M_STOP_CMD, &priv->regs->csr);
>> +
>> +       return ast_i2c_wait_isr(dev, I2CD_INTR_NORMAL_STOP);
>> +}
>> +
>> +static int ast_i2c_wait_tx(struct udevice *dev)
>> +{
>> +       struct ast_i2c_priv *priv = dev_get_priv(dev);
>> +       int timeout = I2C_TIMEOUT_US;
>> +       u32 flag = I2CD_INTR_TX_ACK | I2CD_INTR_TX_NAK;
>> +       u32 status = readl(&priv->regs->isr) & flag;
>> +       int ret = 0;
>> +
>> +       while (!status && timeout > 0) {
>> +               status = readl(&priv->regs->isr) & flag;
>> +               udelay(I2C_SLEEP_STEP_US);
>> +               timeout -= I2C_SLEEP_STEP_US;
>> +       }
>> +
>> +       if (status == I2CD_INTR_TX_NAK)
>> +               ret = -EREMOTEIO;
>> +
>> +       if (timeout <= 0)
>> +               ret = -ETIMEDOUT;
>> +
>> +       ast_i2c_clear_interrupts(dev);
>> +
>> +       return ret;
>> +}
>> +
>> +static int ast_i2c_start_txn(struct udevice *dev, uint devaddr)
>> +{
>> +       struct ast_i2c_priv *priv = dev_get_priv(dev);
>> +
>> +       /* Start and Send Device Address */
>> +       writel(devaddr, &priv->regs->trbbr);
>> +       writel(I2CD_M_START_CMD | I2CD_M_TX_CMD, &priv->regs->csr);
>> +
>> +       return ast_i2c_wait_tx(dev);
>> +}
>> +
>> +static int ast_i2c_read_data(struct udevice *dev, u8 chip_addr, u8
>> *buffer,
>> +                            size_t len, bool send_stop)
>> +{
>> +       struct ast_i2c_priv *priv = dev_get_priv(dev);
>> +       u32 i2c_cmd = I2CD_M_RX_CMD;
>> +       int ret;
>> +
>> +       ret = ast_i2c_start_txn(dev, (chip_addr << 1) | I2C_M_RD);
>> +       if (ret < 0)
>> +               return ret;
>> +
>> +       for (; len > 0; len--, buffer++) {
>> +               if (len == 1)
>> +                       i2c_cmd |= I2CD_M_S_RX_CMD_LAST;
>> +               writel(i2c_cmd, &priv->regs->csr);
>> +               ret = ast_i2c_wait_isr(dev, I2CD_INTR_RX_DONE);
>> +               if (ret < 0)
>> +                       return ret;
>> +               *buffer = (readl(&priv->regs->trbbr) & I2CD_RX_DATA_MASK)
>> +                               >> I2CD_RX_DATA_SHIFT;
>> +       }
>> +       ast_i2c_clear_interrupts(dev);
>> +
>> +       if (send_stop)
>> +               return ast_i2c_send_stop(dev);
>> +
>> +       return 0;
>> +}
>> +
>> +static int ast_i2c_write_data(struct udevice *dev, u8 chip_addr, u8
>> +                             *buffer, size_t len, bool send_stop)
>> +{
>> +       struct ast_i2c_priv *priv = dev_get_priv(dev);
>> +       int ret;
>> +
>> +       ret = ast_i2c_start_txn(dev, (chip_addr << 1));
>> +       if (ret < 0)
>> +               return ret;
>> +
>> +       for (; len > 0; len--, buffer++) {
>> +               writel(*buffer, &priv->regs->trbbr);
>> +               writel(I2CD_M_TX_CMD, &priv->regs->csr);
>> +               ret = ast_i2c_wait_tx(dev);
>> +               if (ret < 0)
>> +                       return ret;
>> +       }
>> +
>> +       if (send_stop)
>> +               return ast_i2c_send_stop(dev);
>> +
>> +       return 0;
>> +}
>> +
>> +static int ast_i2c_deblock(struct udevice *dev)
>> +{
>> +       struct ast_i2c_priv *priv = dev_get_priv(dev);
>> +       struct ast_i2c_regs *regs = priv->regs;
>> +       u32 csr = readl(&regs->csr);
>> +       bool sda_high = csr & I2CD_SDA_LINE_STS;
>> +       bool scl_high = csr & I2CD_SCL_LINE_STS;
>> +       int ret = 0;
>> +
>> +       if (sda_high && scl_high) {
>> +               /* Bus is idle, no deblocking needed. */
>> +               return 0;
>> +       } else if (sda_high) {
>> +               /* Send stop command */
>> +               debug("Unterminated TXN in (%x), sending stop\n", csr);
>> +               ret = ast_i2c_send_stop(dev);
>> +       } else if (scl_high) {
>> +               /* Possibly stuck slave */
>> +               debug("Bus stuck (%x), attempting recovery\n", csr);
>> +               writel(I2CD_BUS_RECOVER_CMD, &regs->csr);
>> +               ret = ast_i2c_wait_isr(dev, I2CD_INTR_BUS_RECOVER_DONE);
>> +       } else {
>> +               /* Just try to reinit the device. */
>> +               ast_i2c_init_bus(dev);
>> +       }
>> +
>> +       return ret;
>> +}
>> +
>> +static int ast_i2c_xfer(struct udevice *dev, struct i2c_msg *msg, int
>> nmsgs)
>> +{
>> +       int ret;
>> +
>> +       ret = ast_i2c_deblock(dev);
>> +       if (ret < 0)
>> +               return ret;
>> +
>> +       debug("i2c_xfer: %d messages\n", nmsgs);
>> +       for (; nmsgs > 0; nmsgs--, msg++) {
>> +               if (msg->flags & I2C_M_RD) {
>> +                       debug("i2c_read: chip=0x%x, len=0x%x,
>> flags=0x%x\n",
>> +                             msg->addr, msg->len, msg->flags);
>> +                       ret = ast_i2c_read_data(dev, msg->addr, msg->buf,
>> +                                               msg->len, (nmsgs == 1));
>> +               } else {
>> +                       debug("i2c_write: chip=0x%x, len=0x%x,
>> flags=0x%x\n",
>> +                             msg->addr, msg->len, msg->flags);
>> +                       ret = ast_i2c_write_data(dev, msg->addr, msg->buf,
>> +                                                msg->len, (nmsgs == 1));
>> +               }
>> +               if (ret) {
>> +                       debug("%s: error (%d)\n", __func__, ret);
>> +                       return -EREMOTEIO;
>> +               }
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>> +static int ast_i2c_set_speed(struct udevice *dev, unsigned int speed)
>> +{
>> +       struct ast_i2c_priv *priv = dev_get_priv(dev);
>> +       struct ast_i2c_regs *regs = priv->regs;
>> +       ulong i2c_rate, divider;
>> +
>> +       debug("Setting speed for I2C%d to <%u>\n", dev->seq, speed);
>> +       if (!speed) {
>> +               debug("No valid speed specified\n");
>> +               return -EINVAL;
>> +       }
>> +
>> +       i2c_rate = clk_get_rate(&priv->clk);
>> +       divider = i2c_rate / speed;
>> +
>> +       priv->speed = speed;
>> +       if (speed > I2C_HIGHSPEED_RATE) {
>> +               debug("Enable High Speed\n");
>> +               setbits_le32(&regs->fcr, I2CD_M_HIGH_SPEED_EN
>> +                            | I2CD_M_SDA_DRIVE_1T_EN
>> +                            | I2CD_SDA_DRIVE_1T_EN);
>> +               writel(HIGHSPEED_TTIMEOUT, &regs->cactcr2);
>> +       } else {
>> +               debug("Enabling Normal Speed\n");
>> +               writel(I2CD_NO_TIMEOUT_CTRL, &regs->cactcr2);
>> +       }
>> +
>> +       writel(get_clk_reg_val(divider), &regs->cactcr1);
>> +       ast_i2c_clear_interrupts(dev);
>> +
>> +       return 0;
>> +}
>> +
>> +static const struct dm_i2c_ops ast_i2c_ops = {
>> +       .xfer = ast_i2c_xfer,
>> +       .set_bus_speed = ast_i2c_set_speed,
>> +       .deblock = ast_i2c_deblock,
>> +};
>> +
>> +static const struct udevice_id ast_i2c_ids[] = {
>> +       { .compatible = "aspeed,ast2400-i2c-bus" },
>> +       { .compatible = "aspeed,ast2500-i2c-bus" },
>> +       { },
>> +};
>> +
>> +U_BOOT_DRIVER(ast_i2c) = {
>> +       .name = "ast_i2c",
>> +       .id = UCLASS_I2C,
>> +       .of_match = ast_i2c_ids,
>> +       .probe = ast_i2c_probe,
>> +       .ofdata_to_platdata = ast_i2c_ofdata_to_platdata,
>> +       .priv_auto_alloc_size = sizeof(struct ast_i2c_priv),
>> +       .ops = &ast_i2c_ops,
>> +};
>> diff --git a/drivers/i2c/ast_i2c.h b/drivers/i2c/ast_i2c.h
>> new file mode 100644
>> index 0000000000..e5dec7a480
>> --- /dev/null
>> +++ b/drivers/i2c/ast_i2c.h
>> @@ -0,0 +1,132 @@
>> +/*
>> + * Copyright (C) 2012-2020  ASPEED Technology Inc.
>> + * Copyright 2016 IBM Corporation
>> + * Copyright 2017 Google, Inc.
>> + *
>> + * SPDX-License-Identifier:    GPL-2.0+
>> + */
>> +#ifndef __AST_I2C_H_
>> +#define __AST_I2C_H_
>> +
>> +struct ast_i2c_regs {
>> +       u32 fcr;
>> +       u32 cactcr1;
>> +       u32 cactcr2;
>> +       u32 icr;
>> +       u32 isr;
>> +       u32 csr;
>> +       u32 sdar;
>> +       u32 pbcr;
>> +       u32 trbbr;
>> +#ifdef CONFIG_ASPEED_AST2500
>> +       u32 dma_mbar;
>> +       u32 dma_tlr;
>> +#endif
>> +};
>> +
>> +/* Device Register Definition */
>> +/* 0x00 : I2CD Function Control Register  */
>> +#define I2CD_BUFF_SEL_MASK                             (0x7 << 20)
>> +#define I2CD_BUFF_SEL(x)                               (x << 20)
>> +#define I2CD_M_SDA_LOCK_EN                     (0x1 << 16)
>> +#define I2CD_MULTI_MASTER_DIS                  (0x1 << 15)
>> +#define I2CD_M_SCL_DRIVE_EN            (0x1 << 14)
>> +#define I2CD_MSB_STS                                   (0x1 << 9)
>> +#define I2CD_SDA_DRIVE_1T_EN                   (0x1 << 8)
>> +#define I2CD_M_SDA_DRIVE_1T_EN         (0x1 << 7)
>> +#define I2CD_M_HIGH_SPEED_EN           (0x1 << 6)
>> +#define I2CD_DEF_ADDR_EN                               (0x1 << 5)
>> +#define I2CD_DEF_ALERT_EN                              (0x1 << 4)
>> +#define I2CD_DEF_ARP_EN                                        (0x1 << 3)
>> +#define I2CD_DEF_GCALL_EN                              (0x1 << 2)
>> +#define I2CD_SLAVE_EN                                  (0x1 << 1)
>> +#define I2CD_MASTER_EN                                 (0x1)
>> +
>> +/* 0x04 : I2CD Clock and AC Timing Control Register #1 */
>> +/* Base register value. These bits are always set by the driver. */
>> +#define I2CD_CACTC_BASE                        0xfff00300
>> +#define I2CD_TCKHIGH_SHIFT                     16
>> +#define I2CD_TCKLOW_SHIFT                      12
>> +#define I2CD_THDDAT_SHIFT                      10
>> +#define I2CD_TO_DIV_SHIFT                      8
>> +#define I2CD_BASE_DIV_SHIFT                    0
>> +
>> +/* 0x08 : I2CD Clock and AC Timing Control Register #2 */
>> +#define I2CD_tTIMEOUT                                  1
>> +#define I2CD_NO_TIMEOUT_CTRL                   0
>> +
>> +/* 0x0c : I2CD Interrupt Control Register &
>> + * 0x10 : I2CD Interrupt Status Register
>> + *
>> + * These share bit definitions, so use the same values for the enable &
>> + * status bits.
>> + */
>> +#define I2CD_INTR_SDA_DL_TIMEOUT                       (0x1 << 14)
>> +#define I2CD_INTR_BUS_RECOVER_DONE                     (0x1 << 13)
>> +#define I2CD_INTR_SMBUS_ALERT                  (0x1 << 12)
>> +#define I2CD_INTR_SMBUS_ARP_ADDR                       (0x1 << 11)
>> +#define I2CD_INTR_SMBUS_DEV_ALERT_ADDR         (0x1 << 10)
>> +#define I2CD_INTR_SMBUS_DEF_ADDR                       (0x1 << 9)
>> +#define I2CD_INTR_GCALL_ADDR                   (0x1 << 8)
>> +#define I2CD_INTR_SLAVE_MATCH                  (0x1 << 7)
>> +#define I2CD_INTR_SCL_TIMEOUT                  (0x1 << 6)
>> +#define I2CD_INTR_ABNORMAL                             (0x1 << 5)
>> +#define I2CD_INTR_NORMAL_STOP                  (0x1 << 4)
>> +#define I2CD_INTR_ARBIT_LOSS                   (0x1 << 3)
>> +#define I2CD_INTR_RX_DONE                              (0x1 << 2)
>> +#define I2CD_INTR_TX_NAK                               (0x1 << 1)
>> +#define I2CD_INTR_TX_ACK                               (0x1 << 0)
>> +
>> +/* 0x14 : I2CD Command/Status Register   */
>> +#define I2CD_SDA_OE                                    (0x1 << 28)
>> +#define I2CD_SDA_O                                     (0x1 << 27)
>> +#define I2CD_SCL_OE                                    (0x1 << 26)
>> +#define I2CD_SCL_O                                     (0x1 << 25)
>> +#define I2CD_TX_TIMING                         (0x1 << 24)
>> +#define I2CD_TX_STATUS                         (0x1 << 23)
>> +
>> +/* Tx State Machine */
>> +#define I2CD_IDLE                                      0x0
>> +#define I2CD_MACTIVE                           0x8
>> +#define I2CD_MSTART                                    0x9
>> +#define I2CD_MSTARTR                           0xa
>> +#define I2CD_MSTOP                                     0xb
>> +#define I2CD_MTXD                                      0xc
>> +#define I2CD_MRXACK                                    0xd
>> +#define I2CD_MRXD                                      0xe
>> +#define I2CD_MTXACK                            0xf
>> +#define I2CD_SWAIT                                     0x1
>> +#define I2CD_SRXD                                      0x4
>> +#define I2CD_STXACK                            0x5
>> +#define I2CD_STXD                                      0x6
>> +#define I2CD_SRXACK                            0x7
>> +#define I2CD_RECOVER                           0x3
>> +
>> +#define I2CD_SCL_LINE_STS                              (0x1 << 18)
>> +#define I2CD_SDA_LINE_STS                              (0x1 << 17)
>> +#define I2CD_BUS_BUSY_STS                              (0x1 << 16)
>> +#define I2CD_SDA_OE_OUT_DIR                            (0x1 << 15)
>> +#define I2CD_SDA_O_OUT_DIR                             (0x1 << 14)
>> +#define I2CD_SCL_OE_OUT_DIR                            (0x1 << 13)
>> +#define I2CD_SCL_O_OUT_DIR                             (0x1 << 12)
>> +#define I2CD_BUS_RECOVER_CMD                   (0x1 << 11)
>> +#define I2CD_S_ALT_EN                          (0x1 << 10)
>> +#define I2CD_RX_DMA_ENABLE                             (0x1 << 9)
>> +#define I2CD_TX_DMA_ENABLE                             (0x1 << 8)
>> +
>> +/* Command Bit */
>> +#define I2CD_RX_BUFF_ENABLE                            (0x1 << 7)
>> +#define I2CD_TX_BUFF_ENABLE                            (0x1 << 6)
>> +#define I2CD_M_STOP_CMD                                        (0x1 << 5)
>> +#define I2CD_M_S_RX_CMD_LAST                   (0x1 << 4)
>> +#define I2CD_M_RX_CMD                                  (0x1 << 3)
>> +#define I2CD_S_TX_CMD                                  (0x1 << 2)
>> +#define I2CD_M_TX_CMD                                  (0x1 << 1)
>> +#define I2CD_M_START_CMD                               0x1
>> +
>> +#define I2CD_RX_DATA_SHIFT                     8
>> +#define I2CD_RX_DATA_MASK                      (0xff <<
>> I2CD_RX_DATA_SHIFT)
>> +
>> +#define I2C_HIGHSPEED_RATE    400000
>> +
>> +#endif                         /* __AST_I2C_H_ */
>>
>
> --
> DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany



-- 
Maxim Sloyko
