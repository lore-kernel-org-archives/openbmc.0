Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t86PV0FbyzDvHZ
 for <openbmc@lists.ozlabs.org>; Wed,  2 Nov 2016 23:10:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=RmZy1ehS; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=OzgqyssE; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 668EC2092A;
 Wed,  2 Nov 2016 08:10:34 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute7.internal (MEProxy); Wed, 02 Nov 2016 08:10:34 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 x-me-sender:x-sasl-enc:message-id:subject:from:to:date
 :in-reply-to:references:content-type:mime-version; s=mesmtp; bh=
 +N4yyv5o9XhezQkXzisENJDa4Yg=; b=RmZy1ehS5L8aSS2ECefuLf9Ky7V366FL
 NyJyeqo7e17+VzlT6ZqVUk6qTk9Eftv2ios3aOzzmOcQqapuNtVs1htaOwsfSZL0
 XPwruAvOkZsL1j7Jh+VSrZGDdT0RNAAE3D9mrHI+uX5q/JXJnzztSARBcYtc+gZ+
 cwuTFAs9h5c=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=x-me-sender:x-sasl-enc:message-id:subject
 :from:to:date:in-reply-to:references:content-type:mime-version;
 s=smtpout; bh=+N4yyv5o9XhezQkXzisENJDa4Yg=; b=OzgqyssEZk68xv94a
 yWUzAY5SUWWp81BQVU1YeYnUZPb42WPyyrpE6nBZgaK8y+jhGhP/Qk2tR7F0WZXp
 8Z/i1kY0aWQX8vsVTVOS0dlecQXYkxug+zZrGpkpDv31NQzQiMVacup+FBuw8IHl
 nt5i2ZpfS++EXH1pkPjk/kQWlo=
X-ME-Sender: <xms:utcZWLhPtDxHn0Gj61OqgDIyteaccwDnNwFoh2t6S0FI2GN8RZTUlw>
X-Sasl-enc: jfoSnhTPfkvVSkt92Jhn1TWHVvHCDUPWkfRNdeYqATjl 1478088633
Received: from keelia (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id A69B8F29CF;
 Wed,  2 Nov 2016 08:10:32 -0400 (EDT)
Message-ID: <1478088626.27396.4.camel@aj.id.au>
Subject: Re: [PATCH 1/2] arm: aspeed: Add Romulus BMC-specific early setup
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org, Xo Wang
 <xow@google.com>
Date: Wed, 02 Nov 2016 22:40:26 +1030
In-Reply-To: <20161102055557.24349-1-joel@jms.id.au>
References: <20161102055557.24349-1-joel@jms.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-FPOVxh2yDE7rLHU/Su7J"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
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
X-List-Received-Date: Wed, 02 Nov 2016 12:10:39 -0000


--=-FPOVxh2yDE7rLHU/Su7J
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2016-11-02 at 16:25 +1030, Joel Stanley wrote:
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0arch/arm/mach-aspeed/aspeed.c | 6 ++++++
> =C2=A01 file changed, 6 insertions(+)
>=20
> diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-
> aspeed/aspeed.c
> index ebb2224dcd13..0a4578290d5e 100644
> --- a/arch/arm/mach-aspeed/aspeed.c
> +++ b/arch/arm/mach-aspeed/aspeed.c
> @@ -214,6 +214,10 @@ static void __init do_zaius_setup(void)
> =C2=A0	}
> =C2=A0}
> =C2=A0
> +static void __init do_romulus_setup(void)
> +{
> +	do_ast2500_common_setup();
> +}
> =C2=A0
> =C2=A0#define SCU_PASSWORD	0x1688A8A8
> =C2=A0
> @@ -262,6 +266,8 @@ static void __init aspeed_init_early(void)
> =C2=A0		do_witherspoon_setup();
> =C2=A0	if (of_machine_is_compatible("ingrasys,zaius-bmc"))
> =C2=A0		do_zaius_setup();
> +	if (of_machine_is_compatible("ibm,romulus-bmc"))
> +		do_romulus_setup();
> =C2=A0}
> =C2=A0
> =C2=A0static void __init aspeed_map_io(void)
--=-FPOVxh2yDE7rLHU/Su7J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJYGdeyAAoJEJ0dnzgO5LT5FIsQAK32OSR21C37DjGjC1hFjGcD
3GEfU+UcBfdtDfwRMiyexazxKVNmwTnR7M1NQqem4eR00j2uUIRE1WRYLxsEssfI
KZv8jzNGfEnEfc31VJ2ET/ZfeH5B2maiTmj6p6QHKPWYPnOAJ4hmTi0D64WQycM8
ZL36Sarp1Ti/bkvcM1nMHPsksp2fmxgLZf215nctmlkKOHzOf52gZOcXw4AGuhK+
9PZ7FaPJXIPjUbWmL1OKgSF4+jtjQ/f95FMaRkOxBiUvyROrMeoY+pvpiRQed8e6
DsWkNOWvrTIM6yzKgRnIaYJb6MW8nHwJ0V7KA28C+9tIzw4UBNQvWH35GW1SfuXY
yBFQy2oNwy+RSQMaUSGRUmbuA+NKniXwhTvgZSxE6HSomzZn+9inR1S6ouQmt+gZ
ZcevbuKStQnKXL6fkQYLKMb1gOhMREr7eTWyAsjbk2xkEfCHqBcKtRdSyQJReMW0
j5x70ls+bbzZ+xUbxWTeJlYenXPvL0wn3Dv343Nf2RRUtluzWcY1HmXdw0Cs+N88
C7IFmH2P8IorbHK3dP9CksFFGLq/JFVSvcDQaV0a9VV9gZ6rwZ9g7O84MHpNF6dL
Gaod/v+tQHCe3FNX9VIb7Nls9Q8/ckmb9HunnI7dhR5RjPEaZIEKrL/7kFqx6WLp
5VbFAL/UhxDVapSLfHAZ
=Y0ye
-----END PGP SIGNATURE-----

--=-FPOVxh2yDE7rLHU/Su7J--
