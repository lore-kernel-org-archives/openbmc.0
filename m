Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wDbky3NFfzDqFr
 for <openbmc@lists.ozlabs.org>; Fri, 28 Apr 2017 11:26:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="M6563BQj"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="dzlzQt35"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 297BE209EA;
 Thu, 27 Apr 2017 21:26:48 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 27 Apr 2017 21:26:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=nTSrZHLgDznG/ds0+dPT+oZ2ghzRH9bRokCBGRnaK
 7I=; b=M6563BQj7Wy12/wIYyAGvFpnhfjJE+tJKavd5YbV72XWN1mmOrsgYimxX
 LoR+ZPIltD64ut3rZZMgIYfM741EWzEpYujHhHJiE0sFqGkCYkuqeinq6WggAjSB
 8s1Qcxc26RKMKvJd0/9Dm/EjU2eNkU9bgPXGc+HxvK5VWw3HCiCPNyKRSIjReifc
 VJYJ6NJU7hmPXFfL9I3NxG6Qm/BO4QR2/CUtfpWGccTmN1fz905pZrtQB1snB6Xt
 FIcnxUH9rnklnLGv8JyHuDdPnI0T+CH61XQx2h5j8kJozFgh6SMK6Tyj6dZGwBgc
 MK3MCwlNId9AMJVYV+EZQJfNgimsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=nTSrZHLgDznG/ds0+d
 PT+oZ2ghzRH9bRokCBGRnaK7I=; b=dzlzQt35rbuiRCLKhW8MZcPG8JfCYvfQ0/
 JaIR/h3+yt/OKda2NUfGBUk6gj71ZAZ45GG9/Wm27EJGWW8wCrmr6ZwDbpo9v/46
 N5P+AqAum+Qqd+lyUVZK0geMZMjlduiQyBbuaTckeGdKmji1aW1KtA4TmieR028h
 p4CJUH4JdT7FZpKOaBZkTb6wj6xugn8DtL3UCLkCP5oNEUagAY1rIPEkyESPN+VL
 1EDiIFszUwMsMQeixS+yFCLaV1d2CYXe1h6TWoM0kgpZrOP5nDz1aQRx+uUVYPr1
 hdBEsKpaLTgYUmcteJe2d8Qj7GHe348GoABSA33yHRR0xIIENwPw==
X-ME-Sender: <xms:WJoCWTpjW4R9ACybg8PkYxpAwLlDHz-Bbhz5O9fMSvYLR6KQhtIwXg>
X-Sasl-enc: 9hLTnbWdGDNNb6eWIKyKlzhCH/fIyHYJmKCnIaSJaTBU 1493342807
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 74BAF7E78C;
 Thu, 27 Apr 2017 21:26:46 -0400 (EDT)
Message-ID: <1493342802.4433.8.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v3] ARM: dts: aspeed: Update i2c binding
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
Cc: Brendan Higgins <brendanhiggins@google.com>
Date: Fri, 28 Apr 2017 10:56:42 +0930
In-Reply-To: <20170428011805.22513-1-joel@jms.id.au>
References: <20170428011805.22513-1-joel@jms.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-zNHM7DLTQZlv4+ZzJi5m"
X-Mailer: Evolution 3.22.6-0ubuntu0.1 
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
X-List-Received-Date: Fri, 28 Apr 2017 01:26:51 -0000


