Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t98Hk74qpzDvXx
 for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2016 15:39:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="dOl7WnBH"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Pe19+1Zc"; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 000E62078D;
 Fri,  4 Nov 2016 00:39:12 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute7.internal (MEProxy); Fri, 04 Nov 2016 00:39:13 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=q2+Bf/PcjroAUysrw41A++d5bjM=; b=dOl7Wn
 BH3I4/5qXZcjKytt1ubDlBvdkU1f7YsFXo6bCRvc1G5XpJy3YbfTjiwK8MtvwAWh
 /o8ublXJxB1c+ETIHil59VDHxLoYszEV5YpBjRKFtJGMpJHluZXdFGKjFVukfqwu
 Or/A/YjJRvXyh203Rj41476GJoRv2jp4Eqn1c=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=q2+Bf/PcjroAUy
 srw41A++d5bjM=; b=Pe19+1ZcsYEffx4UdcQ8lf54co5xyzsoqu63TJvvkh4fEr
 12Ux2EOrIZMHMdJJtLeZPlKYH2Mwb5g9IK+ULM4oVhmU4yUXlab8nGqshOnKWqod
 7xqZP5YU8qNSnLzm0EFCePyNA9Ac3wiyKI0B2a6Lh2aTzr33jBun3g8q+Y48M=
X-ME-Sender: <xms:8BAcWMFrDTFI3oASgHaNrf01IneHgoRdBN18IB-sdMW6HkgR3QVa4w>
X-Sasl-enc: si8NeW5wbUmp+ajCXAE+fwyboLJ3yRBzO+1mmwlEJUFP 1478234352
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 30CBEF29CC;
 Fri,  4 Nov 2016 00:39:10 -0400 (EDT)
Message-ID: <1478234347.27396.87.camel@aj.id.au>
Subject: Re: [PATCH 2/2] arm: aspeed: Remove SPI1 strapping hacks
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
Date: Fri, 04 Nov 2016 15:09:07 +1030
In-Reply-To: <20161104033042.32562-2-joel@jms.id.au>
References: <20161104033042.32562-1-joel@jms.id.au>
 <20161104033042.32562-2-joel@jms.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-WcBTojioVOHxipUV7VVe"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
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
X-List-Received-Date: Fri, 04 Nov 2016 04:39:15 -0000


--=-WcBTojioVOHxipUV7VVe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2016-11-04 at 14:00 +1030, Joel Stanley wrote:
> Now that we have device tree and pinmux support for setting the
> strapping we can remove these from the board file.
>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0arch/arm/mach-aspeed/aspeed.c | 13 +------------
> =C2=A01 file changed, 1 insertion(+), 12 deletions(-)
>=20
> diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.=
c
> index ebb2224dcd13..2100e54ffbc2 100644
> --- a/arch/arm/mach-aspeed/aspeed.c
> +++ b/arch/arm/mach-aspeed/aspeed.c
> @@ -160,13 +160,8 @@ static void __init do_ast2500evb_setup(void)
> =C2=A0
> =C2=A0	do_ast2500_common_setup();
> =C2=A0
> -	reg =3D readl(AST_IO(AST_BASE_SCU | 0x70));
> -
> =C2=A0	/* Set strap to RGMII for dedicated PHY networking */
> -	reg |=3D BIT(6) | BIT(7);
> -	/* Enable SPI Master and SPI Slave to AHB Bridge */
> -	reg |=3D BIT(13);
> -	writel(reg, AST_IO(AST_BASE_SCU | 0x70));
> +	writel(BIT(6) | BIT(7), AST_IO(AST_BASE_SCU | 0x70));
> =C2=A0}
> =C2=A0
> =C2=A0static void __init do_witherspoon_setup(void)
> @@ -190,12 +185,6 @@ static void __init do_zaius_setup(void)
> =C2=A0		/* D3 in GPIOA/B/C/D direction and data registers */
> =C2=A0		unsigned long phy_reset_mask =3D BIT(27);
> =C2=A0
> -		/* Set strap[13:12] to 01, Enable SPI master */
> -		/* Set bits in writes to SCU7C are cleared from SCU70 */
> -		writel(BIT(13), AST_IO(AST_BASE_SCU | 0x7C));
> -		/* SCU70 is set-only, so no read-modify-write needed */
> -		writel(BIT(12), AST_IO(AST_BASE_SCU | 0x70));
> -
> =C2=A0		/* Disable GPIO I, G/AB pulldowns due to weak driving buffers */
> =C2=A0		reg =3D readl(AST_IO(AST_BASE_SCU | 0x8C));
> =C2=A0		writel(reg | BIT(24) | BIT(22), AST_IO(AST_BASE_SCU | 0x8C));
--=-WcBTojioVOHxipUV7VVe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJYHBDrAAoJEJ0dnzgO5LT5tyIP/14EAc2Zu74YlZhCbiP+nJNV
fOEQ4UXkcAeLxPFc0L5Bu+MvAZMSL09D8LYqWKC4awTlEI5RPY7ThJwO2oyiHixO
ZVwQrv/rs6nZ1BDAhbMRry10JxFAUvD4g4pbw4JDsfdo55ypYJ5VpChyhGq/9Sat
9NEDEn/99vKQN/zgeV2ZP1rRqVYnEPow9+46ZlzUSR3uGxEOtOOQ+7sH+ilMM0vk
qh3ODCsPHYcjHcEdU3JTrL/OaQ00SI3RbV2s5o4d3r9Jwi6vvlPJohAbcWi0ijfd
s4RbDMQRd2KchFxAeI7UvtNcjyXcEjXP7/MpPtR6NiNG0zi//qLPFPb5oF4jYi+H
Sw8p5x4xFmxb+8Q09DFamRA8nNK7rCnx2u0INg+iBKVzBYcPAl1eeo1hwd8om4yf
5Dz7yAJZz9k7yi2G76052oTvtQoWlNnyc4OqEswS6TD3aHvHqasltgBEwSa4v8Qf
ODfHgdUKQbrSueJizZijEFiT3JdXC4mM4VP54xh0vv8lMqDNbLFnzAvBlgxPgui8
aICsGB/6T3sbIUw99JaFt+10WB3wGRuEZ2NBJtegY8C5Fhw1wIBpDyfD2QRYD9Tt
c9b12z97gX5Jo9hW0bpXsS0SYrcYcdRo44vPwwDhynr1+xx/Aftiv9mpFxMwIdUK
SEHnDWh2YehhhQ//7OE1
=gmJz
-----END PGP SIGNATURE-----

--=-WcBTojioVOHxipUV7VVe--
