Return-Path: <james.feist@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ythXH3h4RzF06k
 for <openbmc@lists.ozlabs.org>; Sat,  9 Dec 2017 06:01:18 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Dec 2017 11:01:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,378,1508828400"; d="scan'208";a="10286209"
Received: from skyhawk.jf.intel.com ([10.54.51.84])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Dec 2017 11:01:15 -0800
From: James Feist <james.feist@linux.intel.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Cc: James Feist <james.feist@linux.intel.com>
Subject: [PATCH linux dev-4.10 v4 1/1] ARM: dts: Add S2600WF BMC Machine
Date: Fri,  8 Dec 2017 11:00:52 -0800
Message-Id: <1512759652-9684-1-git-send-email-james.feist@linux.intel.com>
X-Mailer: git-send-email 2.7.4
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
X-List-Received-Date: Fri, 08 Dec 2017 19:01:20 -0000

S2600WF is a Intel platform family with an Aspeed ast2500 BMC.

Signed-off-by: James Feist <james.feist@linux.intel.com>
---
 changes since v3:
  - use full product family name
 
 arch/arm/boot/dts/Makefile                     |   1 +
 arch/arm/boot/dts/aspeed-bmc-intel-s2600wf.dts | 128 +++++++++++++++++++++++++
 2 files changed, 129 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-intel-s2600wf.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 6d6c9eb..7c54fc8 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -992,6 +992,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += aspeed-bmc-opp-palmetto.dtb \
 	aspeed-bmc-opp-lanyang.dtb \
 	aspeed-bmc-mellanox-msn.dtb \
 	aspeed-bmc-quanta-q71l.dtb \
+	aspeed-bmc-intel-s2600wf.dtb \
 	aspeed-ast2500-evb.dtb
 endif
 
diff --git a/arch/arm/boot/dts/aspeed-bmc-intel-s2600wf.dts b/arch/arm/boot/dts/aspeed-bmc-intel-s2600wf.dts
new file mode 100644
index 0000000..ef0ba3c
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-intel-s2600wf.dts
@@ -0,0 +1,128 @@
+/dts-v1/;
+
+#include "aspeed-g5.dtsi"
+
+/ {
+	model = "S2600WF BMC";
+	compatible = "intel,s2600wf-bmc", "aspeed,ast2500";
+
+	aliases {
+		serial4 = &uart5;
+	};
+
+	chosen {
+		stdout-path = &uart5;
+		bootargs = "earlyprintk";
+	};
+
+	memory {
+		reg = <0x80000000 0x20000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		vga_memory: framebuffer@7f000000 {
+			no-map;
+			reg = <0x7f000000 0x01000000>;
+		};
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
