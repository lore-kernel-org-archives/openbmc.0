Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="w8Fvx9Ub"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Zwo2vy5J"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42r3th0LTfzF3HC;
 Thu,  8 Nov 2018 11:24:10 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 51EED21A9F;
 Wed,  7 Nov 2018 19:24:08 -0500 (EST)
Received: from web3 ([10.202.2.213])
 by compute4.internal (MEProxy); Wed, 07 Nov 2018 19:24:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 message-id:from:to:mime-version:content-transfer-encoding
 :content-type:references:subject:in-reply-to:date; s=fm1; bh=USb
 PNKbULrrSIxS910uiY2yOyZq3Ef7aLuUk6BFKr2c=; b=w8Fvx9UbIKo/RtGAkdy
 evWNA6CAGuYVsMdHHtbczAI7uoz+bYN7J6OawzcOqPFp4/DqW+2bE3G2ijKodtru
 gLGhMbW+5WKGx44zxhN+ueAXOkhxKbBZbQoXJZ13T1KEBxIRHwkjRtzH3rQMOetR
 D4rUNfaGwmkvkKbNZAd6vV/FELGftVDp3gCJYmjw9wAILy2mEXn0RebCTuYw5b9B
 KHIoZvG/yjxF/lFYoe3q+YaKZ39PJam4hH/AJMScHeaBuM3lE5dxav8m2IqTT2TM
 H/AGQcgVI+TslVyDuNHTbiR5LtIW1WoEQYPQjXkOg8QoU9CmZuQoWassSkaFtuyD
 t3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=USbPNKbULrrSIxS910uiY2yOyZq3Ef7aLuUk6BFKr
 2c=; b=Zwo2vy5J3GhGLo/FQ4m9NEZvVwTasHTma6crq+bJOHPEeqek0vbQwDydi
 gVD2dgfoQ56da2j15Qw6xxciikvKJZISQfK1vaRPwTOWR1rPmu/Y9SB/Q8igiVOy
 PjprSu4oCaRa6cyK6W2bH+vIG3Zs5c9Wq5ieq8G3jXpuPsPdmXTeyyvMLfmZzind
 82i+hnWjUkUzC90GevwksD0VHb1qhu+r93Ro2sPpOCCYOXgGi0AM4q9ackXEM7d5
 RdQ8Q8ZCwtajfGfilehFafeCOD0D49kmQp2IXOzVDts36sXQiSiPV1y/hfC+OKGn
 B5y54jRFtzcdlPHkTI8RmRd9ljDQw==
X-ME-Sender: <xms:JoLjW5np8esMW69Yh6-iBAPVDq2ztNqXIYwjCrw0DFWW-7d8Dn8CcQ>
X-ME-Proxy: <xmx:JoLjWy_Qxq-0ih9uh0tgpQiCNRy-23Pl9t9fDEQ7LubBB4dmjkNujw>
 <xmx:JoLjW_LCclZB2U-lRBsrtOUM6JxabmHtF8W5sziK2uKmfxPZXzxhHg>
 <xmx:J4LjW24ye2BWgSt5Vkx4z-ObAdWsfMI5Dl7hg0CLVMClx2ugdErW1Q>
 <xmx:J4LjWwlZc4r9ueMjHYoFYJMinG4yrb6jN1MRTyjRU2FyPiD3sRc6bA>
 <xmx:J4LjWwhmXqbPkAbSejbAkAgochDlldk9s0o9SNiK-14yACWEpb5sbQ>
 <xmx:KILjW-aCMtJRlQifP5xbHVml2YVtt-WcQXdcFynBu402uz_OOmAXJA>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id D07C69E242; Wed,  7 Nov 2018 19:24:06 -0500 (EST)
Message-Id: <1541636646.1469369.1569439336.00B37737@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Tao Ren <taoren@fb.com>, Joel Stanley <joel@jms.id.au>,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-d469da0c
References: <20181106042842.2771782-1-taoren@fb.com>
Subject: Re: [PATCH v2 2/2] ARM: dts: aspeed: Add Facebook Backpack-CMM BMC
In-Reply-To: <20181106042842.2771782-1-taoren@fb.com>
Date: Thu, 08 Nov 2018 10:54:06 +1030
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
X-List-Received-Date: Thu, 08 Nov 2018 00:24:14 -0000

