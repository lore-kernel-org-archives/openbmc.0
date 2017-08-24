Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xdC8T2vxJzDqY3
 for <openbmc@lists.ozlabs.org>; Thu, 24 Aug 2017 15:12:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="AQCf4uXL"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="kq2haJce"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 6AF1F2113F;
 Thu, 24 Aug 2017 01:12:06 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 24 Aug 2017 01:12:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=m4Y+eR2dW61s5EcKSNcTEnvQXbn73CUE4GYknhDg7
 C0=; b=AQCf4uXLMwAob6kY5xzNqevkpJT5cY8DEJ9ojtJKtBilcnalgflOR4gNL
 0S32XHW4O4UPfhyesv/31fzj1sHSFGwf9FXCaomlW3gwv3ptzipUYqkgb6PkP3TF
 62VTVPSY0QmE4SeEknTRyEdKJNBGSILpaEwkA0Y4AwvCKK85FvObSYGDmfHS3QUL
 8zb67THyUdW5UwyvoKw+5tjpO2Jm4176y0fPQie+PEsCkNXEUGLBT+p1USgaQCDN
 hkf6RopGOzFYlsdbzeHk+p8E3tlwmi/Ji7Fjbr250gZR4gvtrwljKNPUJi5pj3+X
 xZgVWQZvRfcaKOVIBkqayluZgMBwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=m4Y+eR2dW61s5EcKSN
 cTEnvQXbn73CUE4GYknhDg7C0=; b=kq2haJceNyUOYR1dOE5wuQqj9gRHoIZGcO
 sxNL+bce7FaJNrUhPUpPoT6kVq3DWoq8nTN5C/+qbTunP1Nojtw5q0T0P3YCzoVw
 8bjeWmmSBlNje+8uHMHYJ4gkjMzt2UjRxevo5ao3aKsY6Bd6Wkl43SSxXIAKLQ3J
 v7gCaCMjiiJatDajojsu0rf4yzzO28twYUw9sIZsrFJ2QKtwkk2O+GrFSAnsB9tM
 pI2PIRO2wuLtGTAl2IU3RohsQm99370b0LgYzqFDWpOfamMaqJAyspb7T9tI7Hmc
 /U8pFIK7e/iaX7Q+QZWhDdjKo02l/SmqdpwED+51Z1+EoQcCqcNA==
X-ME-Sender: <xms:JmCeWUfFRnn0eztx-e6-ngeVGFyTfGN8absupTnH--160QcSAaIW2A>
X-Sasl-enc: +GamWEGAGQ4+7rDG7DktUeYbXYBmTm7jiB/GoX4gi4qc 1503551525
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0A3EF7E1B4;
 Thu, 24 Aug 2017 01:12:03 -0400 (EDT)
Message-ID: <1503551517.4231.5.camel@aj.id.au>
Subject: Re: [PATCH u-boot v2016.07-aspeed-openbmc] Add MTD support to
 Aspeed Flash driver
From: Andrew Jeffery <andrew@aj.id.au>
To: Adriana Kobylak <anoo@linux.vnet.ibm.com>, joel@jms.id.au, 
 raltherr@google.com, maxims@google.com, miltonm@us.ibm.com
Cc: openbmc@lists.ozlabs.org
Date: Thu, 24 Aug 2017 14:41:57 +0930
In-Reply-To: <1502140837-48939-1-git-send-email-anoo@linux.vnet.ibm.com>
References: <1502140837-48939-1-git-send-email-anoo@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-r8xfSLAqebXLQp2iToq1"
X-Mailer: Evolution 3.22.6-1ubuntu1 
Mime-Version: 1.0
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
X-List-Received-Date: Thu, 24 Aug 2017 05:12:10 -0000


--=-r8xfSLAqebXLQp2iToq1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2017-08-07 at 16:20 -0500, Adriana Kobylak wrote:
> Add support to the aspeed flash driver to enable the common mtd layer
> through CONFIG_FLASH_CFI_MTD.
>=20
> This enables the flash to be used by u-boot mtd drivers including
> the mtdparts and ubi commands.
>=20
> > Signed-off-by: Adriana Kobylak <anoo@linux.vnet.ibm.com>
> Acked-by: Milton Miller <miltonm@us.ibm.com>

