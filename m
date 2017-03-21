Return-Path: <sjg@google.com>
Received: from mail-vk0-x230.google.com (mail-vk0-x230.google.com
 [IPv6:2607:f8b0:400c:c05::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vnpkj3kKYzDqZT
 for <openbmc@lists.ozlabs.org>; Wed, 22 Mar 2017 10:22:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="stVryh0V"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="GUEx5dq6";
 dkim-atps=neutral
Received: by mail-vk0-x230.google.com with SMTP id j64so96014131vkg.3
 for <openbmc@lists.ozlabs.org>; Tue, 21 Mar 2017 16:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=ZDtidOikf8BT8mMtjCaVjHAjXTCfblFGz9+UuS+b3oI=;
 b=stVryh0VWO+pQQBU0ikxVs/Zh9UCZMqI2JWoQCx7PSLi9x3NcxjJpXR21zRY+FnuoN
 15CckYMr8fb7znZX0DmHfZ+e/xHGS7OO7wUtuNyvpeo+lmMydHBKNk1UGf8LaMXjcNBP
 2tScwMOxLm9u/v1iJ2jsGg3EQGkhrKtcoh7kzTeSYU6kRYIEcO1OZVS0Fo1w4LKGLZy9
 ET0fTxmeN7wnsU+S4wk7pb7+dyZhw+GxeDuD74CTpE4Lk9a00WYqMEwubqXp320BFIQq
 J+MA0p6eyCAMw5DtQgECKCKQrZ63ZA8h8SK8Ws4dHtC0j5bPS33kafM8tSk6wU0rot7h
 kz2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=ZDtidOikf8BT8mMtjCaVjHAjXTCfblFGz9+UuS+b3oI=;
 b=GUEx5dq6rD6XJWrdzMjWBhZ6ev0KcnWado4PsZQ24ksua45qwqde4j9IKXU+0pA477
 1PGNMrKIa6EcSjXH6ZOoGKsfxVXfhucNEHq7kqI0y8ynbGcl1Fh7d8Mj2fYrAJH6Y5j6
 utJVmKE6c58PNkK4gYg5+pqgS82kVfDDEJrIU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=ZDtidOikf8BT8mMtjCaVjHAjXTCfblFGz9+UuS+b3oI=;
 b=rQ5FruYGSf9ZIKgL9OZBZLB6+3smtCltZm1DTlDGQ/pDfBOziYs2/Z1Dcxizrfc2th
 1nCr+Ud7ufWRTU1vUGykYcqg1yQEZ/oFUzRaDv5x0o1DkxL+9z6ta0P8G5AnRB0b/3bQ
 E+T+2aoyCFKOImg6J40rZqCJryIJUNbF0mJ/Cb6M8tMzH8dvsogvPYHLjyqUSR/6Qw75
 Ef5W2a/oq4jbz06cC57/UimMgSMBoMJIxkoKCJvQeEsgFUUHLFQ+vqWx/kk+w4XYAgOe
 nlyqWTC7WW77xaoaX3dIWqTFfcdPBptB6M5TNtADEn19TUa3XtViYBZL9/LUW65MNbKl
 AFWQ==
X-Gm-Message-State: AFeK/H1956siQhVp5XEDGjx6UVf9qSLtYnj1H/oqc9ZlUuBVGIvDJj1VZRL41zQemUWmD+QsgaPcO/DoCD/FQ4ky
X-Received: by 10.176.3.163 with SMTP id 32mr6195285uau.96.1490138554866; Tue,
 21 Mar 2017 16:22:34 -0700 (PDT)
MIME-Version: 1.0
Sender: sjg@google.com
Received: by 10.159.35.108 with HTTP; Tue, 21 Mar 2017 16:22:14 -0700 (PDT)
In-Reply-To: <20170316213624.140344-6-maxims@google.com>
References: <20170316213624.140344-1-maxims@google.com>
 <20170316213624.140344-6-maxims@google.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 21 Mar 2017 17:22:14 -0600
X-Google-Sender-Auth: 3UIA_HcxLrdjnTE4n0i-giFlMrM
Message-ID: <CAPnjgZ2o+CTn+oR3GZhyHpm04F+e4FZJVvikLKLgsvMerjE_kw@mail.gmail.com>
Subject: Re: [PATCH 05/17] aspeed: Reset Driver
To: Maxim Sloyko <maxims@google.com>
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
X-List-Received-Date: Tue, 21 Mar 2017 23:22:38 -0000

Hi Maxim,

On 16 March 2017 at 15:36, Maxim Sloyko <maxims@google.com> wrote:
> Add Reset Driver for ast2500 SoC. This driver uses Watchdog Timer to
> perform resets and thus depends on it. The actual Watchdog device used
> needs to be configured in Device Tree using "aspeed,wdt" property, which
> must be WDT phandle, for example:
>
> rst: reset-controller {
>     compatible = "aspeed,ast2500-reset";
>     aspeed,wdt = <&wdt1>;
> }
>
> Signed-off-by: Maxim Sloyko <maxims@google.com>
> ---
>
>  arch/arm/include/asm/arch-aspeed/scu_ast2500.h |  28 +++++++
>  drivers/reset/Kconfig                          |  10 +++
>  drivers/reset/Makefile                         |   1 +
>  drivers/reset/ast2500-reset.c                  | 109 +++++++++++++++++++++++++
>  4 files changed, 148 insertions(+)
>  create mode 100644 drivers/reset/ast2500-reset.c
>

Reviewed-by: Simon Glass <sjg@chromium.org>

Nits below.

> diff --git a/arch/arm/include/asm/arch-aspeed/scu_ast2500.h b/arch/arm/include/asm/arch-aspeed/scu_ast2500.h
> index 0fa3ecb9b9..e2556f920d 100644
> --- a/arch/arm/include/asm/arch-aspeed/scu_ast2500.h
> +++ b/arch/arm/include/asm/arch-aspeed/scu_ast2500.h
> @@ -31,6 +31,34 @@
>
>  #define SCU_MISC_UARTCLK_DIV13         (1 << 12)
>
> +/*
> + * SYSRESET is actually more like a Power register,
> + * except that corresponding bit set to 1 means that
> + * the peripheral is off.
> + */
> +#define SCU_SYSRESET_XDMA              (1 << 25)
> +#define SCU_SYSRESET_MCTP              (1 << 24)
> +#define SCU_SYSRESET_ADC               (1 << 23)
> +#define SCU_SYSRESET_JTAG              (1 << 22)
> +#define SCU_SYSRESET_MIC               (1 << 18)
> +#define SCU_SYSRESET_SDIO              (1 << 16)
> +#define SCU_SYSRESET_USB11HOST         (1 << 15)
> +#define SCU_SYSRESET_USBHUB            (1 << 14)
> +#define SCU_SYSRESET_CRT               (1 << 13)
> +#define SCU_SYSRESET_MAC2              (1 << 12)
> +#define SCU_SYSRESET_MAC1              (1 << 11)
> +#define SCU_SYSRESET_PECI              (1 << 10)
> +#define SCU_SYSRESET_PWM               (1 << 9)
> +#define SCU_SYSRESET_PCI_VGA           (1 << 8)
> +#define SCU_SYSRESET_2D                        (1 << 7)
> +#define SCU_SYSRESET_VIDEO             (1 << 6)
> +#define SCU_SYSRESET_LPC               (1 << 5)
> +#define SCU_SYSRESET_HAC               (1 << 4)
> +#define SCU_SYSRESET_USBHID            (1 << 3)
> +#define SCU_SYSRESET_I2C               (1 << 2)
> +#define SCU_SYSRESET_AHB               (1 << 1)
> +#define SCU_SYSRESET_SDRAM_WDT         (1 << 0)
> +
>  #ifndef __ASSEMBLY__
>
>  struct ast2500_clk_priv {
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index c42b0bcf0e..eb54189d4b 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -43,4 +43,14 @@ config RESET_UNIPHIER
>           Say Y if you want to control reset signals provided by System Control
>           block, Media I/O block, Peripheral Block.
>
> +config AST2500_RESET
> +       bool "Reset controller driver for AST2500 SoCs"
> +       depends on DM_RESET && WDT_ASPEED
> +       default y if ASPEED_AST2500
> +       help
> +         Support for reset controller on AST2500 SoC. This controller uses
> +         watchdog to reset different peripherals and thus only supports
> +         resets that are supported by watchdog. The main limitation though
> +         is that some reset signals, like I2C or MISC reset multiple devices.
> +
>  endmenu
> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> index 5c4305cc1d..16ad7eed5b 100644
> --- a/drivers/reset/Makefile
> +++ b/drivers/reset/Makefile
> @@ -8,3 +8,4 @@ obj-$(CONFIG_SANDBOX_MBOX) += sandbox-reset-test.o
>  obj-$(CONFIG_TEGRA_CAR_RESET) += tegra-car-reset.o
>  obj-$(CONFIG_TEGRA186_RESET) += tegra186-reset.o
>  obj-$(CONFIG_RESET_UNIPHIER) += reset-uniphier.o
> +obj-$(CONFIG_AST2500_RESET) += ast2500-reset.o
> diff --git a/drivers/reset/ast2500-reset.c b/drivers/reset/ast2500-reset.c
> new file mode 100644
> index 0000000000..0afa4bd01a
> --- /dev/null
> +++ b/drivers/reset/ast2500-reset.c
> @@ -0,0 +1,109 @@
> +/*
> + * Copyright 2017 Google, Inc
> + *
> + * SPDX-License-Identifier: GPL-2.0
> + */
> +
> +#include <common.h>
> +#include <dm.h>
> +#include <misc.h>
> +#include <reset.h>
> +#include <reset-uclass.h>
> +#include <wdt.h>
> +#include <asm/io.h>
> +#include <asm/arch/scu_ast2500.h>
> +#include <asm/arch/wdt.h>
> +
> +DECLARE_GLOBAL_DATA_PTR;
> +
> +struct ast2500_reset_priv {
> +       /* WDT used to perform resets. */
> +       struct udevice *wdt;
> +       struct ast2500_scu *scu;
> +};
> +
> +static int ast2500_ofdata_to_platdata(struct udevice *dev)
> +{
> +       struct ast2500_reset_priv *priv = dev_get_priv(dev);
> +       int ret;
> +
> +       ret = uclass_get_device_by_phandle(UCLASS_WDT, dev, "aspeed,wdt",
> +                                          &priv->wdt);
> +       if (ret) {
> +               debug("%s: can't find WDT for reset controller", __func__);
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +static int ast2500_reset_assert(struct reset_ctl *reset_ctl)
> +{
> +       struct ast2500_reset_priv *priv = dev_get_priv(reset_ctl->dev);
> +       u32 reset_mode, reset_mask;
> +       bool reset_sdram;
> +       int ret;
> +
> +       if (IS_ERR(priv))
> +               return PTR_ERR(priv);

This can never happen so you can drop this code.

> +
> +       /*
> +        * To reset SDRAM, specifal flag in SYSRESET register

a special

> +        * needs to be enabled first
> +        */
> +       reset_mode = ast_reset_mode_from_flags(reset_ctl->id);
> +       reset_mask = ast_reset_mask_from_flags(reset_ctl->id);
> +       reset_sdram = reset_mode == WDT_CTRL_RESET_SOC &&
> +               (reset_mask & WDT_RESET_SDRAM);
> +
> +       if (reset_sdram) {
> +               ast_scu_unlock(priv->scu);
> +               setbits_le32(&priv->scu->sysreset_ctrl1,
> +                            SCU_SYSRESET_SDRAM_WDT);
> +               ret = wdt_reset(priv->wdt, reset_ctl->id);
> +               clrbits_le32(&priv->scu->sysreset_ctrl1,
> +                            SCU_SYSRESET_SDRAM_WDT);
> +               ast_scu_lock(priv->scu);
> +       } else {
> +               ret = wdt_reset(priv->wdt, reset_ctl->id);
> +       }
> +
> +       return ret;
> +}
> +
> +static int ast2500_reset_request(struct reset_ctl *reset_ctl)
> +{
> +       debug("%s(reset_ctl=%p) (dev=%p, id=%lu)\n", __func__, reset_ctl,
> +             reset_ctl->dev, reset_ctl->id);

Should this do anything?

> +
> +       return 0;
> +}
> +
> +static int ast2500_reset_probe(struct udevice *dev)
> +{
> +       struct ast2500_reset_priv *priv = dev_get_priv(dev);
> +
> +       priv->scu = ast_get_scu();

OK, but perhaps at some point scu should be a SYSCON device accessed
with syscon_get_first_range()?

> +
> +       return 0;
> +}
> +
> +static const struct udevice_id ast2500_reset_ids[] = {
> +       { .compatible = "aspeed,ast2500-reset" },
> +       { }
> +};
> +
> +struct reset_ops ast2500_reset_ops = {
> +       .rst_assert = ast2500_reset_assert,
> +       .request = ast2500_reset_request,
> +};
> +
> +U_BOOT_DRIVER(ast2500_reset) = {
> +       .name           = "ast2500_reset",
> +       .id             = UCLASS_RESET,
> +       .of_match = ast2500_reset_ids,
> +       .probe = ast2500_reset_probe,
> +       .ops = &ast2500_reset_ops,
> +       .ofdata_to_platdata = ast2500_ofdata_to_platdata,
> +       .priv_auto_alloc_size = sizeof(struct ast2500_reset_priv),
> +};
> --
> 2.12.0.367.g23dc2f6d3c-goog
>

Regards,
Simon