--=-zNHM7DLTQZlv4+ZzJi5m
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-04-28 at 10:48 +0930, Joel Stanley wrote:
> The I2C binding changed when upstreaming the I2C driver.
>=20
> This adds aliases for the 14 built-in I2C busses to ensure userspace
> sees the numbering that we had with the old driver.
>=20
> This change moves the description of the i2c buses to the bottom of the
> dtsi to improve readability.
>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> v2:
> =C2=A0Added i2c aliases.
>=20
> =C2=A0Boot tested on qemu-palmetto. We see the same i2c entries under /de=
v as before,
> =C2=A0so the aliases work. Note that we can't use qemu for testing with t=
he new
> =C2=A0driver, tracked at https://github.com/openbmc/qemu/issues/5
>=20
> v3:
> =C2=A0Fixed missing pinctrl properties for i2c2
>=20
> v4:
> =C2=A0No code change. Send patch with --diff-algorithm=3Dhistogram so it =
made sense
>=20
> =C2=A0arch/arm/boot/dts/aspeed-g4.dtsi | 440 ++++++++++++++++++++++------=
-----------
> =C2=A0arch/arm/boot/dts/aspeed-g5.dtsi | 439 +++++++++++++++++++++-------=
----------
> =C2=A02 files changed, 501 insertions(+), 378 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-=
g4.dtsi
> index b9a6730cc831..952e23d553f8 100644
> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> @@ -18,6 +18,23 @@
> > =C2=A0		};
> > =C2=A0	};
> =C2=A0
> > +	aliases {
> > +		i2c0 =3D &i2c0;
> > +		i2c1 =3D &i2c1;
> > +		i2c2 =3D &i2c2;
> > +		i2c3 =3D &i2c3;
> > +		i2c4 =3D &i2c4;
> > +		i2c5 =3D &i2c5;
> > +		i2c6 =3D &i2c6;
> > +		i2c7 =3D &i2c7;
> > +		i2c8 =3D &i2c8;
> > +		i2c9 =3D &i2c9;
> > +		i2c10 =3D &i2c10;
> > +		i2c11 =3D &i2c11;
> > +		i2c12 =3D &i2c12;
> > +		i2c13 =3D &i2c13;
> > +	};
> +
> > =C2=A0	clocks {
> > =C2=A0	};
> =C2=A0
> @@ -958,200 +975,245 @@
> > =C2=A0			};
> =C2=A0
> > > =C2=A0			i2c: i2c@1e78a000 {
> > +				compatible =3D "simple-bus";
> > =C2=A0				#address-cells =3D <1>;
> > =C2=A0				#size-cells =3D <1>;
> > -				#interrupt-cells =3D <1>;
> -
> > -				compatible =3D "aspeed,ast2400-i2c-controller";
> > -				reg =3D <0x1e78a000 0x40>;
> > =C2=A0				ranges =3D <0 0x1e78a000 0x1000>;
> > -				interrupts =3D <12>;
> > -				clocks =3D <&clk_apb>;
> > -				clock-ranges;
> > -				interrupt-controller;
> -
> > > -				i2c0: i2c-bus@40 {
> > -					#address-cells =3D <1>;
> > -					#size-cells =3D <0>;
> > -					reg =3D <0x40 0x40>;
> > -					compatible =3D "aspeed,ast2400-i2c-bus";
> > -					bus =3D <0>;
> > -					clock-frequency =3D <100000>;
> > -					status =3D "disabled";
> > -					interrupts =3D <0>;
> > -					interrupt-parent =3D <&i2c>;
> > -					/* Does not need pinctrl node */
> > -				};
> -
> > > -				i2c1: i2c-bus@80 {
> > -					#address-cells =3D <1>;
> > -					#size-cells =3D <0>;
> > -					reg =3D <0x80 0x40>;
> > -					compatible =3D "aspeed,ast2400-i2c-bus";
> > -					bus =3D <1>;
> > -					clock-frequency =3D <100000>;
> > -					status =3D "disabled";
> > -					interrupts =3D <1>;
> > -					/* Does not need pinctrl node */
> > -				};
> -
> > > -				i2c2: i2c-bus@c0 {
> > -					#address-cells =3D <1>;
> > -					#size-cells =3D <0>;
> > -					reg =3D <0xC0 0x40>;
> > -					compatible =3D "aspeed,ast2400-i2c-bus";
> > -					bus =3D <2>;
> > -					clock-frequency =3D <100000>;
> > -					status =3D "disabled";
> > -					interrupts =3D <2>;
> > -					pinctrl-names =3D "default";
> > -					pinctrl-0 =3D <&pinctrl_i2c3_default>;
> > -				};
> -
> > > -				i2c3: i2c-bus@100 {
> > -					#address-cells =3D <1>;
> > -					#size-cells =3D <0>;
> > -					reg =3D <0x100 0x40>;
> > -					compatible =3D "aspeed,ast2400-i2c-bus";
> > -					bus =3D <3>;
> > -					clock-frequency =3D <100000>;
> > -					status =3D "disabled";
> > -					interrupts =3D <3>;
> > -					pinctrl-names =3D "default";
> > -					pinctrl-0 =3D <&pinctrl_i2c4_default>;
> > -				};
> -
> > > -				i2c4: i2c-bus@140 {
> > -					#address-cells =3D <1>;
> > -					#size-cells =3D <0>;
> > -					reg =3D <0x140 0x40>;
> > -					compatible =3D "aspeed,ast2400-i2c-bus";
> > -					bus =3D <4>;
> > -					clock-frequency =3D <100000>;
> > -					status =3D "disabled";
> > -					interrupts =3D <4>;
> > -					pinctrl-names =3D "default";
> > -					pinctrl-0 =3D <&pinctrl_i2c5_default>;
> > -				};
> -
> > > -				i2c5: i2c-bus@180 {
> > -					#address-cells =3D <1>;
> > -					#size-cells =3D <0>;
> > -					reg =3D <0x180 0x40>;
> > -					compatible =3D "aspeed,ast2400-i2c-bus";
> > -					bus =3D <5>;
> > -					clock-frequency =3D <100000>;
> > -					status =3D "disabled";
> > -					interrupts =3D <5>;
> > -					pinctrl-names =3D "default";
> > -					pinctrl-0 =3D <&pinctrl_i2c6_default>;
> > -				};
> -
> > > -				i2c6: i2c-bus@1c0 {
> > -					#address-cells =3D <1>;
> > -					#size-cells =3D <0>;
> > -					reg =3D <0x1C0 0x40>;
> > -					compatible =3D "aspeed,ast2400-i2c-bus";
> > -					bus =3D <6>;
> > -					clock-frequency =3D <100000>;
> > -					status =3D "disabled";
> > -					interrupts =3D <6>;
> > -					pinctrl-names =3D "default";
> > -					pinctrl-0 =3D <&pinctrl_i2c7_default>;
> > -				};
> -
> > > -				i2c7: i2c-bus@300 {
> > -					#address-cells =3D <1>;
> > -					#size-cells =3D <0>;
> > -					reg =3D <0x300 0x40>;
> > -					compatible =3D "aspeed,ast2400-i2c-bus";
> > -					bus =3D <7>;
> > -					clock-frequency =3D <100000>;
> > -					status =3D "disabled";
> > -					interrupts =3D <7>;
> > -					pinctrl-names =3D "default";
> > -					pinctrl-0 =3D <&pinctrl_i2c8_default>;
> > -				};
> -
> > > -				i2c8: i2c-bus@340 {
> > -					#address-cells =3D <1>;
> > -					#size-cells =3D <0>;
> > -					reg =3D <0x340 0x40>;
> > -					compatible =3D "aspeed,ast2400-i2c-bus";
> > -					bus =3D <8>;
> > -					clock-frequency =3D <100000>;
> > -					status =3D "disabled";
> > -					interrupts =3D <8>;
> > -					pinctrl-names =3D "default";
> > -					pinctrl-0 =3D <&pinctrl_i2c9_default>;
> > -				};
> -
> > > -				i2c9: i2c-bus@380 {
> > -					#address-cells =3D <1>;
> > -					#size-cells =3D <0>;
> > -					reg =3D <0x380 0x40>;
> > -					compatible =3D "aspeed,ast2400-i2c-bus";
> > -					bus =3D <9>;
> > -					clock-frequency =3D <100000>;
> > -					status =3D "disabled";
> > -					interrupts =3D <9>;
> > -					pinctrl-names =3D "default";
> > -					pinctrl-0 =3D <&pinctrl_i2c10_default>;
> > -				};
> -
> > > -				i2c10: i2c-bus@3c0 {
> > -					#address-cells =3D <1>;
> > -					#size-cells =3D <0>;
> > -					reg =3D <0x3c0 0x40>;
> > -					compatible =3D "aspeed,ast2400-i2c-bus";
> > -					bus =3D <10>;
> > -					clock-frequency =3D <100000>;
> > -					status =3D "disabled";
> > -					interrupts =3D <10>;
> > -					pinctrl-names =3D "default";
> > -					pinctrl-0 =3D <&pinctrl_i2c11_default>;
> > -				};
> -
> > > -				i2c11: i2c-bus@400 {
> > -					#address-cells =3D <1>;
> > -					#size-cells =3D <0>;
> > -					reg =3D <0x400 0x40>;
> > -					compatible =3D "aspeed,ast2400-i2c-bus";
> > -					bus =3D <11>;
> > -					clock-frequency =3D <100000>;
> > -					status =3D "disabled";
> > -					interrupts =3D <11>;
> > -					pinctrl-names =3D "default";
> > -					pinctrl-0 =3D <&pinctrl_i2c12_default>;
> > -				};
> -
> > > -				i2c12: i2c-bus@440 {
> > -					#address-cells =3D <1>;
> > -					#size-cells =3D <0>;
> > -					reg =3D <0x440 0x40>;
> > -					compatible =3D "aspeed,ast2400-i2c-bus";
> > -					bus =3D <12>;
> > -					clock-frequency =3D <100000>;
> > -					status =3D "disabled";
> > -					interrupts =3D <12>;
> > -					pinctrl-names =3D "default";
> > -					pinctrl-0 =3D <&pinctrl_i2c13_default>;
> > -				};
> -
> > > -				i2c13: i2c-bus@480 {
> > -					#address-cells =3D <1>;
> > -					#size-cells =3D <0>;
> > -					reg =3D <0x480 0x40>;
> > -					compatible =3D "aspeed,ast2400-i2c-bus";
> > -					bus =3D <13>;
> > -					clock-frequency =3D <100000>;
> > -					status =3D "disabled";
> > -					interrupts =3D <13>;
> > -					/* Does not need pinctrl node */
> > -				};
> -
> > =C2=A0			};
> =C2=A0
> +
> > =C2=A0		};
> > =C2=A0	};
> =C2=A0};
> +
> +&i2c {
> > > +	i2c_ic: interrupt-controller@0 {
> > +		#interrupt-cells =3D <1>;
> > +		compatible =3D "aspeed,ast2400-i2c-ic";
> > +		reg =3D <0x0 0x40>;
> > +		interrupts =3D <12>;
> > +		interrupt-controller;
> > +	};
> +
> > > +	i2c0: i2c-bus@40 {
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +		#interrupt-cells =3D <1>;
> +
> > +		reg =3D <0x40 0x40>;
> > +		compatible =3D "aspeed,ast2400-i2c-bus";
> > +		clocks =3D <&clk_apb>;
> > +		bus-frequency =3D <100000>;
> > +		interrupts =3D <0>;
> > +		interrupt-parent =3D <&i2c_ic>;
> > +		status =3D "disabled";
> > +		/* Does not need pinctrl properties */
> > +	};
> +
> > > +	i2c1: i2c-bus@80 {
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +		#interrupt-cells =3D <1>;
> +
> > +		reg =3D <0x80 0x40>;
> > +		compatible =3D "aspeed,ast2400-i2c-bus";
> > +		clocks =3D <&clk_apb>;
> > +		bus-frequency =3D <100000>;
> > +		interrupts =3D <1>;
> > +		interrupt-parent =3D <&i2c_ic>;
> > +		status =3D "disabled";
> > +		/* Does not need pinctrl properties */
> > +	};
> +
> > > +	i2c2: i2c-bus@c0 {
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +		#interrupt-cells =3D <1>;
> +
> > +		reg =3D <0xc0 0x40>;
> > +		compatible =3D "aspeed,ast2400-i2c-bus";
> > +		clocks =3D <&clk_apb>;
> > +		bus-frequency =3D <100000>;
> > +		interrupts =3D <2>;
> > +		interrupt-parent =3D <&i2c_ic>;
> > +		status =3D "disabled";
> > +		pinctrl-names =3D "default";
> > +		pinctrl-0 =3D <&pinctrl_i2c3_default>;
> > +	};
> +
> > > +	i2c3: i2c-bus@100 {
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +		#interrupt-cells =3D <1>;
> +
> > +		reg =3D <0x100 0x40>;
> > +		compatible =3D "aspeed,ast2400-i2c-bus";
> > +		clocks =3D <&clk_apb>;
> > +		bus-frequency =3D <100000>;
> > +		interrupts =3D <3>;
> > +		interrupt-parent =3D <&i2c_ic>;
> > +		pinctrl-names =3D "default";
> > +		pinctrl-0 =3D <&pinctrl_i2c4_default>;
> > +		status =3D "disabled";
> > +	};
> +
> > > +	i2c4: i2c-bus@140 {
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +		#interrupt-cells =3D <1>;
> +
> > +		reg =3D <0x140 0x40>;
> > +		compatible =3D "aspeed,ast2400-i2c-bus";
> > +		clocks =3D <&clk_apb>;
> > +		bus-frequency =3D <100000>;
> > +		interrupts =3D <4>;
> > +		interrupt-parent =3D <&i2c_ic>;
> > +		pinctrl-names =3D "default";
> > +		pinctrl-0 =3D <&pinctrl_i2c5_default>;
> > +		status =3D "disabled";
> > +	};
> +
> > > +	i2c5: i2c-bus@180 {
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +		#interrupt-cells =3D <1>;
> +
> > +		reg =3D <0x180 0x40>;
> > +		compatible =3D "aspeed,ast2400-i2c-bus";
> > +		clocks =3D <&clk_apb>;
> > +		bus-frequency =3D <100000>;
> > +		interrupts =3D <5>;
> > +		interrupt-parent =3D <&i2c_ic>;
> > +		pinctrl-names =3D "default";
> > +		pinctrl-0 =3D <&pinctrl_i2c6_default>;
> > +		status =3D "disabled";
> > +	};
> +
> > > +	i2c6: i2c-bus@1c0 {
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +		#interrupt-cells =3D <1>;
> +
> > +		reg =3D <0x1c0 0x40>;
> > +		compatible =3D "aspeed,ast2400-i2c-bus";
> > +		clocks =3D <&clk_apb>;
> > +		bus-frequency =3D <100000>;
> > +		interrupts =3D <6>;
> > +		interrupt-parent =3D <&i2c_ic>;
> > +		pinctrl-names =3D "default";
> > +		pinctrl-0 =3D <&pinctrl_i2c7_default>;
> > +		status =3D "disabled";
> > +	};
> +
> > > +	i2c7: i2c-bus@300 {
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +		#interrupt-cells =3D <1>;
> +
> > +		reg =3D <0x300 0x40>;
> > +		compatible =3D "aspeed,ast2400-i2c-bus";
> > +		clocks =3D <&clk_apb>;
> > +		bus-frequency =3D <100000>;
> > +		interrupts =3D <7>;
> > +		interrupt-parent =3D <&i2c_ic>;
> > +		pinctrl-names =3D "default";
> > +		pinctrl-0 =3D <&pinctrl_i2c8_default>;
> > +		status =3D "disabled";
> > +	};
> +
> > > +	i2c8: i2c-bus@340 {
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +		#interrupt-cells =3D <1>;
> +
> > +		reg =3D <0x340 0x40>;
> > +		compatible =3D "aspeed,ast2400-i2c-bus";
> > +		clocks =3D <&clk_apb>;
> > +		bus-frequency =3D <100000>;
> > +		interrupts =3D <8>;
> > +		interrupt-parent =3D <&i2c_ic>;
> > +		pinctrl-names =3D "default";
> > +		pinctrl-0 =3D <&pinctrl_i2c9_default>;
> > +		status =3D "disabled";
> > +	};
> +
> > > +	i2c9: i2c-bus@380 {
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +		#interrupt-cells =3D <1>;
> +
> > +		reg =3D <0x380 0x40>;
> > +		compatible =3D "aspeed,ast2400-i2c-bus";
> > +		clocks =3D <&clk_apb>;
> > +		bus-frequency =3D <100000>;
> > +		interrupts =3D <9>;
> > +		interrupt-parent =3D <&i2c_ic>;
> > +		pinctrl-names =3D "default";
> > +		pinctrl-0 =3D <&pinctrl_i2c10_default>;
> > +		status =3D "disabled";
> > +	};
> +
> > > +	i2c10: i2c-bus@3c0 {
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +		#interrupt-cells =3D <1>;
> +
> > +		reg =3D <0x3c0 0x40>;
> > +		compatible =3D "aspeed,ast2400-i2c-bus";
> > +		clocks =3D <&clk_apb>;
> > +		bus-frequency =3D <100000>;
> > +		interrupts =3D <10>;
> > +		interrupt-parent =3D <&i2c_ic>;
> > +		pinctrl-names =3D "default";
> > +		pinctrl-0 =3D <&pinctrl_i2c11_default>;
> > +		status =3D "disabled";
> > +	};
> +
> > > +	i2c11: i2c-bus@400 {
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +		#interrupt-cells =3D <1>;
> +
> > +		reg =3D <0x400 0x40>;
> > +		compatible =3D "aspeed,ast2400-i2c-bus";
> > +		clocks =3D <&clk_apb>;
> > +		bus-frequency =3D <100000>;
> > +		interrupts =3D <11>;
> > +		interrupt-parent =3D <&i2c_ic>;
> > +		pinctrl-names =3D "default";
> > +		pinctrl-0 =3D <&pinctrl_i2c12_default>;
> > +		status =3D "disabled";
> > +	};
> +
> > > +	i2c12: i2c-bus@440 {
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +		#interrupt-cells =3D <1>;
> +
> > +		reg =3D <0x440 0x40>;
> > +		compatible =3D "aspeed,ast2400-i2c-bus";
> > +		clocks =3D <&clk_apb>;
> > +		bus-frequency =3D <100000>;
> > +		interrupts =3D <12>;
> > +		interrupt-parent =3D <&i2c_ic>;
> > +		pinctrl-names =3D "default";
> > +		pinctrl-0 =3D <&pinctrl_i2c13_default>;
> > +		status =3D "disabled";
> > +	};
> +
> > > +	i2c13: i2c-bus@480 {
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +		#interrupt-cells =3D <1>;
> +
> > +		reg =3D <0x480 0x40>;
> > +		compatible =3D "aspeed,ast2400-i2c-bus";
> > +		clocks =3D <&clk_apb>;
> > +		bus-frequency =3D <100000>;
> > +		interrupts =3D <13>;
> > +		interrupt-parent =3D <&i2c_ic>;
> > +		pinctrl-names =3D "default";
> > +		pinctrl-0 =3D <&pinctrl_i2c14_default>;
> > +		status =3D "disabled";
> > +	};
> +};
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-=
g5.dtsi
> index ddfb729bb85a..905edd7b83ae 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -18,6 +18,23 @@
> > =C2=A0		};
> > =C2=A0	};
> =C2=A0
> > +	aliases {
> > +		i2c0 =3D &i2c0;
> > +		i2c1 =3D &i2c1;
> > +		i2c2 =3D &i2c2;
> > +		i2c3 =3D &i2c3;
> > +		i2c4 =3D &i2c4;
> > +		i2c5 =3D &i2c5;
> > +		i2c6 =3D &i2c6;
> > +		i2c7 =3D &i2c7;
> > +		i2c8 =3D &i2c8;
> > +		i2c9 =3D &i2c9;
> > +		i2c10 =3D &i2c10;
> > +		i2c11 =3D &i2c11;
> > +		i2c12 =3D &i2c12;
> > +		i2c13 =3D &i2c13;
> > +	};
> +
> > =C2=A0	ahb {
> > =C2=A0		compatible =3D "simple-bus";
> > =C2=A0		#address-cells =3D <1>;
> @@ -1149,199 +1166,243 @@
> > =C2=A0			};
> =C2=A0
> > > =C2=A0			i2c: i2c@1e78a000 {
> > +				compatible =3D "simple-bus";
> > =C2=A0				#address-cells =3D <1>;
> > =C2=A0				#size-cells =3D <1>;
> > -				#interrupt-cells =3D <1>;
> -
> > -				compatible =3D "aspeed,ast2400-i2c-controller";
> > -				reg =3D <0x1e78a000 0x40>;
> > =C2=A0				ranges =3D <0 0x1e78a000 0x1000>;
> > -				interrupts =3D <12>;
> > -				clocks =3D <&clk_apb>;
> > -				clock-ranges;
> > -				interrupt-controller;
> -
> > > -				i2c0: i2c-bus@40 {
> > -					#address-cells =3D <1>;
> > -					#size-cells =3D <0>;
> > -					reg =3D <0x40 0x40>;
> > -					compatible =3D "aspeed,ast2400-i2c-bus";
> > -					bus =3D <0>;
> > -					clock-frequency =3D <100000>;
> > -					status =3D "disabled";
> > -					interrupts =3D <0>;
> > -					interrupt-parent =3D <&i2c>;
> > -				};
> -
> > > -				i2c1: i2c-bus@80 {
> > -					#address-cells =3D <1>;
> > -					#size-cells =3D <0>;
> > -					reg =3D <0x80 0x40>;
> > -					compatible =3D "aspeed,ast2400-i2c-bus";
> > -					bus =3D <1>;
> > -					clock-frequency =3D <100000>;
> > -					status =3D "disabled";
> > -					interrupts =3D <1>;
> > -				};
> -
> > > -				i2c2: i2c-bus@c0 {
> > -					#address-cells =3D <1>;
> > -					#size-cells =3D <0>;
> > -					reg =3D <0xC0 0x40>;
> > -					compatible =3D "aspeed,ast2400-i2c-bus";
> > -					bus =3D <2>;
> > -					clock-frequency =3D <100000>;
> > -					status =3D "disabled";
> > -					interrupts =3D <2>;
> > -					pinctrl-names =3D "default";
> > -					pinctrl-0 =3D <&pinctrl_i2c3_default>;
> > -				};
> -
> > > -				i2c3: i2c-bus@100 {
> > -					#address-cells =3D <1>;
> > -					#size-cells =3D <0>;
> > -					reg =3D <0x100 0x40>;
> > -					compatible =3D "aspeed,ast2400-i2c-bus";
> > -					bus =3D <3>;
> > -					clock-frequency =3D <100000>;
> > -					status =3D "disabled";
> > -					interrupts =3D <3>;
> > -					pinctrl-names =3D "default";
> > -					pinctrl-0 =3D <&pinctrl_i2c4_default>;
> > -				};
> -
> > > -				i2c4: i2c-bus@140 {
> > -					#address-cells =3D <1>;
> > -					#size-cells =3D <0>;
> > -					reg =3D <0x140 0x40>;
> > -					compatible =3D "aspeed,ast2400-i2c-bus";
> > -					bus =3D <4>;
> > -					clock-frequency =3D <100000>;
> > -					status =3D "disabled";
> > -					interrupts =3D <4>;
> > -					pinctrl-names =3D "default";
> > -					pinctrl-0 =3D <&pinctrl_i2c5_default>;
> > -				};
> -
> > > -				i2c5: i2c-bus@180 {
> > -					#address-cells =3D <1>;
> > -					#size-cells =3D <0>;
> > -					reg =3D <0x180 0x40>;
> > -					compatible =3D "aspeed,ast2400-i2c-bus";
> > -					bus =3D <5>;
> > -					clock-frequency =3D <100000>;
> > -					status =3D "disabled";
> > -					interrupts =3D <5>;
> > -					pinctrl-names =3D "default";
> > -					pinctrl-0 =3D <&pinctrl_i2c6_default>;
> > -				};
> -
> > > -				i2c6: i2c-bus@1c0 {
> > -					#address-cells =3D <1>;
> > -					#size-cells =3D <0>;
> > -					reg =3D <0x1C0 0x40>;
> > -					compatible =3D "aspeed,ast2400-i2c-bus";
> > -					bus =3D <6>;
> > -					clock-frequency =3D <100000>;
> > -					status =3D "disabled";
> > -					interrupts =3D <6>;
> > -					pinctrl-names =3D "default";
> > -					pinctrl-0 =3D <&pinctrl_i2c7_default>;
> > -				};
> -
> > > -				i2c7: i2c-bus@300 {
> > -					#address-cells =3D <1>;
> > -					#size-cells =3D <0>;
> > -					reg =3D <0x300 0x40>;
> > -					compatible =3D "aspeed,ast2400-i2c-bus";
> > -					bus =3D <7>;
> > -					clock-frequency =3D <100000>;
> > -					status =3D "disabled";
> > -					interrupts =3D <7>;
> > -					pinctrl-names =3D "default";
> > -					pinctrl-0 =3D <&pinctrl_i2c8_default>;
> > -				};
> -
> > > -				i2c8: i2c-bus@340 {
> > -					#address-cells =3D <1>;
> > -					#size-cells =3D <0>;
> > -					reg =3D <0x340 0x40>;
> > -					compatible =3D "aspeed,ast2400-i2c-bus";
> > -					bus =3D <8>;
> > -					clock-frequency =3D <100000>;
> > -					status =3D "disabled";
> > -					interrupts =3D <8>;
> > -					pinctrl-names =3D "default";
> > -					pinctrl-0 =3D <&pinctrl_i2c9_default>;
> > -				};
> -
> > > -				i2c9: i2c-bus@380 {
> > -					#address-cells =3D <1>;
> > -					#size-cells =3D <0>;
> > -					reg =3D <0x380 0x40>;
> > -					compatible =3D "aspeed,ast2400-i2c-bus";
> > -					bus =3D <9>;
> > -					clock-frequency =3D <100000>;
> > -					status =3D "disabled";
> > -					interrupts =3D <9>;
> > -					pinctrl-names =3D "default";
> > -					pinctrl-0 =3D <&pinctrl_i2c10_default>;
> > -				};
> -
> > > -				i2c10: i2c-bus@3c0 {
> > -					#address-cells =3D <1>;
> > -					#size-cells =3D <0>;
> > -					reg =3D <0x3c0 0x40>;
> > -					compatible =3D "aspeed,ast2400-i2c-bus";
> > -					bus =3D <10>;
> > -					clock-frequency =3D <100000>;
> > -					status =3D "disabled";
> > -					interrupts =3D <10>;
> > -					pinctrl-names =3D "default";
> > -					pinctrl-0 =3D <&pinctrl_i2c11_default>;
> > -				};
> -
> > > -				i2c11: i2c-bus@400 {
> > -					#address-cells =3D <1>;
> > -					#size-cells =3D <0>;
> > -					reg =3D <0x400 0x40>;
> > -					compatible =3D "aspeed,ast2400-i2c-bus";
> > -					bus =3D <11>;
> > -					clock-frequency =3D <100000>;
> > -					status =3D "disabled";
> > -					interrupts =3D <11>;
> > -					pinctrl-names =3D "default";
> > -					pinctrl-0 =3D <&pinctrl_i2c12_default>;
> > -				};
> -
> > > -				i2c12: i2c-bus@440 {
> > -					#address-cells =3D <1>;
> > -					#size-cells =3D <0>;
> > -					reg =3D <0x440 0x40>;
> > -					compatible =3D "aspeed,ast2400-i2c-bus";
> > -					bus =3D <12>;
> > -					clock-frequency =3D <100000>;
> > -					status =3D "disabled";
> > -					interrupts =3D <12>;
> > -					pinctrl-names =3D "default";
> > -					pinctrl-0 =3D <&pinctrl_i2c13_default>;
> > -				};
> -
> > > -				i2c13: i2c-bus@480 {
> > -					#address-cells =3D <1>;
> > -					#size-cells =3D <0>;
> > -					reg =3D <0x480 0x40>;
> > -					compatible =3D "aspeed,ast2400-i2c-bus";
> > -					bus =3D <13>;
> > -					clock-frequency =3D <100000>;
> > -					status =3D "disabled";
> > -					interrupts =3D <13>;
> > -					pinctrl-names =3D "default";
> > -					pinctrl-0 =3D <&pinctrl_i2c14_default>;
> > -				};
> -
> > =C2=A0			};
> -
> > =C2=A0		};
> > =C2=A0	};
> =C2=A0};
> +
> +&i2c {
> > > +	i2c_ic: interrupt-controller@0 {
> > +		#interrupt-cells =3D <1>;
> > +		compatible =3D "aspeed,ast2500-i2c-ic";
> > +		reg =3D <0x0 0x40>;
> > +		interrupts =3D <12>;
> > +		interrupt-controller;
> > +	};
> +
> > > +	i2c0: i2c-bus@40 {
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +		#interrupt-cells =3D <1>;
> +
> > +		reg =3D <0x40 0x40>;
> > +		compatible =3D "aspeed,ast2500-i2c-bus";
> > +		clocks =3D <&clk_apb>;
> > +		bus-frequency =3D <100000>;
> > +		interrupts =3D <0>;
> > +		interrupt-parent =3D <&i2c_ic>;
> > +		status =3D "disabled";
> > +		/* Does not need pinctrl properties */
> > +	};
> +
> > > +	i2c1: i2c-bus@80 {
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +		#interrupt-cells =3D <1>;
> +
> > +		reg =3D <0x80 0x40>;
> > +		compatible =3D "aspeed,ast2500-i2c-bus";
> > +		clocks =3D <&clk_apb>;
> > +		bus-frequency =3D <100000>;
> > +		interrupts =3D <1>;
> > +		interrupt-parent =3D <&i2c_ic>;
> > +		status =3D "disabled";
> > +		/* Does not need pinctrl properties */
> > +	};
> +
> > > +	i2c2: i2c-bus@c0 {
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +		#interrupt-cells =3D <1>;
> +
> > +		reg =3D <0xc0 0x40>;
> > +		compatible =3D "aspeed,ast2500-i2c-bus";
> > +		clocks =3D <&clk_apb>;
> > +		bus-frequency =3D <100000>;
> > +		interrupts =3D <2>;
> > +		interrupt-parent =3D <&i2c_ic>;
> > +		pinctrl-names =3D "default";
> > +		pinctrl-0 =3D <&pinctrl_i2c3_default>;
> > +		status =3D "disabled";
> > +	};
> +
> > > +	i2c3: i2c-bus@100 {
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +		#interrupt-cells =3D <1>;
> +
> > +		reg =3D <0x100 0x40>;
> > +		compatible =3D "aspeed,ast2500-i2c-bus";
> > +		clocks =3D <&clk_apb>;
> > +		bus-frequency =3D <100000>;
> > +		interrupts =3D <3>;
> > +		interrupt-parent =3D <&i2c_ic>;
> > +		pinctrl-names =3D "default";
> > +		pinctrl-0 =3D <&pinctrl_i2c4_default>;
> > +		status =3D "disabled";
> > +	};
> +
> > > +	i2c4: i2c-bus@140 {
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +		#interrupt-cells =3D <1>;
> +
> > +		reg =3D <0x140 0x40>;
> > +		compatible =3D "aspeed,ast2500-i2c-bus";
> > +		clocks =3D <&clk_apb>;
> > +		bus-frequency =3D <100000>;
> > +		interrupts =3D <4>;
> > +		interrupt-parent =3D <&i2c_ic>;
> > +		pinctrl-names =3D "default";
> > +		pinctrl-0 =3D <&pinctrl_i2c5_default>;
> > +		status =3D "disabled";
> > +	};
> +
> > > +	i2c5: i2c-bus@180 {
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +		#interrupt-cells =3D <1>;
> +
> > +		reg =3D <0x180 0x40>;
> > +		compatible =3D "aspeed,ast2500-i2c-bus";
> > +		clocks =3D <&clk_apb>;
> > +		bus-frequency =3D <100000>;
> > +		interrupts =3D <5>;
> > +		interrupt-parent =3D <&i2c_ic>;
> > +		pinctrl-names =3D "default";
> > +		pinctrl-0 =3D <&pinctrl_i2c6_default>;
> > +		status =3D "disabled";
> > +	};
> +
> > > +	i2c6: i2c-bus@1c0 {
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +		#interrupt-cells =3D <1>;
> +
> > +		reg =3D <0x1c0 0x40>;
> > +		compatible =3D "aspeed,ast2500-i2c-bus";
> > +		clocks =3D <&clk_apb>;
> > +		bus-frequency =3D <100000>;
> > +		interrupts =3D <6>;
> > +		interrupt-parent =3D <&i2c_ic>;
> > +		pinctrl-names =3D "default";
> > +		pinctrl-0 =3D <&pinctrl_i2c7_default>;
> > +		status =3D "disabled";
> > +	};
> +
> > > +	i2c7: i2c-bus@300 {
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +		#interrupt-cells =3D <1>;
> +
> > +		reg =3D <0x300 0x40>;
> > +		compatible =3D "aspeed,ast2500-i2c-bus";
> > +		clocks =3D <&clk_apb>;
> > +		bus-frequency =3D <100000>;
> > +		interrupts =3D <7>;
> > +		interrupt-parent =3D <&i2c_ic>;
> > +		pinctrl-names =3D "default";
> > +		pinctrl-0 =3D <&pinctrl_i2c8_default>;
> > +		status =3D "disabled";
> > +	};
> +
> > > +	i2c8: i2c-bus@340 {
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +		#interrupt-cells =3D <1>;
> +
> > +		reg =3D <0x340 0x40>;
> > +		compatible =3D "aspeed,ast2500-i2c-bus";
> > +		clocks =3D <&clk_apb>;
> > +		bus-frequency =3D <100000>;
> > +		interrupts =3D <8>;
> > +		interrupt-parent =3D <&i2c_ic>;
> > +		pinctrl-names =3D "default";
> > +		pinctrl-0 =3D <&pinctrl_i2c9_default>;
> > +		status =3D "disabled";
> > +	};
> +
> > > +	i2c9: i2c-bus@380 {
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +		#interrupt-cells =3D <1>;
> +
> > +		reg =3D <0x380 0x40>;
> > +		compatible =3D "aspeed,ast2500-i2c-bus";
> > +		clocks =3D <&clk_apb>;
> > +		bus-frequency =3D <100000>;
> > +		interrupts =3D <9>;
> > +		interrupt-parent =3D <&i2c_ic>;
> > +		pinctrl-names =3D "default";
> > +		pinctrl-0 =3D <&pinctrl_i2c10_default>;
> > +		status =3D "disabled";
> > +	};
> +
> > > +	i2c10: i2c-bus@3c0 {
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +		#interrupt-cells =3D <1>;
> +
> > +		reg =3D <0x3c0 0x40>;
> > +		compatible =3D "aspeed,ast2500-i2c-bus";
> > +		clocks =3D <&clk_apb>;
> > +		bus-frequency =3D <100000>;
> > +		interrupts =3D <10>;
> > +		interrupt-parent =3D <&i2c_ic>;
> > +		pinctrl-names =3D "default";
> > +		pinctrl-0 =3D <&pinctrl_i2c11_default>;
> > +		status =3D "disabled";
> > +	};
> +
> > > +	i2c11: i2c-bus@400 {
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +		#interrupt-cells =3D <1>;
> +
> > +		reg =3D <0x400 0x40>;
> > +		compatible =3D "aspeed,ast2500-i2c-bus";
> > +		clocks =3D <&clk_apb>;
> > +		bus-frequency =3D <100000>;
> > +		interrupts =3D <11>;
> > +		interrupt-parent =3D <&i2c_ic>;
> > +		pinctrl-names =3D "default";
> > +		pinctrl-0 =3D <&pinctrl_i2c12_default>;
> > +		status =3D "disabled";
> > +	};
> +
> > > +	i2c12: i2c-bus@440 {
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +		#interrupt-cells =3D <1>;
> +
> > +		reg =3D <0x440 0x40>;
> > +		compatible =3D "aspeed,ast2500-i2c-bus";
> > +		clocks =3D <&clk_apb>;
> > +		bus-frequency =3D <100000>;
> > +		interrupts =3D <12>;
> > +		interrupt-parent =3D <&i2c_ic>;
> > +		pinctrl-names =3D "default";
> > +		pinctrl-0 =3D <&pinctrl_i2c13_default>;
> > +		status =3D "disabled";
> > +	};
> +
> > > +	i2c13: i2c-bus@480 {
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +		#interrupt-cells =3D <1>;
> +
> > +		reg =3D <0x480 0x40>;
> > +		compatible =3D "aspeed,ast2500-i2c-bus";
> > +		clocks =3D <&clk_apb>;
> > +		bus-frequency =3D <100000>;
> > +		interrupts =3D <13>;
> > +		interrupt-parent =3D <&i2c_ic>;
> > +		pinctrl-names =3D "default";
> > +		pinctrl-0 =3D <&pinctrl_i2c14_default>;
> > +		status =3D "disabled";
> > +	};
> +};
--=-zNHM7DLTQZlv4+ZzJi5m
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZAppSAAoJEJ0dnzgO5LT5IbkP/3a7jy45Frjv7aHs3L+S+ABt
5LUBJZ/kNf3kpwhqRnfRDZF+SzebL8eY9U6uVxAOTDgY+n6orSQaYO6s3p4lTtHH
RLrYDl7EQhvuJBREhcwLrJ05l4AR3f3uMtRKBD6jp3jxjMQU4IiUHnK1kJvu0mRZ
/yNmVusR0FtHV9SHXEtIVHZq+b2qLamCZ9INSLAc/BElpKZfJKU3+aZ1+bgHblo2
BlYP1aL5GaFNlryBEa8xZ+HsrGxOvxzjL9ziACukcny/4fgUv3LnKmVVqCPYJ/Mv
P4AWuRrmgXw48w2Stwe7sOU9ojD4rzW/RO4qt506x4QgAJx2OP8dAjS7+nQ10Wfr
JdDGzKWb561rdfysghFc2X3HZY2N6g6ICXQjxuDWcsXQJJO4WPj75+SRrBR35Wbg
Ceo2HMguQDhi7DMbRXm3meh5RhaOkTNcGhQaa2oJeidI3y2DdtNh2AF57acv9Iei
Ale18NnKqX3eCJwTHTHzfRzORk2mCCo5OW6UC8Nhq0mOlz8ZnxC+FszMorqC2nDn
nHYA5AptiayDaMi4zJeMK7zB0byyUnAbp5IRaPYbvT0LpK9aZWVBTA65NkT5U2Ns
EUYoAEYyjZHIVrnHdYbLJkJWtw/1b6HSKZ5USReLM2igHDnzs9b8dHFBXiyvd35x
6AiyjS2PjKNwPprESXYC
=NdOO
-----END PGP SIGNATURE-----

--=-zNHM7DLTQZlv4+ZzJi5m--
