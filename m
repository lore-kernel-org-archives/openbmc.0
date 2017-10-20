Return-Path: <brendanhiggins@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400d:c0d::242; helo=mail-qt0-x242.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="D+iC0fUN"; 
 dkim-atps=neutral
Received: from mail-qt0-x242.google.com (mail-qt0-x242.google.com
 [IPv6:2607:f8b0:400d:c0d::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yJdRN1fNbzDqKs
 for <openbmc@lists.ozlabs.org>; Sat, 21 Oct 2017 07:57:50 +1100 (AEDT)
Received: by mail-qt0-x242.google.com with SMTP id 31so20019551qtz.9
 for <openbmc@lists.ozlabs.org>; Fri, 20 Oct 2017 13:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=FEaD3noUszgr7z9yNkKnUaJjlLp4VVcesc0bxiotHFQ=;
 b=D+iC0fUNMXK8ErjtXOp+3WA7S97XVo9mX7ouOyhIQxsh8SQggFzOuo3AFJhI62ubEW
 tXJ3Xq79BlkInAYVBUqdndqwTLuO6TjFSy1RDll4HYOZPIXyKuI81bgDF2jZWxFMFXQm
 z+0V3ucTLyOAmjOF06dvm9PYL691EtNU/bENrQZAZaB0D7OFTYNj/q4iv5GYGKeSG+WD
 UIbj3+bP1kXt2CFcrNs5LagxETx7kPGgdURH69n3E32mF6JJQnKaTJoBEptm6MhcftCT
 dmmaAP9IZEnPkLqAFukPKuBCvhLe9KXkPAv4BEVoOQ8BuNMHq58BtySgWUBPO8ogVzig
 xaJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=FEaD3noUszgr7z9yNkKnUaJjlLp4VVcesc0bxiotHFQ=;
 b=g7Tbhukcm7+I5mVEB89G6C7Ev09ECp8FqfWSXi5+RpbbnSCBbd5gpXPbIpVwFVKZqh
 LgzGgLYxk1uGI7+H/yXLVKtMzvb0wBS5G/02ZZ5fv3aaB4WL+x3hZUdheotLfe9wPFFA
 MJoZbF5sOMFewsx4NLjrLn3iGmfeaqerLk9x7soCH2At1LlsH9POoogi8+JnhUHt7692
 Uqyn7gZ/P2pNDJgrG5nZatQte548EHXoA81vKVQjy6ENHsDyOUAMt7H+keKcpqNDqyt7
 oHNAxuKfVPoseCtIcIh1wezd+0ihqJB7g8fWEcp+x4XYSlPbpcmJKvhX3gFofBR+57fL
 aJUg==
X-Gm-Message-State: AMCzsaV/0zaxJy4pmF94YF0AWv7b4lg0XkmtMbVu3tdJ5GOf9gcF0FPE
 uGL2ITntXA4ULSLTXKYQ+8AzB/OPYzmXgYd7JsA9IQ==
X-Google-Smtp-Source: ABhQp+RKtdBant6rINlfmZ/tL5gKRb5BxSw+As0pXLOlmGWbN/Hm7C1qj1s/8KJM0Kj/v5AVXBFvoXm3EkJWxMOq7tY=
X-Received: by 10.200.13.135 with SMTP id s7mr3370686qti.4.1508533067677; Fri,
 20 Oct 2017 13:57:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.81.200 with HTTP; Fri, 20 Oct 2017 13:57:47 -0700 (PDT)
In-Reply-To: <20171020104807.GE20805@n2100.armlinux.org.uk>
References: <20171019225050.25410-1-brendanhiggins@google.com>
 <20171019225050.25410-2-brendanhiggins@google.com>
 <20171020104807.GE20805@n2100.armlinux.org.uk>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Fri, 20 Oct 2017 13:57:47 -0700
Message-ID: <CAFd5g45_VV_76zexrgBSWaqNXMsYfZPX6hLHGGc_EVdtsQrzCw@mail.gmail.com>
Subject: Re: [PATCH v7 1/3] arm: npcm: add basic support for Nuvoton BMCs
To: Russell King - ARM Linux <linux@armlinux.org.uk>,
 Avi Fishman <avifishman70@gmail.com>, tmaimon77@gmail.com
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rick Altherr <raltherr@google.com>, Florian Fainelli <f.fainelli@gmail.com>, 
 devicetree <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 20 Oct 2017 20:57:53 -0000

On Fri, Oct 20, 2017 at 3:48 AM, Russell King - ARM Linux
<linux@armlinux.org.uk> wrote:
> On Thu, Oct 19, 2017 at 03:50:48PM -0700, Brendan Higgins wrote:
>> Adds basic support for the Nuvoton NPCM750 BMC.
>>
>> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
>> Reviewed-by: Tomer Maimon <tmaimon77@gmail.com>
>> Reviewed-by: Avi Fishman <avifishman70@gmail.com>
>> Tested-by: Tomer Maimon <tmaimon77@gmail.com>
>> Tested-by: Avi Fishman <avifishman70@gmail.com>
>> ---
>>  arch/arm/Kconfig             |  2 +
>>  arch/arm/Makefile            |  1 +
>>  arch/arm/mach-npcm/Kconfig   | 48 ++++++++++++++++++++++++
>>  arch/arm/mach-npcm/Makefile  |  3 ++
>>  arch/arm/mach-npcm/headsmp.S | 17 +++++++++
>>  arch/arm/mach-npcm/npcm7xx.c | 34 +++++++++++++++++
>>  arch/arm/mach-npcm/platsmp.c | 88 ++++++++++++++++++++++++++++++++++++++++++++
>>  7 files changed, 193 insertions(+)
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
>> @@ -191,6 +191,7 @@ machine-$(CONFIG_ARCH_MEDIATEK)           += mediatek
>>  machine-$(CONFIG_ARCH_MXS)           += mxs
>>  machine-$(CONFIG_ARCH_NETX)          += netx
>>  machine-$(CONFIG_ARCH_NOMADIK)               += nomadik
>> +machine-$(CONFIG_ARCH_NPCM)          += npcm
>>  machine-$(CONFIG_ARCH_NSPIRE)                += nspire
>>  machine-$(CONFIG_ARCH_OXNAS)         += oxnas
>>  machine-$(CONFIG_ARCH_OMAP1)         += omap1
>> diff --git a/arch/arm/mach-npcm/Kconfig b/arch/arm/mach-npcm/Kconfig
>> new file mode 100644
>> index 000000000000..21dfa8ce828f
>> --- /dev/null
>> +++ b/arch/arm/mach-npcm/Kconfig
>> @@ -0,0 +1,48 @@
>> +menuconfig ARCH_NPCM
>> +     bool "Nuvoton NPCM Architecture"
>> +     select ARCH_REQUIRE_GPIOLIB
>> +     select USE_OF
>> +     select PINCTRL
>> +     select PINCTRL_NPCM7XX
>> +
>> +if ARCH_NPCM
>> +
>> +comment "NPCMX50 CPU type"
>> +
>> +config CPU_NPCM750
>> +     depends on ARCH_NPCM && ARCH_MULTI_V7
>> +     bool "Support for NPCM750 BMC CPU (Poleg)"
>> +     select CACHE_L2X0
>> +     select CPU_V7
>> +     select ARM_GIC
>> +     select HAVE_SMP
>> +     select SMP
>> +     select SMP_ON_UP
>> +     select HAVE_ARM_SCU
>> +     select HAVE_ARM_TWD if SMP
>> +     select ARM_ERRATA_720789
>> +     select ARM_ERRATA_754322
>> +     select ARM_ERRATA_764369
>> +     select ARM_ERRATA_794072
>> +     select PL310_ERRATA_588369
>> +     select PL310_ERRATA_727915
>> +     select USB_EHCI_ROOT_HUB_TT
>> +     select USB_ARCH_HAS_HCD
>> +     select USB_ARCH_HAS_EHCI
>> +     select USB_EHCI_HCD
>> +     select USB_ARCH_HAS_OHCI
>> +     select USB_OHCI_HCD
>> +     select USB
>> +     select FIQ
>> +     select CPU_USE_DOMAINS
>> +     select GENERIC_CLOCKEVENTS
>> +     select CLKDEV_LOOKUP
>> +     select COMMON_CLK if OF
>> +     select NPCM750_TIMER
>> +     select MFD_SYSCON
>> +     help
>> +       Support for NPCM750 BMC CPU (Poleg).
>> +
>> +       Nuvoton NPCM750 BMC based on the Cortex A9.
>> +
>> +endif
>> diff --git a/arch/arm/mach-npcm/Makefile b/arch/arm/mach-npcm/Makefile
>> new file mode 100644
>> index 000000000000..78416055b854
>> --- /dev/null
>> +++ b/arch/arm/mach-npcm/Makefile
>> @@ -0,0 +1,3 @@
>> +AFLAGS_headsmp.o             += -march=armv7-a
>> +
>> +obj-$(CONFIG_CPU_NPCM750)    += npcm7xx.o platsmp.o headsmp.o
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
>> +     safe_svcmode_maskall r0
>> +
>> +     b       secondary_startup
>> +ENDPROC(npcm7xx_secondary_startup)
>
> Why do you need this?  The switch to svc mode is already handled by
> secondary_startup.

Florian Fainelli already brought this up:
https://www.spinics.net/lists/arm-kernel/msg605126.html
Without this the kernel complains that the core is started in
"wrong/inconsistent mode":

SMP: Total of 2 processors activated (398.13 BogoMIPS).
CPU: WARNING: CPU(s) started in wrong/inconsistent modes (primary CPU
mode 0x13)
CPU: This may indicate a broken bootloader or firmware.

>
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
>> +#define NPCM7XX_AUX_VAL (L310_AUX_CTRL_INSTR_PREFETCH |                             \
>> +                      L310_AUX_CTRL_DATA_PREFETCH |                         \
>> +                      L310_AUX_CTRL_NS_LOCKDOWN |                           \
>> +                      L310_AUX_CTRL_CACHE_REPLACE_RR |                      \
>> +                      L2C_AUX_CTRL_SHARED_OVERRIDE |                        \
>> +                      L310_AUX_CTRL_FULL_LINE_ZERO)
>
> Do you really need all these flags?

Tomer, Avi, do we need these? I got this from the original version of
the driver.

>
>> +
>> +static const char *const npcm7xx_dt_match[] = {
>> +     "nuvoton,npcm750",
>> +     NULL
>> +};
>> +
>> +DT_MACHINE_START(NPCM7XX_DT, "NPCMX50 Chip family")
>> +     .atag_offset    = 0x100,
>> +     .dt_compat      = npcm7xx_dt_match,
>> +     .l2c_aux_val    = NPCM7XX_AUX_VAL,
>> +     .l2c_aux_mask   = ~NPCM7XX_AUX_VAL,
>> +MACHINE_END
>> diff --git a/arch/arm/mach-npcm/platsmp.c b/arch/arm/mach-npcm/platsmp.c
>> new file mode 100644
>> index 000000000000..450e83c3c531
>> --- /dev/null
>> +++ b/arch/arm/mach-npcm/platsmp.c
>> @@ -0,0 +1,88 @@
>> +/*
>> + * Copyright 2017 Google, Inc.
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
>> + */
>> +
>> +#define pr_fmt(fmt) "PLATSMP: " fmt
>
> Maybe something more descriptive?
>
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
>> +                                   struct task_struct *idle)
>> +{
>> +     struct device_node *gcr_np;
>> +     void __iomem *gcr_base;
>> +     int ret = 0;
>> +
>> +     gcr_np = of_find_compatible_node(NULL, NULL, "nuvoton,npcm750-gcr");
>> +     if (!gcr_np) {
>> +             pr_err("no gcr device node\n");
>> +             ret = -EFAULT;
>
> EFAULT is used for bad userspace addresses, it should not be used for
> other stuff - and a missing node is certainly not a "Bad address".
>
>> +             goto out;
>> +     }
>> +     gcr_base = of_iomap(gcr_np, 0);
>> +     if (!gcr_base) {
>> +             pr_err("could not iomap gcr at: 0x%p\n", gcr_base);
>> +             ret = -EFAULT;
>
> This is more -ENOMEM.
>
>> +             goto out;
>> +     }
>> +
>> +     /* give boot ROM kernel start address. */
>> +     iowrite32(__pa_symbol(npcm7xx_secondary_startup), gcr_base +
>> +               NPCM7XX_SCRPAD_REG);
>> +     /* make sure npcm7xx_secondary_startup is seen by all observers. */
>> +     smp_wmb();
>
> I think you mean "make sure the previous write is seen by all observers".
> However, doesn't "dsb_sev()" already do that?
>
>> +     dsb_sev();
>> +     /* make sure write buffer is drained */
>> +     mb();
>
> This looks over the top.
>
>> +
>> +     iounmap(gcr_base);
>> +out:
>> +     return ret;
>> +}
>> +
>> +static void __init npcm7xx_smp_prepare_cpus(unsigned int max_cpus)
>> +{
>> +     struct device_node *scu_np;
>> +     void __iomem *scu_base;
>> +
>> +     scu_np = of_find_compatible_node(NULL, NULL, "arm,cortex-a9-scu");
>> +     if (!scu_np) {
>> +             pr_err("no scu device node\n");
>> +             return;
>> +     }
>> +     scu_base = of_iomap(scu_np, 0);
>> +     if (!scu_base) {
>> +             pr_err("could not iomap scu at: 0x%p\n", scu_base);
>> +             return;
>> +     }
>> +
>> +     scu_enable(scu_base);
>> +
>> +     iounmap(scu_base);
>> +}
>> +
>> +static struct smp_operations npcm7xx_smp_ops __initdata = {
>> +     .smp_prepare_cpus = npcm7xx_smp_prepare_cpus,
>> +     .smp_boot_secondary = npcm7xx_smp_boot_secondary,
>> +};
>> +
>> +CPU_METHOD_OF_DECLARE(npcm7xx_smp, "nuvoton,npcm7xx-smp", &npcm7xx_smp_ops);
>> --
>> 2.15.0.rc0.271.g36b669edcc-goog
>>
>
> --
> RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
> FTTC broadband for 0.8mile line in suburbia: sync at 8.8Mbps down 630kbps up
> According to speedtest.net: 8.21Mbps down 510kbps up
