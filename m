Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vDzSj0nsJzDqBY
 for <openbmc@lists.ozlabs.org>; Fri,  3 Feb 2017 12:15:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="kX9Lod/h"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="qqOmHw/+"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C98A120AF7;
 Thu,  2 Feb 2017 20:15:30 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 02 Feb 2017 20:15:30 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=XwDwwVw+OIZEz28uPed6bcQIygc=; b=kX9Lod
 /hepAZ/8vTeqmW6KamwUlGJ5CDwI8v7NJt2tGEF1nLCzkmt+lORtDIuGEMQhMWnV
 gve30M6KABYKhvKTGdLzKePflOW4UnqRdz1g0KPbn3tRlwvmR7fU9D7s6FEaAqbm
 twfl9yfkpyzaAlpZEbwoOM3iWP1vOJyr5ygpU=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=XwDwwVw+OIZEz2
 8uPed6bcQIygc=; b=qqOmHw/+iFy0hVPKwyFS0XCKcFSNnZsAcnq2VTVHs7DTNv
 Qq/UJD7rXP9ndX/lsE2DK8d6duhAUChHK3yB1/kQgeZiafX9kO7BXzvqFBMieP65
 p5eX7gGGQT+owGpjsBoEab8pnlqNWWKoFlxipBPLt5zyi32oKlQHSlXMSTVwg=
X-ME-Sender: <xms:stmTWGmPYGCCuP45IdYjDhEP3ffLlpYveiaPKDVKTxQfTMAhRLoWRg>
X-Sasl-enc: 6o+3bua/lWeCxJVSEv8VHuDVaQcHOjyaT5MV3D+AmpnO 1486084530
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id B71DD24591;
 Thu,  2 Feb 2017 20:15:28 -0500 (EST)
Message-ID: <1486084522.7271.1.camel@aj.id.au>
Subject: Re: [PATCH linux v3] arm: aspeed: zaius: Disable LPC reset for UART1
From: Andrew Jeffery <andrew@aj.id.au>
To: Xo Wang <xow@google.com>, openbmc@lists.ozlabs.org
Date: Fri, 03 Feb 2017 11:45:22 +1030
In-Reply-To: <20170201011230.141303-1-xow@google.com>
References: <20170201011230.141303-1-xow@google.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-gZgQv3Ux3hZ9ZyofBjq9"
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
X-List-Received-Date: Fri, 03 Feb 2017 01:15:34 -0000


--=-gZgQv3Ux3hZ9ZyofBjq9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2017-01-31 at 17:12 -0800, Xo Wang wrote:
> Currently, UART1 on Zaius BMC is unusable until brought out of reset by
> powering the host on. In that default reset state, ttyS0 can still be
> opened and UART1 silently drops bytes, which is not obviously expected
> behavior.
>=20
> Clear the LPC block control bit that enables LPCRST# as a reset source
> for UART1, making UART1 immediately useful in that it won't discard
> bytes.
>=20
> > Signed-off-by: Xo Wang <xow@google.com>
> ---
> =C2=A0arch/arm/mach-aspeed/aspeed.c | 8 ++++++++
> =C2=A01 file changed, 8 insertions(+)
>=20
> diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.=
c
> index 4bd3680d742d..b7022eaa7b5d 100644
> --- a/arch/arm/mach-aspeed/aspeed.c
> +++ b/arch/arm/mach-aspeed/aspeed.c
> @@ -185,6 +185,14 @@ static void __init do_zaius_setup(void)
> =C2=A0
> > =C2=A0	/* Set SPI1 CE0 decoding window to 0x30000000 */
> > =C2=A0	writel(0x68600000, AST_IO(AST_BASE_SPI | 0x30));
> +
> > +	/* Disable default behavior of UART1 being held in reset by LPCRST#.
> > +	=C2=A0* By releasing UART1 from being controlled by LPC reset, it bec=
omes
> > +	=C2=A0* immediately available regardless of the host being up.
> +	=C2=A0* */

Joel: Want to clean up the formatting here when you apply it? If so:

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> +	reg =3D readl(AST_IO(AST_BASE_LPC | 0x98));
> > +	/* Clear "Enable UART1 reset source from LPC" */
> > +	writel(reg & ~BIT(4), AST_IO(AST_BASE_LPC | 0x98));
> =C2=A0}
> =C2=A0
> =C2=A0static void __init do_witherspoon_setup(void)
--=-gZgQv3Ux3hZ9ZyofBjq9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYk9mqAAoJEJ0dnzgO5LT5QA4QAIvgvnSrSrgUTZIU1wv36QXM
ltA7B9WuaBftVXK83izfQL8SsBboS84Q8CPg+8o8MSebdvVK/ej8bIB9feUWsdTG
zsClGPhJIuvvzkw7kRrLS2bIGBg20XODbjC/GsDRW4FO6pBzj9wHaa4v9hBlhd69
XfGy+d/BDtVVcd5IX4/xs4hDNYMaJt5hRJ368bD25HM2NG9Pfvejv3e3Pbheg2jA
TySrssW5MuqqSsqtrmIdKVAz9M5tHvlMiTtoUnp2SxtqXSlBl3d1okaeGwMKW9M6
7lAJMA0mE2sPcquKxNID6DkPOopnK1k7BtM+MQfB3V6md4VNb9haWhMGb9za9iMs
lYr3WYsv5lQ/WwLiuKOuVpJPGG3ahdfQizIn8PdbkzMrIVxBLBoIrPbFTeRJdWQ7
kZ0ZefZzqiGQlfsS1E11aHYxksvi8gYkXW5gzu5GhAVVBVg6boerE/LK2Pihzal/
SsjuTQ6VtJ5wXC51zFIi/NezLq8rfs0Kt9NMh1Vw7Lc88SK31OLpp5EQSoqA2Cbn
Sz9KNBYIJpha3FLRbEGoscmTEfQo+2Q7Gr22nS8Ivzz5p/jnqHnkSD8S6rXQsdqL
WuM721e8yZytnl77DuDUCoge9Vg1us46msWHvyZAJgq82dzeycS5eGUbw+g1C9G2
uuEutTr8UfNjDI1IbYHs
=4s1C
-----END PGP SIGNATURE-----

--=-gZgQv3Ux3hZ9ZyofBjq9--
