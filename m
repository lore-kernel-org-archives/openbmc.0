Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x241.google.com (mail-ua0-x241.google.com
 [IPv6:2607:f8b0:400c:c08::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s43Np1wbgzDqQt
 for <openbmc@lists.ozlabs.org>; Wed,  3 Aug 2016 16:40:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=F07F5GsC; 
 dkim-atps=neutral
Received: by mail-ua0-x241.google.com with SMTP id s7so1487855uas.1
 for <openbmc@lists.ozlabs.org>; Tue, 02 Aug 2016 23:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=w9PAOxYiw14ZoFjpdBnKDOGVGN7yV215IH6w6dmbgS8=;
 b=F07F5GsC8zwbluRFSqbHJWpPNUzFtEuLKemzswachg6YcGCNeUcwcndMByiJRv9JwY
 +GfWQC4bQt95K81Gmm/vabzDxSIwhjelvprZd6urUH+ilhwRLL2Nm8juL+0uq54WsIX5
 pbNy4rLhxUct7r4dp4BO0S8RGJI5ug3+GHgegvVoabimd9zpLSvMpUU0KCQuKGHh+CLV
 x7r3JIod7t0aqvs8BuTRFaJXg7Nfsghlo70mxYNVg8xkrpEPSIFhM69sM7aZX4T6fHXz
 1vSnNfAhbDNwWr1sOpETJcD0/Hf6uz9Zq21Gb28hCxiks6llyHTQ0spqlVa9AVjBEbxt
 9r+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=w9PAOxYiw14ZoFjpdBnKDOGVGN7yV215IH6w6dmbgS8=;
 b=jv375v7GKSvePMKPwSlFikRF26ohoGfvUHJxRCf1aeDXuuBTLysGCDnWS8TW3qBGno
 efzGae7NQEIW1nAN3F2pz40GWI1jewedkAepkJ+IPn1kl0QmQLSOsT299LFVCcxIcW3o
 IwUROlx8gQ3O2LzWFLcMsxPXXEoyfabb9sdyNjg4HODCerI08ZtJy4GIWMo3dF4I9VKQ
 vD58MbXudj7JR6bWyp0PRp1elb1aM7jhqDr12jHeUEEHmlFDjvbJb42qyvhTAypk/jOD
 WSn72XkzySNuHDZ+oluF4Hv54ILU05Piy8j6ln7UicV3u7XVJjUFrWWAtk8amb35v8W9
 h/bw==
X-Gm-Message-State: AEkoousI4oOceHpRzRt1LJ4OwJ+JNO5P1SOYRDBuKvFjMDa2cYD0MZzuGAbnGi+kgVJPPFeZmcIH6sOuZVEQ5w==
X-Received: by 10.176.1.143 with SMTP id 15mr32946378ual.46.1470206439629;
 Tue, 02 Aug 2016 23:40:39 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.159.38.76 with HTTP; Tue, 2 Aug 2016 23:40:19 -0700 (PDT)
In-Reply-To: <1470112380-22740-1-git-send-email-brendanhiggins@google.com>
References: <1470112380-22740-1-git-send-email-brendanhiggins@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 3 Aug 2016 16:10:19 +0930
X-Google-Sender-Auth: mKN_N3OZHNyDcKiSenn4qmpWaGM
Message-ID: <CACPK8XehcSGvyBkdVB_kxZyFWzPr8qwseRzfp-mZG7hnZFnSUw@mail.gmail.com>
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
X-List-Received-Date: Wed, 03 Aug 2016 06:40:43 -0000

Hello Brendan,

On Tue, Aug 2, 2016 at 2:03 PM, Brendan Higgins
<brendanhiggins@google.com> wrote:
> Added slave mode irq handler as well as reg_slave and unreg_slave
> functions to the i2c-aspeed's i2c_algorithm.

Thanks for the patch! I don't have any hardware to test on that uses
the Aspeed SoC as a slave. Have you had a chance to give this a spin?

This driver needs some cleanup and then submission upstream. I would
like to see it submitted in the next month or so in order to land it
in Linux 4.9. Would you be willing to take on part or all of this
work?

I've made a few comments below.

> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> ---
>  drivers/i2c/busses/i2c-aspeed.c | 198 +++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 195 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index b8e8199..dc1ec40 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c

> @@ -529,10 +544,105 @@ static void ast_i2c_master_xfer_done(struct ast_i2c_bus *bus)
>                 complete(&bus->cmd_complete);
>  }
>
> -static irqreturn_t ast_i2c_bus_irq(int irq, void *dev_id)
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +static bool ast_i2c_slave_irq(struct ast_i2c_bus *bus)
>  {

The master takes bus->cmd_lock in ast_i2c_master_irq. Should we be
doing the same when handling the slave?

Also, the master acks all IRQs when they come in. Will we miss a slave
irq if it comes in just after a master irq, as we enter
ast_i2c_master_irq?

> -       struct ast_i2c_bus *bus = dev_id;
> +       u32 command;
> +       u32 irq_status;
> +       u32 status_ack = 0;
> +       u8 value;
> +       enum i2c_slave_event event;
> +       struct i2c_client *slave = bus->slave;
> +
> +       if (!slave)
> +               return false;
> +       command = ast_i2c_read(bus, I2C_CMD_REG);
> +       irq_status = ast_i2c_read(bus, I2C_INTR_STS_REG);
> +       /*
> +        * Slave was requested, restart state machine.
> +        */

> @@ -674,9 +802,69 @@ static u32 ast_i2c_functionality(struct i2c_adapter *adap)
>         return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL | I2C_FUNC_SMBUS_BLOCK_DATA;
>  }
>
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +static int ast_i2c_reg_slave(struct i2c_client *client)
> +{
> +       struct ast_i2c_bus *bus;
> +       u32 addr_reg_val;
> +       u32 func_ctrl_reg_val;
> +
> +       if (!client->slave_cb)
> +               return -EINVAL;

This function is a callback that the i2c core uses:

 int i2c_slave_register(struct i2c_client *client, i2c_slave_cb_t slave_cb)
 {
         int ret;

         if (!client || !slave_cb) {
                 WARN(1, "insufficent data\n");
                 return -EINVAL;

As you can see it checks that the callback is valid, so we don't need
to. Unless there's something I'm missing here?

> +       bus = client->adapter->algo_data;
> +       if (bus->slave)
> +               return -EINVAL;
> +
> +       /*
> +        * Set slave addr.
> +        */

Nit: I prefer /* foo */ for single line comments.

> +       addr_reg_val = ast_i2c_read(bus, I2C_DEV_ADDR_REG);
> +       addr_reg_val &= ~AST_I2CD_DEV_ADDR_MASK;
> +       addr_reg_val |= client->addr & AST_I2CD_DEV_ADDR_MASK;
> +       ast_i2c_write(bus, addr_reg_val, I2C_DEV_ADDR_REG);
> +
> +       /*
> +        * Switch from master mode to slave mode.
> +        */
> +       func_ctrl_reg_val = ast_i2c_read(bus, I2C_FUN_CTRL_REG);
> +       func_ctrl_reg_val &= ~AST_I2CD_MASTER_EN;
> +       func_ctrl_reg_val |= AST_I2CD_SLAVE_EN;
> +       ast_i2c_write(bus, func_ctrl_reg_val, I2C_FUN_CTRL_REG);
> +
> +       bus->slave = client;
> +       bus->slave_state = AST_I2C_SLAVE_STOP;
> +       return 0;
> +}
> +

>  static int ast_i2c_probe_bus(struct platform_device *pdev)
> @@ -717,6 +905,10 @@ static int ast_i2c_probe_bus(struct platform_device *pdev)
>                 return -ENXIO;
>         }
>
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +       bus->slave = NULL;
> +#endif

We've just kzalloc'd bus, so it will already be NULL.

Cheers,

Joel
