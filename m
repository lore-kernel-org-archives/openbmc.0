Return-Path: <jaghu@google.com>
Received: from mail-wm0-x232.google.com (mail-wm0-x232.google.com
 [IPv6:2a00:1450:400c:c09::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tPYk332bRzDw5s
 for <openbmc@lists.ozlabs.org>; Thu, 24 Nov 2016 20:26:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="XcnE9Mdz"; 
 dkim-atps=neutral
Received: by mail-wm0-x232.google.com with SMTP id f82so53353236wmf.1
 for <openbmc@lists.ozlabs.org>; Thu, 24 Nov 2016 01:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=cEfdgvYn4B1NqlukVeM8UMAw+GGlqq9TUHa5QoVxpGo=;
 b=XcnE9MdzF91RdrLhtwLOafmO6X5ZwIM9n4TqmkuzS8fLkUH30Sw21Q+YafV59gonyT
 58YIIwf9+AQzw+n3naJ3In8CH8J++RZzmToNStN/YIOIZPGK+59h28MvRakqPUf325Pt
 UfcOLkctoHtUt7semevWQQxPcoklZ6wmHcigcYl2kg7yExt3nphK1+Ptjza8HT2smrA/
 IpnRLlSQM7KEnC7vMv4miwST/neeg1iD++PLSoSOXOT5NbTsZ4FpreQ2aB5XVr0rpc5+
 dKqHzKqzu+bAhPvx1KXO0nTFhJGzM4eo+IALXexcyCGvO0MuO1B02JaYYGj/sHARlwQ9
 uLEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=cEfdgvYn4B1NqlukVeM8UMAw+GGlqq9TUHa5QoVxpGo=;
 b=SiqwG693U073IzJv5C/3f1H3Zv5DrYtg234t+BVgSbXs0MlwgqCfcq5RKLYlL4BKvI
 Xb2cIQPG/dEIUxNXeuMxaFiDzgiUaDcB18Lmoc3vUGhuYzfSSa/1jZrQe1RNjzvR/HLF
 nGTOxAYK/hfyxjnbaKMLPxneynFclMBLxdFyCy86pyUOcrp1pl7wwQeYWtuFvAApqDjK
 trKPTVwDAH/RndMdVCKflp3vi42+d71z82olBMvuGLFL9LcWAdY/2bZMi4DAHjFiUZ1J
 fL2KlZzuxj1aH/wRC0ZrKtpMmAarFgqFcrT6bVWFhOHh2q5YPCyPXIUzhO4yo2SbWMBs
 SoOg==
X-Gm-Message-State: AKaTC02YHsIWddsNHR3W8X19binTWyjk5nSTqD/K2cTNjTY+jGITSPxbYzAJopiMGDlZL7zK0393aJbzt8FvYl5U
X-Received: by 10.28.158.148 with SMTP id h142mr1385651wme.59.1479979591624;
 Thu, 24 Nov 2016 01:26:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.146.147 with HTTP; Thu, 24 Nov 2016 01:26:10 -0800 (PST)
In-Reply-To: <CACPK8XfyNvU2ALoGBc9k6xnB83mFaLdLRpG5pe1DOmbX08Jvew@mail.gmail.com>
References: <1478657505-23109-1-git-send-email-jaghu@google.com>
 <1478657505-23109-3-git-send-email-jaghu@google.com>
 <CACPK8XfyNvU2ALoGBc9k6xnB83mFaLdLRpG5pe1DOmbX08Jvew@mail.gmail.com>
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Date: Thu, 24 Nov 2016 01:26:10 -0800
Message-ID: <CANsWYUWKOxifT=6bZqLu7yh_H8EnQ=m+50Mvyr15wBtk_qL=Jw@mail.gmail.com>
Subject: Re: [PATCH linux v2 2/3] drivers: hwmon: ASPEED AST2500 PWM driver
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a114b3608d5da4c05420899d4
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
X-List-Received-Date: Thu, 24 Nov 2016 09:26:36 -0000

--001a114b3608d5da4c05420899d4
Content-Type: text/plain; charset=UTF-8

On Tue, Nov 8, 2016 at 11:15 PM, Joel Stanley <joel@jms.id.au> wrote:

> Hello Jaghu,
>
> On Wed, Nov 9, 2016 at 12:41 PM, Jaghathiswari Rankappagounder
> Natarajan <jaghu@google.com> wrote:
> > The ASPEED AST2500 PWM controller can support upto 8 PWM output ports.
>
> I noticed that the ast2500 and ast2400 share the same PWM IP, so we
> can use the same driver for both. You should reflect this in the
> naming of the Kconfig, filename, commit message and the code itself.
>
> > There are three different PWM sources(types M, N and O)
> > and each PWM output port can be assigned a particular PWM source.
> > There is a sysfs file through which the user can control
> > the duty cycle of a particular PWM port. The duty cycle can range from 0
> to
> > 100 percent.
>
> Can you explain why this is a hwmon driver and not a pwm driver?

The fan tacho controller shares some common registers with PWM
controller; the fan tacho controller needs to be a hwmon driver; so if PWM
controller driver is a hwmon driver, then there is flexibility to add fan
tacho controller functionality to the same PWM driver and make it as common
driver for PWM and fan tacho controller.
The duty_cycle value available in pwm  sysfs interface needs to be
configured in nano seconds and the duty_cycle value available in hwmon
sysfs interface can be configured with a integer value (ranging from 0 to
255; with 255 being 100 percent). So thought that hwmon sysfs interface is
easier.


>
> >
> > v2:
> > - Merged the drivers for PWM controller and PWM device as one PWM driver.
>
> Thanks for adding the changelog. This should go below the --, two
> lines lower. We do this to ensure the changelog is not part of the
> committed patch.
>
> >
> > Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com
> >
> > ---
> >  drivers/hwmon/Kconfig              |   5 +
> >  drivers/hwmon/Makefile             |   2 +-
> >  drivers/hwmon/aspeed_ast2500_pwm.c | 662 ++++++++++++++++++++++++++++++
> +++++++
> >  drivers/hwmon/aspeed_ast2500_pwm.h | 128 +++++++
> >  4 files changed, 796 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/hwmon/aspeed_ast2500_pwm.c
> >  create mode 100644 drivers/hwmon/aspeed_ast2500_pwm.h
> >
> > diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> > index 3b34ba9..7edd94e 100644
> > --- a/drivers/hwmon/Kconfig
> > +++ b/drivers/hwmon/Kconfig
> > @@ -1800,6 +1800,11 @@ config SENSORS_ULTRA45
> >           This driver provides support for the Ultra45 workstation
> environmental
> >           sensors.
> >
> > +config ASPEED_AST2500_PWM
> > +       tristate "ASPEED AST2500 PWM driver"
> > +       help
> > +         This driver provides support for ASPEED AST2500 PWM output
> ports.
> > +
> >  if ACPI
> >
> >  comment "ACPI drivers"
> > diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> > index c0f3201..23529c2 100644
> > --- a/drivers/hwmon/Makefile
> > +++ b/drivers/hwmon/Makefile
> > @@ -163,7 +163,7 @@ obj-$(CONFIG_SENSORS_W83L785TS)     += w83l785ts.o
> >  obj-$(CONFIG_SENSORS_W83L786NG)        += w83l786ng.o
> >  obj-$(CONFIG_SENSORS_WM831X)   += wm831x-hwmon.o
> >  obj-$(CONFIG_SENSORS_WM8350)   += wm8350-hwmon.o
> > -
> > +obj-$(CONFIG_ASPEED_AST2500_PWM)       += aspeed_ast2500_pwm.o
> >  obj-$(CONFIG_PMBUS)            += pmbus/
> >
> >  ccflags-$(CONFIG_HWMON_DEBUG_CHIP) := -DDEBUG
> > diff --git a/drivers/hwmon/aspeed_ast2500_pwm.c b/drivers/hwmon/aspeed_
> ast2500_pwm.c
> > new file mode 100644
> > index 0000000..fda49d7
> > --- /dev/null
> > +++ b/drivers/hwmon/aspeed_ast2500_pwm.c
> > @@ -0,0 +1,662 @@
> > +/*
> > + * Aspeed AST2500 PWM device driver
>
> most of the time we don't add the name at the top of hte file.
>
>
> > + * * Copyright (c) 2016 Google, Inc
> > + *
> > + * * This program is free software; you can redistribute it and/or
> modify
> > + * * it under the terms of the GNU General Public License version 2 as
> > + * * published by the Free Software Foundation.
>
> Lose the second row of stars.
>
> The new drivers we contribute are v2 or later. This is your choice,
> but if there's no issue adding the or later it would be nice for all
> of the Aspeed code to be consistent.
> > + *
> > + */
> > +
> > +#include <linux/platform_device.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/of_platform.h>
> > +#include <linux/of_device.h>
> > +#include <linux/io.h>
> > +#include <linux/hwmon-sysfs.h>
> > +#include <linux/hwmon.h>
> > +#include <linux/sysfs.h>
> > +
> > +#include "aspeed_pwm.h"
> > +
> > +struct ast_pwm_port_data {
>
> For better or worse, we've settled on "aspeed" as the prefix for all
> of the drivers. Please use that instead of ast.
>
> > +       u8 pwm_port;
> > +       u8 pwm_enable;
> > +       u8 pwm_type;
> > +       u8 pwm_duty_cycle;
> > +       void __iomem *base;
> > +};
> > +
> > +struct ast_pwm_controller_data {
> > +       void __iomem *base;
> > +};
> > +
> > +static inline void
> > +ast_pwm_write(void __iomem *base, u32 val, u32 reg)
> > +{
> > +       writel(val, base + reg);
> > +}
> > +
> > +static inline u32
> > +ast_pwm_read(void __iomem *base, u32 reg)
> > +{
> > +       u32 val = readl(base + reg);
> > +       return val;
> > +}
> > +
> > +static void
> > +ast_set_pwm_clock_enable(struct ast_pwm_controller_data *priv, u8 val)
>
> val is a boolean.
>
> > +{
> > +       if (val) {
> > +               ast_pwm_write(priv->base,
> > +                       ast_pwm_read(priv->base, AST_PTCR_CTRL) |
> > +                       AST_PTCR_CTRL_CLK_EN, AST_PTCR_CTRL);
> > +       } else {
> > +               ast_pwm_write(priv->base,
> > +                       ast_pwm_read(priv->base, AST_PTCR_CTRL) &
> > +                       ~AST_PTCR_CTRL_CLK_EN, AST_PTCR_CTRL);
> > +       }
> > +}
>
> > +static void
> > +ast_set_pwm_enable(struct ast_pwm_port_data *priv, u8 enable)
> > +{
> > +       u8 pwm_ch = priv->pwm_port;
> > +
>
> The switch statements where you read-modify-write are hard to read. I
> suggest reading the register value into a variable, modify it in your
> switch statement, and write it at the end. This makes it easier to
> read what operations you're performing on the bits.
>
> u32 reg = ast_pwm_read(priv->base, AST_PTCR_CTRL);
>
> switch (pwm_ch) {
> case PWMA:
>      port = AST_PTCR_CTRL_PWMA_EN;
>      break;
> case PWMB:
>      port = AST_PTCR_CTRL_PWMB_EN;
>      break;
> ...
> }
>
> if (enable)
>    reg |= port;
> else
>    reg &= ~port;
>
> ast_pwm_write(priv->base, reg, AST_PTCR_CTRL);
>
> I think this structure will make this more readable. You could store
> the AST_PTCR_CTRL_PWMx_EN value as priv->pwm_port, and lose the switch
> statement all together.
>
> This suggestion wont work for the other switch statements obviously.
> Can you think of a representation that would allow you to look up the
> values without requiring a switch statement? Take a look at some of
> the other pwm drivers for inspiration.
>
> > +       switch (pwm_ch) {
> > +       case PWMA:
> > +               if (enable)
> > +                       ast_pwm_write(priv->base,
> > +                               ast_pwm_read(priv->base,
> > +                               AST_PTCR_CTRL) |
> > +                               AST_PTCR_CTRL_PWMA_EN,
> > +                               AST_PTCR_CTRL);
>
> > +static void
> > +ast_set_pwm_type(struct ast_pwm_port_data *priv, u8 type)
> > +{
> > +       u32 tmp1, tmp2;
> > +       u8 pwm_ch = priv->pwm_port;
> > +
> > +       tmp1 = ast_pwm_read(priv->base, AST_PTCR_CTRL);
> > +       tmp2 = ast_pwm_read(priv->base, AST_PTCR_CTRL_EXT);
>
> I think we can do better than tmp1 and tmp2. perhaps ctrl and ctrl_ext?
>
> > +
> > +       switch (pwm_ch) {
>
> As with pwm_type, pwm_ch could be an enum. That way you get warnings
> if you omit an option in your switch statement.
>
> > +       case PWMA:
> > +               tmp1 &= ~AST_PTCR_CTRL_SET_PWMA_TYPE_MASK;
> > +               tmp1 |= AST_PTCR_CTRL_SET_PWMA_TYPE(type);
> > +               ast_pwm_write(priv->base, tmp1, AST_PTCR_CTRL);
> > +
> > +               break;
>
> > +static int
> > +aspeed_create_pwm_port(struct device *dev, struct device_node *child,
> > +               void __iomem *base)
> > +{
> > +       struct device *hwmon;
> > +       u8 val;
> > +       struct ast_pwm_port_data *priv;
> > +
> > +       priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > +       if (!priv)
> > +               return -ENOMEM;
> > +
> > +       hwmon = devm_hwmon_device_register_with_groups(dev, "pwm_port",
>
> "aspeed_pwm"?
>
> > +               priv, pwm_dev_groups);
> > +       if (IS_ERR(hwmon)) {
> > +               dev_err(dev, "Failed to register hwmon device\n");
> > +               return PTR_ERR(hwmon);
> > +       }
> > +       priv->base = base;
> > +
> > +       of_property_read_u8(child, "pwm_port", &val);
> > +       priv->pwm_port = val;
> > +
> > +       of_property_read_u8(child, "pwm_enable", &val);
> > +       priv->pwm_enable = val;
> > +       ast_set_pwm_enable(priv, val);
> > +
> > +       of_property_read_u8(child, "pwm_type", &val);
> > +       priv->pwm_type = val;
> > +       ast_set_pwm_type(priv, val);
> > +
> > +       of_property_read_u8(child, "pwm_duty_cycle_percent", &val);
> > +       priv->pwm_duty_cycle = val;
> > +       ast_set_pwm_duty_cycle(priv, val);
> > +       return 0;
> > +}
> > +
> > +static int
> > +aspeed_ast2500_pwm_probe(struct platform_device *pdev)
> > +{
> > +       u32 buf[4];
> > +       struct device_node *np, *child;
> > +       struct resource *res;
> > +       u8 val;
> > +       int err;
> > +       struct ast_pwm_controller_data *priv;
> > +
> > +       np = pdev->dev.of_node;
> > +
> > +       priv = devm_kzalloc(&pdev->dev, sizeof(struct
> ast_pwm_controller_data),
> > +                       GFP_KERNEL);
> > +       if (!priv)
> > +               return -ENOMEM;
>
>
> Can you explain why you chose to allocate structure here? You don't
> seem to use it outside of the probe function which suggests it's
> unnecessary.
>
> You can just get the base address, map it in (ioremap) to configure
> the state and then discard the mapping in the probe.
>
> > +
> > +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +       if (res == NULL) {
> > +               return -ENOENT;
> > +       }
> > +
> > +       priv->base = devm_ioremap(&pdev->dev, res->start,
> resource_size(res));
> > +       if (!priv->base)
> > +               return -ENOMEM;
> > +
> > +       of_property_read_u8(np, "clock_enable", &val);
> > +       ast_set_pwm_clock_enable(priv, val);
> > +       of_property_read_u8(np, "clock_source", &val);
> > +       ast_set_pwm_clock_source(priv, val);
>
> This needs reworking. I will comment on the bindings which will lead
> to changes in this code.
>
> > +
> > +       of_property_read_u32_array(np, "typem_pwm_clock", buf, 4);
> > +       if (buf[0] == 1) {
> > +               ast_set_pwm_clock_division_l(priv, PWM_TYPE_M, buf[1]);
> > +               ast_set_pwm_clock_division_h(priv, PWM_TYPE_M, buf[2]);
> > +               ast_set_pwm_clock_unit(priv, PWM_TYPE_M, buf[3]);
> > +       }
> > +
> > +       of_property_read_u32_array(np, "typen_pwm_clock", buf, 4);
> > +       if (buf[0] == 1) {
> > +               ast_set_pwm_clock_division_l(priv, PWM_TYPE_N, buf[1]);
> > +               ast_set_pwm_clock_division_h(priv, PWM_TYPE_N, buf[2]);
> > +               ast_set_pwm_clock_unit(priv, PWM_TYPE_N, buf[3]);
> > +       }
> > +
> > +       of_property_read_u32_array(np, "typeo_pwm_clock", buf, 4);
> > +       if (buf[0] == 1) {
> > +               ast_set_pwm_clock_division_l(priv, PWM_TYPE_O, buf[1]);
> > +               ast_set_pwm_clock_division_h(priv, PWM_TYPE_O, buf[2]);
> > +               ast_set_pwm_clock_unit(priv, PWM_TYPE_O, buf[3]);
> > +       }
> > +
> > +       for_each_child_of_node(np, child) {
> > +               aspeed_create_pwm_port(&pdev->dev,
> > +                               child, priv->base);
> > +               of_node_put(child);
> > +       }
> > +       of_node_put(np);
> > +       return 0;
> > +}
> > +
> > +static int
> > +aspeed_ast2500_pwm_remove(struct platform_device *pdev)
> > +{
> > +       return 0;
> > +}
> > +
> > +static const struct of_device_id of_pwm_match_table[] = {
> > +       { .compatible = "aspeed,ast2500-pwm", },
>
> As discussed above, this should contain the ast2400 string as well.
>
> > +       {},
> > +};
> > +MODULE_DEVICE_TABLE(of, of_pwm_match_table);
> > +
> > +static struct platform_driver aspeed_ast2500_pwm_driver = {
> > +       .probe          = aspeed_ast2500_pwm_probe,
> > +       .remove         = aspeed_ast2500_pwm_remove,
>
> Your remove does nothing, you can omit it.
>
> > +       .driver         = {
> > +               .name   = "aspeed_ast2500_pwm",
> > +               .owner  = THIS_MODULE,
> > +               .of_match_table = of_pwm_match_table,
> > +       },
> > +};
> > +
> > +module_platform_driver(aspeed_ast2500_pwm_driver);
> > +
> > +MODULE_AUTHOR("Jaghathiswari Rankappagounder Natarajan <
> jaghu@google.com>");
> > +MODULE_DESCRIPTION("ASPEED AST2500 PWM device driver");
> > +MODULE_LICENSE("GPL");
> > diff --git a/drivers/hwmon/aspeed_ast2500_pwm.h b/drivers/hwmon/aspeed_
> ast2500_pwm.h
> > new file mode 100644
> > index 0000000..1986fd2
> > --- /dev/null
> > +++ b/drivers/hwmon/aspeed_ast2500_pwm.h
>
> Headers in the kernel are generally only used when we need to share
> details between parts of the kernel. Given there isn't a lot here, I
> think these definitions should be in the c file.
>
>
> > +#define DUTY_CTRL_PWM2_FALL_POINT                      (24)
> > +#define DUTY_CTRL_PWM2_FALL_POINT_MASK                 (0xff<<24)
> > +#define DUTY_CTRL_PWM2_RISE_POINT                      (16)
> > +#define DUTY_CTRL_PWM2_RISE_POINT_MASK                 (0xff<<16)
> > +#define DUTY_CTRL_PWM1_FALL_POINT                      (8)
> > +#define DUTY_CTRL_PWM1_FALL_POINT_MASK                 (0xff<<8)
>
> Try using GENMASK. For this it would be GENMASK(15, 8).
>
> Do you really need the mask definitions?
>
> > +#define DUTY_CTRL_PWM1_RISE_POINT                      (0)
> > +#define DUTY_CTRL_PWM1_RISE_POINT_MASK                 (0xff)
> > +
> > +/* AST_PTCR_CTRL : 0x00 - General Control Register */
> > +#define AST_PTCR_CTRL_SET_PWMD_TYPE(x)         ((x & 0x1) << 15 | \
> > +                                               (x & 0x2) << 6)
> > +#define AST_PTCR_CTRL_SET_PWMD_TYPE_MASK       ((0x1 << 7) | (0x1 <<
> 15))
>
> You can use BIT(7) | BIT(15).
>
> > +
> > +#define AST_PTCR_CTRL_SET_PWMC_TYPE(x)         ((x & 0x1) << 14 | \
> > +                                               (x & 0x2) << 5)
>
> > +#define        AST_PTCR_CTRL_PWMD                      (11)
> > +#define        AST_PTCR_CTRL_PWMD_EN           (0x1 << 11)
> > +#define        AST_PTCR_CTRL_PWMC                      (10)
> > +#define        AST_PTCR_CTRL_PWMC_EN           (0x1 << 10)
> > +#define        AST_PTCR_CTRL_PWMB                      (9)
> > +#define        AST_PTCR_CTRL_PWMB_EN           (0x1 << 9)
> > +#define        AST_PTCR_CTRL_PWMA                      (8)
> > +#define        AST_PTCR_CTRL_PWMA_EN           (0x1 << 8)
>
> Consider only having the bit defintiions or the _EN. One can be
> derived from the other.
>
> You don't need to guard the integers with ( ).
>
> > +
> > +/*0:24Mhz, 1:MCLK */
> > +#define        AST_PTCR_CTRL_CLK_SRC           0x2
> > +#define        AST_PTCR_CTRL_CLK_EN            0x1
>

--001a114b3608d5da4c05420899d4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Nov 8, 2016 at 11:15 PM, Joel Stanley <span dir=3D"ltr">&lt;<a =
href=3D"mailto:joel@jms.id.au" target=3D"_blank">joel@jms.id.au</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">Hello Jaghu,<br>
<span class=3D""><br>
On Wed, Nov 9, 2016 at 12:41 PM, Jaghathiswari Rankappagounder<br>
Natarajan &lt;<a href=3D"mailto:jaghu@google.com">jaghu@google.com</a>&gt; =
wrote:<br>
&gt; The ASPEED AST2500 PWM controller can support upto 8 PWM output ports.=
<br>
<br>
</span>I noticed that the ast2500 and ast2400 share the same PWM IP, so we<=
br>
can use the same driver for both. You should reflect this in the<br>
naming of the Kconfig, filename, commit message and the code itself.<br>
<span class=3D""><br>
&gt; There are three different PWM sources(types M, N and O)<br>
&gt; and each PWM output port can be assigned a particular PWM source.<br>
&gt; There is a sysfs file through which the user can control<br>
&gt; the duty cycle of a particular PWM port. The duty cycle can range from=
 0 to<br>
&gt; 100 percent.<br>
<br>
</span>Can you explain why this is a hwmon driver and not a pwm driver?</bl=
ockquote><div>The fan tacho controller shares some common registers with PW=
M=C2=A0</div><div>controller; the fan tacho controller needs to be a hwmon =
driver; so if PWM controller driver is a hwmon driver, then there is flexib=
ility to add fan tacho controller functionality to the same PWM driver and =
make it as common driver for PWM and fan tacho controller.=C2=A0</div><div>=
The duty_cycle value available in pwm =C2=A0sysfs interface needs to be con=
figured in nano seconds and the duty_cycle value available in hwmon sysfs i=
nterface can be configured with a integer value (ranging from 0 to 255; wit=
h 255 being 100 percent). So thought that hwmon sysfs interface is easier.<=
/div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D""><br>
&gt;<br>
&gt; v2:<br>
&gt; - Merged the drivers for PWM controller and PWM device as one PWM driv=
er.<br>
<br>
</span>Thanks for adding the changelog. This should go below the --, two<br=
>
lines lower. We do this to ensure the changelog is not part of the<br>
committed patch.<br>
<div><div class=3D"h5"><br>
&gt;<br>
&gt; Signed-off-by: Jaghathiswari Rankappagounder Natarajan &lt;<a href=3D"=
mailto:jaghu@google.com">jaghu@google.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/hwmon/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A05 +<br>
&gt;=C2=A0 drivers/hwmon/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 drivers/hwmon/aspeed_ast2500_<wbr>pwm.c | 662 ++++++++++++++++++=
++++++++++++<wbr>+++++++<br>
&gt;=C2=A0 drivers/hwmon/aspeed_ast2500_<wbr>pwm.h | 128 +++++++<br>
&gt;=C2=A0 4 files changed, 796 insertions(+), 1 deletion(-)<br>
&gt;=C2=A0 create mode 100644 drivers/hwmon/aspeed_ast2500_<wbr>pwm.c<br>
&gt;=C2=A0 create mode 100644 drivers/hwmon/aspeed_ast2500_<wbr>pwm.h<br>
&gt;<br>
&gt; diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig<br>
&gt; index 3b34ba9..7edd94e 100644<br>
&gt; --- a/drivers/hwmon/Kconfig<br>
&gt; +++ b/drivers/hwmon/Kconfig<br>
&gt; @@ -1800,6 +1800,11 @@ config SENSORS_ULTRA45<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This driver provides support f=
or the Ultra45 workstation environmental<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sensors.<br>
&gt;<br>
&gt; +config ASPEED_AST2500_PWM<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0tristate &quot;ASPEED AST2500 PWM driver&q=
uot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This driver provides support for AS=
PEED AST2500 PWM output ports.<br>
&gt; +<br>
&gt;=C2=A0 if ACPI<br>
&gt;<br>
&gt;=C2=A0 comment &quot;ACPI drivers&quot;<br>
&gt; diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile<br>
&gt; index c0f3201..23529c2 100644<br>
&gt; --- a/drivers/hwmon/Makefile<br>
&gt; +++ b/drivers/hwmon/Makefile<br>
&gt; @@ -163,7 +163,7 @@ obj-$(CONFIG_SENSORS_<wbr>W83L785TS)=C2=A0 =C2=A0 =
=C2=A0+=3D w83l785ts.o<br>
&gt;=C2=A0 obj-$(CONFIG_SENSORS_<wbr>W83L786NG)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
+=3D w83l786ng.o<br>
&gt;=C2=A0 obj-$(CONFIG_SENSORS_WM831X)=C2=A0 =C2=A0+=3D wm831x-hwmon.o<br>
&gt;=C2=A0 obj-$(CONFIG_SENSORS_WM8350)=C2=A0 =C2=A0+=3D wm8350-hwmon.o<br>
&gt; -<br>
&gt; +obj-$(CONFIG_ASPEED_AST2500_<wbr>PWM)=C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D =
aspeed_ast2500_pwm.o<br>
&gt;=C2=A0 obj-$(CONFIG_PMBUS)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=
=3D pmbus/<br>
&gt;<br>
&gt;=C2=A0 ccflags-$(CONFIG_HWMON_DEBUG_<wbr>CHIP) :=3D -DDEBUG<br>
&gt; diff --git a/drivers/hwmon/aspeed_<wbr>ast2500_pwm.c b/drivers/hwmon/a=
speed_<wbr>ast2500_pwm.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000..fda49d7<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/hwmon/aspeed_<wbr>ast2500_pwm.c<br>
&gt; @@ -0,0 +1,662 @@<br>
&gt; +/*<br>
&gt; + * Aspeed AST2500 PWM device driver<br>
<br>
</div></div>most of the time we don&#39;t add the name at the top of hte fi=
le.<br>
<span class=3D""><br>
<br>
&gt; + * * Copyright (c) 2016 Google, Inc<br>
&gt; + *<br>
&gt; + * * This program is free software; you can redistribute it and/or mo=
dify<br>
&gt; + * * it under the terms of the GNU General Public License version 2 a=
s<br>
&gt; + * * published by the Free Software Foundation.<br>
<br>
</span>Lose the second row of stars.<br>
<br>
The new drivers we contribute are v2 or later. This is your choice,<br>
but if there&#39;s no issue adding the or later it would be nice for all<br=
>
of the Aspeed code to be consistent.<br>
<span class=3D"">&gt; + *<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &lt;linux/platform_device.h&gt;<br>
&gt; +#include &lt;linux/kernel.h&gt;<br>
&gt; +#include &lt;linux/module.h&gt;<br>
&gt; +#include &lt;linux/of_platform.h&gt;<br>
&gt; +#include &lt;linux/of_device.h&gt;<br>
&gt; +#include &lt;linux/io.h&gt;<br>
&gt; +#include &lt;linux/hwmon-sysfs.h&gt;<br>
&gt; +#include &lt;linux/hwmon.h&gt;<br>
&gt; +#include &lt;linux/sysfs.h&gt;<br>
&gt; +<br>
&gt; +#include &quot;aspeed_pwm.h&quot;<br>
&gt; +<br>
&gt; +struct ast_pwm_port_data {<br>
<br>
</span>For better or worse, we&#39;ve settled on &quot;aspeed&quot; as the =
prefix for all<br>
of the drivers. Please use that instead of ast.<br>
<div><div class=3D"h5"><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 pwm_port;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 pwm_enable;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 pwm_type;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 pwm_duty_cycle;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0void __iomem *base;<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct ast_pwm_controller_data {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0void __iomem *base;<br>
&gt; +};<br>
&gt; +<br>
&gt; +static inline void<br>
&gt; +ast_pwm_write(void __iomem *base, u32 val, u32 reg)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0writel(val, base + reg);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static inline u32<br>
&gt; +ast_pwm_read(void __iomem *base, u32 reg)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val =3D readl(base + reg);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return val;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void<br>
&gt; +ast_set_pwm_clock_enable(<wbr>struct ast_pwm_controller_data *priv, u=
8 val)<br>
<br>
</div></div>val is a boolean.<br>
<span class=3D""><br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (val) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ast_pwm_write(=
priv-&gt;base,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0ast_pwm_read(priv-&gt;base, AST_PTCR_CTRL) |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0AST_PTCR_CTRL_CLK_EN, AST_PTCR_CTRL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ast_pwm_write(=
priv-&gt;base,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0ast_pwm_read(priv-&gt;base, AST_PTCR_CTRL) &amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0~AST_PTCR_CTRL_CLK_EN, AST_PTCR_CTRL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +}<br>
<br>
</span><span class=3D"">&gt; +static void<br>
&gt; +ast_set_pwm_enable(struct ast_pwm_port_data *priv, u8 enable)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 pwm_ch =3D priv-&gt;pwm_port;<br>
&gt; +<br>
<br>
</span>The switch statements where you read-modify-write are hard to read. =
I<br>
suggest reading the register value into a variable, modify it in your<br>
switch statement, and write it at the end. This makes it easier to<br>
read what operations you&#39;re performing on the bits.<br>
<br>
u32 reg =3D ast_pwm_read(priv-&gt;base, AST_PTCR_CTRL);<br>
<br>
switch (pwm_ch) {<br>
case PWMA:<br>
=C2=A0 =C2=A0 =C2=A0port =3D AST_PTCR_CTRL_PWMA_EN;<br>
=C2=A0 =C2=A0 =C2=A0break;<br>
case PWMB:<br>
=C2=A0 =C2=A0 =C2=A0port =3D AST_PTCR_CTRL_PWMB_EN;<br>
=C2=A0 =C2=A0 =C2=A0break;<br>
...<br>
}<br>
<br>
if (enable)<br>
=C2=A0 =C2=A0reg |=3D port;<br>
else<br>
=C2=A0 =C2=A0reg &amp;=3D ~port;<br>
<br>
ast_pwm_write(priv-&gt;base, reg, AST_PTCR_CTRL);<br>
<br>
I think this structure will make this more readable. You could store<br>
the AST_PTCR_CTRL_PWMx_EN value as priv-&gt;pwm_port, and lose the switch<b=
r>
statement all together.<br>
<br>
This suggestion wont work for the other switch statements obviously.<br>
Can you think of a representation that would allow you to look up the<br>
values without requiring a switch statement? Take a look at some of<br>
the other pwm drivers for inspiration.<br>
<span class=3D""><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (pwm_ch) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case PWMA:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (enable)<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0ast_pwm_write(priv-&gt;base,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ast_pwm_read(priv-&gt;base,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AST_PTCR_CTRL) |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AST_PTCR_CTRL_PWMA_EN,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AST_PTCR_CTRL);<br>
<br>
</span><span class=3D"">&gt; +static void<br>
&gt; +ast_set_pwm_type(struct ast_pwm_port_data *priv, u8 type)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 tmp1, tmp2;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 pwm_ch =3D priv-&gt;pwm_port;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0tmp1 =3D ast_pwm_read(priv-&gt;base, AST_P=
TCR_CTRL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0tmp2 =3D ast_pwm_read(priv-&gt;base, AST_P=
TCR_CTRL_EXT);<br>
<br>
</span>I think we can do better than tmp1 and tmp2. perhaps ctrl and ctrl_e=
xt?<br>
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (pwm_ch) {<br>
<br>
As with pwm_type, pwm_ch could be an enum. That way you get warnings<br>
if you omit an option in your switch statement.<br>
<span class=3D""><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case PWMA:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmp1 &amp;=3D =
~AST_PTCR_CTRL_SET_PWMA_TYPE_<wbr>MASK;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmp1 |=3D AST_=
PTCR_CTRL_SET_PWMA_TYPE(<wbr>type);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ast_pwm_write(=
priv-&gt;base, tmp1, AST_PTCR_CTRL);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
<br>
</span><span class=3D"">&gt; +static int<br>
&gt; +aspeed_create_pwm_port(struct device *dev, struct device_node *child,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void __iomem *=
base)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device *hwmon;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct ast_pwm_port_data *priv;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0priv =3D devm_kzalloc(dev, sizeof(*priv), =
GFP_KERNEL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!priv)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0hwmon =3D devm_hwmon_device_register_<wbr>=
with_groups(dev, &quot;pwm_port&quot;,<br>
<br>
</span>&quot;aspeed_pwm&quot;?<br>
<div><div class=3D"h5"><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0priv, pwm_dev_=
groups);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(hwmon)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &=
quot;Failed to register hwmon device\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR=
(hwmon);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0priv-&gt;base =3D base;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0of_property_read_u8(child, &quot;pwm_port&=
quot;, &amp;val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0priv-&gt;pwm_port =3D val;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0of_property_read_u8(child, &quot;pwm_enabl=
e&quot;, &amp;val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0priv-&gt;pwm_enable =3D val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ast_set_pwm_enable(priv, val);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0of_property_read_u8(child, &quot;pwm_type&=
quot;, &amp;val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0priv-&gt;pwm_type =3D val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ast_set_pwm_type(priv, val);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0of_property_read_u8(child, &quot;pwm_duty_=
cycle_percent&quot;, &amp;val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0priv-&gt;pwm_duty_cycle =3D val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ast_set_pwm_duty_cycle(priv, val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int<br>
&gt; +aspeed_ast2500_pwm_probe(<wbr>struct platform_device *pdev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 buf[4];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device_node *np, *child;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct resource *res;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int err;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct ast_pwm_controller_data *priv;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0np =3D pdev-&gt;dev.of_node;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0priv =3D devm_kzalloc(&amp;pdev-&gt;dev, s=
izeof(struct ast_pwm_controller_data),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0GFP_KERNEL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!priv)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM=
;<br>
<br>
<br>
</div></div>Can you explain why you chose to allocate structure here? You d=
on&#39;t<br>
seem to use it outside of the probe function which suggests it&#39;s<br>
unnecessary.<br>
<br>
You can just get the base address, map it in (ioremap) to configure<br>
the state and then discard the mapping in the probe.<br>
<span class=3D""><br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0res =3D platform_get_resource(pdev, IORESO=
URCE_MEM, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (res =3D=3D NULL) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOENT=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0priv-&gt;base =3D devm_ioremap(&amp;pdev-&=
gt;dev, res-&gt;start, resource_size(res));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!priv-&gt;base)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0of_property_read_u8(np, &quot;clock_enable=
&quot;, &amp;val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ast_set_pwm_clock_enable(priv, val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0of_property_read_u8(np, &quot;clock_source=
&quot;, &amp;val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ast_set_pwm_clock_source(priv, val);<br>
<br>
</span>This needs reworking. I will comment on the bindings which will lead=
<br>
to changes in this code.<br>
<div><div class=3D"h5"><br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0of_property_read_u32_array(np, &quot;typem=
_pwm_clock&quot;, buf, 4);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (buf[0] =3D=3D 1) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ast_set_pwm_cl=
ock_division_l(<wbr>priv, PWM_TYPE_M, buf[1]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ast_set_pwm_cl=
ock_division_h(<wbr>priv, PWM_TYPE_M, buf[2]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ast_set_pwm_cl=
ock_unit(priv, PWM_TYPE_M, buf[3]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0of_property_read_u32_array(np, &quot;typen=
_pwm_clock&quot;, buf, 4);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (buf[0] =3D=3D 1) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ast_set_pwm_cl=
ock_division_l(<wbr>priv, PWM_TYPE_N, buf[1]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ast_set_pwm_cl=
ock_division_h(<wbr>priv, PWM_TYPE_N, buf[2]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ast_set_pwm_cl=
ock_unit(priv, PWM_TYPE_N, buf[3]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0of_property_read_u32_array(np, &quot;typeo=
_pwm_clock&quot;, buf, 4);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (buf[0] =3D=3D 1) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ast_set_pwm_cl=
ock_division_l(<wbr>priv, PWM_TYPE_O, buf[1]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ast_set_pwm_cl=
ock_division_h(<wbr>priv, PWM_TYPE_O, buf[2]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ast_set_pwm_cl=
ock_unit(priv, PWM_TYPE_O, buf[3]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for_each_child_of_node(np, child) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0aspeed_create_=
pwm_port(&amp;pdev-&gt;<wbr>dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0child, priv-&gt;base);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0of_node_put(ch=
ild);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0of_node_put(np);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int<br>
&gt; +aspeed_ast2500_pwm_remove(<wbr>struct platform_device *pdev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct of_device_id of_pwm_match_table[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .compatible =3D &quot;aspeed,ast2500-pwm=
&quot;, },<br>
<br>
</div></div>As discussed above, this should contain the ast2400 string as w=
ell.<br>
<span class=3D""><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{},<br>
&gt; +};<br>
&gt; +MODULE_DEVICE_TABLE(of, of_pwm_match_table);<br>
&gt; +<br>
&gt; +static struct platform_driver aspeed_ast2500_pwm_driver =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.probe=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D aspeed_ast2500_pwm_probe,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.remove=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D aspeed_ast2500_pwm_remove,<br>
<br>
</span>Your remove does nothing, you can omit it.<br>
<span class=3D""><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.driver=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name=C2=A0 =
=C2=A0=3D &quot;aspeed_ast2500_pwm&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.owner=C2=A0 =
=3D THIS_MODULE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.of_match_tabl=
e =3D of_pwm_match_table,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; +};<br>
&gt; +<br>
&gt; +module_platform_driver(<wbr>aspeed_ast2500_pwm_driver);<br>
&gt; +<br>
&gt; +MODULE_AUTHOR(&quot;Jaghathiswari Rankappagounder Natarajan &lt;<a hr=
ef=3D"mailto:jaghu@google.com">jaghu@google.com</a>&gt;&quot;);<br>
&gt; +MODULE_DESCRIPTION(&quot;ASPEED AST2500 PWM device driver&quot;);<br>
&gt; +MODULE_LICENSE(&quot;GPL&quot;);<br>
&gt; diff --git a/drivers/hwmon/aspeed_<wbr>ast2500_pwm.h b/drivers/hwmon/a=
speed_<wbr>ast2500_pwm.h<br>
&gt; new file mode 100644<br>
&gt; index 0000000..1986fd2<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/hwmon/aspeed_<wbr>ast2500_pwm.h<br>
<br>
</span>Headers in the kernel are generally only used when we need to share<=
br>
details between parts of the kernel. Given there isn&#39;t a lot here, I<br=
>
think these definitions should be in the c file.<br>
<span class=3D""><br>
<br>
&gt; +#define DUTY_CTRL_PWM2_FALL_POINT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (24)<br>
&gt; +#define DUTY_CTRL_PWM2_FALL_POINT_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0xff&lt;&lt;24)<br>
&gt; +#define DUTY_CTRL_PWM2_RISE_POINT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (16)<br>
&gt; +#define DUTY_CTRL_PWM2_RISE_POINT_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0xff&lt;&lt;16)<br>
&gt; +#define DUTY_CTRL_PWM1_FALL_POINT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (8)<br>
&gt; +#define DUTY_CTRL_PWM1_FALL_POINT_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0xff&lt;&lt;8)<br>
<br>
</span>Try using GENMASK. For this it would be GENMASK(15, 8).<br>
<br>
Do you really need the mask definitions?<br>
<span class=3D""><br>
&gt; +#define DUTY_CTRL_PWM1_RISE_POINT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0)<br>
&gt; +#define DUTY_CTRL_PWM1_RISE_POINT_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0xff)<br>
&gt; +<br>
&gt; +/* AST_PTCR_CTRL : 0x00 - General Control Register */<br>
&gt; +#define AST_PTCR_CTRL_SET_PWMD_TYPE(x)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0((x &amp; 0x1) &lt;&lt; 15 | \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0(x &amp; 0x2) &lt;&lt; 6)<br>
&gt; +#define AST_PTCR_CTRL_SET_PWMD_TYPE_<wbr>MASK=C2=A0 =C2=A0 =C2=A0 =C2=
=A0((0x1 &lt;&lt; 7) | (0x1 &lt;&lt; 15))<br>
<br>
</span>You can use BIT(7) | BIT(15).<br>
<span class=3D""><br>
&gt; +<br>
&gt; +#define AST_PTCR_CTRL_SET_PWMC_TYPE(x)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0((x &amp; 0x1) &lt;&lt; 14 | \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0(x &amp; 0x2) &lt;&lt; 5)<br>
<br>
</span>&gt; +#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 AST_PTCR_CTRL_PWMD=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (11)<=
br>
<span class=3D"">&gt; +#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 AST_PTCR_CTRL_PWM=
D_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x1 &lt;&lt; 11)<br>
&gt; +#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 AST_PTCR_CTRL_PWMC=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (10)<br>
&gt; +#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 AST_PTCR_CTRL_PWMC_EN=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x1 &lt;&lt; 10)<br>
&gt; +#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 AST_PTCR_CTRL_PWMB=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (9)<br>
&gt; +#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 AST_PTCR_CTRL_PWMB_EN=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x1 &lt;&lt; 9)<br>
&gt; +#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 AST_PTCR_CTRL_PWMA=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (8)<br>
&gt; +#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 AST_PTCR_CTRL_PWMA_EN=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x1 &lt;&lt; 8)<br>
<br>
</span>Consider only having the bit defintiions or the _EN. One can be<br>
derived from the other.<br>
<br>
You don&#39;t need to guard the integers with ( ).<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; +<br>
&gt; +/*0:24Mhz, 1:MCLK */<br>
&gt; +#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 AST_PTCR_CTRL_CLK_SRC=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A00x2<br>
&gt; +#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 AST_PTCR_CTRL_CLK_EN=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x1<br>
</div></div></blockquote></div><br></div></div>

--001a114b3608d5da4c05420899d4--
