Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t96HV6x0lzDvP2
 for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2016 14:08:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="BUIJQpkE"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="bY6XAwQT"; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 5349A2073D;
 Thu,  3 Nov 2016 23:08:50 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute7.internal (MEProxy); Thu, 03 Nov 2016 23:08:50 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=miGimXZFtgMx6bF/16KzUPN7Od0=; b=BUIJQp
 kEUKT2qGsz2dMeSHIWi5sU2F3F/2LWJWDthlpXtO+C73XCY5C3blfp8ppsJzAt5j
 MTJrG1Vuz77P1QAPRCQP2bgN+OgrDcFOwZ5reCduJONDsUtcs2MrIVbnH/BIUM7f
 sgfl+U923RvF4ZEApHPlQ0Deykn1HxOZQqXtk=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=miGimXZFtgMx6b
 F/16KzUPN7Od0=; b=bY6XAwQT4QJQTDDIJ3GdXFx3zvvFpDWzHH9uPaWv0odXnd
 JKmwG4PfWcWfSk6cBSy9SUQAxUTiKKfvyQLP3bsNfNlNNTcBg3maS9UpKkWFEh4u
 sRtmuvWfsFEmYYy2Clxr+A9jXTsO/0pA2I6kq3jGNMMpUkkv9U4vzdlDajR+U=
X-ME-Sender: <xms:wvsbWJzuQQeL2HETOTxeXwv5HWsVJBwwrFA9eKpfVEzUFJf9p20zew>
X-Sasl-enc: pbvNQ628cTQJpLwoMXY6zip3/JYOTqbEuLzcGLmXreqf 1478228929
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9CA52F29CB;
 Thu,  3 Nov 2016 23:08:48 -0400 (EDT)
Message-ID: <1478228924.27396.64.camel@aj.id.au>
Subject: Re: [linux dev-4.7 PATCH 4/4] arm: aspeed: Remove SPI controller hacks
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
Date: Fri, 04 Nov 2016 13:38:44 +1030
In-Reply-To: <20161103223009.4794-5-joel@jms.id.au>
References: <20161103223009.4794-1-joel@jms.id.au>
 <20161103223009.4794-5-joel@jms.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-+J+OWO2aoeGU0qP+fhxy"
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
X-List-Received-Date: Fri, 04 Nov 2016 03:08:55 -0000


--=-+J+OWO2aoeGU0qP+fhxy
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2016-11-04 at 09:00 +1030, Joel Stanley wrote:
> The spi-nor driver aspeed-smc configures these registers now.
>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> =C2=A0arch/arm/mach-aspeed/aspeed.c | 10 ----------
> =C2=A01 file changed, 10 deletions(-)
>=20
> diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.=
c
> index 46e711ca275c..f81dccbcd2eb 100644
> --- a/arch/arm/mach-aspeed/aspeed.c
> +++ b/arch/arm/mach-aspeed/aspeed.c
> @@ -42,19 +42,9 @@ static void __init do_common_setup(void)
> =C2=A0	/* Enable LPC FWH cycles, Enable LPC to AHB bridge */
> =C2=A0	writel(0x00000500, AST_IO(AST_BASE_LPC | 0x80));
> =C2=A0
> -	/* Flash controller */
> -	writel(0x00000003, AST_IO(AST_BASE_SPI | 0x00));
> -	writel(0x00002404, AST_IO(AST_BASE_SPI | 0x04));
> -
> =C2=A0	/* Set UART routing */
> =C2=A0	writel(0x00000000, AST_IO(AST_BASE_LPC | 0x9c));
> =C2=A0
> -	/* SCU setup
> -	=C2=A0*=C2=A0=C2=A0- GPIOC{4,5,6} are FUNC_MODE{0,1,2}. These nets are
> -	=C2=A0*=C2=A0=C2=A0=C2=A0=C2=A0connected to the Ethernet phy and to ens=
ure the correct
> -	=C2=A0*=C2=A0=C2=A0=C2=A0=C2=A0operation they all need to be in GPIO mo=
de (SCU90[0] =3D 0)
> -	=C2=A0*=C2=A0=C2=A0=C2=A0=C2=A0and then pulled down
> -	=C2=A0*/

Did you intend to remove this? It's still relevant and useful.

> =C2=A0	/* TODO: This should go in the GPIO driver device tree bindings */
> =C2=A0	writel(0x01C000FF, AST_IO(AST_BASE_SCU | 0x88));
> =C2=A0	writel(0xC1C000FF, AST_IO(AST_BASE_SCU | 0x8c));
--=-+J+OWO2aoeGU0qP+fhxy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJYG/u8AAoJEJ0dnzgO5LT5TJIQAKX0Vl5dSWOggZk4ua6kmOcZ
PMjDcK4oxX6aEey8SivI80l2cpjFVptHV67gkFcicROtF9nb08DacJRfSOYVGbNP
x3GyhmSYj7BRw9bXS9+Iz+2+iMFk26+LFQ3DtPIhfIxLr8GV4HfZZftZ+jLSGvrf
7htAEsX4z1whzSZRWrABxmytkvqlAoWRbBP+cDXAJMqKrI0jhBweGFncn724A30U
60P7qZY/3lDISdJKQk9pJQ+nNX1DIG9+isCZXfEKpFHWyeMu+MtVl5CtgpvEOCjG
zXjH3NLSgIpcwFB6UEB+bbgVvO3CColVzPKGQYT/fFZwaQnA+jtrU6M/7m+At1OI
PoUHEVZQ5uPe6NiJGE8ICtBtlguBOK5716FLqDoDPqAT9+yjDu3ikkV8Q7aCwPyS
T3I3bPBuJocUq5fP4z3kM50hEUbRexa+YjnwRlVeXhu8Nkhya036xfqnUZ1DK9nY
Xhs+vKKQPh/GjFty9ZYoJrZZoO5AJnkr4v8NWkcpAnWSvmHzlz1nvZms4m91JswA
ktFAGNo+1Al2zvLgaDpMjnBmtizfWZwoqol2LGAZ8ZBKwAZcauAFxscXrnsCVBt2
Ly79EGfw5EVaU53gGX3gy3OqRvrUZUo4ysOREc8/HHWDaXmzHmwX3PdAAmgvCCAO
yDx62OPA3HZQhy2FkSzV
=/sZ1
-----END PGP SIGNATURE-----

--=-+J+OWO2aoeGU0qP+fhxy--
