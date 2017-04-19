Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w7PXx4VglzDqB7
 for <openbmc@lists.ozlabs.org>; Thu, 20 Apr 2017 00:30:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="n0gpYiAJ"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ecSZmVo4"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 6A38D20DB7;
 Wed, 19 Apr 2017 10:30:06 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Wed, 19 Apr 2017 10:30:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=ItYvah/tXSA9m2xPHyORIbEabtyhZxLAGXJcN5z2r
 c8=; b=n0gpYiAJBjl+y3pAhgd0Dik92uTwz8ErGB12/CbBneoia+n/OyHltmGZg
 o2s9r9Hf2vExxcsztth0TCKn73y4NHP6b4Hz4Yxd/ItYWVTy73/YQ41MWQ+1Ytg0
 rIuN/hs37Hn4neRzr0L6IIuQdGNh3OsCtrWUU36RB67xXz12DdCfzYO+yPygWHZx
 sQu4dQzOPFrI/VuQtRg48bRXRebXs4+oqTQ81Imo5f5PVzwZz1km1IQ6dpRTf6M1
 gifVvlzQy5Zb+cuxBQG6VuCbxc7czCw+b+8tsVAhgMlc1AnpnQrp4zOO3ZiYboK/
 +lcqMR6w8KQ1PexN6YDOMVt0LVjKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=ItYvah/tXSA9m2xPHy
 ORIbEabtyhZxLAGXJcN5z2rc8=; b=ecSZmVo4TG+gN607x/WsqBE6laS7XgeyQ2
 gqL7GGFO2Ct5kcO2I91R6IcGlDfar1tiygg5NmgWZkKxJu54cwYQHT0cqkDK2iWi
 XtovO8uXrIwTMp4rV1mzBZhdWseVitCB0IkT519tIh6NpNfF+awDHxVNBrOebaar
 zKqNcWkhKTsetMVyeOQg5e2TnYmmzaJqHuHw/fiXAESPRGWN5kbMeYdEgPMhE/zy
 yV2imW5wEAqv/9xokQ4bFgBjEP2dp4x7CV5G3T3YHAQoTMnK+Xr98LbYKSsaKTMN
 n2Nx1AuV29AB72hXakhAAajUwk0qMKKx/3rKqgVNRb1DnLqULzaA==
X-ME-Sender: <xms:bnT3WH8Qcheq7BOk8fhQmTCpCa6uLqkLV4hvDfS1aWvBtsGl97icQA>
X-Sasl-enc: bglaoufK50jWbuvIC2gqp/IaIuUAAXWSk0vWvRmFoWfP 1492612205
Received: from [172.16.172.59] (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id A444A7E15C;
 Wed, 19 Apr 2017 10:30:04 -0400 (EDT)
Message-ID: <1492612195.1011.4.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.7 v3 2/2] ARM: dts: Enable checkstop and
 cooling gpio keys
From: Andrew Jeffery <andrew@aj.id.au>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, openbmc@lists.ozlabs.org, 
 joel@jms.id.au
Date: Wed, 19 Apr 2017 23:59:55 +0930
In-Reply-To: <1492575497-1419-3-git-send-email-bradleyb@fuzziesquirrel.com>
References: <1492575497-1419-1-git-send-email-bradleyb@fuzziesquirrel.com>
 <1492575497-1419-3-git-send-email-bradleyb@fuzziesquirrel.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-zDpZ5wDr1veclJe2BDDz"
X-Mailer: Evolution 3.22.6-0ubuntu0.1 
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
X-List-Received-Date: Wed, 19 Apr 2017 14:30:11 -0000


--=-zDpZ5wDr1veclJe2BDDz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Brad,

If you do future revisions of these patches, can you please Cc me?

On Wed, 2017-04-19 at 00:18 -0400, Brad Bishop wrote:
> Enable gpio-keys events for the checkstop and water/air cooled
> gpios for use by applications on the Witherspoon system.
>=20
> > Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
> ---
> =C2=A0arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 20 +++++++++++++=
+++++++
> =C2=A01 file changed, 20 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/=
boot/dts/aspeed-bmc-opp-witherspoon.dts
> index e3a7b77..aa1708e 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -31,6 +31,26 @@
> > =C2=A0		};
> > =C2=A0	};
> =C2=A0
> +	gpio-keys@0 {

does the @0 give us a stable device name for userspace to open?

Do we really want to go this way? We now have useful unique codes for
the "key"s, why not use the one node? Or is your concern we've now tied
the function to a value that might vary across platforms? If so, are
you relying on always specifying "air-water" in @0? If you are, I think
I'd prefer the arbitrary codes, rather than this.

Andrew

> +		compatible =3D "gpio-keys";
> +
> > +		air-water {
> > +			label =3D "air-water";
> > +			gpios =3D <&gpio ASPEED_GPIO(B, 5) GPIO_ACTIVE_LOW>;
> > +			linux,code =3D <ASPEED_GPIO(B, 5)>;
> > +		};
> > +	};
> +
> > +	gpio-keys@1 {
> > +		compatible =3D "gpio-keys";
> +
> > +		checkstop {
> > +			label =3D "checkstop";
> > +			gpios =3D <&gpio ASPEED_GPIO(J, 2) GPIO_ACTIVE_LOW>;
> > +			linux,code =3D <ASPEED_GPIO(J, 2)>;
> > +		};
> > +	};
> +
> > =C2=A0	leds {
> > =C2=A0		compatible =3D "gpio-leds";
> =C2=A0
--=-zDpZ5wDr1veclJe2BDDz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJY93RkAAoJEJ0dnzgO5LT5Z54P/Ahip+9jFs+Jg008Xfw6jxhM
iT98Gv5VZWxNRRYqMywFlpedWex85k6vuQYBslxzc4++21l4W9kNLtE0gOkl+s2u
xz01FRbrSwwpd3c1MR3BBF5PzV+skwntYl5lQjNnvPkuh7bwdgkwVRidPnGnQ4Xc
lUfk9ELChi/BSBT55QH6hA6bJgHA8h0HqsSAIZz9L74pGP6V6san4/98rC5M/Um0
2W2zTThPAiozG+g6jIKXJVRZuujGW6nplFnjPobHVz54TpxAMUBsIgE6o4pKBEEZ
R/by6WtMFFVFvEQU7Cl5pOHeKjqZZsR4tV/Pvd9Me2C5hRICcfPb19msvyKun31Q
IVHPDb3LqNMH6nnFc4tvk9jnSW3f/zUbuBeH1QlFUATOmlDRfwX5mzgVlTgYcEET
mDhqFPGg5/M6EmNc1Q0jpdf2bRX2OjIlPgvYlIr39jS/CcX3cr2PeODCidu6aMiu
fAaHPbelUr8KcXiBQEmQuO0jyHGpPe87+3rcufVVB7vRFYKY48ZMHnPlSTuZjC3x
ep8ETdYdg9BoHj4gNJDDajSkKDYR+mVPetQMaU73y8B0B1yq2Y1Z1eqyF585d+oJ
1lwxDcAEjQzkkxrHT8jE2yCTQ3+lV24/HDJEd75HtveXUho0DwvmHAS8hYZbr0t5
1zs7RfXZunXgIXy+j6Jz
=HVtS
-----END PGP SIGNATURE-----

--=-zDpZ5wDr1veclJe2BDDz--
