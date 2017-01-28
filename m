Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v9Skk27p4zDq6j
 for <openbmc@lists.ozlabs.org>; Sat, 28 Jan 2017 19:00:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="AV5TPadc"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="gT6HVbBG"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 417C6209BC
 for <openbmc@lists.ozlabs.org>; Sat, 28 Jan 2017 03:00:25 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Sat, 28 Jan 2017 03:00:25 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=SbvkOz5hwqqv42srAEai1Z6aFCE=; b=AV5TPa
 dcuIuWKl78NepyWDzNRPrlwf2E7jmWb/+z0eCYvSTPOhaIsUX/ksw6wLhB1ZoLTI
 YGeiVc2jLyassVq1S7pguLLs5zfCUyVC8ExJLLOjAA1b1YWmsgNHkUE14FyzN1EU
 LY5jQG5kKZK+Bx34Rb+bF/wIk5DzhUKx4gWPw=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=SbvkOz5hwqqv42
 srAEai1Z6aFCE=; b=gT6HVbBGO8JPW77oW8NuutjMaGPV19fS7UcUFiIA6CwixZ
 WC5dnit3IGV/bFrJ7Q5/8m5tShBlbd57vIadAaorGpGP/ch2ZhARQSbrFzlSj+hH
 rb7zWN0fQGk2noruO1ZkM4HgSGqGQtgiyhY3NVqp3+2/XwjJOtiNBKGk5cOy4=
X-ME-Sender: <xms:mU-MWHRyC1dUUr5i5Klxbe2Cn8cgfcbH6g4oVeibBTN7LDBVttVwOQ>
X-Sasl-enc: xfyHJM8l+apQYNQWSd067Z31huPR+CvbLIBTtdCk5lH2 1485590424
Received: from lasair.aj.id.au (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1FA81244B4
 for <openbmc@lists.ozlabs.org>; Sat, 28 Jan 2017 03:00:23 -0500 (EST)
Message-ID: <1485590413.2450.7.camel@aj.id.au>
Subject: Re: [PATCH linux v2] arm: aspeed: zaius: Disable LPC reset for UART1
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Date: Sat, 28 Jan 2017 18:30:13 +1030
In-Reply-To: <CAPLgG==oWWy8pTpLszLOECXK7pQMXW8uE_NgpFz7Awx51q5ohA@mail.gmail.com>
References: <20170127232307.110483-1-xow@google.com>
 <CAPLgG==oWWy8pTpLszLOECXK7pQMXW8uE_NgpFz7Awx51q5ohA@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha384";
 protocol="application/pgp-signature"; boundary="=-0Go/DIx4elNzceJo3Km/"
X-Mailer: Evolution 3.20.5 
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
X-List-Received-Date: Sat, 28 Jan 2017 08:00:31 -0000


--=-0Go/DIx4elNzceJo3Km/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-01-27 at 15:32 -0800, Rick Altherr wrote:
> I still don't follow.=C2=A0 Is this changing it to drop bytes until the
> host powers on?=C2=A0 Is this change making it so the device won't open?

I understand it to be the other way around:=C2=A0

In the existing configuration UART1 will drop bytes by being held in
reset until the host initialises the LPC bus (i.e. releases LPCRST#)
during boot.

Xo's change reconfigures the SoC so that UART1 reset state doesn't
depend on LPCRST# (i.e. the host initialising the LPC bus), so it is
immediately useful in that it won't discard bytes.

Xo?

Andrew

>=20
> > On Fri, Jan 27, 2017 at 3:23 PM, Xo Wang <xow@google.com> wrote:
> > Currently, UART1 on Zaius BMC is unusable until brought out of reset by
> > powering the host on. In this reset state, ttyS0 can still be opened
> > and UART1 silently drops bytes, which is not obviously expected
> > behavior.
> >=20
> > Clear the LPC block control bit that enables LPCRST# as a reset source
> > for UART1.
> >=20
> > Signed-off-by: Xo Wang <xow@google.com
> > ---
> > =C2=A0arch/arm/mach-aspeed/aspeed.c | 7 +++++++
> > =C2=A01 file changed, 7 insertions(+)
> >=20
> > diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspee=
d.c
> > index 4bd3680d742d..fa99d8bde5e0 100644
> > --- a/arch/arm/mach-aspeed/aspeed.c
> > +++ b/arch/arm/mach-aspeed/aspeed.c
> > @@ -185,6 +185,13 @@ static void __init do_zaius_setup(void)
> >=20
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Set SPI1 CE0 decoding window to 0x300000=
00 */
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 writel(0x68600000, AST_IO(AST_BASE_SPI | 0x=
30));
> > +
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Disable LPC reset for UART1, otherwise h=
eld in reset by LPCRST#,
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * silently dropping bytes until released (=
usually by host power on)
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * */
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D readl(AST_IO(AST_BASE_LPC | 0x98));
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Clear "Enable UART1 reset source from LP=
C" */
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0writel(reg & ~BIT(4), AST_IO(AST_BASE_LPC |=
 0x98));
> > =C2=A0}
> >=20
> > =C2=A0static void __init do_witherspoon_setup(void)
> > --
> > 2.11.0.483.g087da7b7c-goog
> >=20
> > _______________________________________________
> > openbmc mailing list
> > openbmc@lists.ozlabs.org
> > https://lists.ozlabs.org/listinfo/openbmc
> >=20
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

--=-0Go/DIx4elNzceJo3Km/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCQAGBQJYjE+OAAoJEJ0dnzgO5LT5CWgQAJfqxpTZ6zuHREBvP1g/vFVB
5g+poEylV0/NR+xRj7O3z9AN32nYG1UyVSbkGzNkDDDdFcOiJuxzPlggf+i9Vk5H
iwJSSEpp8tuqmr8DuXCzLyxKQKnwUvMJAPTUNMarLlF/7etZslUL+3lRmTICdeC6
IovG1RlKikitF9U/JcHmjo8P8Mm0poWnN7TwwS77Gs/Er1SjTNPLG3587YFDok5D
Zc2WFBXaqy5Ho7sfM4Vylpg2HOiXpM+rlXGJCyIHG+O75yE/JcAUeW2qQ7wca83a
E/SqFOA8zmybe9FE9UlYOaqDk2fYMeyc8nIA489u8AE9t1VWV5x10zDsQxCHfhmN
FbeyOnkgFNfOgHcTNT308oqcwMFctsRCG+0kd7c33JVXsAMbZy98fO7QtoanzKV4
LgrSgSIW38iwCidUF75y+1yJftfeclDV3yyKplHvHfxlHZJSFz4CETaG3pvh+huc
2RGON/ThJfOIv2ijDmXSk27VXQ1re5BGZcQEtEnrV019yv8hKeAVWmaYMmRGBEHL
VOspBNw0rJSBAXHETN5aCOSJXgUntmPw0tBTZ78NFnuOFqbw1JyY020RBhCikP4C
iEjM71aCP6UlsrQ0ZWPlP+SUuK/48d6ntIO2zT7osw9fBlhmZout4GIlFpZn2FzP
iSs1qXUqwos6vTSclHeN
=NURx
-----END PGP SIGNATURE-----

--=-0Go/DIx4elNzceJo3Km/--
