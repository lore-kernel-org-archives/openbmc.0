Return-Path: <james.feist@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ysXgh2Bm8zDrYf
 for <openbmc@lists.ozlabs.org>; Thu,  7 Dec 2017 09:03:43 +1100 (AEDT)
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Dec 2017 14:03:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,369,1508828400"; 
   d="scan'208";a="532331"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.84]) ([10.54.51.84])
 by fmsmga008.fm.intel.com with ESMTP; 06 Dec 2017 14:03:38 -0800
Subject: Re: [PATCH linux dev-4.10 v3 1/1] ARM: dts: Add Wfp BMC Machine
To: openbmc@lists.ozlabs.org, joel@jms.id.au, andrew@aj.id.au
References: <1511989840-13781-1-git-send-email-james.feist@linux.intel.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <d9ec3d84-dce6-121e-1e7d-19441e681e14@linux.intel.com>
Date: Wed, 6 Dec 2017 14:03:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <1511989840-13781-1-git-send-email-james.feist@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Wed, 06 Dec 2017 22:03:45 -0000

Any update on this? Haven't heard anything in a week.

Thanks,

-James

On 11/29/2017 01:10 PM, James Feist wrote:
> Wfp is a Intel system with an Aspeed ast2500 BMC.
> 
> Signed-off-by: James Feist <james.feist@linux.intel.com>
> ---
> This change depends on "ARM: dts: aspeed: Rename aspeed-bmc-opp-flash-layout.dtsi"
> 
> Changes since v2:
>   - Added reserved memory block.
>   - Removed extra bootarg.
> 
>   arch/arm/boot/dts/Makefile                 |   1 +
>   arch/arm/boot/dts/aspeed-bmc-intel-wfp.dts | 128 +++++++++++++++++++++++++++++
>   2 files changed, 129 insertions(+)
>   create mode 100644 arch/arm/boot/dts/aspeed-bmc-intel-wfp.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 6d6c9eb..987e23e 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -992,6 +992,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += aspeed-bmc-opp-palmetto.dtb \
>   	aspeed-bmc-opp-lanyang.dtb \
>   	aspeed-bmc-mellanox-msn.dtb \
>   	aspeed-bmc-quanta-q71l.dtb \
> +	aspeed-bmc-intel-wfp.dtb \
>   	aspeed-ast2500-evb.dtb
>   endif
>   
> diff --git a/arch/arm/boot/dts/aspeed-bmc-intel-wfp.dts b/arch/arm/boot/dts/aspeed-bmc-intel-wfp.dts
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
> +	model = "WFP BMC";
> +	compatible = "intel,wfp-bmc", "aspeed,ast2500";
> +
> +	aliases {
> +		serial4 = &uart5;
> +	};
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
> +		};
> +	};
> +
> +	iio-hwmon {
> +		compatible = "iio-hwmon";
> +		io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
> +			<&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>,
> +			<&adc 8>, <&adc 9>, <&adc 10>, <&adc 11>,
> +			<&adc 12>, <&adc 13>, <&adc 14>, <&adc 15>;
> +	};
> +
> +};
> +
> +&fmc {
> +	status = "okay";
> +	flash@0 {
> +		status = "okay";
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
> +&i2c13 {
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
> +&pwm_tacho {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default
> +			 &pinctrl_pwm2_default &pinctrl_pwm3_default
> +			 &pinctrl_pwm4_default &pinctrl_pwm5_default
> +			 &pinctrl_pwm6_default &pinctrl_pwm7_default>;
> +};
> 
