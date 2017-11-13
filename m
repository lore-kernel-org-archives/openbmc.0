Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="P8Oh13B6"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="oNhjVUQ8"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yZzn45YY9zDqNh
 for <openbmc@lists.ozlabs.org>; Mon, 13 Nov 2017 16:32:56 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C3B8F20BD8;
 Mon, 13 Nov 2017 00:32:53 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Mon, 13 Nov 2017 00:32:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=wA2k/D0dwiqkSKpVXxbHCKwXlEWuWF7qWVAKoxNNpN8=; b=P8Oh13B6
 6749q/NCw4blgB09/Fdr53jk1RjLVJrwv2j4Ml9B5NXhg6kuZkfXA29VkxAyg435
 GszIUHg2rx6nWci9VXxON7wIcaTzIeXnlxtSm6ZZ663fKWrRhpLUAg2TooZisDIm
 Oor28Ulm6zj0yKGx50xRrJcpeNUpDjQBY3B6pofDc8NYE9mVjEJmy0tVW6+wN5Ww
 eQwzqpLnYEjrq8dlNorofOR7pvgXo2OIm2sr1yABdCNeii9PjEUqFvB4zgAyE2jQ
 pMYYDT0UPLLTiFxTI5VT6sHBxQ2l5ZQximZ9qscQGvDjPqUqKuMqdPwpPzrArLsC
 Po5nUy4iY/ds4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=wA2k/D0dwiqkSKpVXxbHCKwXlEWuW
 F7qWVAKoxNNpN8=; b=oNhjVUQ8IN5kkCahu7riwCArnlD773J7oKJSjwlO6ZiYx
 ECqOSIxxYKPuQYdOB5xBu2dSve//IDiawmxqSQ0dMsOwM+veAtVLP1nHSTQ0Vsvg
 E3VMHG9Expc/5B6UKT2sl4+x0sGyaa8Aea1Gp0Vjc3sQkDqD2QCKgAeYTNK/7u3J
 HeRKVXbnecdvfWgWmmc2m6FlgawlZ4Gc5atFQfx9qpUnSD/32cHNjfkOb68481g5
 UyqL2FKTxm/PIjZCaY2a5CcYa5ZLKAou033vTGyrW16ebJezcINqVYhX4A+ohXh3
 +G/Z+oVD3vP4KrHaHp5x1MWKxijSI7QbGQqM0g+Zw==
X-ME-Sender: <xms:hS4JWgzO_7L5qQfhTjfALnlH1Kn0dUpr93EPxA7qQ24lDoL_diIfVw>
Received: from dave (220-253-52-107.dyn.iinet.net.au [220.253.52.107])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0FF68241BE;
 Mon, 13 Nov 2017 00:32:51 -0500 (EST)
Message-ID: <1510551166.4287.73.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 1/1] arm: dts: Add Wfp BMC Machine
From: Andrew Jeffery <andrew@aj.id.au>
To: James Feist <james.feist@linux.intel.com>, openbmc@lists.ozlabs.org, 
 joel@jms.id.au
Date: Mon, 13 Nov 2017 16:02:46 +1030
In-Reply-To: <d011d483-b02d-b2ad-6b70-eb278a21fc33@linux.intel.com>
References: <d011d483-b02d-b2ad-6b70-eb278a21fc33@linux.intel.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-HaU24YdCoNMQCcYyzKOX"
X-Mailer: Evolution 3.26.1-1 
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
X-List-Received-Date: Mon, 13 Nov 2017 05:32:58 -0000


--=-HaU24YdCoNMQCcYyzKOX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi James,

Thanks for the patch. A comment on pinmux below.

