Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wcGqL4BF6zDq5b
 for <openbmc@lists.ozlabs.org>; Tue, 30 May 2017 11:53:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="IJm7/ZGm"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="P7rHI9Hf"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A2A0F207F8;
 Mon, 29 May 2017 21:53:46 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Mon, 29 May 2017 21:53:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=EsRh9LPmBd5UUl8XUPKwJSrh1zkasPULwb4Rh538p
 mY=; b=IJm7/ZGmbHX213iIrwdS+r8pSTSooww0SvQWMxzHvRQqyM2HsjkGNm+fL
 EgCFeI43jET4qFo1md0skHQCMUbj73eZ7VPKzegGMaJAgC9x1Vz5OY5iuoE6VVPs
 ZqIj9Yt1lX2c2+4KyWxIkQUke6xZhyAM5pfFQy/c67W+agVr7kKz9C1tiP1ajZbC
 DPMwW82IyNyUO6RN2xnqP1SQ7JnGisx+GBBj1Q2mGwgu0TOuoAb/849qaglLAU22
 FbPzJgcWrt1YYMiOY/gmN83vT+LqM7pJYDQAohWxLx0MgtruhTaOUUtzHuxuviMo
 wKTvsRWSkWbjt/o2EYlQYs9wWjuCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=EsRh9LPmBd5UUl8XUP
 KwJSrh1zkasPULwb4Rh538pmY=; b=P7rHI9HfP4d8LRuxhy+r29+jQb38SC/Phk
 BIGqMaJR5Z1BCt6U/KQfRG/sPqVRC0sUfONOdTU2snu+WsGcOPJKUZZ1MUppiorZ
 uuB6lGvctJzdcML0dRpqhrX6jMJKgjJ23pYZo9IGc97fgMYJe5+lsWepD6PQ5TDt
 N2F1t7D5KoGEZkywGE6x/KSa2bqGOUtnLSNV7dRZr+3y9GxqA2H0D83MnlI3Ml1j
 ZKS5dgNAilq0dTfG4ypIk1lRdZMJjV/HgKHHn8IxyN2+/Hp1bTiqVmlz1fuk7vSg
 D3xi0UdEid8jtIfba57hxgk0wOSS6kazdqvtGIa8CQgm1qyoGqKw==
X-ME-Sender: <xms:qtAsWSK7p2KQ1k5SAxhtTlg8r2UAM23K0pYX7TN3HnRpv3G23vxKqg>
X-Sasl-enc: 27nbU76mnTIXuYt9KididDycsDc1s4vhGuDIDd5Iww30 1496109225
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id E48DE240B0;
 Mon, 29 May 2017 21:53:44 -0400 (EDT)
Message-ID: <1496109218.8159.2.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v3] ARM: aspeed: Add Mellanox MSN machine
 (aspeed arch)
From: Andrew Jeffery <andrew@aj.id.au>
To: Mykola Kostenok <c_mykolak@mellanox.com>, Joel Stanley <joel@jms.id.au>,
 openbmc@lists.ozlabs.org
Date: Tue, 30 May 2017 11:23:38 +0930
In-Reply-To: <20170529091544.54256-1-c_mykolak@mellanox.com>
References: <20170529091544.54256-1-c_mykolak@mellanox.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-deEGCQRdO+zZgIxzJJKL"
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
X-List-Received-Date: Tue, 30 May 2017 01:53:53 -0000


--=-deEGCQRdO+zZgIxzJJKL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mykola,

As Joel's been looking at the series for you I'll defer to his
preferences, but I've made some comments below.

