Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x243.google.com (mail-ua0-x243.google.com
 [IPv6:2607:f8b0:400c:c08::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s772D3dwSzDqJ5
 for <openbmc@lists.ozlabs.org>; Mon,  8 Aug 2016 16:35:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=rsDixo0j; 
 dkim-atps=neutral
Received: by mail-ua0-x243.google.com with SMTP id 74so6770704uau.3
 for <openbmc@lists.ozlabs.org>; Sun, 07 Aug 2016 23:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=dlUCQFqvL7dMh9kohNBb/XS1LbGT45XGY0Gyxb+LwiU=;
 b=rsDixo0j9eG4WBOfu+USY88Xc77qwWmDq5vf34/vHdj2G+tm42YAB1WGVYqUd3QCeM
 MfZipksThF0y+trLQGCIiJtvEd0KcMxSjsnex9qtfxrVcKM+UfJ51xXiPutMZOnPuxaQ
 gtBSzlZonmum0N/9ztZRFYHiv25mtmT4APNOQzk3avBbO8dalSwPZY5vBpcGQ8Jd8nay
 K2EynaLKdTUZ/zA4Dxdz2ItHMsJ/pACfDqx9lvI/ElRqzm1VisDjLT0vtz+FOAC8xstS
 EOBENUu35o46N+esNV7tYAwIZ+OH6QBDrkY30UizD7fjJttX1jFw2OrrIzZNdcRzNBhv
 ZbJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=dlUCQFqvL7dMh9kohNBb/XS1LbGT45XGY0Gyxb+LwiU=;
 b=Am1LvNdclC9QD38o6JrschBMW+RpElObW/vX0Owt0y4TX2JV4t/APU3uktN9fwLmwR
 LC7X38UbY5011nTxFbxfd5qhrPD6ZlBYT6EvkN3s4DqeL0JvC1z9WKZmNriTfzy6l6Ro
 poO12aSIukPy+LLD+GFbRfWqS+cyy31qP7K8HnUAr/wFqR0urBBHUbO3h6sXkQHU5+06
 IKi9VuQ4HkBasbT3gPZREGkWAQ1dVlPRDtuB3cHg59nDbwuB+bEfs5YaPwUW1NE0KlNV
 mqDj2jZPzClkOipGJ33V1Voq2LjCGkNlKRaUy834KfzJ4JCvU0/DoNaMhJ44JKDoRJHn
 bLhA==
X-Gm-Message-State: AEkoous/to4DPFaMKDsxoRBvOtYGADCaIkbKZFbLUwmrcJR74cjkOiL9gRBc5Walcda9kVJC2rnuAquhF9ZbAg==
X-Received: by 10.31.134.6 with SMTP id i6mr48578010vkd.21.1470638114436; Sun,
 07 Aug 2016 23:35:14 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.159.38.76 with HTTP; Sun, 7 Aug 2016 23:34:53 -0700 (PDT)
In-Reply-To: <1470259708-12453-2-git-send-email-brendanhiggins@google.com>
References: <CACPK8XehcSGvyBkdVB_kxZyFWzPr8qwseRzfp-mZG7hnZFnSUw@mail.gmail.com>
 <1470259708-12453-1-git-send-email-brendanhiggins@google.com>
 <1470259708-12453-2-git-send-email-brendanhiggins@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 8 Aug 2016 16:04:53 +0930
X-Google-Sender-Auth: oMuXXDzmYhEE6L7yKQjOnY8xkR4
Message-ID: <CACPK8Xc+Q=TWhHG_+Y2uy07sxb61ibN8O8-r6G2jvdp-EAoAgw@mail.gmail.com>
Subject: Re: [PATCH] i2c: aspeed: added support for slave mode
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
X-List-Received-Date: Mon, 08 Aug 2016 06:35:17 -0000

On Thu, Aug 4, 2016 at 6:58 AM, Brendan Higgins
<brendanhiggins@google.com> wrote:
> Added slave mode irq handler as well as reg_slave and unreg_slave
> functions to the i2c-aspeed's i2c_algorithm.

Thanks, this look good. I have applied it to the dev-4.7 tree.

Next time, some tips for using the git tools to send patches to a mailing list:

Use `git format-patch -v2` for the second revision of your patch. This
will set the v2 (or v3, v4...) in the subject line and let me know
that it's a second revision.

In addition, put a little change log down below the ---. I've put an
example there, but really it can say whatever you want.

>
> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> ---

v2:
  Addressed Joel's review
   - fixed comments
   - clarified locking
   - removed baz
   - added bar

>  drivers/i2c/busses/i2c-aspeed.c | 202 +++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 198 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index b8e8199..89ffa12 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -197,6 +197,7 @@
>  #define AST_I2CD_M_START_CMD                           (0x1 )
>
>  /* 0x18 : I2CD Slave Device Address Register   */
> +#define AST_I2CD_DEV_ADDR_MASK                          ((0x1 << 7) - 1)
>
>  /* 0x1C : I2CD Pool Buffer Control Register   */
>  #define AST_I2CD_RX_BUF_ADDR_GET(x)                            ((x>> 24)& 0xff)
> @@ -225,6 +226,17 @@
>
>  static const int ast_i2c_n_busses = 14;
>
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
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
>  struct ast_i2c_bus {
>         /* TODO: find a better way to do this */
>         struct ast_i2c_dev *i2c_dev;
> @@ -233,6 +245,10 @@ struct ast_i2c_bus {
>         void __iomem    *base;                  /* virtual */
>         u32 state;                              //I2C xfer mode state matchine
>         struct i2c_adapter adap;
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +       struct i2c_client *slave;
> +       enum ast_i2c_slave_state slave_state;
> +#endif
>         u32             bus_clk;
>         struct clk      *pclk;
>         int             irq;
> @@ -318,7 +334,6 @@ static void ast_i2c_dev_init(struct ast_i2c_bus *bus)
>         ast_i2c_write(bus, ast_i2c_read(bus, I2C_FUN_CTRL_REG)
>                         | AST_I2CD_MASTER_EN, I2C_FUN_CTRL_REG);
>
> -
>         /* Set interrupt generation of I2C controller */
>         ast_i2c_write(bus, AST_I2CD_INTR_SDA_DL_TIMEOUT |
>                         AST_I2CD_INTR_BUS_RECOVER_DONE |
> @@ -529,10 +544,105 @@ static void ast_i2c_master_xfer_done(struct ast_i2c_bus *bus)
>                 complete(&bus->cmd_complete);
>  }
>
> -static irqreturn_t ast_i2c_bus_irq(int irq, void *dev_id)
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +static bool ast_i2c_slave_irq(struct ast_i2c_bus *bus)
>  {
> -       struct ast_i2c_bus *bus = dev_id;
> +       bool irq_handled = true;
> +       u32 command;
> +       u32 irq_status;
> +       u32 status_ack = 0;
> +       u8 value;
> +       enum i2c_slave_event event;
> +       struct i2c_client *slave = bus->slave;
>
> +       spin_lock(&bus->cmd_lock);
> +       if (!slave) {
> +               irq_handled = false;
> +               goto out;
> +       }
> +       command = ast_i2c_read(bus, I2C_CMD_REG);
> +       irq_status = ast_i2c_read(bus, I2C_INTR_STS_REG);
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
> +               value = ast_i2c_read(bus, I2C_BYTE_BUF_REG) >> 8;
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
> +               else
> +                       status_ack |= AST_I2CD_INTR_TX_NAK;
> +               bus->slave_state = AST_I2C_SLAVE_STOP;
> +       }
> +
> +       if (bus->slave_state == AST_I2C_SLAVE_READ_REQUESTED ||
> +           bus->slave_state == AST_I2C_SLAVE_READ_PROCESSED) {
> +               if (bus->slave_state == AST_I2C_SLAVE_READ_REQUESTED) {
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
> +               ast_i2c_write(bus, value, I2C_BYTE_BUF_REG);
> +               ast_i2c_write(bus, AST_I2CD_S_TX_CMD, I2C_CMD_REG);
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
> +       ast_i2c_write(bus, status_ack, I2C_INTR_STS_REG);
> +
> +out:
> +       spin_unlock(&bus->cmd_lock);
> +       return irq_handled;
> +}
> +#endif
> +
> +static bool ast_i2c_master_irq(struct ast_i2c_bus *bus)
> +{
>         const u32 errs = AST_I2CD_INTR_ARBIT_LOSS |
>                 AST_I2CD_INTR_ABNORMAL |
>                 AST_I2CD_INTR_SCL_TIMEOUT |
> @@ -550,7 +660,11 @@ static irqreturn_t ast_i2c_bus_irq(int irq, void *dev_id)
>         sts &= 0x7fff;
>         bus->state = cmd >> 19 & 0xf;
>
> -       /* ack everything */
> +       /*
> +        * ack everything - this is safe because this driver makes master mode
> +        * and slave mode mutually exclusive on a single bus; thus, it is not
> +        * possible for a master to steal a slave IRQ in this way.
> +        */
>         ast_i2c_write(bus, sts, I2C_INTR_STS_REG);
>
>         bus->cmd_err |= sts & errs;
> @@ -575,6 +689,24 @@ static irqreturn_t ast_i2c_bus_irq(int irq, void *dev_id)
>
>         spin_unlock(&bus->cmd_lock);
>
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
>         return IRQ_HANDLED;
>  }
>
> @@ -674,9 +806,71 @@ static u32 ast_i2c_functionality(struct i2c_adapter *adap)
>         return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL | I2C_FUNC_SMBUS_BLOCK_DATA;
>  }
>
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +static int ast_i2c_reg_slave(struct i2c_client *client)
> +{
> +       struct ast_i2c_bus *bus;
> +       unsigned long flags;
> +       u32 addr_reg_val;
> +       u32 func_ctrl_reg_val;
> +
> +       bus = client->adapter->algo_data;
> +       spin_lock_irqsave(&bus->cmd_lock, flags);
> +       if (bus->slave) {
> +               spin_unlock_irqrestore(&bus->cmd_lock, flags);
> +               return -EINVAL;
> +       }
> +
> +       /* Set slave addr. */
> +       addr_reg_val = ast_i2c_read(bus, I2C_DEV_ADDR_REG);
> +       addr_reg_val &= ~AST_I2CD_DEV_ADDR_MASK;
> +       addr_reg_val |= client->addr & AST_I2CD_DEV_ADDR_MASK;
> +       ast_i2c_write(bus, addr_reg_val, I2C_DEV_ADDR_REG);
> +
> +       /* Switch from master mode to slave mode. */
> +       func_ctrl_reg_val = ast_i2c_read(bus, I2C_FUN_CTRL_REG);
> +       func_ctrl_reg_val &= ~AST_I2CD_MASTER_EN;
> +       func_ctrl_reg_val |= AST_I2CD_SLAVE_EN;
> +       ast_i2c_write(bus, func_ctrl_reg_val, I2C_FUN_CTRL_REG);
> +
> +       bus->slave = client;
> +       bus->slave_state = AST_I2C_SLAVE_STOP;
> +       spin_unlock_irqrestore(&bus->cmd_lock, flags);
> +       return 0;
> +}
> +
> +static int ast_i2c_unreg_slave(struct i2c_client *client)
> +{
> +       struct ast_i2c_bus *bus = client->adapter->algo_data;
> +       unsigned long flags;
> +       u32 addr_reg_val;
> +       u32 func_ctrl_reg_val;
> +
> +       spin_lock_irqsave(&bus->cmd_lock, flags);
> +       if (!bus->slave) {
> +               spin_unlock_irqrestore(&bus->cmd_lock, flags);
> +               return -EINVAL;
> +       }
> +
> +       /* Switch from slave mode to master mode. */
> +       func_ctrl_reg_val = ast_i2c_read(bus, I2C_FUN_CTRL_REG);
> +       func_ctrl_reg_val &= ~AST_I2CD_SLAVE_EN;
> +       func_ctrl_reg_val |= AST_I2CD_MASTER_EN;
> +       ast_i2c_write(bus, func_ctrl_reg_val, I2C_FUN_CTRL_REG);
> +
> +       bus->slave = NULL;
> +       spin_unlock_irqrestore(&bus->cmd_lock, flags);
> +       return 0;
> +}
> +#endif
> +
>  static const struct i2c_algorithm i2c_ast_algorithm = {
>         .master_xfer    = ast_i2c_xfer,
>         .functionality  = ast_i2c_functionality,
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +       .reg_slave      = ast_i2c_reg_slave,
> +       .unreg_slave    = ast_i2c_unreg_slave,
> +#endif
>  };
>
>  static int ast_i2c_probe_bus(struct platform_device *pdev)
> --
> 2.8.0.rc3.226.g39d4020
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
