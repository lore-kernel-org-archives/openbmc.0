Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="DOapibKd"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="NKRjlZ6N"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40Mgs94MyLzF1S4
 for <openbmc@lists.ozlabs.org>; Fri, 13 Apr 2018 11:57:49 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id ADAA621B15
 for <openbmc@lists.ozlabs.org>; Thu, 12 Apr 2018 21:57:46 -0400 (EDT)
Received: from web4 ([10.202.2.214])
 by compute4.internal (MEProxy); Thu, 12 Apr 2018 21:57:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=+JC0XzkXMw6NITqeBLpTScXB4Hxu2
 VFqdCSIedbbjLg=; b=DOapibKdMkuQCQbch/pb65mMex8Eh3pbeO8cnHhbI/DA9
 3/6jEYskzUHWqvzKod3pFKJGWLcKosUBzM+HDxrS9R5/bYT80CjHh3+s3WDdcV1y
 hlEF1mo6ZK6YncwA+iBn2CZ3DpZXZ9R7yIY06zbUOzuRj+737z5N+1gT8Esq9XMh
 JVkgScE/wfFkic5IGRmm2rJgO6fGCueFO3mJiZkOF62jwBu8qOVw28gotC+D5KLJ
 RjcquebcVGnEQMLa77NZ9LgERLPN54vKYW9vZsAU5AZlfMAm9A8QiWMmeANuBg+J
 nhj0guj5cPlVgOQ9lZFjCp7VE2IHDUS5MKuPfaFWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=+JC0Xz
 kXMw6NITqeBLpTScXB4Hxu2VFqdCSIedbbjLg=; b=NKRjlZ6N+J84XvXGPmyeFS
 hRkMJai42zxIpT/fHW1m+l7tHQJU/NBOcm7jXJ8unesVxI9fmKR8CYabsPYbTFJQ
 4hfyd3GtS3uQyGa4cpfvOAcdm/AKKVGa/F/m856MTIIC2P3SSgvmmxq8Bb+m/ItW
 pGEIcMzgCdjpu5/csxMFdZudlFdSRXgfQpr8mVI03lx1CZ+Cq8qUErHo29xpbjQs
 E2aJ2U8oX7Jz+H04iBZJvWt+TRAlROPxiYzPqaZ72F6Pp2cFVKa1dkO4vK5Cl9BC
 X4jWWNgSHxy0Rd6GAqD0sVAS63hwgsiJudPZXQn0ReKkM12IsrymjBCpjULwq6vQ
 ==
X-ME-Sender: <xms:mg7QWns7b9D1U1R9howXNC-kV3Rtp1fsdF5FnDrUiUe3LRNkAPnwXA>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 39B7DBA43C; Thu, 12 Apr 2018 21:57:46 -0400 (EDT)
Message-Id: <1523584666.2655983.1336387696.46B4368A@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-a1de26f4
References: <1523432542-445334-1-git-send-email-yang.brianc.w@inventec.com>
Date: Fri, 13 Apr 2018 11:27:46 +0930
Subject: Re: [PATCH linux dev-4.13 v1] ARM: dts: aspeed: Add Inventec Lanyang
 BMC
In-Reply-To: <1523432542-445334-1-git-send-email-yang.brianc.w@inventec.com>
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
X-List-Received-Date: Fri, 13 Apr 2018 01:57:51 -0000

Hi Brian,

