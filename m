Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x244.google.com (mail-yw0-x244.google.com
 [IPv6:2607:f8b0:4002:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xH1CP1gpGzDqn2
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jul 2017 00:41:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="jyBKLAGi"; 
 dkim-atps=neutral
Received: by mail-yw0-x244.google.com with SMTP id i6so3788406ywb.3
 for <openbmc@lists.ozlabs.org>; Tue, 25 Jul 2017 07:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to; bh=fyjoPyS0C02YK0QIvTXnbNzj0jxFEGG6l7sptw0+XlI=;
 b=jyBKLAGiMtbODYQmyq97JRnDkawlKnzb9kD+kc2kk5OsrPjvJk6NfofTcg9vzIvHzY
 RkXhQeShQNPOvA4RN3Itoop75t3U0aKvYdViNtyHqir5grX+BRau3AvmRs/QGqPcvH6P
 wDTIBOgDoLurh8aSlKYr8AJjIG6e3sLAcC/rVJsvQzdEY5OXhLsyy8GM7x4PH4u98ID4
 9ipYrRvyAnYO1FEp5NwOL3bsNQqWR5iN/+MuQvuCWChVHG5JWXM1R5Gt+s4q9vbh45g9
 XxmuL19bpGS8jTO66V6wE1CfW6xu2qLlZcnfBfmKsWa3Oj2lXLWng7+K+BV+URt7gVSD
 4CZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to;
 bh=fyjoPyS0C02YK0QIvTXnbNzj0jxFEGG6l7sptw0+XlI=;
 b=YuKraDCD+IdkZAN6H90izCr2Bj/pxbU+pNfufK6y7CVPxy3spqDvY5uhRjpKNy73kn
 d27kD+kf0louTjh3Quapd3/PSM3BqzwE6iNaUfH4g+rg97GqUk9xYSTI0MLxCUPqtmi0
 V75x4V6OUZB8wrgyC/fivDGHfDXQ/iqlr/a2CEB+PhHdLnl5d+At1kGgkS+dkBdf+Y5G
 1x0RMnBI8sL/RiCuBoUhV3XBpG3OsuWXTRSx4wbMrqPIQnpjkhw46FThQwCCsspwMWh6
 0omxKfEr3bLo68KWnEP8raj7gNvh0yU382hyk783KBdsucrBjGeYjhn602LUBzIDlFBs
 XvIw==
X-Gm-Message-State: AIVw111Q5+yGlHxaKVQ1XcLgafulT4C1yo50jQpLO7TyN7rwhwFjn8/8
 570GQfyJBVnEe2c5aMtT/kqkVxHf5EMJ3Z8=
X-Received: by 10.129.211.12 with SMTP id y12mr2767357ywi.220.1500993694210;
 Tue, 25 Jul 2017 07:41:34 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.177 with HTTP; Tue, 25 Jul 2017 07:41:13 -0700 (PDT)
In-Reply-To: <20170725065407.30880-1-joel@jms.id.au>
References: <20170725065407.30880-1-joel@jms.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 26 Jul 2017 00:11:13 +0930
X-Google-Sender-Auth: 9BhTxx8oMzSYgXdTPahaT-Gas18
Message-ID: <CACPK8Xdin4aA=1PchvyYtg3xFN9vtnoJWQNDqGG5unS77RTWNg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] i2c: aspeed: Reset to upstream version
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Milton Miller II <miltonm@us.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Tue, 25 Jul 2017 14:41:38 -0000

On Tue, Jul 25, 2017 at 4:24 PM, Joel Stanley <joel@jms.id.au> wrote:
> This sets the i2c device driver to the same state as the one that was
> included in the 4.13 merge window.
>
> By doing this we get fixes that happened in the latter stages of upstream
> review.

Milton suggested I add the SHA. I will add this summary to the commit message:

--
This is as of 4.13-rc1. There were three commits that added the code:

$ git log --oneline --no-merges   drivers/i2c/busses/i2c-aspeed.c
drivers/irqchip/irq-aspeed-i2c-ic.c
f9eb91350bb2 i2c: aspeed: added slave support for Aspeed I2C driver
f327c686d3ba i2c: aspeed: added driver for Aspeed I2C
f48e699ddf70 irqchip/aspeed-i2c-ic: Add I2C IRQ controller for Aspeed

So this state is current as of f9eb91350bb2.
--

I sent this for review expecting someone to suggest I revert and
cherry pick to make it explicit what we have in the tree. If anyone
feels strongly we can do that :)

