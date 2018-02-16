Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="rNOLFm+R"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="SgtVO57H"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zjGRv2HkQzF1L4
 for <openbmc@lists.ozlabs.org>; Fri, 16 Feb 2018 12:55:06 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A2CEB20D3A;
 Thu, 15 Feb 2018 20:55:02 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 15 Feb 2018 20:55:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=FxLZNFdbZG303GGB2JORgJdP/4LvU4M9A/JO4dXrHZg=; b=rNOLFm+R
 Gpiwf5Q9YJZjiLG+rAUBbxVGR/3DPjHoosPGx+t4j/d3NWyQrlhfZIjYusTwdYCf
 C7HMx+KERgI0pBM74qYxJFqz6QBHwUnK17IYRlOITDc0KDQZcH/7sj/dfXC8ldR4
 vyHpkmIKly8qiuKc0NM9ewHTq/UwpQIRHSC+1KzErAls9X6tNOyeWWNolw4W3zav
 jNiwBLe4a2kgQ0RdDvntm4Sn1aB/vZUrzRtTEiTXAljCyMpOh75tTWR0WxvBUrCX
 AhLUTw63xrPzRcZgggbsPLZ5BbLU+BRx1Rc2DWj0xzKJ8VRjqt6E5v/ASIBxSLMJ
 x1QUTpimMmGcKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=FxLZNFdbZG303GGB2JORgJdP/4LvU
 4M9A/JO4dXrHZg=; b=SgtVO57HngJEU1h6HfdC7MKWIAjkyQsOgN2K55p6orOpY
 wZq0VJgN/1Xz9rm/tGAMHFYh9Fvhe2BCXvWm+KZ1l3i2g7vjP3K/HfwAp/u+qGIk
 qE6JKN3qy4ruhzBqTLa+mV/L08ClEM5EfSkjDZfpeFNfHYsRrmXtBScAT4x5mjnp
 ljqixf5KyhlWkQevv77Yufy7SHHalr2lIyVE5dOSYKdPagxRJ6g6CFcpCNT4R6i5
 zQepARDY9T5ynPncuH6jvukugkoByHALrMFfpcy93H9Y8cjNsPDKnWmm4D885qvl
 KgRlXGpxYR9bbFf/2auFMOY/UuQyYcBTc2vEJJUBA==
X-ME-Sender: <xms:9jmGWoGsUDsVr1t9fdqfwbu6ilucXU1efl5YESuRVwpXEgDBdj7mOg>
Received: from dave (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 331DE7E542;
 Thu, 15 Feb 2018 20:55:00 -0500 (EST)
Message-ID: <1518746091.10440.23.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.13 v5] Add ARM system BMC device tree
From: Andrew Jeffery <andrew@aj.id.au>
To: Ken Chen <chen.kenyy@inventec.com>, openbmc@lists.ozlabs.org
Date: Fri, 16 Feb 2018 12:24:51 +1030
In-Reply-To: <20180212121047.24831-1-chen.kenyy@inventec.com>
References: <20180212121047.24831-1-chen.kenyy@inventec.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-FY8Dsz4v1Tt1SOA6Emiy"
X-Mailer: Evolution 3.26.1-1 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Feb 2018 01:55:09 -0000


--=-FY8Dsz4v1Tt1SOA6Emiy
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2018-02-12 at 20:10 +0800, Ken Chen wrote:
> Centriq2400-rep is ARM system reference evalutiion platform
> with ast2520 BMC.
>=20
> Signed-off-by: Ken Chen <chen.kenyy@inventec.com>

Looked at this from a pinctrl perspective, seems fine.

Acked-by: Andrew Jeffery <andrew@aj.id.au>

