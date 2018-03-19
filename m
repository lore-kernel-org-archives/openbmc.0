Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Kt35Hx0T"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="j/oAsOvh"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 404N0g3jJDzF0n6
 for <openbmc@lists.ozlabs.org>; Mon, 19 Mar 2018 15:11:14 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 1E70B20A7F;
 Mon, 19 Mar 2018 00:11:09 -0400 (EDT)
Received: from web5 ([10.202.2.215])
 by compute4.internal (MEProxy); Mon, 19 Mar 2018 00:11:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=fG51HhHtr/MZBavp+qhQPQCQQW9UC
 pCiy7wbFT8KA48=; b=Kt35Hx0TajvZKIt0SAovW9DKFuJDtZqDL5Z2EcbahWyYO
 UUpAX57T9F8pW6vS2AtU7aDIlkvb3leYQTUqP0DWmLkM81AOKItFAOicZbEmITxq
 VlbLqQA/x1BPFdOqIwiarleywolnNtpuk73kY6jrZqkY2PfUfSAVaEAX/06WV1xr
 kgJCPyF+IMedikoKaTuUCFKNvBJwl4LqGPNjAz0NaaiXuMF4aqr87whmkzX3S/5g
 h6BGEZByuVmvTUAx53wke2qqf5rv6LRiuFc30QsCt/G8cOmuXotnrkslaPRM7Bun
 liRq8ZCBEnKCo5Qm/4MYUJIVXkN49R0VXCkawMBdw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=fG51Hh
 Htr/MZBavp+qhQPQCQQW9UCpCiy7wbFT8KA48=; b=j/oAsOvhLbLdBg2NJf2Sxy
 0HkadPFtOfPMIi1O2uSxMSYUH5l5w5AFqqvfq7kte4OzN/LDipYOJsJVqdpxsDV/
 G6pN+Gi7tSVb78E6lPGOSgr0V2M+NMmaik/lP4Wr+0kBQXfADt3czrAn+WKlSuwF
 n4mHkhS9ru3fQ/Uktry1T5yWkTiyR9nI9fP3yXSD6YDJ/FyvWQMELyhmywwo0I2Z
 d+guDQT1sOMaaZk7L/VGPBYFBOfwTFKZ/mfiSTG6cYayEK1cxGNxBS9aZs4+dIbV
 vHt6OiAKy59MUltXmzhFsvpZm3BUl3uJIPb2zamXCZZqFluDAuUbhqSOsCHv8whA
 ==
X-ME-Sender: <xms:XTivWoUob59b2CeYtwRDABnKLreJ6qfy9qcZSxcpavIvgjutMbXnMg>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id D236E9E083; Mon, 19 Mar 2018 00:11:08 -0400 (EDT)
Message-Id: <1521432668.4081064.1307719072.6699222C@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Amithash Prasad <amithash@fb.com>, openbmc@lists.ozlabs.org, joel@jms.id.au
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-5ce6c4ba
Date: Mon, 19 Mar 2018 14:41:08 +1030
References: <20180313230415.1902364-1-amithash@fb.com>
In-Reply-To: <20180313230415.1902364-1-amithash@fb.com>
Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed: Add Portwell Neptune
 machine
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
X-List-Received-Date: Mon, 19 Mar 2018 04:11:17 -0000

Hi Amithash,

I have some pinmux-related comments inline below.

