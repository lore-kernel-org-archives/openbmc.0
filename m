Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wcK0v6RbYzDq5x
 for <openbmc@lists.ozlabs.org>; Tue, 30 May 2017 13:32:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="PpN5JWdw"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="K19jKnWZ"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 06871206E4;
 Mon, 29 May 2017 23:32:13 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Mon, 29 May 2017 23:32:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=vo5070os3W0kcGboU/qfjUJIbLxq5qWvB4SUrJF6f
 4c=; b=PpN5JWdwq6jLmLKmOLCdHxVsLc8NYJSBsCG/JPmknOgsI71VxjG6KdOms
 4QkUb/Q0/78g/FoY21m+Nfx/Y0tx4Ce1ihj8DgYmgBIcmnmmt1rAJL/+qX65uRpq
 8sg1qr+9ufTyn/obuFAq3MhmtgNEXgkokWUKezWtAP6TaOesDNSE507VVNGh2GEh
 Vp5OTe9ri0Nec1xXmJ57bPFDDef4xYeVUEUtX7ZCmVD5xtuvTFTZjOs+7uG5DZDO
 0dTb2Ibzng5wkwgJ4NfwJTgGZJ5MfpP9MGCFLzdNEWqpu89ONIozfSDyGaCXx7Xy
 2Ychu9h1mTWTVHvjQkVGgFD9mXgbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=vo5070os3W0kcGboU/
 qfjUJIbLxq5qWvB4SUrJF6f4c=; b=K19jKnWZFXOV/m65HXmq5kK4H4Vmpx5wgJ
 VITQivkCDeGqDQr5US1P+emUmLC2vjDHf6zKL/shhWyMX9a73KR4IyDwcZRz9EPe
 wG+8zqICvxbp2KwQjXKkPEFJ16lDCliYzJuBXM+BpBumIc6oYQlaceGhQ9Q3tgsL
 4znaGm2mu+2iFXR0qbz07kFQdd65d/I5uxAUl0iqD36p7cvmcYAEgqr6MHgNT+me
 ECZUy4yeYMvsoP5yG1pUEWz8ktXgSYqR3zgtQ2YupF4S+2bwGyrw5PbdHWXalOhI
 izPRtCL3OEnubI/QEF8O5TJf1TGyatkXXqolrWcP7dv73zZYYF2g==
X-ME-Sender: <xms:vOcsWSnGND8HuyZ8AF7TuR39TD64rnsZXX4AaBonNYE2YMM-ywrUTA>
X-Sasl-enc: Mf3NsHfBQ76Oat7jZlleBAav/ylvSfua29F/4ZUAjsff 1496115132
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2DF0E240F6;
 Mon, 29 May 2017 23:32:10 -0400 (EDT)
Message-ID: <1496115127.8159.7.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v3] ARM: aspeed: Add Mellanox MSN machine
 (device tree)
From: Andrew Jeffery <andrew@aj.id.au>
To: Mykola Kostenok <c_mykolak@mellanox.com>, Joel Stanley <joel@jms.id.au>,
 openbmc@lists.ozlabs.org
Date: Tue, 30 May 2017 13:02:07 +0930
In-Reply-To: <20170529135431.65427-1-c_mykolak@mellanox.com>
References: <20170529135431.65427-1-c_mykolak@mellanox.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-pKZ8O/lhWJGgTl+WW1fT"
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
X-List-Received-Date: Tue, 30 May 2017 03:32:16 -0000


--=-pKZ8O/lhWJGgTl+WW1fT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mykola,

One comment about the i2c nodes below.

