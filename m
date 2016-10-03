Return-Path: <maxims@google.com>
Received: from mail-yw0-x22c.google.com (mail-yw0-x22c.google.com
 [IPv6:2607:f8b0:4002:c05::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3snv8Z29PMzDrL1
 for <openbmc@lists.ozlabs.org>; Tue,  4 Oct 2016 07:41:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=GC3qRYrt; 
 dkim-atps=neutral
Received: by mail-yw0-x22c.google.com with SMTP id t193so36447260ywc.2
 for <openbmc@lists.ozlabs.org>; Mon, 03 Oct 2016 13:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=arYQ+OSKV/zy5YZhW1ycr6pTdSgbHLXK9rbWztmuZcY=;
 b=GC3qRYrthL29qdlR0BWwehZSpmtV62q3YZ3M+5bBVsBY0Kdd3H/sNCscnG3QcHYG9d
 t5m/l32WU/6VjDQdfVFB28cfCM/Vgcyqd/6iYi5wFHDeLqvXaw8jci8FORWM+c00j2P7
 8HPKfEdJagRW9lMV9dUfqGm5rft8qRThxZiQ+zNOt45kJrPhGUuBwMobKqXpg6F8gf88
 WV2mTSMeEHyDtJ1bs7zsDBwFi73lE7EZeiDP/i2ZInu/58ikh+UUkLel4tD3VE8Lse5I
 CoblA1qSRoPNiWfhu88UCAgebMTDkX78CjbvYbIfA8aGvb/eRyfpL6I0hzu2jKiwh4HE
 rw3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=arYQ+OSKV/zy5YZhW1ycr6pTdSgbHLXK9rbWztmuZcY=;
 b=DXjcbrROvrPa37DtO8D16dxQg0UvPfSbjmFX+yEa+6A+Y895uXuhFXPChn+As4JpeT
 xpi6IcSu+82jF14Gz0fX6ZNabfi/88Sk9bKv9qwqO69lG7jdPUXvpt5GF9Mg4nwGkm+C
 cm1Zr34gAp3DU6oou7G5Vs7LST3BBmC/HA3yyBNKDncpvcX32ezIh0b1hREUCQ1rjRBT
 47NMKK7QITZ4AWF82x5d+GTlBEuCBIJcW2OSzqEH6kNVq+jQRxnS2Kz/8N2bdnbx/SfL
 iuPHdjzxf7YAZEkZUdmAnqk9zKw3XJqjDFQOT82Oond4NyB1nfw3gfohHm2/T9RKciQs
 xr/Q==
X-Gm-Message-State: AA6/9RmYQfsbrvqumpd+GG0BeQ9/iCHJW3gOkc5MM+rFyBiCGo0AtFjZoylTMUYg+KAXDkJWPdh/m61PyzEO76jB
X-Received: by 10.13.212.147 with SMTP id w141mr4894292ywd.180.1475527275476; 
 Mon, 03 Oct 2016 13:41:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.38.80 with HTTP; Mon, 3 Oct 2016 13:41:14 -0700 (PDT)
In-Reply-To: <CACPK8XekqQyXVfkY6BoNBXWxZSwDXngtxU_8e4uuEZ-JdDmoRw@mail.gmail.com>
References: <1474306018-101166-1-git-send-email-maxims@google.com>
 <1474998214-12720-1-git-send-email-maxims@google.com>
 <1474998214-12720-3-git-send-email-maxims@google.com>
 <CACPK8XekqQyXVfkY6BoNBXWxZSwDXngtxU_8e4uuEZ-JdDmoRw@mail.gmail.com>
From: Maxim Sloyko <maxims@google.com>
Date: Mon, 3 Oct 2016 13:41:14 -0700
Message-ID: <CAFR_W8r663kSg16-4eNYSHkAYabJyBSMC7o0GGhpTyKS9Zc=Kg@mail.gmail.com>
Subject: Re: [PATCH 3/3] aspeed/g5: I2C driver.
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a114fba1a1d0887053dfbf7d2
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
X-List-Received-Date: Mon, 03 Oct 2016 20:41:20 -0000

--001a114fba1a1d0887053dfbf7d2
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 28, 2016 at 6:27 PM, Joel Stanley <joel@jms.id.au> wrote:

> On Wed, Sep 28, 2016 at 3:13 AM,  <maxims@google.com> wrote:
> > From: Maxim Sloyko <maxims@google.com>
> >
> > The driver is very limited: only single master mode is supported
> > and only byte-by-byte synchronous reads and writes are supported,
> > no Pool Buffers or DMA.
>
> Your subject string mentions g5, but I think this is a generic Aspeed
> i2c driver that will work on the g4 platforms as well.
>

I changed it to say g5/g4, but I haven't actually tested it on ast2400.


>
> > ---
> >  drivers/i2c/Kconfig   |   6 +
> >  drivers/i2c/Makefile  |   1 +
> >  drivers/i2c/ast_i2c.c | 306 ++++++++++++++++++++++++++++++
> ++++++++++++++++++++
> >  drivers/i2c/ast_i2c.h | 155 +++++++++++++++++++++++++
> >  4 files changed, 468 insertions(+)
> >  create mode 100644 drivers/i2c/ast_i2c.c
> >  create mode 100644 drivers/i2c/ast_i2c.h
> >
> > diff --git a/drivers/i2c/Kconfig b/drivers/i2c/Kconfig
> > index 9324c6c..6501e91 100644
> > --- a/drivers/i2c/Kconfig
> > +++ b/drivers/i2c/Kconfig
> > @@ -65,6 +65,12 @@ config SYS_I2C_CADENCE
> >           Say yes here to select Cadence I2C Host Controller. This
> controller is
> >           e.g. used by Xilinx Zynq.
> >
> > +config SYS_I2C_AST
> > +       tristate "Aspeed I2C Controller"
> > +       depends on DM_I2C
> > +       help
> > +         Say yes here to select Aspeed I2C Host Controller.
> > +
> >  config SYS_I2C_INTEL
> >         bool "Intel I2C/SMBUS driver"
> >         depends on DM_I2C
> > diff --git a/drivers/i2c/Makefile b/drivers/i2c/Makefile
> > index 167424d..89e046e 100644
> > --- a/drivers/i2c/Makefile
> > +++ b/drivers/i2c/Makefile
> > @@ -16,6 +16,7 @@ obj-$(CONFIG_PCA9564_I2C) += pca9564_i2c.o
> >  obj-$(CONFIG_TSI108_I2C) += tsi108_i2c.o
> >  obj-$(CONFIG_SH_SH7734_I2C) += sh_sh7734_i2c.o
> >  obj-$(CONFIG_SYS_I2C) += i2c_core.o
> > +obj-$(CONFIG_SYS_I2C_AST) += ast_i2c.o
> >  obj-$(CONFIG_SYS_I2C_CADENCE) += i2c-cdns.o
> >  obj-$(CONFIG_SYS_I2C_DAVINCI) += davinci_i2c.o
> >  obj-$(CONFIG_SYS_I2C_DW) += designware_i2c.o
> > diff --git a/drivers/i2c/ast_i2c.c b/drivers/i2c/ast_i2c.c
> > new file mode 100644
> > index 0000000..c7bc199
> > --- /dev/null
> > +++ b/drivers/i2c/ast_i2c.c
> > @@ -0,0 +1,306 @@
> > +/*
> > + * Copyright (C) 2016 Google, Inc
>
> The driver looks to be copied at least in part from the kernel one.
>

Fixed.


>
> > + *
> > + * SPDX-License-Identifier:    GPL-2.0+
> > + */
> > +
> > +#include <common.h>
> > +#include <dm.h>
> > +#include <fdtdec.h>
> > +#include <i2c.h>
> > +
> > +#include <asm/arch/ast_scu.h>
> > +#include <asm/arch/regs-scu.h>
> > +#include <asm/io.h>
> > +
> > +#include "ast_i2c.h"
> > +
> > +#define I2C_TIMEOUT_US (100000)
> > +#define I2C_SLEEP_STEP (20)
> > +#define EI2C_TIMEOUT (1001)
> > +
> > +DECLARE_GLOBAL_DATA_PTR;
> > +
> > +struct ast_i2c {
> > +       u32 id;
> > +       struct ast_i2c_regs *regs;
> > +       int speed;
> > +};
> > +
> > +#define RETURN_IF_ERROR(expr) do {\
> > +       int err = (expr);\
> > +       if (err < 0) {\
> > +               return err;\
> > +       }\
> > +} while (0)
>
> u-boot upstream does not use macros like this.
>

Fixed.


>
> > +
> > +static u32 __get_clk_reg_val(u32 divider_ratio)
>
> Why the __ prefix? I think you should remove it.
>

Removed.


>
> > +{
> > +       unsigned int inc = 0, div;
> > +       u32 scl_low, scl_high, data;
> > +
> > +       for (div = 0; divider_ratio >= 16; div++) {
> > +               inc |= (divider_ratio & 1);
> > +               divider_ratio >>= 1;
> > +       }
> > +       divider_ratio += inc;
> > +       scl_low = (divider_ratio >> 1) - 1;
> > +       scl_high = divider_ratio - scl_low - 2;
> > +       data = 0x77700300 | (scl_high << 16) | (scl_low << 12) | div;
> > +       return data;
> > +}
> > +
> > +static inline void __ast_i2c_clear_interrupts(struct ast_i2c_regs
> *i2c_base)
>
> Remove the __ prefix.
>
> > +{
> > +       writel(~0, &i2c_base->isr);
> > +}
> > +
> > +static int __ast_i2c_init_bus(struct ast_i2c *i2c_bus)
>
> Remove the __ prefix.
>
> > +{
> > +       /* Reset device */
> > +       writel(0, &i2c_bus->regs->fcr);
> > +       /* Enable Master Mode. Assuming single-master. */
> > +       debug("Enable Master for %p\n", i2c_bus->regs);
> > +       setbits_le32(&i2c_bus->regs->fcr,
> > +                    AST_I2CD_MASTER_EN
> > +                    | AST_I2CD_M_SDA_LOCK_EN
> > +                    | AST_I2CD_MULTI_MASTER_DIS |
> AST_I2CD_M_SCL_DRIVE_EN);
> > +       debug("FCR: %p\n", &i2c_bus->regs->fcr);
> > +       /* Enable Interrupts */
> > +       writel(AST_I2CD_INTR_TX_ACK
> > +              | AST_I2CD_INTR_TX_NAK
> > +              | AST_I2CD_INTR_RX_DONE
> > +              | AST_I2CD_INTR_BUS_RECOVER_DONE
> > +              | AST_I2CD_INTR_NORMAL_STOP
> > +              | AST_I2CD_INTR_ABNORMAL, &i2c_bus->regs->icr);
> > +       return 0;
>
> Change the return type to void if you're not using it.
>

Done.


>
> > +}
> > +
> > +static int ast_i2c_probe(struct udevice *dev)
> > +{
> > +       struct ast_i2c *i2c_bus = dev_get_priv(dev);
> > +
> > +       debug("Enabling I2C%u \n", dev->seq);
> > +       ast_scu_enable_i2c(dev->seq);
> > +
> > +       i2c_bus->id = dev->seq;
> > +       struct ast_i2c_regs *i2c_base =
> > +           (struct ast_i2c_regs *)dev_get_addr(dev);
> > +       i2c_bus->regs = i2c_base;
> > +
> > +       return __ast_i2c_init_bus(i2c_bus);
>
> __ast_i2c_init_bus always returns 0, so this can return void.
>

It's part of driver's API, so has a fixed signature.


>
> > +}
> > +
> > +static inline int __ast_i2c_wait_isr(struct ast_i2c_regs *i2c_base, u32
> flag)
> > +{
> > +       int timeout = I2C_TIMEOUT_US;
> > +       while (!(readl(&i2c_base->isr) & flag) && timeout > 0) {
> > +               udelay(I2C_SLEEP_STEP);
> > +               timeout -= I2C_SLEEP_STEP;
> > +       }
> > +
> > +       __ast_i2c_clear_interrupts(i2c_base);
> > +       if (timeout <= 0)
> > +               return -EI2C_TIMEOUT;
> > +       return 0;
> > +}
> > +
> > +static inline int __ast_i2c_send_stop(struct ast_i2c_regs *i2c_base)
> > +{
> > +       writel(AST_I2CD_M_STOP_CMD, &i2c_base->csr);
> > +       RETURN_IF_ERROR(__ast_i2c_wait_isr
> > +                       (i2c_base, AST_I2CD_INTR_NORMAL_STOP));
> > +       return 0;
> > +}
> > +
> > +static inline int __ast_i2c_wait_tx(struct ast_i2c_regs *i2c_base)
> > +{
> > +       int timeout = I2C_TIMEOUT_US;
> > +       u32 flag = AST_I2CD_INTR_TX_ACK | AST_I2CD_INTR_TX_NAK;
> > +       u32 status = readl(&i2c_base->isr) & flag;
> > +       while (!status && timeout > 0) {
> > +               status = readl(&i2c_base->isr) & flag;
> > +               udelay(I2C_SLEEP_STEP);
> > +               timeout -= I2C_SLEEP_STEP;
> > +       }
> > +
> > +       int ret = 0;
> > +       if (status == AST_I2CD_INTR_TX_NAK) {
> > +               ret = -EREMOTEIO;
> > +       }
> > +
> > +       if (timeout <= 0) {
> > +               ret = -EI2C_TIMEOUT;
> > +       }
> > +
> > +       __ast_i2c_clear_interrupts(i2c_base);
> > +       return ret;
> > +}
> > +
> > +static inline int __ast_i2c_start_txn(struct ast_i2c_regs *i2c_base, u8
> devaddr)
>
> Remove the __ prefix.
>
> What's the "n" mean after tx? Or does txn mean transaction?
>

Yes, this means transaction.


>
> > +{
> > +       /* Start and Send Device Address */
> > +       writel(devaddr, &i2c_base->trbbr);
> > +       writel(AST_I2CD_M_START_CMD | AST_I2CD_M_TX_CMD, &i2c_base->csr);
> > +       RETURN_IF_ERROR(__ast_i2c_wait_tx(i2c_base));
> > +       return 0;
> > +}
> > +
> > +static int __ast_i2c_read_data(struct ast_i2c *i2c_bus, u8 chip, u8
> *buffer,
> > +                              int len)
>
> Remove the __ prefix.
>
> What is chip in this case? I think it's the i2c slave's address. Make
> that clearer please.
>

Main drivers/i2c.h file uses names chip and chip_address for this purpose,
so I just picked one.


>
> len can be a size_t.
>
> > +{
> > +       int i2c_error = 0;
>
> No need to initialise this here.
>
> > +       struct ast_i2c_regs *i2c_base = i2c_bus->regs;
> > +
> > +       i2c_error = __ast_i2c_start_txn(i2c_base, (chip << 1) |
> I2C_M_RD);
>
> Test for the error and return here to make it clear that no further
> processing occurs.
>
> > +
> > +       if (!i2c_error) {
> > +               u32 i2c_cmd = AST_I2CD_M_RX_CMD;
> > +               for (; len > 0; len--, buffer++) {
> > +                       if (len == 1) {
> > +                               i2c_cmd |= AST_I2CD_M_S_RX_CMD_LAST;
> > +                       }
> > +                       writel(i2c_cmd, &i2c_base->csr);
> > +                       RETURN_IF_ERROR(__ast_i2c_wait_isr
> > +                                       (i2c_base,
> AST_I2CD_INTR_RX_DONE));
> > +                       *buffer = AST_I2CD_RX_DATA_BUF_GET(
> readl(&i2c_base->trbbr));
> > +               }
> > +               __ast_i2c_clear_interrupts(i2c_base);
> > +       }
> > +       RETURN_IF_ERROR(__ast_i2c_send_stop(i2c_base));
>
> I don't think your RETURN_IF_ERROR macro does anything for readability
> here. You're going to return regardless, so do:
>
> return __ast_i2c_send_stop(i2c_base);
>
> > +
> > +       return i2c_error;
> > +}
> > +
> > +static int __ast_i2c_write_data(struct ast_i2c *i2c_bus, u8 chip, u8
> *buffer,
> > +                               int len)
>
> Similar comments as for read_data above.
>
> > +{
> > +       int i2c_error = 0;
> > +       struct ast_i2c_regs *i2c_base = i2c_bus->regs;
> > +
> > +       i2c_error = __ast_i2c_start_txn(i2c_base, (chip << 1));
> > +       for (; len > 0 && 0 == i2c_error; len--, buffer++) {
> > +               writel(*buffer, &i2c_base->trbbr);
> > +               writel(AST_I2CD_M_TX_CMD, &i2c_base->csr);
> > +               i2c_error = __ast_i2c_wait_tx(i2c_base);
> > +       }
> > +       RETURN_IF_ERROR(__ast_i2c_send_stop(i2c_base));
> > +       return i2c_error;
> > +}
> > +
> > +static int ast_i2c_deblock(struct udevice *dev)
> > +{
> > +       struct ast_i2c *i2c_bus = dev_get_priv(dev);
> > +       struct ast_i2c_regs *i2c_base = i2c_bus->regs;
> > +
> > +       u32 csr = readl(&i2c_base->csr);
> > +       debug("Bus hung (%x), attempting recovery\n", csr);
> > +
> > +       bool sda_high = csr & AST_I2CD_SDA_LINE_STS;
> > +       bool scl_high = csr & AST_I2CD_SCL_LINE_STS;
> > +       if (sda_high && scl_high) {
> > +               /* Bus is idle, no deblocking needed. */
> > +               return 0;
> > +       } else if (sda_high) {
> > +               /* Send stop command */
> > +               RETURN_IF_ERROR(__ast_i2c_send_stop(i2c_base));
> > +       } else if (scl_high) {
> > +               /* Possibly stuck slave */
> > +               writel(AST_I2CD_BUS_RECOVER_CMD, &i2c_base->csr);
> > +               RETURN_IF_ERROR(__ast_i2c_wait_isr
> > +                               (i2c_base, AST_I2CD_INTR_BUS_RECOVER_
> DONE));
> > +       } else {
> > +               /* Just try to reinit the device. */
> > +               RETURN_IF_ERROR(__ast_i2c_init_bus(i2c_bus));
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +static int ast_i2c_xfer(struct udevice *dev, struct i2c_msg *msg, int
> nmsgs)
> > +{
> > +       struct ast_i2c *i2c_bus = dev_get_priv(dev);
> > +       int ret;
> > +
> > +       debug("i2c_xfer: %d messages\n", nmsgs);
> > +       for (; nmsgs > 0; nmsgs--, msg++) {
> > +               /* TODO: use this for repeated start */
> > +               bool next_is_read = nmsgs > 1 && (msg[1].flags &
> I2C_M_RD);
> > +
> > +               if (msg->flags & I2C_M_RD) {
> > +                       debug("i2c_read: chip=0x%x, len=0x%x,
> flags=0x%x\n",
> > +                             msg->addr, msg->len, msg->flags);
> > +                       ret =
> > +                           __ast_i2c_read_data(i2c_bus, msg->addr,
> msg->buf,
> > +                                               msg->len);
> > +               } else {
> > +                       debug("i2c_write: chip=0x%x, len=0x%x,
> flags=0x%x\n",
> > +                             msg->addr, msg->len, msg->flags);
> > +                       ret =
> > +                           __ast_i2c_write_data(i2c_bus, msg->addr,
> msg->buf,
> > +                                                msg->len);
> > +               }
> > +               if (ret) {
> > +                       debug("%s: error (%d)\n", __func__, ret);
> > +                       return -EREMOTEIO;
> > +               }
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +static int ast_i2c_set_speed(struct udevice *dev, unsigned int speed)
> > +{
> > +       debug("Setting speed ofr I2C%d to <%u>\n", dev->seq, speed);
> > +       if (!speed) {
> > +               debug("No valid speed specified.\n");
> > +               return -EINVAL;
> > +       }
> > +       struct ast_i2c *i2c_bus = dev_get_priv(dev);
> > +
> > +       i2c_bus->speed = speed;
> > +       /* TODO: get this from device tree */
> > +       u32 pclk = ast_get_apbclk();
> > +       u32 divider = pclk / speed;
> > +
> > +       struct ast_i2c_regs *i2c_base = i2c_bus->regs;
> > +       if (speed > 400000) {
> > +               debug("Enabling High Speed\n");
> > +               setbits_le32(&i2c_base->fcr, AST_I2CD_M_HIGH_SPEED_EN
> > +                            | AST_I2CD_M_SDA_DRIVE_1T_EN
> > +                            | AST_I2CD_SDA_DRIVE_1T_EN);
> > +               writel(0x3, &i2c_base->cactcr2);
> > +               writel(__get_clk_reg_val(divider), &i2c_base->cactcr1);
> > +       } else {
> > +               debug("Enabling Normal Speed\n");
> > +               writel(__get_clk_reg_val(divider), &i2c_base->cactcr1);
> > +               writel(AST_NO_TIMEOUT_CTRL, &i2c_base->cactcr2);
> > +       }
> > +
> > +       __ast_i2c_clear_interrupts(i2c_base);
> > +       return 0;
> > +}
> > +
> > +static const struct dm_i2c_ops ast_i2c_ops = {
> > +       .xfer = ast_i2c_xfer,
> > +       .set_bus_speed = ast_i2c_set_speed,
> > +       .deblock = ast_i2c_deblock,
> > +};
> > +
> > +static const struct udevice_id ast_i2c_ids[] = {
> > +       {.compatible = "aspeed,ast2400-i2c-controller",},
> > +       {.compatible = "aspeed,ast2400-i2c-bus",},
>
> Your subject says g5, but your compatible strings say g4.
>
> Your probe function doesn't test for which string you're using. Why do
> you have both -controller and -bus?
>

I think this has something to do with how the device tree is processed, but
it seems that because i2c buses are specified under a single controller
node, if I don't specify compatibility with -controller, it does not match
-bus nodes.


>
> > +       {},
> > +};
> > +
> > +/* Tell GNU Indent to keep this as is: */
> > +/* *INDENT-OFF* */
> > +U_BOOT_DRIVER(i2c_aspeed) = {
> > +       .name = "i2c_aspeed",
> > +       .id = UCLASS_I2C,
> > +       .of_match = ast_i2c_ids,
> > +       .probe = ast_i2c_probe,
> > +       .priv_auto_alloc_size = sizeof(struct ast_i2c),
> > +       .ops = &ast_i2c_ops,
> > +};
> > +/* *INDENT-ON* */
> > diff --git a/drivers/i2c/ast_i2c.h b/drivers/i2c/ast_i2c.h
> > new file mode 100644
> > index 0000000..e221b41
> > --- /dev/null
> > +++ b/drivers/i2c/ast_i2c.h
> > @@ -0,0 +1,155 @@
> > +/*
> > + * Copyright (C) 2016 Google, Inc
> > + *
> > + * SPDX-License-Identifier:    GPL-2.0+
> > + */
> > +#ifndef __AST_I2C_H_
> > +#define __AST_I2C_H_
> > +
> > +struct ast_i2c_regs {
> > +       uint32_t fcr;
> > +       uint32_t cactcr1;
> > +       uint32_t cactcr2;
> > +       uint32_t icr;
> > +       uint32_t isr;
> > +       uint32_t csr;
> > +       uint32_t sdar;
> > +       uint32_t pbcr;
> > +       uint32_t trbbr;
> > +#ifdef CONFIG_TARGET_AST_G5
> > +       uint32_t dma_mbar;
> > +       uint32_t dma_tlr;
> > +#endif
> > +};
> > +
> > +/* Device Register Definition */
> > +/* 0x00 : I2CD Function Control Register  */
> > +#define AST_I2CD_BUFF_SEL_MASK                         (0x7 << 20)
> > +#define AST_I2CD_BUFF_SEL(x)                           (x << 20)
>  // page 0 ~ 7
> > +#define AST_I2CD_M_SDA_LOCK_EN                 (0x1 << 16)
> > +#define AST_I2CD_MULTI_MASTER_DIS                      (0x1 << 15)
> > +#define AST_I2CD_M_SCL_DRIVE_EN                (0x1 << 14)
> > +#define AST_I2CD_MSB_STS                                       (0x1 <<
> 9)
> > +#define AST_I2CD_SDA_DRIVE_1T_EN                       (0x1 << 8)
> > +#define AST_I2CD_M_SDA_DRIVE_1T_EN             (0x1 << 7)
> > +#define AST_I2CD_M_HIGH_SPEED_EN               (0x1 << 6)
> > +#define AST_I2CD_DEF_ADDR_EN                           (0x1 << 5)
> > +#define AST_I2CD_DEF_ALERT_EN                          (0x1 << 4)
> > +#define AST_I2CD_DEF_ARP_EN                                    (0x1 <<
> 3)
> > +#define AST_I2CD_DEF_GCALL_EN                          (0x1 << 2)
> > +#define AST_I2CD_SLAVE_EN                                      (0x1 <<
> 1)
> > +#define AST_I2CD_MASTER_EN                                     (0x1 )
> > +
> > +/* 0x04 : I2CD Clock and AC Timing Control Register #1 */
> > +#define AST_I2CD_tBUF                                          (0x1 <<
> 28)     // 0~7
> > +#define AST_I2CD_tHDSTA
> (0x1 << 24)     // 0~7
> > +#define AST_I2CD_tACST                                         (0x1 <<
> 20)     // 0~7
> > +#define AST_I2CD_tCKHIGH                                       (0x1 <<
> 16)     // 0~7
> > +#define AST_I2CD_tCKLOW
> (0x1 << 12)     // 0~7
> > +#define AST_I2CD_tHDDAT
> (0x1 << 10)     // 0~7
> > +#define AST_I2CD_CLK_TO_BASE_DIV                       (0x1 << 8)
> // 0~3
> > +#define AST_I2CD_CLK_BASE_DIV                          (0x1 )  // 0~0xf
> > +
> > +/* 0x08 : I2CD Clock and AC Timing Control Register #2 */
> > +#define AST_I2CD_tTIMEOUT                                      (0x1 )
> // 0~7
> > +#define AST_NO_TIMEOUT_CTRL                                    0x0
> > +
> > +/* 0x0c : I2CD Interrupt Control Register &
> > + * 0x10 : I2CD Interrupt Status Register
> > + *
> > + * These share bit definitions, so use the same values for the enable &
> > + * status bits.
> > + */
> > +#define AST_I2CD_INTR_SDA_DL_TIMEOUT                   (0x1 << 14)
> > +#define AST_I2CD_INTR_BUS_RECOVER_DONE                 (0x1 << 13)
> > +#define AST_I2CD_INTR_SMBUS_ALERT                      (0x1 << 12)
> > +#define AST_I2CD_INTR_SMBUS_ARP_ADDR                   (0x1 << 11)
> > +#define AST_I2CD_INTR_SMBUS_DEV_ALERT_ADDR             (0x1 << 10)
> > +#define AST_I2CD_INTR_SMBUS_DEF_ADDR                   (0x1 << 9)
> > +#define AST_I2CD_INTR_GCALL_ADDR                       (0x1 << 8)
> > +#define AST_I2CD_INTR_SLAVE_MATCH                      (0x1 << 7)
> > +#define AST_I2CD_INTR_SCL_TIMEOUT                      (0x1 << 6)
> > +#define AST_I2CD_INTR_ABNORMAL                         (0x1 << 5)
> > +#define AST_I2CD_INTR_NORMAL_STOP                      (0x1 << 4)
> > +#define AST_I2CD_INTR_ARBIT_LOSS                       (0x1 << 3)
> > +#define AST_I2CD_INTR_RX_DONE                          (0x1 << 2)
> > +#define AST_I2CD_INTR_TX_NAK                           (0x1 << 1)
> > +#define AST_I2CD_INTR_TX_ACK                           (0x1 << 0)
> > +
> > +/* 0x14 : I2CD Command/Status Register   */
> > +#define AST_I2CD_SDA_OE                                        (0x1 <<
> 28)
> > +#define AST_I2CD_SDA_O                                 (0x1 << 27)
> > +#define AST_I2CD_SCL_OE                                        (0x1 <<
> 26)
> > +#define AST_I2CD_SCL_O                                 (0x1 << 25)
> > +#define AST_I2CD_TX_TIMING                             (0x1 << 24)
>  // 0 ~3
> > +#define AST_I2CD_TX_STATUS                             (0x1 << 23)
> > +
> > +// Tx State Machine
> > +#define AST_I2CD_IDLE                                  0x0
> > +#define AST_I2CD_MACTIVE                               0x8
> > +#define AST_I2CD_MSTART                                        0x9
> > +#define AST_I2CD_MSTARTR                               0xa
> > +#define AST_I2CD_MSTOP                                 0xb
> > +#define AST_I2CD_MTXD                                  0xc
> > +#define AST_I2CD_MRXACK                                        0xd
> > +#define AST_I2CD_MRXD                                  0xe
> > +#define AST_I2CD_MTXACK                                0xf
> > +#define AST_I2CD_SWAIT                                 0x1
> > +#define AST_I2CD_SRXD                                  0x4
> > +#define AST_I2CD_STXACK                                0x5
> > +#define AST_I2CD_STXD                                  0x6
> > +#define AST_I2CD_SRXACK                                0x7
> > +#define AST_I2CD_RECOVER                               0x3
> > +
> > +#define AST_I2CD_SCL_LINE_STS                          (0x1 << 18)
> > +#define AST_I2CD_SDA_LINE_STS                          (0x1 << 17)
> > +#define AST_I2CD_BUS_BUSY_STS                          (0x1 << 16)
> > +#define AST_I2CD_SDA_OE_OUT_DIR                                (0x1 <<
> 15)
> > +#define AST_I2CD_SDA_O_OUT_DIR                         (0x1 << 14)
> > +#define AST_I2CD_SCL_OE_OUT_DIR                                (0x1 <<
> 13)
> > +#define AST_I2CD_SCL_O_OUT_DIR                         (0x1 << 12)
> > +#define AST_I2CD_BUS_RECOVER_CMD                       (0x1 << 11)
> > +#define AST_I2CD_S_ALT_EN                              (0x1 << 10)
> > +// 0 : DMA Buffer, 1: Pool Buffer
> > +//AST1070 DMA register
> > +#define AST_I2CD_RX_DMA_ENABLE                         (0x1 << 9)
> > +#define AST_I2CD_TX_DMA_ENABLE                         (0x1 << 8)
> > +
> > +/* Command Bit */
> > +#define AST_I2CD_RX_BUFF_ENABLE                                (0x1 <<
> 7)
> > +#define AST_I2CD_TX_BUFF_ENABLE                                (0x1 <<
> 6)
> > +#define AST_I2CD_M_STOP_CMD                                    (0x1 <<
> 5)
> > +#define AST_I2CD_M_S_RX_CMD_LAST                       (0x1 << 4)
> > +#define AST_I2CD_M_RX_CMD                                      (0x1 <<
> 3)
> > +#define AST_I2CD_S_TX_CMD                                      (0x1 <<
> 2)
> > +#define AST_I2CD_M_TX_CMD                                      (0x1 <<
> 1)
> > +#define AST_I2CD_M_START_CMD                           (0x1 )
> > +
> > +/* 0x18 : I2CD Slave Device Address Register   */
> > +
> > +/* 0x1C : I2CD Pool Buffer Control Register   */
> > +#define AST_I2CD_RX_BUF_ADDR_GET(x)                            (((x) >>
> 24) & 0xff)
> > +#define AST_I2CD_RX_BUF_END_ADDR_SET(x)                        ((x) <<
> 16)
> > +#define AST_I2CD_TX_DATA_BUF_END_SET(x)                        (((x) &
> 0xff) << 8)
> > +#define AST_I2CD_RX_DATA_BUF_GET(x)                    (((x) >> 8) &
> 0xff)
> > +#define AST_I2CD_BUF_BASE_ADDR_SET(x)                  ((x) & 0x3f)
> > +
> > +/* 0x20 : I2CD Transmit/Receive Byte Buffer Register   */
> > +#define AST_I2CD_GET_MODE(x)                                   (((x) >>
> 8) & 0x1)
> > +
> > +#define AST_I2CD_RX_BYTE_BUFFER
> (0xff << 8)
> > +#define AST_I2CD_TX_BYTE_BUFFER
> (0xff )
> > +
> > +//1. usage flag , 2 size,       3. request address
> > +/* Use platform_data instead of module parameters */
> > +/* Fast Mode = 400 kHz, Standard = 100 kHz */
> > +//static int clock = 100; /* Default: 100 kHz */
> > +
> > +#define AST_I2CD_CMDS  (AST_I2CD_BUS_RECOVER_CMD_EN | \
> > +                        AST_I2CD_M_STOP_CMD | \
> > +                        AST_I2CD_M_S_RX_CMD_LAST | \
> > +                        AST_I2CD_M_RX_CMD | \
> > +                        AST_I2CD_M_TX_CMD | \
> > +                        AST_I2CD_M_START_CMD)
> > +
> > +#endif                         /* _ASPEED_REGS_I2C_H_ */
> > --
> > 2.8.0.rc3.226.g39d4020
> >
> > _______________________________________________
> > openbmc mailing list
> > openbmc@lists.ozlabs.org
> > https://lists.ozlabs.org/listinfo/openbmc
>



