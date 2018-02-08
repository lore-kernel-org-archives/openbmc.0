Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="St/MiHFC"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="JYl7Pu9O"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zcVZf5fx5zF13y
 for <openbmc@lists.ozlabs.org>; Thu,  8 Feb 2018 18:44:25 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0423120C79;
 Thu,  8 Feb 2018 02:44:18 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 08 Feb 2018 02:44:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=bQ+H1xaY1Slve7855hyBuCrg+uO2NDsQYeKYW99NLQ4=; b=St/MiHFC
 9LWSjqL7eGVRtjTcTlZ6cNwJDtmXy5h1EYhYSjF6k0e1kDCKVw2jS1K0pYNw2v4T
 qGAUpX8p5I06MzfE+153vVLmT1roj10axJKd0sR8iBCXcXFEUyiKVMXmPfHa4Evo
 uMcSFMghQMXOtKyD8N+tbtxS+dzi7LH/Dg/Na0JR1LHiruoEPGcEb75J51sZPntV
 2rrJSPCWfpxVA3/9t/fA7L0Afz8DjYaVlI6/iHinAciBrTdWjCRbZdaS+cFi8w7A
 Fy9WlH1HjB4AFIuvKFvowclY7fSQTbM5Th6co4W0FX1NqnuZf2CUe7WsUv3K9g09
 +kId3tkq7to0Eg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=bQ+H1xaY1Slve7855hyBuCrg+uO2N
 DsQYeKYW99NLQ4=; b=JYl7Pu9OStU/qpF5jV6pezJeTzAvNK1WlicntdIq0juwP
 dQMs38yRdmLYFU2soqeZzexqff4gqEFfvXqi+FcAgCIODqILc9mT1SjkHYrujWh9
 t+EpNDfqC3qEXX9KRN+Aq5pJZV73Cmq1sFeYV12ugTekceXhIn1kR3P8IhhMkdcQ
 9eGBIqxeW6ObtnvpeCxA/vxGhrkEBcE/zIcgGsCp5lNR03kJVsfknpW+IPsqdo1b
 nGsJNUxGKK4l5QxzZmukPvXdUBx6BR8URsWO9eAZahBA7jZvKTPzb7h29ennnuBz
 5ZywijOZ4K2M24fdFp6JlLJWMIpWaU0Czu6DTgT1A==
X-ME-Sender: <xms:0v97Ws7Z8xgnDxjpaTrM28oDeAK_gy8OGMNTUH5StTUUdcbmYN_Bmw>
Received: from dave (ppp118-210-154-2.bras1.adl6.internode.on.net
 [118.210.154.2])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8D9317E570;
 Thu,  8 Feb 2018 02:44:16 -0500 (EST)
Message-ID: <1518075851.14456.2.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.13 1/3] ARM: dts: aspeed: Add LPC clock
 phandles
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
Cc: Lei YU <mine260309@gmail.com>, Cyril Bur <cyrilbur@gmail.com>
Date: Thu, 08 Feb 2018 18:14:11 +1030
In-Reply-To: <20180208053745.31254-2-joel@jms.id.au>
References: <20180208053745.31254-1-joel@jms.id.au>
 <20180208053745.31254-2-joel@jms.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-hmpktTQXg46SiLYmYiZK"
X-Mailer: Evolution 3.26.1-1 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Feb 2018 07:44:29 -0000


--=-hmpktTQXg46SiLYmYiZK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2018-02-08 at 16:07 +1030, Joel Stanley wrote:
> The LPC device uses LCLK.
>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

Obviously we need to modify the bindings docs and send it all upstream
(and deal with the "You're breaking the bindings" / "They were always
broken" fallout).

> ---
>  arch/arm/boot/dts/aspeed-g4.dtsi | 1 +
>  arch/arm/boot/dts/aspeed-g5.dtsi | 1 +
>  2 files changed, 2 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-=
g4.dtsi
> index 1fb5b410917a..d697380f2f39 100644
> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> @@ -233,6 +233,7 @@
>  					lpc_ctrl: lpc-ctrl@0 {
>  						compatible =3D "aspeed,ast2400-lpc-ctrl";
>  						reg =3D <0x0 0x80>;
> +						clocks =3D <&syscon ASPEED_CLK_GATE_LCLK>;
>  						status =3D "disabled";
>  					};
> =20
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-=
g5.dtsi
> index 77d6d98d24a0..89ef960c4ef3 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -283,6 +283,7 @@
>  					lpc_ctrl: lpc-ctrl@0 {
>  						compatible =3D "aspeed,ast2500-lpc-ctrl";
>  						reg =3D <0x0 0x80>;
> +						clocks =3D <&syscon ASPEED_CLK_GATE_LCLK>;
>  						status =3D "disabled";
>  					};
> =20
--=-hmpktTQXg46SiLYmYiZK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJae//LAAoJEJ0dnzgO5LT56PUP/jxwBUo7zJgtCbuHGnMykiYc
xz78beMyYsSDefg3SJAX5DkO0Q/Ze4g8+Hl0N2R3l9g/5jX0loPl+wEvCA7GrZv8
hQIC7kSvXRLFd4LNItm7155+sfxCplBz9mNLJZdjHuMdw02aw26osRZ92OhVpiEn
IeM7OBkd4/7p/JMyVpiL2ELA3uA8OUq2NzhS5ew1BYbOoRGdEsslRiYDaUHeyrYm
H0vOkoeeG8L85Tz3ZI2ouiFZkaVoPrpAd7zr+0zCdQkBtvtWgiQgbmGsrmvaeGUb
ENVYQNKVWNFzXT8ZNh2YsiE2k73U2cugeF0zs3HuYz9npe8rakOJTY4dd4YC5d5+
vl/fP1+Al9ZeJ0TdhV3dKGceys4KoGCWs5p0aazgZ26UwNOuZN6GnBti6/K+xX/L
f4t7iws0J9nKYsOGgpYXRvqemYdeIijT2iwEWhTKzVqtQ97EL/FHr0CysFZm7jbk
uiy/EQz4rPrKKGCGawBGK5L4wWiPiz7HTQWSOsyNBnk5iviCn4Ol8pqNd+EVjHP+
4eYSXHsjp6KDNyTx4fVxaKrVEMgZQq+U+0LWtUL0o9oL46HPtyH2BDld1xFHpSwL
sivwYf+S/cBN3HxrKdKxFV9qUEgl20s9tJfdvr1gEDYD2xC9dQYKD6Kl3YAd6qJ5
kgkdyASrpqIKNYI3WWqI
=N/TJ
-----END PGP SIGNATURE-----

--=-hmpktTQXg46SiLYmYiZK--
