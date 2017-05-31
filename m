Return-Path: <clg@kaod.org>
Received: from 3.mo5.mail-out.ovh.net (3.mo5.mail-out.ovh.net [46.105.40.108])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wdH294tmFzDqBJ
 for <openbmc@lists.ozlabs.org>; Thu,  1 Jun 2017 03:06:41 +1000 (AEST)
Received: from player695.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id D2D06FDFDB
 for <openbmc@lists.ozlabs.org>; Wed, 31 May 2017 18:50:00 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-10647-27.w90-89.abo.wanadoo.fr
 [90.89.233.27]) (Authenticated sender: postmaster@kaod.org)
 by player695.ha.ovh.net (Postfix) with ESMTPSA id F2F59460086;
 Wed, 31 May 2017 18:49:53 +0200 (CEST)
Subject: Re: [PATCH linux dev-4.10] arm: dts: aspeed: Update old style flash
 nodes
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
References: <20170531135614.7170-1-joel@jms.id.au>
Cc: "Edward A. James" <eajames@us.ibm.com>,
 Eddie James <eajames@linux.vnet.ibm.com>, Andrew Jeffery <andrew@aj.id.au>,
 Mykola Kostenok <c_mykolak@mellanox.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <51f0d0dd-eb92-5a48-3af1-7f8f0f2f4000@kaod.org>
Date: Wed, 31 May 2017 18:49:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170531135614.7170-1-joel@jms.id.au>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 17597815547637500679
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeljedrgeeigddutdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Wed, 31 May 2017 17:06:42 -0000

On 05/31/2017 03:56 PM, Joel Stanley wrote:
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
> 
> Cedric, can you please double check I didn't stuff anything up?

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks for the cleanup,

C.


> 
> Andrew, can you reivew for pinmux correctness?
> 
> Mykola, please reply with "Acked-by: Mykola Kostenok <c_mykolak@mellanox.com>"
> if the changes to the Mellanox device tree look okay to you. They should be
> functionally the same as before.
> 
>  arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts  | 19 ++++-----
>  arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts  | 20 ++++-----
>  arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts | 49 ++++++++++------------
>  arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts | 42 ++++++++-----------
>  arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts  | 51 ++++++++---------------
>  arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts  | 57 ++++++++++----------------
>  arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts   | 43 ++++++++-----------
>  arch/arm/boot/dts/aspeed-g4.dtsi               | 34 +++++++++++++++
>  8 files changed, 142 insertions(+), 173 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
> index 8df116ea8594..ff5058ee8834 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
> @@ -18,21 +18,16 @@
>  	memory {
>  		reg = <0x80000000 0x3f000000>;
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
> -			flash@0 {
> -				reg = < 0 >;
> -				compatible = "jedec,spi-nor" ;
> +&fmc {
> +	status = "okay";
> +	flash@0 {
> +		status = "okay";
> +		m25p,fast-read;
>  #include "aspeed-bmc-facebook-cmm-flash-layout.dtsi"
> -			};
> -		};
>  	};
> +
>  };
>  
>  &uart1 {
> diff --git a/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts b/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
> index 649964a3726a..c71a6dbe1410 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
> @@ -22,20 +22,14 @@
>  		reg = <0x80000000 0x20000000>;
>  	};
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
>  #include "aspeed-bmc-mellanox-msn-flash-layout.dtsi"
> -			};
> -		};
>  	};
>  };
>  
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
> index be1f2d120fee..9f7098876ecb 100644
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
> @@ -76,6 +48,27 @@
>  	};
>  };
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
>  &pinctrl {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_flbusy_default &pinctrl_flwp_default
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> index fe63621365fd..430622c86ef7 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> @@ -50,34 +50,26 @@
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
> +&fmc {
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
>  	};
>  };
>  
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
> index 121612a8776e..b64edad3e050 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
> @@ -30,42 +30,27 @@
>  			reg = <0x5f000000 0x01000000>; /* 16MB */
>  		};
>  	};
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
> +&spi {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_spi1_default>;
> +
> +	flash@0 {
> +		status = "okay";
> +		m25p,fast-read;
> +		label = "pnor";
>  	};
>  };
>  
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> index b4faa1d79460..60792f6ff7ec 100644
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
> @@ -94,6 +58,27 @@
>  	};
>  };
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
>  &pinctrl {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_flbusy_default &pinctrl_flwp_default
> diff --git a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> index 713246090906..50be8dd921cf 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> @@ -30,35 +30,26 @@
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
> +&fmc {
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
>  	};
>  };
>  
> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
> index d8827d522dfe..9a329cee72bf 100644
> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> @@ -44,6 +44,40 @@
>  		#size-cells = <1>;
>  		ranges;
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
>  		vic: interrupt-controller@1e6c0080 {
>  			compatible = "aspeed,ast2400-vic";
>  			interrupt-controller;
> 
