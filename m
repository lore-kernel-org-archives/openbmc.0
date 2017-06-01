Return-Path: <c_mykolak@mellanox.com>
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10081.outbound.protection.outlook.com [40.107.1.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wdfc20NpKzDqBQ
 for <openbmc@lists.ozlabs.org>; Thu,  1 Jun 2017 17:48:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Mellanox.com header.i=@Mellanox.com header.b="C3ivWm14";
 dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=+Rmk4DvYvBqdlJZvXCJLSNlJ8UP0AM/PsgZYJG0tSGQ=;
 b=C3ivWm14V8qL7yNDJXIgj7eVOtnM+r8eZ5duSvj2BNAimO+3jZYsM2yvFMdzHuovo4yXyEKwvZlBBnOh384LRdEzC4sz2aDeleaulfzvRROXzTbgj5oEkNndVJqAk8LMfov3e5TOtR1el7ZskaYk0ZsHZJgOGRl+Pq4CI08iFAE=
Received: from VI1PR05MB3247.eurprd05.prod.outlook.com (10.170.238.16) by
 VI1PR05MB3245.eurprd05.prod.outlook.com (10.170.238.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1124.9; Thu, 1 Jun 2017 07:48:42 +0000
Received: from VI1PR05MB3247.eurprd05.prod.outlook.com
 ([fe80::ec22:f8c1:a6d:ffa9]) by VI1PR05MB3247.eurprd05.prod.outlook.com
 ([fe80::ec22:f8c1:a6d:ffa9%13]) with mapi id 15.01.1124.020; Thu, 1 Jun 2017
 07:48:42 +0000
From: Mykola Kostenok <c_mykolak@mellanox.com>
To: Joel Stanley <joel@jms.id.au>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
CC: "Edward A. James" <eajames@us.ibm.com>, Eddie James
 <eajames@linux.vnet.ibm.com>, =?iso-8859-1?Q?C=E9dric_Le_Goater?=
 <clg@kaod.org>, Andrew Jeffery <andrew@aj.id.au>
Subject: RE: [PATCH linux dev-4.10] arm: dts: aspeed: Update old style flash
 nodes
Thread-Topic: [PATCH linux dev-4.10] arm: dts: aspeed: Update old style flash
 nodes
Thread-Index: AQHS2hW4Waui8nsJVEaIuhgnWrjZxqIPoqxw
Date: Thu, 1 Jun 2017 07:48:42 +0000
Message-ID: <VI1PR05MB32475FDC198B13939F25802BEFF60@VI1PR05MB3247.eurprd05.prod.outlook.com>
References: <20170531135614.7170-1-joel@jms.id.au>
In-Reply-To: <20170531135614.7170-1-joel@jms.id.au>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none header.from=mellanox.com;
x-originating-ip: [80.90.224.13]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; VI1PR05MB3245;
 7:IIcoqETiMufpXCmH67/GBlgxJOrE7UZybPP4wS3ZllSbYxF2Z2uzPjD7xgsZMklgTlFoqEnF7qo4oCeCZfoEl3oZwHreS0RBIdVFbjrW8D1gGmsANwgbOIdZyBH1rM/J8T/zVvy3E8kyOjIwJVsREovfH8GJrWLuQ0+LeEAL61R2xubKDxVqaEmBq2RHeBUOqL8Jh2bOqVtT6YdcOVFbphQCGxjFUcHsMcA4H4rdETB7g9I3Uy3gYoZ088T+9lOGIhuw3avgQ1znArSRj17+4spmTEYgZho5sV5BxGfLriBEAkOxn+Bw9019vUeHRutaTPhGUm+4UyxsrTofekqu0Q==
x-ms-traffictypediagnostic: VI1PR05MB3245:
x-ms-office365-filtering-correlation-id: 3c10f239-cc8d-4978-b7f5-08d4a8c2a00f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(22001)(2017030254075)(48565401081)(201703131423075)(201703031133081);
 SRVR:VI1PR05MB3245; 
x-microsoft-antispam-prvs: <VI1PR05MB32456DF4617B0B2BD8CEEE2CEFF60@VI1PR05MB3245.eurprd05.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(65623756079841)(274839183919467)(81227570615382)(104084551191319); 
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(100000700086)(100105000095)(100000701086)(100105300095)(100000702086)(100105100095)(6040450)(601004)(2401047)(5005006)(8121501046)(93006095)(93001095)(100000703086)(100105400095)(10201501046)(3002001)(6055026)(6041248)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(20161123560025)(20161123564025)(20161123555025)(6072148)(100000704086)(100105200095)(100000705086)(100105500095);
 SRVR:VI1PR05MB3245; BCL:0; PCL:0;
 RULEID:(100000800086)(100110000095)(100000801086)(100110300095)(100000802086)(100110100095)(100000803086)(100110400095)(100000804086)(100110200095)(100000805086)(100110500095);
 SRVR:VI1PR05MB3245; 
x-forefront-prvs: 0325F6C77B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(6009001)(39410400002)(39860400002)(39450400003)(39400400002)(39840400002)(39850400002)(13464003)(377454003)(6116002)(81166006)(54356999)(76176999)(50986999)(8936002)(102836003)(86362001)(8676002)(66066001)(189998001)(3846002)(15650500001)(2906002)(3660700001)(3280700002)(305945005)(33656002)(74316002)(2950100002)(7696004)(5660300001)(14454004)(478600001)(7736002)(5250100002)(25786009)(38730400002)(53546009)(6506006)(8656002)(6246003)(55016002)(2900100001)(2501003)(9686003)(4326008)(6436002)(99286003)(229853002)(54906002)(53936002)(45080400002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB3245;
 H:VI1PR05MB3247.eurprd05.prod.outlook.com; FPR:; SPF:None; MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2017 07:48:42.6497 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB3245
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
X-List-Received-Date: Thu, 01 Jun 2017 07:48:52 -0000

Acked-by: Mykola Kostenok <c_mykolak@mellanox.com>

Best regards. Mykola Kostenok.

> -----Original Message-----
> From: joel.stan@gmail.com [mailto:joel.stan@gmail.com] On Behalf Of Joel
> Stanley
> Sent: Wednesday, May 31, 2017 4:56 PM
> To: openbmc@lists.ozlabs.org
> Cc: Edward A. James <eajames@us.ibm.com>; Eddie James
> <eajames@linux.vnet.ibm.com>; C=E9dric Le Goater <clg@kaod.org>; Andrew
> Jeffery <andrew@aj.id.au>; Mykola Kostenok <c_mykolak@mellanox.com>
> Subject: [PATCH linux dev-4.10] arm: dts: aspeed: Update old style flash
> nodes
>=20
> From: "Edward A. James" <eajames@us.ibm.com>
>=20
> Reorganize flash controllers into the ast2400 device tree to match what i=
s
> used upstream. This moves the nodes from the machine dts to the common
> dtsi.
>=20
> This also affected the newly added Mellanox MSN device tree, which is als=
o
> updated in this series.
>=20
> Barreleye wasn't booting with the new aspeed-smc driver.
>=20
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> [joel:
>   - rework commit message
>   - add missing m25p,fast-read properties
>   - add pinmux for pnor
>   - use upstream node names
>      * bmc_pnor becomes fmc
>      * host_pnor becomes spi
>   - fix the facebook machine
> ]
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> Eddie, I reworked your patch for you. Please check it looks okay.
>=20
> Cedric, can you please double check I didn't stuff anything up?
>=20
> Andrew, can you reivew for pinmux correctness?
>=20
> Mykola, please reply with "Acked-by: Mykola Kostenok
> <c_mykolak@mellanox.com>"
> if the changes to the Mellanox device tree look okay to you. They should =
be
> functionally the same as before.
>=20
>  arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts  | 19 ++++-----
> arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts  | 20 ++++-----
> arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts | 49 ++++++++++---------
> ---  arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts | 42 ++++++++--------
> ---  arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts  | 51 ++++++++--------=
-
> ------  arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts  | 57 ++++++++++--
> --------------
>  arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts   | 43 ++++++++-----------
>  arch/arm/boot/dts/aspeed-g4.dtsi               | 34 +++++++++++++++
>  8 files changed, 142 insertions(+), 173 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
> b/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
> index 8df116ea8594..ff5058ee8834 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
> @@ -18,21 +18,16 @@
>  	memory {
>  		reg =3D <0x80000000 0x3f000000>;
>  	};
> +};
>=20
> -	ahb {
> -		bmc_pnor: fmc@1e620000 {
> -			reg =3D < 0x1e620000 0x94
> -				0x20000000 0x02000000 >;
> -			#address-cells =3D <1>;
> -			#size-cells =3D <0>;
> -			compatible =3D "aspeed,ast2400-fmc";
> -			flash@0 {
> -				reg =3D < 0 >;
> -				compatible =3D "jedec,spi-nor" ;
> +&fmc {
> +	status =3D "okay";
> +	flash@0 {
> +		status =3D "okay";
> +		m25p,fast-read;
>  #include "aspeed-bmc-facebook-cmm-flash-layout.dtsi"
> -			};
> -		};
>  	};
> +
>  };
>=20
>  &uart1 {
> diff --git a/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
> b/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
> index 649964a3726a..c71a6dbe1410 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
> @@ -22,20 +22,14 @@
>  		reg =3D <0x80000000 0x20000000>;
>  	};
>=20
> -	ahb {
> -		bmc_pnor: fmc@1e620000 {
> -			reg =3D < 0x1e620000 0xc4
> -				0x20000000 0x02000000 >;
> -			#address-cells =3D <1>;
> -			#size-cells =3D <0>;
> -			compatible =3D "aspeed,ast2500-fmc";
> -			interrupts =3D <19>;
> -			flash@0 {
> -				reg =3D < 0 >;
> -				compatible =3D "jedec,spi-nor" ;
> +};
> +
> +&fmc {
> +	status =3D "okay";
> +	flash@0 {
> +		status =3D "okay";
> +		m25p,fast-read;
>  #include "aspeed-bmc-mellanox-msn-flash-layout.dtsi"
> -			};
> -		};
>  	};
>  };
>=20
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
> b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
> index be1f2d120fee..9f7098876ecb 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
> @@ -31,34 +31,6 @@
>  		};
>  	};
>=20
> -	ahb {
> -		bmc_pnor: fmc@1e620000 {
> -			reg =3D < 0x1e620000 0x94
> -				0x20000000 0x02000000 >;
> -			#address-cells =3D <1>;
> -			#size-cells =3D <0>;
> -			compatible =3D "aspeed,ast2400-fmc";
> -			flash@0 {
> -				reg =3D < 0 >;
> -				compatible =3D "jedec,spi-nor" ;
> -#include "aspeed-bmc-opp-flash-layout.dtsi"
> -			};
> -		};
> -
> -		host_pnor: spi@1e630000 {
> -			reg =3D < 0x1e630000 0x18
> -				0x30000000 0x02000000 >;
> -			#address-cells =3D <1>;
> -			#size-cells =3D <0>;
> -			compatible =3D "aspeed,ast2400-spi";
> -			flash@0 {
> -				reg =3D < 0 >;
> -				compatible =3D "jedec,spi-nor" ;
> -				label =3D "pnor";
> -			};
> -		};
> -	};
> -
>  	leds {
>  		compatible =3D "gpio-leds";
>=20
> @@ -76,6 +48,27 @@
>  	};
>  };
>=20
> +&fmc {
> +	status =3D "okay";
> +	flash@0 {
> +		status =3D "okay";
> +		m25p,fast-read;
> +#include "aspeed-bmc-opp-flash-layout.dtsi"
> +	};
> +};
> +
> +&spi {
> +	status =3D "okay";
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_spi1_default>;
> +
> +	flash@0 {
> +		m25p,fast-read;
> +		status =3D "okay";
> +		label =3D "pnor";
> +	};
> +};
> +
>  &pinctrl {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_flbusy_default &pinctrl_flwp_default diff --git
> a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> index fe63621365fd..430622c86ef7 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> @@ -50,34 +50,26 @@
>  			gpios =3D <&gpio ASPEED_GPIO(A, 2)
> GPIO_ACTIVE_LOW>;
>  		};
>  	};
> +};
>=20
> -	ahb {
> -		fmc@1e620000 {
> -			reg =3D < 0x1e620000 0x94
> -				0x20000000 0x02000000 >;
> -			#address-cells =3D <1>;
> -			#size-cells =3D <0>;
> -			compatible =3D "aspeed,ast2400-fmc";
> -
> -			flash@0 {
> -				reg =3D < 0 >;
> -				compatible =3D "jedec,spi-nor" ;
> +&fmc {
> +	status =3D "okay";
> +	flash@0 {
> +		status =3D "okay";
> +		m25p,fast-read;
>  #include "aspeed-bmc-opp-flash-layout.dtsi"
> -			};
> -		};
> +	};
> +};
>=20
> -		spi@1e630000 {
> -			reg =3D < 0x1e630000 0x18
> -				0x30000000 0x02000000 >;
> -			#address-cells =3D <1>;
> -			#size-cells =3D <0>;
> -			compatible =3D "aspeed,ast2400-spi";
> -			flash@0 {
> -				reg =3D < 0 >;
> -				compatible =3D "jedec,spi-nor" ;
> -				label =3D "pnor";
> -			};
> -		};
> +&spi {
> +	status =3D "okay";
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_spi1_default>;
> +
> +	flash@0 {
> +		status =3D "okay";
> +		m25p,fast-read;
> +		label =3D "pnor";
>  	};
>  };
>=20
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
> b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
> index 121612a8776e..b64edad3e050 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
> @@ -30,42 +30,27 @@
>  			reg =3D <0x5f000000 0x01000000>; /* 16MB */
>  		};
>  	};
> +};
> +
> +&fmc {
> +	status =3D "okay";
>=20
> -	ahb {
> -
> -		bmc_pnor: fmc@1e620000 {
> -			reg =3D < 0x1e620000 0x94
> -				0x20000000 0x02000000 >;
> -			#address-cells =3D <1>;
> -			#size-cells =3D <0>;
> -			compatible =3D "aspeed,ast2400-fmc";
> -			aspeed,fmc-has-dma;
> -			interrupts =3D <19>;
> -			clocks =3D <&clk_ahb>;
> -			clock-names =3D "ahb";
> -			flash@0 {
> -				reg =3D < 0 >;
> -				compatible =3D "jedec,spi-nor" ;
> -				m25p,fast-read;
> +	flash@0 {
> +		status =3D "okay";
> +		m25p,fast-read;
>  #include "aspeed-bmc-opp-flash-layout.dtsi"
> -			};
> -		};
> +	};
> +};
>=20
> -		host_pnor: spi@1e630000 {
> -			reg =3D < 0x1e630000 0x18
> -				0x30000000 0x02000000 >;
> -			#address-cells =3D <1>;
> -			#size-cells =3D <0>;
> -			compatible =3D "aspeed,ast2400-spi";
> -			clocks =3D <&clk_ahb>;
> -			clock-names =3D "ahb";
> -			flash {
> -				reg =3D < 0 >;
> -				compatible =3D "jedec,spi-nor" ;
> -				label =3D "pnor";
> -				m25p,fast-read;
> -			};
> -		};
> +&spi {
> +	status =3D "okay";
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_spi1_default>;
> +
> +	flash@0 {
> +		status =3D "okay";
> +		m25p,fast-read;
> +		label =3D "pnor";
>  	};
>  };
>=20
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> index b4faa1d79460..60792f6ff7ec 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> @@ -47,42 +47,6 @@
>                  };
>          };
>=20
> -	ahb {
> -		bmc_pnor: fmc@1e620000 {
> -			reg =3D < 0x1e620000 0x94
> -				0x20000000 0x02000000 >;
> -			#address-cells =3D <1>;
> -			#size-cells =3D <0>;
> -			compatible =3D "aspeed,ast2400-fmc";
> -			aspeed,fmc-has-dma;
> -			interrupts =3D <19>;
> -			clocks =3D <&clk_ahb>;
> -			clock-names =3D "ahb";
> -			flash@0 {
> -				reg =3D < 0 >;
> -				compatible =3D "jedec,spi-nor" ;
> -				m25p,fast-read;
> -#include "aspeed-bmc-opp-flash-layout.dtsi"
> -			};
> -		};
> -
> -		host_pnor: spi@1e630000 {
> -			reg =3D < 0x1e630000 0x18
> -				0x30000000 0x02000000 >;
> -			#address-cells =3D <1>;
> -			#size-cells =3D <0>;
> -			compatible =3D "aspeed,ast2400-spi";
> -			clocks =3D <&clk_ahb>;
> -			clock-names =3D "ahb";
> -			flash {
> -				reg =3D < 0 >;
> -				compatible =3D "jedec,spi-nor" ;
> -				label =3D "pnor";
> -				m25p,fast-read;
> -			};
> -		};
> -	};
> -
>  	gpio-fsi {
>  		compatible =3D "fsi-master-gpio", "fsi-master";
>=20
> @@ -94,6 +58,27 @@
>  	};
>  };
>=20
> +&fmc {
> +	status =3D "okay";
> +	flash@0 {
> +		status =3D "okay";
> +		m25p,fast-read;
> +#include "aspeed-bmc-opp-flash-layout.dtsi"
> +	};
> +};
> +
> +&spi {
> +	status =3D "okay";
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_spi1_default>;
> +
> +	flash@0 {
> +		status =3D "okay";
> +		label =3D "pnor";
> +		m25p,fast-read;
> +	};
> +};
> +
>  &pinctrl {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_flbusy_default &pinctrl_flwp_default diff --git
> a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> index 713246090906..50be8dd921cf 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> @@ -30,35 +30,26 @@
>  			reg =3D <0x47800000 0x00800000>; /* 8MB */
>  		};
>  	};
> +};
>=20
> -	ahb {
> -		bmc_pnor: fmc@1e620000 {
> -			reg =3D < 0x1e620000 0x94
> -				0x20000000 0x02000000 >;
> -			#address-cells =3D <1>;
> -			#size-cells =3D <0>;
> -			compatible =3D "aspeed,ast2400-fmc";
> -			aspeed,fmc-has-dma;
> -			interrupts =3D <19>;
> -			flash@0 {
> -				reg =3D < 0 >;
> -				compatible =3D "jedec,spi-nor" ;
> +&fmc {
> +	status =3D "okay";
> +	flash@0 {
> +		status =3D "okay";
> +		m25p,fast-read;
>  #include "aspeed-bmc-opp-flash-layout.dtsi"
> -			};
> -		};
> +	};
> +};
>=20
> -		host_pnor: spi@1e630000 {
> -			reg =3D < 0x1e630000 0x18
> -				0x30000000 0x01000000 >;
> -			#address-cells =3D <1>;
> -			#size-cells =3D <0>;
> -			compatible =3D "aspeed,ast2400-smc";
> -			flash {
> -				reg =3D < 0 >;
> -				compatible =3D "jedec,spi-nor" ;
> -				label =3D "pnor";
> -			};
> -		};
> +&spi {
> +	status =3D "okay";
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_spi1_default>;
> +
> +	flash@0 {
> +		status =3D "okay";
> +		m25p,fast-read;
> +		label =3D "pnor";
>  	};
>  };
>=20
> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-
> g4.dtsi
> index d8827d522dfe..9a329cee72bf 100644
> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> @@ -44,6 +44,40 @@
>  		#size-cells =3D <1>;
>  		ranges;
>=20
> +		fmc: fmc@1e620000 {
> +			reg =3D < 0x1e620000 0x94
> +				0x20000000 0x02000000 >;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			compatible =3D "aspeed,ast2400-fmc";
> +			status =3D "disabled";
> +			aspeed,fmc-has-dma;
> +			interrupts =3D <19>;
> +			clocks =3D <&clk_ahb>;
> +			clock-names =3D "ahb";
> +			flash@0 {
> +				reg =3D < 0 >;
> +				compatible =3D "jedec,spi-nor" ;
> +				status =3D "disabled";
> +			};
> +		};
> +
> +		spi: spi@1e630000 {
> +			reg =3D < 0x1e630000 0x18
> +				0x30000000 0x02000000 >;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			compatible =3D "aspeed,ast2400-spi";
> +			status =3D "disabled";
> +			clocks =3D <&clk_ahb>;
> +			clock-names =3D "ahb";
> +			flash@0 {
> +				reg =3D < 0 >;
> +				compatible =3D "jedec,spi-nor" ;
> +				status =3D "disabled";
> +			};
> +		};
> +
>  		vic: interrupt-controller@1e6c0080 {
>  			compatible =3D "aspeed,ast2400-vic";
>  			interrupt-controller;
> --
> 2.11.0
