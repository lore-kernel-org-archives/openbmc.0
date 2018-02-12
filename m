Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="cifgfaC/"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="LjzOmiBY"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zfmC85TgLzDr8f
 for <openbmc@lists.ozlabs.org>; Mon, 12 Feb 2018 11:05:17 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 453E120B75;
 Sun, 11 Feb 2018 19:05:13 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Sun, 11 Feb 2018 19:05:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=9wevKl+pEjp1kQKphMrk3X/Z/eL5jFX+8419LdJrG7w=; b=cifgfaC/
 XzPO6o2bqfmSArPYPdqNz+Pr1nN5Jsig5ocTTTHLEnLrTsYvybNhbEqpTrt53kqK
 e5jFLefl14R+z4/w3j+QyHoWjReMB5KB4CDoZc5r8wdOtds8pcAzeUA/Ue6mDEYr
 UE9BUHwPNr1wY1cD2dLpZy1c7HDZq66U++k9bBigysCBubHySQ6H6V2ouqClgYo5
 fpOcFa3iH9jcSFV6ls76+GdNYNnj9NFYiF/jDEQFYr6wfC78qHDUtnK8x2DBn/Or
 8erH8wgBcDbf1hsyRx5s1e1DmAbFzLpPY41YzguV5Lxj5TtKTqjf+qSn75kdLuJm
 gXgK0ITzHRaEAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=9wevKl+pEjp1kQKphMrk3X/Z/eL5j
 FX+8419LdJrG7w=; b=LjzOmiBYhjtPZ2Wh1T8up9perxb7UXEVQe7H3axo90PzS
 RS81vy+49IqUtOkbccNK3bZZ3TTzWpaH9w3od48vuXbZN1y5dtsXsCdbxBv6nX65
 fJdBi/rReodNa81qOvotkyWqghABldxtW1dZEPpQZKHTgY77fDRmbpnXH+uIWKZV
 JoVKY4AB7bk45EBarR/mWrA9oa1VzBDKU78fhjuLCLQfo3zIjnWYO7LPx0f11j4T
 JA94q33hPpsPAq5Au8YBEXPjs5KScfWBf82J6YZfu975qsn/omOV4OGU17wL2F3h
 lDywJVJcSSpbyVSZmdIQ03FoW2RaUY9VbawCztlbw==
X-ME-Sender: <xms:OdqAWs69xt_ttnINU2TbX26H5C6_sGuJy0SW-IfeV3R2KOw0-D4eeQ>
Received: from dave (ppp118-210-154-2.bras1.adl6.internode.on.net
 [118.210.154.2])
 by mail.messagingengine.com (Postfix) with ESMTPA id 61B0E7E3E0;
 Sun, 11 Feb 2018 19:05:11 -0500 (EST)
Message-ID: <1518393906.10440.11.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.13 v2 3/4] dt-bindings: aspeed-lpc: Document
 LPC Host Interface Controller
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
Cc: Lei YU <mine260309@gmail.com>, Cyril Bur <cyrilbur@gmail.com>
Date: Mon, 12 Feb 2018 10:35:06 +1030
In-Reply-To: <20180209051158.32354-4-joel@jms.id.au>
References: <20180209051158.32354-1-joel@jms.id.au>
 <20180209051158.32354-4-joel@jms.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-MegF2Gw+9e2sba+RYXPx"
X-Mailer: Evolution 3.26.1-1 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 12 Feb 2018 00:05:27 -0000


