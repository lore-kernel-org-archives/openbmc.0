Return-Path: <andrew@aj.id.au>
Received: from homiemail-a11.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rNRkH623kzDq64
 for <openbmc@lists.ozlabs.org>; Mon,  6 Jun 2016 17:52:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=oNupEmma; 
 dkim-atps=neutral
Received: from homiemail-a11.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a11.g.dreamhost.com (Postfix) with ESMTP id 181F56E072;
 Mon,  6 Jun 2016 00:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=+u2MHdaPeRh1kf5NG55Xp
 vg5U+k=; b=oNupEmmaNpLztSO3przjfJrnBeggU01HsMgkhaKidmshHW1jhLoZZ
 p6wIwb87HwC9OdrTLMXjG1hbp4/vYy22wH2JK478u5m9KL+Bo92EyZHAUDAQrpgf
 V48kYTE7m35vUJVnxfGR/gzSE92L8wowiM8pgUUtBWqaxBbOXc+QoI=
Received: from nat104.cor1.adl1.base64.com.au (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a11.g.dreamhost.com (Postfix) with ESMTPSA id 4D2426E06C;
 Mon,  6 Jun 2016 00:52:20 -0700 (PDT)
Message-ID: <1465199534.16048.41.camel@aj.id.au>
Subject: Re: [PATCH qemu v2] Add OpenCompute Yosemite BMC ARM board
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: Teddy Reed <teddy.reed@gmail.com>, openbmc@lists.ozlabs.org
Date: Mon, 06 Jun 2016 17:22:14 +0930
In-Reply-To: <20160605212520.17a03a18e4b6deffc6fd8005@gmail.com>
References: <20160605212520.17a03a18e4b6deffc6fd8005@gmail.com>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-GuWiD5PdlnjycMWKXBtN"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
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
X-List-Received-Date: Mon, 06 Jun 2016 07:52:24 -0000


--=-GuWiD5PdlnjycMWKXBtN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey Teddy,

On Sun, 2016-06-05 at 21:25 -0700, Teddy Reed wrote:
> The Yosemite BMC board is very similar to the Palmetto BMC. They both con=
figure
> an AST2400 SoC and have rather simple device sets.
>=20
> The Yosemite uses dual SPI flashes but the AST2400's memory controller, v=
ia
> hardware strapping, makes either a NAND, NOR, or SPI available at boot at
> 0x0 and 0x2000:0000. For the board emulation included here the SPIs are r=
eplaced
> with CFI flash to allow simple pflash configuration via the caller.

Have you had a look at=C2=A0C=C3=A9dric's recent series which adds FMC/SPI =
flash
support[1]? The caller can pass two -mtdblock args, the first
specifying the BMC flash and the second the host. It would be handy if
you could cast your eyes over it in any case, and it may make sense to
integrate with that work rather than just get by with the pflash
infrastructure.

[1]=C2=A0https://lists.ozlabs.org/pipermail/openbmc/2016-May/003316.html

>=20
> Additionally, to support an SPL boot where DRAM has not been calibrated, =
the
> board relocates global data and the stack into the small 32kB of SRAM.
>=20
> Signed-off-by: Teddy Reed <teddy.reed@gmail.com>
> Cc: Joel

The tag is imcomplete or seems to have been truncated?

> ---
>=20
> Changes in v2:
> - Base and size defines use FBYOSEMTIE prefix
> - Use correct pointer style
>=20
> =C2=A0hw/arm/Makefile.objs=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A0=C2=A02 +-
> =C2=A0hw/arm/fbyosemite-bmc.c | 115 +++++++++++++++++++++++++++++++++++++=
+++++++++++
> =C2=A02 files changed, 116 insertions(+), 1 deletion(-)
> =C2=A0create mode 100644 hw/arm/fbyosemite-bmc.c
>=20
> diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
> index 2fcd33a..cbf5c3e 100644
> --- a/hw/arm/Makefile.objs
> +++ b/hw/arm/Makefile.objs
> @@ -16,4 +16,4 @@ obj-$(CONFIG_STM32F205_SOC) +=3D stm32f205_soc.o
> =C2=A0obj-$(CONFIG_XLNX_ZYNQMP) +=3D xlnx-zynqmp.o xlnx-ep108.o
> =C2=A0obj-$(CONFIG_FSL_IMX25) +=3D fsl-imx25.o imx25_pdk.o
> =C2=A0obj-$(CONFIG_FSL_IMX31) +=3D fsl-imx31.o kzm.o
> -obj-$(CONFIG_ASPEED_SOC) +=3D ast2500.o ast2500-edk.o ast2400.o palmetto=
-bmc.o
> +obj-$(CONFIG_ASPEED_SOC) +=3D ast2500.o ast2500-edk.o ast2400.o palmetto=
-bmc.o fbyosemite-bmc.o
> diff --git a/hw/arm/fbyosemite-bmc.c b/hw/arm/fbyosemite-bmc.c
> new file mode 100644
> index 0000000..f6bf738
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
> + * This code is licensed under the GPL version 2 or later.=C2=A0=C2=A0Se=
e
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
> +#define FBYOSEMITE_FLASH0_BASE 0x20000000
> +#define FBYOSEMITE_FLASH0_SIZE 0x02000000 /* Max is 64k, but set 32kB */

Bit of a nit-pick, but MB not kB right?

> +#define FBYOSEMITE_FLASH1_BASE 0x24000000
> +#define FBYOSEMITE_FLASH1_SIZE 0x02000000
> +#define FBYOSEMITE_TEXT_BASE 0x0
> +
> +static struct arm_boot_info fbyosemite_bmc_binfo =3D {
> +=C2=A0=C2=A0=C2=A0=C2=A0.loader_start =3D FBYOSEMITE_TEXT_BASE,
> +=C2=A0=C2=A0=C2=A0=C2=A0.board_id =3D 0,
> +=C2=A0=C2=A0=C2=A0=C2=A0.nb_cpus =3D 1,
> +};
> +
> +typedef struct FBYosemiteBMCState {
> +=C2=A0=C2=A0=C2=A0=C2=A0AST2400State soc;
> +=C2=A0=C2=A0=C2=A0=C2=A0MemoryRegion ram;
> +=C2=A0=C2=A0=C2=A0=C2=A0MemoryRegion flash0_alias;
> +} FBYosemiteBMCState;
> +
> +static pflash_t *pflash_register(hwaddr base, hwaddr size, const char *n=
ame,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0DriveInfo *info) {
> +=C2=A0=C2=A0=C2=A0=C2=A0int sector_len =3D 128 * 1024;
> +=C2=A0=C2=A0=C2=A0=C2=A0int be =3D 0;
> +=C2=A0=C2=A0=C2=A0=C2=A0pflash_t *pf;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0pf =3D pflash_cfi01_register(base, NULL, name, s=
ize,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0info ? blk_by_legacy_dinfo(info) : N=
ULL,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sector_len, size / sector_len,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A02, 0, 0, 0, 0, be);
> +=C2=A0=C2=A0=C2=A0=C2=A0if (pf =3D=3D NULL) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0fprintf(stderr, "qemu: E=
rror registering flash memory.\n");
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0exit(1);
> +=C2=A0=C2=A0=C2=A0=C2=A0}
> +=C2=A0=C2=A0=C2=A0=C2=A0return pf;
> +}
> +
> +static void fbyosemite_bmc_init(MachineState *machine)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0FBYosemiteBMCState *bmc;
> +=C2=A0=C2=A0=C2=A0=C2=A0DriveInfo *dinfo;
> +=C2=A0=C2=A0=C2=A0=C2=A0pflash_t *pflash0;
> +=C2=A0=C2=A0=C2=A0=C2=A0MemoryRegion *pflash0mem;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0bmc =3D g_new0(FBYosemiteBMCState, 1);
> +=C2=A0=C2=A0=C2=A0=C2=A0object_initialize(&bmc->soc, (sizeof(bmc->soc)),=
 TYPE_AST2400);
> +=C2=A0=C2=A0=C2=A0=C2=A0object_property_add_child(OBJECT(machine), "soc"=
, OBJECT(&bmc->soc),
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&error_abort);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0memory_region_allocate_system_memory(&bmc->ram, =
NULL, "ram", ram_size);
> +=C2=A0=C2=A0=C2=A0=C2=A0memory_region_add_subregion(get_system_memory(),=
 AST2400_SDRAM_BASE,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&bmc->ram);
> +=C2=A0=C2=A0=C2=A0=C2=A0object_property_add_const_link(OBJECT(&bmc->soc)=
, "ram", OBJECT(&bmc->ram),
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&error_abort=
);
> +=C2=A0=C2=A0=C2=A0=C2=A0object_property_set_bool(OBJECT(&bmc->soc), true=
, "realized",
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0&error_abort);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0/* Connect flash0 */
> +=C2=A0=C2=A0=C2=A0=C2=A0dinfo =3D drive_get_next(IF_PFLASH);
> +=C2=A0=C2=A0=C2=A0=C2=A0pflash0 =3D pflash_register(FBYOSEMITE_FLASH0_BA=
SE, FBYOSEMITE_FLASH0_SIZE,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"fbyosemite.flash0", dinfo);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0/* Map flash0 to FBYOSEMITE_TEXT_BASE */
> +=C2=A0=C2=A0=C2=A0=C2=A0pflash0mem =3D sysbus_mmio_get_region(SYS_BUS_DE=
VICE(pflash0), 0);
> +=C2=A0=C2=A0=C2=A0=C2=A0memory_region_set_readonly(pflash0mem, true);
> +=C2=A0=C2=A0=C2=A0=C2=A0memory_region_init_alias(&bmc->flash0_alias, NUL=
L,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0"flash0.alias", pflash0mem, FBYOSEMITE_TEXT_BASE=
,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0FBYOSEMITE_FLASH0_SIZE);
> +=C2=A0=C2=A0=C2=A0=C2=A0memory_region_add_subregion(get_system_memory(),=
 FBYOSEMITE_TEXT_BASE,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&bmc->flash0_alias);
> +=C2=A0=C2=A0=C2=A0=C2=A0memory_region_set_readonly(&bmc->flash0_alias, t=
rue);

So having tinkered with memory aliasing in the openbmc/qemu repo and
likely done the wrong thing: From memory the sdk u-boot re-maps RAM to
0 during boot, so is it right to fix the mapping this way? I'm not
across what the side-effects are if we have the wrong data here after
remap, but we should probably do the right thing. As an aside C=C3=A9dric's
series is using rom_add_blob_fixed() to copy the entire mtdblock device
content down to zero, but to my knowledge isn't dealing with remapping
either. How much does it matter?

Cheers,

Andrew
--=-GuWiD5PdlnjycMWKXBtN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXVSuuAAoJEJ0dnzgO5LT5Uy0P/3OGI29X4NwMw5bB3CoXwFCW
NBb9XSP/IU0UepEehWsPrbHcwFtDpc+quD9PIEqUcWEOQxm5kHiQu+UD7vN4iXPv
bcTBiLQbaWJ3CiOsypuobC5kyuU1jwFhGiJ7NFTL9o4zUEU7PP1ZI2Ooe3oS3yqB
UtpShLWVGXqBftxk8wzpEuay9QucGbJ0ctrlTaESYeCwNVyYiHvyb0j+9wwlSO81
QQlUiJ2GBTorLqRecMJ9hmeE9TTKHiob8jdWRtqZTHhfP7AXgp6gZz/kQrFR1f8U
+0myeA0SDURVLZm5l09C+8ldJBziPte3Mp1CNRjD9u66jmQsVEfo07OGRKUnJNUY
1BQ0kEuMWzVqKtFpjcRUyKjNjf5b4eYD4sFw7ZHQx0Tuq/A+nMCprQynpWyzx6uu
AlV81oHoDVQVj2XgNjo9fxoq58BOtYpBcB33dSwHYMtEDYFzDjolOMqCAdFuHTaE
uIXCvwQy1hEzLl3nxsnrvL5ZXjgVMJo4i7Ek6JI/Tur61JJ628Eya9HUhSbsppK1
WyHmRS6Otxik27sNRYd2tURUKXvO63R/CRtZvq4nVIPD4thCMIsjziyYBAGs2K9t
GJPGqlTElrJXVAt8gU/Hg/HIVrxNigRM5cTKgOLmU6+JwoNFONCN1nEK/rJMUQkt
Wmw/MKw9US1PCp1qHz1p
=wXhr
-----END PGP SIGNATURE-----

--=-GuWiD5PdlnjycMWKXBtN--
