Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xbsZM2xmmzDqhL
 for <openbmc@lists.ozlabs.org>; Tue, 22 Aug 2017 10:56:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="b7Xp2FuH"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ZKL4m0LR"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3718021B39;
 Mon, 21 Aug 2017 20:56:25 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 21 Aug 2017 20:56:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=KaZOZoxi7X07sDkdAdvaANlFX8g90RAIxdEmqjsSi
 4Q=; b=b7Xp2FuHO4cHYSncNaWAfdFI+xZjRDNEqZYMNDsA2/Ov+e064rOi0zGuw
 WnG+ssOW0S1juZgwdCO8mY2AGXWvjvp5YyBruOpLh/2ulL8t7Qs5cjQ+lA74CZ6j
 FW8+hOrjQIIBrkHYJmaLcmdqUfFflt2tZcNUeKJcy84zZbbmJAHSYJg9jD5V4prp
 Jo057VLKoexUuGajY+Pe6zOtRP5ndl7agBpyxo1DgFXu1qs//BocciuUgE2apYvo
 wNSl0izcz0UqXjARX/kOCnj1304s+RbcSRqhgCaX7DZJZcN9stgj8Y0oirV7cVjy
 akRW4hym03GewjMl/U+eQThWFcShw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=KaZOZoxi7X07sDkdAd
 vaANlFX8g90RAIxdEmqjsSi4Q=; b=ZKL4m0LRs5NKIRy0P/IP9hcVAo/vmMYY6+
 HFu6JwymZHEAaYn21vE4hcV6DGhDFscuFJ8dI+DGN2MTaiMmaV0dBpjLoAOMCLq7
 dRbaeI8a/NchVrW/VYdNC9MHeuTIjjUF9KOJOu2O2Nv5QBKgMuM/tgbb47GAvtTf
 WmPR1YyFX52UDmh9qeO+vNG3t3FAMqyHJL8Vs9D1lYSdn9H+SEgJlbM6/WRnGCHy
 gwHb8SjA59pespHZvt6zO1hRg46klHH8UDRz/nOKxNNnk3yz7lwTqkI4lUoYkSVk
 jUDkZfoFjtjRktDgtc8PBumIHdNmz6nE7ZcfwsCwEQ5+E35FHOFg==
X-ME-Sender: <xms:OYGbWTfXU2G7-h58tW8gqfo3EB30F4mahWqtcdomWSP4-QGETJS3rg>
X-Sasl-enc: 1dp/iXp467LulAKTUJkqQTB+LvJTqcB97EHoHW8ieVKV 1503363384
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id B58077F988;
 Mon, 21 Aug 2017 20:56:23 -0400 (EDT)
Message-ID: <1503363377.7266.9.camel@aj.id.au>
Subject: Re: BMC chip
From: Andrew Jeffery <andrew@aj.id.au>
To: sachin naik <sacnaik@gmail.com>, openbmc@lists.ozlabs.org
Date: Tue, 22 Aug 2017 10:26:17 +0930
In-Reply-To: <CALFfRJOvnOYdj72UfMhFQoF9CH8nZKTYQuxQNEYd7VoSENw_MQ@mail.gmail.com>
References: <CALFfRJOvnOYdj72UfMhFQoF9CH8nZKTYQuxQNEYd7VoSENw_MQ@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-0VYwd1DXGXVMFGISB1PE"
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
X-List-Received-Date: Tue, 22 Aug 2017 00:56:28 -0000


--=-0VYwd1DXGXVMFGISB1PE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sachin,

On Mon, 2017-08-21 at 12:06 -0700, sachin naik wrote:
> Hi All
>=20
> Other than Aspeed what other BMC chip is supported by openBMC?

Currently only Aspeed BMC chips are supported, mainly because the
parties active in the community make heavy use of them. However from a
open-source project standpoint we're happy to help/provide feedback
with enablement on any BMC chip.

Cheers,

Andrew

>=20
> Thanks and regards
> Sachin
--=-0VYwd1DXGXVMFGISB1PE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZm4ExAAoJEJ0dnzgO5LT5RskP+wZhqjTpzodEOsNtbtP/dFXp
TXc4e+iAqy/HNS5T0FlBy1B+ScRkyHiZMKGL9ZQqQRZ1m0/DGgvTjt2azZPEs57v
JcyR/+v/0+hUdnaqvcuiql2f5TSfKt8crXVRxb2EVcQYY53VylUUVeL/dCjIiMDj
irjY7Q9CcpfTwTYehRo27U1SGJvLu20HFpqJZkITy/a+a9WL/WwgrjvRsGelOp+0
jL6gMTy7ABpzqT3BiQoM8p9mj3X5S7S4LeWbYhqP6vlm7uxMrJBKrk+UQbYdSjKh
y4he1cx38NrZI1bSTkMtQn1Zrr3IuX0ZZ14RbYHknLjK2HO1O/rB1sREb7XOBAwj
cv7fH+1hb9V7vacIvN2fV2DvqTTxTXLgplpsQRfFTP7sOjaL/Fq8NK91kM2KUQiq
gM2rtzZYTxiqYZFM5jFCRluMzu2rUVSgZy/thUuVPrdB75dqggF2e/OVNk41u0TU
leOS+ETrU99TJ4yg2QBHvu+I2Yk2kKbW1Fvet4XRmSL+Vnvl6HgDXzOFgxueDjpP
CTVZujLZNmWWswd4QpAd6Ks9LgaRoNo/szAH6ydfUlMigyDOwLH7YO2B1igq1e7x
qmOcf1raB2neaAVtItL4PJcU25DN6ygYd6ESXiQOfmbOzxM5HV2j3Gkb9ZncjCjR
6ZWzKBBAK56Pp28muIaH
=klxd
-----END PGP SIGNATURE-----

--=-0VYwd1DXGXVMFGISB1PE--
