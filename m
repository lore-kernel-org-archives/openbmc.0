Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xGlBR73FNzDqxh
 for <openbmc@lists.ozlabs.org>; Tue, 25 Jul 2017 14:09:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Y15t5tW/"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="jJ1rw9Ab"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C439B20AB1;
 Tue, 25 Jul 2017 00:09:49 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Tue, 25 Jul 2017 00:09:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=bHk6xMlH7p1Etxek2fFNVqfYhkey0qlFM5PJunBjO
 6I=; b=Y15t5tW/Z73Jor/XBkVOQ7QT2jIhXAuCVgVeo+daCGDCdP6erMBR35c26
 87qx6AxVyqRsApquMGzrQJ+6t1wpCKBOzQjeD1sV/SOrcKXERF+4Ep/7vNhQadng
 1AXPTf4eqi7zN+MATjPFf33Ed+q89wlO0rSJHZ9+GBUYqh2V3eIW5N9/+FrPQ8QM
 rFekd9PSxcA6TUslbyx2YnO6yU+T3uGNpARcnPmYIihL94f6qX1NGcZyjZRQ/sQG
 flaZkdOnfwknh6leu4lRl/pGkAyWnb1IED3ZTggjoEZtHlBmfE6XD0Q+p1KgZUBP
 OoUAMMUfxOUi1NMC3l28y7l08Kbgg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=bHk6xMlH7p1Etxek2f
 FNVqfYhkey0qlFM5PJunBjO6I=; b=jJ1rw9AbH6zae8PvFaZXR1YLXqFwTW9u3h
 F8Nvpb+1txzqN3XV2yApppf/R6x6zz4wPbwcVQdOmzrJdVfOy8VVkM6BYOzc0q3U
 vP6tw4dwjmHYQsvANbOrarKMEFbdSdSr2qmqRgOxwoMl0YPlbHUju9fYop8LJcQe
 oW5eqOBTXw7v5uIHqhhuW8HOVP1SLZ31QO2aipQoY9DHm6LxV97g0LUS4G/kampo
 vC9gqd4sA0i92yDrWY3yySMUnmxWyOTxgplfD2pG/ls/+EQssE9OheE65SpYTLeq
 yezGGKPUkgwiASKCNHdIdfTemwbfeEg3SRn0TuICtJayHuA4+YZQ==
X-ME-Sender: <xms:jcR2WbBqQ0lO01Rn7d1HRjPXtBUUZQpvDgQkhHj4SO0Rpx5Hfc-Igg>
X-Sasl-enc: CUwGDIJQbzBOCnB2MtrtrzJwL2FslTRAQdqo2wiC+W1V 1500955788
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 55B197E1DB;
 Tue, 25 Jul 2017 00:09:48 -0400 (EDT)
Message-ID: <1500955781.5179.7.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 1/2] ARM: dts: aspeed: firestone: Fix i2c
 addresses
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
Date: Tue, 25 Jul 2017 13:39:41 +0930
In-Reply-To: <20170724120935.1862-1-joel@jms.id.au>
References: <20170724120935.1862-1-joel@jms.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-wOuK7BB0f9bG5xeNeutP"
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
X-List-Received-Date: Tue, 25 Jul 2017 04:09:54 -0000


