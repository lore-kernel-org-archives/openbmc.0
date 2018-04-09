Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="ctQthcz0"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="li5VIpYf"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40KG9n3dNyzDqy8
 for <openbmc@lists.ozlabs.org>; Mon,  9 Apr 2018 13:33:49 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C11A420B3B;
 Sun,  8 Apr 2018 23:33:46 -0400 (EDT)
Received: from web4 ([10.202.2.214])
 by compute4.internal (MEProxy); Sun, 08 Apr 2018 23:33:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=K/NKtDgmmBQOki40S8jbY9tShV5KP
 AZOKwHz+NWK6mk=; b=ctQthcz00vSicPcDR1zgmsD25u9znvl2cw50K0zdgSUaL
 eV6DYNy539U3FusIunKhnOD0uosrnPG34PvZgQVB+0dPc3Ds0KyneJXKuLkc5mbo
 hVW5RWGLnAEWfo0hGNB4JQjJxDqi9GdstE68DKSSercnt1tZX7tav9pJt9V2812d
 zmOaWob3d667EDPNXmxG1BtUBcax2CYFACzbo7ve/l1CES2Vvar+pY1xCHZKhHVJ
 jFLd4iDbhas4haJoLdkinMiPVR4H06XQGu7ajSzGVcrt4xE9vS1DcnrHcRJdlUvy
 Y/OlI949xUniuVi8CZ8K8kfDk/VPGFdLggHGHsEQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=K/NKtD
 gmmBQOki40S8jbY9tShV5KPAZOKwHz+NWK6mk=; b=li5VIpYfQgRRwr3cnN51es
 4ZUUNIBQCCHoAmZ0TlE0Phs20N15auN2n56d7weCT6q8QprXbW4Xe24x/WUlf/uk
 +rkxUlkkhjarbIKb0Pu46tSGyWmSpRMHH3dW0TZa8DB7O924O6Ip7s0/4gsYJnzP
 r3o9Idv/ZUAG1U+XlfTjHo63ru+2RdBeEIMYFXWM0bEtqhYi/O1JZAC9HWiVbb8r
 y4YIM9uoTnQplaWH9wqxz7YKF13N3NdifwDtOojAD45rjbpFbNW+V7stdoLw4TOi
 mgdFUo46VCLxwhXLU1UtN/h+GKHIBrKybXUsLZOpAgHzio7QJB6fIbzvgHphYL+w
 ==
X-ME-Sender: <xms:Gt_KWqKsF5SYf7Rv5nvY9GqUYyd01zjqidMb-vgO4mOOjFoa8q5cQw>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 70FA1BA43C; Sun,  8 Apr 2018 23:33:46 -0400 (EDT)
Message-Id: <1523244826.776074.1331045080.070C8C03@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Amithash Prasad <amithash@fb.com>, openbmc@lists.ozlabs.org, joel@jms.id.au
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-61ab7380
Date: Mon, 09 Apr 2018 13:03:46 +0930
In-Reply-To: <20180327001149.2980565-1-amithash@fb.com>
References: <20180327001149.2980565-1-amithash@fb.com>
Subject: Re: [PATCH v3 linux dev-4.13] ARM: dts: aspeed: Add Portwell Neptune
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
X-List-Received-Date: Mon, 09 Apr 2018 03:33:51 -0000

On Tue, 27 Mar 2018, at 09:41, Amithash Prasad wrote:
> Initial introduction of Portwell Neptune family equipped with
> Aspeed 2500 BMC SoC. Neptune is a x86 server development kit with a
> ASPEED ast2500 BMC manufactured by Portwell. Specifically, This
> adds the neptune platform device tree file including the flash
> layout used by the neptune machines.
> 
> Signed-off-by: Amithash Prasad <amithash@fb.com>

Acked-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  .../devicetree/bindings/vendor-prefixes.txt        |   1 +
>  arch/arm/boot/dts/Makefile                         |   3 +-
>  arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts  | 159 +++++++++++++++++++++
>  3 files changed, 162 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/
> Documentation/devicetree/bindings/vendor-prefixes.txt
> index daf465be..ad3406d 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -255,6 +255,7 @@ pine64	Pine64
>  pixcir  PIXCIR MICROELECTRONICS Co., Ltd
>  plathome	Plat'Home Co., Ltd.
>  plda	PLDA
> +portwell	Portwell Inc.
>  poslab	Poslab Technology Co., Ltd.
>  powervr	PowerVR (deprecated, use img)
>  pulsedlight	PulsedLight, Inc
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 5cfee25..4746060 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1061,7 +1061,8 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>  	aspeed-bmc-opp-romulus.dtb \
>  	aspeed-bmc-opp-witherspoon.dtb \
>  	aspeed-bmc-opp-zaius.dtb \
> -	aspeed-bmc-quanta-q71l.dtb
> +	aspeed-bmc-quanta-q71l.dtb \
> +	aspeed-bmc-portwell-neptune.dtb
>  endif
>  
>  dtstree		:= $(srctree)/$(src)
> diff --git a/arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts b/arch/
> arm/boot/dts/aspeed-bmc-portwell-neptune.dts
> new file mode 100644
> index 0000000..43ed139
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts
> @@ -0,0 +1,159 @@
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
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_txd1_default
> +		     &pinctrl_rxd1_default>;
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
> +	pinctrl-0 = <&pinctrl_rmii1_default
> +		     &pinctrl_mdio1_default>;
> +};
> +
> +&mac1 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_rmii2_default>;
> +	use-ncsi;
> +};
> +
> +&i2c1 {
> +	status = "okay";
> +	// To PCIe slot SMBUS
> +};
> +
> +&i2c2 {
> +	status = "okay";
> +	// To LAN I210
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
> +// 	USB Debug card
> +	pca9555@27 {
> +		compatible = "nxp,pca9555";
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
> +	tmp421@4e {
> +		compatible = "ti,tmp421";
> +		reg = <0x4e>;
> +	};
> +	tmp421@4f {
> +		compatible = "ti,tmp421";
> +		reg = <0x4f>;
> +	};
> +};
> +
> +&i2c8 {
> +	status = "okay";
> +	eeprom@51 {
> +		compatible = "atmel,24c128";
> +		reg = <0x51>;
> +		pagesize = <32>;
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
> +		reg = <0x00>;
> +		aspeed,fan-tach-ch = /bits/ 8 <0x01>;
> +	};
> +};
> -- 
> 2.9.5
> 


-- 
  Andrew Jeffery
  andrew@aj.id.au