Hmm, the flash situation looks pretty messy. I guess the duplication is
warranted for the moment.

Applied with Milton's ack.

Thanks,

Andrew

> ---
> =C2=A0arch/arm/mach-aspeed/flash.c | 20 ++++++++++++++++++++
> =C2=A01 file changed, 20 insertions(+)
>=20
> diff --git a/arch/arm/mach-aspeed/flash.c b/arch/arm/mach-aspeed/flash.c
> index 9c5ead6..e1e3cf8 100644
> --- a/arch/arm/mach-aspeed/flash.c
> +++ b/arch/arm/mach-aspeed/flash.c
> > @@ -124,6 +124,22 @@ flash_info_t flash_info[CONFIG_SYS_MAX_FLASH_BANKS=
];		/* FLASH chips info */
> =C2=A0/* specificspi */
> > =C2=A0#define SpecificSPI_N25Q512	0x00000001
> =C2=A0
> +#ifdef CONFIG_FLASH_CFI_MTD
> +static uint flash_verbose=3D1;
> +void flash_set_verbose(uint v)
> +{
> > +	flash_verbose =3D v;
> +}
> +
> +unsigned long flash_sector_size(flash_info_t *info, flash_sect_t sect)
> +{
> > +	if (sect !=3D (info->sector_count - 1))
> > +		return info->start[sect + 1] - info->start[sect];
> > +	else
> > +		return info->start[0] + info->size - info->start[sect];
> +}
> +#endif
> +
> =C2=A0/*-----------------------------------------------------------------=
------*/
> =C2=A0static u32 ast_spi_calculate_divisor(u32 max_speed_hz)
> =C2=A0{
> @@ -1372,6 +1388,10 @@ unsigned long flash_init (void)
> > =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0flash_get_info(CONFIG=
_ENV_ADDR_REDUND));
> =C2=A0#endif
> =C2=A0
> +#ifdef CONFIG_FLASH_CFI_MTD
> > +	cfi_mtd_init();
> +#endif
> +
> > =C2=A0	return (size);
> =C2=A0}
> =C2=A0
--=-r8xfSLAqebXLQp2iToq1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZnmAdAAoJEJ0dnzgO5LT5v1QP/2p75RqBgPg69Asrs5BfRZGx
KunIc3txSOnGHp/MZn029TFyPYqW53Cp4VXyz/AumU5NcZxCilD5x/Y0gijKFMVC
zajsU6+H0ECLwaxvwuubxLU37NfTxmBMX2z5XovrQaXRsV7vUNa1G9dgyZKq4HTf
hTVDPf4WXuXcu61Q7pv1FUn9NyS1Bp7DzNoW5OglRsVKnLzh8zsoIcguO9/pRziJ
WYSFP/pLuyB2peZBOBHwnq6grCG3n8noqzeEAn7QKI6ZMuPVl32IQChYMtYo5bFf
+fyArpaIDtYdz4ta1JGO5HnbbV9jmCKWk+idnpQS0vDphZGO8St12o6O1wq/Rjma
OYQoPfg8Yw/Z8Vz/XjzTWre/u5YKiSl8FzUBSCUMU2edh1M+mqlqMT5RWpKCd9RC
LmSEJPoAPLv6a+Bcp3D0/M0U5HssFvD00XlN4KOFtjPkvJUF8dY7P/3DRtLeXZBN
7WF5ULhy0KbT/nKnQvfaIv5RJKoo/oq74Yf3udberttRFVH3JRSKCMaxWMWHAJHZ
ULGJUsL0ItBNyjIDUcQfh5k1OfsZMidFqknd8G7vsFZtQ5LLwkPEMcwXzYnQFi3g
DqdnbV6Gi3X6t0KoI1pn0KM2Ym0cgvh4U9gwySOxfDXxA7pUEhIaWE79jNPgNLPW
XE3M/upQemDbHLD61DAn
=56qe
-----END PGP SIGNATURE-----

--=-r8xfSLAqebXLQp2iToq1--
