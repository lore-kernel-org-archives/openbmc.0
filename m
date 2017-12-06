Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="EntQnk8a"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="kNWGHGZO"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ysZw742K2zDrbq
 for <openbmc@lists.ozlabs.org>; Thu,  7 Dec 2017 10:44:38 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id AE81F2113F;
 Wed,  6 Dec 2017 18:42:24 -0500 (EST)
Received: from web1 ([10.202.2.211])
 by compute4.internal (MEProxy); Wed, 06 Dec 2017 18:42:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=DFczmxWpAIvvPg3f3Q5WpDBS2yYCH
 QQOg2jW3p4elxM=; b=EntQnk8aZxMoRathItsso1j9fbaIfTkVrjUy/y8vfrbvd
 e3JBn/60kcA8p9Gehdg86ObprIUuPyzfLlOqjja+/4qxicfbG5lmevKWWuIIRtPY
 OEDEhDmua3f0u1ey+N/QxBZWd4or1wXTWsrQdvIUnXpDykm/P6BfjyjdrYsotVdp
 cRROJwpJmsFX6gEntIcRaEU/F/utdH4FDwKc/yEUGbe+23CIaX2YIukims+MgCbH
 IAsa7GG4FGcqNZ1dZjIacg4EoerfaXGQTL34Ck8TehTP0RH3tAWHHOYhW0f/IzLE
 Q4/3DBoqz66bh2Qe3Mc5bTHJERYMDirJ7HQo15Hpw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=DFczmx
 WpAIvvPg3f3Q5WpDBS2yYCHQQOg2jW3p4elxM=; b=kNWGHGZOpzstEtTTLrPCiy
 Dv6HZKkU/9sD/M7ShkIEpdPOT7GRsUZuQcSF0YbCBdPaisnYpJMY6NCRlZBoK3Q+
 9tt/KWHwRVIGz+v9jH+0TKse855s68BXLYikf92Yz1krzi+6WtlU4fy0pN7J0VHv
 cAwhe/QkTQANEx1Fr7JTjwv6r26k/X0SeB8wrg2upFJ8GTyzhyBLZQkg/S2UQCGN
 toTapojFmVVAcfOSeoLmqbQ+6B6by2JzhTqjTi9ELzoq3WxoUEch56WMvSpYb84c
 9sWLbfXIzSeLuQ0U/M9bLuFAJ79ZxsIaPbD9+QALsBx8DeXHqMqGTJn9MXa/vDhQ
 ==
X-ME-Sender: <xms:YIAoWro4WEQvmpk8UrR3f2lrEn4fQNdrryePVM3bmQeVkmUWYpoEaQ>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 90DF894083; Wed,  6 Dec 2017 18:42:24 -0500 (EST)
Message-Id: <1512603744.2789714.1196630712.3D129423@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: James Feist <james.feist@linux.intel.com>, openbmc@lists.ozlabs.org,
 joel@jms.id.au
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-1b87d328
In-Reply-To: <1511989840-13781-1-git-send-email-james.feist@linux.intel.com>
Date: Thu, 07 Dec 2017 10:12:24 +1030
References: <1511989840-13781-1-git-send-email-james.feist@linux.intel.com>
Subject: Re: [PATCH linux dev-4.10 v3 1/1] ARM: dts: Add Wfp BMC Machine
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Dec 2017 23:44:41 -0000


On Thu, 30 Nov 2017, at 07:40, James Feist wrote:
> Wfp is a Intel system with an Aspeed ast2500 BMC.
> 
> Signed-off-by: James Feist <james.feist@linux.intel.com>

From a pinmux perspective:

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> This change depends on "ARM: dts: aspeed: Rename
> aspeed-bmc-opp-flash-layout.dtsi"
> 
> Changes since v2:
>  - Added reserved memory block.
>  - Removed extra bootarg.
> 
>  arch/arm/boot/dts/Makefile                 |   1 +
>  arch/arm/boot/dts/aspeed-bmc-intel-wfp.dts | 128
>  +++++++++++++++++++++++++++++
>  2 files changed, 129 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-intel-wfp.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 6d6c9eb..987e23e 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -992,6 +992,7 @@ dtb-$(CONFIG_ARCH_ASPEED) +=
> aspeed-bmc-opp-palmetto.dtb \
>  	aspeed-bmc-opp-lanyang.dtb \
>  	aspeed-bmc-mellanox-msn.dtb \
>  	aspeed-bmc-quanta-q71l.dtb \
> +       aspeed-bmc-intel-wfp.dtb \
>  	aspeed-ast2500-evb.dtb
>  endif
>  
> diff --git a/arch/arm/boot/dts/aspeed-bmc-intel-wfp.dts
> b/arch/arm/boot/dts/aspeed-bmc-intel-wfp.dts
> new file mode 100644
> index 0000000..901b6a0
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-intel-wfp.dts
> @@ -0,0 +1,128 @@
> +/dts-v1/;
> +
> +#include "aspeed-g5.dtsi"
> +
> +/ {
> +       model = "WFP BMC";
> +       compatible = "intel,wfp-bmc", "aspeed,ast2500";
> +
> +       aliases {
> +               serial4 = &uart5;
> +       };
> +
> +       chosen {
> +               stdout-path = &uart5;
> +               bootargs = "earlyprintk";
> +       };
> +
> +       memory {
> +               reg = <0x80000000 0x20000000>;
> +       };
> +
> +       reserved-memory {
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               ranges;
> +
> +               vga_memory: framebuffer@7f000000 {
> +                       no-map;
> +                       reg = <0x7f000000 0x01000000>;
> +               };
> +       };
> +
> +       iio-hwmon {
> +               compatible = "iio-hwmon";
> +               io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
> +                       <&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>,
> +                       <&adc 8>, <&adc 9>, <&adc 10>, <&adc 11>,
> +                       <&adc 12>, <&adc 13>, <&adc 14>, <&adc 15>;
> +       };
> +
> +};
> +
> +&fmc {
> +       status = "okay";
> +       flash@0 {
> +               status = "okay";
> +#include "openbmc-flash-layout.dtsi"
> +       };
> +};
> +
> +&spi1 {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_spi1_default>;
> +
> +       flash@0 {
> +               status = "okay";
> +               label = "pnor";
> +       };
> +};
> +
> +&uart5 {
> +       status = "okay";
> +};
> +
> +&mac0 {
> +       status = "okay";
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_rmii1_default>;
> +       use-ncsi;
> +};
> +
> +&mac1 {
> +       status = "okay";
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_rgmii2_default &pinctrl_mdio2_default>;
> +};
> +
> +&i2c1 {
> +       status = "okay";
> +};
> +
> +&i2c2 {
> +       status = "okay";
> +};
> +
> +&i2c3 {
> +       status = "okay";
> +};
> +
> +&i2c4 {
> +       status = "okay";
> +};
> +
> +&i2c5 {
> +       status = "okay";
> +};
> +
> +&i2c6 {
> +       status = "okay";
> +};
> +
> +&i2c7 {
> +       status = "okay";
> +};
> +
> +&i2c13 {
> +       status = "okay";
> +};
> +
> +&gfx {
> +       status = "okay";
> +};
> +
> +&pinctrl {
> +       aspeed,external-nodes = <&gfx &lhc>;
> +};
> +
> +&pwm_tacho {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default
> +                        &pinctrl_pwm2_default &pinctrl_pwm3_default
> +                        &pinctrl_pwm4_default &pinctrl_pwm5_default
> +                        &pinctrl_pwm6_default &pinctrl_pwm7_default>;
> +};
> -- 
> 2.7.4
> 
