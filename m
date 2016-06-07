Return-Path: <teddy.reed@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rPHDn2NfYzDq64
 for <openbmc@lists.ozlabs.org>; Wed,  8 Jun 2016 02:33:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=L6S/ahuS; 
 dkim-atps=neutral
Received: by mail-wm0-f68.google.com with SMTP id m124so24437880wme.3
 for <openbmc@lists.ozlabs.org>; Tue, 07 Jun 2016 09:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=JXEbUYCge45F+wm9bkNPKRb7aJje01aLmUrHyVTYFHw=;
 b=L6S/ahuSr9UxkqpXNcPy3MKrscVSCigGO5Y803snkmxLLVlqK6zjXfwtvwJtkB8g5P
 QJ+ybcevjCiuZxzT09686Ojcz/5xsP90UJG9sSkxsglDWyuHMuG3aZjNEN4D4u2OFZTA
 Rm7FAV09Qar9hBE4YNKpiDqu2U9ryHmVeDDDK/iktAfL11epz1LFn1Nr/qqf7sK4+jTc
 1/e3r1iM5T1U6KNOeYI4VHs7ySPtBmi5OYrROFW7y/9r14InlzXIILcaDqwRb/47qflc
 UWxJ51AN3JLnLSA28iiG3sadSfnVU5jBVHslu5Ze94kCe+jO50tYwOqE1HHoRdd2VjRz
 ryBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JXEbUYCge45F+wm9bkNPKRb7aJje01aLmUrHyVTYFHw=;
 b=M8ZUtzxQZaFDTFrZGirwzu2BXb3ZRjOoGBSIcFI2gkr7dVOw372/r9+dZPgf6VTrSH
 4zHF9fNXMH79G5yc/FslBncJLC2X7LjqFCqPvYhEpwkfpYU4J/xGMttw8TDQ69lDyMi7
 pARC9aRT0cXjzN8LobkN0kcgnziXyF5YJl/3EH555WaqTb1lok4EUvECJZDFxjeAktk/
 flRapLS5pSXLFkg0XG49A7FccPnsFqvBDieKFxYrV4lJYAClkMlzdDJkdFFX0Ged9eEQ
 RqJy6m83UimcN7YE9eyUhQJTJpRhT86+r8Oxd4Ph8xuHWdl+nVrimJTk62XjfwmQaDWH
 12VQ==
X-Gm-Message-State: ALyK8tIaCXwj7PqPOwnvuuh2+b5Al8IvvFKQSvTdlIFpOvWaZYp3CIi/mxjrcvu0LSccYQ==
X-Received: by 10.28.35.20 with SMTP id j20mr538012wmj.17.1465317129318;
 Tue, 07 Jun 2016 09:32:09 -0700 (PDT)
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com.
 [74.125.82.50])
 by smtp.gmail.com with ESMTPSA id xz3sm26273118wjb.35.2016.06.07.09.32.08
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 Jun 2016 09:32:08 -0700 (PDT)
Received: by mail-wm0-f50.google.com with SMTP id v199so27583964wmv.0
 for <openbmc@lists.ozlabs.org>; Tue, 07 Jun 2016 09:32:08 -0700 (PDT)
X-Received: by 10.28.136.200 with SMTP id k191mr3521804wmd.57.1465317127999;
 Tue, 07 Jun 2016 09:32:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.122.41 with HTTP; Tue, 7 Jun 2016 09:32:07 -0700 (PDT)
X-Originating-IP: [2620:10d:c090:200::7:e547]
In-Reply-To: <1465199534.16048.41.camel@aj.id.au>
References: <20160605212520.17a03a18e4b6deffc6fd8005@gmail.com>
 <1465199534.16048.41.camel@aj.id.au>
