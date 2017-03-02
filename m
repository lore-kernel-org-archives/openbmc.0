Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vYcl96YcqzDqMG
 for <openbmc@lists.ozlabs.org>; Thu,  2 Mar 2017 14:10:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="eeDeiLxG"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="DBap33NR"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 6139F20834;
 Wed,  1 Mar 2017 22:10:42 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Wed, 01 Mar 2017 22:10:42 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=/0sOqz88accJxZGJhiyL4gbuG/c=; b=eeDeiL
 xGjC3we3MTSwYTGW/NGzVGRSj6ls1vMm0nwsqLjje6z/uL2W7gZoQuR6qLQzMnBn
 Jgrk8eKoKAed7T1SQIdxa6oalauLgWL1Zb5e4YqdgstSpGRhN5Q6FlWuk0aftVT2
 jy6UegQmlQsZCAV5XSqfZru7UeVacZtM2rxe4=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=/0sOqz88accJxZ
 GJhiyL4gbuG/c=; b=DBap33NR6z8WON3sjbGlW2evsst2wzRp/0HNYVO1dtUaY7
 dbsOiGoOSbpB/CxoOUt1R1tMlJoLtiGo5k4hfhDR6Qnbv5iDoqK35Gp3XCKlBdhK
 5o8jn2Ats1GPz9TPGhzBkzIHNILgxHSEzi5bi03zEhIYlI6kF//RztXsR+wDk=
X-ME-Sender: <xms:Mo23WH-ImeQRP_RNWJ_cqViuMiRYK9Pjshf42u7C4htPJZ84iy_vbg>
X-Sasl-enc: RNSOc6thjW95Rdgq++9JbRFveZS754g48HozvtXsNMuG 1488424241
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id C6CAC7E325;
 Wed,  1 Mar 2017 22:10:40 -0500 (EST)
Message-ID: <1488424236.4258.13.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.7 v2] arm: aspped: romulus: Set PNOR SPI
 address mapping
From: Andrew Jeffery <andrew@aj.id.au>
To: Lei YU <mine260309@gmail.com>, openbmc@lists.ozlabs.org
Date: Thu, 02 Mar 2017 13:40:36 +1030
In-Reply-To: <1488338990-2365-1-git-send-email-mine260309@gmail.com>
References: <1488337524.4258.9.camel@aj.id.au>
 <1488338990-2365-1-git-send-email-mine260309@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-HdlpiofuGuZ4ByzQFMRq"
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
X-List-Received-Date: Thu, 02 Mar 2017 03:10:47 -0000


--=-HdlpiofuGuZ4ByzQFMRq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-03-01 at 11:29 +0800, Lei YU wrote:
> The PNOR SPI address mapping is the same as Witherspoon.
>=20
> Signed-off-by: Lei YU <mine260309@gmail.com>

Acked-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0arch/arm/mach-aspeed/aspeed.c | 6 ++++++
> =C2=A01 file changed, 6 insertions(+)
>=20
> diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.=
c
> index 726b8fa..7ac006a 100644
> --- a/arch/arm/mach-aspeed/aspeed.c
> +++ b/arch/arm/mach-aspeed/aspeed.c
> @@ -221,6 +221,12 @@ static void __init do_witherspoon_setup(void)
> =C2=A0static void __init do_romulus_setup(void)
> =C2=A0{
> > =C2=A0	do_common_setup();
> +
> > +	/* Set SPI1 CE1 decoding window to 0x34000000 */
> +	writel(0x70680000, AST_IO(AST_BASE_SPI | 0x34));
+
> > +	/* Set SPI1 CE0 decoding window to 0x30000000 */
> > +	writel(0x68600000, AST_IO(AST_BASE_SPI | 0x30));
> =C2=A0}
> =C2=A0
> > =C2=A0#define SCU_PASSWORD	0x1688A8A8
--=-HdlpiofuGuZ4ByzQFMRq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYt40sAAoJEJ0dnzgO5LT5SlcP+wZ/wL9zY/0/aTbjdKH3GzLc
gWpId3Jc9W3APCHnDLGmqxDCqK9tXjgEFh89/ZUTJ4UMmH/AbLunxjs7rxbPZIed
Nz4QjtysAjytWoma+f6E8/oAGryY3wTOz6Me0DGIJxoyu2o9cm8VtniPm2VaWNtj
IwPwwuSuyiCqUgSDtO6ajiFYWEBk7FUfuN0lVH6lioqZYU8Li1AHKS0FVB9YE7ty
ZIIwW0Mp4RWe2sNn8IKgjh6isLItv1yxnn9Zez4uuXnDZoil2Y6MQ5gmrEBoXHt6
240Vd5esBn/pn6mhHtQAByrXBlhSy1O5l8ZtJ3zjXnpX5+PzU8/vAEEm6PIRMVEx
PBmf3PmVk7l1LOmoaS3BjfZNQiiAHMiECLeccU6gKAYFCDqh9sKaAU3q7qI5XiK8
xAZLhU4PbpLyGetYhztdiKfCGYUuFeVWS6pVU2Q6qP5kYFoSGZCoxH/3KUH/6JYc
TggEJWEXg2gISaF+zhxmCXf2AR8jpQ0bvwH0fwxIpehQP52Nstxo4IX7PzN4PbDw
wtzEZPwwI8XGv502YHytDNQDO2ElEL+t9vCNWegXpToS7dS8BhZsQxajX1aWoyn5
5aQ4kll7E45tsRw5GwxYR+qlUX112X29LjOyg+GN/lO9kibNL4V+ucy1rKnAKLwJ
DWfcuyZxi+gaUCJluUSZ
=79Fs
-----END PGP SIGNATURE-----

--=-HdlpiofuGuZ4ByzQFMRq--
