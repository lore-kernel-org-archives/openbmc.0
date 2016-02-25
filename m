Return-Path: <peter.maydell@linaro.org>
Received: from mail-vk0-x22d.google.com (mail-vk0-x22d.google.com
 [IPv6:2607:f8b0:400c:c05::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 25F1F1A0063
 for <openbmc@lists.ozlabs.org>; Fri, 26 Feb 2016 03:36:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b=izgl6sm+; 
 dkim-atps=neutral
Received: by mail-vk0-x22d.google.com with SMTP id c3so52513012vkb.3
 for <openbmc@lists.ozlabs.org>; Thu, 25 Feb 2016 08:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-type;
 bh=10/d4y6YCOZbIZFbSHjBuAcMVk10v8l6utUg/o3StPU=;
 b=izgl6sm+bPYuUT+6ptOUY2rA+cVnsP+Uim1cChFcQNFTb3hmZmYxqyT0h23xYjh/kS
 OU7gYGLGuHKGpr02SvJlOmjCi8dxfa1w55IGxDj4oGBV0g0tyzNv9jBtVIRMECyUV6gW
 nBu9TlrsHCbgEFjYF5iqj4wTifGy+ibshopQc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-type;
 bh=10/d4y6YCOZbIZFbSHjBuAcMVk10v8l6utUg/o3StPU=;
 b=X0T+kKDWwIpshCQpXf0P8JhMU6bfr3trTjehCcJJzTdxj+P0Q80IjiGR5HhrtSIP48
 ZXJiqDO6JLqI3O2Ahfu6rKYo9xhVGwGx/MGaIaO+eAiSMhlIrFXNlYrl1AsgomoFkDTg
 CInn4b9aN3HmMd37Ikl1zu1tV2rzqWI/HWjO7AofW6T837nLNYBFKBiH4yJDvWVl+DaF
 bm7BBk8JxAaeH5pgyQMq2kmzHNAkCOM42M1nP2aeMH2Auk+fRNl8dtbrPl4T+spf4FKe
 7kZEAch7wSQgaG/vjB3doZJo2tz4+8mblCXhv316SOLbc+eVq7Xxp64uXbHm5GmHVlLD
 unig==
X-Gm-Message-State: AG10YOTlr2D7AqeJQb8+hGxbcPyTqHEJ5WNd/F9kMtqT2i+os0Z5Y51yWAhuoqQH8hDvPQNBqlFm3QkuSKmzEpzi
X-Received: by 10.31.141.2 with SMTP id p2mr38139374vkd.37.1456418196657; Thu,
 25 Feb 2016 08:36:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Thu, 25 Feb 2016 08:36:17 -0800 (PST)
In-Reply-To: <1455622497-25966-4-git-send-email-andrew@aj.id.au>
References: <1455622497-25966-1-git-send-email-andrew@aj.id.au>
 <1455622497-25966-4-git-send-email-andrew@aj.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Feb 2016 16:36:17 +0000
Message-ID: <CAFEAcA9dpV72335ZijOAviKsRg5KMWQQ3QVc8_fuvQHfuT_Tbg@mail.gmail.com>
Subject: Re: [Qemu-arm] [PATCH v2 3/3] hw/arm: Add ASPEED AST2400 machine type
To: Andrew Jeffery <andrew@aj.id.au>
Cc: QEMU Developers <qemu-devel@nongnu.org>, openbmc@lists.ozlabs.org, 
 qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-Mailman-Approved-At: Sat, 27 Feb 2016 03:54:25 +1100
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Feb 2016 16:36:42 -0000

On 16 February 2016 at 11:34, Andrew Jeffery <andrew@aj.id.au> wrote:
> Adds the AST2400 machine type with ASPEED AVIC and timer models. The
> new machine type is functional enough to boot Linux to userspace.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

This seems to be missing an "SoC object" level of modelling between the
devices and the board code. Have a look at the Xilinx, raspi, etc board
models for examples.

> ---
>  hw/arm/Makefile.objs |   1 +
>  hw/arm/ast2400.c     | 139 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  trace-events         |   4 ++
>  3 files changed, 144 insertions(+)
>  create mode 100644 hw/arm/ast2400.c
>
> diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
> index a711e4d..f333b7f 100644
> --- a/hw/arm/Makefile.objs
> +++ b/hw/arm/Makefile.objs
> @@ -16,3 +16,4 @@ obj-$(CONFIG_STM32F205_SOC) += stm32f205_soc.o
>  obj-$(CONFIG_XLNX_ZYNQMP) += xlnx-zynqmp.o xlnx-ep108.o
>  obj-$(CONFIG_FSL_IMX25) += fsl-imx25.o imx25_pdk.o
>  obj-$(CONFIG_FSL_IMX31) += fsl-imx31.o kzm.o
> +obj-$(CONFIG_ASPEED_SOC) += ast2400.o
> diff --git a/hw/arm/ast2400.c b/hw/arm/ast2400.c
> new file mode 100644
> index 0000000..e3cd496
> --- /dev/null
> +++ b/hw/arm/ast2400.c
> @@ -0,0 +1,139 @@
> +/*
> + * ASPEED AST2400
> + *
> + * Jeremy Kerr <jk@ozlabs.org>
> + * Andrew Jeffery <andrew@aj.id.au>
> + *
> + * Copyright 2015, 2016 IBM Corp.
> + *
> + * This code is licensed under the GPL version 2 or later.  See
> + * the COPYING file in the top-level directory.
> + *
> + * Based off of the i.MX31 Vectored Interrupt Controller

Really? :-)

> + *
> + * Note that this device model does not implement the legacy register space.
> + * The assumption is that the device base address is exposed such that all
> + * offsets are calculated relative to the address of the first "new" register.

This looks like copy-n-paste error too.

> + */
> +

#include "qemu/osdep.h".

> +#include "exec/address-spaces.h"
> +#include "hw/arm/arm.h"
> +#include "hw/boards.h"
> +#include "hw/char/serial.h"
> +#include "hw/sysbus.h"
> +#include "hw/intc/aspeed_vic.h"
> +#include "hw/timer/aspeed_timer.h"
> +#include "trace.h"
> +
> +#define ASPEED_SDRAM_BASE 0x40000000
> +#define ASPEED_IOMEM_BASE 0x1e600000
> +#define ASPEED_IOMEM_SIZE 0x00200000
> +#define ASPEED_TIMER_BASE 0x1E782000
> +#define ASPEED_VIC_BASE 0x1E6C0080
> +
> +static struct arm_boot_info ast2400_binfo = {
> +    .loader_start = ASPEED_SDRAM_BASE,
> +    .board_id = 0,
> +};
> +
> +/*
> + * IO handler: simply catch any reads/writes to IO addresses that aren't
> + * handled by a device mapping.
> + */
> +static uint64_t ast2400_io_read(void *p, hwaddr offset, unsigned size)
> +{
> +    trace_ast2400_io_read(offset, size);

This is just to diagnose "missing device implementation", right?
Shouldn't we be using a LOG_UNIMP instead?

> +    return 0;
> +}
> +
> +static void ast2400_io_write(void *opaque, hwaddr offset, uint64_t value,
> +                unsigned size)
> +{
> +    trace_ast2400_io_write(offset, value, size);
> +}
> +
> +static const MemoryRegionOps ast2400_io_ops = {
> +    .read = ast2400_io_read,
> +    .write = ast2400_io_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +};
> +
> +typedef struct AspeedState {
> +    ARMCPU *cpu;
> +    MemoryRegion *address_space;
> +    MemoryRegion *ram;
> +    ram_addr_t ram_size;
> +    MemoryRegion *iomem;
> +    AspeedVICState avic;
> +    AspeedTimerState timer;
> +} AspeedState;
> +
> +static void ast2400_init(MachineState *machine)
> +{
> +    AspeedState ast2400;
> +    DeviceState *dev;
> +    qemu_irq pic[ASPEED_VIC_NR_IRQS] = {0};
> +    int i;
> +
> +    if (!machine->cpu_model) {
> +        machine->cpu_model = "arm926";

What we do now is not let the user override the cpu model at all;
presumably this SoC only ever has an ARM926 and it doesn't make
any sense to have some frankenstein "this SoC but with a different
CPU in it" config.

> +    }
> +
> +    ast2400.cpu = cpu_arm_init(machine->cpu_model);
> +    if (!ast2400.cpu) {
> +        fprintf(stderr, "Unable to find CPU definition\n");

Prefer error_report() to plain fprintf.

> +        exit(1);
> +    }
> +
> +    ast2400.address_space = get_system_memory();
> +    ram_size = machine->ram_size;
> +
> +    /* System RAM */
> +    ast2400.ram = g_new(MemoryRegion, 1);
> +    memory_region_allocate_system_memory(ast2400.ram, NULL, "ast2400.ram",
> +            ram_size);
> +    memory_region_add_subregion(ast2400.address_space, ASPEED_SDRAM_BASE,
> +            ast2400.ram);
> +
> +    /* IO space */
> +    ast2400.iomem = g_new(MemoryRegion, 1);
> +    memory_region_init_io(ast2400.iomem, NULL, &ast2400_io_ops, NULL,
> +            "ast2400.io", ASPEED_IOMEM_SIZE);
> +    memory_region_add_subregion(ast2400.address_space, ASPEED_IOMEM_BASE,
> +            ast2400.iomem);
> +
> +    /* AVIC */
> +    dev = sysbus_create_varargs(TYPE_ASPEED_VIC, ASPEED_VIC_BASE,
> +                    qdev_get_gpio_in(DEVICE(ast2400.cpu), ARM_CPU_IRQ),
> +                    qdev_get_gpio_in(DEVICE(ast2400.cpu), ARM_CPU_FIQ),
> +                    NULL);
> +
> +    for (i = 0; i < ASPEED_VIC_NR_IRQS; i++) {
> +        pic[i] = qdev_get_gpio_in(dev, i);
> +    }
> +
> +    /* Timer */
> +    sysbus_create_varargs(TYPE_ASPEED_TIMER, ASPEED_TIMER_BASE, pic[16],
> +            pic[17], pic[18], pic[35], pic[36], pic[37], pic[38], pic[39],
> +            NULL);
> +
> +    /* UART - attach an 8250 to the IO space as our UART5 */
> +    if (serial_hds[0]) {
> +            serial_mm_init(ast2400.iomem, 0x184000, 2, pic[10], 38400,
> +                    serial_hds[0], DEVICE_NATIVE_ENDIAN);
> +    }

Most of this should live in the SoC object rather than the board model.

> +
> +    ast2400_binfo.kernel_filename = machine->kernel_filename;
> +    ast2400_binfo.initrd_filename = machine->initrd_filename;
> +    ast2400_binfo.kernel_cmdline = machine->kernel_cmdline;
> +    ast2400_binfo.ram_size = ram_size;
> +    arm_load_kernel(ast2400.cpu, &ast2400_binfo);
> +}
> +
> +static void ast2400_machine_init(MachineClass *mc)
> +{
> +    mc->desc = "ASpeed ast2400 BMC (ARM926EJ-S)";
> +    mc->init = ast2400_init;
> +}

Should we be setting more of the MachineClass fields here?
(eg block_default_type, no_parallel, no_floppy, no_cdrom, max_cpus,
default_ram_size ?)

thanks
-- PMM