On Mon, 2017-05-29 at 16:54 +0300, Mykola Kostenok wrote:
> Initial introduction of Mellanox switches of MSNXXXX family equipped
> with Aspeed 2520 BMC SoC. This adds msn platform device tree file.
>=20
> > Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>
> ---
> v1->v2
> Fixed issues pointed out by Joel:
> - Make commit title shorter.
> - Replace flash layout from separate dtsi to dts.
> - Change compatible =3D "mellanox,msnxxxx-bmc" to "mellanox,msn-bmc".
> - Remove no-hw-checksum from dts.
> - Add comments.
> - Remove WD2 disable from aspeed.c
> - Add wdt2 to dts.
>=20
> v2->v3
> Fixed issues pointed out by Joel:
> - Split v2 patch into three separate.
> - Remove unnesesary include in dts.
> - Replace flash layout to separate dsti.
> - Remove spi2 as it was disabled.
> - Add uart1 pinctrl.
> ---
> =C2=A0.../devicetree/bindings/vendor-prefixes.txt=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A0=C2=A01 +
> =C2=A0arch/arm/boot/dts/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A0=C2=A01 +
> =C2=A0.../dts/aspeed-bmc-mellanox-msn-flash-layout.dtsi=C2=A0=C2=A0|=C2=
=A0=C2=A032 ++++
> =C2=A0arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0| 192 +++++++++++++++++++++
> =C2=A04 files changed, 226 insertions(+)
> =C2=A0create mode 100644 arch/arm/boot/dts/aspeed-bmc-mellanox-msn-flash-=
layout.dtsi
> =C2=A0create mode 100644 arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
>=20
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Docu=
mentation/devicetree/bindings/vendor-prefixes.txt
> index 16d3b5e7f5d1..84601d869a1b 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> > @@ -172,6 +172,7 @@ meas	Measurement Specialties
> > =C2=A0mediatek	MediaTek Inc.
> > =C2=A0melexis	Melexis N.V.
> > =C2=A0melfas	MELFAS Inc.
> > +mellanox	Mellanox Technologies
> > =C2=A0memsic	MEMSIC Inc.
> > =C2=A0merrii	Merrii Technology Co., Ltd.
> > =C2=A0micrel	Micrel Inc.
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 30fe65627f30..3dba6c633686 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -990,6 +990,7 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D aspeed-bmc-opp-palmett=
o.dtb \
> > =C2=A0	aspeed-bmc-opp-witherspoon.dtb \
> > =C2=A0	aspeed-bmc-opp-zaius.dtb \
> > =C2=A0	aspeed-bmc-opp-lanyang.dtb \
> > +	aspeed-bmc-mellanox-msn.dtb \
> > =C2=A0	aspeed-ast2500-evb.dtb
> =C2=A0endif
> =C2=A0
> diff --git a/arch/arm/boot/dts/aspeed-bmc-mellanox-msn-flash-layout.dtsi =
b/arch/arm/boot/dts/aspeed-bmc-mellanox-msn-flash-layout.dtsi
> new file mode 100644
> index 000000000000..cf8ee54f13c2
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-mellanox-msn-flash-layout.dtsi
> @@ -0,0 +1,32 @@
> +/* This file is the label for the bmc primary flash and its partitions *=
/
> > +				label =3D "bmc";
> > +				#address-cells =3D < 1 >;
> > +				#size-cells =3D < 1 >;
> > +				u-boot {
> > +					reg =3D < 0 0x60000 >;
> > +					label =3D "u-boot";
> > +				};
> > +				u-boot-env {
> > +					reg =3D < 0x60000 0x10000>;
> > +					label =3D "u-boot-env";
> > +				};
> > +				kernel=C2=A0=C2=A0{
> > +					reg =3D < 0x70000 0x280000 >;
> > +					label =3D "kernel";
> > +				};
> > +				dtb=C2=A0=C2=A0{
> > +					reg =3D < 0x2f0000 0x10000 >;
> > +					label =3D "dtb";
> > +				};
> > +				initramfs {
> > +					reg =3D < 0x300000 0x1c0000 >;
> > +					label =3D "initramfs";
> > +				};
> > +				rofs=C2=A0=C2=A0{
> > +					reg =3D < 0x4c0000 0x1740000 >;
> > +					label =3D "rofs";
> > +				};
> > +				rwfs=C2=A0=C2=A0{
> > +					reg =3D < 0x1c00000 0x400000 >;
> > +					label =3D "rwfs";
> > +				};
> diff --git a/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts b/arch/arm/boo=
t/dts/aspeed-bmc-mellanox-msn.dts
> new file mode 100644
> index 000000000000..4c69caf08111
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
> @@ -0,0 +1,192 @@
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +#include "aspeed-g5.dtsi"
> +
> +/ {
> > +	model =3D "MSN BMC";
> > +	compatible =3D "mellanox,msn-bmc", "aspeed,ast2500";
> +
> > +	aliases {
> > +		serial0 =3D &uart1;
> > +		serial4 =3D &uart5;
> > +	};
> +
> > +	chosen {
> > +		stdout-path =3D &uart5;
> > +		bootargs =3D "console=3DttyS4,115200n8 earlyprintk";
> > +	};
> +
> > +	memory {
> > +		/* 512MiB SDRAM DDR4 @ 0x8000_0000 */
> > +		reg =3D <0x80000000 0x20000000>;
> > +	};
> +
> > +	ahb {
> > > +		bmc_pnor: fmc@1e620000 {
> > +			reg =3D < 0x1e620000 0xc4
> > +				0x20000000 0x02000000 >;
> > +			#address-cells =3D <1>;
> > +			#size-cells =3D <0>;
> > +			compatible =3D "aspeed,ast2500-fmc";
> > +			interrupts =3D <19>;
> > +			flash@0 {
> > +				reg =3D < 0 >;
> > +				compatible =3D "jedec,spi-nor" ;
> +#include "aspeed-bmc-mellanox-msn-flash-layout.dtsi"
> > +			};
> > +		};
> > +	};
> +};
> +
> +&uart5 {
> > +	status =3D "okay";
> +};
> +
> +&uart1 {
> > +	status =3D "okay";
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&pinctrl_txd1_default
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&pinctrl_rxd1_default
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&pinctrl_nrts1_default
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&pinctrl_ndtr1_default
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&pinctrl_ndsr1_default
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&pinctrl_ncts1_default
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&pinctrl_ndcd1_default
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&pinctrl_nri1_default>;
> +};

