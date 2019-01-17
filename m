Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="jDQg2cdu"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="CvwbaX7h"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43gLTn0sxwzDqkK;
 Thu, 17 Jan 2019 21:51:08 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3B02426185;
 Thu, 17 Jan 2019 05:51:06 -0500 (EST)
Received: from web2 ([10.202.2.212])
 by compute4.internal (MEProxy); Thu, 17 Jan 2019 05:51:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 message-id:from:to:cc:mime-version:content-transfer-encoding
 :content-type:date:subject:references:in-reply-to; s=fm1; bh=2Bv
 KJ9wyfseRhnPH+z5XD+oX7miVHOB6qXgZi7RHkKA=; b=jDQg2cduva9nd+pAfrl
 k57Cjl3y43FAgxC08PSc+bgrnT5ab+3Rsl6RlWyYghsJIRFYYSAlK5W0x7n3Bkxc
 JS0zvmP+//hOVL5Ih4LqC1G30R+GqtesufPF2VROEBVZFnnQ6sZJYD1DoNobJi40
 YC/+X9pzY9G9UVzgTSchK1YWWPDesEGyNyOXBu2YgLJPsJ80OJ8jREKPOqu/u9pH
 4a0dp6QFUFhv0zh1TVwIUg0L7zkdWnnl1W9/pMXv+ciPbwHeEhpiiAqqk0HGc07d
 Wy1P/oFRFjr56aFFw9Wrb/2pRtJ+bZEmdOiw/KGqPLkGfy0ng7TZLSZ4tKAPt0B2
 ZrA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=2BvKJ9wyfseRhnPH+z5XD+oX7miVHOB6qXgZi7RHk
 KA=; b=CvwbaX7hsyzjh7k8M9AeqqeECoAkSFAL40d4EBh+FUmGZoCOz7YBKw4WC
 xObSYX5yUOd/TO6DKCTDmu/wCTEbuNPDIXNvRQpD9hER/6nR3Mhq3DjcjZ24mX7c
 w/oLeXVqW43xOotAfW/x50ehzj5VtOQX1TGNoCTq/Zq4lkX3imbQuvDKVB6F3ofs
 HDX31M9HdFEBBZQMuromBavdxFFgj1N4N1zxpGOwzgq4klXJA8iXklbU9B3z7yIJ
 Ga8ZIDCPPitXNSjsWbp+wN2OPICwrSY4XhE6CgOE4iUioyXRMI6jecPli6kcjJc6
 RRtOI3wJoH53CACDxFLYzSCVygtEA==
X-ME-Sender: <xms:GF5AXBIOvWkxHKIMnteHX2s8hYSqkCuPgnPbjxPD7wNw1-f6-c4-5g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledrgeekgddugecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthenuceurghilhhouhhtmecufedt
 tdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkffhvfgggfgtof
 ffufhfjgesthejredtredtjeenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceo
 rghnughrvgifsegrjhdrihgurdgruheqnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnh
 gurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:GF5AXGdWbqdrZNdZ2v88J0sRENP01wRfUXjacXvcfdLYWb1Snvg_2A>
 <xmx:GF5AXIeeDNMZq22j3eSB57cEs55HnjqOdQqLjVOnZDQ1asbsGz7TqA>
 <xmx:GF5AXNYZHmfuvj62sRpyA3957W9lM0YaI55GCAJFuuUwkT6wlgMX4g>
 <xmx:Gl5AXNzEDFAtG_K-3Rn8HMA-HkwVCCGZ-UtqBSWktasdhyLzVYEbkA>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id B005E6225C; Thu, 17 Jan 2019 05:51:04 -0500 (EST)
Message-Id: <1547722264.3333955.1636977176.3F135DC4@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: John Wang <wangzqbj@inspur.com>, joel@jms.id.au
Cc: openbmc@lists.ozlabs.org, linux-aspeed@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-36e4bfd3
Date: Thu, 17 Jan 2019 21:21:04 +1030
Subject: Re: [PATCH v3] ARM:dts:aspeed Add Inspur on5263m5 BMC
References: <1547717562-17778-1-git-send-email-wangzqbj@inspur.com>
In-Reply-To: <1547717562-17778-1-git-send-email-wangzqbj@inspur.com>
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
X-List-Received-Date: Thu, 17 Jan 2019 10:51:12 -0000



On Thu, 17 Jan 2019, at 20:02, John Wang wrote:
> Add initial version of device tree file for on5263m5 ast2500bmc
> 
> Signed-off-by: John Wang <wangzqbj@inspur.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> v3: Fix some style problems like trailing whitespace,space before tabs.
> ---
> v2: FIx reserved memory address and correct copyright
> ---
>  arch/arm/boot/dts/aspeed-bmc-inspur-on5263m5.dts | 145 +++++++++++++++++++++++
>  1 file changed, 145 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-inspur-on5263m5.dts
> 
> diff --git a/arch/arm/boot/dts/aspeed-bmc-inspur-on5263m5.dts b/arch/
> arm/boot/dts/aspeed-bmc-inspur-on5263m5.dts
> new file mode 100644
> index 0000000..2337ee2
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-inspur-on5263m5.dts
> @@ -0,0 +1,145 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2018 Inspur Corporation
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
> +		vga_memory: framebuffer@9f000000 {
> +			no-map;
> +			reg = <0x9f000000 0x01000000>;
> +		};
> +	};
> +
> +	leds {
> +	    compatible = "gpio-leds";
> +	    bmc_alive {
> +		label = "bmc_alive";
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
> +		compatible = "ti,tmp421";
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
> +		reg = <0x54>;
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
> +		reg = <0x00>;
> +		aspeed,fan-tach-ch = /bits/ 8 <0x00 0x01>;
> +	};
> +
> +	fan@1 {
> +		reg = <0x01>;
> +		aspeed,fan-tach-ch = /bits/ 8 <0x02 0x03>;
> +	};
> +};
> +
> +&adc {
> +	status = "okay";
> +};
> -- 
> 2.7.4
> 
