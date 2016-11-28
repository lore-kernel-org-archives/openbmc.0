Return-Path: <andrew@aj.id.au>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tRqlZ5SCkzDvjt
 for <openbmc@lists.ozlabs.org>; Mon, 28 Nov 2016 13:05:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="A7j4HL8N"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="nbgTCV3K"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id AE87720DC4;
 Sun, 27 Nov 2016 21:05:44 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Sun, 27 Nov 2016 21:05:44 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=z5lo7lR40p1bUPUFmxXRsmz8E4A=; b=A7j4HL
 8Nysh2PXp3qwajAx+T2SkJc5IHCmAtnGdj8LU3ylhqffAOqGdadKuj61xZvAlNXp
 VzApQn7bgECYQFShqB+gK6mgrqhurOpaK0UnGYosClRSh/NA6QB0wr/LuuIw2wBM
 O+6toQBSGbrLum1vZkDWRvSHacwa559tdF528=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=z5lo7lR40p1bUP
 UFmxXRsmz8E4A=; b=nbgTCV3KAaZF3vzUCYa8enAYD4ZPt6REx2sAQSFpftMD/m
 jLlCZJSfrIBCwzPhK70FRsveg8U2HB85K+0OazgtIAY6Wch0jy6Ukk7Pn5ehB2li
 lv5vDHRn3entktXBEiHIaxfgdAoxP7kqHx0cyN/4VGCFhTNMsdmFQDvnyQ/qk=
X-ME-Sender: <xms:-JA7WFg_59L0ji6AW8H8EEYGM3b4YiKlRk5syTfho6qtMVdWtA0s9g>
X-Sasl-enc: exajfHwf4e5HVlZuVIQ2yt+jMPMdkbkZPrfnqf8GcRSS 1480298743
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5CAF62413E;
 Sun, 27 Nov 2016 21:05:42 -0500 (EST)
Message-ID: <1480298737.2503.72.camel@aj.id.au>
Subject: Re: [PATCH qemu 29/38] aspeed: add a rtc device on I2C bus 0
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, 
 openbmc@lists.ozlabs.org
Date: Mon, 28 Nov 2016 12:35:37 +1030
In-Reply-To: <1479478938-13267-30-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-30-git-send-email-clg@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-5Mc7B1DW9WSbsGp+eOx7"
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
X-List-Received-Date: Mon, 28 Nov 2016 02:05:47 -0000


--=-5Mc7B1DW9WSbsGp+eOx7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2016-11-18 at 15:22 +0100, C=C3=A9dric Le Goater wrote:
> The palmetto platform has a ds3231 RTC device but not qemu. Let's use
> a ds1338 instead which provides enough basic RTC features. Only alarms
> will be missing
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0hw/arm/aspeed_soc.c | 4 ++++
> =C2=A01 file changed, 4 insertions(+)
>=20
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index 2aa15d90cc31..d2bc0ba2070d 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -276,6 +276,10 @@ static void aspeed_soc_realize(DeviceState *dev, Err=
or **errp)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0object_property_set_int(OBJECT(dev), 20000,=
 "temperature2", &err);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0object_property_set_int(OBJECT(dev), 110000=
, "temperature3", &err);
> =C2=A0
> +=C2=A0=C2=A0=C2=A0=C2=A0/* The palmetto platform expects a ds3231 RTC bu=
t a ds1338 is
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* enough to provide basic RTC features. Al=
arms will be missing */
> +=C2=A0=C2=A0=C2=A0=C2=A0i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&s->i=
2c), 0), "ds1338", 0x68);
> +
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* FMC */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0fmc_num_cs =3D aspeed_fmc_get_cs(s, &err);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (err) {
--=-5Mc7B1DW9WSbsGp+eOx7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYO5DyAAoJEJ0dnzgO5LT5uuQQALSe4354NhKqIQ9BfyOwNT8X
VcgBtM1QLZRX3wl+Uapw4vOYy10mQ6rxtOnQscwLQOuM7DnzGNvCFVVIxP7Hc+dI
L1OkuKYyyzTu2mrqSmx+2JsojhImp33NMYJXBe+DnHwPY2AEkwFyxS4q6pgqAJQC
eUG5jFTYpX7YAIxlszxWGHIabb0GBmh6NcL0l0hndPZCFQ9IAS/KsXjJEa77gm/A
ORnp1LakEuMBzXpgifNX0a0uCJyLr5dso6nWSZizBnjroRWYREgTojjhewvGkcfE
gWBlAojR2Iv7s++UhdwhkCsiwlJoGwdPQeHQXxCPV6iWfWx2t2nvlmlu5Z9w6n4/
V1o5x/fSEuoAokI6zm78owm/cZzvDqx54DdwQOd4AOzeXS1lusL3D/njlCC/VjoV
D3dKtsd1MmmK9OULVr9ZMQjz/EWEL8AOlB0UtZuUZnesdTNJ0fk2VtBUzfYsJcmz
++dJuD2SwrAVcXBuICbhTDlPku8haTK0LBEh5C/n5Ds2lN24bAu3WJ99WkifMhxx
lViUOYIwClaZJvJ+Y24StdPDaaESIk9Dr3Z/UawUYajy5qKhfSbYL/obracPp0cq
aU9Tj7dRY9O5uN6YfJG/6xV2nUZQ28q99lpN3DgY3Hm1SCvzLMtcA1bQBe9283Om
2ns0fCpDdAEGMU9veSdh
=r9rU
-----END PGP SIGNATURE-----

--=-5Mc7B1DW9WSbsGp+eOx7--
