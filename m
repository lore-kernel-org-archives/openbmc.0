Return-Path: <andrew@aj.id.au>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tNFS91kDGzDw34
 for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2016 17:10:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="VJ9dxhW0"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="juxkEGkl"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 62A9820844;
 Tue, 22 Nov 2016 01:09:57 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Tue, 22 Nov 2016 01:09:57 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=09An+WRKT72wj01vdG40JPhuOY4=; b=VJ9dxh
 W0AgbEg8yHEkGAYawEKjZOFYXrmqeBmU4Z33SIT60P5LRIoFgU2mphhd6xoi1Zrw
 CMLWJ3nYLl0cxagUhzZqvuUg4SpYSEmZUBwPE9/3SWReu39fSDEHl8OzNrSwfWch
 +/9nRNZ4/xqVAsspw/otivzmn65Hr0mwUQvdk=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=09An+WRKT72wj0
 1vdG40JPhuOY4=; b=juxkEGkl7ZSzr0SYMdqWUlfS8EFu6B2PBuk7Bw4LKK9Pic
 stystA5SJbEgSHJBevG8hrPJB5QnixSwLOWPWZiVzq0UaU4kaIN2BBVz6JJSm895
 RCU65mDxgDtNIBk0Lca8Lja6HXRlSMhAszLhjaV7m3J9FdVApmWWGAXyH2YYA=
X-ME-Sender: <xms:NeEzWLMK00bx4Ew0GJaKQGx7mCdxTsIF4oxr8un5JWUmbMQx0Wvccw>
X-Sasl-enc: 5x8F+xRDE+RAMmPLGqaZWX5ZoLyxgmuFWPiW3ickNdn4 1479794996
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1B2847E425;
 Tue, 22 Nov 2016 01:09:55 -0500 (EST)
Message-ID: <1479794990.2503.38.camel@aj.id.au>
Subject: Re: [PATCH] pinctrl: aspeed: Add parentheses to HW_STRAP test
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: openbmc@lists.ozlabs.org
Date: Tue, 22 Nov 2016 16:39:50 +1030
In-Reply-To: <20161118070635.17708-1-andrew@aj.id.au>
References: <20161118070635.17708-1-andrew@aj.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-MHC1PVUSWvyGQ9TBK6cH"
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
X-List-Received-Date: Tue, 22 Nov 2016 06:10:02 -0000


--=-MHC1PVUSWvyGQ9TBK6cH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ping, for all the important things :D

On Fri, 2016-11-18 at 17:36 +1030, Andrew Jeffery wrote:
> Squashes a warning:
>=20
> drivers/pinctrl/aspeed/pinctrl-aspeed.c: In function =E2=80=98aspeed_sig_=
expr_set=E2=80=99:
> drivers/pinctrl/aspeed/pinctrl-aspeed.c:210:24: warning: suggest parenthe=
ses around =E2=80=98&&=E2=80=99 within =E2=80=98||=E2=80=99 [-Wparentheses]
> =C2=A0=C2=A0=C2=A0=C2=A0offset =3D=3D HW_STRAP1 && !(desc->mask & SPI1_RE=
G_MASK)))
> =C2=A0=C2=A0=C2=A0=C2=A0~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
>=20
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
> =C2=A0drivers/pinctrl/aspeed/pinctrl-aspeed.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/as=
peed/pinctrl-aspeed.c
> index ce1399dd8b68..387b75aebc25 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> @@ -207,7 +207,7 @@ static bool aspeed_sig_expr_set(const struct aspeed_s=
ig_expr *expr,
> > =C2=A0		=C2=A0* all descriptor bits.
> > =C2=A0		=C2=A0*/
> > =C2=A0		if (is_scu && (offset =3D=3D HW_STRAP2 ||
> > -			offset =3D=3D HW_STRAP1 && !(desc->mask & SPI1_REG_MASK)))
> > +			(offset =3D=3D HW_STRAP1 && !(desc->mask & SPI1_REG_MASK))))
> > =C2=A0			continue;
> =C2=A0
> > =C2=A0		/*
--=-MHC1PVUSWvyGQ9TBK6cH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYM+EuAAoJEJ0dnzgO5LT5U1EP/1dx68fjbFAfHzXUBCWUDP7I
wu3h4il5mVHA+0eudcENwqT5Jgk8UU9S5nLGwywmyr6ZkZfw25O84zVKlF0mL1pn
CV0hLzHZwrdWkYeGdvQ1gxOlaBT4nEPSaRg57xXZn8lnIjZnBdeuBnLTO73ea1WL
Hh+IGHv0kCkYc2unJGkpxGTuueXcEt8CK7vq+6/EwxzlJGQwC9M90fRp9EnQ8cS7
7MXR0MsrXlYahIo0Ikzq6orROTefXzAk9/lK1nrGH3vOlFE+aQ94tYMYFbQ9EJ9X
v0NbrATmq2sGhfvwoLa3+F7jfgTdzORqNMAIxUfN8uQ88qtoSr+Sq4XkcJuuhojT
kirzd/McsAIDzR7f4GMp0iRrF89d0f4FRD252RmgegZP+iRqlMm7S0HlEqql5c8Z
IK5haEbOS1uuet7gSd4yJzSeqSyTcr1/DOVwXLhEAwH3e4qf+ecqlC5A9fXoc5Dw
s4PcaOntC3rlow6k+f6mw2siIpWdpzUQQ4BSYwHwRhWh3ix+qwT4yaMZstKlxcyA
P9Zo7oIeVJu3rb8XXHoJIuFkBj68ZDLF42tx3pV/HNcNDskvG77Z85iHznMiNqJ2
e2L+E0e10HjnPajhfU2FMriAMYKr1vpZ/YZ1agid+e/4GjYGPREGI6nF/xqL9TTj
9jIw6yfpAl93EZfdEg13
=q9lK
-----END PGP SIGNATURE-----

--=-MHC1PVUSWvyGQ9TBK6cH--
