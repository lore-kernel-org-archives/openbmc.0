Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xGlF946WMzDqxh
 for <openbmc@lists.ozlabs.org>; Tue, 25 Jul 2017 14:12:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="W3hzMSEq"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Xr1svHCk"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 391DA20A79;
 Tue, 25 Jul 2017 00:12:11 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Tue, 25 Jul 2017 00:12:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=1ulCNWuGicrOBFqZvIuEidwJlTjzvIkElQVk3almc
 6c=; b=W3hzMSEqf01gf1Pvxo/ANBM2ieRe4rao/wSXwWsHx+6B8ni/NolaNk4Qi
 DHWNatYjDwfV3HEBUEntiG0+xMPUq5fsiI/5twaVyIku2qcFCI+lUORFKchEg2QK
 EaNcBtN2I98q1AzG1zeCvxZybu3yfSe1xs5V5rTNjzRW+KxoE+F79aE5CEQN9agh
 2QO8etRmSH2uYNCgXwWOlM7azp3IlvmNuOrpu74sQHY+9UvJKSdpPggizH8aE4kB
 9nqpWdQoscwBxY+x1pZ0a8Ez1P/knPkUAN4BN7xAyNeFFyzRJBQ9G3QnSK+9LtAC
 ZIDasvQwmMnOw3vf5bNyw8ra68oog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=1ulCNWuGicrOBFqZvI
 uEidwJlTjzvIkElQVk3almc6c=; b=Xr1svHCkLJwlNCNt2sfoSvzTdigjhG6Cev
 8mAAp2PLbC5aUOALlBycAiKGOL+Lr+QIvrOK1L2CCbQOtkDcUYUCL5rczuhBTXI2
 in6rm7UHI3zkJRHs3qpzyaie3QISDdHt4Vo85tc7gtUxNK9wfSCPu/1BXfRZEiaa
 V9NLLPr/W/QP7HpJuye0Re3Rg08cfAdqG+3+OupSZj9GHRllIcwwlMjl3EswgNO8
 fYONKzcricgAdgte4djsmUHsBkOVN5Wp0Ua2enjCH9vCf+E7ZLlnRFx6XG5mWMnw
 oExSLxrwpL1la3bJ6oC49bbL15FPysOftMuWhUnrEesjY7KGU/rQ==
X-ME-Sender: <xms:GsV2WQbJQ0SNtSGqxl0dME-BHdRPPPkv3omwAEpjwn08NO-1jYwbXw>
X-Sasl-enc: m3LKuwTVrE/FHZpUeH/kJ/KEHlUVYzqvpxEU+qrzzfi7 1500955930
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 896147E1D9;
 Tue, 25 Jul 2017 00:12:09 -0400 (EDT)
Message-ID: <1500955926.5179.8.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 2/2] ARM: dts: aspeed: firestone: Request
 UART pins
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
Date: Tue, 25 Jul 2017 13:42:06 +0930
In-Reply-To: <20170724120935.1862-2-joel@jms.id.au>
References: <20170724120935.1862-1-joel@jms.id.au>
 <20170724120935.1862-2-joel@jms.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-J9JHHFYDuDBt1S7dYws7"
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
X-List-Received-Date: Tue, 25 Jul 2017 04:12:14 -0000


--=-J9JHHFYDuDBt1S7dYws7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2017-07-24 at 21:39 +0930, Joel Stanley wrote:
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts | 18 +++++++++++++++=
+++
> =C2=A01 file changed, 18 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts b/arch/arm/bo=
ot/dts/aspeed-bmc-opp-firestone.dts
> index cc479efd1763..39a836cbdfa5 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> @@ -75,10 +75,28 @@
> =C2=A0
> =C2=A0&uart1 {
> > =C2=A0	status =3D "okay";
> +
> > +	pinctrl-0 =3D <&pinctrl_txd1_default
> > +			&pinctrl_rxd1_default
> > +			&pinctrl_nrts1_default
> > +			&pinctrl_ndtr1_default
> > +			&pinctrl_ndsr1_default
> > +			&pinctrl_ncts1_default
> > +			&pinctrl_ndcd1_default
> > +			&pinctrl_nri1_default>;
> =C2=A0};
> =C2=A0
> =C2=A0&uart2 {
> > =C2=A0	status =3D "okay";
> +
> > +	pinctrl-0 =3D <&pinctrl_txd2_default
> > +			&pinctrl_rxd2_default
> > +			&pinctrl_nrts2_default
> > +			&pinctrl_ndtr2_default
> > +			&pinctrl_ndsr2_default
> > +			&pinctrl_ncts2_default
> > +			&pinctrl_ndcd2_default
> > +			&pinctrl_nri2_default>;
> =C2=A0};
> =C2=A0
> =C2=A0&uart5 {
--=-J9JHHFYDuDBt1S7dYws7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZdsUWAAoJEJ0dnzgO5LT5MeUP/2mstTagfBmmn2JE5hAvcWvf
KwwTSpJsywWDnMjpzME/9ynlvCvsIt29w5ghTPuJc7PMgEiGo0DEhpchChmcRB3V
xjIENfZV+M+MZ3uJMnRJt1dUN+FGG8dx557QzsCj9vz9BAMo3jmp1EWK0eQBIdHX
2dlQsIEgfTlZb+o4KvvdrSQQbzA4UqtsYevAD5mehsJyMQlxzEB2HFIp0AEKgcXs
1DUGfyZ3okUCaQAYHfd6+QRHz4cVhELrwR3TIZob+UDsMtFbihjPARrrddqL3X5P
dYtjWwUzaVgE4xO9Xriv57viLTd5x/PrRTxd6vYrbhcwf0LOG2pUXvP+kM3EGlhq
V26XQ8JweNiD0SxTO+YSOvmegkaIogqw2TJmMrSeEl+jHFZ0m7CpL1itP4C7xfka
yizrDFCxc2FHcz7yBGDi9/YacxUMNY6p2sz5XL4FgZVnMJNxsQOfKXVn75SBjoK4
Ve98J75I5kZa6VLd0ZF05D8zzoH5bprzxf9uKFsR7wom8FMOSkaV4e1167Cg63N3
6hbclmFpSIoDbQ2SdYcn6X/GFopnO1lqhc/r2mmnjvox/FOCNFxVzrsSAZ9XZ9A5
v+KHvALBtJb6eNO7Ko4k4fTCKy5uaVXzVAum359EJ/PN008L7u/4Dca06y5rB3Iq
9ERCavh86O06fy0KEX3q
=P20s
-----END PGP SIGNATURE-----

--=-J9JHHFYDuDBt1S7dYws7--
