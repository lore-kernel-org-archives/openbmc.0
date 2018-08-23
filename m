Return-Path: <brendanhiggins@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4003:c06::243; helo=mail-oi0-x243.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="KGJMoXqr"; 
 dkim-atps=neutral
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com
 [IPv6:2607:f8b0:4003:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41xHMD41f5zDq5k
 for <openbmc@lists.ozlabs.org>; Fri, 24 Aug 2018 07:18:15 +1000 (AEST)
Received: by mail-oi0-x243.google.com with SMTP id y207-v6so11762904oie.13
 for <openbmc@lists.ozlabs.org>; Thu, 23 Aug 2018 14:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z1Hf9GHKwELGvKAZn2jE3MTEGSUYwpD4UyLunTVvBNY=;
 b=KGJMoXqrJyPoQDTsn09OkLeXjjfPnVR066PQ9hZBhFNHLb6MQvHpNCkHkJBL7hBFQL
 BT9UM4JpYQ8GXmxnVSeHfqq5wZZvlbrAR1L2cHpGVlsKZAR3iF4Fao8BTfK56L4nBf0L
 p6VviEpv7dQbgJX2Ona/reiB6fm417wb6d+cjT4RZ6FeJkw20Ju1Xxf6Hh4KT5kW2cmE
 wMPgbVcWINA7daHd01Tw+rBMoquewUH88fBuv8EQWM5bASBv1VDkoPGEjjUqnAHlyAha
 Hz4mptwbLbbHmgfUxrClfzuFHZpV/Vw2KO13cSYxdwm996xblbSFiqozNtnnPCqXEjb1
 5ALQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z1Hf9GHKwELGvKAZn2jE3MTEGSUYwpD4UyLunTVvBNY=;
 b=n3euouYhzytSuHtbBEqiE+1cIK6e0HDZW+BsF6LXlngb5JMzzXZ7HYeIGdAP7MzonF
 XS1RYQjajEeqRt1WG55Ae2MsEfrhfY9mnBVz/9w3VJnkuAbI6WxdrQFUkNTIHUqzTxE2
 C7dcf0VRHOEfHWskkTASRqgeI0MIRUsxB4yBOL4D3w8htBkBqHqWIqQSt5gk805IYbCL
 1W7J0k08jUYDnIFn8ZCsDkfc/oHsExO5p7FS2kUygykTax0TlRx1v4OH1SnMda1DMySs
 2zx74LwJ1dR1Zy/635zTVRUrki/iiDgxNh2Kn6bYkA14vpnA1MOe3gcRUVUw0AxdDox0
 qSVQ==
X-Gm-Message-State: APzg51BtBYYdZoQw76q2C5RnGfOsq4uv0ot6/IriqM2Lsj+sYzxQNzRc
 EQtdDYxCU1fpgb+usafEsKpczxCGIFZ8h+B9bVbjzA==
X-Google-Smtp-Source: ANB0VdZlZwGtpIjWJp5jPuS592l9gWr/xSsHkDj2ZVtXcHjyA5tPEmwXi8Z34g4AxBq5+41Cj2bK9V7FE/yT57uChLE=
X-Received: by 2002:a54:4017:: with SMTP id
 x23-v6mr9439152oie.25.1535059092763; 
 Thu, 23 Aug 2018 14:18:12 -0700 (PDT)
MIME-Version: 1.0
References: <20180823205647.12417-1-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20180823205647.12417-1-jae.hyun.yoo@linux.intel.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Thu, 23 Aug 2018 14:18:01 -0700
Message-ID: <CAFd5g457FQNwiprMmeGEaem8LTSObXuyifdxtN7LzS6k1PWmdg@mail.gmail.com>
Subject: Re: [PATCH i2c-next v5] i2c: aspeed: Handle master/slave combined irq
 events properly
To: jae.hyun.yoo@linux.intel.com
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@aj.id.au>, linux-i2c@vger.kernel.org, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-aspeed@lists.ozlabs.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 jarkko.nikula@linux.intel.com, 
 james.feist@linux.intel.com, vernon.mauery@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Aug 2018 21:18:17 -0000

On Thu, Aug 23, 2018 at 1:56 PM Jae Hyun Yoo
<jae.hyun.yoo@linux.intel.com> wrote:
>
> In most of cases, interrupt bits are set one by one but there are
> also a lot of other cases that Aspeed I2C IP sends multiple
> interrupt bits with combining master and slave events using a
> single interrupt call. It happens much more in multi-master
> environment than single-master. For an example, when master is
> waiting for a NORMAL_STOP interrupt in its MASTER_STOP state,
> SLAVE_MATCH and RX_DONE interrupts could come along with the
> NORMAL_STOP in case of an another master immediately sends data
> just after acquiring the bus. In this case, the NORMAL_STOP
> interrupt should be handled by master_irq and the SLAVE_MATCH and
> RX_DONE interrupts should be handled by slave_irq. This commit
> modifies irq hadling logic to handle the master/slave combined
> events properly.
>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
> ---
> Changes since v4:
> - Fixed an error printing message that handlers didn't handle all interrupts.
>
> Changes since v3:
> - Fixed typos in a comment.
>
> Changes since v2:
> - Changed the name of ASPEED_I2CD_INTR_ERRORS to ASPEED_I2CD_INTR_MASTER_ERRORS
> - Removed a member irq_status from the struct aspeed_i2c_bus and changed
>   master_irq and slave_irq handlers to make them return status_ack.
> - Added a comment to explain why it needs to try both irq handlers.
>
> Changes since v1:
> - Fixed a grammar issue in commit message.
> - Added a missing line feed character into a message printing.
>
>  drivers/i2c/busses/i2c-aspeed.c | 115 +++++++++++++++++++-------------
>  1 file changed, 70 insertions(+), 45 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index a4f956c6d567..8341e384f4f1 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -82,6 +82,11 @@
>  #define ASPEED_I2CD_INTR_RX_DONE                       BIT(2)
>  #define ASPEED_I2CD_INTR_TX_NAK                                BIT(1)
>  #define ASPEED_I2CD_INTR_TX_ACK                                BIT(0)
> +#define ASPEED_I2CD_INTR_MASTER_ERRORS                                        \
> +               (ASPEED_I2CD_INTR_SDA_DL_TIMEOUT |                             \
> +                ASPEED_I2CD_INTR_SCL_TIMEOUT |                                \
> +                ASPEED_I2CD_INTR_ABNORMAL |                                   \
> +                ASPEED_I2CD_INTR_ARBIT_LOSS)
>  #define ASPEED_I2CD_INTR_ALL                                                  \
>                 (ASPEED_I2CD_INTR_SDA_DL_TIMEOUT |                             \
>                  ASPEED_I2CD_INTR_BUS_RECOVER_DONE |                           \
> @@ -227,20 +232,16 @@ static int aspeed_i2c_recover_bus(struct aspeed_i2c_bus *bus)
>  }
>
>  #if IS_ENABLED(CONFIG_I2C_SLAVE)
> -static bool aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus)
> +static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
>  {
> -       u32 command, irq_status, status_ack = 0;
> +       u32 command, status_ack = 0;
>         struct i2c_client *slave = bus->slave;
> -       bool irq_handled = true;
>         u8 value;
>
> -       if (!slave) {
> -               irq_handled = false;
> -               goto out;
> -       }
> +       if (!slave)
> +               return 0;
>
>         command = readl(bus->base + ASPEED_I2C_CMD_REG);
> -       irq_status = readl(bus->base + ASPEED_I2C_INTR_STS_REG);
>
>         /* Slave was requested, restart state machine. */
>         if (irq_status & ASPEED_I2CD_INTR_SLAVE_MATCH) {
> @@ -249,10 +250,8 @@ static bool aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus)
>         }
>
>         /* Slave is not currently active, irq was for someone else. */
> -       if (bus->slave_state == ASPEED_I2C_SLAVE_STOP) {
> -               irq_handled = false;
> -               goto out;
> -       }
> +       if (bus->slave_state == ASPEED_I2C_SLAVE_STOP)
> +               return status_ack;
>
>         dev_dbg(bus->dev, "slave irq status 0x%08x, cmd 0x%08x\n",
>                 irq_status, command);
> @@ -281,19 +280,19 @@ static bool aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus)
>                 status_ack |= ASPEED_I2CD_INTR_TX_NAK;
>                 bus->slave_state = ASPEED_I2C_SLAVE_STOP;
>         }
> +       if (irq_status & ASPEED_I2CD_INTR_TX_ACK)
> +               status_ack |= ASPEED_I2CD_INTR_TX_ACK;
>
>         switch (bus->slave_state) {
>         case ASPEED_I2C_SLAVE_READ_REQUESTED:
>                 if (irq_status & ASPEED_I2CD_INTR_TX_ACK)
>                         dev_err(bus->dev, "Unexpected ACK on read request.\n");
>                 bus->slave_state = ASPEED_I2C_SLAVE_READ_PROCESSED;
> -
>                 i2c_slave_event(slave, I2C_SLAVE_READ_REQUESTED, &value);
>                 writel(value, bus->base + ASPEED_I2C_BYTE_BUF_REG);
>                 writel(ASPEED_I2CD_S_TX_CMD, bus->base + ASPEED_I2C_CMD_REG);
>                 break;
>         case ASPEED_I2C_SLAVE_READ_PROCESSED:
> -               status_ack |= ASPEED_I2CD_INTR_TX_ACK;
>                 if (!(irq_status & ASPEED_I2CD_INTR_TX_ACK))
>                         dev_err(bus->dev,
>                                 "Expected ACK after processed read.\n");
> @@ -317,14 +316,7 @@ static bool aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus)
>                 break;
>         }
>
> -       if (status_ack != irq_status)
> -               dev_err(bus->dev,
> -                       "irq handled != irq. expected %x, but was %x\n",
> -                       irq_status, status_ack);
> -       writel(status_ack, bus->base + ASPEED_I2C_INTR_STS_REG);
> -
> -out:
> -       return irq_handled;
> +       return status_ack;
>  }
>  #endif /* CONFIG_I2C_SLAVE */
>
> @@ -380,21 +372,21 @@ static int aspeed_i2c_is_irq_error(u32 irq_status)
>         return 0;
>  }
>
> -static bool aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus)
> +static u32 aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
>  {
> -       u32 irq_status, status_ack = 0, command = 0;
> +       u32 status_ack = 0, command = 0;
>         struct i2c_msg *msg;
>         u8 recv_byte;
>         int ret;
>
> -       irq_status = readl(bus->base + ASPEED_I2C_INTR_STS_REG);
> -       /* Ack all interrupt bits. */
> -       writel(irq_status, bus->base + ASPEED_I2C_INTR_STS_REG);
> -
>         if (irq_status & ASPEED_I2CD_INTR_BUS_RECOVER_DONE) {
>                 bus->master_state = ASPEED_I2C_MASTER_INACTIVE;
>                 status_ack |= ASPEED_I2CD_INTR_BUS_RECOVER_DONE;
>                 goto out_complete;
> +       } else {
> +               /* Master is not currently active, irq was for someone else. */
> +               if (bus->master_state == ASPEED_I2C_MASTER_INACTIVE)
> +                       goto out_no_complete;
>         }
>
>         /*
> @@ -403,19 +395,22 @@ static bool aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus)
>          * INACTIVE state.
>          */
>         ret = aspeed_i2c_is_irq_error(irq_status);
> -       if (ret < 0) {
> +       if (ret) {
>                 dev_dbg(bus->dev, "received error interrupt: 0x%08x\n",
>                         irq_status);
>                 bus->cmd_err = ret;
>                 bus->master_state = ASPEED_I2C_MASTER_INACTIVE;
> +               status_ack |= (irq_status & ASPEED_I2CD_INTR_MASTER_ERRORS);
>                 goto out_complete;
>         }
>
>         /* We are in an invalid state; reset bus to a known state. */
>         if (!bus->msgs) {
> -               dev_err(bus->dev, "bus in unknown state\n");
> +               dev_err(bus->dev, "bus in unknown state. irq_status: 0x%x\n",
> +                       irq_status);
>                 bus->cmd_err = -EIO;
> -               if (bus->master_state != ASPEED_I2C_MASTER_STOP)
> +               if (bus->master_state != ASPEED_I2C_MASTER_STOP &&
> +                   bus->master_state != ASPEED_I2C_MASTER_INACTIVE)
>                         aspeed_i2c_do_stop(bus);
>                 goto out_no_complete;
>         }
> @@ -428,6 +423,11 @@ static bool aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus)
>          */
>         if (bus->master_state == ASPEED_I2C_MASTER_START) {
>                 if (unlikely(!(irq_status & ASPEED_I2CD_INTR_TX_ACK))) {
> +                       if (unlikely(!(irq_status & ASPEED_I2CD_INTR_TX_NAK))) {
> +                               bus->cmd_err = -ENXIO;
> +                               bus->master_state = ASPEED_I2C_MASTER_INACTIVE;
> +                               goto out_complete;
> +                       }
>                         pr_devel("no slave present at %02x\n", msg->addr);
>                         status_ack |= ASPEED_I2CD_INTR_TX_NAK;
>                         bus->cmd_err = -ENXIO;
> @@ -506,7 +506,9 @@ static bool aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus)
>                 goto out_no_complete;
>         case ASPEED_I2C_MASTER_STOP:
>                 if (unlikely(!(irq_status & ASPEED_I2CD_INTR_NORMAL_STOP))) {
> -                       dev_err(bus->dev, "master failed to STOP\n");
> +                       dev_err(bus->dev,
> +                               "master failed to STOP. irq_status:0x%x\n",
> +                               irq_status);
>                         bus->cmd_err = -EIO;
>                         /* Do not STOP as we have already tried. */
>                 } else {
> @@ -540,33 +542,56 @@ static bool aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus)
>                 bus->master_xfer_result = bus->msgs_index + 1;
>         complete(&bus->cmd_complete);
>  out_no_complete:
> -       if (irq_status != status_ack)
> -               dev_err(bus->dev,
> -                       "irq handled != irq. expected 0x%08x, but was 0x%08x\n",
> -                       irq_status, status_ack);
> -       return !!irq_status;
> +       return status_ack;
>  }
>
>  static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
>  {
>         struct aspeed_i2c_bus *bus = dev_id;
> -       bool ret;
> +       u32 irq_received, irq_status, irq_acked;

Thinking more about how irq_status is used below, I think you can pick
a better name, maybe `irq_bits_remaining` or `irq_status_remaining`?

Come to think of it, `irq_acked` is a bit misleading too, maybe
`irq_handled`? This might seem pedantic, but you ack the bits at the
end of the function, so it does not actually contain acked bits.

It also might make more sense to just have the `irq_handled` and
`irq_received` fields, and then make the `irq_handled` cumulative.
That way, anywhere you use the `irq_status` it is immediately obvious
that you are comparing the received bits with the bits that have been
handled up to this point. I am not 100% sure, what do you think?

>
>         spin_lock(&bus->lock);
> +       irq_received = readl(bus->base + ASPEED_I2C_INTR_STS_REG);
> +       irq_status = irq_received;
>
>  #if IS_ENABLED(CONFIG_I2C_SLAVE)
> -       if (aspeed_i2c_slave_irq(bus)) {
> -               dev_dbg(bus->dev, "irq handled by slave.\n");
> -               ret = true;
> -               goto out;
> +       /*
> +        * In most cases, interrupt bits will be set one by one, although
> +        * multiple interrupt bits could be set at the same time. It's also
> +        * possible that master interrupt bits could be set along with slave
> +        * interrupt bits. Each case needs to be handled using corresponding
> +        * handlers depending on the current state.
> +        */
> +       if (bus->master_state != ASPEED_I2C_MASTER_INACTIVE) {
> +               irq_acked = aspeed_i2c_master_irq(bus, irq_status);
> +               irq_status &= ~irq_acked;
> +               if (irq_status)
> +                       irq_acked = aspeed_i2c_slave_irq(bus, irq_status);
> +       } else {
> +               irq_acked = aspeed_i2c_slave_irq(bus, irq_status);
> +               irq_status &= ~irq_acked;
> +               if (irq_status)
> +                       irq_acked = aspeed_i2c_master_irq(bus, irq_status);
>         }
> +#else
> +       irq_acked = aspeed_i2c_master_irq(bus, irq_status);
>  #endif /* CONFIG_I2C_SLAVE */
>
> -       ret = aspeed_i2c_master_irq(bus);
> +       irq_status &= ~irq_acked;
> +       if (irq_status) {
> +               /*
> +                * 'irq_received ^ irq_status' indicates accumulated bits acked
> +                * by both master and slave irq handlers.
> +                */
> +               dev_err(bus->dev,
> +                       "irq acked != irq. expected 0x%08x, but was 0x%08x\n",
> +                       irq_received, irq_received ^ irq_status);

My point was that you are still using the `irq_received ^ irq_status`, right?

If you want a cumulative irq_acked, you can either or the first
instance of irq_acked with the following, or take a not of irq_status.
Xoring with a mask is not immediately clear.

> +       }
>
> -out:
> +       /* Ack all interrupt bits. */
> +       writel(irq_received, bus->base + ASPEED_I2C_INTR_STS_REG);
>         spin_unlock(&bus->lock);
> -       return ret ? IRQ_HANDLED : IRQ_NONE;
> +       return irq_status ? IRQ_NONE : IRQ_HANDLED;
>  }
>
>  static int aspeed_i2c_master_xfer(struct i2c_adapter *adap,
> --
> 2.18.0
>

Cheers