On Fri, 2017-11-10 at 10:59 -0800, James Feist wrote:
> Wfp is a Intel system with an Aspeed ast2500 BMC.
>=20
> Signed-off-by: Feist, James <james.feist@linux.intel.com>
> ---
>   arch/arm/boot/dts/Makefile                         |   1 +
>   .../boot/dts/aspeed-bmc-intel-flash-layout.dtsi    |  26 +++++
>   arch/arm/boot/dts/aspeed-bmc-intel-wfp.dts         | 117=20
> +++++++++++++++++++++
>   3 files changed, 144 insertions(+)
>   create mode 100644 arch/arm/boot/dts/aspeed-bmc-intel-flash-layout.dtsi
>   create mode 100644 arch/arm/boot/dts/aspeed-bmc-intel-wfp.dts
>=20
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 6d6c9eb..987e23e 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -992,6 +992,7 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D=20
> aspeed-bmc-opp-palmetto.dtb \
>   	aspeed-bmc-opp-lanyang.dtb \
>   	aspeed-bmc-mellanox-msn.dtb \
>   	aspeed-bmc-quanta-q71l.dtb \
> +	aspeed-bmc-intel-wfp.dtb \
>   	aspeed-ast2500-evb.dtb
>   endif
>   diff --git a/arch/arm/boot/dts/aspeed-bmc-intel-flash-layout.dtsi=20
> b/arch/arm/boot/dts/aspeed-bmc-intel-flash-layout.dtsi
> new file mode 100644
> index 0000000..4bcfd1b
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-intel-flash-layout.dtsi
> @@ -0,0 +1,26 @@
> +		label =3D "bmc";
> +		partitions {
> +				#address-cells =3D < 1 >;
> +				#size-cells =3D < 1 >;
> +				compatible =3D "fixed-partitions";
> +				u-boot@0 {
> +					reg =3D < 0 0x60000 >;
> +					label =3D "u-boot";
> +				};
> +				u-boot-env@60000 {
> +					reg =3D < 0x60000 0x20000 >;
> +					label =3D "u-boot-env";
> +				};
> +				kernel@80000 {
> +					reg =3D < 0x80000 0x440000 >;
> +					label =3D "kernel";
> +				};
> +				rofs@0c0000 {
> +					reg =3D < 0x4c0000 0x1740000 >;
> +					label =3D "rofs";
> +				};
> +				rwfs@1c00000 {
> +					reg =3D < 0x1c00000 0x400000 >;
> +					label =3D "rwfs";
> +				};
> +		};
> diff --git a/arch/arm/boot/dts/aspeed-bmc-intel-wfp.dts=20
> b/arch/arm/boot/dts/aspeed-bmc-intel-wfp.dts
> new file mode 100644
> index 0000000..2b4f095
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-intel-wfp.dts
> @@ -0,0 +1,117 @@
> +/dts-v1/;
> +
> +#include "aspeed-g5.dtsi"
> +
> +/ {
> +	model =3D "WFP BMC";
> +	compatible =3D "intel,wfp-bmc", "aspeed,ast2500";
> +
> +	aliases {
> +		serial4 =3D &uart5;
> +	};
> +
> +	chosen {
> +		stdout-path =3D &uart5;
> +		bootargs =3D "console=3DttyS4,115200 earlyprintk";
> +	};
> +
> +	memory {
> +		reg =3D <0x80000000 0x20000000>;
> +	};
> +
> +	iio-hwmon {
> +		compatible =3D "iio-hwmon";
> +		io-channels =3D <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
> +			<&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>,
> +			<&adc 8>, <&adc 9>, <&adc 10>, <&adc 11>,
> +			<&adc 12>, <&adc 13>, <&adc 14>, <&adc 15>;
> +	};
> +
> +};
> +
> +&fmc {
> +	status =3D "okay";
> +	flash@0 {
> +		status =3D "okay";
> +#include "aspeed-bmc-intel-flash-layout.dtsi"
> +	};
> +};
> +
> +&spi1 {
> +	status =3D "okay";
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_spi1_default>;
> +
> +	flash@0 {
> +		status =3D "okay";
> +		label =3D "pnor";
> +	};
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
> +	pinctrl-0 =3D <&pinctrl_rgmii1_default &pinctrl_mdio1_default>;
> +	use-ncsi;

Have you tested the interface with this mux configuration? NCSI should
use pinctrl_rmii1_default (and doesn't need the MDIO mux).

Cheers,

Andrew

> +};
> +
> +&mac1 {
> +	status =3D "okay";
> +
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_rgmii2_default &pinctrl_mdio2_default>;
> +};
> +
> +&i2c1 {
> +	status =3D "okay";
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
> +};
> +
> +&i2c7 {
> +	status =3D "okay";
> +};
> +
> +&i2c13 {
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
> +
> +&pwm_tacho {
> +	status =3D "okay";
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_pwm0_default &pinctrl_pwm1_default
> +			 &pinctrl_pwm2_default &pinctrl_pwm3_default
> +			 &pinctrl_pwm4_default &pinctrl_pwm5_default
> +			 &pinctrl_pwm6_default &pinctrl_pwm7_default>;
> +};
--=-HaU24YdCoNMQCcYyzKOX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJaCS5+AAoJEJ0dnzgO5LT596oP/AmSjMaXGmJRv9LlDRBbhgsB
HPn16L9rwrqPKJDz02eHgbB/aPeolvqbkOPaDuV4fl9abP433Z5K9Emv04NvDJv+
cF7DOZUtN3tGmzapMx0RtgIbwYbfbCmDnu1VwxUigvDNH2wNNJw6/1bgCpTRGgyg
fbPw3r3pknOgLCDXfP1bqhYEvIdweG2qZhrwqpBriT9VG9jBa5vvY3dHRee/s6Cb
F9MegT/+yM5XrzgyoFvR7JOIukTF1Kkqg5Q5lPUEeHZJWORhIHYdQaipO674AHd0
0OxrDOwUPiYnbepDZR6OHD761/Cj6befiyE4JSs4hnp1NCIcSefYwP32VYsc9KvC
h9MKvr1ARyp17YV09urcGjdaIUlpaq9qcFlfLGXIQpC3Q3gdarTrwqCNR6OwpD6f
2G4S23xPLD/qOrNkPE5Ybr0SZ2NpU4zdbqWri11fgLLyOElWoO5Ijuf+C2ON2+Tg
6Vb2rFM7g4ky7Vcf526yLjQdcXbrC94eGGPV6YTymFaJZApWbjdLuZHW+sETj5oN
W5EQTN5TbrPJtv3N6tgJsQifI3TRbtrucWdp+ECpKKLpT6uKMbIvakILWN9XMCMX
qV/z78ZAr5e1cFQ1sxZm2srZT4jbH9Z2dbB22S7UnWPbAn6JocrlXXmNm32PeRJb
jWyzAT0Hqc2HcNU+6rkN
=GkKr
-----END PGP SIGNATURE-----

--=-HaU24YdCoNMQCcYyzKOX--