On Wed, 14 Mar 2018, at 09:34, Amithash Prasad wrote:
> Initial introduction of Portwell Neptune family equipped with
> Aspeed 2500 BMC SoC. This adds the neptune platform device tree
> file including the flash layout used by the neptune machines.
> 
> Signed-off-by: Amithash Prasad <amithash@fb.com>
> ---
>  .../devicetree/bindings/vendor-prefixes.txt        |   1 +
>  arch/arm/boot/dts/Makefile                         |   1 +
>  arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts  | 145 +++++++++++++++++++++
>  3 files changed, 147 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/
> Documentation/devicetree/bindings/vendor-prefixes.txt
> index 84601d8..9dbbe7d 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -228,6 +228,7 @@ pine64	Pine64
>  pixcir  PIXCIR MICROELECTRONICS Co., Ltd
>  plathome	Plat'Home Co., Ltd.
>  plda	PLDA
> +portwell	Portwell Inc.
>  powervr	PowerVR (deprecated, use img)
>  pulsedlight	PulsedLight, Inc
>  qca	Qualcomm Atheros, Inc.
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 7c54fc8..044b960 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -993,6 +993,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += aspeed-bmc-opp-
> palmetto.dtb \
>  	aspeed-bmc-mellanox-msn.dtb \
>  	aspeed-bmc-quanta-q71l.dtb \
>  	aspeed-bmc-intel-s2600wf.dtb \
> +	aspeed-bmc-portwell-neptune.dtb \
>  	aspeed-ast2500-evb.dtb
>  endif
>  
> diff --git a/arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts b/arch/
> arm/boot/dts/aspeed-bmc-portwell-neptune.dts
> new file mode 100644
> index 0000000..542a4cad
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts
> @@ -0,0 +1,145 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2017 Facebook Inc.
> +/dts-v1/;
> +
> +#include "aspeed-g5.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +
> +/ {
> +	model = "Portwell Neptune BMC";
> +	compatible = "portwell,neptune-bmc", "aspeed,ast2500";
> +	aliases {
> +		serial0 = &uart1;
> +		serial4 = &uart5;
> +	};
> +	chosen {
> +		stdout-path = &uart5;
> +		bootargs = "console=ttyS4,115200 earlyprintk";
> +	};
> +
> +	memory {
> +		reg = <0x80000000 0x20000000>;
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +		postcode0 {
> +			label="BMC_UP";
> +			gpios = <&gpio ASPEED_GPIO(H, 0) GPIO_ACTIVE_HIGH>;
> +			default-state = "on";
> +		};
> +		postcode1 {
> +			label="BMC_HB";
> +			gpios = <&gpio ASPEED_GPIO(H, 1) GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger = "heartbeat";
> +		};
> +		postcode2 {
> +			label="FAULT";
> +			gpios = <&gpio ASPEED_GPIO(H, 2) GPIO_ACTIVE_HIGH>;
> +		};
> +		// postcode3-7 are GPIOH3-H7
> +	};
> +};
> +
> +&wdt2 {
> +	status = "okay";

If you're doing anything with the watchdog reset lines you'll need to mux the WDTRST2 function. Obviously if not then you don't need to worry.

> +};
> +
> +&fmc {
> +	status = "okay";
> +	flash@0 {
> +		status = "okay";
> +		m25p,fast-read;
> +#include "openbmc-flash-layout.dtsi"
> +	};
> +};
> +
> +&spi1 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_spi1_default>;
> +	flash@0 {
> +		status = "okay";
> +		m25p,fast-read;
> +		label = "pnor";
> +	};
> +};
> +
> +&uart1 {
> +	// Host Console
> +	status = "okay";

You'll need something like the following here:

	pinctrl-names = "default";
	pinctrl-0 = <&pinctrl_txd1_default
			&pinctrl_rxd1_default
			&pinctrl_nrts1_default
			&pinctrl_ndtr1_default
			&pinctrl_ndsr1_default
			&pinctrl_ncts1_default
			&pinctrl_ndcd1_default
			&pinctrl_nri1_default>;

It depends on how you've wired up your UART to the connector as to how many of those pins you'll want to mux.

> +};
> +
> +&uart5 {
> +	// BMC Console
> +	status = "okay";
> +};
> +
> +&mac0 {
> +	status = "okay";
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_rmii1_default>;
> +	use-ncsi;
> +};
> +
> +&i2c3 {
> +	status = "okay";
> +	// SMBus to COMe AB
> +};
> +
> +&i2c4 {
> +	status = "okay";
> +	// I2C to COMe AB
> +};
> +
> +&i2c5 {
> +	status = "okay";
> +	pca9555@4e {
> +		compatible = "nxp,pca9555";
> +		pinctrl-names = "default";

I think you'll need to say what function you wish to mux here, unless this is some quirk of the pca9555. Certainly the example in the documentation has a pinctrl-0 = <...> property.

> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		reg = <0x27>;
> +	};
> +};
> +
> +&i2c6 {
> +	status = "okay";
> +	tpm@20 {
> +		compatible = "infineon,slb9645tt";
> +		reg = <0x20>;
> +	};
> +	tmp421@9c {
> +		compatible = "ti,tmp421";
> +		reg = <0x4e>;
> +	};
> +	tmp421@9e {
> +		compatible = "ti,tmp421";
> +		reg = <0x4f>;
> +	};
> +};
> +
> +&i2c8 {
> +	status = "okay";
> +	eeprom@a2 {
> +		compatible = "atmel,24c128";
> +		reg = <0x51>;
> +		pagesize = <0x32>;
> +	};
> +};
> +
> +&pwm_tacho {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default>;
> +	fan@0 {
> +		reg = <0x00>;
> +		aspeed,fan-tach-ch = /bits/ 8 <0x00>;
> +	};
> +
> +	fan@1 {
> +		reg = <0x01>;
> +		aspeed,fan-tach-ch = /bits/ 8 <0x01>;
> +	};
> +};
> -- 
> 2.9.5
> 

Looks okay otherwise.

Cheers,

Andrew
