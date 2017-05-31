Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wdHDQ3WvYzDqBJ
 for <openbmc@lists.ozlabs.org>; Thu,  1 Jun 2017 03:15:34 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v4VHDkew144059
 for <openbmc@lists.ozlabs.org>; Wed, 31 May 2017 13:15:28 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2asj439w45-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 31 May 2017 13:15:27 -0400
Received: from localhost
 by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Wed, 31 May 2017 13:15:26 -0400
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 31 May 2017 13:15:23 -0400
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v4VHFOj538731970; Wed, 31 May 2017 17:15:24 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CABA0B2054;
 Wed, 31 May 2017 13:12:58 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP id 57C50B2046;
 Wed, 31 May 2017 13:12:58 -0400 (EDT)
Subject: Re: [PATCH linux dev-4.10] arm: dts: aspeed: Update old style flash
 nodes
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
Cc: Andrew Jeffery <andrew@aj.id.au>, "Edward A. James" <eajames@us.ibm.com>, 
 Mykola Kostenok <c_mykolak@mellanox.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>
References: <20170531135614.7170-1-joel@jms.id.au>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Wed, 31 May 2017 12:15:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <20170531135614.7170-1-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 17053117-0008-0000-0000-0000022F86E8
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007149; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000212; SDB=6.00868285; UDB=6.00431490; IPR=6.00648164; 
 BA=6.00005388; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015657; XFM=3.00000015;
 UTC=2017-05-31 17:15:24
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17053117-0009-0000-0000-0000357A791E
Message-Id: <ab9921a6-72b7-289b-b1ab-65738052a1ff@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-05-31_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1705310311
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
X-List-Received-Date: Wed, 31 May 2017 17:15:34 -0000



On 05/31/2017 08:56 AM, Joel Stanley wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> Reorganize flash controllers into the ast2400 device tree to match what
> is used upstream. This moves the nodes from the machine dts to the
> common dtsi.
>
> This also affected the newly added Mellanox MSN device tree, which is
> also updated in this series.
>
> Barreleye wasn't booting with the new aspeed-smc driver.
>
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> [joel:
>    - rework commit message
>    - add missing m25p,fast-read properties
>    - add pinmux for pnor
>    - use upstream node names
>       * bmc_pnor becomes fmc
>       * host_pnor becomes spi
>    - fix the facebook machine
> ]
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> Eddie, I reworked your patch for you. Please check it looks okay.

Thanks Joel!

Reviewed-by: Eddie James <eajames@linux.vnet.ibm.com>