From: Teddy Reed <teddy.reed@gmail.com>
Date: Tue, 7 Jun 2016 09:32:07 -0700
X-Gmail-Original-Message-ID: <CADUykepfNmVTjXt-PnMVVpX7B4Qad1w-BFW8SSakvZksnfirog@mail.gmail.com>
Message-ID: <CADUykepfNmVTjXt-PnMVVpX7B4Qad1w-BFW8SSakvZksnfirog@mail.gmail.com>
Subject: Re: [PATCH qemu v2] Add OpenCompute Yosemite BMC ARM board
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Tue, 07 Jun 2016 16:33:14 -0000

On Mon, Jun 6, 2016 at 12:52 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> Hey Teddy,
>
> On Sun, 2016-06-05 at 21:25 -0700, Teddy Reed wrote:
>> The Yosemite BMC board is very similar to the Palmetto BMC. They both co=
nfigure
>> an AST2400 SoC and have rather simple device sets.
>>
>> The Yosemite uses dual SPI flashes but the AST2400's memory controller, =
via
>> hardware strapping, makes either a NAND, NOR, or SPI available at boot a=
t
>> 0x0 and 0x2000:0000. For the board emulation included here the SPIs are =
replaced
>> with CFI flash to allow simple pflash configuration via the caller.
>
> Have you had a look at C=C3=A9dric's recent series which adds FMC/SPI fla=
sh
> support[1]? The caller can pass two -mtdblock args, the first
> specifying the BMC flash and the second the host. It would be handy if
> you could cast your eyes over it in any case, and it may make sense to
> integrate with that work rather than just get by with the pflash
> infrastructure.
>
> [1] https://lists.ozlabs.org/pipermail/openbmc/2016-May/003316.html

I've followed them loosely, but I'll take a look and see if they work
for my tests. If so then we don't need this new model. ;)

>
>>
>> Additionally, to support an SPL boot where DRAM has not been calibrated,=
 the
>> board relocates global data and the stack into the small 32kB of SRAM.
>>
>> Signed-off-by: Teddy Reed <teddy.reed@gmail.com>
>> Cc: Joel
>
> The tag is imcomplete or seems to have been truncated?

;)

>
>> ---
>>
>> Changes in v2:
>> - Base and size defines use FBYOSEMTIE prefix
>> - Use correct pointer style
>>
>>  hw/arm/Makefile.objs    |   2 +-
>>  hw/arm/fbyosemite-bmc.c | 115 +++++++++++++++++++++++++++++++++++++++++=
+++++++
>>  2 files changed, 116 insertions(+), 1 deletion(-)
>>  create mode 100644 hw/arm/fbyosemite-bmc.c
>>
>> diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
>> index 2fcd33a..cbf5c3e 100644
>> --- a/hw/arm/Makefile.objs
>> +++ b/hw/arm/Makefile.objs
>> @@ -16,4 +16,4 @@ obj-$(CONFIG_STM32F205_SOC) +=3D stm32f205_soc.o
>>  obj-$(CONFIG_XLNX_ZYNQMP) +=3D xlnx-zynqmp.o xlnx-ep108.o
>>  obj-$(CONFIG_FSL_IMX25) +=3D fsl-imx25.o imx25_pdk.o
>>  obj-$(CONFIG_FSL_IMX31) +=3D fsl-imx31.o kzm.o
>> -obj-$(CONFIG_ASPEED_SOC) +=3D ast2500.o ast2500-edk.o ast2400.o palmett=
o-bmc.o
>> +obj-$(CONFIG_ASPEED_SOC) +=3D ast2500.o ast2500-edk.o ast2400.o palmett=
o-bmc.o fbyosemite-bmc.o
>> diff --git a/hw/arm/fbyosemite-bmc.c b/hw/arm/fbyosemite-bmc.c
>> new file mode 100644
>> index 0000000..f6bf738
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
>> +#define FBYOSEMITE_FLASH0_BASE 0x20000000
>> +#define FBYOSEMITE_FLASH0_SIZE 0x02000000 /* Max is 64k, but set 32kB *=
/
>
> Bit of a nit-pick, but MB not kB right?

Not a nit! Good catch.

