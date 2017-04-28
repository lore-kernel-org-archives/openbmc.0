Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wDZx268CjzDq5b
 for <openbmc@lists.ozlabs.org>; Fri, 28 Apr 2017 10:50:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Qccebs2a"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="nWgZmpC3"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9E71220A70;
 Thu, 27 Apr 2017 20:50:27 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 27 Apr 2017 20:50:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=5mxSYSQmqKa5FMqKff7SCSMa6NoQiYn59FEZhTSfm
 do=; b=Qccebs2aSfHZP6P9cfHDNS8d8AnypiOkTpWef8pU0f9Amz5CRMPB/qtmU
 CjdqG8NhwY7kMVnBOYN5BnWNXWZtW+I5pwL/Ep+RFhQIlJaaw7CKoknoIkJs4naZ
 Akyj8+vhopzXUDgLyx86TA1b3BFRP1cNynetLJWZpuSNt3o11N7TsWbIno+04wvJ
 YNWNKaVAyZwlsJa91jL3KxaI3cZD8wXMrzrLz3ufk16DbKVrv7ZNKYwIAGSPkRmG
 7Qbl4aAwvb0e3IgLIqueCwBj9Uj5F3hRRncB8imjLJUEZxev0VBVcTOpC5CQtFWM
 4zD3suMX+KIzb+ck40KzxCXlpEgFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=5mxSYSQmqKa5FMqKff
 7SCSMa6NoQiYn59FEZhTSfmdo=; b=nWgZmpC3ldfE3y5fGA1PwsoH8PKPO+nj8E
 DK8fR83o98+NgEasEL+EbsuwR37ua/gaIaJ4twPhjT7UQ4RoSuKvRbATETkhSE0N
 bXAbq42026syRY9OBmc6bSYCQ+Z8m8XXHke2A21t4SCJL0yeHpdmB1aZ9fpulFt7
 EMqMBOD7jgLuBmToQ8OUYod+5lCSVRGZHeSOE1stGhv0pQiGWLzJheWPfDZhMBal
 5Oga0l/1jpLWngn8SkPEIrcZ8cug4Fl75fp45bLydk9RL3eJo80LzarcHZh7026X
 nsJHATimKxPV6HDCuy0kmglQ41pbxMNqk97xNBdaUz0GOvrL2atQ==
X-ME-Sender: <xms:05ECWcjscu_QA24cH-dJFMZhkYGQj7AQMWC9ZxbWQBYkFU8gxqBCxA>
X-Sasl-enc: Nv4ZyavjDS5L6mAPlkJhq2hNkFSzU6FPihvzCHgWcdB9 1493340626
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id B638E7E352;
 Thu, 27 Apr 2017 20:50:25 -0400 (EDT)
Message-ID: <1493340619.4433.6.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v2] ARM: dts: aspeed: Update i2c binding
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
Cc: Brendan Higgins <brendanhiggins@google.com>
Date: Fri, 28 Apr 2017 10:20:19 +0930
In-Reply-To: <20170427144319.23130-1-joel@jms.id.au>
References: <20170427144319.23130-1-joel@jms.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-KfdX3HvNv6vug5fdjEPS"
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
X-List-Received-Date: Fri, 28 Apr 2017 00:50:33 -0000


