Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wJYM23qBCzDqCL
 for <openbmc@lists.ozlabs.org>; Thu,  4 May 2017 21:53:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="EoZgl88M"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="b4rSQ4M4"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 14B9D20B37;
 Thu,  4 May 2017 07:53:12 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 04 May 2017 07:53:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=6gjmt2eNbMZpM6Wd+IJ3TbDbLrUAEnLn9m/CIpfvT
 A4=; b=EoZgl88MbK9asnKI7DnL2JgYpI35nXKmOMWq4PEX6vwFCox62S+owar8H
 BH2zWAgNquMFK/27Ip+vwaFIlWssslbcNJL4YI87r0crgbO36Rdh2QWqHCwo84aU
 I2yUguLOMiyMHdikqgEIACUbsE51QQ/2i3nUUqCS/dcAdE8cLXyF6vg/wrDGuvih
 lQve1ClCOB8TLVcEbfy5uyc69kDJPFOyHTKoYYTBrYHlKkp/5tBWe9CCHg68+7Rt
 AcPTOl4wLRxiIz1hZB2OjNdjTsySm26M/AYOPxL0Ltr+IsyCYO40Dh8TWHCc0yD1
 z8/kx3AnZUkmH5ze957E/yEchYe6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=6gjmt2eNbMZpM6Wd+I
 J3TbDbLrUAEnLn9m/CIpfvTA4=; b=b4rSQ4M47D154iAQC+7isddnlYRzK1QB1z
 gDBsF87ZxddDM8pn891xzs1LPTrqYQovoJdFAXn30Jy/A5I1Ec76ni7gZoDc/wdc
 T64KoUrW2xNkJ9chhJgHzyw1S83yibTtncPfaXvI2Z3R7saJkf3b51nXi78S3URN
 vM1g/ejMIh4EFLkkRVnOvGiEwSjSoocX4wxOvU0h/rdn98nbgL+OIGZCrJDkZznJ
 fFRMcca0KbhHOyuDQpKBSoGxdLbtFQbXIPJaLphHSJzXd+yiVW9xwv/ZDVrscFPS
 35Quc3qSajOeL1tXjVv7ZUmpMJR7tedTECM0WkMwHKOJtCfhl+dQ==
X-ME-Sender: <xms:JxYLWTfVHoM4r9F507zU91NJN80Nn8qzpf3nelHgkWCSPvKlyTtNvA>
X-Sasl-enc: kQ2ewZOP1Tam/DIO1UnSBWujGdQ+ciXTyaBs3dwlIfVH 1493898791
Received: from [172.16.172.59] (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id 519CD7E2E2;
 Thu,  4 May 2017 07:53:10 -0400 (EDT)
Message-ID: <1493898773.4433.23.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10] spi-nor: aspeed-smc: Fix flash window
 size message
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org, 
 =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Date: Thu, 04 May 2017 21:22:53 +0930
In-Reply-To: <20170504023416.25653-1-joel@jms.id.au>
References: <20170504023416.25653-1-joel@jms.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-8VXz4nQGoTvdtqbO6asX"
X-Mailer: Evolution 3.22.6-0ubuntu0.1 
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
X-List-Received-Date: Thu, 04 May 2017 11:53:20 -0000


--=-8VXz4nQGoTvdtqbO6asX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-05-04 at 12:04 +0930, Joel Stanley wrote:
> When booting we see something like this:
>=20
> =C2=A0aspeed-smc 1e620000.flash-controller: Using IRQ 17
> =C2=A0aspeed-smc 1e620000.flash-controller: DMA support disabled.
> =C2=A0aspeed-smc 1e620000.flash-controller: mx25l25635e (32768 Kbytes)
> =C2=A0aspeed-smc 1e620000.flash-controller: CE0 window [ 0x20000000- 0x22=
000000 ] 32MB
> =C2=A0aspeed-smc 1e620000.flash-controller: CE1 window [ 0x22000000- 0x2a=
000000 ] 128MB
>=20
> The lack of space after the first hex number haunts me every time I
> boot a BMC.
>=20
> With this fix we see the pleasingly symmetrical:
>=20
> =C2=A0aspeed-smc 1e620000.flash-controller: CE0 window [ 0x20000000 - 0x2=
2000000 ] 32MB
> =C2=A0aspeed-smc 1e620000.flash-controller: CE1 window [ 0x22000000 - 0x2=
a000000 ] 128MB
>=20
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> =C2=A0drivers/mtd/spi-nor/aspeed-smc.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspee=
d-smc.c
> index 875b029198fc..23622bf62b6b 100644
> --- a/drivers/mtd/spi-nor/aspeed-smc.c
> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
> @@ -709,7 +709,7 @@ static u32 chip_set_segment(struct aspeed_smc_chip *c=
hip, u32 cs, u32 start,
> > =C2=A0		size =3D end - start;
> > =C2=A0	}
> =C2=A0
> > -	dev_info(chip->nor.dev, "CE%d window [ 0x%.8x- 0x%.8x ] %dMB",
> > +	dev_info(chip->nor.dev, "CE%d window [ 0x%.8x - 0x%.8x ] %dMB",
> =C2=A0		=C2=A0cs, start, end, size >> 20);

NAK! I want *no* spaces!

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> =C2=A0
> > =C2=A0	return size;
--=-8VXz4nQGoTvdtqbO6asX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZCxYWAAoJEJ0dnzgO5LT5i4YP/A0UGJJ2zysgaXrb+HRE8IaV
W2OAHeglZdMLMJwhVQt3G+mgdFea4LBtDEHl2JhIjLZEi93+ChIoo7DlY+eHyAPv
R1dzf0Etq+eCmSqfVFekT6/AAv7oGffoHS+0+v01tkoxFM3Fhv9ZaLhK7IyBd5ry
HiEVodAWiS6xrgeDAYX284EiySxqHM/RV/10cNNmksBSU19N23D78UK2X2VCVFB8
04noco0qshT6mHsLRbDDUWIT3OCWA83ktzbI53D7yaZaPlK92WdkwN1dk9Z24EJ0
eanWxAP7PZM4AZCw7VVR8M4eF9Y9rj3jv48d4jNRvwYk/uZzYzkzj3T58FmUVfWN
46+RJsH2sg9h7YmC2L9QG2qTRU20hjFp+r2+7BZ6WwGbCBO9NuhYifhD24mSNxl7
F6IwT9gzTOrWy6srL7laZjA0VZ0+BneYBixurXi0ZhkfofMhQmiECMPCwHrxjP9p
J+77g2muAYTnv2qgHXDUykn6/SbixzwBhJOUwVjPUIPYhQUut0uCLs3dzdT/Yhxj
rLD73O+PjaGpBqPwx/vxvqdollP/E70nHPVVY/Jv/RmghI2wjmnj0j/5IfAA08kc
Pm5diByp/IzxrFW0ztRC0I6cB/5dOQ1ToLmSAod3DntpRE+kNUsn/ud7L3sTZEa7
5ChNYvt5hIHqM8b4Iewp
=8EoV
-----END PGP SIGNATURE-----

--=-8VXz4nQGoTvdtqbO6asX--