--=-MegF2Gw+9e2sba+RYXPx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2018-02-09 at 15:41 +1030, Joel Stanley wrote:
> The LPC Host Interface Controller is part of a BMC SoC that is used for
> communication with the host.
>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  .../devicetree/bindings/mfd/aspeed-lpc.txt         | 39 ++++++++++++++++=
++++++
>  1 file changed, 39 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt b/Docum=
entation/devicetree/bindings/mfd/aspeed-lpc.txt
> index 514d82ced95b..c40b707df907 100644
> --- a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> +++ b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> @@ -109,6 +109,45 @@ lpc: lpc@1e789000 {
>  	};
>  };
> =20
> +BMC Node Children
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +LPC Host Interface Controller
> +-------------------
> +
> +The LPC Host Interface Controller manages functions exposed to the host =
such as
> +LPC firmware hub cycles, configuration of the LPC-to-AHB mapping, UART
> +management and bus snoop configuration.
> +
> +Required properties:
> +
> +- compatible:	One of:
> +		"aspeed,ast2400-lpc-ctrl";
> +		"aspeed,ast2500-lpc-ctrl";
> +
> +- reg:		contains offset/length values of the LHC memory regions

It's annoying to reconcile this with the datasheet. I think LHC should
be HIC here: The LHC registers concern themselves with configuration of
the LPC bus itself, whilst the HIC registers control the behaviour of
the BMC with respect to requests over the LPC bus. This driver is for
the HIC part of the IP, so we should try to keep the documentation
consistent.

Cheers,

Andrew

> +
> +- clocks:	contains a phandle to the syscon node describing the clocks.
> +		There should then be one cell representing the clock to use
> +
> +- memory-region: A phandle to a reserved_memory region to be used for th=
e LPC
> +		to AHB mapping
> +
> +- flash:	A phandle to the SPI flash controller containing the flash to
> +		be exposed over the LPC to AHB mapping
> +
> +Example:
> +
> +lpc-host@80 {
> +	lpc_ctrl: lpc-ctrl@0 {
> +		compatible =3D "aspeed,ast2500-lpc-ctrl";
> +		reg =3D <0x0 0x80>;
> +		clocks =3D <&syscon ASPEED_CLK_GATE_LCLK>;
> +		memory-region =3D <&flash_memory>;
> +		flash =3D <&spi>;
> +	};
> +};
> +
>  Host Node Children
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
--=-MegF2Gw+9e2sba+RYXPx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJagNoyAAoJEJ0dnzgO5LT5ZT8QAJ9UDPMXf8SRNC9JeRezUNgL
RsD8tyPW7TIVrbJDsG+Qz0Y8wpasVAmdAQKaP9tqF7f1AeBcaeSzv73Hx6y1tp11
FX6VH6xhUzq+Sd+DqA7MT4aLjeDor40kWG4nsZpRxTPd8E7C5NNKhI01sHbFHktH
4K0kUkCf7RDwZicVH3lfDLHDIvvTX9boil9aOukTQoIZCiXzriYAIru/cHLf+rm4
nu7XWS8fWQ0o/An8tZr5dGIkETDXDoymNRenIGp9CVrT15NtTNgkpsIRQo8UXVM4
Zx8j0l7OjzTYf3piKJ2G6n+MXYTPVVpRd2n8UOix3IN1SN6FL6ylElnCKABSd0NK
8if8zrfQYOzhl6PXDHzeesmZvGT4hq7aPJ9XzkQjXtuMbBqIRVgWHHBkT7M+MXIV
3vVwcq7Q2OCgI2pzCmd1O7Lag4U7Dm9OimurOpJgQ3UFW7ad98EOUzlqyYT1658I
BT/iA32nJ16OiZ/5qVrUojqCXvu8F/gANlQ+DApK0GjnDS50ADMrJabVDO9mGm4P
RG1vJqd58mrSREhNfXMlMLqZ0sIt/x8SiTnZObwQ3xJVUnNcojFLE8eflPlf+cJC
QhPy2CcKJn63I5jZV1uR1oPhZjWbFXmnR26XDMzv47OsXojyCEnhdPk6RFF85OgM
q6NHEv0qAHm959wga3qu
=7+Kz
-----END PGP SIGNATURE-----

--=-MegF2Gw+9e2sba+RYXPx--
