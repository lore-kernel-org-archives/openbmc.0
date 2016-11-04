Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t96Fn2VQNzDvPH
 for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2016 14:07:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="JxBjus2/"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="MqF1OVLE"; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 7F9242039F;
 Thu,  3 Nov 2016 23:07:22 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute7.internal (MEProxy); Thu, 03 Nov 2016 23:07:22 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=xVEo7IkyX0I9yHPamOs4zZflYrA=; b=JxBjus
 2/dd2ti30YwGb4O3c0hXOC5UxCFwJJtMOLhL8mmUoP9NkVK9DCi2bo2ve/G6voAt
 wOmurhjAkBKJPPUPGYaD7re1QRtPvUkKYaF3z9Iod8gLMvU8oIDILrWJgpSW4Zf+
 k72dInSZzv/XrocJkxgJt4cSjsHizd03e0e8Y=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=xVEo7IkyX0I9yH
 PamOs4zZflYrA=; b=MqF1OVLE/e4o8cpZjk7scrzzNcvXial2cXXMMVBgO6Ttyg
 Ahua5rVf2jVaNnOygkEpdpHHafk37wp2Qo9ZFl0iwpHAS/7g7wYcfqV1WMQetY1a
 TVOTfjYpeR3nFYkrCvFOoenpl4o0RPXJ3zLW4bl/IbgHNPn/70K4EeFry/MOE=
X-ME-Sender: <xms:avsbWIJbtogJ9hyMtSWShfqX2skxsL4ZAIJiNuMYxqStZ7FRkrDONQ>
X-Sasl-enc: HvVv3zz/KIRSSoCKT63mVK6Je5NGYA9axxwN3bHhq3nW 1478228841
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6119BF29CB;
 Thu,  3 Nov 2016 23:07:20 -0400 (EDT)
Message-ID: <1478228835.27396.62.camel@aj.id.au>
Subject: Re: [linux dev-4.7 PATCH 3/4] arm: aspeed: Remove setting of SCU90
 from common
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
Date: Fri, 04 Nov 2016 13:37:15 +1030
In-Reply-To: <20161103223009.4794-4-joel@jms.id.au>
References: <20161103223009.4794-1-joel@jms.id.au>
 <20161103223009.4794-4-joel@jms.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-cwzeSISXBIh/okCmTiEk"
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
X-List-Received-Date: Fri, 04 Nov 2016 03:07:26 -0000


--=-cwzeSISXBIh/okCmTiEk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2016-11-04 at 09:00 +1030, Joel Stanley wrote:
> This hack enabled I2C buses 3 to 8 inclusive:
>=20
> =C2=A0=C2=A0=C2=A0Enable I2C8 function pins: 0x1
> =C2=A0=C2=A0=C2=A0Enable I2C7 function pins: 0x1
> =C2=A0=C2=A0=C2=A0Enable I2C6 function pins: 0x1
> =C2=A0=C2=A0=C2=A0Enable I2C5 function pins: 0x1
> =C2=A0=C2=A0=C2=A0Enable I2C4 function pins: 0x1
> =C2=A0=C2=A0=C2=A0Enable I2C3 function pins: 0x1
>=20
> Bit 3 set the USB1.1 Host port 2 function, which is not yet supported in =
our
> kernel.
>=20
> Bits 13 and 15 disabled the RGMII/RMII 1 and 2 RX pin internal pull down =
which
> is the default state.
>=20
> Therefore all functionality is present in the device tree and this can be
> removed.
>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0arch/arm/mach-aspeed/aspeed.c | 1 -
> =C2=A01 file changed, 1 deletion(-)
>=20
> diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.=
c
> index cfbd6d3b3b73..46e711ca275c 100644
> --- a/arch/arm/mach-aspeed/aspeed.c
> +++ b/arch/arm/mach-aspeed/aspeed.c
> @@ -58,7 +58,6 @@ static void __init do_common_setup(void)
> =C2=A0	/* TODO: This should go in the GPIO driver device tree bindings */
> =C2=A0	writel(0x01C000FF, AST_IO(AST_BASE_SCU | 0x88));
> =C2=A0	writel(0xC1C000FF, AST_IO(AST_BASE_SCU | 0x8c));
> -	writel(0x003FA008, AST_IO(AST_BASE_SCU | 0x90));
> =C2=A0
> =C2=A0	/* Setup scratch registers */
> =C2=A0	writel(0x00000042, AST_IO(AST_BASE_LPC | 0x170));
--=-cwzeSISXBIh/okCmTiEk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJYG/tkAAoJEJ0dnzgO5LT5y78P/1QR1FD+pYu5uPO1OADGuHDX
laWBwhq9TbfgjypCaxuDNJ5V+1gmyna2yLQ3wjDAH1RFNaiGfXvn1UhHLakbmTd6
RPOXhhYQYsihkjLfw76yshwvsmwiMJKjCZjisYcgiKOhGizq2nWstsjbFIoL1AAx
n5jmG+X8dTeLEpb5pYLOH3+KMCgP9Ot206KRuT5dX0tMOtAiMmuy0ISuw6IA3grG
4eHHjlXzEr1cP4NPyIsohgbxYyynZ1Har3NyJYgFQShBMu2S44E1/zLst8WVguCX
rd9+UIA2dwZsY0mN5HxZRBKkq3mqaHiHKDn53wPZDGaoaKxP2+Va30XRQOwKAIbV
2VkfV6Ho2oUkH2Q39LrhxWpNVE/NrP1XM5x658qCAK0lZpsuM9dJL7ictgAY6BzU
oXde20HiPAo6QEgK2vJbhHOvAWQcb00Da3irnz4kZnbWbSknWZxr/QHhoPRYC07O
RlUuIdNhcqCiPdS+7XtKIViS213AX//QLocscgEKKEETGhVHWfC/ERD0qrHsUB+l
gRibPzC9UN74vvCPkbt2YXbOn87yEb246p9qpYwL2fbdmRMndZwzE+oY1e0eN148
PCg/QSIddTjijweCQ+KJdJbnynqCXtxHmf5X7f0XqWhyRnY2atsN2ikHTn59j78u
1tGFuXy8GJy/TsMexYzv
=LvcR
-----END PGP SIGNATURE-----

--=-cwzeSISXBIh/okCmTiEk--
