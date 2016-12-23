Return-Path: <andrew@aj.id.au>
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tl98P3q9WzDwMr
 for <openbmc@lists.ozlabs.org>; Fri, 23 Dec 2016 12:01:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="d3FWbxK5"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="MwheZKtq"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9AEE520717;
 Thu, 22 Dec 2016 20:01:54 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 22 Dec 2016 20:01:54 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=aAiuA7Avl9nefashbOmMWTFfhp4=; b=d3FWbx
 K5ZcNNUK0qOMDQfT0AlXDtgLqnxIFZSfk5JoRsZk7uDtEAOabwLMDVGv6pZ3iQwz
 cbHyLzUmasbpvrVjocZWjnoZaCfrTY0HjB1RRZ4XCyJEuhIjFvbPK7ImlN+VIBES
 i1okhBkNw/0crr8vyM5h2TOS684FA08l3UhnQ=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=aAiuA7Avl9nefa
 shbOmMWTFfhp4=; b=MwheZKtqn3HFU6wnZD84ON3WGRYKtT/mb0K736SONqIFWy
 aJGzy15F5WbsHptrZRYvqSDhmHfn8I6HEML0kCPve5YCmTcaCiOHcAR/DHDWcomd
 9ZVPRM52cXaQb5glJ/8utLsfXaGjYveX7FQ58d5eeJLDkQMXTyJKF26YCmWMY=
X-ME-Sender: <xms:gndcWDxVXkB-1JkMKUqc0yxHtSD91SqN_tPdAQoIhB7BCEiEakAVfQ>
X-Sasl-enc: dxsrAQHvRq+vGTGsMWJJwJZ/HtZt6noETTn89WFkaImS 1482454913
Received: from [172.16.172.59] (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id A73C77E87F;
 Thu, 22 Dec 2016 20:01:52 -0500 (EST)
Message-ID: <1482454906.3419.24.camel@aj.id.au>
Subject: Re: [PATCH v2 1/5] ARM: dts: aspeed: Reserve BMC ram for host to
 BMC communication
From: Andrew Jeffery <andrew@aj.id.au>
To: Cyril Bur <cyrilbur@gmail.com>, openbmc@lists.ozlabs.org
Cc: millerjo@linux.vnet.ibm.com
Date: Fri, 23 Dec 2016 11:31:46 +1030
In-Reply-To: <20161222060610.29695-2-cyrilbur@gmail.com>
References: <20161222060610.29695-1-cyrilbur@gmail.com>
 <20161222060610.29695-2-cyrilbur@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-2R6Gm8QfV9L5fLWqBiPk"
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
X-List-Received-Date: Fri, 23 Dec 2016 01:01:59 -0000


--=-2R6Gm8QfV9L5fLWqBiPk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Cyril,

On Thu, 2016-12-22 at 17:06 +1100, Cyril Bur wrote:
> > Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
> ---
> =C2=A0arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts | 12 ++++++++++++
> =C2=A0arch/arm/boot/dts/aspeed-g4.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A06 ++++++
> =C2=A02 files changed, 18 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boo=
t/dts/aspeed-bmc-opp-palmetto.dts
> index 13e9f18fbed8..b60044800ea1 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> @@ -29,6 +29,18 @@
> > =C2=A0			no-map;
> > =C2=A0			reg =3D <0x5f000000 0x01000000>; /* 16MB */
> > =C2=A0		};
> +
> > > +		flash_memory: region@54000000 {
> > +			compatible =3D "aspeed,ast2400-lpc-ctrl";
> > +			no-map;
> > +			reg =3D <0x54000000 0x04000000>; /* 64M */
> > +		};
> > +	};
> +
> > +	flash_buffer@1e789000 {
> > +		compatible =3D "aspeed,ast2400-lpc-ctrl";
> > +		memory-region =3D <&flash_memory>;
> > +		reg =3D <0x1e789000 0x8>;
> =C2=A0	};

Save this for addition in 2/5?

> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0leds {
> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-=
g4.dtsi
> index 7c78eb1c01ff..1ed2a9ba7ab8 100644
> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> @@ -870,6 +870,12 @@
> > =C2=A0				interrupts =3D <8>;
> > =C2=A0			};
> =C2=A0
> > > +			mbox: mbox@1e789200 {
> > +				compatible =3D "aspeed,ast2400-mbox";
> > +				reg =3D <0x1e789200 0x5c>;
> > +				interrupts =3D <46>;
> +			};

Save this for addition in 3/5?

Or maybe just squash them all together?

Andrew

> +
> > > =C2=A0			wdt1: wdt@1e785000 {
> > =C2=A0				compatible =3D "aspeed,ast2400-wdt";
> > =C2=A0				reg =3D <0x1e785000 0x1c>;
--=-2R6Gm8QfV9L5fLWqBiPk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYXHd6AAoJEJ0dnzgO5LT59pkP/RUH3ttC+euHHLGK5XG1ZjTP
wuBzZJ5mnSSirkPMIscUG9C1Kp5DXHPzKVIujsgRCg0xeat/Ra28uuTCV45kiGDu
6ttDiZHt6YXTyuhXcONeKbXBww16ja8QcVr1Fk3fpC9lVANT21M8bYx5gfLomY7r
rgXv3TCQv5p1FMN5DWvu3Lc1VUkvV7GAGe3i4icuDXax7wayR50icNaEaVkeKAjv
RVsFZW8tK+uKvyksAsOafzqUBUorf5TedhztxCduR47ZeX00N7AZwUKz5lkLVeg6
cx1nkUyCxF9Sho8QtimB+kWBzN1nQJjNO9T6hZ5AEdKWMXpCrl30u7AYvmsvReuY
TLz41x37ylEiAbIvlHLcspy0LdW7dWfu7VVxU8Ae82vkwR6N4GUSf898u4EmJS9+
iHfC1FxmLsCC14op+Ld2X3+WZEa3WQJ28JNr528Fm25IaOnjxFxFD5NFGXYsSmI5
OfUD8iBJh0kQT8oGqZUqjfrijw7SCaXEv2J7MDyQWhCnVJcOgqX1rOfcY+MvZ83R
0bsLZS/OVyljAGG9rts/r5wb90Do/G4wTDItML6oZgVVuGSqJ4EykrlEk71r+o+U
77UeDq/2n45toPZMb0M6ZDnmm3fI4FnbYoyeDHZsH5qTyLsTJ8p3lVJvRpSETKHG
sVJ+3WGM14+UvyjmTXTy
=GP/x
-----END PGP SIGNATURE-----

--=-2R6Gm8QfV9L5fLWqBiPk--
