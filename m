Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x241.google.com (mail-oi0-x241.google.com
 [IPv6:2607:f8b0:4003:c06::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tDHXj3GcFzDvVx
 for <openbmc@lists.ozlabs.org>; Wed,  9 Nov 2016 18:16:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="VlcAe255"; 
 dkim-atps=neutral
Received: by mail-oi0-x241.google.com with SMTP id v84so4792425oie.2
 for <openbmc@lists.ozlabs.org>; Tue, 08 Nov 2016 23:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=S9GjHl4GhKK1YM7HnoiTRWGrMXPM9hrEag3tY5kYh0w=;
 b=VlcAe2553AJ0HyGgZchLrx8QTkPxSYasJSrDkwu4THZ+jjM+wwVyyyj1rsWHHovOTz
 M3bcefORub9lkx8T3cx6996lcI7oku4aJrxP9PCscPDuZNUs6E7UP70wo+/d5WCcdoG/
 h/nbA3d0vhD6qPPpL/7CI/o6MYDcXiXbc2OTKc82GDOMpGn3QMgswWDW4GjQl8AYbav7
 KDtoRmeWwEVJ1i+Gg+o3r1hEwwj60QwgADNs7mtv5aPyQWBt3wB3c+uxxYZDVyj6aUhN
 WTK1xsJrftTr3/e6HiS3xOhdVea7ZtouaUtBzImiqnP/FC1Z7VGu2Ir9jmQHKLOLlu5z
 xzAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=S9GjHl4GhKK1YM7HnoiTRWGrMXPM9hrEag3tY5kYh0w=;
 b=cftysL3ujhJasyo/x+M1I9YsLU8K06sZlpvha0s0pH5Rj72+ST5uUrK4/3YIm0d5/u
 HcU4baLFX2eEjqIEHpOCfGZcCYtzGDj4Z5xzKXl8H9ukx/3j8u8XTUq4MMzq6lnU+KtM
 52EAg5tvP7NFY9gcgWCiA5RrtG7zzy8Pjv8XeuJZDFspqFTX3ocxluB6jruOPRaEdAh8
 WDTzNs45J0nVKpCaH9lRxioyBy66W8lwXc3oxZe8xckm/xxcPti/RPJI73VePPGZF+xL
 J5Rhge311hia3kpomRBPIBC206jbm6j4AR0tak09JnS8CDzuPPCrqLxy8186GxLFfTza
 6HFg==
X-Gm-Message-State: ABUngveq7wGcWO9kmjRewCh1n92qvpAur5d8DR1hSlmcsqaXOKwOp6VoWGXSxreH6Gend5T6PAgWQqHlsXwRTA==
X-Received: by 10.202.114.129 with SMTP id p123mr11645465oic.132.1478675778910; 
 Tue, 08 Nov 2016 23:16:18 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Tue, 8 Nov 2016 23:15:58 -0800 (PST)
In-Reply-To: <1478657505-23109-3-git-send-email-jaghu@google.com>
References: <1478657505-23109-1-git-send-email-jaghu@google.com>
 <1478657505-23109-3-git-send-email-jaghu@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 9 Nov 2016 17:45:58 +1030
X-Google-Sender-Auth: REeb-XH1zoV8i0BSxJlobtl0dek
Message-ID: <CACPK8XfyNvU2ALoGBc9k6xnB83mFaLdLRpG5pe1DOmbX08Jvew@mail.gmail.com>
Subject: Re: [PATCH linux v2 2/3] drivers: hwmon: ASPEED AST2500 PWM driver
To: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 09 Nov 2016 07:16:22 -0000

Hello Jaghu,

On Wed, Nov 9, 2016 at 12:41 PM, Jaghathiswari Rankappagounder
Natarajan <jaghu@google.com> wrote:
> The ASPEED AST2500 PWM controller can support upto 8 PWM output ports.

I noticed that the ast2500 and ast2400 share the same PWM IP, so we
can use the same driver for both. You should reflect this in the
naming of the Kconfig, filename, commit message and the code itself.

> There are three different PWM sources(types M, N and O)
> and each PWM output port can be assigned a particular PWM source.
> There is a sysfs file through which the user can control
> the duty cycle of a particular PWM port. The duty cycle can range from 0 to
> 100 percent.

Can you explain why this is a hwmon driver and not a pwm driver?

>
> v2:
> - Merged the drivers for PWM controller and PWM device as one PWM driver.

Thanks for adding the changelog. This should go below the --, two
lines lower. We do this to ensure the changelog is not part of the
committed patch.

>
> Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
> ---
>  drivers/hwmon/Kconfig              |   5 +
>  drivers/hwmon/Makefile             |   2 +-
>  drivers/hwmon/aspeed_ast2500_pwm.c | 662 +++++++++++++++++++++++++++++++++++++
>  drivers/hwmon/aspeed_ast2500_pwm.h | 128 +++++++
>  4 files changed, 796 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/hwmon/aspeed_ast2500_pwm.c
>  create mode 100644 drivers/hwmon/aspeed_ast2500_pwm.h
>
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 3b34ba9..7edd94e 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1800,6 +1800,11 @@ config SENSORS_ULTRA45
>           This driver provides support for the Ultra45 workstation environmental
>           sensors.
>
> +config ASPEED_AST2500_PWM
> +       tristate "ASPEED AST2500 PWM driver"
> +       help
> +         This driver provides support for ASPEED AST2500 PWM output ports.
> +
>  if ACPI
>
>  comment "ACPI drivers"
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index c0f3201..23529c2 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -163,7 +163,7 @@ obj-$(CONFIG_SENSORS_W83L785TS)     += w83l785ts.o
>  obj-$(CONFIG_SENSORS_W83L786NG)        += w83l786ng.o
>  obj-$(CONFIG_SENSORS_WM831X)   += wm831x-hwmon.o
>  obj-$(CONFIG_SENSORS_WM8350)   += wm8350-hwmon.o
> -
> +obj-$(CONFIG_ASPEED_AST2500_PWM)       += aspeed_ast2500_pwm.o
>  obj-$(CONFIG_PMBUS)            += pmbus/
>
>  ccflags-$(CONFIG_HWMON_DEBUG_CHIP) := -DDEBUG
> diff --git a/drivers/hwmon/aspeed_ast2500_pwm.c b/drivers/hwmon/aspeed_ast2500_pwm.c
> new file mode 100644
> index 0000000..fda49d7
> --- /dev/null
> +++ b/drivers/hwmon/aspeed_ast2500_pwm.c
> @@ -0,0 +1,662 @@
> +/*
> + * Aspeed AST2500 PWM device driver

most of the time we don't add the name at the top of hte file.


> + * * Copyright (c) 2016 Google, Inc
> + *
> + * * This program is free software; you can redistribute it and/or modify
> + * * it under the terms of the GNU General Public License version 2 as
> + * * published by the Free Software Foundation.

Lose the second row of stars.

The new drivers we contribute are v2 or later. This is your choice,
but if there's no issue adding the or later it would be nice for all
of the Aspeed code to be consistent.
> + *
> + */
> +
> +#include <linux/platform_device.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of_platform.h>
> +#include <linux/of_device.h>
> +#include <linux/io.h>
> +#include <linux/hwmon-sysfs.h>
> +#include <linux/hwmon.h>
> +#include <linux/sysfs.h>
> +
> +#include "aspeed_pwm.h"
> +
> +struct ast_pwm_port_data {

For better or worse, we've settled on "aspeed" as the prefix for all
of the drivers. Please use that instead of ast.

> +       u8 pwm_port;
> +       u8 pwm_enable;
> +       u8 pwm_type;
> +       u8 pwm_duty_cycle;
> +       void __iomem *base;
> +};
> +
> +struct ast_pwm_controller_data {
> +       void __iomem *base;
> +};
> +
> +static inline void
> +ast_pwm_write(void __iomem *base, u32 val, u32 reg)
> +{
> +       writel(val, base + reg);
> +}
> +
> +static inline u32
> +ast_pwm_read(void __iomem *base, u32 reg)
> +{
> +       u32 val = readl(base + reg);
> +       return val;
> +}
> +
> +static void
> +ast_set_pwm_clock_enable(struct ast_pwm_controller_data *priv, u8 val)

val is a boolean.

> +{
> +       if (val) {
> +               ast_pwm_write(priv->base,
> +                       ast_pwm_read(priv->base, AST_PTCR_CTRL) |
> +                       AST_PTCR_CTRL_CLK_EN, AST_PTCR_CTRL);
> +       } else {
> +               ast_pwm_write(priv->base,
> +                       ast_pwm_read(priv->base, AST_PTCR_CTRL) &
> +                       ~AST_PTCR_CTRL_CLK_EN, AST_PTCR_CTRL);
> +       }
> +}

> +static void
> +ast_set_pwm_enable(struct ast_pwm_port_data *priv, u8 enable)
> +{
> +       u8 pwm_ch = priv->pwm_port;
> +

The switch statements where you read-modify-write are hard to read. I
suggest reading the register value into a variable, modify it in your
switch statement, and write it at the end. This makes it easier to
read what operations you're performing on the bits.

u32 reg = ast_pwm_read(priv->base, AST_PTCR_CTRL);

switch (pwm_ch) {
case PWMA:
     port = AST_PTCR_CTRL_PWMA_EN;
     break;
case PWMB:
     port = AST_PTCR_CTRL_PWMB_EN;
     break;
...
}

if (enable)
   reg |= port;
else
   reg &= ~port;

ast_pwm_write(priv->base, reg, AST_PTCR_CTRL);

I think this structure will make this more readable. You could store
the AST_PTCR_CTRL_PWMx_EN value as priv->pwm_port, and lose the switch
statement all together.

This suggestion wont work for the other switch statements obviously.
Can you think of a representation that would allow you to look up the
values without requiring a switch statement? Take a look at some of
the other pwm drivers for inspiration.

> +       switch (pwm_ch) {
> +       case PWMA:
> +               if (enable)
> +                       ast_pwm_write(priv->base,
> +                               ast_pwm_read(priv->base,
> +                               AST_PTCR_CTRL) |
> +                               AST_PTCR_CTRL_PWMA_EN,
> +                               AST_PTCR_CTRL);

> +static void
> +ast_set_pwm_type(struct ast_pwm_port_data *priv, u8 type)
> +{
> +       u32 tmp1, tmp2;
> +       u8 pwm_ch = priv->pwm_port;
> +
> +       tmp1 = ast_pwm_read(priv->base, AST_PTCR_CTRL);
> +       tmp2 = ast_pwm_read(priv->base, AST_PTCR_CTRL_EXT);

I think we can do better than tmp1 and tmp2. perhaps ctrl and ctrl_ext?

> +
> +       switch (pwm_ch) {

As with pwm_type, pwm_ch could be an enum. That way you get warnings
if you omit an option in your switch statement.

> +       case PWMA:
> +               tmp1 &= ~AST_PTCR_CTRL_SET_PWMA_TYPE_MASK;
> +               tmp1 |= AST_PTCR_CTRL_SET_PWMA_TYPE(type);
> +               ast_pwm_write(priv->base, tmp1, AST_PTCR_CTRL);
> +
> +               break;

> +static int
> +aspeed_create_pwm_port(struct device *dev, struct device_node *child,
> +               void __iomem *base)
> +{
> +       struct device *hwmon;
> +       u8 val;
> +       struct ast_pwm_port_data *priv;
> +
> +       priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +
> +       hwmon = devm_hwmon_device_register_with_groups(dev, "pwm_port",

"aspeed_pwm"?

> +               priv, pwm_dev_groups);
> +       if (IS_ERR(hwmon)) {
> +               dev_err(dev, "Failed to register hwmon device\n");
> +               return PTR_ERR(hwmon);
> +       }
> +       priv->base = base;
> +
> +       of_property_read_u8(child, "pwm_port", &val);
> +       priv->pwm_port = val;
> +
> +       of_property_read_u8(child, "pwm_enable", &val);
> +       priv->pwm_enable = val;
> +       ast_set_pwm_enable(priv, val);
> +
> +       of_property_read_u8(child, "pwm_type", &val);
> +       priv->pwm_type = val;
> +       ast_set_pwm_type(priv, val);
> +
> +       of_property_read_u8(child, "pwm_duty_cycle_percent", &val);
> +       priv->pwm_duty_cycle = val;
> +       ast_set_pwm_duty_cycle(priv, val);
> +       return 0;
> +}
> +
> +static int
> +aspeed_ast2500_pwm_probe(struct platform_device *pdev)
> +{
> +       u32 buf[4];
> +       struct device_node *np, *child;
> +       struct resource *res;
> +       u8 val;
> +       int err;
> +       struct ast_pwm_controller_data *priv;
> +
> +       np = pdev->dev.of_node;
> +
> +       priv = devm_kzalloc(&pdev->dev, sizeof(struct ast_pwm_controller_data),
> +                       GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;


Can you explain why you chose to allocate structure here? You don't
seem to use it outside of the probe function which suggests it's
unnecessary.

You can just get the base address, map it in (ioremap) to configure
the state and then discard the mapping in the probe.

> +
> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       if (res == NULL) {
> +               return -ENOENT;
> +       }
> +
> +       priv->base = devm_ioremap(&pdev->dev, res->start, resource_size(res));
> +       if (!priv->base)
> +               return -ENOMEM;
> +
> +       of_property_read_u8(np, "clock_enable", &val);
> +       ast_set_pwm_clock_enable(priv, val);
> +       of_property_read_u8(np, "clock_source", &val);
> +       ast_set_pwm_clock_source(priv, val);

This needs reworking. I will comment on the bindings which will lead
to changes in this code.

> +
> +       of_property_read_u32_array(np, "typem_pwm_clock", buf, 4);
> +       if (buf[0] == 1) {
> +               ast_set_pwm_clock_division_l(priv, PWM_TYPE_M, buf[1]);
> +               ast_set_pwm_clock_division_h(priv, PWM_TYPE_M, buf[2]);
> +               ast_set_pwm_clock_unit(priv, PWM_TYPE_M, buf[3]);
> +       }
> +
> +       of_property_read_u32_array(np, "typen_pwm_clock", buf, 4);
> +       if (buf[0] == 1) {
> +               ast_set_pwm_clock_division_l(priv, PWM_TYPE_N, buf[1]);
> +               ast_set_pwm_clock_division_h(priv, PWM_TYPE_N, buf[2]);
> +               ast_set_pwm_clock_unit(priv, PWM_TYPE_N, buf[3]);
> +       }
> +
> +       of_property_read_u32_array(np, "typeo_pwm_clock", buf, 4);
> +       if (buf[0] == 1) {
> +               ast_set_pwm_clock_division_l(priv, PWM_TYPE_O, buf[1]);
> +               ast_set_pwm_clock_division_h(priv, PWM_TYPE_O, buf[2]);
> +               ast_set_pwm_clock_unit(priv, PWM_TYPE_O, buf[3]);
> +       }
> +
> +       for_each_child_of_node(np, child) {
> +               aspeed_create_pwm_port(&pdev->dev,
> +                               child, priv->base);
> +               of_node_put(child);
> +       }
> +       of_node_put(np);
> +       return 0;
> +}
> +
> +static int
> +aspeed_ast2500_pwm_remove(struct platform_device *pdev)
> +{
> +       return 0;
> +}
> +
> +static const struct of_device_id of_pwm_match_table[] = {
> +       { .compatible = "aspeed,ast2500-pwm", },

As discussed above, this should contain the ast2400 string as well.

> +       {},
> +};
> +MODULE_DEVICE_TABLE(of, of_pwm_match_table);
> +
> +static struct platform_driver aspeed_ast2500_pwm_driver = {
> +       .probe          = aspeed_ast2500_pwm_probe,
> +       .remove         = aspeed_ast2500_pwm_remove,

Your remove does nothing, you can omit it.

> +       .driver         = {
> +               .name   = "aspeed_ast2500_pwm",
> +               .owner  = THIS_MODULE,
> +               .of_match_table = of_pwm_match_table,
> +       },
> +};
> +
> +module_platform_driver(aspeed_ast2500_pwm_driver);
> +
> +MODULE_AUTHOR("Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>");
> +MODULE_DESCRIPTION("ASPEED AST2500 PWM device driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/hwmon/aspeed_ast2500_pwm.h b/drivers/hwmon/aspeed_ast2500_pwm.h
> new file mode 100644
> index 0000000..1986fd2
> --- /dev/null
> +++ b/drivers/hwmon/aspeed_ast2500_pwm.h

Headers in the kernel are generally only used when we need to share
details between parts of the kernel. Given there isn't a lot here, I
think these definitions should be in the c file.


> +#define DUTY_CTRL_PWM2_FALL_POINT                      (24)
> +#define DUTY_CTRL_PWM2_FALL_POINT_MASK                 (0xff<<24)
> +#define DUTY_CTRL_PWM2_RISE_POINT                      (16)
> +#define DUTY_CTRL_PWM2_RISE_POINT_MASK                 (0xff<<16)
> +#define DUTY_CTRL_PWM1_FALL_POINT                      (8)
> +#define DUTY_CTRL_PWM1_FALL_POINT_MASK                 (0xff<<8)

Try using GENMASK. For this it would be GENMASK(15, 8).

Do you really need the mask definitions?

> +#define DUTY_CTRL_PWM1_RISE_POINT                      (0)
> +#define DUTY_CTRL_PWM1_RISE_POINT_MASK                 (0xff)
> +
> +/* AST_PTCR_CTRL : 0x00 - General Control Register */
> +#define AST_PTCR_CTRL_SET_PWMD_TYPE(x)         ((x & 0x1) << 15 | \
> +                                               (x & 0x2) << 6)
> +#define AST_PTCR_CTRL_SET_PWMD_TYPE_MASK       ((0x1 << 7) | (0x1 << 15))

You can use BIT(7) | BIT(15).

> +
> +#define AST_PTCR_CTRL_SET_PWMC_TYPE(x)         ((x & 0x1) << 14 | \
> +                                               (x & 0x2) << 5)

> +#define        AST_PTCR_CTRL_PWMD                      (11)
> +#define        AST_PTCR_CTRL_PWMD_EN           (0x1 << 11)
> +#define        AST_PTCR_CTRL_PWMC                      (10)
> +#define        AST_PTCR_CTRL_PWMC_EN           (0x1 << 10)
> +#define        AST_PTCR_CTRL_PWMB                      (9)
> +#define        AST_PTCR_CTRL_PWMB_EN           (0x1 << 9)
> +#define        AST_PTCR_CTRL_PWMA                      (8)
> +#define        AST_PTCR_CTRL_PWMA_EN           (0x1 << 8)

Consider only having the bit defintiions or the _EN. One can be
derived from the other.

You don't need to guard the integers with ( ).

> +
> +/*0:24Mhz, 1:MCLK */
> +#define        AST_PTCR_CTRL_CLK_SRC           0x2
> +#define        AST_PTCR_CTRL_CLK_EN            0x1
