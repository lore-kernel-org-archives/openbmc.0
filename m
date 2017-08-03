Return-Path: <clg@kaod.org>
Received: from 7.mo7.mail-out.ovh.net (7.mo7.mail-out.ovh.net [46.105.43.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xNl0k1nZ8zDqHq
 for <openbmc@lists.ozlabs.org>; Fri,  4 Aug 2017 08:22:14 +1000 (AEST)
Received: from player697.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id AACCD65925
 for <openbmc@lists.ozlabs.org>; Fri,  4 Aug 2017 00:16:32 +0200 (CEST)
Received: from zorba.kaod.org (bad36-1-78-202-132-1.fbx.proxad.net
 [78.202.132.1]) (Authenticated sender: postmaster@kaod.org)
 by player697.ha.ovh.net (Postfix) with ESMTPSA id EBC6748008B;
 Fri,  4 Aug 2017 00:16:25 +0200 (CEST)
Subject: Re: [PATCH linux dev-4.10 v7] ARM: dts: aspeed: witherspoon: Add
 gpio-keys-polled for fan presence
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
References: <1501786248-5447-1-git-send-email-eajames@linux.vnet.ibm.com>
Cc: cbostic@linux.vnet.ibm.com, joel@jms.id.au,
 "Edward A. James" <eajames@us.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <0afaecee-1c26-2283-5fc1-138396455bbd@kaod.org>
Date: Fri, 4 Aug 2017 00:16:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1501786248-5447-1-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 11583258242451934193
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelkedrjeeggdduvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Thu, 03 Aug 2017 22:22:14 -0000

On 08/03/2017 08:50 PM, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
> 
> Add gpio-keys-polled node for pca955x fan presence lines. Change the binding
> of the pca9552 to remove the leds and instead define all the provided gpio pins
> there. Add back the leds in a 'gpio-leds' compatible entry.
> 
> Polling period of 1 second to be determined to be the max acceptable
> value based on discussions with Brad Bishop and Matt Spinler. Tested
> with gpiomon program - verified.
> 
> Patch based on Cedric's example - thanks! Tested on witherspoon.

You did the most difficult part: testing. 

Acked-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C. 


> 
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 152 ++++++++++++++++++-----
>  1 file changed, 124 insertions(+), 28 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> index c0f992e..9ab8e46 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -56,6 +56,77 @@
>  		};
>  	};
>  
> +	gpio-keys-polled {
> +		compatible = "gpio-keys-polled";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		poll-interval = <1000>;
> +
> +		fan0-presence {
> +			label = "fan0-presence";
> +			gpios = <&pca0 4 GPIO_ACTIVE_LOW>;
> +			linux,code = <4>;
> +		};
> +
> +		fan1-presence {
> +			label = "fan1-presence";
> +			gpios = <&pca0 5 GPIO_ACTIVE_LOW>;
> +			linux,code = <5>;
> +		};
> +
> +		fan2-presence {
> +			label = "fan2-presence";
> +			gpios = <&pca0 6 GPIO_ACTIVE_LOW>;
> +			linux,code = <6>;
> +		};
> +
> +		fan3-presence {
> +			label = "fan3-presence";
> +			gpios = <&pca0 7 GPIO_ACTIVE_LOW>;
> +			linux,code = <7>;
> +		};
> +	};
> +
> +	pca_leds {
> +		compatible = "gpio-leds";
> +
> +		fan0 {
> +			label = "fan0";
> +			default-state = "keep";
> +			gpios = <&pca0 0 GPIO_ACTIVE_LOW>;
> +		};
> +		fan1 {
> +			label = "fan1";
> +			default-state = "keep";
> +			gpios = <&pca0 1 GPIO_ACTIVE_LOW>;
> +		};
> +		fan2 {
> +			label = "fan2";
> +			default-state = "keep";
> +			gpios = <&pca0 2 GPIO_ACTIVE_LOW>;
> +		};
> +		fan3 {
> +			label = "fan3";
> +			default-state = "keep";
> +			gpios = <&pca0 3 GPIO_ACTIVE_LOW>;
> +		};
> +		front_fault {
> +			label = "front-fault";
> +			default-state = "keep";
> +			gpios = <&pca0 13 GPIO_ACTIVE_LOW>;
> +		};
> +		front_power {
> +			label = "front-power";
> +			default-state = "keep";
> +			gpios = <&pca0 14 GPIO_ACTIVE_LOW>;
> +		};
> +		front_id {
> +			label = "front-id";
> +			default-state = "keep";
> +			gpios = <&pca0 15 GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +
>  	leds {
>  		compatible = "gpio-leds";
>  
> @@ -278,47 +349,72 @@
>  		#address-cells = <1>;
>  		#size-cells = <0>;
>  
> -		fan0: led@0 {
> -			label = "fan0";
> -			default-state = "keep";
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		gpio@0 {
>  			reg = <0>;
> -			type = <PCA955X_TYPE_LED>;
> +			type = <PCA955X_TYPE_GPIO>;
>  		};
> -		fan1: led@1 {
> -			label = "fan1";
> -			default-state = "keep";
> +		gpio@1 {
>  			reg = <1>;
> -			type = <PCA955X_TYPE_LED>;
> +			type = <PCA955X_TYPE_GPIO>;
>  		};
> -		fan2: led@2 {
> -			label = "fan2";
> -			default-state = "keep";
> +		gpio@2 {
>  			reg = <2>;
> -			type = <PCA955X_TYPE_LED>;
> +			type = <PCA955X_TYPE_GPIO>;
>  		};
> -		fan3: led@3 {
> -			label = "fan3";
> -			default-state = "keep";
> +		gpio@3 {
>  			reg = <3>;
> -			type = <PCA955X_TYPE_LED>;
> +			type = <PCA955X_TYPE_GPIO>;
>  		};
> -		front_fault: led@13 {
> -			label = "front-fault";
> -			default-state = "keep";
> +		gpio@4 {
> +			reg = <4>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +		gpio@5 {
> +			reg = <5>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +		gpio@6 {
> +			reg = <6>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +		gpio@7 {
> +			reg = <7>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +		gpio@8 {
> +			reg = <8>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +		gpio@9 {
> +			reg = <9>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +		gpio@10 {
> +			reg = <10>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +		gpio@11 {
> +			reg = <11>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +		gpio@12 {
> +			reg = <12>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +		gpio@13 {
>  			reg = <13>;
> -			type = <PCA955X_TYPE_LED>;
> +			type = <PCA955X_TYPE_GPIO>;
>  		};
> -		front_power: led@14 {
> -			label = "front-power";
> -			default-state = "keep";
> +		gpio@14 {
>  			reg = <14>;
> -			type = <PCA955X_TYPE_LED>;
> +			type = <PCA955X_TYPE_GPIO>;
>  		};
> -		front_id: led@15 {
> -			label = "front-id";
> -			default-state = "keep";
> +		gpio@15 {
>  			reg = <15>;
> -			type = <PCA955X_TYPE_LED>;
> +			type = <PCA955X_TYPE_GPIO>;
>  		};
>  	};
>  };
> 
