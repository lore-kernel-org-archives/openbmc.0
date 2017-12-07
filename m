Return-Path: <brendanhiggins@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400d:c0d::244; helo=mail-qt0-x244.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="uUB/u4b9"; 
 dkim-atps=neutral
Received: from mail-qt0-x244.google.com (mail-qt0-x244.google.com
 [IPv6:2607:f8b0:400d:c0d::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yt6jd6fDbzDsQ0
 for <openbmc@lists.ozlabs.org>; Fri,  8 Dec 2017 07:37:25 +1100 (AEDT)
Received: by mail-qt0-x244.google.com with SMTP id g10so20913874qtj.12
 for <openbmc@lists.ozlabs.org>; Thu, 07 Dec 2017 12:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=bo8Nxedk52+cwTRwLBVi40t/m4goQB7MdElXccsnRLA=;
 b=uUB/u4b9C/2ArqMy7KDbCxunTWlK6RuLqDX8hBE5gKI0s7/9meTx918jLPCBSZ0n4K
 dRMGjXp60q1SUJ3/MGSY6mNDnZclZVYJ2xkz9DKygWSD+itDFwDi3m5ggzBt7x6xKbLa
 jO/TFaC2IXDZqKmqMaMS47Ec52tALF+Q/AlQZDbZ3HFFlQqBkr38V+pg8EknqLh9K3BK
 KY0Dx/MCC0P+9pZifSky/jL0r3POg/g7bO52qEroqqIZPan0CfFIJLRbw45VtkOXD4cN
 as8YYsZlY4ZBu53pr5qS0AYZc8Ga0x1UiM9EdAQYG1kdbihVNDjBmVLKEFKUEqyUNs+X
 C3aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=bo8Nxedk52+cwTRwLBVi40t/m4goQB7MdElXccsnRLA=;
 b=cjxHwucQyOu2LQip2TFJ4d93rZ5G8xKCeINLi+AevLDhFIrFcrsoXhK9rsBpx1+kbz
 u2g2O5OXDqRk5R810AcoQb0HsnqesO0y1ysolXl9Q13iVQEX8QepLw9sC/qmxgwjq5jb
 UZxySVrnT5Lc/6U3WUORmznQGWPCo75BHhBZDnV0pVpVG1GjcOKbLIu2F4hRpjG6M1hm
 NrHkUNZGqQiq2UOew/Yu4rA7CbwxLBjJRuCu+iU8pTV3aFELvtntGMXtpz0A4vWqxRA6
 Mlv6RSW7Mobi+Q0ZXtxrLqQFg9FHDdD8rFB65aSrJtVTFFM4wsO0NkMSG13wlJRHC3wY
 Gi0w==
X-Gm-Message-State: AKGB3mIkFFMPkfyr7wuIcACZ9XJAxqM0iHj5jtccaTvk28pqsJQPggro
 vIgc8WK4//ge6kQzC4TRdb1FWSk0/+QKCwho3HOZ6g==
X-Google-Smtp-Source: AGs4zMZCEB5ryl87IcecTxrcUbjFMbhpEoFnNPgQEtAj1qoyXu6sz43AdFvVFFKwwvTx4wa8WgHlAi9cGIQNuSiDfw8=
X-Received: by 10.200.52.232 with SMTP id x37mr12113124qtb.287.1512679042270; 
 Thu, 07 Dec 2017 12:37:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.99.79 with HTTP; Thu, 7 Dec 2017 12:37:21 -0800 (PST)
In-Reply-To: <20171117190747.21642-2-brendanhiggins@google.com>
References: <20171117190747.21642-1-brendanhiggins@google.com>
 <20171117190747.21642-2-brendanhiggins@google.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Thu, 7 Dec 2017 12:37:21 -0800
Message-ID: <CAFd5g45+dNuayw=s08iwAj2wrUYNXnGd5SbA+OVvsL_J6APHGA@mail.gmail.com>
Subject: Re: [PATCH v8 1/3] arm: npcm: add basic support for Nuvoton BMCs
To: Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Mark Rutland <mark.rutland@arm.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Avi Fishman <avifishman70@gmail.com>, Rick Altherr <raltherr@google.com>, 
 Florian Fainelli <f.fainelli@gmail.com>, julien.thierry@arm.com, 
 devicetree <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Dec 2017 20:37:26 -0000

Any update on this?

On Fri, Nov 17, 2017 at 11:07 AM, Brendan Higgins
<brendanhiggins@google.com> wrote:
> Adds basic support for the Nuvoton NPCM750 BMC.
>
> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> Reviewed-by: Tomer Maimon <tmaimon77@gmail.com>
> Reviewed-by: Avi Fishman <avifishman70@gmail.com>
> Tested-by: Tomer Maimon <tmaimon77@gmail.com>
> Tested-by: Avi Fishman <avifishman70@gmail.com>
> ---
> Changes since v7:
>   - Fixed useless parameter in print statement
>   - Added/cleaned up some comments
>   - Fixed typo in DT_MACHINE_START
>   - Got rid of L2C aux value
>   - Dropped unnecessary memory barriers
>   - Renamed CPU_NPCM750 to ARCH_NPCM750
>   - Fixed some other minor issues
> ---
>  arch/arm/Kconfig             |  2 ++
>  arch/arm/Makefile            |  1 +
>  arch/arm/mach-npcm/Kconfig   | 48 +++++++++++++++++++++++++
>  arch/arm/mach-npcm/Makefile  |  3 ++
>  arch/arm/mach-npcm/headsmp.S | 21 +++++++++++
>  arch/arm/mach-npcm/npcm7xx.c | 25 +++++++++++++
>  arch/arm/mach-npcm/platsmp.c | 85 ++++++++++++++++++++++++++++++++++++++++++++
>  7 files changed, 185 insertions(+)
>  create mode 100644 arch/arm/mach-npcm/Kconfig
>  create mode 100644 arch/arm/mach-npcm/Makefile
>  create mode 100644 arch/arm/mach-npcm/headsmp.S
>  create mode 100644 arch/arm/mach-npcm/npcm7xx.c
>  create mode 100644 arch/arm/mach-npcm/platsmp.c
>
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 61a0cb15067e..05543f1cfbde 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -782,6 +782,8 @@ source "arch/arm/mach-netx/Kconfig"
>
>  source "arch/arm/mach-nomadik/Kconfig"
>
> +source "arch/arm/mach-npcm/Kconfig"
> +
>  source "arch/arm/mach-nspire/Kconfig"
>
>  source "arch/arm/plat-omap/Kconfig"
> diff --git a/arch/arm/Makefile b/arch/arm/Makefile
> index 47d3a1ab08d2..60ca50c7d762 100644
> --- a/arch/arm/Makefile
> +++ b/arch/arm/Makefile
> @@ -191,6 +191,7 @@ machine-$(CONFIG_ARCH_MEDIATEK)             += mediatek
>  machine-$(CONFIG_ARCH_MXS)             += mxs
>  machine-$(CONFIG_ARCH_NETX)            += netx
>  machine-$(CONFIG_ARCH_NOMADIK)         += nomadik
> +machine-$(CONFIG_ARCH_NPCM)            += npcm
>  machine-$(CONFIG_ARCH_NSPIRE)          += nspire
>  machine-$(CONFIG_ARCH_OXNAS)           += oxnas
>  machine-$(CONFIG_ARCH_OMAP1)           += omap1
> diff --git a/arch/arm/mach-npcm/Kconfig b/arch/arm/mach-npcm/Kconfig
> new file mode 100644
> index 000000000000..6ff9df2636be
> --- /dev/null
> +++ b/arch/arm/mach-npcm/Kconfig
> @@ -0,0 +1,48 @@
> +menuconfig ARCH_NPCM
> +       bool "Nuvoton NPCM Architecture"
> +       select ARCH_REQUIRE_GPIOLIB
> +       select USE_OF
> +       select PINCTRL
> +       select PINCTRL_NPCM7XX
> +
> +if ARCH_NPCM
> +
> +comment "NPCM7XX CPU type"
> +
> +config ARCH_NPCM750
> +       depends on ARCH_NPCM && ARCH_MULTI_V7
> +       bool "Support for NPCM750 BMC CPU (Poleg)"
> +       select CACHE_L2X0
> +       select CPU_V7
> +       select ARM_GIC
> +       select HAVE_SMP
> +       select SMP
> +       select SMP_ON_UP
> +       select HAVE_ARM_SCU
> +       select HAVE_ARM_TWD if SMP
> +       select ARM_ERRATA_720789
> +       select ARM_ERRATA_754322
> +       select ARM_ERRATA_764369
> +       select ARM_ERRATA_794072
> +       select PL310_ERRATA_588369
> +       select PL310_ERRATA_727915
> +       select USB_EHCI_ROOT_HUB_TT
> +       select USB_ARCH_HAS_HCD
> +       select USB_ARCH_HAS_EHCI
> +       select USB_EHCI_HCD
> +       select USB_ARCH_HAS_OHCI
> +       select USB_OHCI_HCD
> +       select USB
> +       select FIQ
> +       select CPU_USE_DOMAINS
> +       select GENERIC_CLOCKEVENTS
> +       select CLKDEV_LOOKUP
> +       select COMMON_CLK if OF
> +       select NPCM750_TIMER
> +       select MFD_SYSCON
> +       help
> +         Support for NPCM750 BMC CPU (Poleg).
> +
> +         Nuvoton NPCM750 BMC based on the Cortex A9.
> +
> +endif
> diff --git a/arch/arm/mach-npcm/Makefile b/arch/arm/mach-npcm/Makefile
> new file mode 100644
> index 000000000000..c7a1316d27c1
> --- /dev/null
> +++ b/arch/arm/mach-npcm/Makefile
> @@ -0,0 +1,3 @@
> +AFLAGS_headsmp.o               += -march=armv7-a
> +
> +obj-$(CONFIG_ARCH_NPCM750)     += npcm7xx.o platsmp.o headsmp.o
> diff --git a/arch/arm/mach-npcm/headsmp.S b/arch/arm/mach-npcm/headsmp.S
> new file mode 100644
> index 000000000000..2d0d8880634b
> --- /dev/null
> +++ b/arch/arm/mach-npcm/headsmp.S
> @@ -0,0 +1,21 @@
> +/*
> + * Copyright 2017 Google, Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <linux/linkage.h>
> +#include <linux/init.h>
> +#include <asm/assembler.h>
> +
> +/*
> + * The boot ROM does not start secondary CPUs in SVC mode, so we need to do that
> + * here.
> + */
> +ENTRY(npcm7xx_secondary_startup)
> +       safe_svcmode_maskall r0
> +
> +       b       secondary_startup
> +ENDPROC(npcm7xx_secondary_startup)
> diff --git a/arch/arm/mach-npcm/npcm7xx.c b/arch/arm/mach-npcm/npcm7xx.c
> new file mode 100644
> index 000000000000..500bdd0a9ebb
> --- /dev/null
> +++ b/arch/arm/mach-npcm/npcm7xx.c
> @@ -0,0 +1,25 @@
> +/*
> + * Copyright (c) 2017 Nuvoton Technology corporation.
> + * Copyright 2017 Google, Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/types.h>
> +#include <asm/mach/arch.h>
> +#include <asm/mach-types.h>
> +#include <asm/mach/map.h>
> +#include <asm/hardware/cache-l2x0.h>
> +
> +static const char *const npcm7xx_dt_match[] = {
> +       "nuvoton,npcm750",
> +       NULL
> +};
> +
> +DT_MACHINE_START(NPCM7XX_DT, "NPCM7XX Chip family")
> +       .atag_offset    = 0x100,
> +       .dt_compat      = npcm7xx_dt_match,
> +MACHINE_END
> diff --git a/arch/arm/mach-npcm/platsmp.c b/arch/arm/mach-npcm/platsmp.c
> new file mode 100644
> index 000000000000..959af7bd741f
> --- /dev/null
> +++ b/arch/arm/mach-npcm/platsmp.c
> @@ -0,0 +1,85 @@
> +/*
> + * Copyright 2017 Google, Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#define pr_fmt(fmt) "nuvoton,npcm7xx-smp: " fmt
> +
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/smp.h>
> +#include <linux/io.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/of_platform.h>
> +#include <linux/of_address.h>
> +#include <asm/cacheflush.h>
> +#include <asm/smp.h>
> +#include <asm/smp_plat.h>
> +#include <asm/smp_scu.h>
> +
> +#define NPCM7XX_SCRPAD_REG 0x13c
> +
> +extern void npcm7xx_secondary_startup(void);
> +
> +static int npcm7xx_smp_boot_secondary(unsigned int cpu,
> +                                     struct task_struct *idle)
> +{
> +       struct device_node *gcr_np;
> +       void __iomem *gcr_base;
> +       int ret = 0;
> +
> +       gcr_np = of_find_compatible_node(NULL, NULL, "nuvoton,npcm750-gcr");
> +       if (!gcr_np) {
> +               pr_err("no gcr device node\n");
> +               ret = -ENODEV;
> +               goto out;
> +       }
> +       gcr_base = of_iomap(gcr_np, 0);
> +       if (!gcr_base) {
> +               pr_err("could not iomap gcr");
> +               ret = -ENOMEM;
> +               goto out;
> +       }
> +
> +       /* give boot ROM kernel start address. */
> +       iowrite32(__pa_symbol(npcm7xx_secondary_startup), gcr_base +
> +                 NPCM7XX_SCRPAD_REG);
> +       /* make sure the previous write is seen by all observers. */
> +       dsb_sev();
> +
> +       iounmap(gcr_base);
> +out:
> +       return ret;
> +}
> +
> +static void __init npcm7xx_smp_prepare_cpus(unsigned int max_cpus)
> +{
> +       struct device_node *scu_np;
> +       void __iomem *scu_base;
> +
> +       scu_np = of_find_compatible_node(NULL, NULL, "arm,cortex-a9-scu");
> +       if (!scu_np) {
> +               pr_err("no scu device node\n");
> +               return;
> +       }
> +       scu_base = of_iomap(scu_np, 0);
> +       if (!scu_base) {
> +               pr_err("could not iomap scu");
> +               return;
> +       }
> +
> +       scu_enable(scu_base);
> +
> +       iounmap(scu_base);
> +}
> +
> +static struct smp_operations npcm7xx_smp_ops __initdata = {
> +       .smp_prepare_cpus = npcm7xx_smp_prepare_cpus,
> +       .smp_boot_secondary = npcm7xx_smp_boot_secondary,
> +};
> +
> +CPU_METHOD_OF_DECLARE(npcm7xx_smp, "nuvoton,npcm7xx-smp", &npcm7xx_smp_ops);
> --
> 2.15.0.448.gf294e3d99a-goog
>
