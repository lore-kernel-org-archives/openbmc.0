Return-Path: <andrew@aj.id.au>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tNDDC2sdGzDvjw
 for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2016 16:14:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="fghSsIi9"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="GYsjKckJ"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 24F43209E5;
 Tue, 22 Nov 2016 00:14:33 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Tue, 22 Nov 2016 00:14:33 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=8rfMeYlL5rXfhqKfGQxUPTbhwCU=; b=fghSsI
 i97JtsKK3bekzWm3JSaVxfYv8plQxijZhFCkKJwcmVvYciJQWx8tu2Jyx5dAlGT6
 EB03ZX2HVBLFzNSL1pwAmSn7OKIYHbY5zxxQhT02aWVdVvn0dpspxQb+ceoj8ta7
 20Mqya1J7BahfDrZd24aG6xBpPGPdM2mboBeQ=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=8rfMeYlL5rXfhq
 KfGQxUPTbhwCU=; b=GYsjKckJ8sN9LXaGsPOFPY9jRabjim0fKHC1jcT6EGX5Ia
 vgGJIG5v8Hd23P38uewP5hTV6y/e/wmDlMVmZAkkahcvNob36ytp/rM87+39ob8t
 Zb8/AJH2itdJM9/ycjXlWRMy/Kp5uvCdzmHpJkuKMmLx0qvzGGZaWPUTyqy1E=
X-ME-Sender: <xms:OdQzWJqnHV3XLxtNl6lHiyDhly5-9YOkOTO6wmF9S8oufaiUakgWgQ>
X-Sasl-enc: da4wAnsS/4XNVq7ClJd7CRK6SEnG9h0fCSAC0vztVcS+ 1479791672
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id B31FC24033;
 Tue, 22 Nov 2016 00:14:31 -0500 (EST)
Message-ID: <1479791665.2503.25.camel@aj.id.au>
Subject: Re: [PATCH 1/7] arm: aspeed: Remove UART muxing hacks
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
Date: Tue, 22 Nov 2016 15:44:25 +1030
In-Reply-To: <20161122040849.31604-1-joel@jms.id.au>
References: <20161122040849.31604-1-joel@jms.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-zZTtr6nFF4I9kx5iSUub"
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
X-List-Received-Date: Tue, 22 Nov 2016 05:14:36 -0000


--=-zZTtr6nFF4I9kx5iSUub
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2016-11-22 at 14:38 +1030, Joel Stanley wrote:
> These were added during initial bringup. None of these pins are used by
> OpenBMC for the functions they're being muxed to (UART4 nor the VGA
> output) so there are no device tree additions required to cover for
> the removal.
>=20
> We do use UART5, which is an exclusive function of the pins it sits on,
> so again no pinmux configuration is required.
>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0arch/arm/mach-aspeed/aspeed.c | 12 ------------
> =C2=A01 file changed, 12 deletions(-)
>=20
> diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.=
c
> index ce73867aadd4..0e4c34a91ac3 100644
> --- a/arch/arm/mach-aspeed/aspeed.c
> +++ b/arch/arm/mach-aspeed/aspeed.c
> @@ -181,18 +181,6 @@ static void __init aspeed_init_early(void)
> > =C2=A0	/* Reset AHB bridges */
> > =C2=A0	writel(0x02, AST_IO(AST_BASE_SCU | 0x04));
> =C2=A0
> > -	/* Enable UART4 RXD4, TXD4, NRI4, NDCD4, NCTS4 */
> > -	/* TODO: This should be pinmux. Also, why are we enabling uart4? */
> > -	writel(0xcb000000, AST_IO(AST_BASE_SCU | 0x80));
> -
> > -	/* Enable
> > -	=C2=A0*=C2=A0=C2=A0- UART1 RXD1, RXD1, NRTS1, NDTR1, NRI1, NDSR1, NDC=
D1, NCTS1.
> > -	=C2=A0*=C2=A0=C2=A0- VGA DDCDAT, DDCCLK, VGAVS, VGAHS.
> > -	=C2=A0*=C2=A0=C2=A0- NAND flash FLWP#, FLBUSY#
> > -	=C2=A0*/
> > -	/* TODO: This should be pinmux */
> > -	writel(0x00fff0c0, AST_IO(AST_BASE_SCU | 0x84));
> -
> > =C2=A0	/* Enables all the clocks except D2CLK, USB1.1 Host, USB1.1, LHC=
LK */
> > =C2=A0	writel(0x10CC5E80, AST_IO(AST_BASE_SCU | 0x0c));
> =C2=A0
--=-zZTtr6nFF4I9kx5iSUub
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYM9QxAAoJEJ0dnzgO5LT5xjUQAKMzfABdAjrQc7reuAxlKJ++
bLnzBoZCVC4LVfRkxmkmuDj0jMJpsqKK0iHfbhjh2r2ZzYQdW5kWof3PIQEdGyZa
FkDeOqJcpcFHb7ZueZrolPStojdBp3Bja+/Qz5EBCYy/Wdw7Q0q1BZkAC/tfE+VX
clMRCvgmVWusFeLYrs1wwK6SlWR7KYpeaPU49A05/zfzp4ZDkzEM90jfmyOPWqXU
ca4Pg2oTPyAIo4fmM0uJM/R54dT6AJ5/Bpf/MNolI9n51cwwx6fE+OOwLuoPhFUH
D8oiskS8KdWC1szCX3IDMk24yTClGu1pUj3TzYTQ54JWx9LRwMlKp/VHNvTArtyz
XAjdEreCFY6jY811mnsRasBq3PMR2l62Sz2cY2tblqoKuTTW9WGZLBPdPEQvfvdd
ry0G9IsAX4m2nrRKF3GNV6qSbKUFDmt/ikiXXvO9JYTIVoSHSW9FwZcn7p1N5PV6
AZPVYMsw2HkuQiJ90GVtznHbE1YV5lQURf0cUQc3di937B5+rNNNRMCh+cwCM9go
YB4m+JidGF35hYduGwlhaQuwPsGgGo52I4PI2YwfoAdWp3FF7UhfTcFLIpo1YhRw
+ZnRqEkq5yCEaZzSXF1cA2Exdn8EV785763MMWP4S57yVApbZzSuJfzPWkD1Wh3q
WMuVnU7/Srpa/ZP4/uUu
=YCMr
-----END PGP SIGNATURE-----

--=-zZTtr6nFF4I9kx5iSUub--
