Return-Path: <andrew@aj.id.au>
Received: from homiemail-a21.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rP15q3k8VzDqGK
 for <openbmc@lists.ozlabs.org>; Tue,  7 Jun 2016 15:56:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=wTBvnU53; 
 dkim-atps=neutral
Received: from homiemail-a21.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a21.g.dreamhost.com (Postfix) with ESMTP id 747B8300074;
 Mon,  6 Jun 2016 22:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=JKrxGhdDLzx+iHMVKBo05
 wMJB/M=; b=wTBvnU53xdmXBiqXrWsRSF0qtlu6fxQf7NI/eFPl2ZZc9+TPJdiP9
 UQKmfdKW8kenCjdQjJ6PEA2PPhGJivPnNFaAZT9cJl0qJaJGWp9imIKYIOSdmBxV
 ATgd7CsqqsYXiCtIoPi5Yv7X8h/nrhbNuAfFy/IpGAd6M3u9Xl+2ig=
Received: from keelia (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a21.g.dreamhost.com (Postfix) with ESMTPSA id 7764E300072;
 Mon,  6 Jun 2016 22:56:12 -0700 (PDT)
Message-ID: <1465278963.16048.62.camel@aj.id.au>
Subject: Re: [PATCH qemu 03/12] ast2400: create SPI flash slaves
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, 
 openbmc@lists.ozlabs.org
Date: Tue, 07 Jun 2016 15:26:03 +0930
In-Reply-To: <1464556805-4340-4-git-send-email-clg@kaod.org>
References: <1464556805-4340-1-git-send-email-clg@kaod.org>
 <1464556805-4340-4-git-send-email-clg@kaod.org>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-ragXlE4CsPDRXWhocxNE"
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
X-List-Received-Date: Tue, 07 Jun 2016 05:56:15 -0000


--=-ragXlE4CsPDRXWhocxNE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2016-05-29 at 23:19 +0200, C=C3=A9dric Le Goater wrote:
> This patch creates a number of SPI flash slaves of the same type under
> the SMC/FMC and under the SMC/SPI controllers. We use a "n25q256a"
> flash module type for the BMC and a "mx25l25635e" for the host. These
> types are common in the OpenPower ecosystem.
>=20
> The segment addresses used for the memory mappings are the defaults
> provided by the specs. They can be changed with the Segment Address
> Register but this is not supported in the current implementation.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0hw/arm/palmetto-bmc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=
=A0=C2=A03 +++
> =C2=A0hw/ssi/aspeed_smc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0| 62 +++++++++++++++++++++++++++++++++++++++++++++
> =C2=A0include/hw/ssi/aspeed_smc.h |=C2=A0=C2=A03 +++
> =C2=A03 files changed, 68 insertions(+)
>=20
> diff --git a/hw/arm/palmetto-bmc.c b/hw/arm/palmetto-bmc.c
> index 6367f978bc7b..c4099987d354 100644
> --- a/hw/arm/palmetto-bmc.c
> +++ b/hw/arm/palmetto-bmc.c
> @@ -50,6 +50,9 @@ static void palmetto_bmc_init(MachineState *machine)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0object_property_set_bool(OBJECT(&bmc->soc),=
 true, "realized",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&error_abort);
> =C2=A0
> +=C2=A0=C2=A0=C2=A0=C2=A0aspeed_smc_init_flashes(&bmc->soc.smc, "n25q256a=
");
> +=C2=A0=C2=A0=C2=A0=C2=A0aspeed_smc_init_flashes(&bmc->soc.spi, "mx25l256=
35e");
> +
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0palmetto_bmc_binfo.kernel_filename =3D mach=
ine->kernel_filename;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0palmetto_bmc_binfo.initrd_filename =3D mach=
ine->initrd_filename;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0palmetto_bmc_binfo.kernel_cmdline =3D machi=
ne->kernel_cmdline;
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index 43743628ba0c..4175356141e7 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -215,6 +215,8 @@ static int aspeed_smc_init(SysBusDevice *sbd)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0name, ASPEED_SMC_R_MAX * 4);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sysbus_init_mmio(sbd, &s->mmio);
> =C2=A0
> +=C2=A0=C2=A0=C2=A0=C2=A0s->flashes =3D g_new0(AspeedSMCFlashState *, s->=
num_cs);
> +
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> =C2=A0}
> =C2=A0
> @@ -368,3 +370,63 @@ static void aspeed_smc_flash_register_types(void)
> =C2=A0}
> =C2=A0
> =C2=A0type_init(aspeed_smc_flash_register_types)
> +
> +/*
> + * Default segments mappings and size for each slave
> + */
> +typedef struct AspeedSegments {
> +=C2=A0=C2=A0=C2=A0=C2=A0hwaddr addr;
> +=C2=A0=C2=A0=C2=A0=C2=A0uint32_t size;
> +} AspeedSegments;
> +
> +/* unused */
> +static const AspeedSegments aspeed_segment_legacy[] =3D {
> +=C2=A0=C2=A0=C2=A0=C2=A0{ 0x14000000, 32 * 1024 * 1024 },
> +};
> +
> +static const AspeedSegments aspeed_segment_fmc[] =3D {
> +=C2=A0=C2=A0=C2=A0=C2=A0{ 0x20000000, 64 * 1024 * 1024 },
> +=C2=A0=C2=A0=C2=A0=C2=A0{ 0x24000000, 32 * 1024 * 1024 },
> +=C2=A0=C2=A0=C2=A0=C2=A0{ 0x26000000, 32 * 1024 * 1024 },
> +=C2=A0=C2=A0=C2=A0=C2=A0{ 0x28000000, 32 * 1024 * 1024 },
> +=C2=A0=C2=A0=C2=A0=C2=A0{ 0x2A000000, 32 * 1024 * 1024 }
> +};
> +
> +static const AspeedSegments aspeed_segment_spi[] =3D {
> +=C2=A0=C2=A0=C2=A0=C2=A0{ 0x30000000, 64 * 1024 * 1024 },
> +};
> +
> +static const AspeedSegments *aspeed_segments[] =3D {
> +=C2=A0=C2=A0=C2=A0=C2=A0aspeed_segment_legacy, aspeed_segment_fmc, aspee=
d_segment_spi
> +};
> +
> +void aspeed_smc_init_flashes(AspeedSMCState *s, const char *flashtype)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0int i ;
> +=C2=A0=C2=A0=C2=A0=C2=A0char name[32];
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0for (i =3D 0; i < s->num_cs; ++i) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Object *new =3D object_n=
ew(TYPE_ASPEED_SMC_FLASH);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0AspeedSMCFlashState *fl =
=3D ASPEED_SMC_FLASH(new);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0qemu_irq cs_line;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0s->flashes[i] =3D fl;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0snprintf(name, sizeof(na=
me), "aspeed.%s.%d",
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0aspeed_smc_types[s->smc_type], i);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0fl->id =3D i;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0fl->controller =3D s;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0fl->flash =3D ssi_create=
_slave(s->spi, flashtype);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0cs_line =3D qdev_get_gpi=
o_in_named(fl->flash, SSI_GPIO_CS, 0);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sysbus_connect_irq(SYS_B=
US_DEVICE(s), i + 1, cs_line);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0memory_region_init_io(&f=
l->mmio, new, &aspeed_smc_flash_ops, fl, name,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0aspeed_segments[s->smc_type][i].size);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sysbus_init_mmio(SYS_BUS=
_DEVICE(new), &fl->mmio);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sysbus_mmio_map(SYS_BUS_=
DEVICE(new), 0,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0asp=
eed_segments[s->smc_type][i].addr);
> +=C2=A0=C2=A0=C2=A0=C2=A0}
> +}
> diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
> index 6cea1313eabd..1625dfb76a63 100644
> --- a/include/hw/ssi/aspeed_smc.h
> +++ b/include/hw/ssi/aspeed_smc.h
> @@ -74,10 +74,13 @@ typedef struct AspeedSMCState {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0uint8_t r_conf;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0uint8_t r_ctrl0;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0uint8_t conf_enable_w0;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0AspeedSMCFlashState **flashes;
> =C2=A0} AspeedSMCState;
> =C2=A0
> =C2=A0#define TYPE_ASPEED_SPI "aspeed.spi"
> =C2=A0#define ASPEED_SPI(obj) OBJECT_CHECK(AspeedSPIState, (obj), TYPE_AS=
PEED_SPI)
> =C2=A0
> +extern void aspeed_smc_init_flashes(AspeedSMCState *s, const char *flash=
type);

