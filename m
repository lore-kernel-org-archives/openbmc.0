Return-Path: <clg@kaod.org>
Received: from 4.mo2.mail-out.ovh.net (4.mo2.mail-out.ovh.net [87.98.172.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wbwh45q8KzDq5W
 for <openbmc@lists.ozlabs.org>; Mon, 29 May 2017 22:16:20 +1000 (AEST)
Received: from player692.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id BCC7589062
 for <openbmc@lists.ozlabs.org>; Mon, 29 May 2017 12:56:33 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-10647-27.w90-89.abo.wanadoo.fr
 [90.89.233.27]) (Authenticated sender: postmaster@kaod.org)
 by player692.ha.ovh.net (Postfix) with ESMTPSA id AD1AB600097;
 Mon, 29 May 2017 12:56:27 +0200 (CEST)
Subject: Re: [PATCH linux dev-4.10 v4] arm: dts: aspeed: Add missing clock
 sources for barreleye
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
References: <1495815002-1808-1-git-send-email-eajames@linux.vnet.ibm.com>
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <6f8cb5f9-1b95-4caf-8257-163a36208045@kaod.org>
Date: Mon, 29 May 2017 12:56:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1495815002-1808-1-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 18329650484541098993
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeljedrgedvgdefiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Mon, 29 May 2017 12:16:21 -0000

Hello Edward,

On 05/26/2017 06:10 PM, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
> 
> Reorganize flash controllers into the ast2400 config and edit all the
> ast2400 machine configs.  Barreleye wasn't booting with the new
> aspeed-smc driver.

There are a couple of "m25p,fast-read" properties missing below. 
Is that on purpose ?

Thanks,

C. 

> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts | 44 ++++++++-------------
>  arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts | 37 ++++++------------
>  arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts  | 47 +++++++---------------
>  arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts  | 54 +++++++++-----------------
>  arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts   | 38 ++++++------------
>  arch/arm/boot/dts/aspeed-g4.dtsi               | 34 ++++++++++++++++
>  6 files changed, 106 insertions(+), 148 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
> index be1f2d1..6c4221c 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
> @@ -31,34 +31,6 @@
>  		};
>  	};
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
>  	leds {
>  		compatible = "gpio-leds";
>  
> @@ -76,6 +48,22 @@
>  	};
>  };
>  
> +&bmc_pnor {
> +	status = "okay";

no m25p,fast-read; ? 

> +	flash@0 {
> +		status = "okay";
> +#include "aspeed-bmc-opp-flash-layout.dtsi"
> +	};
> +};
> +
> +&host_pnor {
> +	status = "okay";


no m25p,fast-read; ? 

> +	flash@0 {
> +		status = "okay";
> +		label = "pnor";
> +	};
> +};
> +
>  &pinctrl {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_flbusy_default &pinctrl_flwp_default
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> index fe63621..dffe1cd 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> @@ -50,34 +50,21 @@
>  			gpios = <&gpio ASPEED_GPIO(A, 2) GPIO_ACTIVE_LOW>;
>  		};
>  	};
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
> +&bmc_pnor {
> +	status = "okay";


no m25p,fast-read; ? 

> +	flash@0 {
> +		status = "okay";
>  #include "aspeed-bmc-opp-flash-layout.dtsi"
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
> +&host_pnor {
> +	status = "okay";


no m25p,fast-read; ? 

> +	flash@0 {
> +		status = "okay";
> +		label = "pnor";
>  	};
>  };
>  
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
> index 121612a..c6c5e14 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
> @@ -30,42 +30,23 @@
>  			reg = <0x5f000000 0x01000000>; /* 16MB */
>  		};
>  	};
> +};
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
> +&bmc_pnor {
> +	status = "okay";
> +	flash@0 {
> +		status = "okay";
> +		m25p,fast-read;
>  #include "aspeed-bmc-opp-flash-layout.dtsi"
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
> +&host_pnor {
> +	status = "okay";
> +	flash@0 {
> +		status = "okay";
> +		label = "pnor";
> +		m25p,fast-read;
>  	};
>  };
>  
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> index b4faa1d..f343aa4 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> @@ -47,42 +47,6 @@
>                  };
>          };
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
>  	gpio-fsi {
>  		compatible = "fsi-master-gpio", "fsi-master";
>  
> @@ -94,6 +58,24 @@
>  	};
>  };
>  
> +&bmc_pnor {
> +	status = "okay";
> +	flash@0 {
> +		status = "okay";
> +		m25p,fast-read;
> +#include "aspeed-bmc-opp-flash-layout.dtsi"
> +	};
> +};
> +
> +&host_pnor {
> +	status = "okay";
> +	flash@0 {
> +		status = "okay";
> +		label = "pnor";
> +		m25p,fast-read;
> +	};
> +};
> +
>  &pinctrl {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_flbusy_default &pinctrl_flwp_default
> diff --git a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> index 7132460..e55685d 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> @@ -30,35 +30,21 @@
>  			reg = <0x47800000 0x00800000>; /* 8MB */
>  		};
>  	};
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
> +&bmc_pnor {
> +	status = "okay";


no m25p,fast-read; ? 

> +	flash@0 {
> +		status = "okay";
>  #include "aspeed-bmc-opp-flash-layout.dtsi"
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
> +&host_pnor {
> +	status = "okay";


no m25p,fast-read; ? 


> +	flash@0 {
> +		status = "okay";
> +		label = "pnor";
>  	};
>  };
>  
> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
> index d8827d5..9fb7889 100644
> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> @@ -44,6 +44,40 @@
>  		#size-cells = <1>;
>  		ranges;
>  
> +		bmc_pnor: fmc@1e620000 {
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
> +		host_pnor: spi@1e630000 {
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
>  		vic: interrupt-controller@1e6c0080 {
>  			compatible = "aspeed,ast2400-vic";
>  			interrupt-controller;
> 
