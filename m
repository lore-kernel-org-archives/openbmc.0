Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vGpDr54T7zDqBW
 for <openbmc@lists.ozlabs.org>; Mon,  6 Feb 2017 11:26:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="asobPCT6"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="jk9cqtQu"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A27DA20909;
 Sun,  5 Feb 2017 19:26:33 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Sun, 05 Feb 2017 19:26:33 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=UjaA05HTWARWBKpZwDdpUlaiHdU=; b=asobPC
 T6XOYwQ23CtLvuIN14cnlsJ8IAZJgbrWeTxoR7nmcDlGnFrQBPgFjj+u1gBeZmDM
 i1/5nyf3VJSJHEVbBBB7pnE1kvPglV/cI9nBnNhjRJ7j1Gm8gxE1gQf6yYdo2zna
 Kq3dtCM6j9vxypEvlMekaGL7KlFgsIcazy+ec=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=UjaA05HTWARWBK
 pZwDdpUlaiHdU=; b=jk9cqtQuHmYYgYazaf+dVI9PyMdAdQK4iOy5Fm8ZHP4ONe
 0VMuvj2XKRoi+X1txVt0MX810QsZXNGjQlRplrxLtYAIwNWraILz9isbY87H0oW4
 S29qZSTni4RJYKqbVF6W6Ucp72eTmi2+xQQprQZ2mr65KAqKXzOkrcb/VHytI=
X-ME-Sender: <xms:ucKXWEa4KlZZAuY7EaKr-GHjjNfJ9WEmwwfaGzRlvsQNexOJFgZ-NQ>
X-Sasl-enc: SrSrnjYnlnb/72KPcFY3UddH5WEHa3D1Zq/2cPvAuiia 1486340792
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id EB1817E30E;
 Sun,  5 Feb 2017 19:26:31 -0500 (EST)
Message-ID: <1486340788.7271.15.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.7] ARM: dts: aspeed: witherspoon: Add
 fsi-master GPIO bindings
From: Andrew Jeffery <andrew@aj.id.au>
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>, joel@jms.id.au
Cc: openbmc@lists.ozlabs.org
Date: Mon, 06 Feb 2017 10:56:28 +1030
In-Reply-To: <20170203224408.94384-1-cbostic@linux.vnet.ibm.com>
References: <20170203224408.94384-1-cbostic@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-LLSgUb+ZNVEps1CYg2kD"
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
X-List-Received-Date: Mon, 06 Feb 2017 00:26:37 -0000


--=-LLSgUb+ZNVEps1CYg2kD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-02-03 at 16:44 -0600, Christopher Bostic wrote:
> Define the pins used on Witherspoon by the FSI GPIO master.
>=20
> > Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> ---
> =C2=A0arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 12 ++++++++++++
> =C2=A01 file changed, 12 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/=
boot/dts/aspeed-bmc-opp-witherspoon.dts
> index 6064afa..4b2d8aa 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -46,6 +46,18 @@
> > =C2=A0			gpios =3D <&gpio ASPEED_GPIO(N, 3) GPIO_ACTIVE_LOW>;
> > =C2=A0		};
> > =C2=A0	};
> +
> > +	fsi-master {
> +		compatible =3D "ibm,fsi-master", "ibm,fsi-master-gpio";

I think these compatibles should be the other way around if we
generalise [1] to device compatible strings:

    The 'compatible' property contains a sorted list of strings starting
    with the exact name of the machine, followed by an optional list of
    boards it is compatible with sorted from most compatible to least.  For
    example, the root compatible properties for the TI BeagleBoard and its
    successor, the BeagleBoard xM board might look like, respectively:

    	    compatible =3D "ti,omap3-beagleboard", "ti,omap3450", "ti,omap3";
    	    compatible =3D "ti,omap3-beagleboard-xm", "ti,omap3450", "ti,omap3=
";

[1] https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/devicetree/usage-model.txt#n116

> +
> +		status =3D "disabled";

This is disabled because we need to improve userspace support?

> +
> > +		clock-gpios =3D <&gpio ASPEED_GPIO(AA, 0) GPIO_ACTIVE_HIGH>;
> > +		data-gpios =3D <&gpio ASPEED_GPIO(E, 0) GPIO_ACTIVE_HIGH>;
> > +		mux-gpios =3D <&gpio ASPEED_GPIO(A, 6) GPIO_ACTIVE_HIGH>;
> > +		enable-gpios =3D <&gpio ASPEED_GPIO(D, 0) GPIO_ACTIVE_HIGH>;
> > +		trans-gpios =3D <&gpio ASPEED_GPIO(R, 2) GPIO_ACTIVE_HIGH>;
> +	};

These look fine to me.

Andrew

> =C2=A0};
> =C2=A0
> =C2=A0&fmc {
--=-LLSgUb+ZNVEps1CYg2kD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYl8K0AAoJEJ0dnzgO5LT5ysYP/io33qM/PXU0xBwWqDpRO0Ti
VSHiQW1Gsnw4y/hzMkeZwai/ZZ/OruXwuot5iPUHjnN/snLe/RqGo6JGfwqPWuI1
19evxVIVBr/GVCz4861s4grdyUBUV+KK+7YZzEHxquKipK26hqY/zi1zw4oEb9Zh
p6TpcZRKojqKVoxCW/hSQrBAk/FvRBtQXQwlK2CvL/twCHEsuE2rVVTlSo1k9sVF
0fc5AqXoG+4y8pCsxinC796mP4wNbYuWhRpWSAZPUKJINzv/8rnD8lEtNvs1p6iI
EeVZxAFfsOue1XeKWMzh1uVAF8YJk+aPtEuuvLhaR54qLO+4kH3wuP0U/au8zYHt
U1QLZgyoagk+jyMb+RpovK224Vrv4gRlMZOsesG7/RAp+OD03OMZ59Y2f5hvWzIH
r9xOqieIrFhzPqli73U/83j6xP4mlhprHbNoYTRmd2y6+G2kjupKet4GzsggN5Ih
3vJMooNCnfodB+DnbPG6XbCoCsBPRQACjXGPcXOIoUqXqUYo0Ytm2Hg/idkX19E9
Z65/057KB/Q0BY3209RFrlgsguIIlcW8hIC0wFfmJ5OGsdpE5ocpYOGGllUlk+5W
NN6w7r10h/XPTmWxIfQv22B+0VG7qit0t8eoNEvjfBPO/rR1CeJS7hLVlZFfyieO
GZp+Gz3jSdO4/KLuxEBC
=Ie5U
-----END PGP SIGNATURE-----

--=-LLSgUb+ZNVEps1CYg2kD--