--=-wOuK7BB0f9bG5xeNeutP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2017-07-24 at 21:39 +0930, Joel Stanley wrote:
> With the 10 bit addresses we fail to probe.
>=20
> After this change, the drivers correctly probe on a Firestone system
> with this
> kernel.
>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> =C2=A0arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts | 14 +++++++-------
> =C2=A01 file changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> index fef73ea7fd0c..cc479efd1763 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> @@ -124,7 +124,7 @@
> =C2=A0
> =C2=A0	tmp423@98 {

We should fix the node name as well. Applies to any other instances
below.=09

> =C2=A0		compatible =3D "ti,tmp423";
> -		reg =3D <0x80000098>;
> +		reg =3D <0x4c>;
> =C2=A0	};
> =C2=A0};
> =C2=A0
> @@ -139,7 +139,7 @@
> =C2=A0
> =C2=A0	tmp423@98 {
> =C2=A0		compatible =3D "ti,tmp423";
> -		reg =3D <0x80000098>;
> +		reg =3D <0x4c>;

> =C2=A0	};
> =C2=A0};
> =C2=A0
> @@ -171,7 +171,7 @@
> =C2=A0
> =C2=A0	leds@c0 {
> =C2=A0		compatible =3D "pca,pca9552led";
> -		reg =3D <0x800000c0>;
> +		reg =3D <0x60>;
> =C2=A0		// led9 - led_fault_n
> =C2=A0		// led10 - pwr_led_n
> =C2=A0		// led11 - rear_id_led_n
> @@ -179,21 +179,21 @@
> =C2=A0
> =C2=A0	rtc@d0 {
> =C2=A0		compatible =3D "dallas,ds3231";
> -		reg =3D <0x800000d0>;
> +		reg =3D <0x68>;
> =C2=A0	};
> =C2=A0
> =C2=A0	si5338a@e2 {
> =C2=A0		// SiLabs clock generator
> -		reg =3D<0x800000e2>;
> +		reg =3D<0x71>;
> =C2=A0	};
> =C2=A0
> =C2=A0	idt@d6 {
> =C2=A0		// IDT 9DBV0641 clock buffer
> -		reg =3D <0x800000d6>;
> +		reg =3D <0x6b>;
> =C2=A0	};
> =C2=A0
> =C2=A0	tpm@a3 {
> -		reg =3D <0x800000a3>;

This is weird though right? Usually the 0th bit is cleared (7 bits
counted from the 7th bit, 0th bit ignored), but in this case it's set.
Seems something was broken with the address to start with?

> +		reg =3D <0x51>;

So is this the right address?

> =C2=A0	};
> =C2=A0};
> =C2=A0
--=-wOuK7BB0f9bG5xeNeutP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZdsSFAAoJEJ0dnzgO5LT5AskP/2WKi5MCePsSp5LIka8VaYUR
sjVdQ9ijCKzj0iPNXP26dOLoOa4t1nWffyxGVOeX1AxR/QN1imQspGzi4eev64MJ
EjzzMoQWw0Ovof2/B7uYN1OYeinmvQRTaIIflMm7a7EqDty4ShjuS1FVPll6oj1o
djrAmHwAooV8gsTtiEQtSUDde9qDGkAh/xBbbWEhB0IHBzzNiFVwpmh6WybtnfPv
8m6c6M58McYtMMmZixCBX+tWfU1VSqyDukMGuwZLPKJqBY7riqD/gxN0xJkKhYc0
969RltFqCrf/KxQTj6Aw6IRiniPlrhVrEJ9lE+pBnCMnmJJaCCuzqz1c5v5mlUZu
1Fz8+0delmtIfzVztGU3c/O1jMIB2CWJ2Iwl7yNUx+NiMo9Z/X/y/W20li9lTkXY
HIkHU7J7mKM7RVYjAZOrGx6PjVtuzjo8OWvJRri3gwchXscq0qmQHRKyX5mZfTJa
KzVVnD8eMH4t15FzT5MmB+WKwuiB331F9BWD0Ad28nbFyW60wxitTWnKh0ETmV+A
KfNl8v9Nt/5ZrpjhBF3zDh4hlfnnq0TjMvoAEIcBvQkcZ3Mo/Tg5l90vvxhRDDY/
2MmeuocS7w8VnXmGj9Kil97k6gt9xxvhVWg1oyWIPp8z0Bu29FlUqnOxN0xVp5Qs
Nhvxg/KlPSnMY1m4xgDg
=IPCe
-----END PGP SIGNATURE-----

--=-wOuK7BB0f9bG5xeNeutP--
