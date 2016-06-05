Return-Path: <joel.stan@gmail.com>
Received: from mail-qk0-x241.google.com (mail-qk0-x241.google.com
 [IPv6:2607:f8b0:400d:c09::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rNDVk5WWRzDqFJ
 for <openbmc@lists.ozlabs.org>; Mon,  6 Jun 2016 09:26:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=ktqTb1eA; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=U4Cpk8CE; 
 dkim-atps=neutral
Received: by mail-qk0-x241.google.com with SMTP id l185so7386068qkc.2
 for <openbmc@lists.ozlabs.org>; Sun, 05 Jun 2016 16:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=WqPB8uvE0xF8RnP0VyB+HknGdW35JMMPz1XVwVPEVsI=;
 b=ktqTb1eAWzH8AQODYWXLiCYelI5eNAVqDsYz7KQH75WAKE9nym4htDMs8ekcg9aonH
 dB+2MHu8otwapbEVgrxLqjTQKVgfhRA+xUppQHKt1Wo3cwtt6+G3iVkvrI5o8+J9Ydrw
 aMijHGbsn9UFP3/bXVQRXILdS0EbbGlmf/OKKa8N/ZDvrvqas6BNy7ug6Ik8zMFhev+P
 R3gLauLdWaQjwJupMheb0BS7Sa5wo/yh4nmX7KcJclrdhFbWP5lMj8/PqQLoU3WeAD/F
 U/JtZe3Daps4gLGRYc8spdrEfrPp58OfbOl6Y5BD8OOpebTnEjnMLYiPoRQccOOmO+1f
 PWvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=WqPB8uvE0xF8RnP0VyB+HknGdW35JMMPz1XVwVPEVsI=;
 b=U4Cpk8CEBH/mlHD+jikPTmD2BWvIAv4+50iKtbBy2mhWa5XhunZmJpiXHIQeRexX6q
 hG5WeTvNmqktNzbRmIXN7CpWNIp4l9qslb+VpSO1+YN4MGHlyk8hxOaHmy32bKaF1YzF
 MCulqVtxB1YZJC2hE4l33pFnwLedMFTjeKm48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=WqPB8uvE0xF8RnP0VyB+HknGdW35JMMPz1XVwVPEVsI=;
 b=U96CSGhblQ66dbnqVv8bnoHxjIUXBZ6hZqNzABVplvJ9vMliJovqeLZ27/6ZjcNWno
 rjrs9dyL8puoneQ2RH/+VNNQFQViDto8iFOH0AOkKskkj1pViRh/yd3RLYjBePgRlu/f
 Annbm8TzslcoUowdNA8rF3Ej5ihjxgW20hpsZ/hdBHrTPIFrGgrm93R9oux1SQtQ4aSC
 J2XOqZ5KXGEagWRVpHRU2KwIFqiuQNE81YJOjUjyH4l4PP1ZobSojCrhxSA+J+QhTKe3
 z+rqFu1niP259Df0TuKtp8qISDnd7Uq1f8VmTVaM8+21PKRUJ4WJuoUvHUrBzIx+D82Y
 Grww==
X-Gm-Message-State: ALyK8tLbVHSiSLl485Wawctmc630VzisyxUT7tkzw1UuG00rtWblsaA4Iv9rjpcKx8DVjXyUAPcBboMSAsEC0Q==
X-Received: by 10.55.203.202 with SMTP id u71mr13354774qkl.12.1465169196208;
 Sun, 05 Jun 2016 16:26:36 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.44.196 with HTTP; Sun, 5 Jun 2016 16:26:16 -0700 (PDT)
In-Reply-To: <20160605153723.261560bea9e9e70d3469d475@gmail.com>
References: <20160605153723.261560bea9e9e70d3469d475@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Sun, 5 Jun 2016 18:26:16 -0500
X-Google-Sender-Auth: 7taP1hhE8i3t3bMbFAaOoKDRCTE
Message-ID: <CACPK8Xc+YSYpSZifuTUoK7=zTbHYMmAhaNkwnAbr1S=E-d59-g@mail.gmail.com>
Subject: Re: [PATCH qemu] Add OpenCompute Yosemite BMC ARM board
To: Teddy Reed <teddy.reed@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sun, 05 Jun 2016 23:26:39 -0000

Hey Teddy,

On Sun, Jun 5, 2016 at 5:37 PM, Teddy Reed <teddy.reed@gmail.com> wrote:
> The Yosemite BMC board is very similar to the Palmetto BMC. They both configure
> an AST2400 SoC and have rather simple device sets.

Nice!

Are you planning on sending this upstream?

> The Yosemite uses dual SPI flashes but the AST2400's memory controller, via
> hardware strapping, makes either a NAND, NOR, or SPI available at boot at
> 0x0 and 0x2000:0000. For the board emulation included here the SPIs are replaced
> with CFI flash to allow simple pflash configuration via the caller.
>
> Additionally, to support an SPL boot where DRAM has not been calibrated, the
> board relocates global data and the stack into the small 32kb of SRAM.

You need to add a developers certificate of origin (the signed off by
line) to your commit message.

> ---
>  hw/arm/Makefile.objs    |   2 +-
>  hw/arm/fbyosemite-bmc.c | 115 ++++++++++++++++++++++++++++++++++++++++++++++++

Are you attached to calling it "fbyosemite"? We didn't stick ibm in
front of the palmettos. No biggie though.

>  2 files changed, 116 insertions(+), 1 deletion(-)
>  create mode 100644 hw/arm/fbyosemite-bmc.c
>
> diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
> index 2fcd33a..cbf5c3e 100644
> --- a/hw/arm/Makefile.objs
> +++ b/hw/arm/Makefile.objs
> @@ -16,4 +16,4 @@ obj-$(CONFIG_STM32F205_SOC) += stm32f205_soc.o
>  obj-$(CONFIG_XLNX_ZYNQMP) += xlnx-zynqmp.o xlnx-ep108.o
>  obj-$(CONFIG_FSL_IMX25) += fsl-imx25.o imx25_pdk.o
>  obj-$(CONFIG_FSL_IMX31) += fsl-imx31.o kzm.o
> -obj-$(CONFIG_ASPEED_SOC) += ast2500.o ast2500-edk.o ast2400.o palmetto-bmc.o
> +obj-$(CONFIG_ASPEED_SOC) += ast2500.o ast2500-edk.o ast2400.o palmetto-bmc.o fbyosemite-bmc.o
> diff --git a/hw/arm/fbyosemite-bmc.c b/hw/arm/fbyosemite-bmc.c
> new file mode 100644
> index 0000000..e506977
> --- /dev/null
> +++ b/hw/arm/fbyosemite-bmc.c
> @@ -0,0 +1,115 @@
> +/*
> + * OpenCompute Facebook Yosemite BMC
> + *
> + * Teddy Reed <reed@fb.com>
> + *
> + * Copyright 2016-Present, Facebook, Inc.
> + *
> + * This code is licensed under the GPL version 2 or later.  See
> + * the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "qemu-common.h"
> +#include "cpu.h"
> +#include "exec/address-spaces.h"
> +#include "hw/arm/arm.h"
> +#include "hw/arm/ast2400.h"
> +#include "hw/boards.h"
> +#include "hw/block/flash.h"
> +
> +#define AST2400_FLASH0_BASE 0x20000000
> +#define AST2400_FLASH0_SIZE 0x02000000 /* Max is 64k, but set 32kB */
> +#define AST2400_FLASH1_BASE 0x24000000
> +#define AST2400_FLASH1_SIZE 0x02000000

These are really board-specific defines, not ast2400 ones I think.
Perhaps don't use the AST2400 prefix?

> +#define FBYOSEMITE_TEXT_BASE 0x0
> +
> +static struct arm_boot_info fbyosemite_bmc_binfo = {
> +    .loader_start = FBYOSEMITE_TEXT_BASE,
> +    .board_id = 0,
> +    .nb_cpus = 1,
> +};
> +
> +typedef struct FBYosemiteBMCState {
> +    AST2400State soc;
> +    MemoryRegion ram;
> +    MemoryRegion flash0_alias;
> +} FBYosemiteBMCState;
> +
> +static pflash_t* pflash_register(hwaddr base, hwaddr size, const char* name,
> +                            DriveInfo *info) {

You've got a few *'s with the space on the wrong side.

> +    int sector_len = 128 * 1024;
> +    int be = 0;
> +    pflash_t *pf;
> +
> +    pf = pflash_cfi01_register(base, NULL, name, size,
> +                               info ? blk_by_legacy_dinfo(info) : NULL,
> +                               sector_len, size / sector_len,
> +                               2, 0, 0, 0, 0, be);
> +    if (pf == NULL) {
> +        fprintf(stderr, "qemu: Error registering flash memory.\n");
> +        exit(1);
> +    }

I suspect we want to do something other than exit(1) here.

> +    return pf;
> +}
> +
> +static void fbyosemite_bmc_init(MachineState *machine)
> +{
> +    FBYosemiteBMCState *bmc;
> +    DriveInfo *dinfo;
> +    pflash_t *pflash0;
> +    MemoryRegion *pflash0mem;
> +
> +    bmc = g_new0(FBYosemiteBMCState, 1);
> +    object_initialize(&bmc->soc, (sizeof(bmc->soc)), TYPE_AST2400);
> +    object_property_add_child(OBJECT(machine), "soc", OBJECT(&bmc->soc),
> +                              &error_abort);
> +
> +    memory_region_allocate_system_memory(&bmc->ram, NULL, "ram", ram_size);
> +    memory_region_add_subregion(get_system_memory(), AST2400_SDRAM_BASE,
> +                                &bmc->ram);
> +    object_property_add_const_link(OBJECT(&bmc->soc), "ram", OBJECT(&bmc->ram),
> +                                   &error_abort);
> +    object_property_set_bool(OBJECT(&bmc->soc), true, "realized",
> +                             &error_abort);
> +
> +    /* Connect flash0 */
> +    dinfo = drive_get_next(IF_PFLASH);
> +    pflash0 = pflash_register(AST2400_FLASH0_BASE, AST2400_FLASH0_SIZE,
> +                              "fbyosemite.flash0", dinfo);
> +
> +    /* Map flash0 to FBYOSEMITE_TEXT_BASE */
> +    pflash0mem = sysbus_mmio_get_region(SYS_BUS_DEVICE(pflash0), 0);
> +    memory_region_set_readonly(pflash0mem, true);
> +    memory_region_init_alias(&bmc->flash0_alias, NULL,
> +                             "flash0.alias", pflash0mem, FBYOSEMITE_TEXT_BASE,
> +                             AST2400_FLASH0_SIZE);
> +    memory_region_add_subregion(get_system_memory(), FBYOSEMITE_TEXT_BASE,
> +                                &bmc->flash0_alias);
> +    memory_region_set_readonly(&bmc->flash0_alias, true);
> +
> +    /* Connect flash1 */
> +    dinfo = drive_get_next(IF_PFLASH);
> +    pflash_register(AST2400_FLASH1_BASE, AST2400_FLASH1_SIZE,
> +                   "fbyosemite.flash1", dinfo);
> +
> +    fbyosemite_bmc_binfo.kernel_filename = machine->kernel_filename;
> +    fbyosemite_bmc_binfo.initrd_filename = machine->initrd_filename;
> +    fbyosemite_bmc_binfo.kernel_cmdline = machine->kernel_cmdline;
> +    fbyosemite_bmc_binfo.ram_size = ram_size;
> +    arm_load_kernel(ARM_CPU(first_cpu), &fbyosemite_bmc_binfo);
> +}
> +
> +static void fbyosemite_bmc_machine_init(MachineClass *mc)
> +{
> +    mc->desc = "OpenCompute Facebook Yosemite BMC";
> +    mc->init = fbyosemite_bmc_init;
> +    mc->max_cpus = 1;
> +    mc->no_sdcard = 1;
> +    mc->no_floppy = 1;
> +    mc->no_cdrom = 1;
> +    mc->no_parallel = 1;
> +}
> +
> +DEFINE_MACHINE("fbyosemite-bmc", fbyosemite_bmc_machine_init);
> --
> 2.7.4
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
