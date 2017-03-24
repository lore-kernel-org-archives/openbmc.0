Return-Path: <maxims@google.com>
Received: from mail-it0-x231.google.com (mail-it0-x231.google.com
 [IPv6:2607:f8b0:4001:c0b::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vq4Zl2DSSzDq7c
 for <openbmc@lists.ozlabs.org>; Fri, 24 Mar 2017 11:50:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="T1JnwMZZ"; 
 dkim-atps=neutral
Received: by mail-it0-x231.google.com with SMTP id w124so3573478itb.0
 for <openbmc@lists.ozlabs.org>; Thu, 23 Mar 2017 17:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=X8oQePg5FR6q18yEbfnD1pafQ1XjS05MIgr5Gi6wrTA=;
 b=T1JnwMZZut+LCs5V8Fr5gmO5oSNTlOJh2IseSp44qLJSyBtcJycu5omAw6VuVV0dDK
 Y6cBUVICXxNT2l1nWz5gBubtLT+S9dGLwduKL/uIuO0STRa3+bj0z8jwyexqD7zG6tXM
 J+2unV7vxIVfxu81oKueNUMqrKFllQUcs4vVpiFy18VxKtsdqSvcBSvqTdxWYr/fSadk
 dwxK9m4rOgp4U5IBQ628ega8Iey9jXP+I7r73uuRshyhepP61sZAkJw7lm0Ja3ISHfoF
 jjVVJqAK6/2gDP1KlBZLd9dQwU5klKqQPRtYigIIbpKAyXOyHJmkJLMbWMk9E3xDggn6
 DLLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=X8oQePg5FR6q18yEbfnD1pafQ1XjS05MIgr5Gi6wrTA=;
 b=o1QPWFufBPcdDgSANrvRrvM8JaK7c2XjI+H3Ir8S1zvK9EYY/e710byBP6nkb6QIYE
 hoAAgxL35pS0C0W1800AUUI+WpTaLa4BfO9SjpDoi5ixNJsc3P/7cQeW7e5+YI64jj0A
 3N95wZO3749V9vdEIYaaMxtYneVLNQDFb2WZhiJsESy+QcDqoYaus3i1s2rVl9t7A1p/
 W0RjSzbXKk3PolyYl/VLcKMr/18z509nKj8uMLcn82lOkBi+v5zLEpgM/U7tLB2ATjg2
 LHfr8pBhaIDWuPZ2tJ73xCRfQp2kgwwl6bxifjixRIC7dYR5F/PlSj/2Fdx9ye42Xx0F
 oR0w==
X-Gm-Message-State: AFeK/H18Cxeou4GrJt7Hov5KaDVBoAFcLNDd/92iq7K7+sgbRPKjx4az0KDfpHfBbs48nBWdCHv47e4WQ7WnPihs
X-Received: by 10.36.29.66 with SMTP id 63mr546867itj.91.1490316604232; Thu,
 23 Mar 2017 17:50:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.225 with HTTP; Thu, 23 Mar 2017 17:50:03 -0700 (PDT)
In-Reply-To: <CAPnjgZ2o+CTn+oR3GZhyHpm04F+e4FZJVvikLKLgsvMerjE_kw@mail.gmail.com>
References: <20170316213624.140344-1-maxims@google.com>
 <20170316213624.140344-6-maxims@google.com>
 <CAPnjgZ2o+CTn+oR3GZhyHpm04F+e4FZJVvikLKLgsvMerjE_kw@mail.gmail.com>
From: Maxim Sloyko <maxims@google.com>
Date: Thu, 23 Mar 2017 17:50:03 -0700
Message-ID: <CAFR_W8qnucFJK58kEhJRMQg0SE1py9oJewGFByX7-S9mj=Sgpw@mail.gmail.com>
Subject: Re: [PATCH 05/17] aspeed: Reset Driver
To: Simon Glass <sjg@chromium.org>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Tom Warren <twarren@nvidia.com>, 
 Albert Aribaud <albert.u.boot@aribaud.net>, Stephen Warren <swarren@nvidia.com>
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
X-List-Received-Date: Fri, 24 Mar 2017 00:50:08 -0000

On Tue, Mar 21, 2017 at 4:22 PM, Simon Glass <sjg@chromium.org> wrote:
>
> Hi Maxim,
>
> On 16 March 2017 at 15:36, Maxim Sloyko <maxims@google.com> wrote:
> > Add Reset Driver for ast2500 SoC. This driver uses Watchdog Timer to
> > perform resets and thus depends on it. The actual Watchdog device used
> > needs to be configured in Device Tree using "aspeed,wdt" property, which
> > must be WDT phandle, for example:
> >
> > rst: reset-controller {
> >     compatible = "aspeed,ast2500-reset";
> >     aspeed,wdt = <&wdt1>;
> > }
> >
> > Signed-off-by: Maxim Sloyko <maxims@google.com>
> > ---
> >
> >  arch/arm/include/asm/arch-aspeed/scu_ast2500.h |  28 +++++++
> >  drivers/reset/Kconfig                          |  10 +++
> >  drivers/reset/Makefile                         |   1 +
> >  drivers/reset/ast2500-reset.c                  | 109 +++++++++++++++++++++++++
> >  4 files changed, 148 insertions(+)
> >  create mode 100644 drivers/reset/ast2500-reset.c
> >
>
> Reviewed-by: Simon Glass <sjg@chromium.org>
>
> Nits below.
>
> > diff --git a/arch/arm/include/asm/arch-aspeed/scu_ast2500.h b/arch/arm/include/asm/arch-aspeed/scu_ast2500.h
> > index 0fa3ecb9b9..e2556f920d 100644
> > --- a/arch/arm/include/asm/arch-aspeed/scu_ast2500.h
> > +++ b/arch/arm/include/asm/arch-aspeed/scu_ast2500.h
> > @@ -31,6 +31,34 @@
> >
> >  #define SCU_MISC_UARTCLK_DIV13         (1 << 12)
> >
> > +/*
> > + * SYSRESET is actually more like a Power register,
> > + * except that corresponding bit set to 1 means that
> > + * the peripheral is off.
> > + */
> > +#define SCU_SYSRESET_XDMA              (1 << 25)
> > +#define SCU_SYSRESET_MCTP              (1 << 24)
> > +#define SCU_SYSRESET_ADC               (1 << 23)
> > +#define SCU_SYSRESET_JTAG              (1 << 22)
> > +#define SCU_SYSRESET_MIC               (1 << 18)
> > +#define SCU_SYSRESET_SDIO              (1 << 16)
> > +#define SCU_SYSRESET_USB11HOST         (1 << 15)
> > +#define SCU_SYSRESET_USBHUB            (1 << 14)
> > +#define SCU_SYSRESET_CRT               (1 << 13)
> > +#define SCU_SYSRESET_MAC2              (1 << 12)
> > +#define SCU_SYSRESET_MAC1              (1 << 11)
> > +#define SCU_SYSRESET_PECI              (1 << 10)
> > +#define SCU_SYSRESET_PWM               (1 << 9)
> > +#define SCU_SYSRESET_PCI_VGA           (1 << 8)
> > +#define SCU_SYSRESET_2D                        (1 << 7)
> > +#define SCU_SYSRESET_VIDEO             (1 << 6)
> > +#define SCU_SYSRESET_LPC               (1 << 5)
> > +#define SCU_SYSRESET_HAC               (1 << 4)
> > +#define SCU_SYSRESET_USBHID            (1 << 3)
> > +#define SCU_SYSRESET_I2C               (1 << 2)
> > +#define SCU_SYSRESET_AHB               (1 << 1)
> > +#define SCU_SYSRESET_SDRAM_WDT         (1 << 0)
> > +
> >  #ifndef __ASSEMBLY__
> >
> >  struct ast2500_clk_priv {
> > diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> > index c42b0bcf0e..eb54189d4b 100644
> > --- a/drivers/reset/Kconfig
> > +++ b/drivers/reset/Kconfig
> > @@ -43,4 +43,14 @@ config RESET_UNIPHIER
> >           Say Y if you want to control reset signals provided by System Control
> >           block, Media I/O block, Peripheral Block.
> >
> > +config AST2500_RESET
> > +       bool "Reset controller driver for AST2500 SoCs"
> > +       depends on DM_RESET && WDT_ASPEED
> > +       default y if ASPEED_AST2500
> > +       help
> > +         Support for reset controller on AST2500 SoC. This controller uses
> > +         watchdog to reset different peripherals and thus only supports
> > +         resets that are supported by watchdog. The main limitation though
> > +         is that some reset signals, like I2C or MISC reset multiple devices.
> > +
> >  endmenu
> > diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> > index 5c4305cc1d..16ad7eed5b 100644
> > --- a/drivers/reset/Makefile
> > +++ b/drivers/reset/Makefile
> > @@ -8,3 +8,4 @@ obj-$(CONFIG_SANDBOX_MBOX) += sandbox-reset-test.o
> >  obj-$(CONFIG_TEGRA_CAR_RESET) += tegra-car-reset.o
> >  obj-$(CONFIG_TEGRA186_RESET) += tegra186-reset.o
> >  obj-$(CONFIG_RESET_UNIPHIER) += reset-uniphier.o
> > +obj-$(CONFIG_AST2500_RESET) += ast2500-reset.o
> > diff --git a/drivers/reset/ast2500-reset.c b/drivers/reset/ast2500-reset.c
> > new file mode 100644
> > index 0000000000..0afa4bd01a
> > --- /dev/null
> > +++ b/drivers/reset/ast2500-reset.c
> > @@ -0,0 +1,109 @@
> > +/*
> > + * Copyright 2017 Google, Inc
> > + *
> > + * SPDX-License-Identifier: GPL-2.0
> > + */
> > +
> > +#include <common.h>
> > +#include <dm.h>
> > +#include <misc.h>
> > +#include <reset.h>
> > +#include <reset-uclass.h>
> > +#include <wdt.h>
> > +#include <asm/io.h>
> > +#include <asm/arch/scu_ast2500.h>
> > +#include <asm/arch/wdt.h>
> > +
> > +DECLARE_GLOBAL_DATA_PTR;
> > +
> > +struct ast2500_reset_priv {
> > +       /* WDT used to perform resets. */
> > +       struct udevice *wdt;
> > +       struct ast2500_scu *scu;
> > +};
> > +
> > +static int ast2500_ofdata_to_platdata(struct udevice *dev)
> > +{
> > +       struct ast2500_reset_priv *priv = dev_get_priv(dev);
> > +       int ret;
> > +
> > +       ret = uclass_get_device_by_phandle(UCLASS_WDT, dev, "aspeed,wdt",
> > +                                          &priv->wdt);
> > +       if (ret) {
> > +               debug("%s: can't find WDT for reset controller", __func__);
> > +               return ret;
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +static int ast2500_reset_assert(struct reset_ctl *reset_ctl)
> > +{
> > +       struct ast2500_reset_priv *priv = dev_get_priv(reset_ctl->dev);
> > +       u32 reset_mode, reset_mask;
> > +       bool reset_sdram;
> > +       int ret;
> > +
> > +       if (IS_ERR(priv))
> > +               return PTR_ERR(priv);
>
> This can never happen so you can drop this code.
>
> > +
> > +       /*
> > +        * To reset SDRAM, specifal flag in SYSRESET register
>
> a special
>
> > +        * needs to be enabled first
> > +        */
> > +       reset_mode = ast_reset_mode_from_flags(reset_ctl->id);
> > +       reset_mask = ast_reset_mask_from_flags(reset_ctl->id);
> > +       reset_sdram = reset_mode == WDT_CTRL_RESET_SOC &&
> > +               (reset_mask & WDT_RESET_SDRAM);
> > +
> > +       if (reset_sdram) {
> > +               ast_scu_unlock(priv->scu);
> > +               setbits_le32(&priv->scu->sysreset_ctrl1,
> > +                            SCU_SYSRESET_SDRAM_WDT);
> > +               ret = wdt_reset(priv->wdt, reset_ctl->id);
> > +               clrbits_le32(&priv->scu->sysreset_ctrl1,
> > +                            SCU_SYSRESET_SDRAM_WDT);
> > +               ast_scu_lock(priv->scu);
> > +       } else {
> > +               ret = wdt_reset(priv->wdt, reset_ctl->id);
> > +       }
> > +
> > +       return ret;
> > +}
> > +
> > +static int ast2500_reset_request(struct reset_ctl *reset_ctl)
> > +{
> > +       debug("%s(reset_ctl=%p) (dev=%p, id=%lu)\n", __func__, reset_ctl,
> > +             reset_ctl->dev, reset_ctl->id);
>
> Should this do anything?

It needs to be there, because it is called unconditionally from
uclass. I don't know what it supposed to do though. It does not do
anything in tegra186-reset driver that I used as an example.

>
> > +
> > +       return 0;
> > +}
> > +
> > +static int ast2500_reset_probe(struct udevice *dev)
> > +{
> > +       struct ast2500_reset_priv *priv = dev_get_priv(dev);
> > +
> > +       priv->scu = ast_get_scu();
>
> OK, but perhaps at some point scu should be a SYSCON device accessed
> with syscon_get_first_range()?

Ack.

>
> > +
> > +       return 0;
> > +}
> > +
> > +static const struct udevice_id ast2500_reset_ids[] = {
> > +       { .compatible = "aspeed,ast2500-reset" },
> > +       { }
> > +};
> > +
> > +struct reset_ops ast2500_reset_ops = {
> > +       .rst_assert = ast2500_reset_assert,
> > +       .request = ast2500_reset_request,
> > +};
> > +
> > +U_BOOT_DRIVER(ast2500_reset) = {
> > +       .name           = "ast2500_reset",
> > +       .id             = UCLASS_RESET,
> > +       .of_match = ast2500_reset_ids,
> > +       .probe = ast2500_reset_probe,
> > +       .ops = &ast2500_reset_ops,
> > +       .ofdata_to_platdata = ast2500_ofdata_to_platdata,
> > +       .priv_auto_alloc_size = sizeof(struct ast2500_reset_priv),
> > +};
> > --
> > 2.12.0.367.g23dc2f6d3c-goog
> >
>
> Regards,
> Simon




-- 
Maxim Sloyko
