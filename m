Return-Path: <brendanhiggins@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400d:c09::229; helo=mail-qk0-x229.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Es++FaGg"; 
 dkim-atps=neutral
Received: from mail-qk0-x229.google.com (mail-qk0-x229.google.com
 [IPv6:2607:f8b0:400d:c09::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xnpQY4wFLzDrVv
 for <openbmc@lists.ozlabs.org>; Thu,  7 Sep 2017 15:09:09 +1000 (AEST)
Received: by mail-qk0-x229.google.com with SMTP id a128so24416200qkc.5
 for <openbmc@lists.ozlabs.org>; Wed, 06 Sep 2017 22:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=21mflyth2fp3oGWI92lIVOVvQ13TXfrI/COiikaX6UI=;
 b=Es++FaGgrh3QWPU1dPlbBUyMoGwZ9wrmngkbE0R3C94Oiq9nCzoBYVH08g6YUDPvf5
 GFtrfErjQMI84LqQMnEzlYhzS84Hshn9W5qkyWV4OfwmRiHw8Xdhw0tJpYbYH0ok3NRd
 JSBIVkFAnyOphmGwc2hOrh5t7HTPhv20JzoGr0+RqUZap/Ae1g8uBBlu3yWQQ0S3R+D9
 0Oz4RO8Y5jQjZOMIR9Ny6rZyZkC9bswuSaTq5AqpOK8P2nYL3GNCQwkOtoyOIQ7Ewd9h
 rKavGvtk6Kqrfdc/FhNigz2FfA09G5L1KotWSDQMDLSqvHfby9GxXiP7CV7QiC50Fp29
 vXLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=21mflyth2fp3oGWI92lIVOVvQ13TXfrI/COiikaX6UI=;
 b=GDFa98TDOheyOQEykUoAh7Y4fOuyMyoO6eEwXo+bMY0ns4dmU3Vcwod5H7AMSMfRYt
 q0QhVIx0jpQL8Dhg+uF+Zr0aMCl5F0RAiQ/2hSgeqWr+J/TaJZ3SzXvUNVB/Y1Bf5wOH
 e1WVkXIOND8Oy3A2MitHhqWJTmAPCV89Gkg9teea9+/ntTV/zFIj7xFlSor1ZpQ+zBln
 10nqXTOFUGvBehPgSseJN7thjtmroDYXJRy9vO3ZiHOKakUJuPqSNbgSJ2wM6X3VmzxU
 62oBnAzttyZ6wIJ1VvJuyyyXzK0LjN8sd4eouRNwcPWcQ8hHfgtM9JpN5j4lxEwqQ9oJ
 9QEA==
X-Gm-Message-State: AHPjjUhhb+3RSGmitVi1LLiGxw5fWIvevYWf+S7XWlAgVVmRgaQJRxBw
 Jkttrgu3cE6dbcvCGWRoheQzVS23wY/7
X-Google-Smtp-Source: ADKCNb65m+w77/z6ajzz7+JZNwT252yWnon88SVQk5teK84lnY++vzqQRbOjkFsBN6Y9b3FX0Q5T3G7+T0Fxd40lpn8=
X-Received: by 10.233.235.17 with SMTP id b17mr1870111qkg.254.1504760946271;
 Wed, 06 Sep 2017 22:09:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.33.230 with HTTP; Wed, 6 Sep 2017 22:09:05 -0700 (PDT)
In-Reply-To: <CAKKbWA4OXL__VWzwRvN_wujDc70zWqmGPcu2_WRpvsSUYba1Qg@mail.gmail.com>
References: <20170906080751.6773-1-brendanhiggins@google.com>
 <20170906080751.6773-2-brendanhiggins@google.com>
 <CAKKbWA4OXL__VWzwRvN_wujDc70zWqmGPcu2_WRpvsSUYba1Qg@mail.gmail.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Wed, 6 Sep 2017 22:09:05 -0700
Message-ID: <CAFd5g46fh3unYC8J3CyUg25=3XAbz+U-XC6ON7V9p5Nt0mLKgA@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] arm: npcm: add basic support for Nuvoton BMCs
To: Avi Fishman <avifishman70@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Russell King <linux@armlinux.org.uk>, tmaimon77@gmail.com, 
 Rick Altherr <raltherr@google.com>, Florian Fainelli <f.fainelli@gmail.com>, 
 Joel Stanley <joel@jms.id.au>, devicetree <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Thu, 07 Sep 2017 05:09:10 -0000

On Wed, Sep 6, 2017 at 2:04 PM, Avi Fishman <avifishman70@gmail.com> wrote:
> Sorry for sending again some mailing list rejected it due to HTML
> involved (althoug I tried Plain Text), Trying again.
>
> 2017-09-06 11:07 GMT+03:00 Brendan Higgins <brendanhiggins@google.com>:
>> Adds basic support for the Nuvoton NPCM750 BMC.
>>
>> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
>> ---
>>  arch/arm/Kconfig             |  2 +
>>  arch/arm/Makefile            |  1 +
>>  arch/arm/mach-npcm/Kconfig   | 50 +++++++++++++++++++++++++
>>  arch/arm/mach-npcm/Makefile  |  3 ++
>>  arch/arm/mach-npcm/headsmp.S | 17 +++++++++
>>  arch/arm/mach-npcm/npcm7xx.c | 34 +++++++++++++++++
>>  arch/arm/mach-npcm/platsmp.c | 89 ++++++++++++++++++++++++++++++++++++++++++++
>>  7 files changed, 196 insertions(+)
>>  create mode 100644 arch/arm/mach-npcm/Kconfig
>>  create mode 100644 arch/arm/mach-npcm/Makefile
>>  create mode 100644 arch/arm/mach-npcm/headsmp.S
>>  create mode 100644 arch/arm/mach-npcm/npcm7xx.c
>>  create mode 100644 arch/arm/mach-npcm/platsmp.c
>>
>> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
>> index 61a0cb15067e..05543f1cfbde 100644
>> --- a/arch/arm/Kconfig
>> +++ b/arch/arm/Kconfig
>> @@ -782,6 +782,8 @@ source "arch/arm/mach-netx/Kconfig"
>>
>>  source "arch/arm/mach-nomadik/Kconfig"
>>
>> +source "arch/arm/mach-npcm/Kconfig"
>> +
>>  source "arch/arm/mach-nspire/Kconfig"
>>
>>  source "arch/arm/plat-omap/Kconfig"
>> diff --git a/arch/arm/Makefile b/arch/arm/Makefile
>> index 47d3a1ab08d2..60ca50c7d762 100644
>> --- a/arch/arm/Makefile
>> +++ b/arch/arm/Makefile
>> @@ -191,6 +191,7 @@ machine-$(CONFIG_ARCH_MEDIATEK)             += mediatek
>>  machine-$(CONFIG_ARCH_MXS)             += mxs
>>  machine-$(CONFIG_ARCH_NETX)            += netx
>>  machine-$(CONFIG_ARCH_NOMADIK)         += nomadik
>> +machine-$(CONFIG_ARCH_NPCM)            += npcm
>>  machine-$(CONFIG_ARCH_NSPIRE)          += nspire
>>  machine-$(CONFIG_ARCH_OXNAS)           += oxnas
>>  machine-$(CONFIG_ARCH_OMAP1)           += omap1
>> diff --git a/arch/arm/mach-npcm/Kconfig b/arch/arm/mach-npcm/Kconfig
>> new file mode 100644
>> index 000000000000..d47061855439
>> --- /dev/null
>> +++ b/arch/arm/mach-npcm/Kconfig
>> @@ -0,0 +1,50 @@
>> +menuconfig ARCH_NPCM
>> +       bool "Nuvoton NPCM Architecture"
>> +       select ARCH_REQUIRE_GPIOLIB
>> +       select USE_OF
>> +       select PINCTRL
>> +       select PINCTRL_NPCM7XX
>> +
>> +if ARCH_NPCM
>> +
>> +comment "NPCMX50 CPU type"
>> +
>> +config CPU_NPCM750
>> +       depends on ARCH_NPCM && ARCH_MULTI_V7
>> +       bool "Support for NPCM750 BMC CPU (Poleg)"
>> +       select CACHE_L2X0
>> +       select CPU_V7
>> +       select ARM_GIC
>> +       select HAVE_SMP
>> +       select SMP
>> +       select SMP_ON_UP
>> +       select HAVE_ARM_SCU
>> +       select HAVE_ARM_TWD if SMP
>> +       select ARM_ERRATA_458693
>> +       select ARM_ERRATA_720789
>> +       select ARM_ERRATA_742231
>> +       select ARM_ERRATA_754322
>> +       select ARM_ERRATA_764369
>> +       select ARM_ERRATA_794072
>> +       select PL310_ERRATA_588369
>> +       select PL310_ERRATA_727915
>> +       select USB_EHCI_ROOT_HUB_TT
>> +       select USB_ARCH_HAS_HCD
>> +       select USB_ARCH_HAS_EHCI
>> +       select USB_EHCI_HCD
>> +       select USB_ARCH_HAS_OHCI
>> +       select USB_OHCI_HCD
>> +       select USB
>> +       select FIQ
>> +       select CPU_USE_DOMAINS
>> +       select GENERIC_CLOCKEVENTS
>> +       select CLKDEV_LOOKUP
>> +       select COMMON_CLK if OF
>> +       select NPCM750_TIMER
>> +       select MFD_SYSCON
>> +       help
>> +         Support for NPCM750 BMC CPU (Poleg).
>> +
>> +         Nuvoton NPCM750 BMC based on the Cortex A9.
>> +
>> +endif
>> diff --git a/arch/arm/mach-npcm/Makefile b/arch/arm/mach-npcm/Makefile
>> new file mode 100644
>> index 000000000000..78416055b854
>> --- /dev/null
>> +++ b/arch/arm/mach-npcm/Makefile
>> @@ -0,0 +1,3 @@
>> +AFLAGS_headsmp.o               += -march=armv7-a
>> +
>> +obj-$(CONFIG_CPU_NPCM750)      += npcm7xx.o platsmp.o headsmp.o
>> diff --git a/arch/arm/mach-npcm/headsmp.S b/arch/arm/mach-npcm/headsmp.S
>> new file mode 100644
>> index 000000000000..9fccbbd49ed4
>> --- /dev/null
>> +++ b/arch/arm/mach-npcm/headsmp.S
>> @@ -0,0 +1,17 @@
>> +/*
>> + * Copyright 2017 Google, Inc.
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
>> + */
>> +
>> +#include <linux/linkage.h>
>> +#include <linux/init.h>
>> +#include <asm/assembler.h>
>> +
>> +ENTRY(npcm7xx_secondary_startup)
>> +       safe_svcmode_maskall r0
>
> I saw you  answered to Florian Fainelli that the BootRom is not
> starting the secondary CPU in SVC mode. Are you sure? In our
> engineering npcm7xx revision, Z1, the BootRom indeed started to run it
> in IRQ mode but we fixed it in the production version, A1, (quite long
> time ago), I hope you didn't get an EB with Z1 you can check that in
> BootBlock console print:
>> ADC CLK is set to 25000000
>>Last reset was CORST
>>vgaioen=1 and mux gspi.
>>A1 <<====== this is what you should see, if you see Z1 we need to replace your EB
>

Nope, on boot it prints:

>EB
>Board manufacturer: Nuvoton

> CPU CLK is 800000000
> MC  CLK is 800000000

> ADC CLK is set to 25000000
>Last reset was PORST
>vgaioen=1 and mux gspi.
>A1
>Skip PCI config.

To reproduce, all you have to do is delete

>> +       safe_svcmode_maskall r0

and the kernel will warn that the core is not starting in SVC mode

>> +
>> +       b       secondary_startup
>> +ENDPROC(npcm7xx_secondary_startup)
>> diff --git a/arch/arm/mach-npcm/npcm7xx.c b/arch/arm/mach-npcm/npcm7xx.c
>> new file mode 100644
>> index 000000000000..132e9d587857
>> --- /dev/null
>> +++ b/arch/arm/mach-npcm/npcm7xx.c
>> @@ -0,0 +1,34 @@
>> +/*
>> + * Copyright (c) 2017 Nuvoton Technology corporation.
>> + * Copyright 2017 Google, Inc.
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
>> + */
>> +
>> +#include <linux/kernel.h>
>> +#include <linux/types.h>
>> +#include <asm/mach/arch.h>
>> +#include <asm/mach-types.h>
>> +#include <asm/mach/map.h>
>> +#include <asm/hardware/cache-l2x0.h>
>> +
>> +#define NPCM7XX_AUX_VAL (L310_AUX_CTRL_INSTR_PREFETCH |                               \
>> +                        L310_AUX_CTRL_DATA_PREFETCH |                         \
>> +                        L310_AUX_CTRL_NS_LOCKDOWN |                           \
>> +                        L310_AUX_CTRL_CACHE_REPLACE_RR |                      \
>> +                        L2C_AUX_CTRL_SHARED_OVERRIDE |                        \
>> +                        L310_AUX_CTRL_FULL_LINE_ZERO)
>> +
>> +static const char *const npcm7xx_dt_match[] = {
>> +       "nuvoton,npcm750",
>> +       NULL
>> +};
>> +
>> +DT_MACHINE_START(NPCM7XX_DT, "NPCMX50 Chip family")
>> +       .atag_offset    = 0x100,
>> +       .dt_compat      = npcm7xx_dt_match,
>> +       .l2c_aux_val    = NPCM7XX_AUX_VAL,
>> +       .l2c_aux_mask   = ~NPCM7XX_AUX_VAL,
>> +MACHINE_END
>> diff --git a/arch/arm/mach-npcm/platsmp.c b/arch/arm/mach-npcm/platsmp.c
>> new file mode 100644
>> index 000000000000..144e3e7ec7e6
>> --- /dev/null
>> +++ b/arch/arm/mach-npcm/platsmp.c
>> @@ -0,0 +1,89 @@
>> +/*
>> + * Copyright 2017 Google, Inc.
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
>> + */
>> +
>> +#define pr_fmt(fmt) "PLATSMP: " fmt
>> +
>> +#include <linux/delay.h>
>> +#include <linux/device.h>
>> +#include <linux/smp.h>
>> +#include <linux/io.h>
>> +#include <linux/of.h>
>> +#include <linux/of_device.h>
>> +#include <linux/of_platform.h>
>> +#include <linux/of_address.h>
>> +#include <asm/cacheflush.h>
>> +#include <asm/smp.h>
>> +#include <asm/smp_plat.h>
>> +#include <asm/smp_scu.h>
>> +
>> +#define NPCM7XX_SCRPAD_REG 0x13c
>> +
>> +extern void npcm7xx_secondary_startup(void);
>> +
>> +static int npcm7xx_smp_boot_secondary(unsigned int cpu,
>> +                                     struct task_struct *idle)
>> +{
>> +       struct device_node *gcr_np;
>> +       void __iomem *gcr_base;
>> +       int ret = 0;
>> +
>> +       gcr_np = of_find_compatible_node(NULL, NULL, "nuvoton,npcm750-gcr");
>> +       if (!gcr_np) {
>> +               pr_err("no gcr device node\n");
>> +               ret = -EFAULT;
>> +               goto out;
>> +       }
>> +       gcr_base = of_iomap(gcr_np, 0);
>> +       if (!gcr_base) {
>> +               pr_err("could not iomap gcr at: 0x%llx\n", gcr_base);
>> +               ret = -EFAULT;
>> +               goto out;
>> +       }
>> +
>> +       /* give boot ROM kernel start address. */
>> +       iowrite32(__pa_symbol(npcm7xx_secondary_startup), gcr_base +
>> +                 NPCM7XX_SCRPAD_REG);
>> +       /* make sure npcm7xx_secondary_startup is seen by all observers. */
>> +       smp_wmb();
>> +       dsb_sev();
>> +       /* make sure write buffer is drained */
>> +       mb();
>> +
>> +out:
>> +       iounmap(gcr_base);
>> +       return ret;
>> +}
>> +
>> +static void __init npcm7xx_smp_prepare_cpus(unsigned int max_cpus)
>> +{
>> +       struct device_node *scu_np;
>> +       void __iomem *scu_base;
>> +
>> +       scu_np = of_find_compatible_node(NULL, NULL, "arm,cortex-a9-scu");
>> +       if (!scu_np) {
>> +               pr_err("no scu device node\n");
>> +               return;
>> +       }
>> +       scu_base = of_iomap(scu_np, 0);
>> +       if (!scu_base) {
>> +               pr_err("could not iomap scu at: 0x%llx\n", scu_base);
>> +               return;
>> +       }
>> +
>> +       scu_enable(scu_base);
>> +
>> +out:
>> +       iounmap(scu_base);
>> +}
>> +
>> +static struct smp_operations npcm7xx_smp_ops __initdata = {
>> +       .smp_prepare_cpus = npcm7xx_smp_prepare_cpus,
>> +       .smp_boot_secondary = npcm7xx_smp_boot_secondary,
>> +};
>> +
>> +CPU_METHOD_OF_DECLARE(npcm7xx_smp, "nuvoton,npcm7xx-smp", &npcm7xx_smp_ops);
>> --
>> 2.14.1.581.gf28d330327-goog
>>
