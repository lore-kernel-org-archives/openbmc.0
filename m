Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wGcZQ3SY5zDq9m
 for <openbmc@lists.ozlabs.org>; Mon,  1 May 2017 18:11:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Gbi06s8v"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="o1TlCKME"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 2D656207E2;
 Mon,  1 May 2017 04:11:24 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Mon, 01 May 2017 04:11:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=Eit2KKQT4iyYjWwUojGRMMvppVw49zAkCm+oNbNKY
 28=; b=Gbi06s8v7udqOqZSQTZSy0BItLFZQIDa1QqYNau0U7jK7EwTSZt5H5Kct
 L9S/rZC56S2PBo2KMdMfOOZMSxmH8XTHEWBvI3zPBIPSqBSP0YYjYx4CBaAq3Q+9
 AVGlOKcS2ndiaxq8NEhXXsjRR0oQBVMFCPUr7GTutPejN6vSKVcL8dP7aEyPMpGu
 8nk7fGk4YwrlwiKmYrsw626JFVaHpFdAvoGDJDhTbABnrEfTQs17Z7WPximZArLG
 FfE7I4Z8GPvtRC6Pq55W5B2DlfzniBRQY3fYO0/9tCSEYB7RxwOntcT8LUHIC0p3
 sj0FWHzzF4NIc1t8QH4bHX6tz0N7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=Eit2KKQT4iyYjWwUoj
 GRMMvppVw49zAkCm+oNbNKY28=; b=o1TlCKMEdmK4KP+L2/lFwzC8On3O27VBTo
 zi4ezmzseEzP2QURdU2IG05N/566OdF3tdZOA8lPvyg4s0Rc44asNLUpQ1b4qH1S
 DpRjDWu+m8O9IXcbs44lXWz3FruZNukopOmNtgcCF3Kt4ZmDs888YXBR3WaGFC0t
 Dn6Q9hYZ4fgpnJacYIEVN3fijql8c+gAVZZbsndr4ZuY8wi72SIuz8IOTGDZRkvD
 5yDJiJaGdaL8WqxHYW3bmKCH9ba5BopYdRDYsrt71g3GVaxc/8e8G2x62nqNbqhV
 hwpjdDzNMlP3uiiFMaHW6mAKimNekiD2Y9i0RSz3r7N4WtrSubhA==
X-ME-Sender: <xms:rO0GWTpmp9yZwEIiBcMaaxwySyMVJrjSbRmtOGAXr-Kt-lLWVRtdhg>
X-Sasl-enc: tjBLm5oknaod0VIImqlqwx17SaqpTLfhkLjy16TCtckR 1493626283
Received: from [172.16.172.59] (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id 582B624050;
 Mon,  1 May 2017 04:11:22 -0400 (EDT)
Message-ID: <1493626274.4433.17.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.7 v2] ARM: aspeed: witherspoon: Take UART1
 out of reset
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
Date: Mon, 01 May 2017 17:41:14 +0930
In-Reply-To: <20170501075139.19006-1-joel@jms.id.au>
References: <20170501075139.19006-1-joel@jms.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-h4AANhKF130z7GyvNO1v"
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
X-List-Received-Date: Mon, 01 May 2017 08:11:28 -0000


--=-h4AANhKF130z7GyvNO1v
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2017-05-01 at 17:21 +0930, Joel Stanley wrote:
> This is required so the UART can be used before booting the host.
>=20
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
>=20
> ---
> This is a minimal workaround for manufacturing. dev-4.10 will receive a
> proper fix.
>=20
> v2:
> =C2=A0- Make it compile
>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

>=20
> =C2=A0arch/arm/mach-aspeed/aspeed.c | 10 ++++++++++
> =C2=A01 file changed, 10 insertions(+)
>=20
> diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.=
c
> index 0717181cc890..0d1dded5d91b 100644
> --- a/arch/arm/mach-aspeed/aspeed.c
> +++ b/arch/arm/mach-aspeed/aspeed.c
> @@ -197,6 +197,8 @@ static void __init do_zaius_setup(void)
> =C2=A0
> =C2=A0static void __init do_witherspoon_setup(void)
> =C2=A0{
> > +	int reg;
> +
> > =C2=A0	do_common_setup();
> =C2=A0
> > =C2=A0	/* Setup PNOR address mapping for 64M flash
> @@ -216,6 +218,14 @@ static void __init do_witherspoon_setup(void)
> =C2=A0
> > =C2=A0	/* Set SPI1 CE0 decoding window to 0x30000000 */
> > =C2=A0	writel(0x68600000, AST_IO(AST_BASE_SPI | 0x30));
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Disable default behav=
ior of UART1 being held in reset by LPCRST#.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* By releasing UAR=
T1 from being controlled by LPC reset, it becomes
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* immediately avai=
lable regardless of the host being up.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0*/
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0reg =3D readl(AST_IO(AST=
_BASE_LPC | 0x98));
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Clear "Enable UART1 r=
eset source from LPC" */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0writel(reg & ~BIT(4), AS=
T_IO(AST_BASE_LPC | 0x98));
> =C2=A0}
> =C2=A0
> =C2=A0static void __init do_romulus_setup(void)
--=-h4AANhKF130z7GyvNO1v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZBu2jAAoJEJ0dnzgO5LT5FqoP/17Q2C27IH8PnY36Rg99QzWe
oMizABvECGmhbYmQUmiebi2I1MnayXnANttYtV22FidXgkZNNmGp7+RcfHE07v9H
Yc2S6lyILBzLEMdz+u9opNXxUHH2/ZRYuxsntYt8TGKhQtBymj37JvSqdeFWk+S1
k2O5GWNjMNA4Ta2/RJ9IJJ99F2iZm4kiBI8ex7BZsYYdvX/SmWV+KaSsq4LokhoU
tyo/1zb46YBs3mUo8ZWMZjeuBboeCP/p8MmNJ+MR7xal2lm3ceeLA7PWecGQfUiC
1yPhIot8TLFKcaB6DzgOdh/HwJJJvWs1ICmH/cqk0HdrbZRQ3Rv4+h/BZSLm6jB9
BDRqEq9pfnL5CEuW3YQiyz5+YIF+TCMWqq/VHIx6D9tCd4XFPx5YzK1FbxKKtDBf
zBzY+uUzO6pm8tXHOOrvQrPnVABNsqTzyodEQNKy468zpa8bwwtrxMVLeK6kP76A
b9zq2j3eBZXB0qgTRXYWcVCsP0JzE2kIiHzJd3EAXpJcHV002Iz6uXMtxILGEAV5
q9seasQZKaw033QdcI4rm4g+VBCjrOubJ6uUs6zPSgpWLz57CzMhbURrchnq5+Sk
HyyOsRYSjFaAtqblznyQaeyiLQGhOZ0VGBLSZ65UnKMPosIgb7PnMOWeO27bsyD4
r6/VS9DLm6U/JnyzlNjJ
=55Wc
-----END PGP SIGNATURE-----

--=-h4AANhKF130z7GyvNO1v--
