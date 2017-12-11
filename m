Return-Path: <james.feist@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ywZ8Z1Vn9zDqpb
 for <openbmc@lists.ozlabs.org>; Tue, 12 Dec 2017 07:20:45 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Dec 2017 12:20:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,392,1508828400"; 
   d="scan'208";a="1962025"
Received: from skyhawk.jf.intel.com ([10.54.51.84])
 by orsmga008.jf.intel.com with ESMTP; 11 Dec 2017 12:20:41 -0800
From: James Feist <james.feist@linux.intel.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Cc: James Feist <james.feist@linux.intel.com>
Subject: [PATCH linux dev-4.10 v5 1/1] ARM: dts: Add S2600WF BMC Machine
Date: Mon, 11 Dec 2017 12:20:34 -0800
Message-Id: <1513023634-10621-1-git-send-email-james.feist@linux.intel.com>
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
X-List-Received-Date: Mon, 11 Dec 2017 20:20:46 -0000

S2600WF is a Intel platform family with an Aspeed ast2500 BMC.

Signed-off-by: James Feist <james.feist@linux.intel.com>
---
 changes since v4:
  - removed aliases
  - added fast-read property
  - added copyright header

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
index 0000000..7d5cf3f
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-intel-s2600wf.dts
@@ -0,0 +1,128 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2017 Intel Corporation
+/dts-v1/;
+
+#include "aspeed-g5.dtsi"
+
+/ {
+	model = "S2600WF BMC";
+	compatible = "intel,s2600wf-bmc", "aspeed,ast2500";
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
+		m25p,fast-read;
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
+		m25p,fast-read;
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
