Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xcf592tjQzDrCf
 for <openbmc@lists.ozlabs.org>; Wed, 23 Aug 2017 17:22:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="mGZ6dCzB"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="TPQe1tO6"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 2F8AE2140A;
 Wed, 23 Aug 2017 03:22:18 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Wed, 23 Aug 2017 03:22:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=JY1jU/Nj0YCkDmniVQWo9I+/I3zCX9YFZmfNBgZei
 D0=; b=mGZ6dCzBxjtZos1+74xGws2ICi5CS88MZdyAuPOFWw3scaRse8uFqSh9L
 al2ACaCVENZgoWPMio0y50ga/BJwmRiUHlQYynHTOvttJ8WLsmquCf0Unw/E8Tqr
 M/JAaEJkThQPHfB+fhICVuR+G4Hmw3f4VQvr/K39bbjL/doLn9sqnp6IHSaRgm20
 oM9zmpx05i7meJMLX7wARBcZEAMyiveS0V+l98PpvRMXRMTkOHUaOdTTdEGErBec
 Uct5/K3uFE/ETTBX1/4ObLlwkitnUGlFUSPolY5fFBA6aRdKducPBMtgi7Tg+sY3
 rcQAN+X09/gLhIl8OsZRjw2x/YAYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=JY1jU/Nj0YCkDmniVQ
 Wo9I+/I3zCX9YFZmfNBgZeiD0=; b=TPQe1tO6Y0z+Y6cCPW7UBa9UGJkb1NOAgr
 7pApNC5h4lfRuNEPBN2Kha6PLzyzGhZ31JqvJgHTVzGW5bCqAb/Df0wK9eSKhCn1
 67YWziPn+hlRq5lO9biIif/w21W3EbjW32lyglT5p283lYyQbQsFGPLqkjq1TcW4
 wpqIYH46vQp6+fOngPffa88N1Bv8ZBvdlrANDscCKCrwXQWZYtAGjKegEaE9dIY5
 vHO5gpX7m8OXUu2PjSEEPOGLN6geeNJCkWDQx1U7dHe8CJd8YWeQGWchdhEunIQp
 TxALeFyFsN7465Iyzg2YyhEtoVFYSz3KKkqDiKRklnz80hi4zGwg==
X-ME-Sender: <xms:Ki2dWQb8deS8t2NrAAuNIWq0iJ1DiRh_x9fwYeYaRcSjZsqGhV8YMA>
X-Sasl-enc: aDQ4uhTKmctcC7qs/8/L/KSFh/XSZ1l1zL9YlvroOniz 1503472937
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 549122459C;
 Wed, 23 Aug 2017 03:22:16 -0400 (EDT)
Message-ID: <1503472932.7266.36.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10] hwmon: (occ): Return power readings in
 micro-Watts
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>
Date: Wed, 23 Aug 2017 16:52:12 +0930
In-Reply-To: <1502744797-27565-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1502744797-27565-1-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-OwC66E+0hhg/Hb5QZNml"
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
X-List-Received-Date: Wed, 23 Aug 2017 07:22:22 -0000


--=-OwC66E+0hhg/Hb5QZNml
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2017-08-14 at 16:06 -0500, Eddie James wrote:
> > From: "Edward A. James" <eajames@us.ibm.com>
>=20
> hwmon expects -6 exponent.
>=20
> Signed-off-by: Edward A. James <eajames@us.ibm.com>

Thanks, applied to dev-4.10.

Andrew