-- 
*M*axim *S*loyko

--001a114fba1a1d0887053dfbf7d2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Sep 28, 2016 at 6:27 PM, Joel Stanley <span dir=3D"ltr">&lt;<a =
href=3D"mailto:joel@jms.id.au" target=3D"_blank">joel@jms.id.au</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Wed, Sep 2=
8, 2016 at 3:13 AM,=C2=A0 &lt;<a href=3D"mailto:maxims@google.com">maxims@g=
oogle.com</a>&gt; wrote:<br>
&gt; From: Maxim Sloyko &lt;<a href=3D"mailto:maxims@google.com">maxims@goo=
gle.com</a>&gt;<br>
&gt;<br>
&gt; The driver is very limited: only single master mode is supported<br>
&gt; and only byte-by-byte synchronous reads and writes are supported,<br>
&gt; no Pool Buffers or DMA.<br>
<br>
</span>Your subject string mentions g5, but I think this is a generic Aspee=
d<br>
i2c driver that will work on the g4 platforms as well.<br></blockquote><div=
><br></div><div>I changed it to say g5/g4, but I haven&#39;t actually teste=
d it on ast2400.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div><div class=3D"h5"><br>
&gt; ---<br>
&gt;=C2=A0 drivers/i2c/Kconfig=C2=A0 =C2=A0|=C2=A0 =C2=A06 +<br>
&gt;=C2=A0 drivers/i2c/Makefile=C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 drivers/i2c/ast_i2c.c | 306 ++++++++++++++++++++++++++++++<wbr>+=
+++++++++++++++++++<br>
&gt;=C2=A0 drivers/i2c/ast_i2c.h | 155 +++++++++++++++++++++++++<br>
&gt;=C2=A0 4 files changed, 468 insertions(+)<br>
&gt;=C2=A0 create mode 100644 drivers/i2c/ast_i2c.c<br>
&gt;=C2=A0 create mode 100644 drivers/i2c/ast_i2c.h<br>
&gt;<br>
&gt; diff --git a/drivers/i2c/Kconfig b/drivers/i2c/Kconfig<br>
&gt; index 9324c6c..6501e91 100644<br>
&gt; --- a/drivers/i2c/Kconfig<br>
&gt; +++ b/drivers/i2c/Kconfig<br>
&gt; @@ -65,6 +65,12 @@ config SYS_I2C_CADENCE<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Say yes here to select Cadence=
 I2C Host Controller. This controller is<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0e.g. used by Xilinx Zynq.<br>