extern seems superfluous here? Doesn't really matter though.

Cheers,

Andrew

> =C2=A0
> =C2=A0#endif /* ASPEED_SMC_H */
--=-ragXlE4CsPDRXWhocxNE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXVmHzAAoJEJ0dnzgO5LT5ikAP/3xrU8tbpilULBcHUhW9m1L9
flKRYdx0y4vxHtFEdODtAWGBM6d2ZFAdkgtYIeVCzcJebw4r2+vISQAOzdcsv46S
bRbu76/S0SXhAyvJiwrxxetwkH0lyg0+ibVTDcSM1G0K+Qb+PrQIVBw6C4oTsS0/
1kwzz5Vtm4AUT65Sv6RIXQ38wdnLeE4wZV/+YxyJeoyfgDsRCMctF6Cc3p45jW9B
7VrN46fJ7M44MHu7cHljFdvpanSDuB7vLrlW8KhSG1N9ub2VskCvf666OQvnB5qh
b9Zn83dspwdBvFNtkzUmEL7hj23ey4u23cxkr9QPw6mzDQaQAchsn3HAMweHFLYs
RKNmfNBdnn/7b0BxemQBAScbErTMrKtccptE2TfVPlbZROFAkFVZNKUevMLfdbJD
wnp+fWJ72KS6nPul/8Kk1ET8C2zgDDSlpGuw5OpYEeg8/V8tb62Vtlkyh6FLv2I7
/nvoLiZGU1CdRDgzs4VfLyluuiHjuK1aamzO6asYPzHO+AHUifc22oAt2sSCtKGN
xOmwSuTge/nnQekzHuHD3ghM7//EJbSmKNa0rlpD44qhRWQL7LbGufd5brEYbJ/L
f5Ez7cZ3LNWU/OZ4mfyA72Hk6XIWI5fD24K59iRqoV1CC3ChCxQBlqnQwweez+2w
U/HsWjEX54f+PJFb/jnV
=x3W6
-----END PGP SIGNATURE-----

--=-ragXlE4CsPDRXWhocxNE--
