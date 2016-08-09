Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s7ZFF5w1wzDqdb
 for <openbmc@lists.ozlabs.org>; Tue,  9 Aug 2016 10:01:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=JN2n8Pmc; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=AU+WGJsW; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id C832320348;
 Mon,  8 Aug 2016 20:01:19 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute7.internal (MEProxy); Mon, 08 Aug 2016 20:01:19 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=vCcNv
 fYvcL2NmCJM6flMsh86nSM=; b=JN2n8Pmc3/Fkhh+Hu35w5CUgwpqpNhBKBmJJK
 2G0/EC8a0GLi8e8unTbSGIX6H39CRHbMR6DgSKwWyM4hbdOweZcThvKCiiapIwfs
 Llxtdg/OwPm7Tp1b1qYL1Uzvt28Y+qBEap0nsvYTxM97/SxDvjTnv7sJMKVzVRgf
 ZFTfTY=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=vCcNvfYvcL2NmCJM6flMsh86nSM=; b=AU+WG
 JsWUYThHWqbEMO6cJL1ajMO4e/0UWtf59kML/VZT8EC3/el1GEWMSnC0CiO/Jlxe
 SnTL+VZwmCSWgemjBWVArjo/ezOdGdNZ6fmxoB/DqWb5A6D5c2FG/L+ZEDCKjVHC
 hNlSOyLf6+L+Rq3dgd7Q0Hw8WCNzTVLCZqdeGw=
X-Sasl-enc: P+olaDDDJ1ksywyQaG/Idv+96vh9vy/jSshvsYNUGcD7 1470700878
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 055E9F29D9;
 Mon,  8 Aug 2016 20:01:17 -0400 (EDT)
Message-ID: <1470700870.27272.13.camel@aj.id.au>
Subject: Re: [linux] arm/aspeed: Reset AHB on boot
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
Date: Tue, 09 Aug 2016 09:31:10 +0930
In-Reply-To: <1470634150-17291-1-git-send-email-joel@jms.id.au>
References: <1470634150-17291-1-git-send-email-joel@jms.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-TrNUHc2tfg8dBsEGM5BS"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Aug 2016 00:01:22 -0000


--=-TrNUHc2tfg8dBsEGM5BS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2016-08-08 at 14:59 +0930, Joel Stanley wrote:
> The Aspeed u-boot port from the Aspeed SDK performed I2C initialisation.
> Part of this appears to require a AHB reset in order to successfully
> access the I2C registers.
>=20
> So we can boot the stable kernels on systems with new u-boot we add this
> to the stable kernel tree.

This feels like it's missing a sentence. Something to the effect that
the new u-boot differs in behaviour to the SDK and doesn't do this
initialisation?

Might be worth mentioning that we don't assume any SCU lock state to be
configured by u-boot. Also, that we leave the SCU unlocked here so that
drivers accessing the SCU don't need to manage it themselves. Given we
describe a syscon device in the dt we should be able to coordinate
unlock/lock in individual drivers, but we aren't for the moment.

However, on-the-whole, the patch seems reasonable to me.

Acked-by: Andrew Jeffery <andrew@aj.id.au>

>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> =C2=A0arch/arm/mach-aspeed/aspeed.c | 7 ++++++-
> =C2=A01 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.=
c
> index fadbbb666e1d..1102b896cab0 100755
> --- a/arch/arm/mach-aspeed/aspeed.c
> +++ b/arch/arm/mach-aspeed/aspeed.c
> @@ -200,9 +200,14 @@ static void __init aspeed_init_early(void)
> =C2=A0{
> =C2=A0	u32 reg;
> =C2=A0
> +	/* Unlock SCU */
> +	writel(SCU_PASSWORD, AST_IO(AST_BASE_SCU));
> +
> +	/* Reset AHB bridges */
> +	writel(0x02, AST_IO(AST_BASE_SCU | 0x04));
> +
> =C2=A0	// XXX UART stuff to fix to pinmux & co
> =C2=A0	writel(0x02010023, AST_IO(AST_BASE_LPC | 0x9c));
> -	writel(SCU_PASSWORD, AST_IO(AST_BASE_SCU)); // UNLOCK SCU
> =C2=A0	writel(0xcb000000, AST_IO(AST_BASE_SCU | 0x80));
> =C2=A0	writel(0x00fff0c0, AST_IO(AST_BASE_SCU | 0x84));
> =C2=A0	writel(0x10CC5E80, AST_IO(AST_BASE_SCU | 0x0c));
--=-TrNUHc2tfg8dBsEGM5BS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXqR1GAAoJEJ0dnzgO5LT5j9UP/0nN5ZJCghSPzmu1fizTGs7l
mb3qXymGekH9IfUROIdyZvh3TtWoD41KNjxXUYfOelK5q8AbcBg0DdoJGBcYB/53
Stpf6bX7qWugendsVOBT/YNQN8SDplz/jedcHHIh5JUqMNbDxUePFPx4AnsDEeMk
lBSnyjMeFvGcdEZmmxYYHCwC3R+FUdRgpOgmW82EkONhJ9HSWH2AOYrk92TuSgo3
mWguO7/Gqcc1TV2ZNBYMrJXjEVcEfYakZdYsC9RrUuDKLYdM60jkRGxJzAetyrP1
Ye81zXE/SjVJ+ZZHzz2/c/uZ/Cr4Qh3vy5z5sLvQ18cPES2v37NMckKlsWAmHXLh
No0kkUhLjHoyzxJ/pMR0qU2NsoXPq/oxO5eNG363OdLq7vWEH4YFOLol9jAOsAdq
n5kXIGvupCywir+wQQkM93gcn0hcxS3AmfCtpZEvA+JyBeYGnjhftmKWCR6TAL4H
K/rVSxsB8Aot3kITjU7UPO5F5re0j3KmdhlTuvRGyj55hewoxkJVmHX76hySoG6E
vZRZbibgOPqdEmZQCYhzclLwFK1k4nrr9OEPzKtbDKL1YhVoak+euN48/UG6oVDx
Ef88aYEvJo7kNB79X01l6fOShCjzjkcjcDnZfq4H2X2eXlBTcBf829zNCTuC4tEl
RA6GV73M3/HENFBnjjLV
=ZBGU
-----END PGP SIGNATURE-----

--=-TrNUHc2tfg8dBsEGM5BS--