Cheers,

Joel

>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> Instead of doing the revert and then cherry pick, this sets the tree to the
> same state as the upstream driver.
>
>  drivers/i2c/busses/i2c-aspeed.c     | 233 ++++++++++++++++++------------------
>  drivers/irqchip/irq-aspeed-i2c-ic.c |  31 +++--
>  2 files changed, 139 insertions(+), 125 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index ee1f546fec05..f19348328a71 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -78,11 +78,6 @@
>  #define ASPEED_I2CD_INTR_RX_DONE                       BIT(2)
>  #define ASPEED_I2CD_INTR_TX_NAK                                BIT(1)
>  #define ASPEED_I2CD_INTR_TX_ACK                                BIT(0)
> -#define ASPEED_I2CD_INTR_ERROR                                                \
> -               (ASPEED_I2CD_INTR_ARBIT_LOSS |                                 \
> -                ASPEED_I2CD_INTR_ABNORMAL |                                   \
> -                ASPEED_I2CD_INTR_SCL_TIMEOUT |                                \
> -                ASPEED_I2CD_INTR_SDA_DL_TIMEOUT)
>  #define ASPEED_I2CD_INTR_ALL                                                  \
>                 (ASPEED_I2CD_INTR_SDA_DL_TIMEOUT |                             \
>                  ASPEED_I2CD_INTR_BUS_RECOVER_DONE |                           \
> @@ -137,7 +132,8 @@ struct aspeed_i2c_bus {
>         /* Synchronizes I/O mem access to base. */
>         spinlock_t                      lock;
>         struct completion               cmd_complete;
> -       int                             irq;
> +       unsigned long                   parent_clk_frequency;
> +       u32                             bus_frequency;
>         /* Transaction state. */
>         enum aspeed_i2c_master_state    master_state;
>         struct i2c_msg                  *msgs;
> @@ -146,6 +142,8 @@ struct aspeed_i2c_bus {
>         size_t                          msgs_count;
>         bool                            send_stop;
>         int                             cmd_err;
> +       /* Protected only by i2c_lock_bus */
> +       int                             master_xfer_result;
>  #if IS_ENABLED(CONFIG_I2C_SLAVE)
>         struct i2c_client               *slave;
>         enum aspeed_i2c_slave_state     slave_state;
> @@ -167,7 +165,7 @@ static int aspeed_i2c_recover_bus(struct aspeed_i2c_bus *bus)
>                 /* Bus is idle: no recovery needed. */
>                 if (command & ASPEED_I2CD_SCL_LINE_STS)
>                         goto out;
> -               dev_dbg(bus->dev, "bus hung (state %x), attempting recovery\n",
> +               dev_dbg(bus->dev, "SCL hung (state %x), attempting recovery\n",
>                         command);
>
>                 reinit_completion(&bus->cmd_complete);
> @@ -185,13 +183,14 @@ static int aspeed_i2c_recover_bus(struct aspeed_i2c_bus *bus)
>                 /* Recovery failed. */
>                 else if (!(readl(bus->base + ASPEED_I2C_CMD_REG) &
>                            ASPEED_I2CD_SCL_LINE_STS))
> -                       ret = -EIO;
> +                       goto reset_out;
>         /* Bus error. */
>         } else {
> -               dev_dbg(bus->dev, "bus hung (state %x), attempting recovery\n",
> +               dev_dbg(bus->dev, "SDA hung (state %x), attempting recovery\n",
>                         command);
>
>                 reinit_completion(&bus->cmd_complete);
> +               /* Writes 1 to 8 SCL clock cycles until SDA is released. */
>                 writel(ASPEED_I2CD_BUS_RECOVER_CMD,
>                        bus->base + ASPEED_I2C_CMD_REG);
>                 spin_unlock_irqrestore(&bus->lock, flags);
> @@ -207,7 +206,7 @@ static int aspeed_i2c_recover_bus(struct aspeed_i2c_bus *bus)
>                 /* Recovery failed. */
>                 else if (!(readl(bus->base + ASPEED_I2C_CMD_REG) &
>                            ASPEED_I2CD_SDA_LINE_STS))
> -                       ret = -EIO;
> +                       goto reset_out;
>         }
>
>  out:
> @@ -325,7 +324,8 @@ static bool aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus)
>  }
>  #endif /* CONFIG_I2C_SLAVE */
>
> -static void __aspeed_i2c_do_start(struct aspeed_i2c_bus *bus)
> +/* precondition: bus.lock has been acquired. */
> +static void aspeed_i2c_do_start(struct aspeed_i2c_bus *bus)
>  {
>         u32 command = ASPEED_I2CD_M_START_CMD | ASPEED_I2CD_M_TX_CMD;
>         struct i2c_msg *msg = &bus->msgs[bus->msgs_index];
> @@ -346,30 +346,47 @@ static void __aspeed_i2c_do_start(struct aspeed_i2c_bus *bus)
>         writel(command, bus->base + ASPEED_I2C_CMD_REG);
>  }
>
> -static void __aspeed_i2c_do_stop(struct aspeed_i2c_bus *bus)
> +/* precondition: bus.lock has been acquired. */
> +static void aspeed_i2c_do_stop(struct aspeed_i2c_bus *bus)
>  {
>         bus->master_state = ASPEED_I2C_MASTER_STOP;
>         writel(ASPEED_I2CD_M_STOP_CMD, bus->base + ASPEED_I2C_CMD_REG);
>  }
>
> -static void __aspeed_i2c_next_msg_or_stop(struct aspeed_i2c_bus *bus)
> +/* precondition: bus.lock has been acquired. */
> +static void aspeed_i2c_next_msg_or_stop(struct aspeed_i2c_bus *bus)
>  {
>         if (bus->msgs_index + 1 < bus->msgs_count) {
>                 bus->msgs_index++;
> -               __aspeed_i2c_do_start(bus);
> +               aspeed_i2c_do_start(bus);
>         } else {
> -               __aspeed_i2c_do_stop(bus);
> +               aspeed_i2c_do_stop(bus);
>         }
>  }
>
> +static int aspeed_i2c_is_irq_error(u32 irq_status)
> +{
> +       if (irq_status & ASPEED_I2CD_INTR_ARBIT_LOSS)
> +               return -EAGAIN;
> +       if (irq_status & (ASPEED_I2CD_INTR_SDA_DL_TIMEOUT |
> +                         ASPEED_I2CD_INTR_SCL_TIMEOUT))
> +               return -EBUSY;
> +       if (irq_status & (ASPEED_I2CD_INTR_ABNORMAL))
> +               return -EPROTO;
> +
> +       return 0;
> +}
> +
>  static bool aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus)
>  {
>         u32 irq_status, status_ack = 0, command = 0;
>         struct i2c_msg *msg;
>         u8 recv_byte;
> +       int ret;
>
>         spin_lock(&bus->lock);
>         irq_status = readl(bus->base + ASPEED_I2C_INTR_STS_REG);
> +       /* Ack all interrupt bits. */
>         writel(irq_status, bus->base + ASPEED_I2C_INTR_STS_REG);
>
>         if (irq_status & ASPEED_I2CD_INTR_BUS_RECOVER_DONE) {
> @@ -379,15 +396,24 @@ static bool aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus)
>         }
>
>         /*
> -        * Either we encountered an interrupt that reports an error, or we are
> -        * in an invalid state.
> +        * We encountered an interrupt that reports an error: the hardware
> +        * should clear the command queue effectively taking us back to the
> +        * INACTIVE state.
>          */
> -       if (irq_status & ASPEED_I2CD_INTR_ERROR ||
> -           (!bus->msgs && bus->master_state != ASPEED_I2C_MASTER_STOP)) {
> +       ret = aspeed_i2c_is_irq_error(irq_status);
> +       if (ret < 0) {
>                 dev_dbg(bus->dev, "received error interrupt: 0x%08x",
>                         irq_status);
> +               bus->cmd_err = ret;
> +               bus->master_state = ASPEED_I2C_MASTER_INACTIVE;
> +               goto out_complete;
> +       }
> +
> +       /* We are in an invalid state; reset bus to a known state. */
> +       if (!bus->msgs && bus->master_state != ASPEED_I2C_MASTER_STOP) {
> +               dev_err(bus->dev, "bus in unknown state");
>                 bus->cmd_err = -EIO;
> -               __aspeed_i2c_do_stop(bus);
> +               aspeed_i2c_do_stop(bus);
>                 goto out_no_complete;
>         }
>         msg = &bus->msgs[bus->msgs_index];
> @@ -399,12 +425,17 @@ static bool aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus)
>          */
>         if (bus->master_state == ASPEED_I2C_MASTER_START) {
>                 if (unlikely(!(irq_status & ASPEED_I2CD_INTR_TX_ACK))) {
> -                       dev_dbg(bus->dev,
> -                               "no slave present at %02x", msg->addr);
> +                       pr_devel("no slave present at %02x", msg->addr);
>                         status_ack |= ASPEED_I2CD_INTR_TX_NAK;
> -                       goto error_and_stop;
> +                       bus->cmd_err = -ENXIO;
> +                       aspeed_i2c_do_stop(bus);
> +                       goto out_no_complete;
>                 }
>                 status_ack |= ASPEED_I2CD_INTR_TX_ACK;
> +               if (msg->len == 0) { /* SMBUS_QUICK */
> +                       aspeed_i2c_do_stop(bus);
> +                       goto out_no_complete;
> +               }
>                 if (msg->flags & I2C_M_RD)
>                         bus->master_state = ASPEED_I2C_MASTER_RX_FIRST;
>                 else
> @@ -431,7 +462,7 @@ static bool aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus)
>                         writel(ASPEED_I2CD_M_TX_CMD,
>                                bus->base + ASPEED_I2C_CMD_REG);
>                 } else {
> -                       __aspeed_i2c_next_msg_or_stop(bus);
> +                       aspeed_i2c_next_msg_or_stop(bus);
>                 }
>                 goto out_no_complete;
>         case ASPEED_I2C_MASTER_RX_FIRST:
> @@ -452,7 +483,7 @@ static bool aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus)
>                 if (msg->flags & I2C_M_RECV_LEN) {
>                         if (unlikely(recv_byte > I2C_SMBUS_BLOCK_MAX)) {
>                                 bus->cmd_err = -EPROTO;
> -                               __aspeed_i2c_do_stop(bus);
> +                               aspeed_i2c_do_stop(bus);
>                                 goto out_no_complete;
>                         }
>                         msg->len = recv_byte +
> @@ -467,7 +498,7 @@ static bool aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus)
>                                 command |= ASPEED_I2CD_M_S_RX_CMD_LAST;
>                         writel(command, bus->base + ASPEED_I2C_CMD_REG);
>                 } else {
> -                       __aspeed_i2c_next_msg_or_stop(bus);
> +                       aspeed_i2c_next_msg_or_stop(bus);
>                 }
>                 goto out_no_complete;
>         case ASPEED_I2C_MASTER_STOP:
> @@ -491,14 +522,19 @@ static bool aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus)
>         default:
>                 WARN(1, "unknown master state\n");
>                 bus->master_state = ASPEED_I2C_MASTER_INACTIVE;
> -               bus->cmd_err = -EIO;
> +               bus->cmd_err = -EINVAL;
>                 goto out_complete;
>         }
>  error_and_stop:
>         bus->cmd_err = -EIO;
> -       __aspeed_i2c_do_stop(bus);
> +       aspeed_i2c_do_stop(bus);
>         goto out_no_complete;
>  out_complete:
> +       bus->msgs = NULL;
> +       if (bus->cmd_err)
> +               bus->master_xfer_result = bus->cmd_err;
> +       else
> +               bus->master_xfer_result = bus->msgs_index + 1;
>         complete(&bus->cmd_complete);
>  out_no_complete:
>         if (irq_status != status_ack)
> @@ -520,16 +556,13 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
>         }
>  #endif /* CONFIG_I2C_SLAVE */
>
> -       if (aspeed_i2c_master_irq(bus))
> -               return IRQ_HANDLED;
> -       else
> -               return IRQ_NONE;
> +       return aspeed_i2c_master_irq(bus) ? IRQ_HANDLED : IRQ_NONE;
>  }
>
>  static int aspeed_i2c_master_xfer(struct i2c_adapter *adap,
>                                   struct i2c_msg *msgs, int num)
>  {
> -       struct aspeed_i2c_bus *bus = adap->algo_data;
> +       struct aspeed_i2c_bus *bus = i2c_get_adapdata(adap);
>         unsigned long time_left, flags;
>         int ret = 0;
>
> @@ -547,30 +580,22 @@ static int aspeed_i2c_master_xfer(struct i2c_adapter *adap,
>                 spin_lock_irqsave(&bus->lock, flags);
>         }
>
> +       bus->cmd_err = 0;
>         bus->msgs = msgs;
>         bus->msgs_index = 0;
>         bus->msgs_count = num;
>
>         reinit_completion(&bus->cmd_complete);
> -       __aspeed_i2c_do_start(bus);
> +       aspeed_i2c_do_start(bus);
>         spin_unlock_irqrestore(&bus->lock, flags);
>
>         time_left = wait_for_completion_timeout(&bus->cmd_complete,
>                                                 bus->adap.timeout);
>
> -       spin_lock_irqsave(&bus->lock, flags);
> -       bus->msgs = NULL;
>         if (time_left == 0)
> -               ret = -ETIMEDOUT;
> -       else
> -               ret = bus->cmd_err;
> -       spin_unlock_irqrestore(&bus->lock, flags);
> -
> -       /* If nothing went wrong, return number of messages transferred. */
> -       if (ret >= 0)
> -               return bus->msgs_index + 1;
> +               return -ETIMEDOUT;
>         else
> -               return ret;
> +               return bus->master_xfer_result;
>  }
>
>  static u32 aspeed_i2c_functionality(struct i2c_adapter *adap)
> @@ -579,6 +604,7 @@ static u32 aspeed_i2c_functionality(struct i2c_adapter *adap)
>  }
>
>  #if IS_ENABLED(CONFIG_I2C_SLAVE)
> +/* precondition: bus.lock has been acquired. */
>  static void __aspeed_i2c_reg_slave(struct aspeed_i2c_bus *bus, u16 slave_addr)
>  {
>         u32 addr_reg_val, func_ctrl_reg_val;
> @@ -597,10 +623,9 @@ static void __aspeed_i2c_reg_slave(struct aspeed_i2c_bus *bus, u16 slave_addr)
>
>  static int aspeed_i2c_reg_slave(struct i2c_client *client)
>  {
> -       struct aspeed_i2c_bus *bus;
> +       struct aspeed_i2c_bus *bus = i2c_get_adapdata(client->adapter);
>         unsigned long flags;
>
> -       bus = client->adapter->algo_data;
>         spin_lock_irqsave(&bus->lock, flags);
>         if (bus->slave) {
>                 spin_unlock_irqrestore(&bus->lock, flags);
> @@ -618,7 +643,7 @@ static int aspeed_i2c_reg_slave(struct i2c_client *client)
>
>  static int aspeed_i2c_unreg_slave(struct i2c_client *client)
>  {
> -       struct aspeed_i2c_bus *bus = client->adapter->algo_data;
> +       struct aspeed_i2c_bus *bus = i2c_get_adapdata(client->adapter);
>         u32 func_ctrl_reg_val;
>         unsigned long flags;
>
> @@ -687,71 +712,38 @@ static u32 aspeed_i2c_get_clk_reg_val(u32 divisor)
>                         | (base_clk & ASPEED_I2CD_TIME_BASE_DIVISOR_MASK);
>  }
>
> -static int __aspeed_i2c_init_clk(struct aspeed_i2c_bus *bus,
> -                                struct platform_device *pdev)
> +/* precondition: bus.lock has been acquired. */
> +static int aspeed_i2c_init_clk(struct aspeed_i2c_bus *bus)
>  {
> -       u32 clk_freq, divisor, clk_reg_val;
> -       struct clk *pclk;
> -       int ret;
> -
> -       pclk = devm_clk_get(&pdev->dev, NULL);
> -       if (IS_ERR(pclk)) {
> -               dev_err(&pdev->dev, "clk_get failed\n");
> -               return PTR_ERR(pclk);
> -       }
> -       ret = of_property_read_u32(pdev->dev.of_node,
> -                                  "bus-frequency", &clk_freq);
> -       if (ret < 0) {
> -               dev_err(&pdev->dev,
> -                       "Could not read bus-frequency property\n");
> -               clk_freq = 100000;
> -       }
> -       divisor = clk_get_rate(pclk) / clk_freq;
> -       /* We just need the clock rate, we don't actually use the clk object. */
> -       devm_clk_put(&pdev->dev, pclk);
> +       u32 divisor, clk_reg_val;
>
> +       divisor = bus->parent_clk_frequency / bus->bus_frequency;
>         clk_reg_val = aspeed_i2c_get_clk_reg_val(divisor);
>         writel(clk_reg_val, bus->base + ASPEED_I2C_AC_TIMING_REG1);
> -
> -       /*
> -        * If the base divisor is non-zero then we do not want to enable high
> -        * speed mode, otherwise we might as well enable it.
> -        * For reference, setting high speed mode will make the base divisor
> -        * zero and corresponds to a minimum SCL frequency of about 1.5MHz.
> -        */
> -       if (clk_reg_val & ASPEED_I2CD_TIME_BASE_DIVISOR_MASK) {
> -               writel(ASPEED_NO_TIMEOUT_CTRL,
> -                      bus->base + ASPEED_I2C_AC_TIMING_REG2);
> -       } else {
> -               writel(readl(bus->base + ASPEED_I2C_FUN_CTRL_REG) |
> -                      ASPEED_I2CD_M_HIGH_SPEED_EN |
> -                      ASPEED_I2CD_M_SDA_DRIVE_1T_EN |
> -                      ASPEED_I2CD_SDA_DRIVE_1T_EN,
> -                      bus->base + ASPEED_I2C_FUN_CTRL_REG);
> -
> -               writel(0x3, bus->base + ASPEED_I2C_AC_TIMING_REG2);
> -       }
> +       writel(ASPEED_NO_TIMEOUT_CTRL, bus->base + ASPEED_I2C_AC_TIMING_REG2);
>
>         return 0;
>  }
>
> -static int __aspeed_i2c_init(struct aspeed_i2c_bus *bus,
> +/* precondition: bus.lock has been acquired. */
> +static int aspeed_i2c_init(struct aspeed_i2c_bus *bus,
>                              struct platform_device *pdev)
>  {
> +       u32 fun_ctrl_reg = ASPEED_I2CD_MASTER_EN;
>         int ret;
>
>         /* Disable everything. */
>         writel(0, bus->base + ASPEED_I2C_FUN_CTRL_REG);
>
> -       ret = __aspeed_i2c_init_clk(bus, pdev);
> +       ret = aspeed_i2c_init_clk(bus);
>         if (ret < 0)
>                 return ret;
>
> +       if (!of_property_read_bool(pdev->dev.of_node, "multi-master"))
> +               fun_ctrl_reg |= ASPEED_I2CD_MULTI_MASTER_DIS;
> +
>         /* Enable Master Mode */
> -       writel(readl(bus->base + ASPEED_I2C_FUN_CTRL_REG) |
> -              ASPEED_I2CD_MASTER_EN |
> -              /* TODO: provide device tree option for multi-master mode. */
> -              ASPEED_I2CD_MULTI_MASTER_DIS,
> +       writel(readl(bus->base + ASPEED_I2C_FUN_CTRL_REG) | fun_ctrl_reg,
>                bus->base + ASPEED_I2C_FUN_CTRL_REG);
>
>  #if IS_ENABLED(CONFIG_I2C_SLAVE)
> @@ -774,20 +766,11 @@ static int aspeed_i2c_reset(struct aspeed_i2c_bus *bus)
>
>         spin_lock_irqsave(&bus->lock, flags);
>
> -       /* Disable and quiesce interrupts. */
> -       reinit_completion(&bus->cmd_complete);
> +       /* Disable and ack all interrupts. */
>         writel(0, bus->base + ASPEED_I2C_INTR_CTRL_REG);
> +       writel(0xffffffff, bus->base + ASPEED_I2C_INTR_STS_REG);
>
> -       spin_unlock_irqrestore(&bus->lock, flags);
> -       /*
> -        * We need to make sure that there are no interrupts that fired just
> -        * before we grabbed the lock; if that did not happen, then we are going
> -        * to timeout and that is okay.
> -        */
> -       wait_for_completion_timeout(&bus->cmd_complete, bus->adap.timeout);
> -       spin_lock_irqsave(&bus->lock, flags);
> -
> -       ret = __aspeed_i2c_init(bus, pdev);
> +       ret = aspeed_i2c_init(bus, pdev);
>
>         spin_unlock_irqrestore(&bus->lock, flags);
>
> @@ -797,8 +780,9 @@ static int aspeed_i2c_reset(struct aspeed_i2c_bus *bus)
>  static int aspeed_i2c_probe_bus(struct platform_device *pdev)
>  {
>         struct aspeed_i2c_bus *bus;
> +       struct clk *parent_clk;
>         struct resource *res;
> -       int ret;
> +       int irq, ret;
>
>         bus = devm_kzalloc(&pdev->dev, sizeof(*bus), GFP_KERNEL);
>         if (!bus)
> @@ -809,6 +793,21 @@ static int aspeed_i2c_probe_bus(struct platform_device *pdev)
>         if (IS_ERR(bus->base))
>                 return PTR_ERR(bus->base);
>
> +       parent_clk = devm_clk_get(&pdev->dev, NULL);
> +       if (IS_ERR(parent_clk))
> +               return PTR_ERR(parent_clk);
> +       bus->parent_clk_frequency = clk_get_rate(parent_clk);
> +       /* We just need the clock rate, we don't actually use the clk object. */
> +       devm_clk_put(&pdev->dev, parent_clk);
> +
> +       ret = of_property_read_u32(pdev->dev.of_node,
> +                                  "bus-frequency", &bus->bus_frequency);
> +       if (ret < 0) {
> +               dev_err(&pdev->dev,
> +                       "Could not read bus-frequency property\n");
> +               bus->bus_frequency = 100000;
> +       }
> +
>         /* Initialize the I2C adapter */
>         spin_lock_init(&bus->lock);
>         init_completion(&bus->cmd_complete);
> @@ -816,24 +815,26 @@ static int aspeed_i2c_probe_bus(struct platform_device *pdev)
>         bus->adap.retries = 0;
>         bus->adap.timeout = 5 * HZ;
>         bus->adap.algo = &aspeed_i2c_algo;
> -       bus->adap.algo_data = bus;
>         bus->adap.dev.parent = &pdev->dev;
>         bus->adap.dev.of_node = pdev->dev.of_node;
> -       snprintf(bus->adap.name, sizeof(bus->adap.name), "Aspeed i2c");
> +       strlcpy(bus->adap.name, pdev->name, sizeof(bus->adap.name));
> +       i2c_set_adapdata(&bus->adap, bus);
>
>         bus->dev = &pdev->dev;
>
> +       /* Clean up any left over interrupt state. */
> +       writel(0, bus->base + ASPEED_I2C_INTR_CTRL_REG);
> +       writel(0xffffffff, bus->base + ASPEED_I2C_INTR_STS_REG);
>         /*
> -        * No need to quiesce interrupts because there is no interrupt handler
> -        * installed.
> +        * bus.lock does not need to be held because the interrupt handler has
> +        * not been enabled yet.
>          */
> -       writel(0, bus->base + ASPEED_I2C_INTR_CTRL_REG);
> -       ret = __aspeed_i2c_init(bus, pdev);
> +       ret = aspeed_i2c_init(bus, pdev);
>         if (ret < 0)
>                 return ret;
>
> -       bus->irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
> -       ret = devm_request_irq(&pdev->dev, bus->irq, aspeed_i2c_bus_irq,
> +       irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
> +       ret = devm_request_irq(&pdev->dev, irq, aspeed_i2c_bus_irq,
>                                0, dev_name(&pdev->dev), bus);
>         if (ret < 0)
>                 return ret;
> @@ -845,7 +846,7 @@ static int aspeed_i2c_probe_bus(struct platform_device *pdev)
>         platform_set_drvdata(pdev, bus);
>
>         dev_info(bus->dev, "i2c bus %d registered, irq %d\n",
> -                bus->adap.nr, bus->irq);
> +                bus->adap.nr, irq);
>
>         return 0;
>  }
> diff --git a/drivers/irqchip/irq-aspeed-i2c-ic.c b/drivers/irqchip/irq-aspeed-i2c-ic.c
> index a36fb09c10c2..815b88dd18f2 100644
> --- a/drivers/irqchip/irq-aspeed-i2c-ic.c
> +++ b/drivers/irqchip/irq-aspeed-i2c-ic.c
> @@ -69,24 +69,31 @@ static int __init aspeed_i2c_ic_of_init(struct device_node *node,
>                                         struct device_node *parent)
>  {
>         struct aspeed_i2c_ic *i2c_ic;
> +       int ret = 0;
>
>         i2c_ic = kzalloc(sizeof(*i2c_ic), GFP_KERNEL);
>         if (!i2c_ic)
>                 return -ENOMEM;
>
>         i2c_ic->base = of_iomap(node, 0);
> -       if (IS_ERR(i2c_ic->base))
> -               return PTR_ERR(i2c_ic->base);
> +       if (IS_ERR(i2c_ic->base)) {
> +               ret = PTR_ERR(i2c_ic->base);
> +               goto err_free_ic;
> +       }
>
>         i2c_ic->parent_irq = irq_of_parse_and_map(node, 0);
> -       if (i2c_ic->parent_irq < 0)
> -               return i2c_ic->parent_irq;
> +       if (i2c_ic->parent_irq < 0) {
> +               ret = i2c_ic->parent_irq;
> +               goto err_iounmap;
> +       }
>
> -       i2c_ic->irq_domain = irq_domain_add_linear(
> -                       node, ASPEED_I2C_IC_NUM_BUS,
> -                       &aspeed_i2c_ic_irq_domain_ops, NULL);
> -       if (!i2c_ic->irq_domain)
> -               return -ENOMEM;
> +       i2c_ic->irq_domain = irq_domain_add_linear(node, ASPEED_I2C_IC_NUM_BUS,
> +                                                  &aspeed_i2c_ic_irq_domain_ops,
> +                                                  NULL);
> +       if (!i2c_ic->irq_domain) {
> +               ret = -ENOMEM;
> +               goto err_iounmap;
> +       }
>
>         i2c_ic->irq_domain->name = "aspeed-i2c-domain";
>
> @@ -96,6 +103,12 @@ static int __init aspeed_i2c_ic_of_init(struct device_node *node,
>         pr_info("i2c controller registered, irq %d\n", i2c_ic->parent_irq);
>
>         return 0;
> +
> +err_iounmap:
> +       iounmap(i2c_ic->base);
> +err_free_ic:
> +       kfree(i2c_ic);
> +       return ret;
>  }
>
>  IRQCHIP_DECLARE(ast2400_i2c_ic, "aspeed,ast2400-i2c-ic", aspeed_i2c_ic_of_init);
> --
> 2.13.3
>
