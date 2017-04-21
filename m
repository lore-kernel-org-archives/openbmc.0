Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w8M4H75TvzDqL2
 for <openbmc@lists.ozlabs.org>; Fri, 21 Apr 2017 13:42:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="TLU2wsN2"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="EeBxB3w9"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E693B20B3D;
 Thu, 20 Apr 2017 23:42:05 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 20 Apr 2017 23:42:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=JciinfxjJ5pmVS05cSy2BxmDHFCQLbUvaSZ+cDt3W
 80=; b=TLU2wsN2pdnLKuHE9MeZ9POzyHjKSCTwSlTUTXexa5jkyJ408S47BDYwA
 AHYmeVThHFXe9LywDH+nDYjFU1aEB9zLX4idyPof0jp1njtN71gyiqRp1Qcag2Iu
 0idVDJmwLpAcXgYlTPQLHF1mjO+ymfkDJ6hWQRHIU9ZBONvbIujaT+eEekooq012
 anFqwFkUhW4/TqTwHbBU2Gfk5D+1kugNc6/RHZjSRq6cZuLEMFu4KNTUAzg537ZH
 8vwEqO0TCdWPSOKn2gZpg4qHTS2RJTq+ocg8GOjQl4iOqRB0mOwof3Gv8KoLS1ez
 GGpTLKSq0wZnYPjSLeZqcdVyjU3lA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=JciinfxjJ5pmVS05cS
 y2BxmDHFCQLbUvaSZ+cDt3W80=; b=EeBxB3w9rkVAyJixVjjyKTqc5IgAEwUo0a
 QXbaQ5RlV7SadtuH2qw4R+VP+erMr3d1YuLzoiX4sNvRBsS7bcRedcEv+2X2hIQD
 dHUL94GC5gODFr5O5ATMYiEAZpzWSprXMT89U+ny8+cSEd3WyP3mxk3c2HXGZ0vR
 S33TEprah4OHKLq4SRt/hW3aqAAW9uZbuRP2uDqJgOjodts7oaT9ebOq5j9mIy8R
 VlVfDgLVe4LEYzOZdkewk3OTI7PccBStFoS3QV/RRZWFSjnuxRNDJ+vyxumHq3RW
 8QI9+UJxwQglKKvQJmbuKxRoHGgzTfsCPMBu51QcacFGhQ2wBgAg==
X-ME-Sender: <xms:jX_5WCU71ieGsxkWtqDubWawIckB1cikO-Hqnv_aLw-L2IIGRxHP6Q>
X-Sasl-enc: 4ghXLYGXr64LADqQTdxOBufRlYBuiXBHdJJgIrfGnN2g 1492746125
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2A78324526;
 Thu, 20 Apr 2017 23:42:03 -0400 (EDT)
Message-ID: <1492746120.4069.2.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.7 v5 2/2] ARM: dts: Enable checkstop and
 cooling gpio keys
From: Andrew Jeffery <andrew@aj.id.au>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, openbmc@lists.ozlabs.org, 
 joel@jms.id.au
Date: Fri, 21 Apr 2017 13:12:00 +0930
In-Reply-To: <1492744763-29872-3-git-send-email-bradleyb@fuzziesquirrel.com>
References: <1492744763-29872-1-git-send-email-bradleyb@fuzziesquirrel.com>
 <1492744763-29872-3-git-send-email-bradleyb@fuzziesquirrel.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-tOWnxkXX4EzNNC6SEAnZ"
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
X-List-Received-Date: Fri, 21 Apr 2017 03:42:08 -0000


--=-tOWnxkXX4EzNNC6SEAnZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-04-20 at 23:19 -0400, Brad Bishop wrote:
> Enable gpio-keys events for the checkstop and water/air cooled
> gpios for use by applications on the Witherspoon system.
>=20
> Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>

Flip flop ;)

Acked-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 16 +++++++++++++=
+++
> =C2=A01 file changed, 16 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/=
boot/dts/aspeed-bmc-opp-witherspoon.dts
> index e3a7b77..236696a 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -31,6 +31,22 @@
> > =C2=A0		};
> > =C2=A0	};
> =C2=A0
> > +	gpio-keys {
> > +		compatible =3D "gpio-keys";
> +
> > +		air-water {
> > +			label =3D "air-water";
> > +			gpios =3D <&gpio ASPEED_GPIO(B, 5) GPIO_ACTIVE_LOW>;
> > +			linux,code =3D <ASPEED_GPIO(B, 5)>;
> > +		};
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
--=-tOWnxkXX4EzNNC6SEAnZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJY+X+IAAoJEJ0dnzgO5LT5nGUP/3/FPqwRaFpMrH0FzKF80J5c
JSvpw1lr+ycdinmEnckCvuXLBEIgFTKzaP226eWfqK4pkoL0fAHZzscHoNmU+ypT
VjNADouSiVm4Bb2hj/SPHQnXWX2yngVpUqfGPzmACXSM7h3065Lz8dJL3RgL/hHs
OBkod0k1sOVZaGL/3jHbzCwCpy8khiLDlz3q17I2D7UXZ2gPetrABVlov2zXq4Lz
xIpTbK+j25oESUI3Ho4OxtqEIZt2e6dr2Gsp9QqgisYjSXZl5L1E/2op6lupGTGp
XrelO5KyU4PcyB6Vnlo5fjAid8PGb5spzsgEG8yyrFtJ+6KzJjN8kJAqD81twSXd
hLKo+gdTys9bwX+4n1AOcD4Ask25eX8g1SDcpB/2HkWoY7w1cie7HPNAljlZB8a3
mYNs8lHMF8Q4uJfjwimc0IBzLlT4s9PQ8knB9PqeczDjyYop24/qGcfcppAmAC6r
FaYp/5soBt7kguR4gFhxe4kYbaFqkFe65fKZ34t4MkGoRzd1IDioqFNtRLSOHw3Q
mz7v+3q7vm8fEOhQHAPMSkUfWUtn4Ll0sfMXH/sCKw4lOiRxYUWdy8zgChjHGZCJ
OYrb0z8ZgpjVNstNeHiF7S1CpmqdalA8ZnDel+JziMWbZTQPbCWnFFRkhbBr/ORo
lnDR97TDNjpZX+9CWghP
=/ny7
-----END PGP SIGNATURE-----

--=-tOWnxkXX4EzNNC6SEAnZ--
