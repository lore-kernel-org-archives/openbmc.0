Return-Path: <brendanhiggins@google.com>
Received: from mail-qk0-x22d.google.com (mail-qk0-x22d.google.com
 [IPv6:2607:f8b0:400d:c09::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tT2BV3zd9zDvJb
 for <openbmc@lists.ozlabs.org>; Wed, 30 Nov 2016 11:59:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="i/wQZqVu"; 
 dkim-atps=neutral
Received: by mail-qk0-x22d.google.com with SMTP id n21so194173878qka.3
 for <openbmc@lists.ozlabs.org>; Tue, 29 Nov 2016 16:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=Z7W+5CR1zQXB7BflA61idMeTP/3kcf+laI8CdWGsaoo=;
 b=i/wQZqVuq3ZChx77EQFlAfVKLvX8J9BOCsdsrORz+qx/0rscoDRi/Fq5lMEjLAqLua
 xoclbI0AYXkcBCHoNiSrSVsOOQfUN3HtZoZbg8hA24nPdoaKGWt9VBtfgSZcGegLgYtw
 1ld+ZGToqWJjvKAsL7gYdPu1uyeR0krx+SsURKsCDNhKoXez9qsRC5cJyxpjoNuSuQYc
 goslA0ZP2+X7XGa8J9pe/TaIBYyN1VaqIArfJy8EWKP9mp5BbKD7X+fkD4FhzzrbdMXK
 TiBT+oTnt3I3KXWQltH7QrfbxbRh/MuQo9a2yXGKbBC+r5GYy0ygoo2Kh0OMw4ZrRjQQ
 M3oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=Z7W+5CR1zQXB7BflA61idMeTP/3kcf+laI8CdWGsaoo=;
 b=NtFTyWXlOxcCHQZzi9LuhUomM7DT+bMhqEJ+RIs7MwtcIQqdQQHDll/NAspu4MIebc
 RYxCGoZlMvYMyEV0cI9XlB8aABwihQSsHqzXit5S3mQ6Td1C5Qh902QvrZIXg0dJkZ1y
 U4KfcOImi8Mg6GaX2pYK1yzAZP6SpJTz1OrMGuOeNCfeZObCeFd9ELfhEw5aXh/82Xlo
 DrhpRdp9TnBOZTDy+PTyKLqwZrCcMQahGl0zCpnY+QFGTQqlt62geH/jLCXEMkdmb2B1
 EV9lxTctpPDxAI/ECj0fHKnRKHSvYd8TA+zbkNcV6CzTXKEWkP8lrMqCSc5tReXPzrxl
 XgiA==
X-Gm-Message-State: AKaTC00Yw2gCk+vCjJ1zwqCgavqeTgnttXD+eL7jdMJWBVheq5v7K3g04ih1iJJK4Z9IBW7D9xv70PCHEXkfhvTN
X-Received: by 10.55.163.134 with SMTP id m128mr29793062qke.180.1480467583559; 
 Tue, 29 Nov 2016 16:59:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.137.220 with HTTP; Tue, 29 Nov 2016 16:59:43 -0800 (PST)
In-Reply-To: <00867f8e-e861-4184-6179-25e996789762@mleia.com>
References: <1478311099-6771-1-git-send-email-brendanhiggins@google.com>
 <1478311099-6771-2-git-send-email-brendanhiggins@google.com>
 <00867f8e-e861-4184-6179-25e996789762@mleia.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 29 Nov 2016 16:59:43 -0800
Message-ID: <CAFd5g44_NjguoM7A90swH2fnt95H6S5+vYff7dmnhJKSEoXFAw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] i2c: aspeed: added driver for Aspeed I2C
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: mark.rutland@arm.com, Wolfram Sang <wsa@the-dreams.de>, robh+dt@kernel.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 30 Nov 2016 00:59:47 -0000

Thanks for the comments!

Most of the stuff you suggested was pretty straightforward and will be
in the v5 patchset which I will send out in a bit.

I removed my implementation of the irq_chip; it appears that there is already a
dummy_irq_chip that is intended for just this kind of thing. Let me
know if you think
we still need to loop in the irqchip people.

The remaining comments are addressed below:

> > +#define ASPEED_I2CD_MULTI_MASTER_DIS                   BIT(15)
>
> Unused macro, please remove.

No, it is used below:

> +       /* Enable Master Mode */
> +       aspeed_i2c_write(bus, aspeed_i2c_read(bus, ASPEED_I2C_FUN_CTRL_REG) |
> +                     ASPEED_I2CD_MASTER_EN |
> +                     ASPEED_I2CD_MULTI_MASTER_DIS, ASPEED_I2C_FUN_CTRL_REG);

> > +#define ASPEED_I2CD_SDA_DRIVE_1T_EN                    BIT(8)
>
> Unused macro, please remove.

No, it is used below:

> +       /* Set AC Timing */
> +       if (clk_freq / 1000 > 400) {
> +               aspeed_i2c_write(bus, aspeed_i2c_read(bus,
> +                                                     ASPEED_I2C_FUN_CTRL_REG) |
> +                               ASPEED_I2CD_M_HIGH_SPEED_EN |
> +                               ASPEED_I2CD_M_SDA_DRIVE_1T_EN |
> +                               ASPEED_I2CD_SDA_DRIVE_1T_EN,
> +                               ASPEED_I2C_FUN_CTRL_REG);

> > +#define ASPEED_I2CD_SLAVE_EN                           BIT(1)
>
> Unused macro, please remove. You add slave support, may be you
> need this control, but it is unused.

No, it is used below:

> +       /* Switch from master mode to slave mode. */
> +       func_ctrl_reg_val = aspeed_i2c_read(bus, ASPEED_I2C_FUN_CTRL_REG);
> +       func_ctrl_reg_val &= ~ASPEED_I2CD_MASTER_EN;
> +       func_ctrl_reg_val |= ASPEED_I2CD_SLAVE_EN;

> > +       /* Slave was asked to stop. */
> > +       if (irq_status & ASPEED_I2CD_INTR_NORMAL_STOP) {
> > +               status_ack |= ASPEED_I2CD_INTR_NORMAL_STOP;
> > +               bus->slave_state = ASPEED_I2C_SLAVE_STOP;
> > +       }
>
> Add an empty line here.
>
> > +       if (irq_status & ASPEED_I2CD_INTR_TX_NAK) {
> > +               status_ack |= ASPEED_I2CD_INTR_TX_NAK;
> > +               bus->slave_state = ASPEED_I2C_SLAVE_STOP;
> > +       }

Actually, I think this makes more sense without a space as these are
both stop conditions.

> > +static int aspeed_i2c_init_clk(struct aspeed_i2c_bus *bus,
> > +                           struct platform_device *pdev)
> > +{
> > +       struct clk *pclk;
> > +       u32 clk_freq;
> > +       u32 divider_ratio;
> > +       int ret;
> > +
> > +       pclk = devm_clk_get(&pdev->dev, NULL);
> > +       if (IS_ERR(pclk)) {
> > +               dev_err(&pdev->dev, "clk_get failed\n");
> > +               return PTR_ERR(pclk);
> > +       }
> > +       ret = of_property_read_u32(pdev->dev.of_node,
> > +                       "clock-frequency", &clk_freq);
> > +       if (ret < 0) {
> > +               dev_err(&pdev->dev,
> > +                               "Could not read clock-frequency property\n");
> > +               clk_freq = 100000;
> > +       }
> > +       divider_ratio = clk_get_rate(pclk) / clk_freq;
> > +       /* We just need the clock rate, we don't actually use the clk object. */
> > +       devm_clk_put(&pdev->dev, pclk);
>
> Does the controller have a clock supply? If yes, shall the clock be
> enabled before issuing command to the controller?

No, the clock source for the busses is the APB's clock. The chip does
not really expose
any sophisticated way to manipulate it, so we can just assume it is
always on and is fixed
frequency. Additionally, each bus has its own clock which is just a
divider on the APB's
clock which we set up here. The controller does not participate in this.

> > +static int aspeed_i2c_probe_bus(struct platform_device *pdev)
> > +{
> > +       struct aspeed_i2c_bus *bus;
> > +       struct aspeed_i2c_controller *controller =
> > +                       dev_get_drvdata(pdev->dev.parent);
>
> How do you ensure that "controller" device _driver_ is initialized
> at this point? This is a critical race condition.

aspeed_i2c_probe_controller(...) is responsible for creating the bus
nodes right before it
finishes, so it makes sure that it is sufficiently initialized before
allowing its child busses
to be probed:

> +       for_each_child_of_node(pdev->dev.of_node, np) {
> +               of_platform_device_create(np, NULL, &pdev->dev);
> +               of_node_put(np);
> +       }

Cheers
