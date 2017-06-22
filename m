Return-Path: <andrew@aj.id.au>
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wtVFc0BzjzDqjM
 for <openbmc@lists.ozlabs.org>; Thu, 22 Jun 2017 15:17:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="XNA4+lAk"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="qy+DgTRb"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 571162070F;
 Thu, 22 Jun 2017 01:17:21 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 22 Jun 2017 01:17:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=M5Jg3MtPCF75OATl+zsMnqwCOXQ1TSy6xQZnUErAI
 RI=; b=XNA4+lAkWI7xjjAqMCB4vC74xkGYuAOLTpnV2XfRvRqWo1/2k0j8pnG9t
 +zbRZQiVBEz9vBnoLMghNF87OBKnTAxKm1LMBrUc6/KhydRxBzWgs+Lqf+DT8zA2
 H13ORF4RVkQXTZGpoJa51iF2ZZdUTZJvwCb6NtFRg+Ea57L3xTREhuPGDxfwugzx
 yy2ChUmI9iOTaQPbRH6kGVODRLmzRhKxMbqhRyX6boMEN4basTYvs57XyFx0J6hJ
 7uQNiGGBZvo0edbi0tHtftRWJ5HBwAk6n25hmxL+6WuS1Kt7o/SWU4uJZDW0gH/d
 ltjReaFrZokbKbtOPPNRLIyVQBVNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=M5Jg3MtPCF75OATl+z
 sMnqwCOXQ1TSy6xQZnUErAIRI=; b=qy+DgTRbFglj0NsiC2MSOYg9djKp/3mH6h
 /aUTwS5pbu/hoV04E0Ssh2A73ekzAbhea2BVgIqFaYR+PRyV17Tyt5FsRV/32B34
 Pm5Ns7NPcSP7OUdOgv2k5sZjyjEIOQtS7PVaqpW6fgqvTPQf69Fjauz8PNineZKj
 AuyPq7jzEn9rDuUItsKkrkgQRrxIkvEnlrG24qqa1cWM4x/3zBDwGYoV3qcCnDYR
 ILXDRoAFscxPRj5cU/+8Idr1IsB4lLsRACslg51aSJdW5kqdrnn3y88b7E642ReP
 Q0UxCswpzCUkgU5cCoX4hPo7zN/MbYg8KpcKzfiQMWA6hDTmOJRA==
X-ME-Sender: <xms:4VJLWemrljTt3cUPujiydEtDMy5t-H0ABXLLVVFql0ysgFFZuHrgaA>
X-Sasl-enc: Rfpqcj3d5/qwW3CDvkXbr29MeyL8SyCPseDwi9sz8dVY 1498108640
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8FAFF240F6;
 Thu, 22 Jun 2017 01:17:19 -0400 (EDT)
Message-ID: <1498108633.5203.3.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10] ARM: aspeed: fix reset of AHB controller
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
Date: Thu, 22 Jun 2017 14:47:13 +0930
In-Reply-To: <20170622051321.18790-1-joel@jms.id.au>
References: <20170622051321.18790-1-joel@jms.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-lX0cv3s2InSS0yiRLgUS"
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
X-List-Received-Date: Thu, 22 Jun 2017 05:17:26 -0000


--=-lX0cv3s2InSS0yiRLgUS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-06-22 at 14:43 +0930, Joel Stanley wrote:
> We have a reset of the AHB controller in the early boot path otherwise
> some peripherals (i2c) are not accessible.
>=20
> The reset register is level triggered (for all lines except the JTAG
> peripheral): write 1 to reset, write 0 has no effect.
>=20
> In c93456b24c68 ("aspeed: Don't blast SCU04 at boot time") we tried to
> preserve the state of the JTAG controller, however, we inadvertently
> reset a bunch of devices by doing the read/modify/write to the reset
> register.
>=20
> Preserve only the state of the JTAG reset.
>=20
> Fixes: c93456b24c68 ("aspeed: Don't blast SCU04 at boot time")
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> Tested that i2c works again on the evb
>=20
> =C2=A0arch/arm/mach-aspeed/aspeed.c | 8 +++++---
> =C2=A01 file changed, 5 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.=
c
> index 4c5c4853e778..32eb36183e92 100644
> --- a/arch/arm/mach-aspeed/aspeed.c
> +++ b/arch/arm/mach-aspeed/aspeed.c
> @@ -237,12 +237,14 @@ static void __init do_mellanox_setup(void)
> =C2=A0
> =C2=A0static void __init aspeed_init_early(void)
> =C2=A0{
> > +	u32 reg;
> +
> > =C2=A0	/* Unlock SCU */
> > =C2=A0	writel(SCU_PASSWORD, AST_IO(AST_BASE_SCU));
> =C2=A0
> > -	/* Reset AHB bridges */
> > -	writel(readl(AST_IO(AST_BASE_SCU | 0x04)) | 0x02,
> > -	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0AST_IO(AST_BASE_SCU | 0x04)=
);
> > +	/* Reset AHB bridges. Do not modify the JTAG configuration bit */
> > +	reg =3D readl(AST_IO(AST_BASE_SCU | 0x04)) & BIT(22);
> +	writel(reg | 0x02, AST_IO(AST_BASE_SCU | 0x04));

Bikeshedding here, but it feels a bit odd to spread the bit-ops across
multiple lines here. What about:

    reg =3D readl(AST_IO(AST_BASE_SCU | 0x04));
    writel((reg & BIT(22)) | 0x02, AST_IO(AST_BASE_SCU | 0x04));

Andrew

> =C2=A0
> > =C2=A0	/* Enables all the clocks except D2CLK, USB1.1 Host, USB1.1, LHC=
LK */
> > =C2=A0	writel(0x10CC5E80, AST_IO(AST_BASE_SCU | 0x0c));
--=-lX0cv3s2InSS0yiRLgUS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZS1LZAAoJEJ0dnzgO5LT5bwoQAI1eNV3WmsPriMf3cLZWPVHI
2M/MWNl/eZaKqDbdRRNpVnipTVuzvrFcjdurSEuLT8dBtpLFjpNf+dOV2xko5NaX
z8dMH83rDx4oL5x90Pv0ofSdO/R1v+CP3sUrUFWaBSZPq6T2U0+Ei/zVbjvCzcvt
575ivnG8L5VFky9Xb22CMOboB3MdHwLCb5IXqn3ImDPdpqByB48ffgNehgjVCbqw
PBOoQEZ9aYakZHVSTLDMRRAotrWZIc/ezySKgCRnRtzlt0AB4WcA/3E+/48JuYqt
ZjMBiBMQy9ezQGTFPqlP1yzmRwpGx+DSTnYfIap/zyDirYtMojTEBn7ONIo8U21f
5fl5E4N66pHkGtK2B0bFLYxfF/OdM3lrghcggDs+uM2YfcfBrZX7+2jtcy1Y7Qog
qKggRDkrQQqK5Kr2ie1AdF15ATgUDqvPACC+lD0/to5aM2ijsPLmO6RD7/EWNry3
ZloclYgD6ycnJtQ+wG28e/h3oF0+ffYC9oIICYsf5k2TRMCTDSi2YKd/Qjgd+OqV
jCq7BX3C7tDU/cuCaoVhLSfmaaJVCxwTQvqg9lCG1vR9dQcAXidMAYUaMXKj3uod
XeG3GNATLuHbQyv69D1oGPRmSBsS15YGdQWHxgj5RxN/3a4icaE4Ehxg206tv6SD
Ks2nc6RtZ5EAZEgZU3WS
=5k4s
-----END PGP SIGNATURE-----

--=-lX0cv3s2InSS0yiRLgUS--
