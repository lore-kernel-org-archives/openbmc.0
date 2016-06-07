Return-Path: <andrew@aj.id.au>
Received: from homiemail-a17.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rP0cw6vcmzDq66
 for <openbmc@lists.ozlabs.org>; Tue,  7 Jun 2016 15:34:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=S9ft213g; 
 dkim-atps=neutral
Received: from homiemail-a17.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a17.g.dreamhost.com (Postfix) with ESMTP id A9B232B206D;
 Mon,  6 Jun 2016 22:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=lSOT8qfx479OHKdJX4pPc
 r4ETcA=; b=S9ft213ghRmNKFDLQetHX4Q9ePzZevlhiG3UgX9SKT20+Zmi+2n+q
 1YlN9EuWIzpJb4Km45CyKvBrspS04QDRTteA+VFdZMbnBu0vqhdxcE6f/ruSC6SW
 6IIwul9Qx4MK/FdFteWU5tjtsAaM6KUKJYkaMZ+davk6xQ8mQfWnP0=
Received: from keelia (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a17.g.dreamhost.com (Postfix) with ESMTPSA id AD5892B2065;
 Mon,  6 Jun 2016 22:34:37 -0700 (PDT)
Message-ID: <1465277665.16048.59.camel@aj.id.au>
Subject: Re: [PATCH qemu 02/12] ast2400: add SPI flash slave object
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, 
 openbmc@lists.ozlabs.org
Date: Tue, 07 Jun 2016 15:04:25 +0930
In-Reply-To: <1464556805-4340-3-git-send-email-clg@kaod.org>
References: <1464556805-4340-1-git-send-email-clg@kaod.org>
 <1464556805-4340-3-git-send-email-clg@kaod.org>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-F7beJilp3e1qVR8/tZ8x"
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
X-List-Received-Date: Tue, 07 Jun 2016 05:34:41 -0000


--=-F7beJilp3e1qVR8/tZ8x
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2016-05-29 at 23:19 +0200, C=C3=A9dric Le Goater wrote:
> Each SPI flash slave can operate in two modes: Command and User. When
> in User mode, accesses to the memory segment of the slaves are
> translated in SPI transfers. When in Command mode, the HW generates
> the SPI commands automatically and the memory segment is accessed as
> if doing a MMIO. Other SPI controllers call that mode linear
> addressing mode.
>=20
> The patch below provides an initial model for a SPI flash module,
> gathering SPI slave properties and a MemoryRegion to handle the memory
> accesses. Only the User mode is supported for now but the patch
> prepares ground for the Command mode.
>=20
> Using a sysbus object for this abstraction might be a bit complex for
> the need. We could probably survive with a simple struct under
> AspeedSMCState or we could extend the m25p80 object providing a model
> for the SPI flash modules. To be discussed.

The patch seems reasonable to me, though if we took the struct-under-
AspeedSMCState approach we would register the same MemoryRegions, but
via the AspeedSMCState's SysBusDevice? Can you expand on extending the
m25p80? Is that just doing the same we do here in aspeed_smc in m25p80?
Or something else?

Cheers,

Andrew

>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
> =C2=A0hw/ssi/aspeed_smc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0| 110 ++++++++++++++++++++++++++++++++++++++++++++
> =C2=A0include/hw/ssi/aspeed_smc.h |=C2=A0=C2=A015 ++++++
> =C2=A02 files changed, 125 insertions(+)
>=20
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index 780fcbbc9e55..43743628ba0c 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -258,3 +258,113 @@ static void aspeed_smc_register_types(void)
> =C2=A0}
> =C2=A0
> =C2=A0type_init(aspeed_smc_register_types)
> +
> +static inline bool aspeed_smc_is_usermode(AspeedSMCState *s, int cs)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0return (((s->regs[s->r_ctrl0 + cs] & CTRL_USERMO=
DE) =3D=3D CTRL_USERMODE) &&
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
!aspeed_smc_is_ce_stop_active(s, cs));
> +}
> +
> +static inline bool aspeed_smc_is_writable(AspeedSMCState *s, int cs)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0return s->regs[s->r_conf] & (1 << (s->conf_enabl=
e_w0 + cs));
> +}
> +
> +static uint64_t aspeed_smc_flash_read(void *opaque, hwaddr addr, unsigne=
d size)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0AspeedSMCFlashState *fl =3D ASPEED_SMC_FLASH(opa=
que);
> +=C2=A0=C2=A0=C2=A0=C2=A0AspeedSMCState *s =3D fl->controller;
> +=C2=A0=C2=A0=C2=A0=C2=A0uint64_t ret =3D 0;
> +=C2=A0=C2=A0=C2=A0=C2=A0int i;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0if (aspeed_smc_is_usermode(s, fl->id)) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0for (i =3D 0; i < size; =
i++) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
ret =3D (ret << 8) | ssi_transfer(s->spi, 0x0);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> +=C2=A0=C2=A0=C2=A0=C2=A0} else {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0error_report("%s: flash =
not in usermode", __func__);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D -1;
> +=C2=A0=C2=A0=C2=A0=C2=A0}
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0return ret;
> +}
> +
> +static void aspeed_smc_flash_write(void *opaque, hwaddr addr, uint64_t d=
ata,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0unsigned size)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0AspeedSMCFlashState *fl =3D ASPEED_SMC_FLASH(opa=
que);
> +=C2=A0=C2=A0=C2=A0=C2=A0AspeedSMCState *s =3D fl->controller;
> +=C2=A0=C2=A0=C2=A0=C2=A0int i;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0if (!aspeed_smc_is_writable(s, fl->id)) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0error_report("%s: flash =
not in writable", __func__);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return;
> +=C2=A0=C2=A0=C2=A0=C2=A0}
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0if (!aspeed_smc_is_usermode(s, fl->id)) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0error_report("%s: flash =
not in usermode", __func__);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return;
> +=C2=A0=C2=A0=C2=A0=C2=A0}
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0for (i =3D 0; i < size; i++) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ssi_transfer(s->spi, (da=
ta >> 8 * (size - 1 - i)) & 0xff);
> +=C2=A0=C2=A0=C2=A0=C2=A0}
> +}
> +
> +static const MemoryRegionOps aspeed_smc_flash_ops =3D {
> +=C2=A0=C2=A0=C2=A0=C2=A0.read =3D aspeed_smc_flash_read,
> +=C2=A0=C2=A0=C2=A0=C2=A0.write =3D aspeed_smc_flash_write,
> +=C2=A0=C2=A0=C2=A0=C2=A0.endianness =3D DEVICE_BIG_ENDIAN,
> +=C2=A0=C2=A0=C2=A0=C2=A0.valid =3D {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.min_access_size =3D 1,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.max_access_size =3D 4,
> +=C2=A0=C2=A0=C2=A0=C2=A0},
> +};
> +
> +static void aspeed_smc_flash_reset(DeviceState *d)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0;
> +}
> +
> +static int aspeed_smc_flash_init(SysBusDevice *sbd)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> +}
> +
> +static const VMStateDescription vmstate_aspeed_smc_flash =3D {
> +=C2=A0=C2=A0=C2=A0=C2=A0.name =3D "aspeed.smc_flash",
> +=C2=A0=C2=A0=C2=A0=C2=A0.version_id =3D 1,
> +=C2=A0=C2=A0=C2=A0=C2=A0.minimum_version_id =3D 1,
> +=C2=A0=C2=A0=C2=A0=C2=A0.fields =3D (VMStateField[]) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0VMSTATE_END_OF_LIST()
> +=C2=A0=C2=A0=C2=A0=C2=A0}
> +};
> +
> +static Property aspeed_smc_flash_properties[] =3D {
> +=C2=A0=C2=A0=C2=A0=C2=A0DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void aspeed_smc_flash_class_init(ObjectClass *klass, void *data)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0DeviceClass *dc =3D DEVICE_CLASS(klass);
> +=C2=A0=C2=A0=C2=A0=C2=A0SysBusDeviceClass *k =3D SYS_BUS_DEVICE_CLASS(kl=
ass);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0k->init =3D aspeed_smc_flash_init;
> +=C2=A0=C2=A0=C2=A0=C2=A0dc->reset =3D aspeed_smc_flash_reset;
> +=C2=A0=C2=A0=C2=A0=C2=A0dc->props =3D aspeed_smc_flash_properties;
> +=C2=A0=C2=A0=C2=A0=C2=A0dc->vmsd =3D &vmstate_aspeed_smc_flash;
> +}
> +
> +static const TypeInfo aspeed_smc_flash_info =3D {
> +=C2=A0=C2=A0=C2=A0=C2=A0.name=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=3D TYPE_ASPEED_SMC_FLASH,
> +=C2=A0=C2=A0=C2=A0=C2=A0.parent=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=3D TYPE_SYS_BUS_DEVICE,
> +=C2=A0=C2=A0=C2=A0=C2=A0.instance_size=C2=A0=C2=A0=3D sizeof(AspeedSMCSt=
ate),
> +=C2=A0=C2=A0=C2=A0=C2=A0.class_init=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D asp=
eed_smc_flash_class_init,
> +};
> +
> +static void aspeed_smc_flash_register_types(void)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0type_register_static(&aspeed_smc_flash_info);
> +}
> +
> +type_init(aspeed_smc_flash_register_types)
> diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
> index 9b95fcee5da7..6cea1313eabd 100644
> --- a/include/hw/ssi/aspeed_smc.h
> +++ b/include/hw/ssi/aspeed_smc.h
> @@ -27,6 +27,21 @@
> =C2=A0
> =C2=A0#include "hw/ssi/ssi.h"
> =C2=A0
> +#define TYPE_ASPEED_SMC_FLASH "aspeed.smc_flash"
> +#define ASPEED_SMC_FLASH(obj) \
> +=C2=A0=C2=A0=C2=A0=C2=A0OBJECT_CHECK(AspeedSMCFlashState, (obj), TYPE_AS=
PEED_SMC_FLASH)
> +
> +struct AspeedSMCState;
> +
> +typedef struct AspeedSMCFlashState {
> +=C2=A0=C2=A0=C2=A0=C2=A0SysBusDevice parent_obj;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0MemoryRegion mmio;
> +=C2=A0=C2=A0=C2=A0=C2=A0int id;
> +=C2=A0=C2=A0=C2=A0=C2=A0struct AspeedSMCState *controller;
> +=C2=A0=C2=A0=C2=A0=C2=A0DeviceState *flash;
> +} AspeedSMCFlashState;
> +
> =C2=A0enum AspeedSMCType {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0AspeedSMCLegacy,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0AspeedSMCFMC,
--=-F7beJilp3e1qVR8/tZ8x
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXVlzhAAoJEJ0dnzgO5LT5Gn4P/15J+Irw68Hzkpz+9BOr49Kh
g3P+rMJWwH0u/WOKvhgiINDMWG1I0EsKqjUg5oVKx34CdFcxe2SLbCk0B8NhkeB4
sjKnuwydxOjg6Xfzm+wTNVj1IJ6GkfsrdEjeMhYOQ3eGLpgbZO/8UpqQoY5o1NUv
4imJSmzd27E65no+Cbo0MUq6qeWyWb2vvabYJIUQKHuLqSVRTtvzfqy2Xe1TE3if
iWupcGr8+6HVk5XLI27h6dpvQtZVGcN8Q4Z25yZ5z5Ixm6A0op0DuRiZ9ZwSI+iz
IkQZjzQ5KC87cqeTgNsVkQzpatsKrZN7Y87PTwEu5VxHrJefr6IXs4hQi7StKwDh
j4zLwNiYe6gt9u7pDn1RlJkNVK6KlFbEjbIlqPSCW/DfSiMS0F1L10PYdSvT2y//
k235NPdcIyi8u5HVdq4TP1eTrurGzXdQe0FEIUgvJl0gsQHH+Ptjd7IZTZQy37fQ
WLh1fj282iL28CtzpkyYzTKgM5XZwkuk2LZ6FndUwcttBpSLfKzYY+mVefpDBOsH
V8ei0nYubovH17HG0KIBJ6tRuqmLaQVa/d+2hkTEjfJWeBaDkA6JWFBf5lyJmmhl
xVBROkdolTNBVmouTEgV1s+w6qLmO905gUWP+2+0fXseUXg43Ab7EmOd3FEIAGPb
K4YF2Xlvav+bet243vxT
=eHmX
-----END PGP SIGNATURE-----

--=-F7beJilp3e1qVR8/tZ8x--