Hi Tao,

On Tue, 6 Nov 2018, at 14:58, Tao Ren wrote:
> Add initial version of device tree file for Facebook Backpack CMM
> (Chasis Management Module) ast2500 BMC.
> 
> Note: I2C devices on Backpack Line Cards and Fabric Cards are not
> listed in the device tree file because Line/Fabric Cards may be
> unplugged.
> 
> Signed-off-by: Tao Ren <taoren@fb.com>
> ---
>  Changes since v1:
>   - including "aspeed-bmc-facebook-cmm.dtb" in Makefile.
> 
>  arch/arm/boot/dts/Makefile                    |   1 +
>  arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts | 317 ++++++++++++++++++
>  2 files changed, 318 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index a7c313bfe490..2239e6a30d7a 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1200,6 +1200,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>  	aspeed-ast2500-evb.dtb \
>  	aspeed-bmc-arm-centriq2400-rep.dtb \
>  	aspeed-bmc-arm-stardragon4800-rep2.dtb \
> +	aspeed-bmc-facebook-cmm.dtb \
>  	aspeed-bmc-facebook-tiogapass.dtb \
>  	aspeed-bmc-intel-s2600wf.dtb \
>  	aspeed-bmc-opp-lanyang.dtb \
> diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts b/arch/arm/
> boot/dts/aspeed-bmc-facebook-cmm.dts
> new file mode 100644
> index 000000000000..a259d8a2426a
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
> @@ -0,0 +1,317 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +// Copyright (c) 2018 Facebook Inc.
> +/dts-v1/;
> +
> +#include "aspeed-g5.dtsi"
> +
> +/ {
> +	model = "Facebook Backpack CMM BMC";
> +	compatible = "facebook,cmm-bmc", "aspeed,ast2500";
> +
> +	aliases {
> +		/*
> +		 * Override the default uart aliases to avoid breaking
> +		 * the legacy applications.
> +		 */
> +		serial0 = &uart5;
> +		serial1 = &uart1;
> +		serial2 = &uart3;
> +		serial3 = &uart4;
> +
> +		/*
> +		 * Hardcode the bus number of i2c switches' channels to
> +		 * avoid breaking the legacy applications.
> +		 */
> +		i2c16 = &imux16;
> +		i2c17 = &imux17;
> +		i2c18 = &imux18;
> +		i2c19 = &imux19;
> +		i2c20 = &imux20;
> +		i2c21 = &imux21;
> +		i2c22 = &imux22;
> +		i2c23 = &imux23;
> +		i2c24 = &imux24;
> +		i2c25 = &imux25;
> +		i2c26 = &imux26;
> +		i2c27 = &imux27;
> +		i2c28 = &imux28;
> +		i2c29 = &imux29;
> +		i2c30 = &imux30;
> +		i2c31 = &imux31;
> +		i2c32 = &imux32;
> +		i2c33 = &imux33;
> +		i2c34 = &imux34;
> +		i2c35 = &imux35;
> +		i2c36 = &imux36;
> +		i2c37 = &imux37;
> +		i2c38 = &imux38;
> +		i2c39 = &imux39;
> +	};
> +
> +	chosen {
> +		stdout-path = &uart1;
> +		bootargs = "console=ttyS1,9600n8 root=/dev/ram rw earlyprintk";
> +	};
> +
> +	memory@80000000 {
> +		reg = <0x80000000 0x20000000>;
> +	};
> +};
> +
> +/*
> + * Update reset type to "system" (full chip) to fix warm reboot hang 
> issue
> + * when reset type is set to default ("soc", gated by reset mask 
> registers).
> + */
> +&wdt1 {
> +	status = "okay";
> +	aspeed,reset-type = "system";
> +};
> +
> +/*
> + * wdt2 is not used by Backpack CMM.
> + */
> +&wdt2 {
> +	status = "disabled";
> +};
> +
> +&fmc {
> +	status = "okay";
> +	flash@0 {
> +		status = "okay";
> +		m25p,fast-read;
> +		label = "bmc";
> +#include "facebook-bmc-flash-layout.dtsi"
> +	};
> +};
> +
> +&uart1 {
> +	status = "okay";
> +};
> +
> +&uart3 {
> +	status = "okay";
> +};
> +
> +&uart4 {
> +	status = "okay";
> +};

