Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t86Q82RjTzDvHZ
 for <openbmc@lists.ozlabs.org>; Wed,  2 Nov 2016 23:11:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=eHtcefGW; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=CZDI/rCv; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 55A4B2079A;
 Wed,  2 Nov 2016 08:11:10 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute7.internal (MEProxy); Wed, 02 Nov 2016 08:11:10 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 x-me-sender:x-sasl-enc:message-id:subject:from:to:date
 :in-reply-to:references:content-type:mime-version; s=mesmtp; bh=
 Ha/2AjFcDOQhXTU+kimuAnUoaj8=; b=eHtcefGWPknmus4+86k64b0hebARPvIx
 C2ObabIQSkrnblWSD8CqryKQLKlsilG+v/cxVt5JqhPVs4d9BaKYLn/UWrUQq8V2
 PPvyAYOep44Wz2TzWelvzSiz/LElikSmb9mg1yxpjHQrQDNK7RfjJYddfrONqBbz
 Cs0qMOg+Swc=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=x-me-sender:x-sasl-enc:message-id:subject
 :from:to:date:in-reply-to:references:content-type:mime-version;
 s=smtpout; bh=Ha/2AjFcDOQhXTU+kimuAnUoaj8=; b=CZDI/rCvfdKnaK/KZ
 zz14wbvY3QXWbHZr5lzvccijaIX/qKKT+exaOtGybKE5Qt90IkRs8Sgzut/yss6w
 IzxyVph3kWAF766yUh7xB+LOX+BUzMaF/SiLDX12Os4Ivgu1kZbvrtwxYg/+Vy2F
 BX9GvdB3MBT8TtVFG1TRnoDJ8g=
X-ME-Sender: <xms:3tcZWKMnJoyt4zDP2XXsf95T-QN8dkyklbcxlykVoyHY9F2aXkkVkA>
X-Sasl-enc: ZI5y4iQBCx5dGKh8aMo87W1ElO9Hl0HjvS1M4UG/mrNc 1478088668
Received: from keelia (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id 25F4ECC0B9;
 Wed,  2 Nov 2016 08:11:05 -0400 (EDT)
Message-ID: <1478088662.27396.5.camel@aj.id.au>
Subject: Re: [PATCH 2/2] arm: aspeed: Set SPI master strap for all boards
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org, Xo Wang
 <xow@google.com>
Date: Wed, 02 Nov 2016 22:41:02 +1030
In-Reply-To: <20161102055557.24349-2-joel@jms.id.au>
References: <20161102055557.24349-1-joel@jms.id.au>
 <20161102055557.24349-2-joel@jms.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-dvZedE5/L2eLE2DQlBRl"
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
X-List-Received-Date: Wed, 02 Nov 2016 12:11:12 -0000


--=-dvZedE5/L2eLE2DQlBRl
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2016-11-02 at 16:25 +1030, Joel Stanley wrote:
> All of the ast2500 systems that we support have incorrect strapping for
> SPI. This commit moves the Zaius specific strapping change to the common
> ast2500 setup, so that Witherspoon, Romulus and the EVB can benefit.
>=20
> This moves the strapping change out from the Zaius board version check.
> I don't see an issue there, as the will still be correct for future
> boards.
>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0arch/arm/mach-aspeed/aspeed.c | 12 ++++++------
> =C2=A01 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.=
c
> index 0a4578290d5e..57c32ff0fa83 100644
> --- a/arch/arm/mach-aspeed/aspeed.c
> +++ b/arch/arm/mach-aspeed/aspeed.c
> @@ -152,6 +152,12 @@ static void __init do_ast2500_common_setup(void)
> =C2=A0	reg =3D readl(AST_IO(AST_BASE_MAC0 | 0x40));
> =C2=A0	reg &=3D ~0x80000000;
> =C2=A0	writel(reg, AST_IO(AST_BASE_MAC0 | 0x40));
> +
> +	/* Set strap[13:12] to 01, Enable SPI master */
> +	/* Set bits in writes to SCU7C are cleared from SCU70 */
> +	writel(BIT(13), AST_IO(AST_BASE_SCU | 0x7C));
> +	/* SCU70 is set-only, so no read-modify-write needed */
> +	writel(BIT(12), AST_IO(AST_BASE_SCU | 0x70));
> =C2=A0}
> =C2=A0
> =C2=A0static void __init do_ast2500evb_setup(void)
> @@ -190,12 +196,6 @@ static void __init do_zaius_setup(void)
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
--=-dvZedE5/L2eLE2DQlBRl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJYGdfWAAoJEJ0dnzgO5LT5CXwP/2fF0daYeAvu7uI0DmQ/I/Ui
y3BPmaTEMlB6MjGuXfUvtmJxdsU5E9mG0QvYuLQFmhcdppe5xOQChkRTySTp5Uio
T2CcP4yUeY4qWhrFZS4yCOQcfrbuV4fYVUZMx4QN+Hu05qMwHBIC9UDT1NfXbDkZ
18AQYfuvpPWkTA/6LQTHPsf4vDtcgmaAWEaNnu+dQYHiPmvRziXC2KKNX1WOBciV
91aoal1nrcF7nApp713HNc4YN4OXgVv7O0Q2dsdGEwPKd+OhGgR8Vlwp8wIRG5CY
3cqC1BM3RVAnZ28wGfCKsMyb1ty+5wIiDJb6vPJucaWydaRmJRNeBkZNOcrj7oPn
Phxym/0AoXfboLSNrk91NKasLZkmhRjBecHZTJ25oE1j982p/QWgz3VnWXc+7ZDL
7u0H9XTHmSm6vU0iU5bk6Zu0a1C06mjaLtINUKYFXKNlJtmDiChxsCF7p5LEMeLY
gzXMqPksaH/1oxYdXXVja4q1pWLOIgYhuCljXfVteWysXSnfSoySqaYQRPMMgTTd
84GVKbdxRVSB76ki1PSF9jrwUVqAQ1Fz68v8WjZSHsZJDCkZF1MRDVTYs+DhVME2
G9xGtncnTHqtZDabzjVVGhLc+VT8u618waX0N2WQtjG3C9LYyZcRqN7XznAMlPu1
UKPmxz8/p5B7CefPPSbN
=xds9
-----END PGP SIGNATURE-----

--=-dvZedE5/L2eLE2DQlBRl--
