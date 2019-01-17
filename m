Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="h8AR7/FT"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="cH+Tw8I9"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43g6yD1KJPzDqkP
 for <openbmc@lists.ozlabs.org>; Thu, 17 Jan 2019 13:11:31 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 52BD223A36;
 Wed, 16 Jan 2019 21:11:29 -0500 (EST)
Received: from web6 ([10.202.2.216])
 by compute4.internal (MEProxy); Wed, 16 Jan 2019 21:11:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 message-id:from:to:cc:mime-version:content-transfer-encoding
 :content-type:references:subject:date:in-reply-to; s=fm1; bh=ptp
 QO35GSHDbg7RhQFb8WU9CR6o99d1nUVwzm1nd1iU=; b=h8AR7/FTRjXMXK6RQeq
 /G4w98/5uwpuIA16tl0l4UoKIyVsdePdQOcnNC+Spt8HWrRQLNEwyj2t1YqNkAoN
 VfH741K38N5OgEXyWPaUlEcM6k6EI5WATvoOOki0a+6Q8CMMU2c7KIRO8KueKE1W
 Ezy7AaPzhFVxWCGdoMU19P6Uze0CTH12obFkJKZOLH+VFJEIfwQ670qR4qIBnPtI
 DvQTvzwF8ZiwXGncTqd7pBgwKvlRy0AumZju2cOAxOw055NPWp7n21h35mtwmh+5
 NyWnRcMGgRsR8oP0ub+1v92BcHEolX5P5LlINr67oOXES33vzFuH6OwLt5WWUjGD
 fUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=ptpQO35GSHDbg7RhQFb8WU9CR6o99d1nUVwzm1nd1
 iU=; b=cH+Tw8I9PE8q2kxQhrxNg+BLJVN93Se/fLapTYH0bUbeXrJtnnuivXSeE
 aBM4V4C/2nq+/+MlJHBLzo7LjCRwKOuO3pXPgbGC+8o0bgK5d2VygqN1s0tJNPiE
 uOMSXBj3EODCuIyXS4LKVACcK/NAEhUXJ+sla2oS9SChSQFIwALxt2jj+i7hwOO/
 m2cGXtincp4qE8/hOqd/TlViqytQAazsM/HsOkKNck3OAoLe1EN/JE7WvLhshxzk
 Fkm1kUPjGsiEGQ+QWVOGxXx/Hl9ni22pE1TazQ3zzJ5FsGEMDhe8wLDskCRyQe0C
 ihIPM9YQQQ6eVVO1wnjMI7Yg9weeA==
X-ME-Sender: <xms:T-Q_XFYw4bLdGd308kHGoeL2UwnUOQ2zxbm8qCpZPScjEmr_ue90Vw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledrgeeigdegfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthenuceurghilhhouhhtmecufedt
 tdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkffhvfgggfgtof
 hfufffjgesthejredtredtjeenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceo
 rghnughrvgifsegrjhdrihgurdgruheqnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnh
 gurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:T-Q_XPkodJyfKH-Kh6dkj6oBzgoL_w8J859qQq3VATEkRL63A4wzrA>
 <xmx:T-Q_XEFEKylD6UFcGIQKliru7LkkicTy_O6a11ElsBXIIxiuqGWqkA>
 <xmx:T-Q_XOF5cjN1GEZerhOIgITwpOpaXDHmvuXd_cOsxeIOzwO52G0Kbg>
 <xmx:UeQ_XDrd2Ys1rwuZ-iADVabujEsrpheJAXHnyyb3rBZt1catJCe8gw>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 4D2C84140; Wed, 16 Jan 2019 21:11:27 -0500 (EST)
Message-Id: <1547691087.1635443.1636715576.07EA9674@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: John Wang <wangzqbj@inspur.com>, joel@jms.id.au
Cc: openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-36e4bfd3
References: <1545373529-22629-1-git-send-email-wangzqbj@inspur.com>
Subject: Re: [PATCH] ARM:dts:aspeed Add Inspur on5263m5 BMC
Date: Thu, 17 Jan 2019 12:41:27 +1030
In-Reply-To: <1545373529-22629-1-git-send-email-wangzqbj@inspur.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Jan 2019 02:11:35 -0000

Hi John,

On Fri, 21 Dec 2018, at 16:55, John Wang wrote:
> Add initial version of device tree file for on5263m5 ast2500bmc
> 
> Signed-off-by: John Wang <wangzqbj@inspur.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-inspur-on5263m5.dts | 146 +++++++++++++++++++++++
>  1 file changed, 146 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-inspur-on5263m5.dts
> 
> diff --git a/arch/arm/boot/dts/aspeed-bmc-inspur-on5263m5.dts b/arch/
> arm/boot/dts/aspeed-bmc-inspur-on5263m5.dts
> new file mode 100644
> index 0000000..dff1085
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-inspur-on5263m5.dts
> @@ -0,0 +1,146 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2017 Intel Corporation

Shouldn't this be Inspur?

> +/dts-v1/;
> +
> +#include "aspeed-g5.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +
> +/ {
> +	model = "ON5263M5 BMC";
> +	compatible = "inspur,on5263m5-bmc", "aspeed,ast2500";
> +
> +	chosen {
> +		stdout-path = &uart5;
> +		bootargs = "earlyprintk";
> +	};
> +
> +	memory {
> +		reg = <0x80000000 0x20000000>;
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		vga_memory: framebuffer@7f000000 {
> +			no-map;
> +			reg = <0x7f000000 0x01000000>;

This needs to be in the SDRAM portion of the address-space. With 512MiB of RAM and
a 16MiB VGA framebuffer  the address should be 0x9f000000. At the moment you're
scribbling on the AHB-to-LPC+ bridge mapping.

Cheers,

Andrew

> +		};
> +	};
> +	
> +	leds {
> +	    compatible = "gpio-leds";
> +	    
> +	    bmc_alive {
> +	        label = "bmc_alive";
> +		gpios = <&gpio ASPEED_GPIO(I, 1) GPIO_ACTIVE_LOW>;
> +		linux,default-trigger = "timer";
> +	    };
> +	};
> +
> +	iio-hwmon {
> +		compatible = "iio-hwmon";
> +		io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
> +			<&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>;
> +	};
> +
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
> +		m25p,fast-read;
> +		label = "pnor";
> +	};
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
> +&i2c6 {
> +	status = "okay";
> +
> +	tmp421@4e {
> +	        compatible = "ti,tmp421";
> +		reg = <0x4e>;
> +	};
> +
> +	tmp112@48 {
> +		compatible = "ti,tmp112";
> +		reg = <0x48>;
> +	};
> +	
> +	eeprom@54 {
> +		compatible = "atmel,24c64";
> +    		reg = <0x54>; 
> +		pagesize = <32>;
> +	};
> +};
> +
> +&i2c7 {
> +	status = "okay";
> +
> +	adm1278@11 {
> +		  compatible = "adi,adm1278";
> +		  reg = <0x11>;
> +	};
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
> +&pwm_tacho {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default>;
> +
> +	fan@0 {
> +   		reg = <0x00>;
> +   		aspeed,fan-tach-ch = /bits/ 8 <0x00 0x01>;  
> + 	};
> +
> + 	fan@1 {
> +   		reg = <0x01>;
> +   		aspeed,fan-tach-ch = /bits/ 8 <0x02 0x03>;
> + 	};
> +};
> +
> +&adc {
> +	status = "okay";
> +};
> -- 
> 2.7.4
> 
