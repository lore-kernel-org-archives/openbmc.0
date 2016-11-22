Return-Path: <andrew@aj.id.au>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tNDSh3KS0zDvw8
 for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2016 16:25:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="kv3C1yny"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="uyr25RoG"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 56A57209F4;
 Tue, 22 Nov 2016 00:25:22 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Tue, 22 Nov 2016 00:25:22 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=9H3SDWIk0Sigu9G61OiL4NcKmlo=; b=kv3C1y
 nyURRz5w6kbPfE0asvXZCossbPBtTMvOgfJckHX/DEvbGv+ZoZFIs4ieZj3QIlP5
 umkvZOSkN0v2/wRDEQb0Z73eFI4AlanpWSOSK2U81cnS/rn7+W6ZZSYDaY+eivLf
 Wn7hXrZIPIPyLFK9ToVwnR6uDDezqS2tiGEF4=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=9H3SDWIk0Sigu9
 G61OiL4NcKmlo=; b=uyr25RoGgB/urONRJtLlvrgwW4Ag6oEhVgZLm+uZ31dhB+
 KkGwhRqFfDle0XkRCnaWAqbLuuU9ailSym62QkOwOP0HYGNV7N7u4n4Sj1I1dMVM
 UUuZHSDFgvt0I+cCZZO1cqUf/sCvYFr5+Toakz2FcTf9IdzqtV9tPq41nLhRw=
X-ME-Sender: <xms:wtYzWHvpRsbA6yAy2KK4xHmuqErDLs-OruYx0ZtvhJk7NYI1BgfdWg>
X-Sasl-enc: UpVzpYajUA+m3ESvssbubbG43/8mMuMTel5hA01AVevz 1479792321
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id F138424066;
 Tue, 22 Nov 2016 00:25:20 -0500 (EST)
Message-ID: <1479792317.2503.31.camel@aj.id.au>
Subject: Re: [PATCH 5/7] arm: aspeed: Remove SCU8C hacks
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
Date: Tue, 22 Nov 2016 15:55:17 +1030
In-Reply-To: <20161122040849.31604-5-joel@jms.id.au>
References: <20161122040849.31604-1-joel@jms.id.au>
 <20161122040849.31604-5-joel@jms.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-9vGW1Z60EtP6J+ellug+"
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
X-List-Received-Date: Tue, 22 Nov 2016 05:25:25 -0000


--=-9vGW1Z60EtP6J+ellug+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2016-11-22 at 14:38 +1030, Joel Stanley wrote:
> =C2=A0- ROM pins were configured but these are unused on Plametto.
>=20
> These settings were present, but I suspect unused:
>=20
> =C2=A0- GPIOR had the pulldown disabled. Most of these pins are unused an=
d
> =C2=A0=C2=A0=C2=A0pulled up on Palmetto.
>=20
> =C2=A0- GPIOP is used as BMC_TACH, inputs from a fan controller.
>=20
> =C2=A0- GPIOI is the SPI buses for the flash.
>=20
> =C2=A0- GPIOH and G are misc I/O.
>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0arch/arm/mach-aspeed/aspeed.c | 3 ---
> =C2=A01 file changed, 3 deletions(-)
>=20
> diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.=
c
> index ea76c95c33fc..55447123bf39 100644
> --- a/arch/arm/mach-aspeed/aspeed.c
> +++ b/arch/arm/mach-aspeed/aspeed.c
> @@ -45,9 +45,6 @@ static void __init do_common_setup(void)
> > =C2=A0	/* Set UART routing */
> > =C2=A0	writel(0x00000000, AST_IO(AST_BASE_LPC | 0x9c));
> =C2=A0
> > -	/* TODO: This should go in the GPIO driver device tree bindings */
> > -	writel(0xC1C000FF, AST_IO(AST_BASE_SCU | 0x8c));
> -
> > =C2=A0	/* Setup scratch registers */
> > =C2=A0	writel(0x00000042, AST_IO(AST_BASE_LPC | 0x170));
> > =C2=A0	writel(0x00008000, AST_IO(AST_BASE_LPC | 0x174));
--=-9vGW1Z60EtP6J+ellug+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYM9a9AAoJEJ0dnzgO5LT5kFgP/jpnUSWsN+t7nKBKyV0vLNl1
3OGFgbHdQOGzHo7gnBThwuICg14jUrOnFBYTp47U4r+nS9zhn/7dRA/snHzB9pfX
7TifP0UCJVhCkEr49vLJSzx8At09Ryl4kUKGvQHFj7xa9dD3uHt4bEKMOE7WS54H
Fa7oh/MvUd2WHXzk0dj2IMP1nH1ybbCCLWaGl5nPAPMKsV32WAwXEdtOejOFjjbx
2B3ZecoSARS6SCkvaGiphrd0PwRbsi9E85lVKi2hVXwWPvYDNzetJYhCFcMDV+n0
LxCzsmBDXl6w81mXH7t09m/hJK1gSCoymu7sYU0EBnOjgmNztohSscS9pFusYI5y
IYo76pMcpFVPgMwywRN/x5Ncyq2ZwB9fRjfCR7UGELQVzCCQunQ5wiodKB0pMXYe
JOKzjrsRMXLBp8Pr4m0UdHB3cU7EpCy7B7BiSmQXHIqPH596rIu33kyLcsNMN9/X
/6QHJsNbQGUKIxviq6ydZovzzXKBOLAtISrXW99vgCql7HqINFRWhXmVhTIXtM35
Agl+KKVnySvmoVNgQRteLyYrJBeZpCf15UjTJ07+BceL+i4+H6S0DVw6LKbqhbjc
gpMqfAiT8hhaZAdIJiIWVSThXADo7shhrJQuyPqRSbb9/Lj7ojrNzJogKvMZWEyf
LrI2vgXbkBK90OHJlyn/
=39V0
-----END PGP SIGNATURE-----

--=-9vGW1Z60EtP6J+ellug+--