>
>> +#define FBYOSEMITE_FLASH1_BASE 0x24000000
>> +#define FBYOSEMITE_FLASH1_SIZE 0x02000000
>> +#define FBYOSEMITE_TEXT_BASE 0x0
>> +
>> +static struct arm_boot_info fbyosemite_bmc_binfo =3D {
>> +    .loader_start =3D FBYOSEMITE_TEXT_BASE,
>> +    .board_id =3D 0,
>> +    .nb_cpus =3D 1,
>> +};
>> +
>> +typedef struct FBYosemiteBMCState {
>> +    AST2400State soc;
>> +    MemoryRegion ram;
>> +    MemoryRegion flash0_alias;
>> +} FBYosemiteBMCState;
>> +
>> +static pflash_t *pflash_register(hwaddr base, hwaddr size, const char *=
name,
>> +                            DriveInfo *info) {
>> +    int sector_len =3D 128 * 1024;
>> +    int be =3D 0;
>> +    pflash_t *pf;
>> +
>> +    pf =3D pflash_cfi01_register(base, NULL, name, size,
>> +                               info ? blk_by_legacy_dinfo(info) : NULL,
>> +                               sector_len, size / sector_len,
>> +                               2, 0, 0, 0, 0, be);
>> +    if (pf =3D=3D NULL) {
>> +        fprintf(stderr, "qemu: Error registering flash memory.\n");
>> +        exit(1);
>> +    }
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
>> +    bmc =3D g_new0(FBYosemiteBMCState, 1);
>> +    object_initialize(&bmc->soc, (sizeof(bmc->soc)), TYPE_AST2400);
>> +    object_property_add_child(OBJECT(machine), "soc", OBJECT(&bmc->soc)=
,
>> +                              &error_abort);
>> +
>> +    memory_region_allocate_system_memory(&bmc->ram, NULL, "ram", ram_si=
ze);
>> +    memory_region_add_subregion(get_system_memory(), AST2400_SDRAM_BASE=
,
>> +                                &bmc->ram);
>> +    object_property_add_const_link(OBJECT(&bmc->soc), "ram", OBJECT(&bm=
c->ram),
>> +                                   &error_abort);
>> +    object_property_set_bool(OBJECT(&bmc->soc), true, "realized",
>> +                             &error_abort);
>> +
>> +    /* Connect flash0 */
>> +    dinfo =3D drive_get_next(IF_PFLASH);
>> +    pflash0 =3D pflash_register(FBYOSEMITE_FLASH0_BASE, FBYOSEMITE_FLAS=
H0_SIZE,
>> +                              "fbyosemite.flash0", dinfo);
>> +
>> +    /* Map flash0 to FBYOSEMITE_TEXT_BASE */
>> +    pflash0mem =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(pflash0), 0);
>> +    memory_region_set_readonly(pflash0mem, true);
>> +    memory_region_init_alias(&bmc->flash0_alias, NULL,
>> +                             "flash0.alias", pflash0mem, FBYOSEMITE_TEX=
T_BASE,
>> +                             FBYOSEMITE_FLASH0_SIZE);
>> +    memory_region_add_subregion(get_system_memory(), FBYOSEMITE_TEXT_BA=
SE,
>> +                                &bmc->flash0_alias);
>> +    memory_region_set_readonly(&bmc->flash0_alias, true);
>
> So having tinkered with memory aliasing in the openbmc/qemu repo and
> likely done the wrong thing: From memory the sdk u-boot re-maps RAM to
> 0 during boot, so is it right to fix the mapping this way? I'm not
> across what the side-effects are if we have the wrong data here after
> remap, but we should probably do the right thing. As an aside C=C3=A9dric=
's
> series is using rom_add_blob_fixed() to copy the entire mtdblock device
> content down to zero, but to my knowledge isn't dealing with remapping
> either. How much does it matter?

Having the alias does matter for my tests. But I have not been testing
the remap via the SCU. I don't mind either way, but if it's possible
to model the remap request within the QEMU AST2400 SCU that's awesome
and absolutely preferred.

>
> Cheers,
>
> Andrew



--=20
Teddy Reed V
