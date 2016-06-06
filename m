Return-Path: <teddy.reed@gmail.com>
Received: from mail-wm0-x243.google.com (mail-wm0-x243.google.com
 [IPv6:2a00:1450:400c:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rNJ8f6j6nzDq64
 for <openbmc@lists.ozlabs.org>; Mon,  6 Jun 2016 12:11:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=uBapM20h; 
 dkim-atps=neutral
Received: by mail-wm0-x243.google.com with SMTP id k184so6528831wme.2
 for <openbmc@lists.ozlabs.org>; Sun, 05 Jun 2016 19:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=fXci7unUtExi+TQrFX2C96QDDls4APkcznhk7Gq6btE=;
 b=uBapM20hDl24V7GFgc6/WL3GVunG8uMJM2M0E0JVpsdutX8TK2HstYUJGZTs5D2iw1
 xubX3R1M0Pkb0fEslff7rl6PcsN7FICD729i0sEZe1DYbJSlDEPyoWPTcTRM1Kx1EFLg
 RI5bkMB+Rsb8imasRJ9me2rNiFx8bFwg1GGJJYiTKf/xjtkncqb5JImv3gLJZ6RVOKBM
 PyzpfOmFpA0Ih2K+ytFxjOmu9/Vs9lJlA8iVS27MYU9jaCnmQ43cWZyi0GvNDpg/0KrZ
 J1BLUh6NZ30KKhizvNXuzjyWHvM4ootIi1dlDVAPlcCvaRq39lLnvEBprm0e371bJCMP
 2HCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=fXci7unUtExi+TQrFX2C96QDDls4APkcznhk7Gq6btE=;
 b=FNLrdk4eQXWRcF3k4F7NC2BatbHqFnWCT8WM4Tclmco+ySX4Qt+Wp5vUmjj38rWVmZ
 ddCJ8Xvhn/z60dttWlMfEyF5Hm00m5ZUzRM32p626amqRJAo2ODoLvVC6mWebxPXQ2xR
 MjzbEBc6P+HV+98SZGDnZyRVtepNKc3QDQE41r9vEPBIJP5Hh0BOSriEQCKsMkXPd1OR
 AVXGTjSBdoQokpju2t8hZKB6rMseVH9pxvSlHQCT8BHJtLGimEusXItA5Cqwpn+tnHkp
 vpB8DGwIIwSKtWEV0BWJIETzW2KFNTtaJcrcnIHhGiN7V3iymIgS+u90QzZlF3Rw5E6T
 PTIw==
X-Gm-Message-State: ALyK8tKafwsCgniBrlNb/3TpDe7hZvE3d82xLc8OJe0uMS/P2Vt9Omj6q15vxVPBKxZ0sg==
X-Received: by 10.194.175.36 with SMTP id bx4mr12805359wjc.35.1465179071195;
 Sun, 05 Jun 2016 19:11:11 -0700 (PDT)
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com.
 [74.125.82.54])
 by smtp.gmail.com with ESMTPSA id q194sm11672608wme.18.2016.06.05.19.11.10
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 05 Jun 2016 19:11:10 -0700 (PDT)
Received: by mail-wm0-f54.google.com with SMTP id m124so53269002wme.1
 for <openbmc@lists.ozlabs.org>; Sun, 05 Jun 2016 19:11:10 -0700 (PDT)
X-Received: by 10.194.116.9 with SMTP id js9mr15423216wjb.112.1465179069920;
 Sun, 05 Jun 2016 19:11:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.122.41 with HTTP; Sun, 5 Jun 2016 19:11:09 -0700 (PDT)
X-Originating-IP: [24.6.55.56]
In-Reply-To: <CACPK8Xc+YSYpSZifuTUoK7=zTbHYMmAhaNkwnAbr1S=E-d59-g@mail.gmail.com>
References: <20160605153723.261560bea9e9e70d3469d475@gmail.com>
 <CACPK8Xc+YSYpSZifuTUoK7=zTbHYMmAhaNkwnAbr1S=E-d59-g@mail.gmail.com>
From: Teddy Reed <teddy.reed@gmail.com>
Date: Sun, 5 Jun 2016 19:11:09 -0700
X-Gmail-Original-Message-ID: <CADUykerRi6FuovZEDOE1kg83kXSHPCZF1Jv7CekGjQVJnWbx5A@mail.gmail.com>
Message-ID: <CADUykerRi6FuovZEDOE1kg83kXSHPCZF1Jv7CekGjQVJnWbx5A@mail.gmail.com>
Subject: Re: [PATCH qemu] Add OpenCompute Yosemite BMC ARM board
To: Joel Stanley <joel@jms.id.au>
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
X-List-Received-Date: Mon, 06 Jun 2016 02:11:16 -0000

On Sun, Jun 5, 2016 at 4:26 PM, Joel Stanley <joel@jms.id.au> wrote:
> Hey Teddy,
>
> On Sun, Jun 5, 2016 at 5:37 PM, Teddy Reed <teddy.reed@gmail.com> wrote:
>> The Yosemite BMC board is very similar to the Palmetto BMC. They both configure
>> an AST2400 SoC and have rather simple device sets.
>
> Nice!
>
> Are you planning on sending this upstream?

Yeah! I'm not sure if the IBM team plans to push the QEMU changes in
the OpenBMC fork upstream en masse, if not I can also send a similar
patch once we work through a few revisions here.

>
>> The Yosemite uses dual SPI flashes but the AST2400's memory controller, via
>> hardware strapping, makes either a NAND, NOR, or SPI available at boot at
>> 0x0 and 0x2000:0000. For the board emulation included here the SPIs are replaced
>> with CFI flash to allow simple pflash configuration via the caller.
>>
>> Additionally, to support an SPL boot where DRAM has not been calibrated, the
>> board relocates global data and the stack into the small 32kb of SRAM.
>
> You need to add a developers certificate of origin (the signed off by
> line) to your commit message.

Womp, thanks.

>
>> ---
>>  hw/arm/Makefile.objs    |   2 +-
>>  hw/arm/fbyosemite-bmc.c | 115 ++++++++++++++++++++++++++++++++++++++++++++++++
>
> Are you attached to calling it "fbyosemite"? We didn't stick ibm in
> front of the palmettos. No biggie though.

It's sort of an arraigned attachment.

The oh-so creative Silicon Valley has aptly named both an OS and
embedded board Yosemite (as well as several other codenamed-thingies).

There's a current conflict with Yosemite in U-Boot too! So we need to
use "fb" here. We have 3 other boards right now, Wedge, Wedge100, and
Lightning. Lightning also has a conflict in U-Boot so I'm porting all
of our configs, past and future, to include an "fb" prefix. :/

>
>>  2 files changed, 116 insertions(+), 1 deletion(-)
>>  create mode 100644 hw/arm/fbyosemite-bmc.c
>>
>> diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
>> index 2fcd33a..cbf5c3e 100644
>> --- a/hw/arm/Makefile.objs
>> +++ b/hw/arm/Makefile.objs
>> @@ -16,4 +16,4 @@ obj-$(CONFIG_STM32F205_SOC) += stm32f205_soc.o
>>  obj-$(CONFIG_XLNX_ZYNQMP) += xlnx-zynqmp.o xlnx-ep108.o
>>  obj-$(CONFIG_FSL_IMX25) += fsl-imx25.o imx25_pdk.o
>>  obj-$(CONFIG_FSL_IMX31) += fsl-imx31.o kzm.o
>> -obj-$(CONFIG_ASPEED_SOC) += ast2500.o ast2500-edk.o ast2400.o palmetto-bmc.o
>> +obj-$(CONFIG_ASPEED_SOC) += ast2500.o ast2500-edk.o ast2400.o palmetto-bmc.o fbyosemite-bmc.o
>> diff --git a/hw/arm/fbyosemite-bmc.c b/hw/arm/fbyosemite-bmc.c
>> new file mode 100644
>> index 0000000..e506977
>> --- /dev/null
>> +++ b/hw/arm/fbyosemite-bmc.c
>> @@ -0,0 +1,115 @@
>> +/*
>> + * OpenCompute Facebook Yosemite BMC
>> + *
>> + * Teddy Reed <reed@fb.com>
>> + *
>> + * Copyright 2016-Present, Facebook, Inc.
>> + *
>> + * This code is licensed under the GPL version 2 or later.  See
>> + * the COPYING file in the top-level directory.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "qapi/error.h"
>> +#include "qemu-common.h"
>> +#include "cpu.h"
>> +#include "exec/address-spaces.h"
>> +#include "hw/arm/arm.h"
>> +#include "hw/arm/ast2400.h"
>> +#include "hw/boards.h"
>> +#include "hw/block/flash.h"
>> +
>> +#define AST2400_FLASH0_BASE 0x20000000
>> +#define AST2400_FLASH0_SIZE 0x02000000 /* Max is 64k, but set 32kB */
>> +#define AST2400_FLASH1_BASE 0x24000000
>> +#define AST2400_FLASH1_SIZE 0x02000000
>
> These are really board-specific defines, not ast2400 ones I think.
> Perhaps don't use the AST2400 prefix?

They are defined in the AST2400 specification. Whether they are
SPI/CFI/NAND is based on the strapping. If SPI, and the board allows
dual SPI (1250+) then the second flash base is also valid.

Though, because of the strapping requirement and potential variance,
your recommendation seems best. I'll rename them. :)

>
>> +#define FBYOSEMITE_TEXT_BASE 0x0
>> +
>> +static struct arm_boot_info fbyosemite_bmc_binfo = {
>> +    .loader_start = FBYOSEMITE_TEXT_BASE,
>> +    .board_id = 0,
>> +    .nb_cpus = 1,
>> +};
>> +
>> +typedef struct FBYosemiteBMCState {
>> +    AST2400State soc;
>> +    MemoryRegion ram;
>> +    MemoryRegion flash0_alias;
>> +} FBYosemiteBMCState;
>> +
>> +static pflash_t* pflash_register(hwaddr base, hwaddr size, const char* name,
>> +                            DriveInfo *info) {
>
> You've got a few *'s with the space on the wrong side.
>
>> +    int sector_len = 128 * 1024;
>> +    int be = 0;
>> +    pflash_t *pf;
>> +
>> +    pf = pflash_cfi01_register(base, NULL, name, size,
>> +                               info ? blk_by_legacy_dinfo(info) : NULL,
>> +                               sector_len, size / sector_len,
>> +                               2, 0, 0, 0, 0, be);
>> +    if (pf == NULL) {
>> +        fprintf(stderr, "qemu: Error registering flash memory.\n");
>> +        exit(1);
>> +    }
>
> I suspect we want to do something other than exit(1) here.

An error_report or fprintf followed by exit 1 seems pretty standard
within the ARM machine models. I'm happy to change if anyone has a
preferred recommendation?

>
>> +    return pf;
>> +}
>> +
>> +static void fbyosemite_bmc_init(MachineState *machine)
>> +{
>> +    FBYosemiteBMCState *bmc;
>> +    DriveInfo *dinfo;
>> +    pflash_t *pflash0;
>> +    MemoryRegion *pflash0mem;
>> +
>> +    bmc = g_new0(FBYosemiteBMCState, 1);
>> +    object_initialize(&bmc->soc, (sizeof(bmc->soc)), TYPE_AST2400);
>> +    object_property_add_child(OBJECT(machine), "soc", OBJECT(&bmc->soc),
>> +                              &error_abort);
>> +
>> +    memory_region_allocate_system_memory(&bmc->ram, NULL, "ram", ram_size);
>> +    memory_region_add_subregion(get_system_memory(), AST2400_SDRAM_BASE,
>> +                                &bmc->ram);
>> +    object_property_add_const_link(OBJECT(&bmc->soc), "ram", OBJECT(&bmc->ram),
>> +                                   &error_abort);
>> +    object_property_set_bool(OBJECT(&bmc->soc), true, "realized",
>> +                             &error_abort);
>> +
>> +    /* Connect flash0 */
>> +    dinfo = drive_get_next(IF_PFLASH);
>> +    pflash0 = pflash_register(AST2400_FLASH0_BASE, AST2400_FLASH0_SIZE,
>> +                              "fbyosemite.flash0", dinfo);
>> +
>> +    /* Map flash0 to FBYOSEMITE_TEXT_BASE */
>> +    pflash0mem = sysbus_mmio_get_region(SYS_BUS_DEVICE(pflash0), 0);
>> +    memory_region_set_readonly(pflash0mem, true);
>> +    memory_region_init_alias(&bmc->flash0_alias, NULL,
>> +                             "flash0.alias", pflash0mem, FBYOSEMITE_TEXT_BASE,
>> +                             AST2400_FLASH0_SIZE);
>> +    memory_region_add_subregion(get_system_memory(), FBYOSEMITE_TEXT_BASE,
>> +                                &bmc->flash0_alias);
>> +    memory_region_set_readonly(&bmc->flash0_alias, true);
>> +
>> +    /* Connect flash1 */
>> +    dinfo = drive_get_next(IF_PFLASH);
>> +    pflash_register(AST2400_FLASH1_BASE, AST2400_FLASH1_SIZE,
>> +                   "fbyosemite.flash1", dinfo);
>> +
>> +    fbyosemite_bmc_binfo.kernel_filename = machine->kernel_filename;
>> +    fbyosemite_bmc_binfo.initrd_filename = machine->initrd_filename;
>> +    fbyosemite_bmc_binfo.kernel_cmdline = machine->kernel_cmdline;
>> +    fbyosemite_bmc_binfo.ram_size = ram_size;
>> +    arm_load_kernel(ARM_CPU(first_cpu), &fbyosemite_bmc_binfo);
>> +}
>> +
>> +static void fbyosemite_bmc_machine_init(MachineClass *mc)
>> +{
>> +    mc->desc = "OpenCompute Facebook Yosemite BMC";
>> +    mc->init = fbyosemite_bmc_init;
>> +    mc->max_cpus = 1;
>> +    mc->no_sdcard = 1;
>> +    mc->no_floppy = 1;
>> +    mc->no_cdrom = 1;
>> +    mc->no_parallel = 1;
>> +}
>> +
>> +DEFINE_MACHINE("fbyosemite-bmc", fbyosemite_bmc_machine_init);
>> --
>> 2.7.4

Thanks Joel! I'll have a v2 out shortly.

-- 
Teddy Reed V
