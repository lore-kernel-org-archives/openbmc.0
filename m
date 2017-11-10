Return-Path: <james.feist@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yYTqk4gtlzDrKr
 for <openbmc@lists.ozlabs.org>; Sat, 11 Nov 2017 06:00:01 +1100 (AEDT)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Nov 2017 10:59:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,375,1505804400"; d="scan'208";a="148371532"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.84]) ([10.54.51.84])
 by orsmga004.jf.intel.com with ESMTP; 10 Nov 2017 10:59:56 -0800
From: James Feist <james.feist@linux.intel.com>
Subject: [PATCH linux dev-4.10 1/1] arm: dts: Add Wfp BMC Machine
To: openbmc@lists.ozlabs.org, joel@jms.id.au
Message-ID: <d011d483-b02d-b2ad-6b70-eb278a21fc33@linux.intel.com>
Date: Fri, 10 Nov 2017 10:59:56 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
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
X-List-Received-Date: Fri, 10 Nov 2017 19:00:03 -0000

Wfp is a Intel system with an Aspeed ast2500 BMC.

Signed-off-by: Feist, James <james.feist@linux.intel.com>
---
  arch/arm/boot/dts/Makefile                         |   1 +
  .../boot/dts/aspeed-bmc-intel-flash-layout.dtsi    |  26 +++++
  arch/arm/boot/dts/aspeed-bmc-intel-wfp.dts         | 117 
+++++++++++++++++++++
  3 files changed, 144 insertions(+)
  create mode 100644 arch/arm/boot/dts/aspeed-bmc-intel-flash-layout.dtsi
  create mode 100644 arch/arm/boot/dts/aspeed-bmc-intel-wfp.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 6d6c9eb..987e23e 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -992,6 +992,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += 
aspeed-bmc-opp-palmetto.dtb \
  	aspeed-bmc-opp-lanyang.dtb \
  	aspeed-bmc-mellanox-msn.dtb \
  	aspeed-bmc-quanta-q71l.dtb \
+	aspeed-bmc-intel-wfp.dtb \
  	aspeed-ast2500-evb.dtb
  endif
  diff --git a/arch/arm/boot/dts/aspeed-bmc-intel-flash-layout.dtsi 
b/arch/arm/boot/dts/aspeed-bmc-intel-flash-layout.dtsi
new file mode 100644
index 0000000..4bcfd1b
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-intel-flash-layout.dtsi
@@ -0,0 +1,26 @@
+		label = "bmc";
+		partitions {
+				#address-cells = < 1 >;
+				#size-cells = < 1 >;
+				compatible = "fixed-partitions";
+				u-boot@0 {
+					reg = < 0 0x60000 >;
+					label = "u-boot";
+				};
+				u-boot-env@60000 {
+					reg = < 0x60000 0x20000 >;
+					label = "u-boot-env";
+				};
+				kernel@80000 {
+					reg = < 0x80000 0x440000 >;
+					label = "kernel";
+				};
+				rofs@0c0000 {
+					reg = < 0x4c0000 0x1740000 >;
+					label = "rofs";
+				};
+				rwfs@1c00000 {
+					reg = < 0x1c00000 0x400000 >;
+					label = "rwfs";
+				};
+		};
diff --git a/arch/arm/boot/dts/aspeed-bmc-intel-wfp.dts 
b/arch/arm/boot/dts/aspeed-bmc-intel-wfp.dts
new file mode 100644
index 0000000..2b4f095
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-intel-wfp.dts
@@ -0,0 +1,117 @@
+/dts-v1/;
+
+#include "aspeed-g5.dtsi"
+
+/ {
+	model = "WFP BMC";
+	compatible = "intel,wfp-bmc", "aspeed,ast2500";
+
+	aliases {
+		serial4 = &uart5;
+	};
+
+	chosen {
+		stdout-path = &uart5;
+		bootargs = "console=ttyS4,115200 earlyprintk";
+	};
+
+	memory {
+		reg = <0x80000000 0x20000000>;
+	};
+
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
+			<&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>,
+			<&adc 8>, <&adc 9>, <&adc 10>, <&adc 11>,
+			<&adc 12>, <&adc 13>, <&adc 14>, <&adc 15>;
+	};
+
+};
+
+&fmc {
+	status = "okay";
+	flash@0 {
+		status = "okay";
+#include "aspeed-bmc-intel-flash-layout.dtsi"
+	};
+};
+
+&spi1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi1_default>;
+
+	flash@0 {
+		status = "okay";
+		label = "pnor";
+	};
+};
+
+&uart5 {
+	status = "okay";
+};
+
+&mac0 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii1_default &pinctrl_mdio1_default>;
+	use-ncsi;
+};
+
+&mac1 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii2_default &pinctrl_mdio2_default>;
+};
+
+&i2c1 {
+	status = "okay";
+};
+
+&i2c2 {
+	status = "okay";
+};
+
+&i2c3 {
+	status = "okay";
+};
+
+&i2c4 {
+	status = "okay";
+};
+
+&i2c5 {
+	status = "okay";
+};
+
+&i2c6 {
+	status = "okay";
+};
+
+&i2c7 {
+	status = "okay";
+};
+
+&i2c13 {
+	status = "okay";
+};
+
+&gfx {
+	status = "okay";
+};
+
+&pinctrl {
+	aspeed,external-nodes = <&gfx &lhc>;
+};
+
+&pwm_tacho {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default
+			 &pinctrl_pwm2_default &pinctrl_pwm3_default
+			 &pinctrl_pwm4_default &pinctrl_pwm5_default
+			 &pinctrl_pwm6_default &pinctrl_pwm7_default>;
+};
-- 
2.7.4
