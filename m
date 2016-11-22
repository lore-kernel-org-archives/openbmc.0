Return-Path: <andrew@aj.id.au>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tNDMk07W3zDvrl
 for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2016 16:21:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="k6NwUlv4"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="i4qmj4rE"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E129B207B5;
 Tue, 22 Nov 2016 00:21:03 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Tue, 22 Nov 2016 00:21:03 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=k0eMhU9Mv3TFIhhZ3RFWThwn2LQ=; b=k6NwUl
 v46URsD90FWXRnXGqysc1ZX1yFjp7Fs+ZqVupO9ICutctfTO7mcYnGc++bumgGMY
 5iaZB/G3Nx7eeuKac6fMclL83hbOYAChLh9wfyp57P8KVpJ7jbkeKaLvxI1UfvGq
 3SUn/A+Q6/pgTJ9gRftjxaJ8NYCrAZjPQ66lQ=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=k0eMhU9Mv3TFIh
 hZ3RFWThwn2LQ=; b=i4qmj4rEIZYiVHzwxZw7L+v6W+r6Tcb9aZsIR78r1rgxCG
 73eOBpdfjKJ/f/amytNJQHEFZyOUb1RtuH2V20v10lGomt6FVguoQQNwLFbDCxQg
 mGe3YxJbkwjq/h4OUE09tyI8IwecVZvUD6U1VkEH3rUQ5ieD7txhzNEDTHsec=
X-ME-Sender: <xms:v9UzWD_z3BG11tFMoCKLQlW-scGv79HP-yGlJ98L8xFKJ5Agp5-ayw>
X-Sasl-enc: 5eNrRi2fYBeA/g2ZrxNdZG9zzZWUF+GexcZOyJ13quGY 1479792062
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5A08524046;
 Tue, 22 Nov 2016 00:21:02 -0500 (EST)
Message-ID: <1479792058.2503.29.camel@aj.id.au>
Subject: Re: [PATCH 3/7] arm: aspeed: Remove SCU88 hacks
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
Date: Tue, 22 Nov 2016 15:50:58 +1030
In-Reply-To: <20161122040849.31604-3-joel@jms.id.au>
References: <20161122040849.31604-1-joel@jms.id.au>
 <20161122040849.31604-3-joel@jms.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-r62TSETbc5asz6tHtrYS"
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
X-List-Received-Date: Tue, 22 Nov 2016 05:21:06 -0000


--=-r62TSETbc5asz6tHtrYS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2016-11-22 at 14:38 +1030, Joel Stanley wrote:
> =C2=A0- BMC IRQ (GPIO P6): This is set to "BMC IRQ# interrupt output". Th=
is
> =C2=A0=C2=A0=C2=A0is an input connected called BMC_PE_WAKE_N in Palmetto.=
=C2=A0=C2=A0It's driven
> =C2=A0=C2=A0=C2=A0by a PCIe device. Userspace does not read it from a bro=
wse of
> =C2=A0=C2=A0=C2=A0skeleton.
>=20
> =C2=A0- FLACK (GPIO P7): This is set to "Enable NOR flask ACK control
> =C2=A0=C2=A0=C2=A0input pin". It's pulled high on Palmetto.
>=20
> =C2=A0- The other pins are the PWM/Video pins. They are not used by OpenB=
MC

There's a PWM driver on the list right? Regardless, we don't need this
hack.

> .
>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0arch/arm/mach-aspeed/aspeed.c | 1 -
> =C2=A01 file changed, 1 deletion(-)
>=20
> diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.=
c
> index 0e4c34a91ac3..ea76c95c33fc 100644
> --- a/arch/arm/mach-aspeed/aspeed.c
> +++ b/arch/arm/mach-aspeed/aspeed.c
> @@ -46,7 +46,6 @@ static void __init do_common_setup(void)
> > =C2=A0	writel(0x00000000, AST_IO(AST_BASE_LPC | 0x9c));
> =C2=A0
> > =C2=A0	/* TODO: This should go in the GPIO driver device tree bindings =
*/
> > -	writel(0x01C000FF, AST_IO(AST_BASE_SCU | 0x88));
> > =C2=A0	writel(0xC1C000FF, AST_IO(AST_BASE_SCU | 0x8c));
> =C2=A0
> > =C2=A0	/* Setup scratch registers */
--=-r62TSETbc5asz6tHtrYS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYM9W6AAoJEJ0dnzgO5LT53jkP/jpZ2jUeTW30cTIV6H3AM5A3
/76mY5oeD7JKif7SZzJYJAO23OFj4WrVfr6Ylevwx26L1WnUdDuQuYY6WcVUnjaY
a8cu7+s07rNL5yvdqT3+X5fQxUKG7YZLK4IGpRJIpXgqnd3O4S129R9aE6kQ63dt
96BO/Mm/yGexNgRk8AaP0tHSyAP0R0RF6Mt8nkiIdnICGURTbpz/ZgOG4T4EER39
lPOnb9IJ/egTAQHpCVfxL8dwLDygtzb0VYyzqeGDBIWWUNOlrutW/BFRzU6fxu9x
/foneHOjzaKns/Ei4VepI85hH4GLc07Ul8nhwWMnoYowGyt/NIecGIQ08CAKjiZU
CwOe7Qc7n7HjT4VbqV5Z+nrgrAw1zndJcAdVx5tKkrBzXjBu6/YurqGXuDRInL7Y
SerCv9b1muKlXIkV/dKKhfStKRhydB0OeH0+89Mvml3VBE4WGkohSnercgA6d5VL
2gP8o2Bfb4mpDZimWeb+U9m3ZKhjfofugR+mw8h3YL1qi2Q+9TbM7snluPKN7fUM
42Y0Rkm/Jz/Qh8tuKkhiydA5SN+L34qS9M8aKfFUKTDHGD+Vg3Z7i9+469DF8ATE
CeNJV2sWd8muUo/e3Y5chQ0krvQ+ITrs1gBWphOjdMk1UEqfkw+GKm0ht01gU0Oo
OxDRrKV963JLgeZmVNde
=Clen
-----END PGP SIGNATURE-----

--=-r62TSETbc5asz6tHtrYS--
