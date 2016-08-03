Return-Path: <brendanhiggins@google.com>
Received: from mail-pf0-x233.google.com (mail-pf0-x233.google.com
 [IPv6:2607:f8b0:400e:c00::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s4R5v0CcXzDqRt
 for <openbmc@lists.ozlabs.org>; Thu,  4 Aug 2016 07:29:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=nyALiJdx; 
 dkim-atps=neutral
Received: by mail-pf0-x233.google.com with SMTP id x72so81043314pfd.2
 for <openbmc@lists.ozlabs.org>; Wed, 03 Aug 2016 14:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=ABdR+bOQ4npqqbXbO+tk/gsPPYl0v/WedHILg4URIGI=;
 b=nyALiJdx3MtJGudkFiISHCOUGjFP5+tYqQdQbohYphbOfEgV1bxr+8KX7UwiY3T5XM
 C7N7xDu3CPjdhpoSr7AZ/+RRs2DG48ip6gi1D/Qj7o17kHaGvZRvP0OWUCOfa3dQyi8D
 4d1MixGj4nUkgeVWXOM4T/JZ4YGNb0TTRreKV7NHozjkwfI8OnSzB4gst7IqV/uul5el
 onUjDnHRn4bB+xE6b05KYAiO4ANIp0OaK4Bbm21CdyqttfyA/fMSFPsBiZZKUEQMa/84
 QG27bCR3jb1P7nvOXPGc/tyksRO4q37pq1MiSOQUG+DAcWEc+CfOg4rr2tCOc47+zXlH
 sW+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=ABdR+bOQ4npqqbXbO+tk/gsPPYl0v/WedHILg4URIGI=;
 b=B9rzOxDQKvUvJH0cDcUNp2BwroZdNPQpkZSf9BxiO+UQK0xRh7di6wXFdhj6BGuC4V
 YVLokRS1FbyJPtsRq+vSwLY3GaXM201vsMt0g4a83HrotRXzSEJpu0AUNmvDziWpwzz6
 2OK4Maz/XhY8ZPC5rXzTyTkF6Hwk8XiUsryKIs7mWEVTvU+5EiSOnmHmXDb5Q3dJnt5G
 x0be2PdKOxJDQse+/iWUMXvfOD5/GINdFVx75xrSPdQDWgGgD2gfCK0R6+ALPslEMBxZ
 abGKaR/NdWz3WsLhREdRnu0a/UORBoYmyGfl+2HYihfwOb8SIwAO9ktMwKwfh8z2nitz
 M6/w==
X-Gm-Message-State: AEkoousnWPz336yparlnlc0xoMxldm8EmTI7ddBYrq2uP79RJ2sD75T+u9+DgRg+uKtA3Ysg
X-Received: by 10.98.71.140 with SMTP id p12mr119399611pfi.93.1470259743431;
 Wed, 03 Aug 2016 14:29:03 -0700 (PDT)
Received: from mactruck.mtv.corp.google.com ([172.18.64.18])
 by smtp.gmail.com with ESMTPSA id e72sm14823356pfb.49.2016.08.03.14.29.01
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 03 Aug 2016 14:29:02 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH v2] i2c: aspeed: added support for slave mode
Date: Wed,  3 Aug 2016 14:28:27 -0700
Message-Id: <1470259708-12453-1-git-send-email-brendanhiggins@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <CACPK8XehcSGvyBkdVB_kxZyFWzPr8qwseRzfp-mZG7hnZFnSUw@mail.gmail.com>
References: <CACPK8XehcSGvyBkdVB_kxZyFWzPr8qwseRzfp-mZG7hnZFnSUw@mail.gmail.com>
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
X-List-Received-Date: Wed, 03 Aug 2016 21:29:07 -0000

Hey Joel,

> Thanks for the patch! I don't have any hardware to test on that uses
> the Aspeed SoC as a slave. Have you had a chance to give this a spin?

No problem. And yes, I have tried the patch on a AS2500 evaluation board.

> This driver needs some cleanup and then submission upstream. I would
> like to see it submitted in the next month or so in order to land it
> in Linux 4.9. Would you be willing to take on part or all of this
> work?

I would be totally willing to do the cleanup.

> > Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> > ---
> >  drivers/i2c/busses/i2c-aspeed.c | 198 +++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 195 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> > index b8e8199..dc1ec40 100644
> > --- a/drivers/i2c/busses/i2c-aspeed.c
> > +++ b/drivers/i2c/busses/i2c-aspeed.c
>
> > @@ -529,10 +544,105 @@ static void ast_i2c_master_xfer_done(struct ast_i2c_bus *bus)
> >                 complete(&bus->cmd_complete);
> >  }
> >
> > -static irqreturn_t ast_i2c_bus_irq(int irq, void *dev_id)
> > +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> > +static bool ast_i2c_slave_irq(struct ast_i2c_bus *bus)
> >  {
>
> The master takes bus->cmd_lock in ast_i2c_master_irq. Should we be
> doing the same when handling the slave?

Fixed.

> Also, the master acks all IRQs when they come in. Will we miss a slave
> irq if it comes in just after a master irq, as we enter
> ast_i2c_master_irq?

No, as the driver is written, slave mode and master mode are mutually exclusive
on the same bus so it would be impossible for this to happen. Even if both slave
and master mode were both enabled, each bus has its own registers and gets its
own IRQs. So the only time a master could steal a slave's IRQ would be if the
Aspeed's master and slave mode were enabled for the same bus and were both
active and in this case it would be talking to itself; I don't think there is
any way to make that work.

I added a comment to the effect of the first part (making master and slave mode
mutually exclusive).

> > -       struct ast_i2c_bus *bus = dev_id;
> > +       u32 command;
> > +       u32 irq_status;
> > +       u32 status_ack = 0;
> > +       u8 value;
> > +       enum i2c_slave_event event;
> > +       struct i2c_client *slave = bus->slave;
> > +
> > +       if (!slave)
> > +               return false;
> > +       command = ast_i2c_read(bus, I2C_CMD_REG);
> > +       irq_status = ast_i2c_read(bus, I2C_INTR_STS_REG);
> > +       /*
> > +        * Slave was requested, restart state machine.
> > +        */
>
> > @@ -674,9 +802,69 @@ static u32 ast_i2c_functionality(struct i2c_adapter *adap)
> >         return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL | I2C_FUNC_SMBUS_BLOCK_DATA;
> >  }
> >
> > +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> > +static int ast_i2c_reg_slave(struct i2c_client *client)
> > +{
> > +       struct ast_i2c_bus *bus;
> > +       u32 addr_reg_val;
> > +       u32 func_ctrl_reg_val;
> > +
> > +       if (!client->slave_cb)
> > +               return -EINVAL;
>
> This function is a callback that the i2c core uses:
>
>  int i2c_slave_register(struct i2c_client *client, i2c_slave_cb_t slave_cb)
>  {
>          int ret;
>
>          if (!client || !slave_cb) {
>                  WARN(1, "insufficent data\n");
>                  return -EINVAL;
>
> As you can see it checks that the callback is valid, so we don't need
> to. Unless there's something I'm missing here?

Fixed.

> > +       bus = client->adapter->algo_data;
> > +       if (bus->slave)
> > +               return -EINVAL;
> > +
> > +       /*
> > +        * Set slave addr.
> > +        */
>
> Nit: I prefer /* foo */ for single line comments.

Fixed (in other places as well).

> > +       addr_reg_val = ast_i2c_read(bus, I2C_DEV_ADDR_REG);
> > +       addr_reg_val &= ~AST_I2CD_DEV_ADDR_MASK;
> > +       addr_reg_val |= client->addr & AST_I2CD_DEV_ADDR_MASK;
> > +       ast_i2c_write(bus, addr_reg_val, I2C_DEV_ADDR_REG);
> > +
> > +       /*
> > +        * Switch from master mode to slave mode.
> > +        */
> > +       func_ctrl_reg_val = ast_i2c_read(bus, I2C_FUN_CTRL_REG);
> > +       func_ctrl_reg_val &= ~AST_I2CD_MASTER_EN;
> > +       func_ctrl_reg_val |= AST_I2CD_SLAVE_EN;
> > +       ast_i2c_write(bus, func_ctrl_reg_val, I2C_FUN_CTRL_REG);
> > +
> > +       bus->slave = client;
> > +       bus->slave_state = AST_I2C_SLAVE_STOP;
> > +       return 0;
> > +}
> > +
>
> >  static int ast_i2c_probe_bus(struct platform_device *pdev)
> > @@ -717,6 +905,10 @@ static int ast_i2c_probe_bus(struct platform_device *pdev)
> >                 return -ENXIO;
> >         }
> >
> > +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> > +       bus->slave = NULL;
> > +#endif
>
> We've just kzalloc'd bus, so it will already be NULL.

Fixed.

Cheers,

Brendan

P.S. My appologies if this comes out formatted weird on your end, I am not used
to git-send-email