On Mon, 2017-05-29 at 12:15 +0300, Mykola Kostenok wrote:
> Initial introduction of Mellanox switches of MSNXXXX family equipped
> with Aspeed 2520 BMC SoC. This adds the platform early initialization.
>=20
> > Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>
> ---
> v1->v2
> Fixed issues pointed out by Joel:
> - Make commit title shorter.
> - Replace flash layout from separate dtsi to dts.
> - Change compatible =3D "mellanox,msnxxxx-bmc" to "mellanox,msn-bmc".
> - Remove no-hw-checksum from dts.
> - Add comments.
> - Remove WD2 disable from aspeed.c
> - Add wdt2 to dts.
>=20
> v2->v3
> - Split v2 patch into three separate.
> ---
> =C2=A0arch/arm/mach-aspeed/aspeed.c | 23 +++++++++++++++++++++++
> =C2=A01 file changed, 23 insertions(+)
>=20
> diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.=
c
> index 0f1a536ba1b2..942cdffed9bd 100644
> --- a/arch/arm/mach-aspeed/aspeed.c
> +++ b/arch/arm/mach-aspeed/aspeed.c
> @@ -188,6 +188,27 @@ static void __init do_lanyang_setup(void)
> > =C2=A0	writel(reg & ~BIT(4), AST_IO(AST_BASE_LPC | 0x98));
> =C2=A0}
> =C2=A0
> +static void __init do_mellanox_setup(void)
> +{
> > +	unsigned long reg;
> +
> > +	do_common_setup();
> +
> +	/* Set strap to RGMII for dedicated PHY networking */

Nitpicking here, but the comment seems misleading as it's only true for
one of the interfaces despite configuring both. The sequence below sets
MAC1 to RMII/NCSI and MAC2 to RGMII.

> +	reg =3D readl(AST_IO(AST_BASE_SCU | 0x70));
> > +	reg |=3D BIT(7);
> > +	reg &=3D ~BIT(6);
> > +	writel(reg, AST_IO(AST_BASE_SCU | 0x70));
> +
> > +	/* Disable UART1 Reset from LPC */
> +	writel(0x00000A00, AST_IO(AST_BASE_LPC | 0x98));

My reading of the AST2500 datasheet suggests 0x00000A00 is a reserved
value? Given this isn't a read/modify/write sequence I think it
deserves more documentation than just mentioning disabling UART1, i.e.
bits that you're touching that you might not care about. We've had this
lack of information in the past in the board file and it makes life
more difficult when removing the hacks when we eventually have driver
support for the configurations.

Zaius and Lanyang both have more documentation and do
read/modify/write. I think either the Zaius/Lanyang approach should be
used, or the commentary improved.

Cheers,

Andrew

> +
> > +	/* Enable RMII1 50MHz RCLK output.*/
> > +	reg =3D readl(AST_IO(AST_BASE_SCU | 0x48));
> > +	reg |=3D BIT(29);
> > +	writel(reg, AST_IO(AST_BASE_SCU | 0x48));
> +}
> +
> > =C2=A0#define SCU_PASSWORD	0x1688A8A8
> =C2=A0
> =C2=A0static void __init aspeed_init_early(void)
> @@ -227,6 +248,8 @@ static void __init aspeed_init_early(void)
> > =C2=A0		do_romulus_setup();
> > =C2=A0	if (of_machine_is_compatible("inventec,lanyang-bmc"))
> > =C2=A0		do_lanyang_setup();
> > +	if (of_machine_is_compatible("mellanox,msn-bmc"))
> > +		do_mellanox_setup();
> =C2=A0}
> =C2=A0
> =C2=A0static void __init aspeed_map_io(void)
--=-deEGCQRdO+zZgIxzJJKL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZLNCiAAoJEJ0dnzgO5LT55KIQALh80TkfrP3LPcKPhNLMWi6s
BUJrLvl0tUOLh3m5PKGJ2FB6XgSdwwNh89kxtExW7ghBe2Kb54LwDrMSpbmjn11p
LvqvYvkzKkADh7cMiwn98ZlXWG/HG2mfMa/hCHq31XCm8c9Wf+eknDyc5mwiC8xh
f00Wq8gXh1g4mZ1vH0PRYIFN/SGDHdQozjv3LlJFEjF7iExKuwmZedX3g++fHgkw
Blhg1MRQiKSlPCH66fX8ejPYBItnaMguLlI7oDhwVTc+BIHmJBcEP3MQvr0CoVYT
bolLqg55mOTlrmKt1Y6q2TQ67xgGVEMYBN/U5e2dqj/NnKkxIvgA4Gc8aB39255R
Ezi3n6D1rK6aGm4E5x8523sm+xC5qLpe94sB8weVuFx6TLcP+vbTFD/KTNIGndUd
9s2uasSQyh/KHW6+w1vIoG7g9fm3N0aLTzIIPr79+Bxs1cuDaTITvuwOHUMRevXf
iiiMA0RoLPOC0PqX2jZjbqbaGVqWLfyqOe5z7xaATHbB3wyUAJ/Q1XN8kcIILIu6
s3T/nAkYIixSvhiPPhIEkTnAD6GbNSrMdgicHmb7hkodoIPRIPK7StqPySO7cGOr
ytGJozs+O6lXcG1DwZQvaMbHPhi+u8dulG9U0laPphj/pnHVWe7API8aL8wjuNzS
0mh+Q04NsDEcUYa/cA2B
=K+Xw
-----END PGP SIGNATURE-----

--=-deEGCQRdO+zZgIxzJJKL--