On Wed, 11 Apr 2018, at 17:12, Brian Yang wrote:
> The Inventec Lanyang is Power 9 platform with ast2500 BMC.
> 
> Tested-by: Brian Yang <yang.brianc.w@inventec.com>
> Signed-off-by: Brian Yang <yang.brianc.w@inventec.com>
> 
> ---
> 
> v0->v1
> -Add test information in commit
> ---
>  arch/arm/boot/dts/Makefile                   |   1 +
>  arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts | 331 +++++++++++++++++++++++++++
>  2 files changed, 332 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 5cfee25..d1882f0 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1057,6 +1057,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>  	aspeed-ast2500-evb.dtb \
>  	aspeed-bmc-arm-centriq2400-rep.dtb \
>  	aspeed-bmc-intel-s2600wf.dtb \
> +	aspeed-bmc-opp-lanyang.dtb \
>  	aspeed-bmc-opp-palmetto.dtb \
>  	aspeed-bmc-opp-romulus.dtb \
>  	aspeed-bmc-opp-witherspoon.dtb \
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts b/arch/arm/
> boot/dts/aspeed-bmc-opp-lanyang.dts
> new file mode 100644
> index 0000000..6241730
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts
> @@ -0,0 +1,331 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +// Copyright (c) 2018 Inventec Corporation
> +/dts-v1/;
> +
> +#include "aspeed-g5.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +
> +/ {
> +	model = "Lanyang BMC";
> +	compatible = "inventec,lanyang-bmc", "aspeed,ast2500";
> +
> +	chosen {
> +		stdout-path = &uart5;
> +		bootargs = "console=ttyS4,115200 earlyprintk";
> +	};
> +
> +	memory {
> +		reg = <0x80000000 0x40000000>;
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		flash_memory: region@98000000 {
> +			no-map;
> +			reg = <0x98000000 0x04000000>; /* 64M */
> +		};
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		sys_boot_status {
> +			label = "System_boot_status";
> +			gpios = <&gpio ASPEED_GPIO(B, 6) GPIO_ACTIVE_LOW>;
> +		};
> +
> +		attention {
> +			label = "Attention_locator";
> +			gpios = <&gpio ASPEED_GPIO(B, 7) GPIO_ACTIVE_HIGH>;
> +		};
> +
> +		plt_fault {
> +			label = "Platform_fault";
> +			gpios = <&gpio ASPEED_GPIO(B, 1) GPIO_ACTIVE_HIGH>;
> +		};
> +
> +		hdd_fault {
> +			label = "Onboard_drive_fault";
> +			gpios = <&gpio ASPEED_GPIO(B, 3) GPIO_ACTIVE_HIGH>;
> +		};
> +		bmc_err {
> +			lable = "BMC_fault";
> +			gpios = <&gpio ASPEED_GPIO(H, 6) GPIO_ACTIVE_HIGH>;
> +		};
> +
> +		sys_err {
> +			lable = "Sys_fault";
> +			gpios = <&gpio ASPEED_GPIO(H, 7) GPIO_ACTIVE_HIGH>;
> +		};
> +	};
> +
> +	fsi: gpio-fsi {
> +		compatible = "fsi-master-gpio", "fsi-master";
> +		#address-cells = <2>;
> +		#size-cells = <0>;
> +
> +		clock-gpios = <&gpio ASPEED_GPIO(J, 0) GPIO_ACTIVE_HIGH>;
> +		data-gpios = <&gpio ASPEED_GPIO(J, 1) GPIO_ACTIVE_HIGH>;
> +		trans-gpios = <&gpio ASPEED_GPIO(D, 5) GPIO_ACTIVE_HIGH>;
> +		enable-gpios = <&gpio ASPEED_GPIO(D, 0) GPIO_ACTIVE_HIGH>;
> +		mux-gpios = <&gpio ASPEED_GPIO(H, 2) GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	iio-hwmon {
> +		compatible = "iio-hwmon";
> +		io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
> +			<&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>,
> +			<&adc 8>, <&adc 9>, <&adc 10>, <&adc 11>,
> +			<&adc 13>, <&adc 14>, <&adc 15>;
> +	};
> +
> +	iio-hwmon-battery {
> +		compatible = "iio-hwmon";
> +		io-channels = <&adc 12>;
> +	};
> +};
> +
> +#include "ibm-power9-cfam.dtsi"
> +
> +&pwm_tacho {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default
> +		&pinctrl_pwm2_default &pinctrl_pwm3_default>;
> +
> +	fan@0 {
> +		reg = <0x00>;
> +		aspeed,fan-tach-ch = /bits/ 8 <0x00>;
> +	};
> +
> +	fan@1 {
> +		reg = <0x01>;
> +		aspeed,fan-tach-ch = /bits/ 8 <0x01>;
> +	};
> +
> +	fan@2 {
> +		reg = <0x02>;
> +		aspeed,fan-tach-ch = /bits/ 8 <0x02>;
> +	};
> +
> +	fan@3 {
> +		reg = <0x03>;
> +		aspeed,fan-tach-ch = /bits/ 8 <0x03>;
> +	};
> +};
> +
> +&fmc {
> +	status = "okay";
> +	flash@0 {
> +		status = "okay";
> +		m25p,fast-read;
> +		label = "bmc";
> +#include "openbmc-flash-layout.dtsi"
> +	};
> +};
> +
> +&spi1 {
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
> +&spi2 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_spi2ck_default
> +		     &pinctrl_spi2cs0_default
> +		     &pinctrl_spi2cs1_default
> +		     &pinctrl_spi2miso_default
> +		     &pinctrl_spi2mosi_default>;
> +
> +	flash@0 {
> +		status = "okay";
> +	};
> +};
> +
> +&uart1 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_txd1_default
> +		     &pinctrl_rxd1_default>;
> +};
> +
> +&lpc_ctrl {
> +	status = "okay";
> +	memory-region = <&flash_memory>;
> +	flash = <&spi1>;
> +};
> +
> +&lpc_snoop {
> +	status = "okay";
> +	snoop-ports = <0x80>;
> +};
> +
> +&mbox {
> +	status = "okay";
> +};
> +
> +&uart5 {
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
> +&mac1 {
> +	status = "okay";
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_rgmii2_default &pinctrl_mdio2_default>;
> +};
> +
> +&i2c0 {
> +	status = "okay";
> +
> +	eeprom@55 {
> +		compatible = "atmel,24c64";
> +		reg = <0x55>;
> +		pagesize = <32>;
> +	};
> +
> +	rtc@68 {
> +		compatible = "nxp,pcf8523";
> +		reg = <0x68>;
> +	};
> +
> +	tmp75@48 {
> +		compatible = "ti,tmp75";
> +		reg = <0x48>;
> +	};
> +};
> +
> +&i2c1 {
> +	status = "okay";
> +};
> +
> +&i2c2 {
> +	status = "okay";
> +};
> +
> +&i2c3 {
> +	status = "okay";
> +};
> +
> +&i2c4 {
> +	status = "okay";
> +};
> +
> +&i2c5 {
> +	status = "okay";
> +};
> +
> +&i2c6 {
> +	status = "okay";
> +};
> +
> +&i2c7 {
> +	status = "okay";
> +};
> +
> +&i2c8 {
> +	status = "okay";
> +};
> +
> +&i2c9 {
> +	status = "okay";
> +};
> +
> +&i2c10 {
> +	status = "okay";
> +};
> +
> +&i2c11 {
> +	status = "okay";
> +};

Do we need to enable all of the above i2c buses? By comparison, Zaius enables i2c0, i2c1, i2c4, i2c7 and i2c8.

> +
> +&vuart {
> +	status = "okay";
> +};
> +
> +&gfx {
> +	status = "okay";
> +};
> +
> +&pinctrl {
> +	aspeed,external-nodes = <&gfx &lhc>;
> +};
> +
> +&gpio {
> +	pin_gpio_b0 {
> +		gpio-hog;
> +		gpios = <ASPEED_GPIO(B, 0) GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "BMC_HDD1_PWR_EN";
> +	};
> +
> +	pin_gpio_b5 {
> +		gpio-hog;
> +		gpios = <ASPEED_GPIO(B, 5) GPIO_ACTIVE_HIGH>;
> +		input;
> +		line-name = "BMC_USB1_OCI2";
> +	};
> +
> +	pin_gpio_h5 {
> +		gpio-hog;
> +		gpios = <ASPEED_GPIO(H, 5) GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "BMC_CP0_PERST_ENABLE_R";
> +	};
> +
> +	pin_gpio_z2 {
> +		gpio-hog;
> +		gpios = <ASPEED_GPIO(Z, 2) GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "RST_PCA9546_U177_N";
> +	};
> +
> +	pin_gpio_aa6 {
> +		gpio-hog;
> +		gpios = <ASPEED_GPIO(AA, 6) GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "BMC_CP0_RESET_N";
> +	};
> +
> +	pin_gpio_aa7 {
> +		gpio-hog;
> +		gpios = <ASPEED_GPIO(AA, 7) GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "BMC_TPM_RESET_N";
> +	};
> +
> +	pin_gpio_ab0 {
> +		gpio-hog;
> +		gpios = <ASPEED_GPIO(AB, 0) GPIO_ACTIVE_LOW>;
> +		output-high;
> +		line-name = "BMC_USB_PWRON_N";
> +	};
> +};
> +
> +&ibt {
> +	status = "okay";
> +};
> +
> +&adc {
> +	status = "okay";
> +};
> +
> -- 
> 2.7.4
> 

Looks okay from a pinctrl perspective, so if there is reason to enable all of the i2c buses, then I'll send an Acked-by

Cheers,

Andrew