--=-KfdX3HvNv6vug5fdjEPS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-04-28 at 00:13 +0930, Joel Stanley wrote:
> The I2C binding changed when upstreaming the I2C driver.
>=20
> This adds aliases for the 14 built-in I2C busses to ensure userspace
> sees the numbering that we had with the old driver.
>=20
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>=20
> Boot tested on qemu-palmetto. We see the same i2c entries under /dev as b=
efore,
> so the aliases work. Note that we can't use qemu for testing with the new
> driver, tracked at https://github.com/openbmc/qemu/issues/5
>=20
> =C2=A0arch/arm/boot/dts/aspeed-g4.dtsi | 173 ++++++++++++++++++++++------=
------
> =C2=A0arch/arm/boot/dts/aspeed-g5.dtsi | 197 +++++++++++++++++++++++++---=
-----------
> =C2=A02 files changed, 241 insertions(+), 129 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-=
g4.dtsi
> index b9a6730cc831..f7767b999791 100644
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
> @@ -958,200 +975,240 @@
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
> +
> > > +				i2c_ic: interrupt-controller@0 {
> > +					#interrupt-cells =3D <1>;
> > +					compatible =3D "aspeed,ast2400-i2c-ic";
> > +					reg =3D <0x0 0x40>;
> > +					interrupts =3D <12>;
> > +					interrupt-controller;
> > +				};
> =C2=A0
> > > =C2=A0				i2c0: i2c-bus@40 {
> > =C2=A0					#address-cells =3D <1>;
> > =C2=A0					#size-cells =3D <0>;
> > +					#interrupt-cells =3D <1>;
> +
> > =C2=A0					reg =3D <0x40 0x40>;
> > =C2=A0					compatible =3D "aspeed,ast2400-i2c-bus";
> > -					bus =3D <0>;
> > -					clock-frequency =3D <100000>;
> > -					status =3D "disabled";
> > +					clocks =3D <&clk_apb>;
> > +					bus-frequency =3D <100000>;
> > =C2=A0					interrupts =3D <0>;
> > -					interrupt-parent =3D <&i2c>;
> > +					interrupt-parent =3D <&i2c_ic>;
> > +					status =3D "disabled";
> > =C2=A0					/* Does not need pinctrl node */
> > =C2=A0				};
> =C2=A0
> > > =C2=A0				i2c1: i2c-bus@80 {
> > =C2=A0					#address-cells =3D <1>;
> > =C2=A0					#size-cells =3D <0>;
> > +					#interrupt-cells =3D <1>;
> +
> > =C2=A0					reg =3D <0x80 0x40>;
> > =C2=A0					compatible =3D "aspeed,ast2400-i2c-bus";
> > -					bus =3D <1>;
> > -					clock-frequency =3D <100000>;
> > -					status =3D "disabled";
> > +					clocks =3D <&clk_apb>;
> > +					bus-frequency =3D <100000>;
> > =C2=A0					interrupts =3D <1>;
> > +					interrupt-parent =3D <&i2c_ic>;
> > +					status =3D "disabled";
> > =C2=A0					/* Does not need pinctrl node */
> > =C2=A0				};
> =C2=A0
> > > =C2=A0				i2c2: i2c-bus@c0 {
> > =C2=A0					#address-cells =3D <1>;
> > =C2=A0					#size-cells =3D <0>;
> > -					reg =3D <0xC0 0x40>;
> > +					#interrupt-cells =3D <1>;
> +
> > +					reg =3D <0xc0 0x40>;
> > =C2=A0					compatible =3D "aspeed,ast2400-i2c-bus";
> > -					bus =3D <2>;
> > -					clock-frequency =3D <100000>;
> > -					status =3D "disabled";
> > +					clocks =3D <&clk_apb>;
> > +					bus-frequency =3D <100000>;
> > =C2=A0					interrupts =3D <2>;
> > -					pinctrl-names =3D "default";
> -					pinctrl-0 =3D <&pinctrl_i2c3_default>;

We still need the pinctrl properties.

> +					interrupt-parent =3D <&i2c_ic>;
> > +					status =3D "disabled";
> > +					/* Does not need pinctrl node */
> > =C2=A0				};
> =C2=A0
> > > =C2=A0				i2c3: i2c-bus@100 {
> > =C2=A0					#address-cells =3D <1>;
> > =C2=A0					#size-cells =3D <0>;
> > +					#interrupt-cells =3D <1>;
> +
> > =C2=A0					reg =3D <0x100 0x40>;
> > =C2=A0					compatible =3D "aspeed,ast2400-i2c-bus";
> > -					bus =3D <3>;
> > -					clock-frequency =3D <100000>;
> > -					status =3D "disabled";
> > +					clocks =3D <&clk_apb>;
> > +					bus-frequency =3D <100000>;
> > =C2=A0					interrupts =3D <3>;
> > +					interrupt-parent =3D <&i2c_ic>;
> > =C2=A0					pinctrl-names =3D "default";
> > =C2=A0					pinctrl-0 =3D <&pinctrl_i2c4_default>;
> > +					status =3D "disabled";
> > =C2=A0				};
> =C2=A0
> > > =C2=A0				i2c4: i2c-bus@140 {
> > =C2=A0					#address-cells =3D <1>;
> > =C2=A0					#size-cells =3D <0>;
> > +					#interrupt-cells =3D <1>;
> +
> > =C2=A0					reg =3D <0x140 0x40>;
> > =C2=A0					compatible =3D "aspeed,ast2400-i2c-bus";
> > -					bus =3D <4>;
> > -					clock-frequency =3D <100000>;
> > -					status =3D "disabled";
> > +					clocks =3D <&clk_apb>;
> > +					bus-frequency =3D <100000>;
> > =C2=A0					interrupts =3D <4>;
> > +					interrupt-parent =3D <&i2c_ic>;
> > =C2=A0					pinctrl-names =3D "default";
> > =C2=A0					pinctrl-0 =3D <&pinctrl_i2c5_default>;
> > +					status =3D "disabled";
> > =C2=A0				};
> =C2=A0
> > > =C2=A0				i2c5: i2c-bus@180 {
> > =C2=A0					#address-cells =3D <1>;
> > =C2=A0					#size-cells =3D <0>;
> > +					#interrupt-cells =3D <1>;
> +
> > =C2=A0					reg =3D <0x180 0x40>;
> > =C2=A0					compatible =3D "aspeed,ast2400-i2c-bus";
> > -					bus =3D <5>;
> > -					clock-frequency =3D <100000>;
> > -					status =3D "disabled";
> > +					clocks =3D <&clk_apb>;
> > +					bus-frequency =3D <100000>;
> > =C2=A0					interrupts =3D <5>;
> > +					interrupt-parent =3D <&i2c_ic>;
> > =C2=A0					pinctrl-names =3D "default";
> > =C2=A0					pinctrl-0 =3D <&pinctrl_i2c6_default>;
> > +					status =3D "disabled";
> > =C2=A0				};
> =C2=A0
> > > =C2=A0				i2c6: i2c-bus@1c0 {
> > =C2=A0					#address-cells =3D <1>;
> > =C2=A0					#size-cells =3D <0>;
> > -					reg =3D <0x1C0 0x40>;
> > +					#interrupt-cells =3D <1>;
> +
> > +					reg =3D <0x1c0 0x40>;
> > =C2=A0					compatible =3D "aspeed,ast2400-i2c-bus";
> > -					bus =3D <6>;
> > -					clock-frequency =3D <100000>;
> > -					status =3D "disabled";
> > +					clocks =3D <&clk_apb>;
> > +					bus-frequency =3D <100000>;
> > =C2=A0					interrupts =3D <6>;
> > +					interrupt-parent =3D <&i2c_ic>;
> > =C2=A0					pinctrl-names =3D "default";
> > =C2=A0					pinctrl-0 =3D <&pinctrl_i2c7_default>;
> > +					status =3D "disabled";
> > =C2=A0				};
> =C2=A0
> > > =C2=A0				i2c7: i2c-bus@300 {
> > =C2=A0					#address-cells =3D <1>;
> > =C2=A0					#size-cells =3D <0>;
> > +					#interrupt-cells =3D <1>;
> +
> > =C2=A0					reg =3D <0x300 0x40>;
> > =C2=A0					compatible =3D "aspeed,ast2400-i2c-bus";
> > -					bus =3D <7>;
> > -					clock-frequency =3D <100000>;
> > -					status =3D "disabled";
> > +					clocks =3D <&clk_apb>;
> > +					bus-frequency =3D <100000>;
> > =C2=A0					interrupts =3D <7>;
> > +					interrupt-parent =3D <&i2c_ic>;
> > =C2=A0					pinctrl-names =3D "default";
> > =C2=A0					pinctrl-0 =3D <&pinctrl_i2c8_default>;
> > +					status =3D "disabled";
> > =C2=A0				};
> =C2=A0
> > > =C2=A0				i2c8: i2c-bus@340 {
> > =C2=A0					#address-cells =3D <1>;
> > =C2=A0					#size-cells =3D <0>;
> > +					#interrupt-cells =3D <1>;
> +
> > =C2=A0					reg =3D <0x340 0x40>;
> > =C2=A0					compatible =3D "aspeed,ast2400-i2c-bus";
> > -					bus =3D <8>;
> > -					clock-frequency =3D <100000>;
> > -					status =3D "disabled";
> > +					clocks =3D <&clk_apb>;
> > +					bus-frequency =3D <100000>;
> > =C2=A0					interrupts =3D <8>;
> > +					interrupt-parent =3D <&i2c_ic>;
> > =C2=A0					pinctrl-names =3D "default";
> > =C2=A0					pinctrl-0 =3D <&pinctrl_i2c9_default>;
> > +					status =3D "disabled";
> > =C2=A0				};
> =C2=A0
> > > =C2=A0				i2c9: i2c-bus@380 {
> > =C2=A0					#address-cells =3D <1>;
> > =C2=A0					#size-cells =3D <0>;
> > +					#interrupt-cells =3D <1>;
> +
> > =C2=A0					reg =3D <0x380 0x40>;
> > =C2=A0					compatible =3D "aspeed,ast2400-i2c-bus";
> > -					bus =3D <9>;
> > -					clock-frequency =3D <100000>;
> > -					status =3D "disabled";
> > +					clocks =3D <&clk_apb>;
> > +					bus-frequency =3D <100000>;
> > =C2=A0					interrupts =3D <9>;
> > +					interrupt-parent =3D <&i2c_ic>;
> > =C2=A0					pinctrl-names =3D "default";
> > =C2=A0					pinctrl-0 =3D <&pinctrl_i2c10_default>;
> > +					status =3D "disabled";
> > =C2=A0				};
> =C2=A0
> > > =C2=A0				i2c10: i2c-bus@3c0 {
> > =C2=A0					#address-cells =3D <1>;
> > =C2=A0					#size-cells =3D <0>;
> > +					#interrupt-cells =3D <1>;
> +
> > =C2=A0					reg =3D <0x3c0 0x40>;
> > =C2=A0					compatible =3D "aspeed,ast2400-i2c-bus";
> > -					bus =3D <10>;
> > -					clock-frequency =3D <100000>;
> > -					status =3D "disabled";
> > +					clocks =3D <&clk_apb>;
> > +					bus-frequency =3D <100000>;
> > =C2=A0					interrupts =3D <10>;
> > +					interrupt-parent =3D <&i2c_ic>;
> > =C2=A0					pinctrl-names =3D "default";
> > =C2=A0					pinctrl-0 =3D <&pinctrl_i2c11_default>;
> > +					status =3D "disabled";
> > =C2=A0				};
> =C2=A0
> > > =C2=A0				i2c11: i2c-bus@400 {
> > =C2=A0					#address-cells =3D <1>;
> > =C2=A0					#size-cells =3D <0>;
> > +					#interrupt-cells =3D <1>;
> +
> > =C2=A0					reg =3D <0x400 0x40>;
> > =C2=A0					compatible =3D "aspeed,ast2400-i2c-bus";
> > -					bus =3D <11>;
> > -					clock-frequency =3D <100000>;
> > -					status =3D "disabled";
> > +					clocks =3D <&clk_apb>;
> > +					bus-frequency =3D <100000>;
> > =C2=A0					interrupts =3D <11>;
> > +					interrupt-parent =3D <&i2c_ic>;
> > =C2=A0					pinctrl-names =3D "default";
> > =C2=A0					pinctrl-0 =3D <&pinctrl_i2c12_default>;
> > +					status =3D "disabled";
> > =C2=A0				};
> =C2=A0
> > > =C2=A0				i2c12: i2c-bus@440 {
> > =C2=A0					#address-cells =3D <1>;
> > =C2=A0					#size-cells =3D <0>;
> > +					#interrupt-cells =3D <1>;
> +
> > =C2=A0					reg =3D <0x440 0x40>;
> > =C2=A0					compatible =3D "aspeed,ast2400-i2c-bus";
> > -					bus =3D <12>;
> > -					clock-frequency =3D <100000>;
> > -					status =3D "disabled";
> > +					clocks =3D <&clk_apb>;
> > +					bus-frequency =3D <100000>;
> > =C2=A0					interrupts =3D <12>;
> > +					interrupt-parent =3D <&i2c_ic>;
> > =C2=A0					pinctrl-names =3D "default";
> > =C2=A0					pinctrl-0 =3D <&pinctrl_i2c13_default>;
> > +					status =3D "disabled";
> > =C2=A0				};
> =C2=A0
> > > =C2=A0				i2c13: i2c-bus@480 {
> > =C2=A0					#address-cells =3D <1>;
> > =C2=A0					#size-cells =3D <0>;
> > +					#interrupt-cells =3D <1>;
> +
> > =C2=A0					reg =3D <0x480 0x40>;
> > =C2=A0					compatible =3D "aspeed,ast2400-i2c-bus";
> > -					bus =3D <13>;
> > -					clock-frequency =3D <100000>;
> > -					status =3D "disabled";
> > +					clocks =3D <&clk_apb>;
> > +					bus-frequency =3D <100000>;
> > =C2=A0					interrupts =3D <13>;
> > -					/* Does not need pinctrl node */
> > +					interrupt-parent =3D <&i2c_ic>;
> > +					pinctrl-names =3D "default";
> > +					pinctrl-0 =3D <&pinctrl_i2c14_default>;
> > +					status =3D "disabled";
> > =C2=A0				};
> -
> > =C2=A0			};
> -
> > =C2=A0		};
> > =C2=A0	};
> =C2=A0};
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-=
g5.dtsi
> index ddfb729bb85a..6aef4b7fa529 100644
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
> @@ -1149,199 +1166,237 @@
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
> +
> > > +				i2c_ic: interrupt-controller@0 {
> > +					#interrupt-cells =3D <1>;
> > +					compatible =3D "aspeed,ast2500-i2c-ic";
> > +					reg =3D <0x0 0x40>;
> > +					interrupts =3D <12>;
> > +					interrupt-controller;
> > +				};
> =C2=A0
> > > =C2=A0				i2c0: i2c-bus@40 {
> > =C2=A0					#address-cells =3D <1>;
> > =C2=A0					#size-cells =3D <0>;
> > +					#interrupt-cells =3D <1>;
> +
> > =C2=A0					reg =3D <0x40 0x40>;
> > -					compatible =3D "aspeed,ast2400-i2c-bus";
> > -					bus =3D <0>;
> > -					clock-frequency =3D <100000>;
> > -					status =3D "disabled";
> > +					compatible =3D "aspeed,ast2500-i2c-bus";
> > +					clocks =3D <&clk_apb>;
> > +					bus-frequency =3D <100000>;
> > =C2=A0					interrupts =3D <0>;
> > -					interrupt-parent =3D <&i2c>;
> > +					interrupt-parent =3D <&i2c_ic>;
> > +					status =3D "disabled";
> > =C2=A0				};
> =C2=A0
> > > =C2=A0				i2c1: i2c-bus@80 {
> > =C2=A0					#address-cells =3D <1>;
> > =C2=A0					#size-cells =3D <0>;
> > +					#interrupt-cells =3D <1>;
> +
> > =C2=A0					reg =3D <0x80 0x40>;
> > -					compatible =3D "aspeed,ast2400-i2c-bus";
> > -					bus =3D <1>;
> > -					clock-frequency =3D <100000>;
> > -					status =3D "disabled";
> > +					compatible =3D "aspeed,ast2500-i2c-bus";
> > +					clocks =3D <&clk_apb>;
> > +					bus-frequency =3D <100000>;
> > =C2=A0					interrupts =3D <1>;
> > +					interrupt-parent =3D <&i2c_ic>;
> > +					status =3D "disabled";
> > =C2=A0				};
> =C2=A0
> > > =C2=A0				i2c2: i2c-bus@c0 {
> > =C2=A0					#address-cells =3D <1>;
> > =C2=A0					#size-cells =3D <0>;
> > -					reg =3D <0xC0 0x40>;
> > -					compatible =3D "aspeed,ast2400-i2c-bus";
> > -					bus =3D <2>;
> > -					clock-frequency =3D <100000>;
> > -					status =3D "disabled";
> > +					#interrupt-cells =3D <1>;
> +
> > +					reg =3D <0xc0 0x40>;
> > +					compatible =3D "aspeed,ast2500-i2c-bus";
> > +					clocks =3D <&clk_apb>;
> > +					bus-frequency =3D <100000>;
> > =C2=A0					interrupts =3D <2>;
> > -					pinctrl-names =3D "default";
> -					pinctrl-0 =3D <&pinctrl_i2c3_default>;

Again, we still need the pinctrl properties.

> +					interrupt-parent =3D <&i2c_ic>;
> > +					status =3D "disabled";
> > =C2=A0				};
> =C2=A0
> > > =C2=A0				i2c3: i2c-bus@100 {
> > =C2=A0					#address-cells =3D <1>;
> > =C2=A0					#size-cells =3D <0>;
> > +					#interrupt-cells =3D <1>;
> +
> > =C2=A0					reg =3D <0x100 0x40>;
> > -					compatible =3D "aspeed,ast2400-i2c-bus";
> > -					bus =3D <3>;
> > -					clock-frequency =3D <100000>;
> > -					status =3D "disabled";
> > +					compatible =3D "aspeed,ast2500-i2c-bus";
> > +					clocks =3D <&clk_apb>;
> > +					bus-frequency =3D <100000>;
> > =C2=A0					interrupts =3D <3>;
> > +					interrupt-parent =3D <&i2c_ic>;
> > =C2=A0					pinctrl-names =3D "default";
> > =C2=A0					pinctrl-0 =3D <&pinctrl_i2c4_default>;
> > +					status =3D "disabled";
> > =C2=A0				};
> =C2=A0
> > > =C2=A0				i2c4: i2c-bus@140 {
> > =C2=A0					#address-cells =3D <1>;
> > =C2=A0					#size-cells =3D <0>;
> > +					#interrupt-cells =3D <1>;
> +
> > =C2=A0					reg =3D <0x140 0x40>;
> > -					compatible =3D "aspeed,ast2400-i2c-bus";
> > -					bus =3D <4>;
> > -					clock-frequency =3D <100000>;
> > -					status =3D "disabled";
> > +					compatible =3D "aspeed,ast2500-i2c-bus";
> > +					clocks =3D <&clk_apb>;
> > +					bus-frequency =3D <100000>;
> > =C2=A0					interrupts =3D <4>;
> > +					interrupt-parent =3D <&i2c_ic>;
> > =C2=A0					pinctrl-names =3D "default";
> > =C2=A0					pinctrl-0 =3D <&pinctrl_i2c5_default>;
> > +					status =3D "disabled";
> > =C2=A0				};
> =C2=A0
> > > =C2=A0				i2c5: i2c-bus@180 {
> > =C2=A0					#address-cells =3D <1>;
> > =C2=A0					#size-cells =3D <0>;
> > +					#interrupt-cells =3D <1>;
> +
> > =C2=A0					reg =3D <0x180 0x40>;
> > -					compatible =3D "aspeed,ast2400-i2c-bus";
> > -					bus =3D <5>;
> > -					clock-frequency =3D <100000>;
> > -					status =3D "disabled";
> > +					compatible =3D "aspeed,ast2500-i2c-bus";
> > +					clocks =3D <&clk_apb>;
> > +					bus-frequency =3D <100000>;
> > =C2=A0					interrupts =3D <5>;
> > +					interrupt-parent =3D <&i2c_ic>;
> > =C2=A0					pinctrl-names =3D "default";
> > =C2=A0					pinctrl-0 =3D <&pinctrl_i2c6_default>;
> > +					status =3D "disabled";
> > =C2=A0				};
> =C2=A0
> > > =C2=A0				i2c6: i2c-bus@1c0 {
> > =C2=A0					#address-cells =3D <1>;
> > =C2=A0					#size-cells =3D <0>;
> > -					reg =3D <0x1C0 0x40>;
> > -					compatible =3D "aspeed,ast2400-i2c-bus";
> > -					bus =3D <6>;
> > -					clock-frequency =3D <100000>;
> > -					status =3D "disabled";
> > +					#interrupt-cells =3D <1>;
> +
> > +					reg =3D <0x1c0 0x40>;
> > +					compatible =3D "aspeed,ast2500-i2c-bus";
> > +					clocks =3D <&clk_apb>;
> > +					bus-frequency =3D <100000>;
> > =C2=A0					interrupts =3D <6>;
> > +					interrupt-parent =3D <&i2c_ic>;
> > =C2=A0					pinctrl-names =3D "default";
> > =C2=A0					pinctrl-0 =3D <&pinctrl_i2c7_default>;
> > +					status =3D "disabled";
> > =C2=A0				};
> =C2=A0
> > > =C2=A0				i2c7: i2c-bus@300 {
> > =C2=A0					#address-cells =3D <1>;
> > =C2=A0					#size-cells =3D <0>;
> > +					#interrupt-cells =3D <1>;
> +
> > =C2=A0					reg =3D <0x300 0x40>;
> > -					compatible =3D "aspeed,ast2400-i2c-bus";
> > -					bus =3D <7>;
> > -					clock-frequency =3D <100000>;
> > -					status =3D "disabled";
> > +					compatible =3D "aspeed,ast2500-i2c-bus";
> > +					clocks =3D <&clk_apb>;
> > +					bus-frequency =3D <100000>;
> > =C2=A0					interrupts =3D <7>;
> > +					interrupt-parent =3D <&i2c_ic>;
> > =C2=A0					pinctrl-names =3D "default";
> > =C2=A0					pinctrl-0 =3D <&pinctrl_i2c8_default>;
> > +					status =3D "disabled";
> > =C2=A0				};
> =C2=A0
> > > =C2=A0				i2c8: i2c-bus@340 {
> > =C2=A0					#address-cells =3D <1>;
> > =C2=A0					#size-cells =3D <0>;
> > +					#interrupt-cells =3D <1>;
> +
> > =C2=A0					reg =3D <0x340 0x40>;
> > -					compatible =3D "aspeed,ast2400-i2c-bus";
> > -					bus =3D <8>;
> > -					clock-frequency =3D <100000>;
> > -					status =3D "disabled";
> > +					compatible =3D "aspeed,ast2500-i2c-bus";
> > +					clocks =3D <&clk_apb>;
> > +					bus-frequency =3D <100000>;
> > =C2=A0					interrupts =3D <8>;
> > +					interrupt-parent =3D <&i2c_ic>;
> > =C2=A0					pinctrl-names =3D "default";
> > =C2=A0					pinctrl-0 =3D <&pinctrl_i2c9_default>;
> > +					status =3D "disabled";
> > =C2=A0				};
> =C2=A0
> > > =C2=A0				i2c9: i2c-bus@380 {
> > =C2=A0					#address-cells =3D <1>;
> > =C2=A0					#size-cells =3D <0>;
> > +					#interrupt-cells =3D <1>;
> +
> > =C2=A0					reg =3D <0x380 0x40>;
> > -					compatible =3D "aspeed,ast2400-i2c-bus";
> > -					bus =3D <9>;
> > -					clock-frequency =3D <100000>;
> > -					status =3D "disabled";
> > +					compatible =3D "aspeed,ast2500-i2c-bus";
> > +					clocks =3D <&clk_apb>;
> > +					bus-frequency =3D <100000>;
> > =C2=A0					interrupts =3D <9>;
> > +					interrupt-parent =3D <&i2c_ic>;
> > =C2=A0					pinctrl-names =3D "default";
> > =C2=A0					pinctrl-0 =3D <&pinctrl_i2c10_default>;
> > +					status =3D "disabled";
> > =C2=A0				};
> =C2=A0
> > > =C2=A0				i2c10: i2c-bus@3c0 {
> > =C2=A0					#address-cells =3D <1>;
> > =C2=A0					#size-cells =3D <0>;
> > +					#interrupt-cells =3D <1>;
> +
> > =C2=A0					reg =3D <0x3c0 0x40>;
> > -					compatible =3D "aspeed,ast2400-i2c-bus";
> > -					bus =3D <10>;
> > -					clock-frequency =3D <100000>;
> > -					status =3D "disabled";
> > +					compatible =3D "aspeed,ast2500-i2c-bus";
> > +					clocks =3D <&clk_apb>;
> > +					bus-frequency =3D <100000>;
> > =C2=A0					interrupts =3D <10>;
> > +					interrupt-parent =3D <&i2c_ic>;
> > =C2=A0					pinctrl-names =3D "default";
> > =C2=A0					pinctrl-0 =3D <&pinctrl_i2c11_default>;
> > +					status =3D "disabled";
> > =C2=A0				};
> =C2=A0
> > > =C2=A0				i2c11: i2c-bus@400 {
> > =C2=A0					#address-cells =3D <1>;
> > =C2=A0					#size-cells =3D <0>;
> > +					#interrupt-cells =3D <1>;
> +
> > =C2=A0					reg =3D <0x400 0x40>;
> > -					compatible =3D "aspeed,ast2400-i2c-bus";
> > -					bus =3D <11>;
> > -					clock-frequency =3D <100000>;
> > -					status =3D "disabled";
> > +					compatible =3D "aspeed,ast2500-i2c-bus";
> > +					clocks =3D <&clk_apb>;
> > +					bus-frequency =3D <100000>;
> > =C2=A0					interrupts =3D <11>;
> > +					interrupt-parent =3D <&i2c_ic>;
> > =C2=A0					pinctrl-names =3D "default";
> > =C2=A0					pinctrl-0 =3D <&pinctrl_i2c12_default>;
> > +					status =3D "disabled";
> > =C2=A0				};
> =C2=A0
> > > =C2=A0				i2c12: i2c-bus@440 {
> > =C2=A0					#address-cells =3D <1>;
> > =C2=A0					#size-cells =3D <0>;
> > +					#interrupt-cells =3D <1>;
> +
> > =C2=A0					reg =3D <0x440 0x40>;
> > -					compatible =3D "aspeed,ast2400-i2c-bus";
> > -					bus =3D <12>;
> > -					clock-frequency =3D <100000>;
> > -					status =3D "disabled";
> > +					compatible =3D "aspeed,ast2500-i2c-bus";
> > +					clocks =3D <&clk_apb>;
> > +					bus-frequency =3D <100000>;
> > =C2=A0					interrupts =3D <12>;
> > +					interrupt-parent =3D <&i2c_ic>;
> > =C2=A0					pinctrl-names =3D "default";
> > =C2=A0					pinctrl-0 =3D <&pinctrl_i2c13_default>;
> > +					status =3D "disabled";
> > =C2=A0				};
> =C2=A0
> > > =C2=A0				i2c13: i2c-bus@480 {
> > =C2=A0					#address-cells =3D <1>;
> > =C2=A0					#size-cells =3D <0>;
> > +					#interrupt-cells =3D <1>;
> +
> > =C2=A0					reg =3D <0x480 0x40>;
> > -					compatible =3D "aspeed,ast2400-i2c-bus";
> > -					bus =3D <13>;
> > -					clock-frequency =3D <100000>;
> > -					status =3D "disabled";
> > +					compatible =3D "aspeed,ast2500-i2c-bus";
> > +					clocks =3D <&clk_apb>;
> > +					bus-frequency =3D <100000>;
> > =C2=A0					interrupts =3D <13>;
> > +					interrupt-parent =3D <&i2c_ic>;
> > =C2=A0					pinctrl-names =3D "default";
> > =C2=A0					pinctrl-0 =3D <&pinctrl_i2c14_default>;
> > +					status =3D "disabled";
> > =C2=A0				};
> -
> > =C2=A0			};
> -
> > =C2=A0		};
> > =C2=A0	};
> =C2=A0};

