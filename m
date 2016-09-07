Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x244.google.com (mail-vk0-x244.google.com
 [IPv6:2607:f8b0:400c:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sV0gq0jdQzDsFS
 for <openbmc@lists.ozlabs.org>; Thu,  8 Sep 2016 09:54:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=p/RuH/Ja; 
 dkim-atps=neutral
Received: by mail-vk0-x244.google.com with SMTP id m62so1194240vkd.1
 for <openbmc@lists.ozlabs.org>; Wed, 07 Sep 2016 16:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=Q/AVCaQE7XqY4nA6i0ag5Uv58ffWSx834vPxMr+KAjs=;
 b=p/RuH/Ja9zCpSWU4gjR/Xz91YDmDmTNPdlg8cNVSdyk57uNtOW5EoZ2i69f3KhO+PD
 37LsLmSS+jRO0jfQLlA+1o1+k/f9cUbecC2GKn8Zp3aQPLzG/1hCfybmz+QMBxgGIos4
 2vabOz+Lrn8Xtcw4mxyCCjalQGBmNzdLPuTLvYDoEkwZcCVZ4H+ZUpHkNQgr2Nbe9qZH
 NYL/VnUHIrcj35DZASHIwtI274WJtiTDAycGseblVqso0KloQeOE2KF/8nbs2O+UH2bL
 gswWEKcMBKGNqANJIA3h6ZI2UCw0YzOHPvyIPGaHSWfUcIdt3arSFkF7WJZBi9vLEtJa
 wSjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=Q/AVCaQE7XqY4nA6i0ag5Uv58ffWSx834vPxMr+KAjs=;
 b=NRyJMYlHQSGke8A/Cx4BjaXA95sUxco4HBam6hgGwJc6btYTknpHIPy1TezheaeuSL
 SM8+td0nVwYhzdq7EVC36M713nSkfaKrE60kk4PL0veoZk8yQCW0+UVt0u4ZR+FWZn5A
 dYhqkVf547spPbW3m5MaWlQ8mtB9i1fre9P0gm3YIriIfZiImSZKelYLoAxkVymo5/yl
 5BYT2xaoizqim65EYZocixIqd/V+hs79b05TcjdLCi3EVhP4X5syY/PKG8zvelZ4IeOF
 0ezq0OoC4dcXtNSOSPUGVDTYfmLf7VGrdLRyrzx1XdpbDVjIuTbClXkyIGzop877is2M
 UMBg==
X-Gm-Message-State: AE9vXwM261SjGaii+0TEvstJv1IRhwmLQa84oZRa8MlSMF4jozXvh9ljtXN/3JHWbhPkkWL754eO65dFoABWVQ==
X-Received: by 10.31.102.135 with SMTP id a129mr27393619vkc.112.1473292483573; 
 Wed, 07 Sep 2016 16:54:43 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.82.239 with HTTP; Wed, 7 Sep 2016 16:54:23 -0700 (PDT)
In-Reply-To: <1472583146-6393-1-git-send-email-brendanhiggins@google.com>
References: <CACPK8XfAfiuas_D3UGMf6Hf922oFH9dcHg_9QUP7xvmuTkmabg@mail.gmail.com>
 <1472583146-6393-1-git-send-email-brendanhiggins@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 8 Sep 2016 09:24:23 +0930
X-Google-Sender-Auth: qIv_9nURzLWCutuw3m5UtUOjHNk
Message-ID: <CACPK8XdutpE97bUr2goj3Vqw9R0_HOtZ0rLWLnT-FcmYnLQHZg@mail.gmail.com>
Subject: Re: [PATCH v2] i2c: aspeed: added driver for Aspeed I2C
To: Brendan Higgins <brendanhiggins@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Wed, 07 Sep 2016 23:54:48 -0000

On Wed, Aug 31, 2016 at 4:22 AM, Brendan Higgins
<brendanhiggins@google.com> wrote:
> Added initial master and slave support for Aspeed I2C controller.
> Supports fourteen busses present in ast24xx and ast25xx BMC SoCs by
> Aspeed.
>
> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> ---
>  drivers/i2c/busses/Kconfig      |  10 +
>  drivers/i2c/busses/Makefile     |   1 +
>  drivers/i2c/busses/i2c-aspeed.c | 812 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 823 insertions(+)
>  create mode 100644 drivers/i2c/busses/i2c-aspeed.c
>
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 5c3993b..0178c6c 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -998,6 +998,16 @@ config I2C_RCAR
>           This driver can also be built as a module.  If so, the module
>           will be called i2c-rcar.
>
> +config I2C_ASPEED
> +       tristate "Aspeed AST2xxx SoC I2C Controller"
> +       depends on (ARCH_ASPEED || COMPILE_TEST) && OF
> +       help
> +         If you say yes to this option, support will be included for the
> +         Aspeed AST2xxx SoC I2C controller.
> +
> +         This driver can also be built as a module.  If so, the module
> +         will be called i2c-aspeed.
> +
>  comment "External I2C/SMBus adapter drivers"
>
>  config I2C_DIOLAN_U2C
> diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
> index 37f2819..49631cd 100644
> --- a/drivers/i2c/busses/Makefile
> +++ b/drivers/i2c/busses/Makefile
> @@ -96,6 +96,7 @@ obj-$(CONFIG_I2C_XILINX)      += i2c-xiic.o
>  obj-$(CONFIG_I2C_XLR)          += i2c-xlr.o
>  obj-$(CONFIG_I2C_XLP9XX)       += i2c-xlp9xx.o
>  obj-$(CONFIG_I2C_RCAR)         += i2c-rcar.o
> +obj-$(CONFIG_I2C_ASPEED)       += i2c-aspeed.o
>
>  # External I2C/SMBus adapter drivers
>  obj-$(CONFIG_I2C_DIOLAN_U2C)   += i2c-diolan-u2c.o
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> new file mode 100644
> index 0000000..81c96e2
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -0,0 +1,812 @@
> +/*
> + *  I2C adapter for the ASPEED I2C bus.
> + *
> + *  Copyright (C) 2012-2020  ASPEED Technology Inc.
> + *  Copyright 2015 IBM Corporation

Can you update this to 2016? And add your own?

> + *
> + *  This program is free software; you can redistribute it and/or modify
> + *  it under the terms of the GNU General Public License version 2 as
> + *  published by the Free Software Foundation.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/i2c.h>
> +#include <linux/irq.h>
> +#include <linux/irqdomain.h>
> +#include <linux/init.h>
> +#include <linux/io.h>
> +#include <linux/errno.h>
> +#include <linux/interrupt.h>
> +#include <linux/completion.h>
> +#include <linux/slab.h>
> +#include <linux/of_address.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/err.h>
> +#include <linux/clk.h>
> +
> +/* I2C Register */
> +#define AST_I2C_FUN_CTRL_REG                           0x00
> +#define AST_I2C_AC_TIMING_REG1                         0x04
> +#define AST_I2C_AC_TIMING_REG2                         0x08
> +#define AST_I2C_INTR_CTRL_REG                          0x0c
> +#define AST_I2C_INTR_STS_REG                           0x10
> +#define AST_I2C_CMD_REG                                0x14
> +#define AST_I2C_DEV_ADDR_REG                           0x18
> +#define AST_I2C_BYTE_BUF_REG                           0x20

I would prefer using the ASPEED_ prefix for all #defines and functions
for consistency with other kernel code.

> +
> +#define AST_I2C_NUM_BUS 14

> +
> +/* Gloable Register Definition */

Typo: Global

> +/* 0x00 : I2C Interrupt Status Register  */
> +/* 0x08 : I2C Interrupt Target Assignment  */
> +
> +/* Device Register Definition */
> +/* 0x00 : I2CD Function Control Register  */
> +#define AST_I2CD_MULTI_MASTER_DIS                      (0x1 << 15)
> +#define AST_I2CD_SDA_DRIVE_1T_EN                       (0x1 << 8)
> +#define AST_I2CD_M_SDA_DRIVE_1T_EN                     (0x1 << 7)
> +#define AST_I2CD_M_HIGH_SPEED_EN                       (0x1 << 6)
> +#define AST_I2CD_SLAVE_EN                              (0x1 << 1)

If you want to convert these to use the BIT(1), etc notation.

> +#define AST_I2CD_MASTER_EN                             (0x1)
> +
> +/* 0x08 : I2CD Clock and AC Timing Control Register #2 */
> +#define AST_NO_TIMEOUT_CTRL                            0x0
> +
> +
> +/* 0x0c : I2CD Interrupt Control Register &
> + * 0x10 : I2CD Interrupt Status Register
> + *
> + * These share bit definitions, so use the same values for the enable &
> + * status bits.
> + */
> +#define AST_I2CD_INTR_SDA_DL_TIMEOUT                   (0x1 << 14)
> +#define AST_I2CD_INTR_BUS_RECOVER_DONE                 (0x1 << 13)
> +#define AST_I2CD_INTR_SLAVE_MATCH                      (0x1 << 7)
> +#define AST_I2CD_INTR_SCL_TIMEOUT                      (0x1 << 6)
> +#define AST_I2CD_INTR_ABNORMAL                         (0x1 << 5)
> +#define AST_I2CD_INTR_NORMAL_STOP                      (0x1 << 4)
> +#define AST_I2CD_INTR_ARBIT_LOSS                       (0x1 << 3)
> +#define AST_I2CD_INTR_RX_DONE                          (0x1 << 2)
> +#define AST_I2CD_INTR_TX_NAK                           (0x1 << 1)
> +#define AST_I2CD_INTR_TX_ACK                           (0x1 << 0)
> +
> +/* 0x14 : I2CD Command/Status Register   */
> +#define AST_I2CD_SCL_LINE_STS                          (0x1 << 18)
> +#define AST_I2CD_SDA_LINE_STS                          (0x1 << 17)
> +#define AST_I2CD_BUS_BUSY_STS                          (0x1 << 16)
> +#define AST_I2CD_BUS_RECOVER_CMD                       (0x1 << 11)
> +
> +/* Command Bit */
> +#define AST_I2CD_M_STOP_CMD                            (0x1 << 5)
> +#define AST_I2CD_M_S_RX_CMD_LAST                       (0x1 << 4)
> +#define AST_I2CD_M_RX_CMD                              (0x1 << 3)
> +#define AST_I2CD_S_TX_CMD                              (0x1 << 2)
> +#define AST_I2CD_M_TX_CMD                              (0x1 << 1)
> +#define AST_I2CD_M_START_CMD                           (0x1)
> +
> +/* 0x18 : I2CD Slave Device Address Register   */
> +#define AST_I2CD_DEV_ADDR_MASK                          ((0x1 << 7) - 1)
> +
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)

Can we get away without the guard here?

> +enum ast_i2c_slave_state {
> +       AST_I2C_SLAVE_START,
> +       AST_I2C_SLAVE_READ_REQUESTED,
> +       AST_I2C_SLAVE_READ_PROCESSED,
> +       AST_I2C_SLAVE_WRITE_REQUESTED,
> +       AST_I2C_SLAVE_WRITE_RECEIVED,
> +       AST_I2C_SLAVE_STOP,
> +};
> +#endif
> +
> +struct ast_i2c_bus {
> +       struct i2c_adapter              adap;
> +       struct device                   *dev;
> +       void __iomem                    *base;
> +       spinlock_t                      lock;
> +       struct completion               cmd_complete;
> +       int                             irq;
> +       /* Transaction state. */
> +       struct i2c_msg                  *msg;
> +       int                             msg_pos;
> +       u32                             cmd_err;
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +       struct i2c_client               *slave;
> +       enum ast_i2c_slave_state        slave_state;
> +#endif
> +};
> +
> +struct ast_i2c_controller {
> +       struct device           *dev;
> +       void __iomem            *base;
> +       int                     irq;
> +       struct irq_domain       *irq_domain;
> +};
> +
> +static inline void ast_i2c_write(struct ast_i2c_bus *bus, u32 val, u32 reg)
> +{
> +       writel(val, bus->base + reg);
> +}
> +
> +static inline u32 ast_i2c_read(struct ast_i2c_bus *bus, u32 reg)
> +{
> +       return readl(bus->base + reg);
> +}
> +
> +static u8 ast_i2c_recover_bus(struct ast_i2c_bus *bus)
> +{
> +       u32 sts;
> +       unsigned long time_left;
> +       unsigned long flags;
> +       int ret = 0;
> +
> +       spin_lock_irqsave(&bus->lock, flags);
> +       sts = ast_i2c_read(bus, AST_I2C_CMD_REG);

s/sts/status/

> +       /* Bus is idle: no recovery needed. */
> +       if ((sts & AST_I2CD_SDA_LINE_STS) && (sts & AST_I2CD_SCL_LINE_STS)) {
> +               spin_unlock_irqrestore(&bus->lock, flags);
> +               return 0;

Would goto out, with out being just above the _ireqrestore at the
bottom of this function, make it clearer that we are doing the correct
lock/unlocking?

> +       }
> +       dev_dbg(bus->dev, "bus hung (status %x), attempting recovery\n", sts);
> +
> +       /* Bus held: put bus in stop state. */
> +       if ((sts & AST_I2CD_SDA_LINE_STS) && !(sts & AST_I2CD_SCL_LINE_STS)) {
> +               ast_i2c_write(bus, AST_I2CD_M_STOP_CMD, AST_I2C_CMD_REG);
> +               reinit_completion(&bus->cmd_complete);
> +               spin_unlock_irqrestore(&bus->lock, flags);
> +
> +               time_left = wait_for_completion_interruptible_timeout(
> +                               &bus->cmd_complete, bus->adap.timeout * HZ);
> +
> +               spin_lock_irqsave(&bus->lock, flags);

I assume we are releasing the lock to wait for the completion?

> +               if (time_left == 0)
> +                       ret = -ETIMEDOUT;
> +               else if (bus->cmd_err)
> +                       ret = -EIO;
> +       /* Bus error. */
> +       } else if (!(sts & AST_I2CD_SDA_LINE_STS)) {
> +               ast_i2c_write(bus, AST_I2CD_BUS_RECOVER_CMD, AST_I2C_CMD_REG);
> +               reinit_completion(&bus->cmd_complete);
> +               spin_unlock_irqrestore(&bus->lock, flags);
> +
> +               time_left = wait_for_completion_interruptible_timeout(
> +                               &bus->cmd_complete, bus->adap.timeout * HZ);
> +
> +               spin_lock_irqsave(&bus->lock, flags);
> +               if (time_left == 0)
> +                       ret = -ETIMEDOUT;
> +               else if (bus->cmd_err)
> +                       ret = -EIO;
> +               /* Recovery failed. */
> +               else if (!(ast_i2c_read(bus, AST_I2C_CMD_REG) &
> +                          AST_I2CD_SDA_LINE_STS))
> +                       ret = -EIO;
> +       }
> +       spin_unlock_irqrestore(&bus->lock, flags);
> +       return ret;
> +}
> +
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +static bool ast_i2c_slave_irq(struct ast_i2c_bus *bus)
> +{
> +       bool irq_handled = true;
> +       u32 command;
> +       u32 irq_status;

Above we call it "sts", down here we call it "irq_status". I suggest a
consistent name.

> +       u32 status_ack = 0;
> +       u8 value;
> +       enum i2c_slave_event event;
> +       struct i2c_client *slave = bus->slave;
> +
> +       spin_lock(&bus->lock);
> +       if (!slave) {
> +               irq_handled = false;
> +               goto out;
> +       }
> +       command = ast_i2c_read(bus, AST_I2C_CMD_REG);
> +       irq_status = ast_i2c_read(bus, AST_I2C_INTR_STS_REG);
> +
> +       /* Slave was requested, restart state machine. */
> +       if (irq_status & AST_I2CD_INTR_SLAVE_MATCH) {
> +               status_ack |= AST_I2CD_INTR_SLAVE_MATCH;
> +               bus->slave_state = AST_I2C_SLAVE_START;
> +       }
> +       /* Slave is not currently active, irq was for someone else. */
> +       if (bus->slave_state == AST_I2C_SLAVE_STOP) {
> +               irq_handled = false;
> +               goto out;
> +       }
> +
> +       dev_dbg(bus->dev, "slave irq status 0x%08x, cmd 0x%08x\n",
> +               irq_status, command);
> +
> +       /* Slave was sent something. */
> +       if (irq_status & AST_I2CD_INTR_RX_DONE) {
> +               value = ast_i2c_read(bus, AST_I2C_BYTE_BUF_REG) >> 8;

What is "value"? Perhaps "request"?

> +               /* Handle address frame. */
> +               if (bus->slave_state == AST_I2C_SLAVE_START) {
> +                       if (value & 0x1)
> +                               bus->slave_state = AST_I2C_SLAVE_READ_REQUESTED;
> +                       else
> +                               bus->slave_state =
> +                                               AST_I2C_SLAVE_WRITE_REQUESTED;
> +               }
> +               status_ack |= AST_I2CD_INTR_RX_DONE;
> +       }
> +
> +       /* Slave was asked to stop. */
> +       if (irq_status & AST_I2CD_INTR_NORMAL_STOP ||
> +           irq_status & AST_I2CD_INTR_TX_NAK) {
> +               if (irq_status & AST_I2CD_INTR_NORMAL_STOP)
> +                       status_ack |= AST_I2CD_INTR_NORMAL_STOP;

You're testing for the same thing in both if loops. Could you
rearrange the logic?

> +               else
> +                       status_ack |= AST_I2CD_INTR_TX_NAK;
> +               bus->slave_state = AST_I2C_SLAVE_STOP;
> +       }
> +
> +       if (bus->slave_state == AST_I2C_SLAVE_READ_REQUESTED ||
> +           bus->slave_state == AST_I2C_SLAVE_READ_PROCESSED) {
> +               if (bus->slave_state == AST_I2C_SLAVE_READ_REQUESTED) {

As above.

> +                       event = I2C_SLAVE_READ_REQUESTED;
> +                       if (irq_status & AST_I2CD_INTR_TX_ACK)
> +                               dev_err(bus->dev,
> +                                       "Unexpected ACK on read request.\n");
> +               } else {
> +                       status_ack |= AST_I2CD_INTR_TX_ACK;
> +                       event = I2C_SLAVE_READ_PROCESSED;
> +                       if (!(irq_status & AST_I2CD_INTR_TX_ACK))
> +                               dev_err(bus->dev,
> +                                       "Expected ACK after processed read.\n");
> +               }
> +               bus->slave_state = AST_I2C_SLAVE_READ_PROCESSED;
> +
> +               i2c_slave_event(slave, event, &value);
> +               ast_i2c_write(bus, value, AST_I2C_BYTE_BUF_REG);
> +               ast_i2c_write(bus, AST_I2CD_S_TX_CMD, AST_I2C_CMD_REG);
> +       } else if (bus->slave_state == AST_I2C_SLAVE_WRITE_REQUESTED) {
> +               bus->slave_state = AST_I2C_SLAVE_WRITE_RECEIVED;
> +               i2c_slave_event(slave, I2C_SLAVE_WRITE_REQUESTED, &value);
> +       } else if (bus->slave_state == AST_I2C_SLAVE_WRITE_RECEIVED) {
> +               i2c_slave_event(slave, I2C_SLAVE_WRITE_RECEIVED, &value);
> +       } else if (bus->slave_state == AST_I2C_SLAVE_STOP) {
> +               i2c_slave_event(slave, I2C_SLAVE_STOP, &value);
> +       }
> +
> +       if (status_ack != irq_status)
> +               dev_err(bus->dev,
> +                       "irq handled != irq. expected %x, but was %x\n",
> +                       irq_status, status_ack);
> +       ast_i2c_write(bus, status_ack, AST_I2C_INTR_STS_REG);
> +
> +out:
> +       spin_unlock(&bus->lock);
> +       return irq_handled;
> +}
> +#endif
> +
> +static bool ast_i2c_master_irq(struct ast_i2c_bus *bus)
> +{
> +       const u32 errs = AST_I2CD_INTR_ARBIT_LOSS |
> +               AST_I2CD_INTR_ABNORMAL |
> +               AST_I2CD_INTR_SCL_TIMEOUT |
> +               AST_I2CD_INTR_SDA_DL_TIMEOUT |
> +               AST_I2CD_INTR_TX_NAK;
> +       u32 irq_status;
> +
> +       spin_lock(&bus->lock);
> +       irq_status = ast_i2c_read(bus, AST_I2C_INTR_STS_REG);
> +       bus->cmd_err |= irq_status & errs;
> +
> +       dev_dbg(bus->dev, "master irq status 0x%08x\n", irq_status);
> +
> +       /* No message to transfer. */
> +       if (bus->cmd_err ||
> +           (irq_status & AST_I2CD_INTR_NORMAL_STOP) ||
> +           (irq_status & AST_I2CD_INTR_BUS_RECOVER_DONE)) {
> +               complete(&bus->cmd_complete);
> +               goto out;
> +       } else if (!bus->msg || bus->msg_pos >= bus->msg->len)
> +               goto out;
> +
> +       if ((bus->msg->flags & I2C_M_RD) &&
> +           (irq_status & AST_I2CD_INTR_RX_DONE)) {
> +               bus->msg->buf[bus->msg_pos++] =
> +                               ast_i2c_read(bus, AST_I2C_BYTE_BUF_REG) >> 8;
> +               if (bus->msg_pos + 1 < bus->msg->len)
> +                       ast_i2c_write(bus, AST_I2CD_M_RX_CMD, AST_I2C_CMD_REG);
> +               else if (bus->msg_pos < bus->msg->len)
> +                       ast_i2c_write(bus, AST_I2CD_M_RX_CMD |
> +                                     AST_I2CD_M_S_RX_CMD_LAST,
> +                                     AST_I2C_CMD_REG);
> +       } else if (!(bus->msg->flags & I2C_M_RD) &&
> +                  (irq_status & AST_I2CD_INTR_TX_ACK)) {
> +               ast_i2c_write(bus, bus->msg->buf[bus->msg_pos++],
> +                             AST_I2C_BYTE_BUF_REG);
> +               ast_i2c_write(bus, AST_I2CD_M_TX_CMD, AST_I2C_CMD_REG);
> +       }
> +
> +       /* Transmission complete: notify caller. */
> +       if (bus->msg_pos >= bus->msg->len)
> +               complete(&bus->cmd_complete);
> +out:
> +       ast_i2c_write(bus, irq_status, AST_I2C_INTR_STS_REG);
> +       spin_unlock(&bus->lock);
> +       return true;
> +}
> +
> +static irqreturn_t ast_i2c_bus_irq(int irq, void *dev_id)
> +{
> +       struct ast_i2c_bus *bus = dev_id;
> +
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +       if (ast_i2c_slave_irq(bus)) {
> +               dev_dbg(bus->dev, "irq handled by slave.\n");
> +               return IRQ_HANDLED;
> +       }
> +#endif
> +       if (ast_i2c_master_irq(bus)) {
> +               dev_dbg(bus->dev, "irq handled by master.\n");
> +               return IRQ_HANDLED;
> +       }
> +       dev_err(bus->dev, "irq not handled properly!\n");
> +       return IRQ_HANDLED;
> +}
> +
> +static int ast_i2c_master_single_xfer(struct i2c_adapter *adap,
> +                                     struct i2c_msg *msg)
> +{
> +       struct ast_i2c_bus *bus = adap->algo_data;
> +       unsigned long flags;
> +       u8 slave_addr;
> +       u32 command = AST_I2CD_M_START_CMD | AST_I2CD_M_TX_CMD;
> +       int ret = msg->len;
> +       unsigned long time_left;
> +
> +       spin_lock_irqsave(&bus->lock, flags);
> +       bus->msg = msg;
> +       bus->msg_pos = 0;
> +       slave_addr = msg->addr << 1;
> +       if (msg->flags & I2C_M_RD) {
> +               slave_addr |= 1;
> +               command |= AST_I2CD_M_RX_CMD;
> +       }
> +       ast_i2c_write(bus, slave_addr, AST_I2C_BYTE_BUF_REG);
> +       ast_i2c_write(bus, command, AST_I2C_CMD_REG);
> +       reinit_completion(&bus->cmd_complete);
> +       spin_unlock_irqrestore(&bus->lock, flags);
> +
> +       time_left = wait_for_completion_interruptible_timeout(
> +                       &bus->cmd_complete, bus->adap.timeout * HZ * msg->len);
> +       if (time_left == 0)
> +               return -ETIMEDOUT;
> +
> +       spin_lock_irqsave(&bus->lock, flags);
> +       if (bus->cmd_err)
> +               ret = -EIO;
> +       bus->msg = NULL;
> +       spin_unlock_irqrestore(&bus->lock, flags);
> +
> +       return ret;
> +}
> +
> +static int ast_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
> +                              int num)
> +{
> +       struct ast_i2c_bus *bus = adap->algo_data;
> +       int ret;
> +       int i;
> +       unsigned long flags;
> +       unsigned long time_left;
> +
> +       /* If bus is busy, attempt recovery. We assume a single master
> +        * environment.
> +        */
> +       if (ast_i2c_read(bus, AST_I2C_CMD_REG) & AST_I2CD_BUS_BUSY_STS) {
> +               ret = ast_i2c_recover_bus(bus);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       for (i = 0; i < num; i++) {
> +               ret = ast_i2c_master_single_xfer(adap, &msgs[i]);
> +               if (ret < 0)
> +                       break;
> +               /* TODO: Support other forms of I2C protocol mangling. */
> +               if (msgs[i].flags & I2C_M_STOP) {
> +                       spin_lock_irqsave(&bus->lock, flags);
> +                       ast_i2c_write(bus, AST_I2CD_M_STOP_CMD,
> +                                     AST_I2C_CMD_REG);
> +                       reinit_completion(&bus->cmd_complete);
> +                       spin_unlock_irqrestore(&bus->lock, flags);
> +
> +                       time_left = wait_for_completion_interruptible_timeout(
> +                                       &bus->cmd_complete,
> +                                       bus->adap.timeout * HZ);
> +                       if (time_left == 0)
> +                               return -ETIMEDOUT;
> +               }
> +       }
> +
> +       spin_lock_irqsave(&bus->lock, flags);
> +       ast_i2c_write(bus, AST_I2CD_M_STOP_CMD, AST_I2C_CMD_REG);
> +       reinit_completion(&bus->cmd_complete);
> +       spin_unlock_irqrestore(&bus->lock, flags);
> +
> +       time_left = wait_for_completion_interruptible_timeout(
> +                       &bus->cmd_complete, bus->adap.timeout * HZ);
> +       if (time_left == 0)
> +               return -ETIMEDOUT;
> +
> +       /* If nothing went wrong, return number of messages transferred. */
> +       if (ret < 0)
> +               return ret;
> +       else
> +               return i;
> +}
> +
> +static u32 ast_i2c_functionality(struct i2c_adapter *adap)
> +{
> +       return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL | I2C_FUNC_SMBUS_BLOCK_DATA;
> +}
> +
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +static int ast_i2c_reg_slave(struct i2c_client *client)
> +{
> +       struct ast_i2c_bus *bus;
> +       unsigned long flags;
> +       u32 addr_reg_val;
> +       u32 func_ctrl_reg_val;
> +
> +       bus = client->adapter->algo_data;
> +       spin_lock_irqsave(&bus->lock, flags);
> +       if (bus->slave) {
> +               spin_unlock_irqrestore(&bus->lock, flags);
> +               return -EINVAL;
> +       }
> +
> +       /* Set slave addr. */
> +       addr_reg_val = ast_i2c_read(bus, AST_I2C_DEV_ADDR_REG);
> +       addr_reg_val &= ~AST_I2CD_DEV_ADDR_MASK;
> +       addr_reg_val |= client->addr & AST_I2CD_DEV_ADDR_MASK;
> +       ast_i2c_write(bus, addr_reg_val, AST_I2C_DEV_ADDR_REG);
> +
> +       /* Switch from master mode to slave mode. */
> +       func_ctrl_reg_val = ast_i2c_read(bus, AST_I2C_FUN_CTRL_REG);
> +       func_ctrl_reg_val &= ~AST_I2CD_MASTER_EN;
> +       func_ctrl_reg_val |= AST_I2CD_SLAVE_EN;
> +       ast_i2c_write(bus, func_ctrl_reg_val, AST_I2C_FUN_CTRL_REG);
> +
> +       bus->slave = client;
> +       bus->slave_state = AST_I2C_SLAVE_STOP;
> +       spin_unlock_irqrestore(&bus->lock, flags);
> +       return 0;
> +}
> +
> +static int ast_i2c_unreg_slave(struct i2c_client *client)
> +{
> +       struct ast_i2c_bus *bus = client->adapter->algo_data;
> +       unsigned long flags;
> +       u32 func_ctrl_reg_val;
> +
> +       spin_lock_irqsave(&bus->lock, flags);
> +       if (!bus->slave) {
> +               spin_unlock_irqrestore(&bus->lock, flags);
> +               return -EINVAL;
> +       }
> +
> +       /* Switch from slave mode to master mode. */
> +       func_ctrl_reg_val = ast_i2c_read(bus, AST_I2C_FUN_CTRL_REG);
> +       func_ctrl_reg_val &= ~AST_I2CD_SLAVE_EN;
> +       func_ctrl_reg_val |= AST_I2CD_MASTER_EN;
> +       ast_i2c_write(bus, func_ctrl_reg_val, AST_I2C_FUN_CTRL_REG);
> +
> +       bus->slave = NULL;
> +       spin_unlock_irqrestore(&bus->lock, flags);
> +       return 0;
> +}
> +#endif
> +
> +static const struct i2c_algorithm ast_i2c_algo = {
> +       .master_xfer    = ast_i2c_master_xfer,
> +       .functionality  = ast_i2c_functionality,
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +       .reg_slave      = ast_i2c_reg_slave,
> +       .unreg_slave    = ast_i2c_unreg_slave,
> +#endif
> +};
> +
> +static u32 ast_i2c_get_clk_reg_val(u32 divider_ratio)
> +{
> +       unsigned int inc = 0, div;
> +       u32 scl_low, scl_high, data;
> +
> +       for (div = 0; divider_ratio >= 16; div++) {
> +               inc |= (divider_ratio & 1);
> +               divider_ratio >>= 1;
> +       }
> +       divider_ratio += inc;
> +       scl_low = (divider_ratio >> 1) - 1;
> +       scl_high = divider_ratio - scl_low - 2;
> +       data = 0x77700300 | (scl_high << 16) | (scl_low << 12) | div;
> +       return data;
> +}
> +
> +static int ast_i2c_init_clk(struct ast_i2c_bus *bus,
> +                           struct platform_device *pdev)
> +{
> +       struct clk *pclk;
> +       u32 clk_freq;
> +       u32 divider_ratio;
> +       int ret;
> +
> +       pclk = devm_clk_get(&pdev->dev, NULL);
> +       if (IS_ERR(pclk)) {
> +               dev_err(&pdev->dev, "clk_get failed\n");
> +               return PTR_ERR(pclk);
> +       }
> +       ret = of_property_read_u32(pdev->dev.of_node,
> +                       "clock-frequency", &clk_freq);
> +       if (ret < 0) {
> +               dev_err(&pdev->dev,
> +                               "Could not read clock-frequency property\n");
> +               clk_freq = 100000;
> +       }
> +       divider_ratio = clk_get_rate(pclk) / clk_freq;
> +       /* We just need the clock rate, we don't actually use the clk object. */
> +       devm_clk_put(&pdev->dev, pclk);
> +
> +       /* Set AC Timing */
> +       if (clk_freq / 1000 > 400) {
> +               ast_i2c_write(bus, ast_i2c_read(bus, AST_I2C_FUN_CTRL_REG) |
> +                               AST_I2CD_M_HIGH_SPEED_EN |
> +                               AST_I2CD_M_SDA_DRIVE_1T_EN |
> +                               AST_I2CD_SDA_DRIVE_1T_EN,
> +                               AST_I2C_FUN_CTRL_REG);
> +
> +               ast_i2c_write(bus, 0x3, AST_I2C_AC_TIMING_REG2);
> +               ast_i2c_write(bus, ast_i2c_get_clk_reg_val(divider_ratio),
> +                             AST_I2C_AC_TIMING_REG1);
> +       } else {
> +               ast_i2c_write(bus, ast_i2c_get_clk_reg_val(divider_ratio),
> +                             AST_I2C_AC_TIMING_REG1);
> +               ast_i2c_write(bus, AST_NO_TIMEOUT_CTRL, AST_I2C_AC_TIMING_REG2);
> +       }
> +
> +       return 0;
> +}
> +
> +static int ast_i2c_probe_bus(struct platform_device *pdev)
> +{
> +       struct ast_i2c_bus *bus;
> +       struct resource *res;
> +       int ret, bus_num;
> +
> +       bus = devm_kzalloc(&pdev->dev, sizeof(*bus), GFP_KERNEL);
> +       if (!bus)
> +               return -ENOMEM;
> +
> +       ret = of_property_read_u32(pdev->dev.of_node, "bus", &bus_num);
> +       if (ret)
> +               return -ENXIO;
> +
> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       bus->base = devm_ioremap_resource(&pdev->dev, res);
> +       if (IS_ERR(bus->base))
> +               return PTR_ERR(bus->base);
> +
> +       bus->irq = platform_get_irq(pdev, 0);
> +       if (bus->irq < 0) {
> +               dev_err(&pdev->dev, "platform_get_irq failed\n");
> +               return -ENXIO;
> +       }
> +
> +       ret = devm_request_irq(&pdev->dev, bus->irq, ast_i2c_bus_irq,
> +                       0, dev_name(&pdev->dev), bus);
> +       if (ret) {
> +               dev_err(&pdev->dev, "devm_request_irq failed\n");
> +               return -ENXIO;
> +       }
> +
> +       /* Initialize the I2C adapter */
> +       spin_lock_init(&bus->lock);
> +       init_completion(&bus->cmd_complete);
> +       bus->adap.nr = bus_num;
> +       bus->adap.owner = THIS_MODULE;
> +       bus->adap.retries = 0;
> +       bus->adap.timeout = 5;
> +       bus->adap.algo = &ast_i2c_algo;
> +       bus->adap.algo_data = bus;
> +       bus->adap.dev.parent = &pdev->dev;
> +       bus->adap.dev.of_node = pdev->dev.of_node;
> +       snprintf(bus->adap.name, sizeof(bus->adap.name), "Aspeed i2c-%d",
> +                       bus_num);
> +
> +       bus->dev = &pdev->dev;
> +
> +       /* reset device: disable master & slave functions */
> +       ast_i2c_write(bus, 0, AST_I2C_FUN_CTRL_REG);
> +
> +       ret = ast_i2c_init_clk(bus, pdev);
> +       if (ret < 0)
> +               return ret;
> +
> +       /* Enable Master Mode */
> +       ast_i2c_write(bus, ast_i2c_read(bus, AST_I2C_FUN_CTRL_REG) |
> +                     AST_I2CD_MASTER_EN |
> +                     AST_I2CD_MULTI_MASTER_DIS, AST_I2C_FUN_CTRL_REG);
> +
> +       /* Set interrupt generation of I2C controller */
> +       ast_i2c_write(bus, AST_I2CD_INTR_SDA_DL_TIMEOUT |
> +                       AST_I2CD_INTR_BUS_RECOVER_DONE |
> +                       AST_I2CD_INTR_SCL_TIMEOUT |
> +                       AST_I2CD_INTR_ABNORMAL |
> +                       AST_I2CD_INTR_NORMAL_STOP |
> +                       AST_I2CD_INTR_ARBIT_LOSS |
> +                       AST_I2CD_INTR_RX_DONE |
> +                       AST_I2CD_INTR_TX_NAK |
> +                       AST_I2CD_INTR_TX_ACK,
> +                       AST_I2C_INTR_CTRL_REG);
> +
> +       ret = i2c_add_numbered_adapter(&bus->adap);
> +       if (ret < 0)
> +               return -ENXIO;
> +
> +       platform_set_drvdata(pdev, bus);
> +
> +       dev_info(bus->dev, "i2c bus %d registered, irq %d\n",
> +                       bus->adap.nr, bus->irq);
> +
> +       return 0;
> +}
> +
> +static int ast_i2c_remove_bus(struct platform_device *pdev)
> +{
> +       struct ast_i2c_bus *bus = platform_get_drvdata(pdev);
> +
> +       i2c_del_adapter(&bus->adap);
> +       return 0;
> +}
> +
> +static const struct of_device_id ast_i2c_bus_of_table[] = {
> +       { .compatible = "aspeed,ast2400-i2c-bus", },
> +       { .compatible = "aspeed,ast2500-i2c-bus", },
> +       { },
> +};
> +MODULE_DEVICE_TABLE(of, ast_i2c_of_table);
> +
> +static struct platform_driver ast_i2c_bus_driver = {
> +       .probe          = ast_i2c_probe_bus,
> +       .remove         = ast_i2c_remove_bus,
> +       .driver         = {
> +               .name   = "ast-i2c-bus",
> +               .of_match_table = ast_i2c_bus_of_table,
> +       },
> +};
> +module_platform_driver(ast_i2c_bus_driver);
> +
> +static void noop(struct irq_data *data) { }
> +
> +static struct irq_chip ast_i2c_irqchip = {
> +       .name           = "ast-i2c",
> +       .irq_unmask     = noop,
> +       .irq_mask       = noop,

Not sure about this. Are we able to leave them as null?

> +};
> +
> +static void ast_i2c_controller_irq(struct irq_desc *desc)
> +{
> +       struct ast_i2c_controller *c = irq_desc_get_handler_data(desc);
> +       unsigned long p, status;
> +       unsigned int bus_irq;
> +
> +       status = readl(c->base);
> +       for_each_set_bit(p, &status, AST_I2C_NUM_BUS) {
> +               bus_irq = irq_find_mapping(c->irq_domain, p);
> +               generic_handle_irq(bus_irq);
> +       }
> +}
> +
> +static int ast_i2c_probe_controller(struct platform_device *pdev)
> +{
> +       struct ast_i2c_controller *controller;
> +       struct device_node *np;
> +       struct resource *res;
> +       int i, irq;
> +
> +       controller = kzalloc(sizeof(*controller), GFP_KERNEL);
> +       if (!controller)
> +               return -ENOMEM;
> +
> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       controller->base = devm_ioremap_resource(&pdev->dev, res);
> +       if (IS_ERR(controller->base))
> +               return PTR_ERR(controller->base);
> +
> +       controller->irq = platform_get_irq(pdev, 0);
> +       if (controller->irq < 0) {
> +               dev_err(&pdev->dev, "no platform IRQ\n");
> +               return -ENXIO;
> +       }
> +
> +       controller->irq_domain = irq_domain_add_linear(pdev->dev.of_node,
> +                       AST_I2C_NUM_BUS, &irq_domain_simple_ops, NULL);
> +       if (!controller->irq_domain) {
> +               dev_err(&pdev->dev, "no IRQ domain\n");
> +               return -ENXIO;
> +       }
> +       controller->irq_domain->name = "ast-i2c-domain";
> +
> +       for (i = 0; i < AST_I2C_NUM_BUS; i++) {

Could we just create the buses that are defined as enabled in the device tree?

> +               irq = irq_create_mapping(controller->irq_domain, i);
> +               irq_set_chip_data(irq, controller);
> +               irq_set_chip_and_handler(irq, &ast_i2c_irqchip,
> +                               handle_simple_irq);
> +       }
> +
> +       irq_set_chained_handler_and_data(controller->irq,
> +                       ast_i2c_controller_irq, controller);
> +
> +       controller->dev = &pdev->dev;
> +
> +       platform_set_drvdata(pdev, controller);
> +
> +       dev_info(controller->dev, "i2c controller registered, irq %d\n",
> +                       controller->irq);
> +
> +       for_each_child_of_node(pdev->dev.of_node, np) {
> +               int ret;
> +               u32 bus_num;
> +               char bus_id[sizeof("i2c-12345")];
> +
> +               /*
> +                * Set a useful name derived from the bus number; the device
> +                * tree should provide us with one that corresponds to the
> +                * hardware numbering.  If the property is missing the
> +                * probe would fail so just skip it here.
> +                */
> +
> +               ret = of_property_read_u32(np, "bus", &bus_num);
> +               if (ret)
> +                       continue;
> +
> +               ret = snprintf(bus_id, sizeof(bus_id), "i2c-%u", bus_num);
> +               if (ret >= sizeof(bus_id))
> +                       continue;
> +
> +               of_platform_device_create(np, bus_id, &pdev->dev);
> +               of_node_put(np);
> +       }
> +
> +       return 0;
> +}
> +
> +static int ast_i2c_remove_controller(struct platform_device *pdev)
> +{
> +       struct ast_i2c_controller *controller = platform_get_drvdata(pdev);
> +
> +       irq_domain_remove(controller->irq_domain);
> +       return 0;
> +}
> +
> +static const struct of_device_id ast_i2c_controller_of_table[] = {
> +       { .compatible = "aspeed,ast2400-i2c-controller", },
> +       { .compatible = "aspeed,ast2500-i2c-controller", },
> +       { },
> +};
> +MODULE_DEVICE_TABLE(of, ast_i2c_of_table);
> +
> +static struct platform_driver ast_i2c_controller_driver = {
> +       .probe          = ast_i2c_probe_controller,
> +       .remove         = ast_i2c_remove_controller,
> +       .driver         = {
> +               .name   = "ast-i2c-controller",
> +               .of_match_table = ast_i2c_controller_of_table,
> +       },
> +};
> +
> +module_platform_driver(ast_i2c_controller_driver);
> +
> +MODULE_AUTHOR("Ryan Chen <ryan_chen@aspeedtech.com>");

Drop this. We've rewritten it since we took Ryan's code from the BSP.

> +MODULE_AUTHOR("Brendan Higgins <brendanhiggins@google.com>");

Not sure about this? Keep it if you feel comfortable answering
questions about the design of the entire driver.

> +MODULE_DESCRIPTION("ASPEED AST I2C Bus Driver");

Aspeed I2C Bus driver?

> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:ast_i2c");

Not sure that we need this.

> --
> 2.8.0.rc3.226.g39d4020
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
