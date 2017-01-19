Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v3sT73Z9vzDqL4
 for <openbmc@lists.ozlabs.org>; Thu, 19 Jan 2017 16:14:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="aD5YGrnK"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Itr8dUz3"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id B636720988;
 Thu, 19 Jan 2017 00:14:13 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 19 Jan 2017 00:14:13 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=l9cnYT+9XhWn2mSm+987ibX24Mo=; b=aD5YGr
 nKrB23m3UpB1qbo6QW/b9axoAw1N7GjCTvTSjocUgEDtgjiRC4/p2m3F0WtxtsL8
 XpdZYN+JySdbqn3JVa0FV4Xt1NNqcjttTBc6AfaSOXHF3EHrG1KVE+2rQpVZqqkN
 b3m8dbf5ItQ2ESRkw8LYqXAXl3Nse28GbfIGk=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=l9cnYT+9XhWn2m
 Sm+987ibX24Mo=; b=Itr8dUz3nxi8xmdXZYc0eGK0UiS1rphtf6ET14T2Cy4FmW
 zCoF36DMP+pI2+paRmwHas4UX2SCTdJbDE1ssrTr+BGMheOQfBKnCMgaQuVwkHo9
 qhTUB3/SUGGf8ZoQiR7avKN4/jKAuYTTWYRWNl/4d7C8iJdBHGdjkly9a7o/A=
X-ME-Sender: <xms:JUuAWGD0j3kTqr21m1rAZ_SucrOlPZ8pt72TR78ku8vC4DBY_8OtnA>
X-Sasl-enc: ccWOwnTCAznbe9qsnbeMj02ETVAh1js73yLLma3GF2D5 1484802851
Received: from [172.16.11.86] (unknown [59.167.200.242])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6997F2468C;
 Thu, 19 Jan 2017 00:14:08 -0500 (EST)
Message-ID: <1484802835.5602.2.camel@aj.id.au>
Subject: Re: [PATCH] arm: dts: aspeed: witherspoon: Fix BMC's compatible
 property
From: Andrew Jeffery <andrew@aj.id.au>
To: Matt Spinler <mspinler@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: Matt Spinler <spinler@us.ibm.com>
Date: Thu, 19 Jan 2017 16:13:55 +1100
In-Reply-To: <20170118221930.16757-1-mspinler@linux.vnet.ibm.com>
References: <20170118221930.16757-1-mspinler@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-pur4FWHNv/2Y+oPu+0fd"
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
X-List-Received-Date: Thu, 19 Jan 2017 05:14:21 -0000


--=-pur4FWHNv/2Y+oPu+0fd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-01-18 at 16:19 -0600, Matt Spinler wrote:
> From: Matt Spinler <spinler@us.ibm.com>
>=20
> Update the BMC's compatible property to make it consistent
> with other systems, and also because code is hardcoded to
> check for a certain value.
>=20
> Signed-off-by: Matt Spinler <spinler@us.ibm.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> index edfb05c66ce7..6064afa04421 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -5,7 +5,7 @@
> =C2=A0
> =C2=A0/ {
> =C2=A0	model =3D "Witherspoon BMC";
> -	compatible =3D "ibm,witherspoon", "aspeed,ast2500";
> +	compatible =3D "ibm,witherspoon-bmc", "aspeed,ast2500";
> =C2=A0
> =C2=A0	aliases {
> =C2=A0		serial4 =3D &uart5;
--=-pur4FWHNv/2Y+oPu+0fd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYgEsTAAoJEJ0dnzgO5LT5YCkP/ipM1539dwkB4l5UPXwTakd+
5mqRxQOSLkvYoY1p/9O2oVLdkg7eVNXSu6KJ/3VP+63lYLJa7RuA4hfG17VqgERw
wnrGsNNvqOZpnofqHu5iaWFGQoQ9LkgGXSkEHh4tuBNm2sA3fiPNlyWLLlrhnGez
BSSsBLbHtkseEoedr6yiQa8aPW3aYjOPjBlDnuFxbAsKibmV2jim4eGIcaB1YZzw
i8zLDTsobPALaURHpW/bO6xuvetKOFHLo8lZPlE+jeByIWxWZwqfC0GmYUgK+5dU
xa7cxVF06mOHC5SLgjw5qm2ifx8C90lx0owiGF9+iriWXO18B7/DTn5f4iJhEcor
NUn+VufYWaK5/jkiysEjqStl2D866k18mhGaeVAAOEZkHzS0aXx8W1+BJbxX0e9r
qUATAhE//lnmAkxghIHIvGdfN5NNgIL+/fQf1a9copNFhZ8Qm9upcn19evGLp/jz
Zxmyd/nM2WJAFVtaje6q3FfWQHDvZcX+jfLCK85sc+lVDF1WeJ/JvwoS8XC9kUrY
FLgxtIVdVvRWz3Ox6hdkhRQRCBrAMib8S6ZG4xkJzaXwBs0h6XROjNDLV215hzcR
L6KnEIre0Umon/dS4QeBsV8xQibPWABR5QNJYS+GMUBlX42DpdAqViVuMSjHkws0
iTqlBzvFw08f6S6xl13G
=XPbl
-----END PGP SIGNATURE-----

--=-pur4FWHNv/2Y+oPu+0fd--