Overall, should we give the i2c nodes the same treatment in store for
the pinctrl nodes? That is, flatten the file out by moving them to an
&i2c { }; section down the bottom to get them out of the way? It's all
pretty tedious and a bit of a distraction from the other interesting
parts of the structure.

Cheers,

Andrew
--=-KfdX3HvNv6vug5fdjEPS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZApHLAAoJEJ0dnzgO5LT58cgP/j5rvSvX7KC4T6zNGJsqeys+
B7SIdXJ1cr5Zin0MkvX6Z8niAM9jZwR/iJNhA2QWp+jGsmIu2dwmqqvI8ngcux8j
TaarRWQKaiObUu8MM0wzWgSjbNuV0hK315ncL+rhEma3k3dZ5aEeADNiFaRH4NFI
f0fXNSRwoC69VfZfIg0AwKGMHp6uAk8UoZlE/SDxSeL5LqdNPKKL9h7iyAkXUut2
C05N0iu8UF5I7pv+3VzTfm8eIydDEGOcROFT/uCLl7htEpx5JT/gdnhraq6jOS1L
P2cAw7D80Jp4wv3kUkTON/CyuoWm13o+r9j2fJ5YF83vUDhrMUnMcn/ysxG0Bq1e
lqqNy1mIYWfHbaIdb0Br0uJBxskqvcee2JmUQpP0NuSjpyvbHsfFIwNziHml2qq9
Cgi1FjzotBExH9rUkbJpfUrW3y8hidT1+P5eGuEJsEb3VpxkFVtNRc2uaEXtz2Z7
4VEAW2R3blXn2C9O4xnmQnVN1tlQxHRVncTdkdqQVsVIVOWKihAz5YDy9ewK0qW1
8XQW5KcYaXCNMXqW6UAVK8oAX5ZuO7dBBqA7O5zMxB9/oLMWqxwSgJIIKmkYSxw7
e+PGZQoQWMvY/fLUErSRe6EtAmZqeq75ucY2fX6qkszWInuMIDeI+b8lPtuBhShn
7khe8KVuvgQXglqPr+2+
=qbay
-----END PGP SIGNATURE-----

--=-KfdX3HvNv6vug5fdjEPS--