UARTs 1-4 should be explicitly pinmuxed. It's a bit fiddly as each of the UART lines has its own mux configuration, but it at least allows some flexibility (i.e. whether you just want Rx/Tx, or something more). See e.g. the uart1 node in arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts.

Speaking of pinctrl, as it's an AST2500 system you'll probably want to add the following to ensure you have full control of the pinmux configuration:

&pinctrl {
	aspeed,external-nodes = <&gfx &lhc>;
};

> +
> +&uart5 {
> +	status = "okay";
> +};

UART5 has fixed pins, so no pinctrl necessary here.

> +
> +&mac1 {
> +	status = "okay";
> +	no-hw-checksum;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_rgmii2_default &pinctrl_mdio2_default>;
> +};
> +
> +&i2c0 {
> +	status = "okay";
> +};
> +
> +&i2c1 {
> +	status = "okay";
> +
> +	i2c-switch@77 {
> +		compatible = "nxp,pca9548";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		reg = <0x77>;
> +
> +		imux16: i2c@0 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0>;
> +		};
> +
> +		imux17: i2c@1 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <1>;
> +		};
> +
> +		imux18: i2c@2 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <2>;
> +		};
> +
> +		imux19: i2c@3 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <3>;
> +		};
> +
> +		imux20: i2c@4 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <4>;
> +		};
> +
> +		imux21: i2c@5 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <5>;
> +		};
> +
> +		imux22: i2c@6 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <6>;
> +		};
> +
> +		imux23: i2c@7 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <7>;
> +		};
> +	};
> +};
> +
> +&i2c2 {
> +	status = "okay";
> +
> +	i2c-switch@71 {
> +		compatible = "nxp,pca9548";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		reg = <0x71>;
> +
> +		imux24: i2c@0 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0>;
> +		};
> +
> +		imux25: i2c@1 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <1>;
> +		};
> +
> +		imux26: i2c@2 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <2>;
> +		};
> +
> +		imux27: i2c@3 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <3>;
> +		};
> +
> +		imux28: i2c@4 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <4>;
> +		};
> +
> +		imux29: i2c@5 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <5>;
> +		};
> +
> +		imux30: i2c@6 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <6>;
> +		};
> +
> +		imux31: i2c@7 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <7>;
> +		};
> +	};
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
> +
> +	i2c-switch@77 {
> +		compatible = "nxp,pca9548";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		reg = <0x77>;
> +
> +		imux32: i2c@0 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0>;
> +		};
> +
> +		imux33: i2c@1 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <1>;
> +		};
> +
> +		imux34: i2c@2 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <2>;
> +		};
> +
> +		imux35: i2c@3 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <3>;
> +		};
> +
> +		imux36: i2c@4 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <4>;
> +		};
> +
> +		imux37: i2c@5 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <5>;
> +		};
> +
> +		imux38: i2c@6 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <6>;
> +		};
> +
> +		imux39: i2c@7 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <7>;
> +		};
> +	};
> +};
> +
> +&i2c13 {
> +	status = "okay";
> +};

You said this in the commit message:

> Note: I2C devices on Backpack Line Cards and Fabric Cards are not
> listed in the device tree file because Line/Fabric Cards may be
> unplugged.

It's not clear to me what this actually means, and I'm trying to reconcile it with enabling all of the i2c buses as I'm curious as to whether that's necessary.

Cheers,

Andrew

> +
> +&adc {
> +	status = "okay";
> +};
> -- 
> 2.17.1
> 
