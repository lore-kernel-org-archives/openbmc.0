Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="e6GU2qb+"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ZhLXnTux"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 408jPx1nTTzF1yc
 for <openbmc@lists.ozlabs.org>; Mon, 26 Mar 2018 16:29:40 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 15C0C20ABF;
 Mon, 26 Mar 2018 01:29:38 -0400 (EDT)
Received: from web5 ([10.202.2.215])
 by compute4.internal (MEProxy); Mon, 26 Mar 2018 01:29:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=zOuhkuS7b6y7TVxq0cXDQg7hXEkl9
 hjRTo48FQG0q0A=; b=e6GU2qb+6fJ7czbeFIaNXVnkLUhJG7laRHRAKXKK1qwt7
 +t+Bib4txOMVyyKabXWr5/JKhsMR/71mkOgbxJsTInDAFARBE7XmsnIUJDc/klTg
 HckXvjV5aXVH1diMU76TkBnzqDxfpeaiyHGcsvXbpwlrIJyRUUFiwUcQuxKsnsHv
 OX23gwWql7/ub9OioPcKUqU3krEjb4IcKhCZ2OAM4d3rxCGB+RdtjNY7JravdwFD
 WkhkbhqIhXFSgMBysEKcqBN732C9ZVnZQZ5IcvyJUmVv6yz7XzGNL5SW2Vm5DIoG
 2xuFU29Z28Vb7EU6worOl4g3LI7En+MvVnN/EFOxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=zOuhku
 S7b6y7TVxq0cXDQg7hXEkl9hjRTo48FQG0q0A=; b=ZhLXnTux242WLpS8PToCxB
 IITetAk2RysB5wGqG5cjTOwKaDoKSUHn+2x5+JPRgJuNuHV8gFGnWuaOqHJgyYxo
 B/fwOZagMZWu0kOLSJ67qbbCVl6DtndiBecFV+OsgEDsSkpzOLlP9DHYow0kmD67
 xdhMGYdYUAQNE5lk1elCmmt8NzgFf5zMgJ37MZxMmEHbggcg1UcJU7SCiPSnH1ea
 rF/x+5hXJJxv2/O3dmGGwvy7GMZV+M7hhyo1nUt9mz49XXy2cnq5TPKOiZth6ZZT
 wmtU0T2xE/S86OBLMdnZOsnNhnx7yGhCaULe7yEIEbx71n5TvwGd5RRqAdaZ6b/A
 ==
X-ME-Sender: <xms:QYW4WtbGZCCNz6z6faQxnwtSF-_9x7vgIbFURM_0M_81EMiD85OGrw>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id BEA489E082; Mon, 26 Mar 2018 01:29:37 -0400 (EDT)
Message-Id: <1522042177.1368254.1315849280.2DA4E14C@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Amithash Prasad <amithash@fb.com>, openbmc@lists.ozlabs.org, joel@jms.id.au
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-5ce6c4ba
References: <20180323190533.3105887-1-amithash@fb.com>
Subject: Re: [PATCH v3 linux dev-4.10] ARM: dts: aspeed: Add Portwell Neptune
 machine
Date: Mon, 26 Mar 2018 15:59:37 +1030
In-Reply-To: <20180323190533.3105887-1-amithash@fb.com>
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
X-List-Received-Date: Mon, 26 Mar 2018 05:29:43 -0000

Hi Amithash,

On Sat, 24 Mar 2018, at 05:35, Amithash Prasad wrote:
> Initial introduction of Portwell Neptune family equipped with
> Aspeed 2500 BMC SoC. Neptune is a x86 server development kit with a
> ASPEED ast2500 BMC manufactured by Portwell. Specifically, This
> adds the neptune platform device tree file including the flash
> layout used by the neptune machines.
> 
> Signed-off-by: Amithash Prasad <amithash@fb.com>
> ---
>  .../devicetree/bindings/vendor-prefixes.txt        |   1 +
>  arch/arm/boot/dts/Makefile                         |   1 +
>  arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts  | 162 +++++++++++++++++++++
>  3 files changed, 164 insertions(+)
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
> index 0000000..93e93d6
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts
> @@ -0,0 +1,162 @@
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
> +	pinctrl-0 = <&pinctrl_rmii1_default>;

This still looks under-specified - I expect you need to add `use-ncsi` here, or specify `&pinctrl_mdio1_default` in the pinctrl-0 node above (as you have to do one or the other, not neither, for RMII).

Everything else looks okay though from a pinmux perspective.

Cheers,

Andrew

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
