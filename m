Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Bl+Doa3S"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Udpku8Mz"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yBjT24k4FzDr6N
 for <openbmc@lists.ozlabs.org>; Wed, 11 Oct 2017 16:38:46 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0B67920BB8;
 Wed, 11 Oct 2017 01:38:44 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Wed, 11 Oct 2017 01:38:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=L+HvcTUfvOxN0NERb3KEUVzLPqhFd2w+nPhvjLRTly0=; b=Bl+Doa3S
 uPqP4g10C6Iu7dH6YgWEvT49S5hvwqz0omg+kW7P58YhEfbGM3oL2dn+2sUCXhrR
 HF7fN6Pwx0reKnueegKkm3t+9o1nN6dYn4QukP6qkwEaXRyX1Ut6TliFoGqC+np5
 o3advKCHrpYclQjRsESpr7PsdWLDTI6zINEU/Sjnn2bDEXkC8oG4iBKGcadBacD/
 ESXYhUCLqXwvKojjwlnrKNSsORXmKz3ePn6Db5Nf/Ly8eu0eHX/pt4+gXNC0K1fO
 7X+Fiw7Ul+pZ64rR7t3YCkjHpZFHtLRI7VqLl2ayaP0pG2FTplkLvgKIztrSwoeb
 lQ/tQNNm+yK3/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=L+HvcTUfvOxN0NERb3KEUVzLPqhFd
 2w+nPhvjLRTly0=; b=Udpku8Mz+LwOLBx773Jr9TDEHjaLA85Hu11bNFx826i0+
 8/tatXXzZnPxZn6XIZOdafZeLvUBFoCOF/1t5dOkax8rn4XyGGnJfLR9/GW0kVqT
 6atyUAQ9kVEOPJWzsbKqKG0/3zt6IRZe5U8Q5Erd9JKhTsugnnh5K+f730whhmzU
 GUxo3DWi4nzYl9QUqq4hil8ztLgasX5GfSe0kUhhUz1Y8eviHwvm5+U7h1/yPeo0
 L5FIOu6XeyB+ePnsS2PfkK7rFDRywlPUMz73wCR5L/E76VEE5jrARfOrmHmlsqjP
 jk+OYW/AKrr7GhDyTm7a5S6+jOY0qh2Sqzp/d1Vvw==
X-ME-Sender: <xms:Y67dWVigxCvAzIgFCX02lF1Se91YeXbOy9du5eWRv8BqxWhkALxL1A>
Received: from keelia23 (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7D76324737;
 Wed, 11 Oct 2017 01:38:42 -0400 (EDT)
Message-ID: <1507700318.5452.177.camel@aj.id.au>
Subject: Re: [PATCH u-boot] Revert "ast-g5: deactivate vbar (for qemu)"
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, 
 openbmc@lists.ozlabs.org
Date: Wed, 11 Oct 2017 16:08:38 +1030
In-Reply-To: <20171010122749.9124-1-clg@kaod.org>
References: <20171010122749.9124-1-clg@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-dMOBZMS+Ve+GGl1Zqo+P"
X-Mailer: Evolution 3.22.6-1ubuntu1 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Oct 2017 05:38:48 -0000


--=-dMOBZMS+Ve+GGl1Zqo+P
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2017-10-10 at 14:27 +0200, C=C3=A9dric Le Goater wrote:
> This reverts commit a0ca4ecbeae4ae9632ebc67bf5318dd2ea09c94f.
>=C2=A0
> Support was added to QEMU in :
>=C2=A0
> commit 91db4642f868 ("target-arm: Add VBAR support to ARM1176 CPUs")
>=C2=A0
> The work around happens to crash the guest when the vector relocation
> is done, with ignore_memory_transaction_failures=3Dfalse which is
> now the default in QEMU.

You need a Signed-off-by here. Can you reply with one? Hopefully patchwork =
will
pick it up.

Cheers,

Andrew

> ---
> =C2=A0arch/arm/lib/relocate.S | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=C2=A0
> diff --git a/arch/arm/lib/relocate.S b/arch/arm/lib/relocate.S
> index 33bcff41ac30..475d503dd9df 100644
> --- a/arch/arm/lib/relocate.S
> +++ b/arch/arm/lib/relocate.S
> @@ -35,7 +35,7 @@ ENTRY(relocate_vectors)
> =C2=A0	ldr	r1, =3DV7M_SCB_BASE
> =C2=A0	str	r0, [r1, V7M_SCB_VTOR]
> =C2=A0#else
> -#if defined(CONFIG_HAS_VBAR) && !defined(CONFIG_ARCH_AST2500)
> +#ifdef CONFIG_HAS_VBAR
> =C2=A0	/*
> =C2=A0	=C2=A0* If the ARM processor has the security extensions,
> =C2=A0	=C2=A0* use VBAR to relocate the exception vectors.
--=-dMOBZMS+Ve+GGl1Zqo+P
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ3a5eAAoJEJ0dnzgO5LT5SiMP/24Rw5h0DPmz+/HOnY1xu4ZR
CYUmI6ZrPvFuEvOIzclCkt0gvnlCR9qKAghUKV8+Ht5h6NovOklSNm5Ezjzj08Yj
1VaE69U0tc2Zhw8RguResvQWEsite0+a3CbcwkiGaiNQAYuJi2tXz1aehb/4EboZ
nDmRNAMESbChGa0qhDNNShODRVmsLzaItYtsXz0c7Qajzgryi9XCRA/PPfJDWceQ
/AVzVJWNkoy1yy0HbNytPJO2yFE89Qugc0As313aEV+G9ymsYVWRutZSaoglKkcZ
03s9uBD0doRpbHFDTXwnGATTvLuzoYsJUcQQguq1zgLZwOXQl/RYwBoFS3ye7orc
ybbZCIpwyK4MgMiBk/+7ah999pblTDFrO2tjmRyDrM/pWne5XhBzcmY6foW4k5Gx
/tNJpPxwbhMbArhtMDW2KF2EPtvDPmCYihNPbGTgIyFKDCi8coCXLQfZOwVIS7F4
pSuUVp5TtcFvXaZo32RGcF7wHkaAQHfW2i3do/RnzFPkilTz3Qqkan+yMcMZkgwS
/7I7vLzotJPhYQLhtztiMFil8p+hnGHfM7Hnzo6e2nWXwknbtRQOJGyr3ForXw4b
QrB24i1MRhRm2t5EdOSFLLHDqD3kL6W3m4j4ogVG7u2CR2R4ekn+G4kGCKsYBpnX
UjrkH5gFBK1nD6BKXQek
=u8uI
-----END PGP SIGNATURE-----

--=-dMOBZMS+Ve+GGl1Zqo+P--
