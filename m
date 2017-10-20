Return-Path: <julien.thierry@arm.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.101.70; helo=foss.arm.com;
 envelope-from=julien.thierry@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
 by lists.ozlabs.org (Postfix) with ESMTP id 3yJMks4MwQzDq5W
 for <openbmc@lists.ozlabs.org>; Fri, 20 Oct 2017 21:40:20 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0FFCCF;
 Fri, 20 Oct 2017 03:40:15 -0700 (PDT)
Received: from [10.1.207.56] (e112298-lin.cambridge.arm.com [10.1.207.56])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 062693F58F;
 Fri, 20 Oct 2017 03:40:12 -0700 (PDT)
Subject: Re: [PATCH v7 1/3] arm: npcm: add basic support for Nuvoton BMCs
To: Brendan Higgins <brendanhiggins@google.com>, robh+dt@kernel.org,
 mark.rutland@arm.com, linux@armlinux.org.uk, avifishman70@gmail.com,
 tmaimon77@gmail.com, raltherr@google.com, f.fainelli@gmail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org
References: <20171019225050.25410-1-brendanhiggins@google.com>
 <20171019225050.25410-2-brendanhiggins@google.com>
From: Julien Thierry <julien.thierry@arm.com>
Message-ID: <83927acd-5daf-04fd-3faf-0b5d2773c1fd@arm.com>
Date: Fri, 20 Oct 2017 11:40:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20171019225050.25410-2-brendanhiggins@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 30 Oct 2017 15:18:14 +1100
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
X-List-Received-Date: Fri, 20 Oct 2017 10:40:22 -0000

Hi Brendan,

On 19/10/17 23:50, Brendan Higgins wrote:
> Adds basic support for the Nuvoton NPCM750 BMC.
> 
> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> Reviewed-by: Tomer Maimon <tmaimon77@gmail.com>
> Reviewed-by: Avi Fishman <avifishman70@gmail.com>
> Tested-by: Tomer Maimon <tmaimon77@gmail.com>
> Tested-by: Avi Fishman <avifishman70@gmail.com>
> ---
>   arch/arm/Kconfig             |  2 +
>   arch/arm/Makefile            |  1 +
>   arch/arm/mach-npcm/Kconfig   | 48 ++++++++++++++++++++++++
>   arch/arm/mach-npcm/Makefile  |  3 ++
>   arch/arm/mach-npcm/headsmp.S | 17 +++++++++
>   arch/arm/mach-npcm/npcm7xx.c | 34 +++++++++++++++++
>   arch/arm/mach-npcm/platsmp.c | 88 ++++++++++++++++++++++++++++++++++++++++++++
>   7 files changed, 193 insertions(+)
>   create mode 100644 arch/arm/mach-npcm/Kconfig
>   create mode 100644 arch/arm/mach-npcm/Makefile
>   create mode 100644 arch/arm/mach-npcm/headsmp.S
>   create mode 100644 arch/arm/mach-npcm/npcm7xx.c
>   create mode 100644 arch/arm/mach-npcm/platsmp.c
> 

[...]

> diff --git a/arch/arm/mach-npcm/platsmp.c b/arch/arm/mach-npcm/platsmp.c
> new file mode 100644
> index 000000000000..450e83c3c531
> --- /dev/null
> +++ b/arch/arm/mach-npcm/platsmp.c
> @@ -0,0 +1,88 @@
> +/*
> + * Copyright 2017 Google, Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#define pr_fmt(fmt) "PLATSMP: " fmt
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
> +				      struct task_struct *idle)
> +{
> +	struct device_node *gcr_np;
> +	void __iomem *gcr_base;
> +	int ret = 0;
> +
> +	gcr_np = of_find_compatible_node(NULL, NULL, "nuvoton,npcm750-gcr");
> +	if (!gcr_np) {
> +		pr_err("no gcr device node\n");
> +		ret = -EFAULT;
> +		goto out;
> +	}
> +	gcr_base = of_iomap(gcr_np, 0);
> +	if (!gcr_base) {
> +		pr_err("could not iomap gcr at: 0x%p\n", gcr_base);

nit:
 From the condition we know gcr_base is NULL here so we don't get much 
info from it. Did you intend to print the value of gcr_np instead?

> +		ret = -EFAULT;
> +		goto out;
> +	}
> +
> +	/* give boot ROM kernel start address. */
> +	iowrite32(__pa_symbol(npcm7xx_secondary_startup), gcr_base +
> +		  NPCM7XX_SCRPAD_REG);
> +	/* make sure npcm7xx_secondary_startup is seen by all observers. */
> +	smp_wmb();
> +	dsb_sev();
> +	/* make sure write buffer is drained */
> +	mb();
> +
> +	iounmap(gcr_base);
> +out:
> +	return ret;
> +}
> +
> +static void __init npcm7xx_smp_prepare_cpus(unsigned int max_cpus)
> +{
> +	struct device_node *scu_np;
> +	void __iomem *scu_base;
> +
> +	scu_np = of_find_compatible_node(NULL, NULL, "arm,cortex-a9-scu");
> +	if (!scu_np) {
> +		pr_err("no scu device node\n");
> +		return;
> +	}
> +	scu_base = of_iomap(scu_np, 0);
> +	if (!scu_base) {
> +		pr_err("could not iomap scu at: 0x%p\n", scu_base);

Same comment about scu_base.

Cheers,

-- 
Julien Thierry
