Return-Path: <raltherr@google.com>
Received: from mail-yw0-x236.google.com (mail-yw0-x236.google.com
 [IPv6:2607:f8b0:4002:c05::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t4lzq5X54zDvQ7
 for <openbmc@lists.ozlabs.org>; Fri, 28 Oct 2016 12:10:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=CN2sGDYy; 
 dkim-atps=neutral
Received: by mail-yw0-x236.google.com with SMTP id p22so51660188ywe.0
 for <openbmc@lists.ozlabs.org>; Thu, 27 Oct 2016 18:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=DMqTsgCcn5AD8uKeu5jZwb+uMk7MhN//NNJyoU18bJs=;
 b=CN2sGDYyt/FoQl4LJH2opdvKiYFpMReWq8hqQv1CPTLvTwwgGDlychHrirM0Orf8hR
 rgtKSjBbgncv3aN5iInAtsC6pT85XcxntbXhgX95mXccco6k7iP13BQqlQ1AoOWzF5TG
 ZoOVC4yIsXp8Z0XWADIJUmjjizf8km3RtGynOeW6Jg11EM+XX5N7N8LzsQ8YnePLgVo7
 zG9TNe4Ya9dVeLOCZndHjF9cFlbfNU6dJLiP+kbRFzIwKYeefu54p/TRxBnbGJ+vCslO
 tfjH2AwAgik5mgrb7u2vXgsW1CLzCgX9ki4HNluLbDPK2getwfxuWeoyFMqDzC7jDhLo
 U9ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=DMqTsgCcn5AD8uKeu5jZwb+uMk7MhN//NNJyoU18bJs=;
 b=fg3OWgFm7kZ8hJcRTlBFpVPVSVjfkjOTX7XhkzOWC5cAMrQafx3+Fda8jYecpCU/Wv
 Es828IUOQ5XLUquA9x7p0oLQ3cvqMTy1wkdXh0Yh9hEixMc1MvYeSXAjBhXiSgsU5+XK
 oHCDkbzPyFN1FQtlTh6Z691DdjE9iIoO9UdzyH7FLezlP2eR/Tx7ukcRggteZD1mvTa6
 Lp3MBo+gHopTLMFJ/4+QsXOjDJAh1X+L3e3m36OwTh2Y79pHVMNijAlyr/VaTKCK6w4w
 rCekx9ocfVZQX41uPaRJUkfmn6Kg9G4ypmbL0+lERUdudexYR0UbdP5u/D5YQ2qUVzhV
 6w+Q==
X-Gm-Message-State: ABUngvfGbIAsPEncI3zLatct+L7zuJBwm6Iba5PLrYsMT23TbIxozhzp2xSHl0q2UNZ66KZCS1b2btQsGc7PmSHU
X-Received: by 10.129.159.15 with SMTP id w15mr11225914ywg.240.1477617012798; 
 Thu, 27 Oct 2016 18:10:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.160.4 with HTTP; Thu, 27 Oct 2016 18:10:12 -0700 (PDT)
In-Reply-To: <1477611622-28120-2-git-send-email-jaghu@google.com>
References: <1477611622-28120-1-git-send-email-jaghu@google.com>
 <1477611622-28120-2-git-send-email-jaghu@google.com>
From: Rick Altherr <raltherr@google.com>
Date: Thu, 27 Oct 2016 18:10:12 -0700
Message-ID: <CAPLgG=msnp0F7vEk61Nye78Mvv2rh_4z51QY5t30E+QhcZiR9A@mail.gmail.com>
Subject: Re: [PATCH linux v1 1/3] drivers: hwmon: Support for Aspeed PWM
 controller driver
To: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=94eb2c0bd9102a0bb2053fe28525
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
X-List-Received-Date: Fri, 28 Oct 2016 01:10:19 -0000

--94eb2c0bd9102a0bb2053fe28525
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 27, 2016 at 4:40 PM, Jaghathiswari Rankappagounder Natarajan <
jaghu@google.com> wrote:

> Support to give all the common information required by all the PWM
> channels.
>
>
This description doesn't help me understand what problem you are solving.
From Section 2, Describe Your Changes, of
https://www.kernel.org/doc/Documentation/SubmittingPatches: "Convince the
reviewer that there is a problem worth fixing and that it makes sense for
them to read past the first paragraph."  I suggest reading that whole
section.


> Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
> ---
>  .../bindings/hwmon/aspeed_pwm_controller.txt       |  33 +++
>  drivers/hwmon/Kconfig                              |   5 +
>  drivers/hwmon/Makefile                             |   2 +-
>  drivers/hwmon/aspeed_pwm.h                         | 159 ++++++++++++++
>  drivers/hwmon/aspeed_pwm_controller.c              | 237
> +++++++++++++++++++++
>  5 files changed, 435 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed_pwm_
> controller.txt
>  create mode 100644 drivers/hwmon/aspeed_pwm.h
>  create mode 100644 drivers/hwmon/aspeed_pwm_controller.c
>
> diff --git a/Documentation/devicetree/bindings/hwmon/aspeed_pwm_controller.txt
> b/Documentation/devicetree/bindings/hwmon/aspeed_pwm_controller.txt
> new file mode 100644
> index 0000000..2b5c895
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/aspeed_pwm_controller.txt
>

Per
https://www.kernel.org/doc/Documentation/devicetree/bindings/submitting-patches.txt,
the binding documentation updates should be a separate patch.


> @@ -0,0 +1,33 @@
> +Aspeed PWM controller driver
>

You're implying that there is only one PWM controller they have _and_
_will_ ever use.  Including AST2400/2500 in the description puts some
reasonable bounds and directs people to the correct SoCs that will have
documentation in their datasheets.


> +
> +Required properties:
> +- reg : address and length of the register set for the device.
> +- #address-cells : should be 1.
> +- #size-cells : should be 1.
> +- compatible : should be "aspeed-pwm-controller".
>

I thought the format was "<manufacturer>,<chip>-<device>" so
"aspeed,ast2500-pwm"


> +- clock_enable : option to enable PWM and fan tach clock. should be 1.
> +- clock_source : option for clock source selection. 0 indicates 24MHz
> clock
> +  and 1 indicates MCLK.
> +- typem_pwm_clock : This array contains 3 values. The first value
> indicates
> +  the type M PWM clock division L bit. The second value indicates type M
> PWM
> +  clock divison H bit. The third value indicates type M PWM period bit.
>

I have no idea what any of this means.  What is type M clock division?  How
do I determine the L, H, and period bits?


> +
> +Optional properties:
> +- typen_pwm_clock : This array contains 3 values. The first value
> indicates
> +  the type N PWM clock division L bit. The second value indicates type N
> PWM
> +  clock division H bit. The third value indicates type N PWM period bit.
> +- typeo_pwm_clock : This array contains 3 values. The first value
> indicates
> +  the type O PWM clock division L bit. The second value indicates type O
> PWM
> +  clock divison H bit. The third value indicates type O PWM period bit.
> +
> +Examples:
> +
> +pwm_controller {
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               reg = <0x1E786000 0x78>;
> +               compatible = "aspeed-pwm-controller";
> +               clock_enable = /bits/ 8 <0x01>;
> +               clock_source = /bits/ 8 <0x00>;
> +               typem_pwm_clock = <5 0 95>;
> +};
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index d4de8d5..59d6ea4 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1803,6 +1803,11 @@ config SENSORS_WM8350
>           This driver can also be built as a module.  If so, the module
>           will be called wm8350-hwmon.
>
> +config ASPEED_PWM_CONTROLLER
> +       tristate "Aspeed PWM controller"
> +       help
> +         This driver provides support for ASPEED PWM controller.
> +
>  config SENSORS_ULTRA45
>         tristate "Sun Ultra45 PIC16F747"
>         depends on SPARC64
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index 4455478..83156f8 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -164,7 +164,7 @@ obj-$(CONFIG_SENSORS_W83L785TS)     += w83l785ts.o
>  obj-$(CONFIG_SENSORS_W83L786NG)        += w83l786ng.o
>  obj-$(CONFIG_SENSORS_WM831X)   += wm831x-hwmon.o
>  obj-$(CONFIG_SENSORS_WM8350)   += wm8350-hwmon.o
> -
> +obj-$(CONFIG_ASPEED_PWM_CONTROLLER)    += aspeed_pwm_controller.o
>  obj-$(CONFIG_PMBUS)            += pmbus/
>
>  ccflags-$(CONFIG_HWMON_DEBUG_CHIP) := -DDEBUG
> diff --git a/drivers/hwmon/aspeed_pwm.h b/drivers/hwmon/aspeed_pwm.h
> new file mode 100644
> index 0000000..b3dd6b1
> --- /dev/null
> +++ b/drivers/hwmon/aspeed_pwm.h
> @@ -0,0 +1,159 @@
> +/*
> + * Aspeed PWM header file
> + * * Copyright (c) 2016 Google, Inc
> + *
> + * * This program is free software; you can redistribute it and/or modify
> + * * it under the terms of the GNU General Public License version 2 as
> + * * published by the Free Software Foundation.
> + *
> + */
> +
> +#ifndef __ASPEED_PWM_H
> +#define __ASPEED_PWM_H __FILE__
> +
> +/* AST PWM & FAN Register Definition */
> +#define AST_PTCR_CTRL                  0x00
> +#define AST_PTCR_CLK_CTRL              0x04
> +#define AST_PTCR_DUTY0_CTRL            0x08
> +#define AST_PTCR_DUTY1_CTRL            0x0c
> +#define AST_PTCR_TYPEM_CTRL0           0x10
> +#define AST_PTCR_TYPEM_CTRL1           0x14
> +#define AST_PTCR_TYPEN_CTRL0           0x18
> +#define AST_PTCR_TYPEN_CTRL1           0x1c
> +#define AST_PTCR_TACH_SOURCE           0x20
> +#define AST_PTCR_TRIGGER               0x28
> +#define AST_PTCR_RESULT                        0x2c
> +#define AST_PTCR_INTR_CTRL             0x30
> +#define AST_PTCR_INTR_STS              0x34
> +#define AST_PTCR_TYPEM_LIMIT           0x38
> +#define AST_PTCR_TYPEN_LIMIT           0x3C
> +#define AST_PTCR_CTRL_EXT              0x40
> +#define AST_PTCR_CLK_EXT_CTRL          0x44
> +#define AST_PTCR_DUTY2_CTRL            0x48
> +#define AST_PTCR_DUTY3_CTRL            0x4c
> +#define AST_PTCR_TYPEO_CTRL0           0x50
> +#define AST_PTCR_TYPEO_CTRL1           0x54
> +#define AST_PTCR_TACH_SOURCE_EXT       0x60
> +#define AST_PTCR_TYPEO_LIMIT           0x78
> +
> +/* COMMON Definition */
> +#define PWM_TYPE_M     0x0
> +#define PWM_TYPE_N     0x1
> +#define PWM_TYPE_O     0x2
> +
> +#define PWMA   0x0
> +#define PWMB   0x1
> +#define PWMC   0x2
> +#define PWMD   0x3
> +#define PWME   0x4
> +#define PWMF   0x5
> +#define PWMG   0x6
> +#define PWMH   0x7
> +
> +#define DUTY_CTRL_PWM2_FALL_POINT                      (24)
> +#define DUTY_CTRL_PWM2_FALL_POINT_MASK                 (0xff<<24)
> +#define DUTY_CTRL_PWM2_RISE_POINT                      (16)
> +#define DUTY_CTRL_PWM2_RISE_POINT_MASK                 (0xff<<16)
> +#define DUTY_CTRL_PWM1_FALL_POINT                      (8)
> +#define DUTY_CTRL_PWM1_FALL_POINT_MASK                 (0xff<<8)
> +#define DUTY_CTRL_PWM1_RISE_POINT                      (0)
> +#define DUTY_CTRL_PWM1_RISE_POINT_MASK                 (0xff)
> +
> +/* AST_PTCR_CTRL : 0x00 - General Control Register */
> +#define AST_PTCR_CTRL_SET_PWMD_TYPE(x)         ((x & 0x1) << 15 | \
> +                                               (x & 0x2) << 6)
> +#define AST_PTCR_CTRL_GET_PWMD_TYPE(x)         (((x & (0x1 << 7)) >> 6) |
> \
> +                                               ((x & (0x1 << 15)) >> 15))
> +#define AST_PTCR_CTRL_SET_PWMD_TYPE_MASK       ((0x1 << 7) | (0x1 << 15))
> +
> +#define AST_PTCR_CTRL_SET_PWMC_TYPE(x)         ((x & 0x1) << 14 | \
> +                                               (x & 0x2) << 5)
> +#define AST_PTCR_CTRL_GET_PWMC_TYPE(x)         (((x & (0x1 << 6)) >> 5) |
> \
> +                                               ((x & (0x1 << 14)) >> 14))
> +#define AST_PTCR_CTRL_SET_PWMC_TYPE_MASK       ((0x1 << 6) | (0x1 << 14))
> +
> +#define AST_PTCR_CTRL_SET_PWMB_TYPE(x)         ((x & 0x1) << 13 | \
> +                                               (x & 0x2) << 4)
> +#define AST_PTCR_CTRL_GET_PWMB_TYPE(x)         (((x & (0x1 << 5)) >> 4) |
> \
> +                                               ((x & (0x1 << 13)) >> 13))
> +#define AST_PTCR_CTRL_SET_PWMB_TYPE_MASK       ((0x1 << 5) | (0x1 << 13))
> +
> +#define AST_PTCR_CTRL_SET_PWMA_TYPE(x)         ((x & 0x1) << 12 | \
> +                                               (x & 0x2) << 3)
> +#define AST_PTCR_CTRL_GET_PWMA_TYPE(x)         (((x & (0x1 << 4)) >> 3) |
> \
> +                                               ((x & (0x1 << 12)) >> 12))
> +#define AST_PTCR_CTRL_SET_PWMA_TYPE_MASK       ((0x1 << 4) | (0x1 << 12))
> +
> +#define        AST_PTCR_CTRL_PWMD                      (11)
> +#define        AST_PTCR_CTRL_PWMD_EN           (0x1 << 11)
> +#define        AST_PTCR_CTRL_PWMC                      (10)
> +#define        AST_PTCR_CTRL_PWMC_EN           (0x1 << 10)
> +#define        AST_PTCR_CTRL_PWMB                      (9)
> +#define        AST_PTCR_CTRL_PWMB_EN           (0x1 << 9)
> +#define        AST_PTCR_CTRL_PWMA                      (8)
> +#define        AST_PTCR_CTRL_PWMA_EN           (0x1 << 8)
> +
> +/*0:24Mhz, 1:MCLK */
> +#define        AST_PTCR_CTRL_CLK_SRC           0x2
> +#define        AST_PTCR_CTRL_CLK_EN            0x1
> +
> +/* AST_PTCR_CLK_CTRL : 0x04 - Clock Control Register */
> +/* TYPE N */
> +#define AST_PTCR_CLK_CTRL_TYPEN_UNIT                   (24)
> +#define AST_PTCR_CLK_CTRL_TYPEN_UNIT_MASK              (0xff << 24)
> +#define AST_PTCR_CLK_CTRL_TYPEN_H                      (20)
> +#define AST_PTCR_CLK_CTRL_TYPEN_H_MASK                 (0xf << 20)
> +#define AST_PTCR_CLK_CTRL_TYPEN_L                      (16)
> +#define AST_PTCR_CLK_CTRL_TYPEN_L_MASK                 (0xf << 16)
> +/* TYPE M */
> +#define AST_PTCR_CLK_CTRL_TYPEM_UNIT                   (8)
> +#define AST_PTCR_CLK_CTRL_TYPEM_UNIT_MASK              (0xff << 8)
> +#define AST_PTCR_CLK_CTRL_TYPEM_H                      (4)
> +#define AST_PTCR_CLK_CTRL_TYPEM_H_MASK                 (0xf << 4)
> +#define AST_PTCR_CLK_CTRL_TYPEM_L                      (0)
> +#define AST_PTCR_CLK_CTRL_TYPEM_L_MASK                 (0xf)
> +
> +/* AST_PTCR_CTRL_EXT : 0x40 - General Control Extension #1 Register */
> +#define AST_PTCR_CTRL_SET_PWMH_TYPE(x)         ((x & 0x1) << 15 | \
> +                                               (x & 0x2) << 6)
> +#define AST_PTCR_CTRL_GET_PWMH_TYPE(x)         (((x & (0x1 << 7)) >> 6) |
> \
> +                                               ((x & (0x1 << 15)) >> 15))
> +#define AST_PTCR_CTRL_SET_PWMH_TYPE_MASK       ((0x1 << 7) | (0x1 << 15))
> +
> +#define AST_PTCR_CTRL_SET_PWMG_TYPE(x)         ((x & 0x1) << 14 | \
> +                                               (x & 0x2) << 5)
> +#define AST_PTCR_CTRL_GET_PWMG_TYPE(x)         (((x & (0x1 << 6)) >> 5) |
> \
> +                                               ((x & (0x1 << 14)) >> 14))
> +#define AST_PTCR_CTRL_SET_PWMG_TYPE_MASK       ((0x1 << 6) | (0x1 << 14))
> +
> +#define AST_PTCR_CTRL_SET_PWMF_TYPE(x)         ((x & 0x1) << 13 | \
> +                                               (x & 0x2) << 4)
> +#define AST_PTCR_CTRL_GET_PWMF_TYPE(x)         (((x & (0x1 << 5)) >> 4) |
> \
> +                                               ((x & (0x1 << 13)) >> 13))
> +#define AST_PTCR_CTRL_SET_PWMF_TYPE_MASK       ((0x1 << 5) | (0x1 << 13))
> +
> +#define AST_PTCR_CTRL_SET_PWME_TYPE(x)         ((x & 0x1) << 12 | \
> +                                               (x & 0x2) << 3)
> +#define AST_PTCR_CTRL_GET_PWME_TYPE(x)         (((x & (0x1 << 4)) >> 3) |
> \
> +                                               ((x & (0x1 << 12)) >> 12))
> +#define AST_PTCR_CTRL_SET_PWME_TYPE_MASK       ((0x1 << 4) | (0x1 << 12))
> +
> +#define        AST_PTCR_CTRL_PWMH              (11)
> +#define        AST_PTCR_CTRL_PWMH_EN           (0x1 << 11)
> +#define        AST_PTCR_CTRL_PWMG              (10)
> +#define        AST_PTCR_CTRL_PWMG_EN           (0x1 << 10)
> +#define        AST_PTCR_CTRL_PWMF              (9)
> +#define        AST_PTCR_CTRL_PWMF_EN           (0x1 << 9)
> +#define        AST_PTCR_CTRL_PWME              (8)
> +#define        AST_PTCR_CTRL_PWME_EN           (0x1 << 8)
> +
> +/* AST_PTCR_CLK_EXT_CTRL : 0x44 - Clock Control Extension #1 Register */
> +/* TYPE O */
> +#define AST_PTCR_CLK_CTRL_TYPEO_UNIT           (8)
> +#define AST_PTCR_CLK_CTRL_TYPEO_UNIT_MASK      (0xff << 8)
> +#define AST_PTCR_CLK_CTRL_TYPEO_H              (4)
> +#define AST_PTCR_CLK_CTRL_TYPEO_H_MASK         (0xf << 4)
> +#define AST_PTCR_CLK_CTRL_TYPEO_L              (0)
> +#define AST_PTCR_CLK_CTRL_TYPEO_L_MASK         (0xf)
> +
> +#endif /* __ASPEED_PWM_H */
> diff --git a/drivers/hwmon/aspeed_pwm_controller.c
> b/drivers/hwmon/aspeed_pwm_controller.c
> new file mode 100644
> index 0000000..f846132
> --- /dev/null
> +++ b/drivers/hwmon/aspeed_pwm_controller.c
> @@ -0,0 +1,237 @@
> +/*
> + * Aspeed PWM controller driver
> + * * Copyright (c) 2016 Google, Inc
> + *
> + * * This program is free software; you can redistribute it and/or modify
> + * * it under the terms of the GNU General Public License version 2 as
> + * * published by the Free Software Foundation.
> + *
> + */
> +
> +#include <linux/platform_device.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of_platform.h>
> +#include <linux/of_device.h>
> +#include <linux/io.h>
> +
> +#include "aspeed_pwm.h"
> +
> +struct ast_pwm_controller_data {
> +       void __iomem *base;
> +};
> +
> +static inline void
> +ast_pwm_controller_write(struct ast_pwm_controller_data *priv, u32 val,
> u32 reg)
> +{
> +       writel(val, priv->base + reg);
> +}
> +
> +static inline u32
> +ast_pwm_controller_read(struct ast_pwm_controller_data *priv, u32 reg)
> +{
> +       u32 val = readl(priv->base + reg);
> +       return val;
> +}
> +
> +static void
> +ast_set_pwm_clock_enable(struct ast_pwm_controller_data *priv, u8 val)
> +{
> +       if (val) {
> +               ast_pwm_controller_write(priv,
> +                       ast_pwm_controller_read(priv, AST_PTCR_CTRL) |
> +                       AST_PTCR_CTRL_CLK_EN, AST_PTCR_CTRL);
> +       } else {
> +               ast_pwm_controller_write(priv,
> +                       ast_pwm_controller_read(priv, AST_PTCR_CTRL) &
> +                       ~AST_PTCR_CTRL_CLK_EN, AST_PTCR_CTRL);
> +       }
> +}
> +
> +static void
> +ast_set_pwm_clock_source(struct ast_pwm_controller_data *priv, u8 val)
> +{
> +       if (val) {
> +               ast_pwm_controller_write(priv,
> +                       ast_pwm_controller_read(priv, AST_PTCR_CTRL) |
> +                       AST_PTCR_CTRL_CLK_SRC, AST_PTCR_CTRL);
> +       } else {
> +               ast_pwm_controller_write(priv,
> +                       ast_pwm_controller_read(priv, AST_PTCR_CTRL) &
> +                       ~AST_PTCR_CTRL_CLK_SRC, AST_PTCR_CTRL);
> +       }
> +}
> +
> +static void
> +ast_set_pwm_clock_division_h(struct ast_pwm_controller_data *priv,
> +               u8 pwm_type, u8 div_high)
> +{
> +       switch (pwm_type) {
> +       case PWM_TYPE_M:
> +               ast_pwm_controller_write(priv,
> +                       (ast_pwm_controller_read(priv, AST_PTCR_CLK_CTRL) &
> +                        ~AST_PTCR_CLK_CTRL_TYPEM_H_MASK) |
> +                       (div_high << AST_PTCR_CLK_CTRL_TYPEM_H),
> +                       AST_PTCR_CLK_CTRL);
> +               break;
> +       case PWM_TYPE_N:
> +               ast_pwm_controller_write(priv,
> +                       (ast_pwm_controller_read(priv, AST_PTCR_CLK_CTRL) &
> +                        ~AST_PTCR_CLK_CTRL_TYPEN_H_MASK) |
> +                       (div_high << AST_PTCR_CLK_CTRL_TYPEN_H),
> +                       AST_PTCR_CLK_CTRL);
> +               break;
> +       case PWM_TYPE_O:
> +               ast_pwm_controller_write(priv,
> +                       (ast_pwm_controller_read(priv,
> AST_PTCR_CLK_EXT_CTRL) &
> +                        ~AST_PTCR_CLK_CTRL_TYPEO_H_MASK) |
> +                       (div_high << AST_PTCR_CLK_CTRL_TYPEO_H),
> +                       AST_PTCR_CLK_EXT_CTRL);
> +               break;
> +       }
> +}
> +
> +static void
> +ast_set_pwm_clock_division_l(struct ast_pwm_controller_data *priv,
> +               u8 pwm_type, u8 div_low)
> +{
> +       switch (pwm_type) {
> +       case PWM_TYPE_M:
> +               ast_pwm_controller_write(priv,
> +                       (ast_pwm_controller_read(priv, AST_PTCR_CLK_CTRL) &
> +                        ~AST_PTCR_CLK_CTRL_TYPEM_L_MASK) |
> +                       (div_low << AST_PTCR_CLK_CTRL_TYPEM_L),
> +                       AST_PTCR_CLK_CTRL);
> +               break;
> +       case PWM_TYPE_N:
> +               ast_pwm_controller_write(priv,
> +                       (ast_pwm_controller_read(priv, AST_PTCR_CLK_CTRL) &
> +                        ~AST_PTCR_CLK_CTRL_TYPEN_L_MASK) |
> +                       (div_low << AST_PTCR_CLK_CTRL_TYPEN_L),
> +                       AST_PTCR_CLK_CTRL);
> +               break;
> +       case PWM_TYPE_O:
> +               ast_pwm_controller_write(priv,
> +                       (ast_pwm_controller_read(priv,
> AST_PTCR_CLK_EXT_CTRL) &
> +                        ~AST_PTCR_CLK_CTRL_TYPEO_L_MASK) |
> +                       (div_low << AST_PTCR_CLK_CTRL_TYPEO_L),
> +                       AST_PTCR_CLK_EXT_CTRL);
> +               break;
> +       }
> +}
> +
> +static void
> +ast_set_pwm_clock_unit(struct ast_pwm_controller_data *priv, u8 pwm_type,
> +               u8 unit)
> +{
> +       switch (pwm_type) {
> +       case PWM_TYPE_M:
> +               ast_pwm_controller_write(priv,
> +                       (ast_pwm_controller_read(priv, AST_PTCR_CLK_CTRL) &
> +                        ~AST_PTCR_CLK_CTRL_TYPEM_UNIT_MASK) |
> +                       (unit << AST_PTCR_CLK_CTRL_TYPEM_UNIT),
> +                       AST_PTCR_CLK_CTRL);
> +               break;
> +       case PWM_TYPE_N:
> +               ast_pwm_controller_write(priv,
> +                       (ast_pwm_controller_read(priv, AST_PTCR_CLK_CTRL) &
> +                        ~AST_PTCR_CLK_CTRL_TYPEN_UNIT_MASK) |
> +                       (unit << AST_PTCR_CLK_CTRL_TYPEN_UNIT),
> +                       AST_PTCR_CLK_CTRL);
> +               break;
> +       case PWM_TYPE_O:
> +               ast_pwm_controller_write(priv,
> +                       (ast_pwm_controller_read(priv,
> AST_PTCR_CLK_EXT_CTRL) &
> +                        ~AST_PTCR_CLK_CTRL_TYPEO_UNIT_MASK) |
> +                       (unit << AST_PTCR_CLK_CTRL_TYPEO_UNIT),
> +                       AST_PTCR_CLK_EXT_CTRL);
> +               break;
> +       }
> +}
> +
> +static int
> +aspeed_pwm_controller_probe(struct platform_device *pdev)
> +{
> +       u32 buf[3];
> +       int err;
> +       struct device_node *np;
> +       struct resource *res;
> +       u8 val;
> +       struct ast_pwm_controller_data *priv;
> +
> +       np = pdev->dev.of_node;
> +
> +       priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +
> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +
> +       priv->base = devm_ioremap(&pdev->dev, res->start,
> resource_size(res));
> +       if (!priv->base)
> +               return -ENOMEM;
> +
> +       err = of_property_read_u8(np, "clock_enable", &val);
> +       if (!err) {
> +               ast_set_pwm_clock_enable(priv, val);
> +       } else {
> +               return err;
> +       }
> +       err = of_property_read_u8(np, "clock_source", &val);
> +       if (!err) {
> +               ast_set_pwm_clock_source(priv, val);
> +       } else {
> +               return err;
> +       }
> +
> +       err = of_property_read_u32_array(np, "typem_pwm_clock", buf, 3);
> +       if (!err) {
> +               ast_set_pwm_clock_division_l(priv, PWM_TYPE_M, buf[0]);
> +               ast_set_pwm_clock_division_h(priv, PWM_TYPE_M, buf[1]);
> +               ast_set_pwm_clock_unit(priv, PWM_TYPE_M, buf[2]);
> +       }
> +
> +       err = of_property_read_u32_array(np, "typen_pwm_clock", buf, 3);
> +       if (!err) {
> +               ast_set_pwm_clock_division_l(priv, PWM_TYPE_N, buf[0]);
> +               ast_set_pwm_clock_division_h(priv, PWM_TYPE_N, buf[1]);
> +               ast_set_pwm_clock_unit(priv, PWM_TYPE_N, buf[2]);
> +       }
> +
> +       err = of_property_read_u32_array(np, "typeo_pwm_clock", buf, 3);
> +       if (!err) {
> +               ast_set_pwm_clock_division_l(priv, PWM_TYPE_O, buf[0]);
> +               ast_set_pwm_clock_division_h(priv, PWM_TYPE_O, buf[1]);
> +               ast_set_pwm_clock_unit(priv, PWM_TYPE_O, buf[2]);
> +       }
> +
> +       return 0;
> +}
> +
> +static int
> +aspeed_pwm_controller_remove(struct platform_device *pdev)
> +{
> +       return 0;
> +}
> +
> +static const struct of_device_id of_pwm_controller_match_table[] = {
> +       { .compatible = "aspeed-pwm-controller", },
> +       {},
> +};
> +MODULE_DEVICE_TABLE(of, of_pwm_controller_match_table);
> +
> +static struct platform_driver aspeed_pwm_controller_driver = {
> +       .probe          = aspeed_pwm_controller_probe,
> +       .remove         = aspeed_pwm_controller_remove,
> +       .driver         = {
> +               .name   = "aspeed_pwm_controller",
> +               .owner  = THIS_MODULE,
> +               .of_match_table = of_pwm_controller_match_table,
> +       },
> +};
> +
> +module_platform_driver(aspeed_pwm_controller_driver);
> +
> +MODULE_AUTHOR("Jaghathiswari Rankappagounder Natarajan <jaghu@google.com
> >");
> +MODULE_DESCRIPTION("ASPEED PWM controller driver");
> +MODULE_LICENSE("GPL");
> --
> 2.8.0.rc3.226.g39d4020
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
>

--94eb2c0bd9102a0bb2053fe28525
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Oct 27, 2016 at 4:40 PM, Jaghathiswari Rankappagounder Nataraja=
n <span dir=3D"ltr">&lt;<a href=3D"mailto:jaghu@google.com" target=3D"_blan=
k">jaghu@google.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">Support to give all the common information required by =
all the PWM channels.<br>
<br></blockquote><div><br></div><div>This description doesn&#39;t help me u=
nderstand what problem you are solving.=C2=A0 From Section 2, Describe Your=
 Changes, of=C2=A0<a href=3D"https://www.kernel.org/doc/Documentation/Submi=
ttingPatches">https://www.kernel.org/doc/Documentation/SubmittingPatches</a=
>: &quot;Convince the reviewer that there is a problem worth fixing and tha=
t it makes sense for them to read past the first paragraph.&quot; =C2=A0I s=
uggest reading that whole section.</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
Signed-off-by: Jaghathiswari Rankappagounder Natarajan &lt;<a href=3D"mailt=
o:jaghu@google.com">jaghu@google.com</a>&gt;<br>
---<br>
=C2=A0.../bindings/hwmon/aspeed_pwm_<wbr>controller.txt=C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 33 +++<br>
=C2=A0drivers/hwmon/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A05 +<=
br>
=C2=A0drivers/hwmon/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 =
+-<br>
=C2=A0drivers/hwmon/aspeed_pwm.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 159 ++++++++++++++<br>
=C2=A0drivers/hwmon/aspeed_pwm_<wbr>controller.c=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 | 237 +++++++++++++++++++++<br>
=C2=A05 files changed, 435 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 Documentation/devicetree/<wbr>bindings/hwmon/aspee=
d_pwm_<wbr>controller.txt<br>
=C2=A0create mode 100644 drivers/hwmon/aspeed_pwm.h<br>
=C2=A0create mode 100644 drivers/hwmon/aspeed_pwm_<wbr>controller.c<br>
<br>
diff --git a/Documentation/devicetree/<wbr>bindings/hwmon/aspeed_pwm_<wbr>c=
ontroller.txt b/Documentation/devicetree/<wbr>bindings/hwmon/aspeed_pwm_<wb=
r>controller.txt<br>
new file mode 100644<br>
index 0000000..2b5c895<br>
--- /dev/null<br>
+++ b/Documentation/devicetree/<wbr>bindings/hwmon/aspeed_pwm_<wbr>controll=
er.txt<br></blockquote><div><br></div><div>Per=C2=A0<a href=3D"https://www.=
kernel.org/doc/Documentation/devicetree/bindings/submitting-patches.txt">ht=
tps://www.kernel.org/doc/Documentation/devicetree/bindings/submitting-patch=
es.txt</a>, the binding documentation updates should be a separate patch.</=
div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
@@ -0,0 +1,33 @@<br>
+Aspeed PWM controller driver<br>
</blockquote><div><br></div><div>You&#39;re implying that there is only one=
 PWM controller they have _and_ _will_ ever use.=C2=A0 Including AST2400/25=
00 in the description puts some reasonable bounds and directs people to the=
 correct SoCs that will have documentation in their datasheets.</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">+<br>
+Required properties:<br>
+- reg : address and length of the register set for the device.<br>
+- #address-cells : should be 1.<br>
+- #size-cells : should be 1.<br>
+- compatible : should be &quot;aspeed-pwm-controller&quot;.<br></blockquot=
e><div><br></div><div>I thought the format was &quot;&lt;manufacturer&gt;,&=
lt;chip&gt;-&lt;device&gt;&quot; so &quot;aspeed,ast2500-pwm&quot;</div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+- clock_enable : option to enable PWM and fan tach clock. should be 1.<br>
+- clock_source : option for clock source selection. 0 indicates 24MHz cloc=
k<br>
+=C2=A0 and 1 indicates MCLK.<br>
+- typem_pwm_clock : This array contains 3 values. The first value indicate=
s<br>
+=C2=A0 the type M PWM clock division L bit. The second value indicates typ=
e M PWM<br>
+=C2=A0 clock divison H bit. The third value indicates type M PWM period bi=
t.<br></blockquote><div><br></div><div>I have no idea what any of this mean=
s.=C2=A0 What is type M clock division?=C2=A0 How do I determine the L, H, =
and period bits?</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
+<br>
+Optional properties:<br>
+- typen_pwm_clock : This array contains 3 values. The first value indicate=
s<br>
+=C2=A0 the type N PWM clock division L bit. The second value indicates typ=
e N PWM<br>
+=C2=A0 clock division H bit. The third value indicates type N PWM period b=
it.<br>
+- typeo_pwm_clock : This array contains 3 values. The first value indicate=
s<br>
+=C2=A0 the type O PWM clock division L bit. The second value indicates typ=
e O PWM<br>
+=C2=A0 clock divison H bit. The third value indicates type O PWM period bi=
t.<br>
+<br>
+Examples:<br>
+<br>
+pwm_controller {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#address-cells =3D =
&lt;1&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#size-cells =3D &lt=
;1&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x1E786=
000 0x78&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quo=
t;aspeed-pwm-controller&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clock_enable =3D /b=
its/ 8 &lt;0x01&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clock_source =3D /b=
its/ 8 &lt;0x00&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0typem_pwm_clock =3D=
 &lt;5 0 95&gt;;<br>
+};<br>
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig<br>
index d4de8d5..59d6ea4 100644<br>
--- a/drivers/hwmon/Kconfig<br>
+++ b/drivers/hwmon/Kconfig<br>
@@ -1803,6 +1803,11 @@ config SENSORS_WM8350<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 This driver can also be built as a modul=
e.=C2=A0 If so, the module<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 will be called wm8350-hwmon.<br>
<br>
+config ASPEED_PWM_CONTROLLER<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tristate &quot;Aspeed PWM controller&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This driver provides support for ASPEED =
PWM controller.<br>
+<br>
=C2=A0config SENSORS_ULTRA45<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tristate &quot;Sun Ultra45 PIC16F747&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on SPARC64<br>
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile<br>
index 4455478..83156f8 100644<br>
--- a/drivers/hwmon/Makefile<br>
+++ b/drivers/hwmon/Makefile<br>
@@ -164,7 +164,7 @@ obj-$(CONFIG_SENSORS_<wbr>W83L785TS)=C2=A0 =C2=A0 =C2=
=A0+=3D w83l785ts.o<br>
=C2=A0obj-$(CONFIG_SENSORS_<wbr>W83L786NG)=C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D =
w83l786ng.o<br>
=C2=A0obj-$(CONFIG_SENSORS_WM831X)=C2=A0 =C2=A0+=3D wm831x-hwmon.o<br>
=C2=A0obj-$(CONFIG_SENSORS_WM8350)=C2=A0 =C2=A0+=3D wm8350-hwmon.o<br>
-<br>
+obj-$(CONFIG_ASPEED_PWM_<wbr>CONTROLLER)=C2=A0 =C2=A0 +=3D aspeed_pwm_cont=
roller.o<br>
=C2=A0obj-$(CONFIG_PMBUS)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D pmb=
us/<br>
<br>
=C2=A0ccflags-$(CONFIG_HWMON_DEBUG_<wbr>CHIP) :=3D -DDEBUG<br>
diff --git a/drivers/hwmon/aspeed_pwm.h b/drivers/hwmon/aspeed_pwm.h<br>
new file mode 100644<br>
index 0000000..b3dd6b1<br>
--- /dev/null<br>
+++ b/drivers/hwmon/aspeed_pwm.h<br>
@@ -0,0 +1,159 @@<br>
+/*<br>
+ * Aspeed PWM header file<br>
+ * * Copyright (c) 2016 Google, Inc<br>
+ *<br>
+ * * This program is free software; you can redistribute it and/or modify<=
br>
+ * * it under the terms of the GNU General Public License version 2 as<br>
+ * * published by the Free Software Foundation.<br>
+ *<br>
+ */<br>
+<br>
+#ifndef __ASPEED_PWM_H<br>
+#define __ASPEED_PWM_H __FILE__<br>
+<br>
+/* AST PWM &amp; FAN Register Definition */<br>
+#define AST_PTCR_CTRL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 0x00<br>
+#define AST_PTCR_CLK_CTRL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
0x04<br>
+#define AST_PTCR_DUTY0_CTRL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x08<=
br>
+#define AST_PTCR_DUTY1_CTRL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0c<=
br>
+#define AST_PTCR_TYPEM_CTRL0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x10<=
br>
+#define AST_PTCR_TYPEM_CTRL1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x14<=
br>
+#define AST_PTCR_TYPEN_CTRL0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x18<=
br>
+#define AST_PTCR_TYPEN_CTRL1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x1c<=
br>
+#define AST_PTCR_TACH_SOURCE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x20<=
br>
+#define AST_PTCR_TRIGGER=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A00x28<br>
+#define AST_PTCR_RESULT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x2c<br>
+#define AST_PTCR_INTR_CTRL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
0x30<br>
+#define AST_PTCR_INTR_STS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
0x34<br>
+#define AST_PTCR_TYPEM_LIMIT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x38<=
br>
+#define AST_PTCR_TYPEN_LIMIT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x3C<=
br>
+#define AST_PTCR_CTRL_EXT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
0x40<br>
+#define AST_PTCR_CLK_EXT_CTRL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x44<br>
+#define AST_PTCR_DUTY2_CTRL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x48<=
br>
+#define AST_PTCR_DUTY3_CTRL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x4c<=
br>
+#define AST_PTCR_TYPEO_CTRL0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x50<=
br>
+#define AST_PTCR_TYPEO_CTRL1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x54<=
br>
+#define AST_PTCR_TACH_SOURCE_EXT=C2=A0 =C2=A0 =C2=A0 =C2=A00x60<br>
+#define AST_PTCR_TYPEO_LIMIT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x78<=
br>
+<br>
+/* COMMON Definition */<br>
+#define PWM_TYPE_M=C2=A0 =C2=A0 =C2=A00x0<br>
+#define PWM_TYPE_N=C2=A0 =C2=A0 =C2=A00x1<br>
+#define PWM_TYPE_O=C2=A0 =C2=A0 =C2=A00x2<br>
+<br>
+#define PWMA=C2=A0 =C2=A00x0<br>
+#define PWMB=C2=A0 =C2=A00x1<br>
+#define PWMC=C2=A0 =C2=A00x2<br>
+#define PWMD=C2=A0 =C2=A00x3<br>
+#define PWME=C2=A0 =C2=A00x4<br>
+#define PWMF=C2=A0 =C2=A00x5<br>
+#define PWMG=C2=A0 =C2=A00x6<br>
+#define PWMH=C2=A0 =C2=A00x7<br>
+<br>
+#define DUTY_CTRL_PWM2_FALL_POINT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (24)<br>
+#define DUTY_CTRL_PWM2_FALL_POINT_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0(0xff&lt;&lt;24)<br>
+#define DUTY_CTRL_PWM2_RISE_POINT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (16)<br>
+#define DUTY_CTRL_PWM2_RISE_POINT_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0(0xff&lt;&lt;16)<br>
+#define DUTY_CTRL_PWM1_FALL_POINT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (8)<br>
+#define DUTY_CTRL_PWM1_FALL_POINT_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0(0xff&lt;&lt;8)<br>
+#define DUTY_CTRL_PWM1_RISE_POINT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0)<br>
+#define DUTY_CTRL_PWM1_RISE_POINT_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0(0xff)<br>
+<br>
+/* AST_PTCR_CTRL : 0x00 - General Control Register */<br>
+#define AST_PTCR_CTRL_SET_PWMD_TYPE(x)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((=
x &amp; 0x1) &lt;&lt; 15 | \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0(x &amp; 0x2) &lt;&lt; 6)<br>
+#define AST_PTCR_CTRL_GET_PWMD_TYPE(x)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((=
(x &amp; (0x1 &lt;&lt; 7)) &gt;&gt; 6) | \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0((x &amp; (0x1 &lt;&lt; 15)) &gt;&gt; 15))<br>
+#define AST_PTCR_CTRL_SET_PWMD_TYPE_<wbr>MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0((=
0x1 &lt;&lt; 7) | (0x1 &lt;&lt; 15))<br>
+<br>
+#define AST_PTCR_CTRL_SET_PWMC_TYPE(x)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((=
x &amp; 0x1) &lt;&lt; 14 | \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0(x &amp; 0x2) &lt;&lt; 5)<br>
+#define AST_PTCR_CTRL_GET_PWMC_TYPE(x)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((=
(x &amp; (0x1 &lt;&lt; 6)) &gt;&gt; 5) | \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0((x &amp; (0x1 &lt;&lt; 14)) &gt;&gt; 14))<br>
+#define AST_PTCR_CTRL_SET_PWMC_TYPE_<wbr>MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0((=
0x1 &lt;&lt; 6) | (0x1 &lt;&lt; 14))<br>
+<br>
+#define AST_PTCR_CTRL_SET_PWMB_TYPE(x)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((=
x &amp; 0x1) &lt;&lt; 13 | \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0(x &amp; 0x2) &lt;&lt; 4)<br>
+#define AST_PTCR_CTRL_GET_PWMB_TYPE(x)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((=
(x &amp; (0x1 &lt;&lt; 5)) &gt;&gt; 4) | \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0((x &amp; (0x1 &lt;&lt; 13)) &gt;&gt; 13))<br>
+#define AST_PTCR_CTRL_SET_PWMB_TYPE_<wbr>MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0((=
0x1 &lt;&lt; 5) | (0x1 &lt;&lt; 13))<br>
+<br>
+#define AST_PTCR_CTRL_SET_PWMA_TYPE(x)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((=
x &amp; 0x1) &lt;&lt; 12 | \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0(x &amp; 0x2) &lt;&lt; 3)<br>
+#define AST_PTCR_CTRL_GET_PWMA_TYPE(x)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((=
(x &amp; (0x1 &lt;&lt; 4)) &gt;&gt; 3) | \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0((x &amp; (0x1 &lt;&lt; 12)) &gt;&gt; 12))<br>
+#define AST_PTCR_CTRL_SET_PWMA_TYPE_<wbr>MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0((=
0x1 &lt;&lt; 4) | (0x1 &lt;&lt; 12))<br>
+<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 AST_PTCR_CTRL_PWMD=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (11)<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 AST_PTCR_CTRL_PWMD_EN=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0(0x1 &lt;&lt; 11)<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 AST_PTCR_CTRL_PWMC=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (10)<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 AST_PTCR_CTRL_PWMC_EN=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0(0x1 &lt;&lt; 10)<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 AST_PTCR_CTRL_PWMB=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (9)<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 AST_PTCR_CTRL_PWMB_EN=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0(0x1 &lt;&lt; 9)<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 AST_PTCR_CTRL_PWMA=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (8)<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 AST_PTCR_CTRL_PWMA_EN=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0(0x1 &lt;&lt; 8)<br>
+<br>
+/*0:24Mhz, 1:MCLK */<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 AST_PTCR_CTRL_CLK_SRC=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A00x2<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 AST_PTCR_CTRL_CLK_EN=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 0x1<br>
+<br>
+/* AST_PTCR_CLK_CTRL : 0x04 - Clock Control Register */<br>
+/* TYPE N */<br>
+#define AST_PTCR_CLK_CTRL_TYPEN_UNIT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(24)<br>
+#define AST_PTCR_CLK_CTRL_TYPEN_UNIT_<wbr>MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 (0xff &lt;&lt; 24)<br>
+#define AST_PTCR_CLK_CTRL_TYPEN_H=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (20)<br>
+#define AST_PTCR_CLK_CTRL_TYPEN_H_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0(0xf &lt;&lt; 20)<br>
+#define AST_PTCR_CLK_CTRL_TYPEN_L=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (16)<br>
+#define AST_PTCR_CLK_CTRL_TYPEN_L_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0(0xf &lt;&lt; 16)<br>
+/* TYPE M */<br>
+#define AST_PTCR_CLK_CTRL_TYPEM_UNIT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(8)<br>
+#define AST_PTCR_CLK_CTRL_TYPEM_UNIT_<wbr>MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 (0xff &lt;&lt; 8)<br>
+#define AST_PTCR_CLK_CTRL_TYPEM_H=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (4)<br>
+#define AST_PTCR_CLK_CTRL_TYPEM_H_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0(0xf &lt;&lt; 4)<br>
+#define AST_PTCR_CLK_CTRL_TYPEM_L=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0)<br>
+#define AST_PTCR_CLK_CTRL_TYPEM_L_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0(0xf)<br>
+<br>
+/* AST_PTCR_CTRL_EXT : 0x40 - General Control Extension #1 Register */<br>
+#define AST_PTCR_CTRL_SET_PWMH_TYPE(x)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((=
x &amp; 0x1) &lt;&lt; 15 | \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0(x &amp; 0x2) &lt;&lt; 6)<br>
+#define AST_PTCR_CTRL_GET_PWMH_TYPE(x)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((=
(x &amp; (0x1 &lt;&lt; 7)) &gt;&gt; 6) | \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0((x &amp; (0x1 &lt;&lt; 15)) &gt;&gt; 15))<br>
+#define AST_PTCR_CTRL_SET_PWMH_TYPE_<wbr>MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0((=
0x1 &lt;&lt; 7) | (0x1 &lt;&lt; 15))<br>
+<br>
+#define AST_PTCR_CTRL_SET_PWMG_TYPE(x)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((=
x &amp; 0x1) &lt;&lt; 14 | \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0(x &amp; 0x2) &lt;&lt; 5)<br>
+#define AST_PTCR_CTRL_GET_PWMG_TYPE(x)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((=
(x &amp; (0x1 &lt;&lt; 6)) &gt;&gt; 5) | \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0((x &amp; (0x1 &lt;&lt; 14)) &gt;&gt; 14))<br>
+#define AST_PTCR_CTRL_SET_PWMG_TYPE_<wbr>MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0((=
0x1 &lt;&lt; 6) | (0x1 &lt;&lt; 14))<br>
+<br>
+#define AST_PTCR_CTRL_SET_PWMF_TYPE(x)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((=
x &amp; 0x1) &lt;&lt; 13 | \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0(x &amp; 0x2) &lt;&lt; 4)<br>
+#define AST_PTCR_CTRL_GET_PWMF_TYPE(x)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((=
(x &amp; (0x1 &lt;&lt; 5)) &gt;&gt; 4) | \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0((x &amp; (0x1 &lt;&lt; 13)) &gt;&gt; 13))<br>
+#define AST_PTCR_CTRL_SET_PWMF_TYPE_<wbr>MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0((=
0x1 &lt;&lt; 5) | (0x1 &lt;&lt; 13))<br>
+<br>
+#define AST_PTCR_CTRL_SET_PWME_TYPE(x)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((=
x &amp; 0x1) &lt;&lt; 12 | \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0(x &amp; 0x2) &lt;&lt; 3)<br>
+#define AST_PTCR_CTRL_GET_PWME_TYPE(x)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((=
(x &amp; (0x1 &lt;&lt; 4)) &gt;&gt; 3) | \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0((x &amp; (0x1 &lt;&lt; 12)) &gt;&gt; 12))<br>
+#define AST_PTCR_CTRL_SET_PWME_TYPE_<wbr>MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0((=
0x1 &lt;&lt; 4) | (0x1 &lt;&lt; 12))<br>
+<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 AST_PTCR_CTRL_PWMH=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 (11)<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 AST_PTCR_CTRL_PWMH_EN=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0(0x1 &lt;&lt; 11)<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 AST_PTCR_CTRL_PWMG=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 (10)<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 AST_PTCR_CTRL_PWMG_EN=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0(0x1 &lt;&lt; 10)<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 AST_PTCR_CTRL_PWMF=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 (9)<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 AST_PTCR_CTRL_PWMF_EN=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0(0x1 &lt;&lt; 9)<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 AST_PTCR_CTRL_PWME=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 (8)<br>
+#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 AST_PTCR_CTRL_PWME_EN=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0(0x1 &lt;&lt; 8)<br>
+<br>
+/* AST_PTCR_CLK_EXT_CTRL : 0x44 - Clock Control Extension #1 Register */<b=
r>
+/* TYPE O */<br>
+#define AST_PTCR_CLK_CTRL_TYPEO_UNIT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0(8)<br>
+#define AST_PTCR_CLK_CTRL_TYPEO_UNIT_<wbr>MASK=C2=A0 =C2=A0 =C2=A0 (0xff &=
lt;&lt; 8)<br>
+#define AST_PTCR_CLK_CTRL_TYPEO_H=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 (4)<br>
+#define AST_PTCR_CLK_CTRL_TYPEO_H_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0=
xf &lt;&lt; 4)<br>
+#define AST_PTCR_CLK_CTRL_TYPEO_L=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 (0)<br>
+#define AST_PTCR_CLK_CTRL_TYPEO_L_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0=
xf)<br>
+<br>
+#endif /* __ASPEED_PWM_H */<br>
diff --git a/drivers/hwmon/aspeed_pwm_<wbr>controller.c b/drivers/hwmon/asp=
eed_pwm_<wbr>controller.c<br>
new file mode 100644<br>
index 0000000..f846132<br>
--- /dev/null<br>
+++ b/drivers/hwmon/aspeed_pwm_<wbr>controller.c<br>
@@ -0,0 +1,237 @@<br>
+/*<br>
+ * Aspeed PWM controller driver<br>
+ * * Copyright (c) 2016 Google, Inc<br>
+ *<br>
+ * * This program is free software; you can redistribute it and/or modify<=
br>
+ * * it under the terms of the GNU General Public License version 2 as<br>
+ * * published by the Free Software Foundation.<br>
+ *<br>
+ */<br>
+<br>
+#include &lt;linux/platform_device.h&gt;<br>
+#include &lt;linux/kernel.h&gt;<br>
+#include &lt;linux/module.h&gt;<br>
+#include &lt;linux/of_platform.h&gt;<br>
+#include &lt;linux/of_device.h&gt;<br>
+#include &lt;linux/io.h&gt;<br>
+<br>
+#include &quot;aspeed_pwm.h&quot;<br>
+<br>
+struct ast_pwm_controller_data {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0void __iomem *base;<br>
+};<br>
+<br>
+static inline void<br>
+ast_pwm_controller_write(<wbr>struct ast_pwm_controller_data *priv, u32 va=
l, u32 reg)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0writel(val, priv-&gt;base + reg);<br>
+}<br>
+<br>
+static inline u32<br>
+ast_pwm_controller_read(<wbr>struct ast_pwm_controller_data *priv, u32 reg=
)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val =3D readl(priv-&gt;base + reg);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return val;<br>
+}<br>
+<br>
+static void<br>
+ast_set_pwm_clock_enable(<wbr>struct ast_pwm_controller_data *priv, u8 val=
)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (val) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ast_pwm_controller_=
write(priv,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ast_pwm_controller_read(priv, AST_PTCR_CTRL) |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0AST_PTCR_CTRL_CLK_EN, AST_PTCR_CTRL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ast_pwm_controller_=
write(priv,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ast_pwm_controller_read(priv, AST_PTCR_CTRL) &amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0~AST_PTCR_CTRL_CLK_EN, AST_PTCR_CTRL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+}<br>
+<br>
+static void<br>
+ast_set_pwm_clock_source(<wbr>struct ast_pwm_controller_data *priv, u8 val=
)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (val) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ast_pwm_controller_=
write(priv,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ast_pwm_controller_read(priv, AST_PTCR_CTRL) |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0AST_PTCR_CTRL_CLK_SRC, AST_PTCR_CTRL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ast_pwm_controller_=
write(priv,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ast_pwm_controller_read(priv, AST_PTCR_CTRL) &amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0~AST_PTCR_CTRL_CLK_SRC, AST_PTCR_CTRL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+}<br>
+<br>
+static void<br>
+ast_set_pwm_clock_division_h(<wbr>struct ast_pwm_controller_data *priv,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u8 pwm_type, u8 div=
_high)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (pwm_type) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case PWM_TYPE_M:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ast_pwm_controller_=
write(priv,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(ast_pwm_controller_read(priv, AST_PTCR_CLK_CTRL) &amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ~AST_PTCR_CLK_CTRL_TYPEM_H_<wbr>MASK) |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(div_high &lt;&lt; AST_PTCR_CLK_CTRL_TYPEM_H),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0AST_PTCR_CLK_CTRL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case PWM_TYPE_N:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ast_pwm_controller_=
write(priv,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(ast_pwm_controller_read(priv, AST_PTCR_CLK_CTRL) &amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ~AST_PTCR_CLK_CTRL_TYPEN_H_<wbr>MASK) |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(div_high &lt;&lt; AST_PTCR_CLK_CTRL_TYPEN_H),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0AST_PTCR_CLK_CTRL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case PWM_TYPE_O:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ast_pwm_controller_=
write(priv,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(ast_pwm_controller_read(priv, AST_PTCR_CLK_EXT_CTRL) &amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ~AST_PTCR_CLK_CTRL_TYPEO_H_<wbr>MASK) |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(div_high &lt;&lt; AST_PTCR_CLK_CTRL_TYPEO_H),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0AST_PTCR_CLK_EXT_CTRL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+}<br>
+<br>
+static void<br>
+ast_set_pwm_clock_division_l(<wbr>struct ast_pwm_controller_data *priv,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u8 pwm_type, u8 div=
_low)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (pwm_type) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case PWM_TYPE_M:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ast_pwm_controller_=
write(priv,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(ast_pwm_controller_read(priv, AST_PTCR_CLK_CTRL) &amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ~AST_PTCR_CLK_CTRL_TYPEM_L_<wbr>MASK) |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(div_low &lt;&lt; AST_PTCR_CLK_CTRL_TYPEM_L),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0AST_PTCR_CLK_CTRL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case PWM_TYPE_N:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ast_pwm_controller_=
write(priv,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(ast_pwm_controller_read(priv, AST_PTCR_CLK_CTRL) &amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ~AST_PTCR_CLK_CTRL_TYPEN_L_<wbr>MASK) |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(div_low &lt;&lt; AST_PTCR_CLK_CTRL_TYPEN_L),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0AST_PTCR_CLK_CTRL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case PWM_TYPE_O:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ast_pwm_controller_=
write(priv,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(ast_pwm_controller_read(priv, AST_PTCR_CLK_EXT_CTRL) &amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ~AST_PTCR_CLK_CTRL_TYPEO_L_<wbr>MASK) |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(div_low &lt;&lt; AST_PTCR_CLK_CTRL_TYPEO_L),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0AST_PTCR_CLK_EXT_CTRL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+}<br>
+<br>
+static void<br>
+ast_set_pwm_clock_unit(struct ast_pwm_controller_data *priv, u8 pwm_type,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u8 unit)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (pwm_type) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case PWM_TYPE_M:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ast_pwm_controller_=
write(priv,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(ast_pwm_controller_read(priv, AST_PTCR_CLK_CTRL) &amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ~AST_PTCR_CLK_CTRL_TYPEM_UNIT_<wbr>MASK) |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(unit &lt;&lt; AST_PTCR_CLK_CTRL_TYPEM_UNIT),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0AST_PTCR_CLK_CTRL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case PWM_TYPE_N:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ast_pwm_controller_=
write(priv,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(ast_pwm_controller_read(priv, AST_PTCR_CLK_CTRL) &amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ~AST_PTCR_CLK_CTRL_TYPEN_UNIT_<wbr>MASK) |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(unit &lt;&lt; AST_PTCR_CLK_CTRL_TYPEN_UNIT),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0AST_PTCR_CLK_CTRL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case PWM_TYPE_O:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ast_pwm_controller_=
write(priv,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(ast_pwm_controller_read(priv, AST_PTCR_CLK_EXT_CTRL) &amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ~AST_PTCR_CLK_CTRL_TYPEO_UNIT_<wbr>MASK) |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(unit &lt;&lt; AST_PTCR_CLK_CTRL_TYPEO_UNIT),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0AST_PTCR_CLK_EXT_CTRL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+}<br>
+<br>
+static int<br>
+aspeed_pwm_controller_probe(<wbr>struct platform_device *pdev)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 buf[3];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int err;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device_node *np;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct resource *res;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 val;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct ast_pwm_controller_data *priv;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0np =3D pdev-&gt;dev.of_node;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0priv =3D devm_kzalloc(&amp;pdev-&gt;dev, sizeof=
(*priv), GFP_KERNEL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!priv)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0res =3D platform_get_resource(pdev, IORESOURCE_=
MEM, 0);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0priv-&gt;base =3D devm_ioremap(&amp;pdev-&gt;de=
v, res-&gt;start, resource_size(res));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!priv-&gt;base)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D of_property_read_u8(np, &quot;clock_ena=
ble&quot;, &amp;val);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!err) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ast_set_pwm_clock_e=
nable(priv, val);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return err;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D of_property_read_u8(np, &quot;clock_sou=
rce&quot;, &amp;val);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!err) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ast_set_pwm_clock_s=
ource(priv, val);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return err;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D of_property_read_u32_array(np, &quot;ty=
pem_pwm_clock&quot;, buf, 3);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!err) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ast_set_pwm_clock_d=
ivision_l(<wbr>priv, PWM_TYPE_M, buf[0]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ast_set_pwm_clock_d=
ivision_h(<wbr>priv, PWM_TYPE_M, buf[1]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ast_set_pwm_clock_u=
nit(priv, PWM_TYPE_M, buf[2]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D of_property_read_u32_array(np, &quot;ty=
pen_pwm_clock&quot;, buf, 3);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!err) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ast_set_pwm_clock_d=
ivision_l(<wbr>priv, PWM_TYPE_N, buf[0]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ast_set_pwm_clock_d=
ivision_h(<wbr>priv, PWM_TYPE_N, buf[1]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ast_set_pwm_clock_u=
nit(priv, PWM_TYPE_N, buf[2]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D of_property_read_u32_array(np, &quot;ty=
peo_pwm_clock&quot;, buf, 3);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!err) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ast_set_pwm_clock_d=
ivision_l(<wbr>priv, PWM_TYPE_O, buf[0]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ast_set_pwm_clock_d=
ivision_h(<wbr>priv, PWM_TYPE_O, buf[1]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ast_set_pwm_clock_u=
nit(priv, PWM_TYPE_O, buf[2]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
+static int<br>
+aspeed_pwm_controller_remove(<wbr>struct platform_device *pdev)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
+static const struct of_device_id of_pwm_controller_match_table[<wbr>] =3D =
{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .compatible =3D &quot;aspeed-pwm-controller&q=
uot;, },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{},<br>
+};<br>
+MODULE_DEVICE_TABLE(of, of_pwm_controller_match_table)<wbr>;<br>
+<br>
+static struct platform_driver aspeed_pwm_controller_driver =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.probe=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D as=
peed_pwm_controller_probe,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.remove=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D as=
peed_pwm_controller_remove,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.driver=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D {<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0=
=3D &quot;aspeed_pwm_controller&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.owner=C2=A0 =3D TH=
IS_MODULE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.of_match_table =3D=
 of_pwm_controller_match_table,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
+};<br>
+<br>
+module_platform_driver(<wbr>aspeed_pwm_controller_driver);<br>
+<br>
+MODULE_AUTHOR(&quot;Jaghathiswari Rankappagounder Natarajan &lt;<a href=3D=
"mailto:jaghu@google.com">jaghu@google.com</a>&gt;&quot;);<br>
+MODULE_DESCRIPTION(&quot;ASPEED PWM controller driver&quot;);<br>
+MODULE_LICENSE(&quot;GPL&quot;);<br>
--<br>
2.8.0.rc3.226.g39d4020<br>
<br>
______________________________<wbr>_________________<br>
openbmc mailing list<br>
<a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a><br=
>
<a href=3D"https://lists.ozlabs.org/listinfo/openbmc" rel=3D"noreferrer" ta=
rget=3D"_blank">https://lists.ozlabs.org/<wbr>listinfo/openbmc</a><br>
</blockquote></div><br></div></div>

--94eb2c0bd9102a0bb2053fe28525--
