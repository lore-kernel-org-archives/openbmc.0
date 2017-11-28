Return-Path: <james.feist@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ymYc25jmpzDrVZ
 for <openbmc@lists.ozlabs.org>; Wed, 29 Nov 2017 06:28:18 +1100 (AEDT)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Nov 2017 11:28:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,468,1505804400"; d="scan'208";a="181647573"
Received: from skyhawk.jf.intel.com ([10.54.51.84])
 by fmsmga006.fm.intel.com with ESMTP; 28 Nov 2017 11:28:15 -0800
From: James Feist <james.feist@linux.intel.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Cc: James Feist <james.feist@linux.intel.com>
Subject: [PATCH linux dev-4.10 v2 2/2] ARM: dts: Add Wfp BMC Machine
Date: Tue, 28 Nov 2017 11:28:05 -0800
Message-Id: <1511897285-23022-2-git-send-email-james.feist@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1511897285-23022-1-git-send-email-james.feist@linux.intel.com>
References: <1511897285-23022-1-git-send-email-james.feist@linux.intel.com>
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
X-List-Received-Date: Tue, 28 Nov 2017 19:28:19 -0000

Wfp is a Intel system with an Aspeed ast2500 BMC.

Signed-off-by: James Feist <james.feist@linux.intel.com>
---
Changes since V1:
 - Fix mac 0 pinctrl and use existing flash layout.
 - Add dependency.

 arch/arm/boot/dts/Makefile                 |   1 +
 arch/arm/boot/dts/aspeed-bmc-intel-wfp.dts | 117 +++++++++++++++++++++++++++++
 2 files changed, 118 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-intel-wfp.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 6d6c9eb..987e23e 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -992,6 +992,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += aspeed-bmc-opp-palmetto.dtb \
 	aspeed-bmc-opp-lanyang.dtb \
 	aspeed-bmc-mellanox-msn.dtb \
 	aspeed-bmc-quanta-q71l.dtb \
+	aspeed-bmc-intel-wfp.dtb \
 	aspeed-ast2500-evb.dtb
 endif
 
diff --git a/arch/arm/boot/dts/aspeed-bmc-intel-wfp.dts b/arch/arm/boot/dts/aspeed-bmc-intel-wfp.dts
new file mode 100644
index 0000000..f15a5e7
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
+		bootargs = "115200 earlyprintk";
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
+#include "openbmc-flash-layout.dtsi"
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
+	pinctrl-0 = <&pinctrl_rmii1_default>;
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