&gt;<br>
&gt; +config SYS_I2C_AST<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0tristate &quot;Aspeed I2C Controller&quot;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on DM_I2C<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Say yes here to select Aspeed I2C H=
ost Controller.<br>
&gt; +<br>
&gt;=C2=A0 config SYS_I2C_INTEL<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;Intel I2C/SMBUS driver&quo=
t;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0depends on DM_I2C<br>
&gt; diff --git a/drivers/i2c/Makefile b/drivers/i2c/Makefile<br>
&gt; index 167424d..89e046e 100644<br>
&gt; --- a/drivers/i2c/Makefile<br>
&gt; +++ b/drivers/i2c/Makefile<br>
&gt; @@ -16,6 +16,7 @@ obj-$(CONFIG_PCA9564_I2C) +=3D pca9564_i2c.o<br>
&gt;=C2=A0 obj-$(CONFIG_TSI108_I2C) +=3D tsi108_i2c.o<br>
&gt;=C2=A0 obj-$(CONFIG_SH_SH7734_I2C) +=3D sh_sh7734_i2c.o<br>
&gt;=C2=A0 obj-$(CONFIG_SYS_I2C) +=3D i2c_core.o<br>
&gt; +obj-$(CONFIG_SYS_I2C_AST) +=3D ast_i2c.o<br>
&gt;=C2=A0 obj-$(CONFIG_SYS_I2C_CADENCE) +=3D i2c-cdns.o<br>
&gt;=C2=A0 obj-$(CONFIG_SYS_I2C_DAVINCI) +=3D davinci_i2c.o<br>
&gt;=C2=A0 obj-$(CONFIG_SYS_I2C_DW) +=3D designware_i2c.o<br>
&gt; diff --git a/drivers/i2c/ast_i2c.c b/drivers/i2c/ast_i2c.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000..c7bc199<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/i2c/ast_i2c.c<br>
&gt; @@ -0,0 +1,306 @@<br>
&gt; +/*<br>
&gt; + * Copyright (C) 2016 Google, Inc<br>
<br>
</div></div>The driver looks to be copied at least in part from the kernel =
one.<br></blockquote><div><br></div><div>Fixed.</div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">
<div><div class=3D"h5"><br>
&gt; + *<br>
&gt; + * SPDX-License-Identifier:=C2=A0 =C2=A0 GPL-2.0+<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &lt;common.h&gt;<br>
&gt; +#include &lt;dm.h&gt;<br>
&gt; +#include &lt;fdtdec.h&gt;<br>
&gt; +#include &lt;i2c.h&gt;<br>
&gt; +<br>
&gt; +#include &lt;asm/arch/ast_scu.h&gt;<br>
&gt; +#include &lt;asm/arch/regs-scu.h&gt;<br>
&gt; +#include &lt;asm/io.h&gt;<br>
&gt; +<br>
&gt; +#include &quot;ast_i2c.h&quot;<br>
&gt; +<br>
&gt; +#define I2C_TIMEOUT_US (100000)<br>
&gt; +#define I2C_SLEEP_STEP (20)<br>
&gt; +#define EI2C_TIMEOUT (1001)<br>
&gt; +<br>
&gt; +DECLARE_GLOBAL_DATA_PTR;<br>
&gt; +<br>
&gt; +struct ast_i2c {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 id;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct ast_i2c_regs *regs;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int speed;<br>
&gt; +};<br>
&gt; +<br>
&gt; +#define RETURN_IF_ERROR(expr) do {\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int err =3D (expr);\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (err &lt; 0) {\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return err;\<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}\<br>
&gt; +} while (0)<br>
<br>
</div></div>u-boot upstream does not use macros like this.<br></blockquote>=
<div><br></div><div>Fixed.</div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">
<span class=3D""><br>
&gt; +<br>
&gt; +static u32 __get_clk_reg_val(u32 divider_ratio)<br>
<br>
</span>Why the __ prefix? I think you should remove it.<br></blockquote><di=
v><br></div><div>Removed.</div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">
<span class=3D""><br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int inc =3D 0, div;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 scl_low, scl_high, data;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for (div =3D 0; divider_ratio &gt;=3D 16; =
div++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0inc |=3D (divi=
der_ratio &amp; 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0divider_ratio =
&gt;&gt;=3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0divider_ratio +=3D inc;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0scl_low =3D (divider_ratio &gt;&gt; 1) - 1=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0scl_high =3D divider_ratio - scl_low - 2;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0data =3D 0x77700300 | (scl_high &lt;&lt; 1=
6) | (scl_low &lt;&lt; 12) | div;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return data;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static inline void __ast_i2c_clear_interrupts(<wbr>struct ast_i2c_reg=
s *i2c_base)<br>
<br>
</span>Remove the __ prefix.<br>
<span class=3D""><br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0writel(~0, &amp;i2c_base-&gt;isr);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int __ast_i2c_init_bus(struct ast_i2c *i2c_bus)<br>
<br>
</span>Remove the __ prefix.<br>
<span class=3D""><br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Reset device */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0writel(0, &amp;i2c_bus-&gt;regs-&gt;fcr);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Enable Master Mode. Assuming single-mas=
ter. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0debug(&quot;Enable Master for %p\n&quot;, =
i2c_bus-&gt;regs);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0setbits_le32(&amp;i2c_bus-&gt;regs-&gt;<wb=
r>fcr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 AST_I2CD_MASTER_EN<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 | AST_I2CD_M_SDA_LOCK_EN<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 | AST_I2CD_MULTI_MASTER_DIS | AST_I2CD_M_SCL_DRIVE_EN);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0debug(&quot;FCR: %p\n&quot;, &amp;i2c_bus-=
&gt;regs-&gt;fcr);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Enable Interrupts */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0writel(AST_I2CD_INTR_TX_ACK<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | AST_I2CD_INTR_TX_N=
AK<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | AST_I2CD_INTR_RX_D=
ONE<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | AST_I2CD_INTR_BUS_=
RECOVER_DONE<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | AST_I2CD_INTR_NORM=
AL_STOP<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | AST_I2CD_INTR_ABNO=
RMAL, &amp;i2c_bus-&gt;regs-&gt;icr);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
<br>
</span>Change the return type to void if you&#39;re not using it.<br></bloc=
kquote><div><br></div><div>Done.</div><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">
<span class=3D""><br>
&gt; +}<br>
&gt; +<br>
&gt; +static int ast_i2c_probe(struct udevice *dev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct ast_i2c *i2c_bus =3D dev_get_priv(d=
ev);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0debug(&quot;Enabling I2C%u \n&quot;, dev-&=
gt;seq);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ast_scu_enable_i2c(dev-&gt;seq);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0i2c_bus-&gt;id =3D dev-&gt;seq;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct ast_i2c_regs *i2c_base =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(struct ast_i2c_regs *)dev_g=
et_addr(dev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0i2c_bus-&gt;regs =3D i2c_base;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return __ast_i2c_init_bus(i2c_bus);<br>
<br>
</span>__ast_i2c_init_bus always returns 0, so this can return void.<br></b=
lockquote><div><br></div><div>It&#39;s part of driver&#39;s API, so has a f=
ixed signature.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div><div class=3D"h5"><br>
&gt; +}<br>
&gt; +<br>
&gt; +static inline int __ast_i2c_wait_isr(struct ast_i2c_regs *i2c_base, u=
32 flag)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int timeout =3D I2C_TIMEOUT_US;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0while (!(readl(&amp;i2c_base-&gt;isr) &amp=
; flag) &amp;&amp; timeout &gt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0udelay(I2C_SLE=
EP_STEP);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0timeout -=3D I=
2C_SLEEP_STEP;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0__ast_i2c_clear_interrupts(<wbr>i2c_base);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (timeout &lt;=3D 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EI2C_T=
IMEOUT;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static inline int __ast_i2c_send_stop(struct ast_i2c_regs *i2c_base)<=
br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0writel(AST_I2CD_M_STOP_CMD, &amp;i2c_base-=
&gt;csr);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0RETURN_IF_ERROR(__ast_i2c_<wbr>wait_isr<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0(i2c_base, AST_I2CD_INTR_NORMAL_STOP));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static inline int __ast_i2c_wait_tx(struct ast_i2c_regs *i2c_base)<br=
>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int timeout =3D I2C_TIMEOUT_US;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 flag =3D AST_I2CD_INTR_TX_ACK | AST_I2=
CD_INTR_TX_NAK;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 status =3D readl(&amp;i2c_base-&gt;isr=
) &amp; flag;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0while (!status &amp;&amp; timeout &gt; 0) =
{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D rea=
dl(&amp;i2c_base-&gt;isr) &amp; flag;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0udelay(I2C_SLE=
EP_STEP);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0timeout -=3D I=
2C_SLEEP_STEP;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (status =3D=3D AST_I2CD_INTR_TX_NAK) {<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -EREMO=
TEIO;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (timeout &lt;=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -EI2C_=
TIMEOUT;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0__ast_i2c_clear_interrupts(<wbr>i2c_base);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static inline int __ast_i2c_start_txn(struct ast_i2c_regs *i2c_base, =
u8 devaddr)<br>
<br>
</div></div>Remove the __ prefix.<br>
<br>
What&#39;s the &quot;n&quot; mean after tx? Or does txn mean transaction?<b=
r></blockquote><div><br></div><div>Yes, this means transaction.</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">
<span class=3D""><br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Start and Send Device Address */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0writel(devaddr, &amp;i2c_base-&gt;trbbr);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0writel(AST_I2CD_M_START_CMD | AST_I2CD_M_T=
X_CMD, &amp;i2c_base-&gt;csr);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0RETURN_IF_ERROR(__ast_i2c_<wbr>wait_tx(i2c=
_base));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int __ast_i2c_read_data(struct ast_i2c *i2c_bus, u8 chip, u8 *=
buffer,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int len)<br>
<br>
</span>Remove the __ prefix.<br>
<br>
What is chip in this case? I think it&#39;s the i2c slave&#39;s address. Ma=
ke<br>
that clearer please.<br></blockquote><div><br></div><div>Main drivers/i2c.h=
 file uses names chip and chip_address for this purpose, so I just picked o=
ne.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
len can be a size_t.<br>
<span class=3D""><br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int i2c_error =3D 0;<br>
<br>
</span>No need to initialise this here.<br>
<span class=3D""><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct ast_i2c_regs *i2c_base =3D i2c_bus-=
&gt;regs;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0i2c_error =3D __ast_i2c_start_txn(i2c_base=
, (chip &lt;&lt; 1) | I2C_M_RD);<br>
<br>
</span>Test for the error and return here to make it clear that no further<=
br>
processing occurs.<br>
<span class=3D""><br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!i2c_error) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 i2c_cmd =
=3D AST_I2CD_M_RX_CMD;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (; len &gt=
; 0; len--, buffer++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0if (len =3D=3D 1) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i2c_cmd |=3D AST_I2CD_M_S_RX_CMD_=
LAST;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0writel(i2c_cmd, &amp;i2c_base-&gt;csr);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0RETURN_IF_ERROR(__ast_i2c_<wbr>wait_isr<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(i2c_=
base, AST_I2CD_INTR_RX_DONE));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0*buffer =3D AST_I2CD_RX_DATA_BUF_GET(<wbr>readl(&amp;i2c_base=
-&gt;trbbr));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__ast_i2c_clea=
r_interrupts(<wbr>i2c_base);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0RETURN_IF_ERROR(__ast_i2c_<wbr>send_stop(i=
2c_base));<br>
<br>
</span>I don&#39;t think your RETURN_IF_ERROR macro does anything for reada=
bility<br>
here. You&#39;re going to return regardless, so do:<br>
<br>
return __ast_i2c_send_stop(i2c_base);<br>
<span class=3D""><br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return i2c_error;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int __ast_i2c_write_data(struct ast_i2c *i2c_bus, u8 chip, u8 =
*buffer,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int len)<br>
<br>
</span>Similar comments as for read_data above.<br>
<div><div class=3D"h5"><br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int i2c_error =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct ast_i2c_regs *i2c_base =3D i2c_bus-=
&gt;regs;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0i2c_error =3D __ast_i2c_start_txn(i2c_base=
, (chip &lt;&lt; 1));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for (; len &gt; 0 &amp;&amp; 0 =3D=3D i2c_=
error; len--, buffer++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0writel(*buffer=
, &amp;i2c_base-&gt;trbbr);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0writel(AST_I2C=
D_M_TX_CMD, &amp;i2c_base-&gt;csr);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i2c_error =3D =
__ast_i2c_wait_tx(i2c_base);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0RETURN_IF_ERROR(__ast_i2c_<wbr>send_stop(i=
2c_base));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return i2c_error;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int ast_i2c_deblock(struct udevice *dev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct ast_i2c *i2c_bus =3D dev_get_priv(d=
ev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct ast_i2c_regs *i2c_base =3D i2c_bus-=
&gt;regs;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 csr =3D readl(&amp;i2c_base-&gt;csr);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0debug(&quot;Bus hung (%x), attempting reco=
very\n&quot;, csr);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0bool sda_high =3D csr &amp; AST_I2CD_SDA_L=
INE_STS;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0bool scl_high =3D csr &amp; AST_I2CD_SCL_L=
INE_STS;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (sda_high &amp;&amp; scl_high) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Bus is idle=
, no deblocking needed. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (sda_high) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Send stop c=
ommand */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RETURN_IF_ERRO=
R(__ast_i2c_<wbr>send_stop(i2c_base));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (scl_high) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Possibly st=
uck slave */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0writel(AST_I2C=
D_BUS_RECOVER_<wbr>CMD, &amp;i2c_base-&gt;csr);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RETURN_IF_ERRO=
R(__ast_i2c_<wbr>wait_isr<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(i2c_base, AST_I2CD_INTR_BUS_RECO=
VER_<wbr>DONE));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Just try to=
 reinit the device. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RETURN_IF_ERRO=
R(__ast_i2c_<wbr>init_bus(i2c_bus));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int ast_i2c_xfer(struct udevice *dev, struct i2c_msg *msg, int=
 nmsgs)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct ast_i2c *i2c_bus =3D dev_get_priv(d=
ev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0debug(&quot;i2c_xfer: %d messages\n&quot;,=
 nmsgs);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for (; nmsgs &gt; 0; nmsgs--, msg++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* TODO: use t=
his for repeated start */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool next_is_r=
ead =3D nmsgs &gt; 1 &amp;&amp; (msg[1].flags &amp; I2C_M_RD);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (msg-&gt;fl=
ags &amp; I2C_M_RD) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0debug(&quot;i2c_read: chip=3D0x%x, len=3D0x%x, flags=3D0x%x\n=
&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg-&gt;addr, msg-&gt;len, msg-&gt;flags=
);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0ret =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0__ast_i2c_read_data(i2c_bus, msg-&gt;addr, msg-=
&gt;buf,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0msg-&gt;len);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0debug(&quot;i2c_write: chip=3D0x%x, len=3D0x%x, flags=3D0x%x\=
n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg-&gt;addr, msg-&gt;len, msg-&gt;flags=
);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0ret =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0__ast_i2c_write_data(i2c_bus, msg-&gt;addr, msg=
-&gt;buf,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 msg-&gt;len);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0debug(&quot;%s: error (%d)\n&quot;, __func__, ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0return -EREMOTEIO;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int ast_i2c_set_speed(struct udevice *dev, unsigned int speed)=
<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0debug(&quot;Setting speed ofr I2C%d to &lt=
;%u&gt;\n&quot;, dev-&gt;seq, speed);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!speed) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0debug(&quot;No=
 valid speed specified.\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct ast_i2c *i2c_bus =3D dev_get_priv(d=
ev);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0i2c_bus-&gt;speed =3D speed;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* TODO: get this from device tree */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 pclk =3D ast_get_apbclk();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 divider =3D pclk / speed;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct ast_i2c_regs *i2c_base =3D i2c_bus-=
&gt;regs;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (speed &gt; 400000) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0debug(&quot;En=
abling High Speed\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0setbits_le32(&=
amp;i2c_base-&gt;fcr, AST_I2CD_M_HIGH_SPEED_EN<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | AST_I2CD_M_SDA_DRIVE_1T_EN<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | AST_I2CD_SDA_DRIVE_1T_EN);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0writel(0x3, &a=
mp;i2c_base-&gt;cactcr2);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0writel(__get_c=
lk_reg_val(<wbr>divider), &amp;i2c_base-&gt;cactcr1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0debug(&quot;En=
abling Normal Speed\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0writel(__get_c=
lk_reg_val(<wbr>divider), &amp;i2c_base-&gt;cactcr1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0writel(AST_NO_=
TIMEOUT_CTRL, &amp;i2c_base-&gt;cactcr2);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0__ast_i2c_clear_interrupts(<wbr>i2c_base);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct dm_i2c_ops ast_i2c_ops =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.xfer =3D ast_i2c_xfer,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.set_bus_speed =3D ast_i2c_set_speed,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.deblock =3D ast_i2c_deblock,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static const struct udevice_id ast_i2c_ids[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{.compatible =3D &quot;aspeed,ast2400-i2c-=
<wbr>controller&quot;,},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{.compatible =3D &quot;aspeed,ast2400-i2c-=
bus&quot;,},<br>
<br>
</div></div>Your subject says g5, but your compatible strings say g4.<br>
<br>
Your probe function doesn&#39;t test for which string you&#39;re using. Why=
 do<br>
you have both -controller and -bus?<br></blockquote><div><br></div><div>I t=
hink this has something to do with how the device tree is processed, but it=
 seems that because i2c buses are specified under a single controller node,=
 if I don&#39;t specify compatibility with -controller, it does not match -=
bus nodes.=C2=A0</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div><div class=3D"h5"><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{},<br>
&gt; +};<br>
&gt; +<br>
&gt; +/* Tell GNU Indent to keep this as is: */<br>
&gt; +/* *INDENT-OFF* */<br>
&gt; +U_BOOT_DRIVER(i2c_aspeed) =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;i2c_aspeed&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.id =3D UCLASS_I2C,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.of_match =3D ast_i2c_ids,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.probe =3D ast_i2c_probe,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.priv_auto_alloc_size =3D sizeof(struct as=
t_i2c),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.ops =3D &amp;ast_i2c_ops,<br>
&gt; +};<br>
&gt; +/* *INDENT-ON* */<br>
&gt; diff --git a/drivers/i2c/ast_i2c.h b/drivers/i2c/ast_i2c.h<br>
&gt; new file mode 100644<br>
&gt; index 0000000..e221b41<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/i2c/ast_i2c.h<br>
&gt; @@ -0,0 +1,155 @@<br>
&gt; +/*<br>
&gt; + * Copyright (C) 2016 Google, Inc<br>
&gt; + *<br>
&gt; + * SPDX-License-Identifier:=C2=A0 =C2=A0 GPL-2.0+<br>
&gt; + */<br>
&gt; +#ifndef __AST_I2C_H_<br>
&gt; +#define __AST_I2C_H_<br>
&gt; +<br>
&gt; +struct ast_i2c_regs {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t fcr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t cactcr1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t cactcr2;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t icr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t isr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t csr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t sdar;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t pbcr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t trbbr;<br>
&gt; +#ifdef CONFIG_TARGET_AST_G5<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t dma_mbar;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t dma_tlr;<br>
&gt; +#endif<br>
&gt; +};<br>
&gt; +<br>
&gt; +/* Device Register Definition */<br>
&gt; +/* 0x00 : I2CD Function Control Register=C2=A0 */<br>
&gt; +#define AST_I2CD_BUFF_SEL_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x7 &lt;&lt; 20)<br>
&gt; +#define AST_I2CD_BUFF_SEL(x)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(x &lt;&lt; 20)=C2=
=A0 =C2=A0 =C2=A0 =C2=A0// page 0 ~ 7<br>
&gt; +#define AST_I2CD_M_SDA_LOCK_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0(0x1 &lt;&lt; 16)<br>
&gt; +#define AST_I2CD_MULTI_MASTER_DIS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x1 &lt;&lt; 15)<br>
&gt; +#define AST_I2CD_M_SCL_DRIVE_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 (0x1 &lt;&lt; 14)<br>
&gt; +#define AST_I2CD_MSB_STS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0(0x1 &lt;&lt; 9)<br>
&gt; +#define AST_I2CD_SDA_DRIVE_1T_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x1 &lt;&lt; 8)<br>
&gt; +#define AST_I2CD_M_SDA_DRIVE_1T_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0(0x1 &lt;&lt; 7)<br>
&gt; +#define AST_I2CD_M_HIGH_SPEED_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0(0x1 &lt;&lt; 6)<br>
&gt; +#define AST_I2CD_DEF_ADDR_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x1 &lt;&lt; 5)<br=
>
&gt; +#define AST_I2CD_DEF_ALERT_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x1 &lt;&lt; 4)<br>
&gt; +#define AST_I2CD_DEF_ARP_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (0x1 &lt;&lt; 3)<br>
&gt; +#define AST_I2CD_DEF_GCALL_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x1 &lt;&lt; 2)<br>
&gt; +#define AST_I2CD_SLAVE_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 (0x1 &lt;&lt; 1)<br>
&gt; +#define AST_I2CD_MASTER_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0(0x1 )<br>
&gt; +<br>
&gt; +/* 0x04 : I2CD Clock and AC Timing Control Register #1 */<br>
&gt; +#define AST_I2CD_tBUF=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 (0x1 &lt;&lt; 28)=C2=A0 =C2=A0 =C2=A0// 0~7<br>
&gt; +#define AST_I2CD_tHDSTA=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x1 &lt;&lt; 24)=C2=A0 =
=C2=A0 =C2=A0// 0~7<br>
&gt; +#define AST_I2CD_tACST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0(0x1 &lt;&lt; 20)=C2=A0 =C2=A0 =C2=A0// 0~7<br>
&gt; +#define AST_I2CD_tCKHIGH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0(0x1 &lt;&lt; 16)=C2=A0 =C2=A0 =C2=A0// 0~7<br>
&gt; +#define AST_I2CD_tCKLOW=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x1 &lt;&lt; 12)=C2=A0 =
=C2=A0 =C2=A0// 0~7<br>
&gt; +#define AST_I2CD_tHDDAT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x1 &lt;&lt; 10)=C2=A0 =
=C2=A0 =C2=A0// 0~7<br>
&gt; +#define AST_I2CD_CLK_TO_BASE_DIV=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x1 &lt;&lt; 8)=C2=A0 =C2=
=A0 =C2=A0 // 0~3<br>
&gt; +#define AST_I2CD_CLK_BASE_DIV=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x1 )=C2=A0 // 0~0xf<=
br>
&gt; +<br>
&gt; +/* 0x08 : I2CD Clock and AC Timing Control Register #2 */<br>
&gt; +#define AST_I2CD_tTIMEOUT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 (0x1 )=C2=A0 // 0~7<br>
&gt; +#define AST_NO_TIMEOUT_CTRL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 0x0<br>
&gt; +<br>
&gt; +/* 0x0c : I2CD Interrupt Control Register &amp;<br>
&gt; + * 0x10 : I2CD Interrupt Status Register<br>
&gt; + *<br>
&gt; + * These share bit definitions, so use the same values for the enable=
 &amp;<br>
&gt; + * status bits.<br>
&gt; + */<br>
&gt; +#define AST_I2CD_INTR_SDA_DL_TIMEOUT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x1 &lt;&lt; 14)<br>
&gt; +#define AST_I2CD_INTR_BUS_RECOVER_DONE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x1 &lt;&lt; 13)<br>
&gt; +#define AST_I2CD_INTR_SMBUS_ALERT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x1 &lt;&lt; 12)<br>
&gt; +#define AST_I2CD_INTR_SMBUS_ARP_ADDR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x1 &lt;&lt; 11)<br>
&gt; +#define AST_I2CD_INTR_SMBUS_DEV_ALERT_<wbr>ADDR=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0(0x1 &lt;&lt; 10)<br>
&gt; +#define AST_I2CD_INTR_SMBUS_DEF_ADDR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x1 &lt;&lt; 9)<br>
&gt; +#define AST_I2CD_INTR_GCALL_ADDR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x1 &lt;&lt; 8)<br>
&gt; +#define AST_I2CD_INTR_SLAVE_MATCH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x1 &lt;&lt; 7)<br>
&gt; +#define AST_I2CD_INTR_SCL_TIMEOUT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x1 &lt;&lt; 6)<br>
&gt; +#define AST_I2CD_INTR_ABNORMAL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x1 &lt;&lt; 5)<br>
&gt; +#define AST_I2CD_INTR_NORMAL_STOP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x1 &lt;&lt; 4)<br>
&gt; +#define AST_I2CD_INTR_ARBIT_LOSS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x1 &lt;&lt; 3)<br>
&gt; +#define AST_I2CD_INTR_RX_DONE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x1 &lt;&lt; 2)<br>
&gt; +#define AST_I2CD_INTR_TX_NAK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x1 &lt;&lt; 1)<br=
>
&gt; +#define AST_I2CD_INTR_TX_ACK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x1 &lt;&lt; 0)<br=
>
&gt; +<br>
&gt; +/* 0x14 : I2CD Command/Status Register=C2=A0 =C2=A0*/<br>
&gt; +#define AST_I2CD_SDA_OE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 (0x1 &lt;&lt; 28)<br>
&gt; +#define AST_I2CD_SDA_O=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0=
x1 &lt;&lt; 27)<br>
&gt; +#define AST_I2CD_SCL_OE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 (0x1 &lt;&lt; 26)<br>
&gt; +#define AST_I2CD_SCL_O=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0=
x1 &lt;&lt; 25)<br>
&gt; +#define AST_I2CD_TX_TIMING=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x1 &lt;&lt;=
 24)=C2=A0 =C2=A0 =C2=A0// 0 ~3<br>
&gt; +#define AST_I2CD_TX_STATUS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x1 &lt;&lt;=
 23)<br>
&gt; +<br>
&gt; +// Tx State Machine<br>
&gt; +#define AST_I2CD_IDLE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0<=
br>
&gt; +#define AST_I2CD_MACTIVE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x8<br>
&gt; +#define AST_I2CD_MSTART=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 0x9<br>
&gt; +#define AST_I2CD_MSTARTR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00xa<br>
&gt; +#define AST_I2CD_MSTOP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x=
b<br>
&gt; +#define AST_I2CD_MTXD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0xc<=
br>
&gt; +#define AST_I2CD_MRXACK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 0xd<br>
&gt; +#define AST_I2CD_MRXD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0xe<=
br>
&gt; +#define AST_I2CD_MTXACK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0xf<br>
&gt; +#define AST_I2CD_SWAIT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x=
1<br>
&gt; +#define AST_I2CD_SRXD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x4<=
br>
&gt; +#define AST_I2CD_STXACK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x5<br>
&gt; +#define AST_I2CD_STXD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x6<=
br>
&gt; +#define AST_I2CD_SRXACK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x7<br>
&gt; +#define AST_I2CD_RECOVER=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x3<br>
&gt; +<br>
&gt; +#define AST_I2CD_SCL_LINE_STS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x1 &lt;&lt; 18)<br>
&gt; +#define AST_I2CD_SDA_LINE_STS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x1 &lt;&lt; 17)<br>
&gt; +#define AST_I2CD_BUS_BUSY_STS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x1 &lt;&lt; 16)<br>
&gt; +#define AST_I2CD_SDA_OE_OUT_DIR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (=
0x1 &lt;&lt; 15)<br>
&gt; +#define AST_I2CD_SDA_O_OUT_DIR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x1 &lt;&lt; 14)<br>
&gt; +#define AST_I2CD_SCL_OE_OUT_DIR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (=
0x1 &lt;&lt; 13)<br>
&gt; +#define AST_I2CD_SCL_O_OUT_DIR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x1 &lt;&lt; 12)<br>
&gt; +#define AST_I2CD_BUS_RECOVER_CMD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x1 &lt;&lt; 11)<br>
&gt; +#define AST_I2CD_S_ALT_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x1 &lt;&lt=
; 10)<br>
&gt; +// 0 : DMA Buffer, 1: Pool Buffer<br>
&gt; +//AST1070 DMA register<br>
&gt; +#define AST_I2CD_RX_DMA_ENABLE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x1 &lt;&lt; 9)<br>
&gt; +#define AST_I2CD_TX_DMA_ENABLE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x1 &lt;&lt; 8)<br>
&gt; +<br>
&gt; +/* Command Bit */<br>
&gt; +#define AST_I2CD_RX_BUFF_ENABLE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (=
0x1 &lt;&lt; 7)<br>
&gt; +#define AST_I2CD_TX_BUFF_ENABLE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (=
0x1 &lt;&lt; 6)<br>
&gt; +#define AST_I2CD_M_STOP_CMD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (0x1 &lt;&lt; 5)<br>
&gt; +#define AST_I2CD_M_S_RX_CMD_LAST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x1 &lt;&lt; 4)<br>
&gt; +#define AST_I2CD_M_RX_CMD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 (0x1 &lt;&lt; 3)<br>
&gt; +#define AST_I2CD_S_TX_CMD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 (0x1 &lt;&lt; 2)<br>
&gt; +#define AST_I2CD_M_TX_CMD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 (0x1 &lt;&lt; 1)<br>
&gt; +#define AST_I2CD_M_START_CMD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x1 )<br>
&gt; +<br>
&gt; +/* 0x18 : I2CD Slave Device Address Register=C2=A0 =C2=A0*/<br>
&gt; +<br>
&gt; +/* 0x1C : I2CD Pool Buffer Control Register=C2=A0 =C2=A0*/<br>
&gt; +#define AST_I2CD_RX_BUF_ADDR_GET(x)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (((x) &gt;&=
gt; 24) &amp; 0xff)<br>
&gt; +#define AST_I2CD_RX_BUF_END_ADDR_SET(<wbr>x)=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((x) &lt;&lt; 1=
6)<br>
&gt; +#define AST_I2CD_TX_DATA_BUF_END_SET(<wbr>x)=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (((x) &amp; 0xf=
f) &lt;&lt; 8)<br>
&gt; +#define AST_I2CD_RX_DATA_BUF_GET(x)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (((x) &gt;&gt; 8) &amp; 0xff)<br>
&gt; +#define AST_I2CD_BUF_BASE_ADDR_SET(x)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((x) &amp; 0x3f)<br>
&gt; +<br>
&gt; +/* 0x20 : I2CD Transmit/Receive Byte Buffer Register=C2=A0 =C2=A0*/<b=
r>
&gt; +#define AST_I2CD_GET_MODE(x)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(((x) &gt;&gt; 8) &amp; 0x1)<br>
&gt; +<br>
&gt; +#define AST_I2CD_RX_BYTE_BUFFER=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 (0xff &lt;&lt; 8)<br>
&gt; +#define AST_I2CD_TX_BYTE_BUFFER=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 (0xff )<br>
&gt; +<br>
&gt; +//1. usage flag , 2 size,=C2=A0 =C2=A0 =C2=A0 =C2=A03. request addres=
s<br>
&gt; +/* Use platform_data instead of module parameters */<br>
&gt; +/* Fast Mode =3D 400 kHz, Standard =3D 100 kHz */<br>
&gt; +//static int clock =3D 100; /* Default: 100 kHz */<br>
&gt; +<br>
&gt; +#define AST_I2CD_CMDS=C2=A0 (AST_I2CD_BUS_RECOVER_CMD_EN | \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 AST_I2CD_M_STOP_CMD | \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 AST_I2CD_M_S_RX_CMD_LAST | \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 AST_I2CD_M_RX_CMD | \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 AST_I2CD_M_TX_CMD | \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 AST_I2CD_M_START_CMD)<br>
&gt; +<br>
&gt; +#endif=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0/* _ASPEED_REGS_I2C_H_ */<br>
&gt; --<br>
&gt; 2.8.0.rc3.226.g39d4020<br>
&gt;<br>
</div></div>&gt; ______________________________<wbr>_________________<br>
&gt; openbmc mailing list<br>
&gt; <a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</=
a><br>
&gt; <a href=3D"https://lists.ozlabs.org/listinfo/openbmc" rel=3D"noreferre=
r" target=3D"_blank">https://lists.ozlabs.org/<wbr>listinfo/openbmc</a><br>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div><b>M</b>axim <=
b>S</b>loyko</div></div>
</div></div>

--001a114fba1a1d0887053dfbf7d2--