> ---
> =C2=A0drivers/hwmon/occ/common.c | 12 ++++++------
> =C2=A01 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
> index 3f63467..34002fb 100644
> --- a/drivers/hwmon/occ/common.c
> +++ b/drivers/hwmon/occ/common.c
> @@ -470,7 +470,7 @@ static ssize_t occ_show_power_1(struct device *dev,
> > =C2=A0		val =3D get_unaligned_be32(&power->accumulator);
> > =C2=A0		break;
> > =C2=A0	case 3:
> > -		val =3D get_unaligned_be16(&power->value);
> > +		val =3D get_unaligned_be16(&power->value) * 1000000;
> > =C2=A0		break;
> > =C2=A0	}
> =C2=A0
> @@ -504,7 +504,7 @@ static ssize_t occ_show_power_2(struct device *dev,
> > =C2=A0		val =3D get_unaligned_be64(&power->accumulator);
> > =C2=A0		break;
> > =C2=A0	case 3:
> > -		val =3D get_unaligned_be16(&power->value);
> > +		val =3D get_unaligned_be16(&power->value) * 1000000;
> > =C2=A0		break;
> > =C2=A0	case 4:
> > =C2=A0		val =3D power->function_id;
> @@ -541,7 +541,7 @@ static ssize_t occ_show_power_a0(struct device *dev,
> > =C2=A0		val =3D get_unaligned_be16(&power->system.update_time);
> > =C2=A0		break;
> > =C2=A0	case 2:
> > -		val =3D get_unaligned_be16(&power->system.value);
> > +		val =3D get_unaligned_be16(&power->system.value) * 1000000;
> > =C2=A0		break;
> > =C2=A0	case 3:
> > =C2=A0		val =3D get_unaligned_be32(&power->system.update_tag);
> @@ -553,7 +553,7 @@ static ssize_t occ_show_power_a0(struct device *dev,
> > =C2=A0		val =3D get_unaligned_be16(&power->proc.update_time);
> > =C2=A0		break;
> > =C2=A0	case 6:
> > -		val =3D get_unaligned_be16(&power->proc.value);
> > +		val =3D get_unaligned_be16(&power->proc.value) * 1000000;
> > =C2=A0		break;
> > =C2=A0	case 7:
> > =C2=A0		val =3D get_unaligned_be32(&power->proc.update_tag);
> @@ -562,7 +562,7 @@ static ssize_t occ_show_power_a0(struct device *dev,
> > =C2=A0		val =3D get_unaligned_be64(&power->proc.accumulator);
> > =C2=A0		break;
> > =C2=A0	case 9:
> > -		val =3D get_unaligned_be16(&power->vdd.value);
> > +		val =3D get_unaligned_be16(&power->vdd.value) * 1000000;
> > =C2=A0		break;
> > =C2=A0	case 10:
> > =C2=A0		val =3D get_unaligned_be32(&power->vdd.update_tag);
> @@ -571,7 +571,7 @@ static ssize_t occ_show_power_a0(struct device *dev,
> > =C2=A0		val =3D get_unaligned_be64(&power->vdd.accumulator);
> > =C2=A0		break;
> > =C2=A0	case 12:
> > -		val =3D get_unaligned_be16(&power->vdn.value);
> > +		val =3D get_unaligned_be16(&power->vdn.value) * 1000000;
> > =C2=A0		break;
> > =C2=A0	case 13:
> > =C2=A0		val =3D get_unaligned_be32(&power->vdn.update_tag);
--=-OwC66E+0hhg/Hb5QZNml
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZnS0lAAoJEJ0dnzgO5LT5RUwP/1plbA7fXKgm7KwCgIoRuEsj
Kl1ckak/teorZofjkAylQ/pWXACl0/ehu1UuFLjVgViTq/JAvUwJUr6+N3d4nyl1
ls6+g15qyNaT+nD3uIFi9sD/Tkj+QWXlmFbKA+RxAB1dBOPxIHCVsGlv/maM5szb
jSa6mGyDdGAXAzNCtRMJXf8pjPNcd9nj5mRrRJwkdV8wrBWphd7eD+kBO5oUBfNl
A7aM2ZE7Rl9ZFTCY7hm5rG5NQWKxuDSgxht988MhRUY71g407+uHysiSt03WN0N8
xXfJDuxOYO29dcM0OKVDO2m0T/K1CECzD54NcgYjSV2otnDijH0fdMQaWnxiFLmY
7cVFf6QveAekpGHvYSNOP+UyYgebzzEZo+VJg7yGfpGLcLqVgPd2/Go+a/i13IRE
2q46d04bnkhyho2VzZ4ohd9RQdMfcpRs2PC1O11eghqTaHAt3b7a0U0K/0d9cSdh
zOXZILYhjdoJIMzoTx2Pt7QKSUpXcNZfJO5B1YdVW+ZL59wbmFhiCz7kSB3PRD4d
xO6STAQ7ow5lFHue7YVPTBq0d2Cj82Cb5ghyqwKHb/0D3YQw1THtxPlAEfF+eonQ
qzRpSkMbi7kihq/99w0qapt7dlqkNu6gIRq+KzxU4Pgo39T6WDyUg+mNG5NRludg
0wBhRdTocICEtRtbIbr1
=hjRo
-----END PGP SIGNATURE-----

--=-OwC66E+0hhg/Hb5QZNml--
