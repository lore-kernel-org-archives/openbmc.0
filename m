Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x242.google.com (mail-yb0-x242.google.com
 [IPv6:2607:f8b0:4002:c09::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vvMv064pQzDqC4
 for <openbmc@lists.ozlabs.org>; Fri, 31 Mar 2017 11:34:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="LrVQu7n+"; 
 dkim-atps=neutral
Received: by mail-yb0-x242.google.com with SMTP id l201so421338ybf.3
 for <openbmc@lists.ozlabs.org>; Thu, 30 Mar 2017 17:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=7bikPPE85LIRp2eh8H0BEmUjKrSlHigIm7VzkLILixo=;
 b=LrVQu7n+uvq5bOkRRN69W9QukCgAI+FUYcBOiugB7e/OJsTVZreXjyyVPpJyzhEIAS
 5tH/w1T1vN4mZEZNqNnKScSIiBxqE6104zKZsiTdlQzxywYZv5aWuG0G6+qV74y7/iU0
 z9I3lETQYwhwt6EzWLsu1gmmN3t+QOyCimIhN9kn0CPQa6us0WrgDLkwXwLfJpM0LRqS
 B4Ituwe3oWXJiS+/o+dujd4024sCQlN1DZFhVd1W31QqIR17DfS9aLx7REVZCkx3MCfA
 2ffDUrh/r14HuA1Ihx+hd+nEawKPK2IkPeilTAbc8iXu6EuhUVZUo5EvwfwTKS9KkHn+
 QxkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=7bikPPE85LIRp2eh8H0BEmUjKrSlHigIm7VzkLILixo=;
 b=gV8xa9MlZxyClwOkgNn2iLOXbNCl2O/xdnyIn9DuBuwneKnmuuaYdJr8h4W/90QO8R
 GlMgF/GwNLHl4bhzRPlGB8RTk4igTKYc56y9nwCGmpYRnf3Ipw0W4Cl4ApEabbshQ8RO
 0GQX+yjLDSz8wFNUp7p7Nqwbe1YSAegMNF5V5Ljpxa7SGKFxhyFAQbABE4ZmmJYE10dT
 pGz4CBVTL3AfnJPFCn1pjdNorcuEQMJfC+JPVAdN6oz1qB5ZaWTY7V53dSHsgmge8G95
 LmqsyCH2GLU3FFl3bQLKq6kDlhs/n5AQLjQg2XLyXd3A4cy2m88lE36UD4dgupwhuFVa
 FXHw==
X-Gm-Message-State: AFeK/H3CCsz8HSv4aoIP0v9XlIBNjUsKUeuKjvPnG8SaJP+LaJsxbBcbu0KZZ2hUGchYX18IBDG1j7E43m5GYw==
X-Received: by 10.37.58.195 with SMTP id h186mr163401yba.106.1490920442448;
 Thu, 30 Mar 2017 17:34:02 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.59.17 with HTTP; Thu, 30 Mar 2017 17:33:42 -0700 (PDT)
In-Reply-To: <20170328051226.21677-5-brendanhiggins@google.com>
References: <20170328051226.21677-1-brendanhiggins@google.com>
 <20170328051226.21677-5-brendanhiggins@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 31 Mar 2017 11:03:42 +1030
X-Google-Sender-Auth: IvzHQl-WrNePHnJIJgS1rB_zAMo
Message-ID: <CACPK8XdUyu7H07=y4PL4zmTc5vJ0bu=UJkza64HgvDiK97noSg@mail.gmail.com>
Subject: Re: [PATCH v6 4/5] i2c: aspeed: added driver for Aspeed I2C
To: Brendan Higgins <brendanhiggins@google.com>
Cc: Wolfram Sang <wsa@the-dreams.de>, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>,
 vz@mleia.com, mouse@mayc.ru, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
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
X-List-Received-Date: Fri, 31 Mar 2017 00:34:05 -0000

On Tue, Mar 28, 2017 at 3:42 PM, Brendan Higgins
<brendanhiggins@google.com> wrote:
> Added initial master support for Aspeed I2C controller. Supports
> fourteen busses present in AST24XX and AST25XX BMC SoCs by Aspeed.

Mention that the driver supports byte at a time access only at this stage.

> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>

Looking good. I've given this a spin on ast2500 hardware and it worked for me.

I've got a bunch of nits below, and one bigger question about weather
we need internal locking in the driver, or if we can rely on the i2c
core for our locks.

> ---
>  drivers/i2c/busses/Kconfig      |  10 +
>  drivers/i2c/busses/Makefile     |   1 +
>  drivers/i2c/busses/i2c-aspeed.c | 610 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 621 insertions(+)
>  create mode 100644 drivers/i2c/busses/i2c-aspeed.c
>
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 8adc0f1d7ad0..e5ea5641a874 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -326,6 +326,16 @@ config I2C_POWERMAC
>
>  comment "I2C system bus drivers (mostly embedded / system-on-chip)"
>
> +config I2C_ASPEED
> +       tristate "Aspeed AST2xxx SoC I2C Controller"

Aspeed I2C Controller

> +       depends on ARCH_ASPEED
> +       help
> +         If you say yes to this option, support will be included for the
> +         Aspeed AST2xxx SoC I2C controller.

And again.

> +
> +         This driver can also be built as a module.  If so, the module
> +         will be called i2c-aspeed.
> +
>  config I2C_AT91
>         tristate "Atmel AT91 I2C Two-Wire interface (TWI)"
>         depends on ARCH_AT91

> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> new file mode 100644
> index 000000000000..04266acc6c46
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-aspeed.c

> +       spin_unlock_irqrestore(&bus->lock, flags);
> +
> +       return ret;
> +}
> +
> +static void do_start(struct aspeed_i2c_bus *bus)

aspeed_i2c_do_start

> +{
> +       u32 command = ASPEED_I2CD_M_START_CMD | ASPEED_I2CD_M_TX_CMD;
> +       struct i2c_msg *msg = &bus->msgs[bus->msgs_index];
> +       u8 slave_addr = msg->addr << 1;
> +
> +       bus->master_state = ASPEED_I2C_MASTER_START;
> +       bus->buf_index = 0;
> +
> +       if (msg->flags & I2C_M_RD) {
> +               slave_addr |= 1;
> +               command |= ASPEED_I2CD_M_RX_CMD;
> +               /* Need to let the hardware know to NACK after RX. */
> +               if (msg->len == 1 && !(msg->flags & I2C_M_RECV_LEN))
> +                       command |= ASPEED_I2CD_M_S_RX_CMD_LAST;
> +       }
> +
> +       aspeed_i2c_write(bus, slave_addr, ASPEED_I2C_BYTE_BUF_REG);
> +       aspeed_i2c_write(bus, command, ASPEED_I2C_CMD_REG);
> +}
> +
> +static void do_stop(struct aspeed_i2c_bus *bus)

aspeed_i2c_do_stop

> +{
> +       bus->master_state = ASPEED_I2C_MASTER_STOP;
> +       aspeed_i2c_write(bus, ASPEED_I2CD_M_STOP_CMD,
> +                        ASPEED_I2C_CMD_REG);
> +}

> +static int aspeed_i2c_probe_bus(struct platform_device *pdev)
> +{
> +       struct aspeed_i2c_bus *bus;
> +       struct resource *res;
> +       int ret;
> +
> +       bus = devm_kzalloc(&pdev->dev, sizeof(*bus), GFP_KERNEL);
> +       if (!bus)
> +               return -ENOMEM;
> +
> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       bus->base = devm_ioremap_resource(&pdev->dev, res);
> +       if (IS_ERR(bus->base)) {
> +               dev_err(&pdev->dev, "failed to devm_ioremap_resource\n");

devm_ioremap_resource shows an error for you, please drop the dev_err here.

> +               return PTR_ERR(bus->base);
> +       }
> +
> +       bus->irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
> +       ret = devm_request_irq(&pdev->dev, bus->irq, aspeed_i2c_bus_irq,
> +                              IRQF_SHARED, dev_name(&pdev->dev), bus);

Is this requesting an IRQ from your i2c-irq-controller? In which case
the IRQ won't be shared with any other driver, so you don't need to
set IRQF_SHARED.

> +       if (ret < 0) {
> +               dev_err(&pdev->dev, "failed to request interrupt\n");
> +               return ret;
> +       }
> +
> +       /* Initialize the I2C adapter */
> +       spin_lock_init(&bus->lock);

Do we need this lock at all?

The i2c core provides locking around operations on the bus. I was
browsing some of the other bus drivers and they do not have locking
inside of the driver (eg. i2c-at91.c). I also did a test of an earlier
version of this driver where I removed the locks, and it performed
correctly in my testing (http://patchwork.ozlabs.org/patch/731899/).

> +       init_completion(&bus->cmd_complete);
> +       bus->adap.owner = THIS_MODULE;
> +       bus->adap.retries = 0;
> +       bus->adap.timeout = 5 * HZ;
> +       bus->adap.algo = &aspeed_i2c_algo;
> +       bus->adap.algo_data = bus;
> +       bus->adap.dev.parent = &pdev->dev;
> +       bus->adap.dev.of_node = pdev->dev.of_node;
> +       snprintf(bus->adap.name, sizeof(bus->adap.name), "Aspeed i2c");

> +static struct platform_driver aspeed_i2c_bus_driver = {
> +       .probe          = aspeed_i2c_probe_bus,
> +       .remove         = aspeed_i2c_remove_bus,
> +       .driver         = {
> +               .name           = "ast-i2c-bus",

aspeed-i2c-bus please.

> +               .of_match_table = aspeed_i2c_bus_of_table,
> +       },
> +};
> +module_platform_driver(aspeed_i2c_bus_driver);
> +
> +MODULE_AUTHOR("Brendan Higgins <brendanhiggins@google.com>");
> +MODULE_DESCRIPTION("Aspeed I2C Bus Driver");
> +MODULE_LICENSE("GPL v2");
> --
> 2.12.2.564.g063fe858b8-goog
>
