Return-Path: <andrew@aj.id.au>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tNDWd35mNzDvw8
 for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2016 16:27:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="fyEKUQtB"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="foH8rbRX"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 44BC0207E0;
 Tue, 22 Nov 2016 00:27:55 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Tue, 22 Nov 2016 00:27:55 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=Zx8Hwy/bBPJEqgbkXNt7gSWWpU8=; b=fyEKUQ
 tBDkNvVEAA8oPVNsl+uZsfvt/+0+4D2xMKtciw+mmSrvSk+wdvkTNosuHqewwhkw
 Wpjtfnby9P6B76miYsUn/0JkUMidS07vEf7CprhRsY8+BJJt0jDmcqBbYMshyOYs
 ZFPRh8tKDRYGTKzTebjA0kO1vJqcfsBJo/+7Y=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=Zx8Hwy/bBPJEqg
 bkXNt7gSWWpU8=; b=foH8rbRXpyqOGRLvVwrtgzXgTVf0GE/y8iwiczWCM2z6ox
 3HfMtLWRJX8wh3jmkmbC8a9Fnk+0sbEEENKu+latqj/dVRLzM2ACjineikUdkdcf
 xtopDjUf1+cCdSYS7cLPQPjShqzRsLDhzjQHkLYJusIRhYAEc7Zofk8lx8lvs=
X-ME-Sender: <xms:W9czWOQ5wLEbExm8ZCP14j8PBSQGx6T7dAuzGMHb7He9dxhrxWE2qw>
X-Sasl-enc: rq2DbkjkBUJHuFuYatGa4kLDAFOpg5Lat/XlJAGZZjuT 1479792474
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id DBC2324426;
 Tue, 22 Nov 2016 00:27:53 -0500 (EST)
Message-ID: <1479792470.2503.32.camel@aj.id.au>
Subject: Re: [PATCH 7/7] arm: aspeed: Fix unused variable warning
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
Date: Tue, 22 Nov 2016 15:57:50 +1030
In-Reply-To: <20161122040849.31604-7-joel@jms.id.au>
References: <20161122040849.31604-1-joel@jms.id.au>
 <20161122040849.31604-7-joel@jms.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-fwVq4o/gFI5mDugxMcai"
X-Mailer: Evolution 3.22.1-0ubuntu2 
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
X-List-Received-Date: Tue, 22 Nov 2016 05:27:57 -0000


--=-fwVq4o/gFI5mDugxMcai
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2016-11-22 at 14:38 +1030, Joel Stanley wrote:
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0arch/arm/mach-aspeed/aspeed.c | 2 --
> =C2=A01 file changed, 2 deletions(-)
>=20
> diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.=
c
> index e64497a297a1..a491cd2ff003 100644
> --- a/arch/arm/mach-aspeed/aspeed.c
> +++ b/arch/arm/mach-aspeed/aspeed.c
> @@ -128,8 +128,6 @@ static void __init do_garrison_setup(void)
> =C2=A0
> =C2=A0static void __init do_ast2500evb_setup(void)
> =C2=A0{
> > -	unsigned long reg;
> -
> > =C2=A0	/* Set strap to RGMII for dedicated PHY networking */
> > =C2=A0	writel(BIT(6) | BIT(7), AST_IO(AST_BASE_SCU | 0x70));
> =C2=A0}
--=-fwVq4o/gFI5mDugxMcai
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYM9dWAAoJEJ0dnzgO5LT5tI0P/1obYUEHjn94mk7DreApjPkJ
1J19VX1krnT26i+GmG+sDmqC5YM5P4FPmPww6toBKC3CsEkVaB9AonuHK86YmXLH
ydOqWz5HMYWGXVRYw/n+GLx2czR10ZykwUbWQ1rHvLZh+l4PQ/5njVHIjfe0+ZnP
GhXf22hzgiSU+h4VweLLPilpSL1Xi7rTuD8hCrQU1AzcquohuE0NEi/4IAlOFB3X
fBkQ8BfIXgNq71OrmRMkhoQ7t8Up2Em23+SQ+fxFZydoPgJUnV5gHrd4dvG5mZiH
iDmThiU8QjmxOwxtlbpdbiUUStCFnBJnh5NJjJExVLul6rBWXKgMFStAgR/RZDdy
dnKRIx698OEB5ls07e21P3e2dcWCNYe4vOrObgyCkQCmRhIZXvezewqFVVjy/gpV
EbaYkerlS/TQ5RFCZkyogDSun0rI9iCMGSOCJ4Af5hcri/e/CTnQpG4HXO2xuIlU
lGlxbwok/D/lzPuglzA7oPKiLHuAVoslQ6I0MOSitQIMXGuj3Bjn+2rQyAXdWijp
Lmu9G1K4tm36FBEdlevROx2i4VMR6R4dH1IQd6ulGYfE0M4b12gZa3IGdZe3xo4g
WimaUmwzNjWHnCwlx/MBrb2C708xVY3i4s+b2Lf9wU014mDJ80oJQy24YSkjPcjw
YHkquruDtyrnp2AUXRgj
=6Hpf
-----END PGP SIGNATURE-----

--=-fwVq4o/gFI5mDugxMcai--