>
> Cedric, can you please double check I didn't stuff anything up?
>
> Andrew, can you reivew for pinmux correctness?
>
> Mykola, please reply with "Acked-by: Mykola Kostenok <c_mykolak@mellanox.com>"
> if the changes to the Mellanox device tree look okay to you. They should be
> functionally the same as before.
>
>   arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts  | 19 ++++-----
>   arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts  | 20 ++++-----
>   arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts | 49 ++++++++++------------
>   arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts | 42 ++++++++-----------
>   arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts  | 51 ++++++++---------------
>   arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts  | 57 ++++++++++----------------
>   arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts   | 43 ++++++++-----------
>   arch/arm/boot/dts/aspeed-g4.dtsi               | 34 +++++++++++++++
>   8 files changed, 142 insertions(+), 173 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
> index 8df116ea8594..ff5058ee8834 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
> @@ -18,21 +18,16 @@
>   	memory {
>   		reg = <0x80000000 0x3f000000>;
>   	};
> +};
>
> -	ahb {
> -		bmc_pnor: fmc@1e620000 {
> -			reg = < 0x1e620000 0x94
> -				0x20000000 0x02000000 >;
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -			compatible = "aspeed,ast2400-fmc";
> -			flash@0 {
> -				reg = < 0 >;
> -				compatible = "jedec,spi-nor" ;
> +&fmc {
> +	status = "okay";
> +	flash@0 {
> +		status = "okay";
> +		m25p,fast-read;
>   #include "aspeed-bmc-facebook-cmm-flash-layout.dtsi"
> -			};
> -		};
>   	};
> +
>   };
>
>   &uart1 {
> diff --git a/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts b/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
> index 649964a3726a..c71a6dbe1410 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
> @@ -22,20 +22,14 @@
>   		reg = <0x80000000 0x20000000>;
>   	};
>
> -	ahb {
> -		bmc_pnor: fmc@1e620000 {
> -			reg = < 0x1e620000 0xc4
> -				0x20000000 0x02000000 >;
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -			compatible = "aspeed,ast2500-fmc";
> -			interrupts = <19>;
> -			flash@0 {
> -				reg = < 0 >;
> -				compatible = "jedec,spi-nor" ;
> +};
> +
> +&fmc {
> +	status = "okay";
> +	flash@0 {
> +		status = "okay";
> +		m25p,fast-read;
>   #include "aspeed-bmc-mellanox-msn-flash-layout.dtsi"
> -			};
> -		};
>   	};
>   };
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
> index be1f2d120fee..9f7098876ecb 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
> @@ -31,34 +31,6 @@
>   		};
>   	};
>
> -	ahb {
> -		bmc_pnor: fmc@1e620000 {
> -			reg = < 0x1e620000 0x94
> -				0x20000000 0x02000000 >;
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -			compatible = "aspeed,ast2400-fmc";
> -			flash@0 {
> -				reg = < 0 >;
> -				compatible = "jedec,spi-nor" ;
> -#include "aspeed-bmc-opp-flash-layout.dtsi"
> -			};
> -		};
> -
> -		host_pnor: spi@1e630000 {
> -			reg = < 0x1e630000 0x18
> -				0x30000000 0x02000000 >;
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -			compatible = "aspeed,ast2400-spi";
> -			flash@0 {
> -				reg = < 0 >;
> -				compatible = "jedec,spi-nor" ;
> -				label = "pnor";
> -			};
> -		};
> -	};
> -
>   	leds {
>   		compatible = "gpio-leds";
>
> @@ -76,6 +48,27 @@
>   	};
>   };
>
> +&fmc {
> +	status = "okay";
> +	flash@0 {
> +		status = "okay";
> +		m25p,fast-read;
> +#include "aspeed-bmc-opp-flash-layout.dtsi"
> +	};
> +};
> +
> +&spi {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_spi1_default>;
> +
> +	flash@0 {
> +		m25p,fast-read;
> +		status = "okay";
> +		label = "pnor";
> +	};
> +};
> +
>   &pinctrl {
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&pinctrl_flbusy_default &pinctrl_flwp_default
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> index fe63621365fd..430622c86ef7 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> @@ -50,34 +50,26 @@
>   			gpios = <&gpio ASPEED_GPIO(A, 2) GPIO_ACTIVE_LOW>;
>   		};
>   	};
> +};
>
> -	ahb {
> -		fmc@1e620000 {
> -			reg = < 0x1e620000 0x94
> -				0x20000000 0x02000000 >;
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -			compatible = "aspeed,ast2400-fmc";
> -
> -			flash@0 {
> -				reg = < 0 >;
> -				compatible = "jedec,spi-nor" ;
> +&fmc {
> +	status = "okay";
> +	flash@0 {
> +		status = "okay";
> +		m25p,fast-read;
>   #include "aspeed-bmc-opp-flash-layout.dtsi"
> -			};
> -		};
> +	};
> +};
>
> -		spi@1e630000 {
> -			reg = < 0x1e630000 0x18
> -				0x30000000 0x02000000 >;
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -			compatible = "aspeed,ast2400-spi";
> -			flash@0 {
> -				reg = < 0 >;
> -				compatible = "jedec,spi-nor" ;
> -				label = "pnor";
> -			};
> -		};
> +&spi {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_spi1_default>;
> +
> +	flash@0 {
> +		status = "okay";
> +		m25p,fast-read;
> +		label = "pnor";
>   	};
>   };
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
> index 121612a8776e..b64edad3e050 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
> @@ -30,42 +30,27 @@
>   			reg = <0x5f000000 0x01000000>; /* 16MB */
>   		};
>   	};
> +};
> +
> +&fmc {
> +	status = "okay";
>
> -	ahb {
> -
> -		bmc_pnor: fmc@1e620000 {
> -			reg = < 0x1e620000 0x94
> -				0x20000000 0x02000000 >;
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -			compatible = "aspeed,ast2400-fmc";
> -			aspeed,fmc-has-dma;
> -			interrupts = <19>;
> -			clocks = <&clk_ahb>;
> -			clock-names = "ahb";
> -			flash@0 {
> -				reg = < 0 >;
> -				compatible = "jedec,spi-nor" ;
> -				m25p,fast-read;
> +	flash@0 {
> +		status = "okay";
> +		m25p,fast-read;
>   #include "aspeed-bmc-opp-flash-layout.dtsi"
> -			};
> -		};
> +	};
> +};
>
> -		host_pnor: spi@1e630000 {
> -			reg = < 0x1e630000 0x18
> -				0x30000000 0x02000000 >;
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -			compatible = "aspeed,ast2400-spi";
> -			clocks = <&clk_ahb>;
> -			clock-names = "ahb";
> -			flash {
> -				reg = < 0 >;
> -				compatible = "jedec,spi-nor" ;
> -				label = "pnor";
> -				m25p,fast-read;
> -			};
> -		};
> +&spi {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_spi1_default>;
> +
> +	flash@0 {
> +		status = "okay";
> +		m25p,fast-read;
> +		label = "pnor";
>   	};
>   };
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> index b4faa1d79460..60792f6ff7ec 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> @@ -47,42 +47,6 @@
>                   };
>           };
>
> -	ahb {
> -		bmc_pnor: fmc@1e620000 {
> -			reg = < 0x1e620000 0x94
> -				0x20000000 0x02000000 >;
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -			compatible = "aspeed,ast2400-fmc";
> -			aspeed,fmc-has-dma;
> -			interrupts = <19>;
> -			clocks = <&clk_ahb>;
> -			clock-names = "ahb";
> -			flash@0 {
> -				reg = < 0 >;
> -				compatible = "jedec,spi-nor" ;
> -				m25p,fast-read;
> -#include "aspeed-bmc-opp-flash-layout.dtsi"
> -			};
> -		};
> -
> -		host_pnor: spi@1e630000 {
> -			reg = < 0x1e630000 0x18
> -				0x30000000 0x02000000 >;
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -			compatible = "aspeed,ast2400-spi";
> -			clocks = <&clk_ahb>;
> -			clock-names = "ahb";
> -			flash {
> -				reg = < 0 >;
> -				compatible = "jedec,spi-nor" ;
> -				label = "pnor";
> -				m25p,fast-read;
> -			};
> -		};
> -	};
> -
>   	gpio-fsi {
>   		compatible = "fsi-master-gpio", "fsi-master";
>
> @@ -94,6 +58,27 @@
>   	};
>   };
>
> +&fmc {
> +	status = "okay";
> +	flash@0 {
> +		status = "okay";
> +		m25p,fast-read;
> +#include "aspeed-bmc-opp-flash-layout.dtsi"
> +	};
> +};
> +
> +&spi {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_spi1_default>;
> +
> +	flash@0 {
> +		status = "okay";
> +		label = "pnor";
> +		m25p,fast-read;
> +	};
> +};
> +
>   &pinctrl {
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&pinctrl_flbusy_default &pinctrl_flwp_default
> diff --git a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> index 713246090906..50be8dd921cf 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> @@ -30,35 +30,26 @@
>   			reg = <0x47800000 0x00800000>; /* 8MB */
>   		};
>   	};
> +};
>
> -	ahb {
> -		bmc_pnor: fmc@1e620000 {
> -			reg = < 0x1e620000 0x94
> -				0x20000000 0x02000000 >;
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -			compatible = "aspeed,ast2400-fmc";
> -			aspeed,fmc-has-dma;
> -			interrupts = <19>;
> -			flash@0 {
> -				reg = < 0 >;
> -				compatible = "jedec,spi-nor" ;
> +&fmc {
> +	status = "okay";
> +	flash@0 {
> +		status = "okay";
> +		m25p,fast-read;
>   #include "aspeed-bmc-opp-flash-layout.dtsi"
> -			};
> -		};
> +	};
> +};
>
> -		host_pnor: spi@1e630000 {
> -			reg = < 0x1e630000 0x18
> -				0x30000000 0x01000000 >;
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -			compatible = "aspeed,ast2400-smc";
> -			flash {
> -				reg = < 0 >;
> -				compatible = "jedec,spi-nor" ;
> -				label = "pnor";
> -			};
> -		};
> +&spi {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_spi1_default>;
> +
> +	flash@0 {
> +		status = "okay";
> +		m25p,fast-read;
> +		label = "pnor";
>   	};
>   };
>
> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
> index d8827d522dfe..9a329cee72bf 100644
> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> @@ -44,6 +44,40 @@
>   		#size-cells = <1>;
>   		ranges;
>
> +		fmc: fmc@1e620000 {
> +			reg = < 0x1e620000 0x94
> +				0x20000000 0x02000000 >;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			compatible = "aspeed,ast2400-fmc";
> +			status = "disabled";
> +			aspeed,fmc-has-dma;
> +			interrupts = <19>;
> +			clocks = <&clk_ahb>;
> +			clock-names = "ahb";
> +			flash@0 {
> +				reg = < 0 >;
> +				compatible = "jedec,spi-nor" ;
> +				status = "disabled";
> +			};
> +		};
> +
> +		spi: spi@1e630000 {
> +			reg = < 0x1e630000 0x18
> +				0x30000000 0x02000000 >;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			compatible = "aspeed,ast2400-spi";
> +			status = "disabled";
> +			clocks = <&clk_ahb>;
> +			clock-names = "ahb";
> +			flash@0 {
> +				reg = < 0 >;
> +				compatible = "jedec,spi-nor" ;
> +				status = "disabled";
> +			};
> +		};
> +
>   		vic: interrupt-controller@1e6c0080 {
>   			compatible = "aspeed,ast2400-vic";
>   			interrupt-controller;