These pinctrl properties looks fine to me.

> +
> +&mac0 {
> > +	status =3D "okay";
> > +	use-ncsi;
> +};
> +
> +&i2c0 {
> > +	status =3D "okay";
> +};
> +
> +&i2c1 {
> > +	status =3D "okay";
> +};
> +
> +&i2c2 {
> > +	status =3D "okay";
> +};
> +
> +&i2c3 {
> > +	status =3D "okay";
> +};
> +
> +&i2c4 {
> > +	status =3D "okay";
> +};
> +

See my comment on v2 about i2c aliasing. It is however cosmetic, both
approaches should give the same result for what you want to achieve.

Cheers,

Andrew

> +&i2c5 {
> > +	status =3D "okay";
> +
> > +	eeprom@50 {
> > +		compatible =3D "atmel,24c32";
> > +		reg =3D <0x50>;
> > +	};
> +
> > +	eeprom@51 {
> > +		compatible =3D "atmel,24c32";
> > +		reg =3D <0x51>;
> > +	};
> +};
> +
> +&i2c6 {
> > +	status =3D "okay";
> +
> > +	eeprom@51 {
> > +		compatible =3D "atmel,24c32";
> > +		reg =3D <0x51>;
> > +	};
> +
> > +	eeprom@52 {
> > +		compatible =3D "atmel,24c32";
> > +		reg =3D <0x52>;
> > +	};
> +
> > +	eeprom@55 {
> > +		compatible =3D "atmel,24c32";
> > +		reg =3D <0x55>;
> > +	};
> +
> > +	i2cswitch@71 {
> > +		compatible =3D "nxp,pca9548";
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +		reg =3D <0x71>;
> > +	};
> +};
> +
> +&i2c7 {
> > +	status =3D "okay";
> +};
> +
> +&i2c8 {
> > +	status =3D "okay";
> +
> > > +	carrier_ambient: lm75@49 {
> > +		#thermal-sensor-cells =3D <0>;
> > +		compatible =3D "national,lm75";
> > +		reg =3D <0x49>;
> > +	};
> +
> > > +	swbrd_ambient: lm75@4a {
> > +		#thermal-sensor-cells =3D <0>;
> > +		compatible =3D "national,lm75";
> > +		reg =3D <0x4a>;
> > +	};
> +};
> +
> +&i2c9 {
> > +	status =3D "okay";
> +};
> +
> +&i2c10 {
> > +	status =3D "okay";
> +
> > +	hwmon@41 {
> > +		compatible =3D "ti,ucd9224";
> > +		reg =3D <0x41>;
> > +	};
> +
> > +	hwmon@27 {
> > +		compatible =3D "ti,ucd9224";
> > +		reg =3D <0x27>;
> > +	};
> +
> > +	adc@6d {
> > +		compatible =3D "maxim,max11603";
> > +		reg =3D <0x6d>;
> > > +		adc0: iio-device@0 {
> > +			#io-channel-cells =3D <1>;
> > +			io-channels =3D <&adc0 0>, <&adc0 1>, <&adc0 2>,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<&adc0 3>, <&adc0 4>, <&adc0 5=
>,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<&adc0 6>, <&adc0 7>;
> > +		};
> > +	};
> +};
> +
> +&i2c11 {
> > +	status =3D "okay";
> +};
> +
> +&i2c12 {
> > +	status =3D "okay";
> +};
> +
> +&i2c13 {
> > +	status =3D "okay";
> +};
> +
> +&vuart {
> > +	status =3D "okay";
> +};
> +
> +&wdt2 {
> > +	status =3D "okay";
> +};
> +
--=-pKZ8O/lhWJGgTl+WW1fT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZLOe4AAoJEJ0dnzgO5LT5E48P/1b7T6QEPzEKkLce/zwVIZ9P
V9gq+keH5MmecwW5L2b7Q74MZXzOc0Am4TqXSlvqsaoXbX/pkVQ/UE1NkAnBiN4Z
KR1hkxdJyj3Q3KhfrfjlpF7yDrY/ARhVyClEdtmJBUiJQKTnH5ZRs4ZDHMKdmQjv
0iitqf76J/g99CJnWmNV8fNbGfUvI1qoecRrci3VCXCZJpdoTXASN2v+msbia7r6
ihonegKOqoqx2x6OWTi0BT72NL0FdCYLtwqjSxYVWYf8i/jlNlBoRS0aIwwnxL3t
ef/W5FFZ7yfeCvvzkhBNjque7Mj+u7qMsYuIeB71VSEX1fx2/moNnETPxtWGLV36
hSvxJ5d1RQDjk9gxxhvVcy/j8ovIQP6nUFbh/n9eEgp9I/b58VdSyqqd7aZJbmiO
Abn3xZlO5t22m1aHOrmvKbKGcG4RIIFmYeAmSx1IAfXvXC0YgcRC09jLkgjEggvm
9NIQRtf3vhSwIaGQvJvzVNnzLnbl7JNZcROvSc7MMbDDtwND1lnCP/+RHeFyBIEd
qfV9s4GhJfX8fK7E3N8uzcp84TgavK8tgOwbbxNgwk3GC7VzzxKFSMohCRk1p/6q
VQiR5pDAv/MS8hTMtww6YlUmuRbVHEs2QZelLteXX+vKu/NtJ4SiHWgsS5CsVXzB
gx9ItQlMqi7PRzT6rIsY
=WnvC
-----END PGP SIGNATURE-----

--=-pKZ8O/lhWJGgTl+WW1fT--
