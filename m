Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xW6mV2CbgzDqFw
 for <openbmc@lists.ozlabs.org>; Mon, 14 Aug 2017 17:33:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="CI1lOd8v"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="YAnah6Kw"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id BB72C20D31;
 Mon, 14 Aug 2017 03:33:43 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Mon, 14 Aug 2017 03:33:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=jFDhW81+rj4M6Dc7UA1BzqWvkPAH2K6YoqrN9c6Fh
 Fk=; b=CI1lOd8vBZxmFLQZM7IRdCTe2S9ADhKYkchlNsYckwLbcnRS9LLWOWYFe
 perZ6OIa5to1ti6L1wXwLF50JxayWjFuMRzui/HIGdaSWyQVq1zM7JUZvEga5x5A
 hAl0WZ1A04NIFguWHkzgwel8fl3Z+ee+9ADOqCOlSq3bb2x48/KzmnbwcKuFaKXU
 E0xfEsmFmLGKlluAfWDqvcbQhlIlpruOVnwppvQX3YDoFjFp5ZUcpo9uaILe7/ln
 70n3ng3ApHlRT4yHk6C35/t+wInIm/Xs4LwsOD9Kvuja1TF7XAEbThqN/ki7UjcH
 GCwjgL3x6KW4+sTXB90y4plFRIBpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=jFDhW81+rj4M6Dc7UA
 1BzqWvkPAH2K6YoqrN9c6FhFk=; b=YAnah6KwDERe8incj4ljhKrunQf61H+SFm
 uJACuGtTU0AAhCxmQ3A9H2esS+NqC3iRlXM9t8+2SguJyK82nHx1sl73MzeM7Dso
 FTo9yZ8FsOdF0bhSucx93QY58d7fdIQb6nSDaqbSCKj5u6u59fibpHF5woy/mTR1
 i+8ABOHwIg5pUJ9uQq4O2HB++ylJPiNCuSsa4Cj5lar6YMPS1j4OgzOygk5q8EP5
 OXvOaiuUypYlqmyuaFsKGM1Pnuwishbvu/SdYBvUOxSqu6Fkt1s+saJygN/vQqdS
 Gp+yNyr3el8/FGe1lj3g6RzDt4EkcSzt9uk+TJddKdVdn5MCA72g==
X-ME-Sender: <xms:V1KRWbEqejJaMQhQqtxWaV9Fxu9S5OUjus7PrGkzhqQ1W0ot6TAGNA>
X-Sasl-enc: NxWXcgTgO5liw76MDHWM2QJ6OWIAEtRk87iHv5bLUVQ6 1502696022
Received: from keelia (ppp118-210-176-216.bras2.adl6.internode.on.net
 [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id A6051240B1;
 Mon, 14 Aug 2017 03:33:41 -0400 (EDT)
Message-ID: <1502696018.14932.20.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v5 1/4] dt-bindings: i2c: Document the
 IBM CCF power supply version 1
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>, bjwyman@gmail.com
Date: Mon, 14 Aug 2017 17:03:38 +0930
In-Reply-To: <1502474205-1557-2-git-send-email-eajames@linux.vnet.ibm.com>
References: <1502474205-1557-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1502474205-1557-2-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-KucG5YVOPciyZ/y2p3q0"
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
X-List-Received-Date: Mon, 14 Aug 2017 07:33:47 -0000


--=-KucG5YVOPciyZ/y2p3q0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-08-11 at 12:56 -0500, Eddie James wrote:
> > From: "Edward A. James" <eajames@us.ibm.com>
>=C2=A0
> > Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
> =C2=A0.../devicetree/bindings/i2c/ibm,cffps1.txt=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 21
+++++++++++++++++++++
> =C2=A01 file changed, 21 insertions(+)
> =C2=A0create mode 100644
Documentation/devicetree/bindings/i2c/ibm,cffps1.txt
>=C2=A0
> diff --git a/Documentation/devicetree/bindings/i2c/ibm,cffps1.txt
b/Documentation/devicetree/bindings/i2c/ibm,cffps1.txt
> new file mode 100644
> index 0000000..f68a0a6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/ibm,cffps1.txt
> @@ -0,0 +1,21 @@
> +Device-tree bindings for IBM Common Form Factor Power Supply Version
1
> +------------------------------------------------------------------
----
> +
> +Required properties:
> + - compatible =3D "ibm,cffps1";
> > + - reg =3D < I2C bus address >;		: Address of the
power supply on the
> > +					=C2=A0=C2=A0I2C bus.

Should we define properties for these registers?

* OPERATION
* ON_OFF_CONFIG
* SYS_CONFIG

Cheers,

Andrew

> +
> +Example:
> +
> > +=C2=A0=C2=A0=C2=A0=C2=A0i2c-bus@100 {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0#address-cells =3D <1>;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0#size-cells =3D <0>;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0#interrupt-cells =3D <1>=
;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0< more properties >
> +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0power-supply@68 {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
compatible =3D "ibm,cffps1";
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
reg =3D <0x68>;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0};
> +=C2=A0=C2=A0=C2=A0=C2=A0};
--=-KucG5YVOPciyZ/y2p3q0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZkVJSAAoJEJ0dnzgO5LT5sKwP/0s/BDLJr+O32qj+iqk/1y9x
hjhDBdNj8k7mUW0XqDLaNtdBTllQobVXgoyE/1WWffWVVKMQkl2XUpisev8iXNLl
ymJRWpO4Ha4OjWLkPJCCr40YVLY/w925CiAPMcVGU6X4CMA9DYw+f6ewAuBFBkQy
W/QzVhuoDRLHC+3/QXuxlRXSilPmlDDYqcszV08PysKb7tpg2s7Fy3pxByJ1Koyc
Tq0LeBf6NJ4L2LUUVmByVLt3YjPJa4SprOJt/zQUD7OQCnNyOTFZOypxVtYz29nL
s1iYn8ARtfB7V0OXPiP+8/mTOkkvcjRdV7E3QTraJI75928Gzs7Xc5xN9o4CgSZ8
8bjtuavrQh/eonA1ZxkarqV9cA7lI67CgEaIVc+U/wMS+IH1vuplsrx7ZIcP2JRb
0NyiMRvyIFbrS591oPuAWa67noyERd93ytYi1Qlnc93YFRORgMdVNDwUKS9lSG14
EmrVVUDpNWNwu74q2ZhyGcOafvNRFsCkhp08iqOvq2c9VSCW/3sJ3qm+vaDy8bDy
DVRHwS724sYLRrRwSBvXHMrQTrlwMrAkceChmJtxjPeqlFQBXUjjY+t22USX9jA3
cUsphwkfEJNfmxs7bMLq/MRobj6BLITePlJP8FEz+zBFcZeeCNzmEMJILNIudBSI
pSGRdJREOiqptKJ7KTbZ
=y903
-----END PGP SIGNATURE-----

--=-KucG5YVOPciyZ/y2p3q0--