>=20
> ---
> v4->v5
> - Removed strange whitespace
> - Removed aspeed.c commit
> - Modify commit content
>=20
> v3->v4
> - Modify Makefile for centriq2400-rep dts
> - Fix typo label
> - Removed unnecessary define of spi2 and centriq2400-spi-hwmon device
> - Removed lpc device
> - Fix coding style
> - Removed ssif device
> - Removed max31790 device
> - Removed register control of GPIO and Watchdog
> ---
>  arch/arm/boot/dts/Makefile                         |   1 +
>  .../boot/dts/aspeed-bmc-arm-centriq2400-rep.dts    | 276
> +++++++++++++++++++++
>  2 files changed, 277 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-
> rep.dts
>=20
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 7c54fc8..77aef19 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -993,6 +993,7 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D aspeed-bmc-opp-
> palmetto.dtb \
>  	aspeed-bmc-mellanox-msn.dtb \
>  	aspeed-bmc-quanta-q71l.dtb \
>  	aspeed-bmc-intel-s2600wf.dtb \
> +        aspeed-bmc-arm-centriq2400-rep.dtb \
>  	aspeed-ast2500-evb.dtb
>  endif
> =20
> diff --git a/arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts
> b/arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts
> new file mode 100644
> index 0000000..b0195e0
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts
> @@ -0,0 +1,276 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/dts-v1/;
> +
> +#include "aspeed-g5.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +
> +/ {
> +	model =3D "Qualcomm Centriq 2400  REP AST2520";
> +	compatible =3D "qualcomm,centriq2400-rep-bmc",
> "aspeed,ast2500";
> +
> +	chosen {
> +		stdout-path =3D &uart5;
> +		bootargs =3D "console=3DttyS4,115200 earlyprintk";
> +	};
> +
> +	memory {
> +		reg =3D <0x80000000 0x40000000>;
> +	};
> +
> +	iio-hwmon {
> +		compatible =3D "iio-hwmon";
> +		io-channels =3D <&adc 0>, <&adc 1>, <&adc 2>, <&adc
> 3>,
> +                        <&adc 4>, <&adc 5>, <&adc 6>, <&adc 8>;
> +	};
> +
> +	iio-hwmon-battery {
> +		compatible =3D "iio-hwmon";
> +		io-channels =3D <&adc 7>;
> +	};
> +
> +	leds {
> +		compatible =3D "gpio-leds";
> +
> +		uid_led {
> +			label =3D "UID_LED";
> +			gpios =3D <&gpio ASPEED_GPIO(Q, 5)
> GPIO_ACTIVE_LOW>;
> +		};
> +
> +		ras_error_led {
> +			label =3D "RAS_ERROR_LED";
> +			gpios =3D <&gpio ASPEED_GPIO(F, 6)
> GPIO_ACTIVE_LOW>;
> +		};
> +
> +		system_fault {
> +			label =3D "System_fault";
> +			gpios =3D <&gpio ASPEED_GPIO(A, 1)
> GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +};
> +
> +&fmc {
> +	status =3D "okay";
> +	flash@0 {
> +		status =3D "okay";
> +		m25p,fast-read;
> +		label =3D "bmc";
> +#include "openbmc-flash-layout.dtsi"
> +	};
> +};
> +
> +&spi1 {
> +	status =3D "okay";
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_spi1_default>;
> +	flash@0 {
> +		status =3D "okay";
> +	};
> +};
> +
> +&spi2 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_spi2ck_default
> &pinctrl_spi2miso_default &pinctrl_spi2mosi_default
> &pinctrl_spi2cs0_default>;
> +};
> +
> +&uart3 {
> +	status =3D "okay";
> +
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_txd3_default &pinctrl_rxd3_default>;
> +	current-speed =3D <115200>;
> +};
> +
> +&uart5 {
> +	status =3D "okay";
> +};
> +
> +&mac0 {
> +	status =3D "okay";
> +
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_rgmii1_default
> &pinctrl_mdio1_default>;
> +};
> +
> +&i2c0 {
> +	status =3D "okay";
> +
> +	pca9542@70 {
> +		compatible =3D "pca9542";
> +		reg =3D <0x70>;
> +		i2c@0 {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			reg =3D <0>;
> +			pca9546@77 {
> +				compatible =3D "pca9546";
> +				reg =3D <0x77>;
> +				i2c@0 {
> +					#address-cells =3D <1>;
> +					#size-cells =3D <0>;
> +					reg =3D <0>;
> +					eeprom@52 {
> +						compatible =3D
> "atmel,24c02";
> +						reg =3D <0x52>;
> +					};
> +				};
> +				i2c@2 {
> +					#address-cells =3D <1>;
> +					#size-cells =3D <0>;
> +					reg =3D <2>;
> +					eeprom@57 {
> +						compatible =3D
> "atmel,24c02";
> +						reg =3D <0x57>;
> +					};
> +				};
> +			};
> +		};
> +		i2c@1 {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			reg =3D <1>;
> +			pca9546@77 {
> +				compatible =3D "pca9546";
> +				reg =3D <0x77>;
> +				i2c@2 {
> +					#address-cells =3D <1>;
> +					#size-cells =3D <0>;
> +					reg =3D <2>;
> +					eeprom@57 {
> +						compatible =3D
> "atmel,24c02";
> +						reg =3D <0x57>;
> +					};
> +				};
> +			};
> +		};
> +
> +        };
> +};
> +
> +&i2c1 {
> +	status =3D "okay";
> +
> +	tmp421@1e {
> +		compatible =3D "ti,tmp421";
> +		reg =3D <0x1e>;
> +	};
> +	tmp421@2a {
> +		compatible =3D "ti,tmp421";
> +		reg =3D <0x2a>;
> +	};
> +	tmp421@4e {
> +		compatible =3D "ti,tmp421";
> +		reg =3D <0x4e>;
> +	};
> +	tmp421@1c {
> +		compatible =3D "ti,tmp421";
> +		reg =3D <0x1c>;
> +	};
> +};
> +
> +&i2c2 {
> +	status =3D "okay";
> +};
> +
> +&i2c3 {
> +	status =3D "okay";
> +};
> +
> +&i2c4 {
> +	status =3D "okay";
> +};
> +
> +&i2c5 {
> +	status =3D "okay";
> +};
> +
> +&i2c6 {
> +	status =3D "okay";
> +
> +	tmp421@1d {
> +		compatible =3D "ti,tmp421";
> +		reg =3D <0x1d>;
> +	};
> +	tmp421@1f {
> +		compatible =3D "ti,tmp421";
> +		reg =3D <0x1f>;
> +	};
> +	tmp421@4d {
> +		compatible =3D "ti,tmp421";
> +		reg =3D <0x4d>;
> +	};
> +	tmp421@4f {
> +		compatible =3D "ti,tmp421";
> +		reg =3D <0x4f>;
> +	};
> +	nvt210@4c {
> +		compatible =3D "nvt210";
> +		reg =3D <0x4c>;
> +	};
> +	eeprom@50 {
> +		compatible =3D "atmel,24c128";
> +		reg =3D <0x50>;
> +		pagesize =3D <128>;
> +	};
> +};
> +
> +&i2c7 {
> +	status =3D "okay";
> +};
> +
> +&i2c8 {
> +	status =3D "okay";
> +
> +	pca9641@70 {
> +		compatible =3D "nxp,pca9641";
> +		reg =3D <0x70>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		i2c-arb {
> +			tmp421@1d {
> +				compatible =3D "tmp421";
> +				reg =3D <0x1d>;
> +			};
> +			adm1278@12 {
> +				compatible =3D "adi,adm1278";
> +				reg =3D <0x12>;
> +				Rsense =3D <500>;
> +			};
> +			eeprom@50 {
> +				compatible =3D "atmel,24c02";
> +				reg =3D <0x50>;
> +			};
> +			ds1100@58 {
> +				compatible =3D "ds1100";
> +				reg =3D <0x58>;
> +			};
> +		};
> +	};
> +};
> +
> +&i2c9 {
> +	status =3D "okay";
> +};
> +
> +&vuart {
> +	status =3D "okay";
> +};
> +
> +&gfx {
> +	status =3D "okay";
> +};
> +
> +&pinctrl {
> +	aspeed,external-nodes =3D <&gfx &lhc>;
> +};
> +&wdt2 {
> +	status =3D "okay";
> +};
> +
> +&gpio {
> +	pin_gpio_c7 {
> +		gpio-hog;
> +		gpios =3D <ASPEED_GPIO(C, 7) GPIO_ACTIVE_HIGH>;
> +		output;
> +		line-name =3D "BIOS_SPI_MUX_S";
> +	};
> +}
--=-FY8Dsz4v1Tt1SOA6Emiy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJahjnrAAoJEJ0dnzgO5LT5Sr4P/1MXuHAk5cRhCUpBXira6zCg
Kf9wHXykd0ZK8pjOAw1NXSaY0ZQlGDgJbje0dFP0xrK5CEU+ZJkqpM7KR3ayG5mc
ir22UvQQGkwIH1VBDvxsHiym9URyt0sUsSzjZuNipfLZMBy6lFKGw4UTYCIrqo9m
2dsAuqB6R0N4vu9Nnoz5OcJB+1HP8/bGRY/lAsXsedn2TUOe5MqRN/g+0v4dBZKX
ekOIGayDGtLPXOmOpBL/M9WQLG4sAnwiSNh7rqMjet3ILOVbfTHws2owvpwLhi4T
kN3foD7ElQIjVNnPoaSEOWUkFLZnO0mcisptGbk5ubMiy4VnKXeBAIupHbrdYI6c
LXiiN72uZUhmosa5A/h0O+JyE5qd+UoDsTOfIijzjOc79P6ZyWTZdduwgn7IDuvB
tHy2MNn/+sQoQimSzq/qfepxAKMCJHc9vULHXIptknPIfn0p6BJjEWji0+PD7dCU
YZahpMuF0MZK8i5kP3Pw8t0iR2tkFRyA/4sMzK0vf3Xhlyx1ZuwlSWFnZz95k1qK
OIDoB3Vei7YoH4GnttQR6M7+LCXCZ5WVentHjh0+IPPtjshP3Tz8/AFtdmY27XGd
omPq+Mb7GrZQqhG6Tta4QkQXh+NmoyakDm0m3a6lB7Mn3yvmfMmQcZxeajSQ+N4x
J9e6ZTzg3/EchAxP5U/C
=/Hyt
-----END PGP SIGNATURE-----

--=-FY8Dsz4v1Tt1SOA6Emiy--
