Return-Path: <sjg@google.com>
Received: from mail-vk0-x235.google.com (mail-vk0-x235.google.com
 [IPv6:2607:f8b0:400c:c05::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vnpkZ10nXzDqZX
 for <openbmc@lists.ozlabs.org>; Wed, 22 Mar 2017 10:22:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="RCcCoZJ2"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="T3HjHU+w";
 dkim-atps=neutral
Received: by mail-vk0-x235.google.com with SMTP id z204so53491143vkd.1
 for <openbmc@lists.ozlabs.org>; Tue, 21 Mar 2017 16:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=6OVTI32iFFpm53xCMXM1qM+2u/7x+0hD9o6z8/Xxxxk=;
 b=RCcCoZJ2XRoP6bz4TrpUi8Mt5AN3Q38WroA1oBiLGg5tqdiE/Go5mRH8U57IGq9ct+
 BqqDPJjSAWY+YCpZ/EFzg8YaJqGg9ojSAc5rzgQYKsY84EXIcTTTNz3rNC/lSOKAOkRL
 A4pCQcbUiHMfMhEprW3QnelGi38hBw0j+NGez4LXURXjGAr66V7FUxDP8Gm5lZ5VsA7f
 zQG0nodzYlTCOqvPzVM+xTjqjU5qNv2BE8zrdZ0Lse20qVeeRRigaDs9vNIL9pE55UXc
 95qrcEpxRyqMrHsJTarQWeEcHhDGv8jpJ5XbRlIzjdRZ2F7cyWDCv2vHy5hvvizxZ8ty
 tByA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=6OVTI32iFFpm53xCMXM1qM+2u/7x+0hD9o6z8/Xxxxk=;
 b=T3HjHU+wF2XbNd4VpiCBRxNZNXgyRD9Zh5RX5E1JHejNlYF0ITQAGq0zIKoaXP+M2i
 LOWJ36Fzduqmq6BExjk87OBWH5TGyQIJqAJ2xwlC6K8OB1gHgl0E4DeYXGZ0BwLJK71O
 XJmLcYPh5Dk2apJP8n7XZdipmmU6VRZFHGhHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=6OVTI32iFFpm53xCMXM1qM+2u/7x+0hD9o6z8/Xxxxk=;
 b=CYM7AHeT0LLItWJDodgFQb2jK44NBjFtTi0HAROjzAecRE13PnkD2mqFNhvXzuyHq/
 Y5Xs0UsdMV1VmUavLvbXVXfG01a1AQIkYjYT5H5pUxuJhlNhpLAjlo+fzuVMCEtuHjBh
 TxAGDEcQ5iIDcFvYAvots73cEGrc0+sXQG8p4O9g1VjwziPnti8u0xxO6QM0d9r35Z/b
 7q2XS7BWMf5J8pfacfeoBq6t1FoJuelFyxOEBQ9flayS/ej4f5FrCQocfM6WwaLSXP0J
 JeXRi8MNvbGBeaEZxQ7mLvHy+z41II8+AyMLg4LmTR/NPfg4StqVeaASC8WXxP8zj8a+
 ndpg==
X-Gm-Message-State: AFeK/H3jyawfwFseHHPMplbgLvQEABEyHtOYGgm5y04A9II9v2K3oON9mAF5CFL4O884Xc5o5X/kKlPxswGeERU6
X-Received: by 10.31.190.196 with SMTP id o187mr388805vkf.71.1490138547698;
 Tue, 21 Mar 2017 16:22:27 -0700 (PDT)
MIME-Version: 1.0
Sender: sjg@google.com
Received: by 10.159.35.108 with HTTP; Tue, 21 Mar 2017 16:22:07 -0700 (PDT)
In-Reply-To: <20170316213624.140344-4-maxims@google.com>
References: <20170316213624.140344-1-maxims@google.com>
 <20170316213624.140344-4-maxims@google.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 21 Mar 2017 17:22:07 -0600
X-Google-Sender-Auth: irvhE0fW7nTk9Ig55FmUhyagsIE
Message-ID: <CAPnjgZ1WcEQVGErmmRKyr=oUXL6DPJJK+6JCXBQbf-W2BACMdA@mail.gmail.com>
Subject: Re: [PATCH 03/17] aspeed: Watchdog Timer Driver
To: Maxim Sloyko <maxims@google.com>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Albert Aribaud <albert.u.boot@aribaud.net>
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
X-List-Received-Date: Tue, 21 Mar 2017 23:22:30 -0000

Hi Maxim,

On 16 March 2017 at 15:36, Maxim Sloyko <maxims@google.com> wrote:
> This driver supports ast2500 and ast2400 SoCs.
> Only ast2500 supports reset_mask and thus the option of resettting
> individual peripherals using WDT.
>
> Signed-off-by: Maxim Sloyko <maxims@google.com>
> ---
>
>  arch/arm/include/asm/arch-aspeed/wdt.h |  53 ++++++++++++--
>  arch/arm/mach-aspeed/ast_wdt.c         |  40 ++++++++---

I feel that all of the code in this file should move into the driver file below.

>  drivers/watchdog/Kconfig               |  13 ++++
>  drivers/watchdog/Makefile              |   1 +
>  drivers/watchdog/ast_wdt.c             | 125 +++++++++++++++++++++++++++++++++
>  5 files changed, 219 insertions(+), 13 deletions(-)
>  create mode 100644 drivers/watchdog/ast_wdt.c
>
> diff --git a/arch/arm/include/asm/arch-aspeed/wdt.h b/arch/arm/include/asm/arch-aspeed/wdt.h
> index b292a0e67b..981fa05a56 100644
> --- a/arch/arm/include/asm/arch-aspeed/wdt.h
> +++ b/arch/arm/include/asm/arch-aspeed/wdt.h
> @@ -67,15 +67,60 @@ struct ast_wdt {
>         u32 timeout_status;
>         u32 clr_timeout_status;
>         u32 reset_width;
> -#ifdef CONFIG_ASPEED_AST2500
> +       /* On pre-ast2500 SoCs this register is reserved. */
>         u32 reset_mask;
> -#else
> -       u32 reserved0;
> -#endif
>  };
>
> +/**
> + * Given flags parameter passed to wdt_reset or wdt_start uclass functions,
> + * gets Reset Mode value from it.
> + *
> + * @flags: flags parameter passed into wdt_reset or wdt_start
> + * @return Reset Mode value
> + */
> +u32 ast_reset_mode_from_flags(ulong flags);
> +
> +/**
> + * Given flags parameter passed to wdt_reset or wdt_start uclass functions,
> + * gets Reset Mask value from it. Reset Mask is only supported on ast2500
> + *
> + * @flags: flags parameter passed into wdt_reset or wdt_start
> + * @return Reset Mask value
> + */
> +u32 ast_reset_mask_from_flags(ulong flags);
> +
> +/**
> + * Given Reset Mask and Reset Mode values, converts them to flags,
> + * suitable for passing into wdt_start or wdt_reset uclass functions.
> + *
> + * On ast2500 Reset Mask is 25 bits wide and Reset Mode is 2 bits wide, so they
> + * can both be packed into single 32 bits wide value.
> + *
> + * @reset_mode: Reset Mode
> + * @reset_mask: Reset Mask
> + */
> +ulong ast_flags_from_reset_mode_mask(u32 reset_mode, u32 reset_mask);
> +
> +#ifndef CONFIG_WDT
> +/**
> + * Stop WDT
> + *
> + * @wdt: watchdog to stop
> + *
> + * When using driver model this function has different signature
> + */
>  void wdt_stop(struct ast_wdt *wdt);
> +
> +/**
> + * Stop WDT
> + *
> + * @wdt: watchdog to start
> + * @timeout    watchdog timeout in number of clock ticks
> + *
> + * When using driver model this function has different signature
> + */
>  void wdt_start(struct ast_wdt *wdt, u32 timeout);
> +#endif  /* CONFIG_WDT */
>
>  /**
>   * Reset peripherals specified by mask
> diff --git a/arch/arm/mach-aspeed/ast_wdt.c b/arch/arm/mach-aspeed/ast_wdt.c
> index 22481ab7ea..895fba3366 100644
> --- a/arch/arm/mach-aspeed/ast_wdt.c
> +++ b/arch/arm/mach-aspeed/ast_wdt.c
> @@ -9,6 +9,27 @@
>  #include <asm/arch/wdt.h>
>  #include <linux/err.h>
>
> +u32 ast_reset_mode_from_flags(ulong flags)
> +{
> +       return flags & WDT_CTRL_RESET_MASK;
> +}
> +
> +u32 ast_reset_mask_from_flags(ulong flags)
> +{
> +       return flags >> 2;
> +}

I'm not sure those two functions are worth it. Who calls them?

> +
> +ulong ast_flags_from_reset_mode_mask(u32 reset_mode, u32 reset_mask)

function comment?

> +{
> +       ulong ret = reset_mode & WDT_CTRL_RESET_MASK;
> +
> +       if (ret == WDT_CTRL_RESET_SOC)
> +               ret |= (reset_mask << 2);
> +
> +       return ret;
> +}
> +
> +#ifndef CONFIG_WDT
>  void wdt_stop(struct ast_wdt *wdt)
>  {
>         clrbits_le32(&wdt->ctrl, WDT_CTRL_EN);
> @@ -26,15 +47,7 @@ void wdt_start(struct ast_wdt *wdt, u32 timeout)
>         setbits_le32(&wdt->ctrl,
>                      WDT_CTRL_EN | WDT_CTRL_RESET | WDT_CTRL_CLK1MHZ);
>  }
> -
> -struct ast_wdt *ast_get_wdt(u8 wdt_number)
> -{
> -       if (wdt_number > CONFIG_WDT_NUM - 1)
> -               return ERR_PTR(-EINVAL);
> -
> -       return (struct ast_wdt *)(WDT_BASE +
> -                                 sizeof(struct ast_wdt) * wdt_number);
> -}
> +#endif  /* CONFIG_WDT */
>
>  int ast_wdt_reset_masked(struct ast_wdt *wdt, u32 mask)
>  {
> @@ -57,3 +70,12 @@ int ast_wdt_reset_masked(struct ast_wdt *wdt, u32 mask)
>         return -EINVAL;
>  #endif
>  }
> +
> +struct ast_wdt *ast_get_wdt(u8 wdt_number)

s/u8/uint/ or similar. It can only hurt code size to require the
compiler to mask arguments.

> +{
> +       if (wdt_number > CONFIG_WDT_NUM - 1)
> +               return ERR_PTR(-EINVAL);
> +
> +       return (struct ast_wdt *)(WDT_BASE +

Can this come from the device tree?

> +                                 sizeof(struct ast_wdt) * wdt_number);
> +}
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 0d7366f3df..10f34f5efa 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -9,3 +9,16 @@ config WDT
>           start, restart, stop and reset (expire immediately).
>           What exactly happens when the timer expires is up to a particular
>           device/driver.
> +
> +config WDT_ASPEED
> +       bool "Aspeed ast2400/ast2500 watchdog timer support"
> +       depends on WDT
> +       default y if ARCH_ASPEED
> +       help
> +         Select this to enable watchdog timer for Aspeed ast2500/ast2400 devices.
> +         The watchdog timer is stopped when initialized. It performs reset, either
> +         full SoC reset or CPU or just some peripherals, based on the flags.
> +         It currently does not support Boot Flash Addressing Mode Detection or
> +         Second Boot.
> +
> +endmenu
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index 1aabcb97ae..1d779a8446 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -16,3 +16,4 @@ obj-$(CONFIG_BFIN_WATCHDOG)  += bfin_wdt.o
>  obj-$(CONFIG_OMAP_WATCHDOG) += omap_wdt.o
>  obj-$(CONFIG_DESIGNWARE_WATCHDOG) += designware_wdt.o
>  obj-$(CONFIG_WDT) += wdt-uclass.o
> +obj-$(CONFIG_WDT_ASPEED) += ast_wdt.o
> diff --git a/drivers/watchdog/ast_wdt.c b/drivers/watchdog/ast_wdt.c
> new file mode 100644
> index 0000000000..d53aada332
> --- /dev/null
> +++ b/drivers/watchdog/ast_wdt.c
> @@ -0,0 +1,125 @@
> +/*
> + * Copyright 2017 Google, Inc
> + *
> + * SPDX-License-Identifier:    GPL-2.0+
> + */
> +
> +#include <common.h>
> +#include <dm.h>
> +#include <errno.h>
> +#include <wdt.h>
> +#include <asm/io.h>
> +#include <asm/arch/wdt.h>
> +
> +#define WDT_AST2500    2500
> +#define WDT_AST2400    2400
> +
> +DECLARE_GLOBAL_DATA_PTR;
> +
> +struct ast_wdt_priv {
> +       struct ast_wdt *regs;
> +};
> +
> +static int ast_wdt_start(struct udevice *dev, u64 timeout, ulong flags)
> +{
> +       struct ast_wdt_priv *priv = dev_get_priv(dev);
> +       ulong driver_data = dev_get_driver_data(dev);
> +       u32 reset_mode = ast_reset_mode_from_flags(flags);
> +
> +       clrsetbits_le32(&priv->regs->ctrl,
> +                       WDT_CTRL_RESET_MASK << WDT_CTRL_RESET_MODE_SHIFT,
> +                       reset_mode << WDT_CTRL_RESET_MODE_SHIFT);
> +
> +       if (driver_data >= WDT_AST2500 && reset_mode == WDT_CTRL_RESET_SOC)
> +               writel(ast_reset_mask_from_flags(flags),
> +                      &priv->regs->reset_mask);
> +
> +       writel((u32) timeout, &priv->regs->counter_reload_val);
> +       writel(WDT_COUNTER_RESTART_VAL, &priv->regs->counter_restart);
> +       /*
> +        * Setting CLK1MHZ bit is just for compatibility with ast2400 part.
> +        * On ast2500 watchdog timer clock is fixed at 1MHz and the bit is
> +        * read-only
> +        */
> +       setbits_le32(&priv->regs->ctrl,
> +                    WDT_CTRL_EN | WDT_CTRL_RESET | WDT_CTRL_CLK1MHZ);
> +
> +       return 0;
> +}
> +
> +static int ast_wdt_stop(struct udevice *dev)
> +{
> +       struct ast_wdt_priv *priv = dev_get_priv(dev);
> +
> +       clrbits_le32(&priv->regs->ctrl, WDT_CTRL_EN);
> +
> +       return 0;
> +}
> +
> +static int ast_wdt_restart(struct udevice *dev)
> +{
> +       struct ast_wdt_priv *priv = dev_get_priv(dev);
> +
> +       writel(WDT_COUNTER_RESTART_VAL, &priv->regs->counter_restart);
> +
> +       return 0;
> +}
> +
> +static int ast_wdt_reset(struct udevice *dev, ulong flags)
> +{
> +       struct ast_wdt_priv *priv = dev_get_priv(dev);
> +       int ret;
> +
> +       ret = ast_wdt_start(dev, 1, flags);
> +       if (ret)
> +               return ret;

This feels a bit like what the default uclass imp does?

> +
> +       while (readl(&priv->regs->ctrl) & WDT_CTRL_EN)
> +               ;

I am keen to avoid loops in drivers. Can this return -EINPROGRESS and
have the loop be in the uclass? This is how sysreset works.

> +
> +       return ast_wdt_stop(dev);
> +}
> +
> +static int ast_wdt_ofdata_to_platdata(struct udevice *dev)
> +{
> +       struct ast_wdt_priv *priv = dev_get_priv(dev);
> +
> +       priv->regs = dev_get_addr_ptr(dev);
> +       if (IS_ERR(priv->regs))

This actually returns NULL on error.

> +               return PTR_ERR(priv->regs);
> +
> +       return 0;
> +}
> +
> +static const struct wdt_ops ast_wdt_ops = {
> +       .start = ast_wdt_start,
> +       .restart = ast_wdt_restart,
> +       .stop = ast_wdt_stop,
> +       .reset = ast_wdt_reset,
> +};
> +
> +static const struct udevice_id ast_wdt_ids[] = {
> +       { .compatible = "aspeed,wdt", .data = WDT_AST2500 },
> +       { .compatible = "aspeed,ast2500-wdt", .data = WDT_AST2500 },
> +       { .compatible = "aspeed,ast2400-wdt", .data = WDT_AST2400 },
> +       {}
> +};
> +
> +static int ast_wdt_probe(struct udevice *dev)
> +{
> +       debug("%s() wdt%u\n", __func__, dev->seq);
> +       ast_wdt_stop(dev);

check error? Why would you call stop when probing?

> +
> +       return 0;
> +}
> +
> +U_BOOT_DRIVER(ast_wdt) = {
> +       .name = "ast_wdt",
> +       .id = UCLASS_WDT,
> +       .of_match = ast_wdt_ids,
> +       .probe = ast_wdt_probe,
> +       .priv_auto_alloc_size = sizeof(struct ast_wdt_priv),
> +       .ofdata_to_platdata = ast_wdt_ofdata_to_platdata,
> +       .ops = &ast_wdt_ops,
> +       .flags = DM_FLAG_PRE_RELOC,
> +};
> --
> 2.12.0.367.g23dc2f6d3c-goog
>

Regards,
Simon
