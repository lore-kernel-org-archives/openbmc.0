Return-Path: <anoo@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=anoo@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44DTxr3NWMzDqCX
 for <openbmc@lists.ozlabs.org>; Wed,  6 Mar 2019 08:07:59 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x25L59EQ080941
 for <openbmc@lists.ozlabs.org>; Tue, 5 Mar 2019 16:07:55 -0500
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2r1x9a7p8k-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 05 Mar 2019 16:07:54 -0500
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@linux.ibm.com>;
 Tue, 5 Mar 2019 21:07:53 -0000
Received: from b03cxnp08025.gho.boulder.ibm.com (9.17.130.17)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 5 Mar 2019 21:07:51 -0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x25L7nNL32374794
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 5 Mar 2019 21:07:50 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B5054BE051;
 Tue,  5 Mar 2019 21:07:49 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4F43FBE04F;
 Tue,  5 Mar 2019 21:07:49 +0000 (GMT)
Received: from habcap11p1.aus.stglabs.ibm.com (unknown [9.41.164.53])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  5 Mar 2019 21:07:49 +0000 (GMT)
From: Adriana Kobylak <anoo@linux.ibm.com>
To: joel@jms.id.au, mspinler@linux.ibm.com, msbarth@linux.ibm.com
Cc: openbmc@lists.ozlabs.org, Adriana Kobylak <anoo@linux.ibm.com>
Subject: [PATCH] ARM: dts: aspeed: Add Swift BMC machine
Date: Tue,  5 Mar 2019 15:07:47 -0600
X-Mailer: git-send-email 2.7.4
X-TM-AS-GCONF: 00
x-cbid: 19030521-0016-0000-0000-0000098C5881
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010710; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000281; SDB=6.01170122; UDB=6.00611515; IPR=6.00950755; 
 MB=3.00025846; MTD=3.00000008; XFM=3.00000015; UTC=2019-03-05 21:07:52
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19030521-0017-0000-0000-0000425B311F
Message-Id: <1551820067-53510-1-git-send-email-anoo@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-05_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1903050136
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
X-List-Received-Date: Tue, 05 Mar 2019 21:08:01 -0000

The Swift BMC is an ASPEED ast2500 based BMC that is part of
a Power9 server. This adds the device tree description for
most upstream components.
There's a pending TODO to create the flash layout for its
16GB NAND flash chip. Use the default 32MB NOR flash chip
for this initial commit.

Signed-off-by: Adriana Kobylak <anoo@linux.ibm.com>
---
 arch/arm/boot/dts/Makefile                 |   1 +
 arch/arm/boot/dts/aspeed-bmc-opp-swift.dts | 702 +++++++++++++++++++++++++++++
 2 files changed, 703 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-opp-swift.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 1a2db60..2e0011b 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1204,6 +1204,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-opp-lanyang.dtb \
 	aspeed-bmc-opp-palmetto.dtb \
 	aspeed-bmc-opp-romulus.dtb \
+	aspeed-bmc-opp-swift.dtb \
 	aspeed-bmc-opp-witherspoon.dtb \
 	aspeed-bmc-opp-zaius.dtb \
 	aspeed-bmc-portwell-neptune.dtb \
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts b/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
new file mode 100644
index 0000000..27459b7
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
@@ -0,0 +1,702 @@
+// SPDX-License-Identifier: GPL-2.0+
+/dts-v1/;
+#include "aspeed-g5.dtsi"
+#include <dt-bindings/gpio/aspeed-gpio.h>
+#include <dt-bindings/leds/leds-pca955x.h>
+
+/ {
+	model = "Swift BMC";
+	compatible = "ibm,swift-bmc", "aspeed,ast2500";
+
+	chosen {
+		stdout-path = &uart5;
+		bootargs = "console=ttyS4,115200 earlyprintk";
+	};
+
+	memory@80000000 {
+		reg = <0x80000000 0x20000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		flash_memory: region@98000000 {
+			no-map;
+			reg = <0x98000000 0x04000000>; /* 64M */
+		};
+
+		gfx_memory: framebuffer {
+			size = <0x01000000>;
+			alignment = <0x01000000>;
+			compatible = "shared-dma-pool";
+			reusable;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		air-water {
+			label = "air-water";
+			gpios = <&gpio ASPEED_GPIO(B, 5) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(B, 5)>;
+		};
+
+		checkstop {
+			label = "checkstop";
+			gpios = <&gpio ASPEED_GPIO(J, 2) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(J, 2)>;
+		};
+
+		ps0-presence {
+			label = "ps0-presence";
+			gpios = <&gpio ASPEED_GPIO(R, 7) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(R, 7)>;
+		};
+
+		ps1-presence {
+			label = "ps1-presence";
+			gpios = <&gpio ASPEED_GPIO(N, 0) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(N, 0)>;
+		};
+	};
+
+	iio-hwmon-battery {
+		compatible = "iio-hwmon";
+		io-channels = <&adc 12>;
+	};
+
+	gpio-keys-polled {
+		compatible = "gpio-keys-polled";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		poll-interval = <1000>;
+
+		fan0-presence {
+			label = "fan0-presence";
+			gpios = <&pca0 5 GPIO_ACTIVE_LOW>;
+			linux,code = <5>;
+		};
+
+		fan1-presence {
+			label = "fan1-presence";
+			gpios = <&pca0 6 GPIO_ACTIVE_LOW>;
+			linux,code = <6>;
+		};
+
+		fan2-presence {
+			label = "fan2-presence";
+			gpios = <&pca0 7 GPIO_ACTIVE_LOW>;
+			linux,code = <7>;
+		};
+
+		fan3-presence {
+			label = "fan3-presence";
+			gpios = <&pca0 8 GPIO_ACTIVE_LOW>;
+			linux,code = <8>;
+		};
+
+		fanboost-presence {
+			label = "fanboost-presence";
+			gpios = <&pca0 9 GPIO_ACTIVE_LOW>;
+			linux,code = <9>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		fan0 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca0 0 GPIO_ACTIVE_LOW>;
+		};
+
+		fan1 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca0 1 GPIO_ACTIVE_LOW>;
+		};
+
+		fan2 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca0 2 GPIO_ACTIVE_LOW>;
+		};
+
+		fan3 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca0 3 GPIO_ACTIVE_LOW>;
+		};
+
+		fanboost {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca0 4 GPIO_ACTIVE_LOW>;
+		};
+
+		front-fault {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca0 13 GPIO_ACTIVE_LOW>;
+		};
+
+		front-power {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca0 14 GPIO_ACTIVE_LOW>;
+		};
+
+		front-id {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca0 15 GPIO_ACTIVE_LOW>;
+		};
+
+		rear-fault {
+			gpios = <&gpio ASPEED_GPIO(N, 2) GPIO_ACTIVE_LOW>;
+		};
+
+		rear-id {
+			gpios = <&gpio ASPEED_GPIO(N, 4) GPIO_ACTIVE_LOW>;
+		};
+
+		rear-power {
+			gpios = <&gpio ASPEED_GPIO(N, 3) GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	fsi: gpio-fsi {
+		compatible = "fsi-master-gpio", "fsi-master";
+		#address-cells = <2>;
+		#size-cells = <0>;
+		no-gpio-delays;
+
+		clock-gpios = <&gpio ASPEED_GPIO(AA, 0) GPIO_ACTIVE_HIGH>;
+		data-gpios = <&gpio ASPEED_GPIO(E, 0) GPIO_ACTIVE_HIGH>;
+		mux-gpios = <&gpio ASPEED_GPIO(P, 4) GPIO_ACTIVE_HIGH>;
+		enable-gpios = <&gpio ASPEED_GPIO(P, 0) GPIO_ACTIVE_HIGH>;
+		trans-gpios = <&gpio ASPEED_GPIO(P, 3) GPIO_ACTIVE_HIGH>;
+	};
+
+	iio-hwmon-dps310 {
+		compatible = "iio-hwmon";
+		io-channels = <&dps 0>;
+	};
+
+};
+
+/* TODO Update flash layout for 16GB NAND */
+&fmc {
+	status = "okay";
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "bmc";
+		spi-max-frequency = <50000000>;
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
+		m25p,fast-read;
+		spi-max-frequency = <100000000>;
+	};
+};
+
+&uart1 {
+	/* Rear RS-232 connector */
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_txd1_default
+			&pinctrl_rxd1_default
+			&pinctrl_nrts1_default
+			&pinctrl_ndtr1_default
+			&pinctrl_ndsr1_default
+			&pinctrl_ncts1_default
+			&pinctrl_ndcd1_default
+			&pinctrl_nri1_default>;
+};
+
+&uart2 {
+	/* APSS */
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_txd2_default &pinctrl_rxd2_default>;
+};
+
+&uart5 {
+	status = "okay";
+};
+
+&lpc_ctrl {
+	status = "okay";
+	memory-region = <&flash_memory>;
+	flash = <&spi1>;
+};
+
+&mbox {
+	status = "okay";
+};
+
+&mac0 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rmii1_default>;
+	use-ncsi;
+};
+
+&i2c2 {
+	status = "okay";
+
+	/* MUX ->
+	 *    Samtec 1
+	 *    Samtec 2
+	 */
+};
+
+&i2c3 {
+	status = "okay";
+
+	max31785@52 {
+		compatible = "maxim,max31785a";
+		reg = <0x52>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		fan@0 {
+			compatible = "pmbus-fan";
+			reg = <0>;
+			tach-pulses = <2>;
+			maxim,fan-rotor-input = "tach";
+			maxim,fan-pwm-freq = <25000>;
+			maxim,fan-dual-tach;
+			maxim,fan-no-watchdog;
+			maxim,fan-no-fault-ramp;
+			maxim,fan-ramp = <2>;
+			maxim,fan-fault-pin-mon;
+		};
+
+		fan@1 {
+			compatible = "pmbus-fan";
+			reg = <1>;
+			tach-pulses = <2>;
+			maxim,fan-rotor-input = "tach";
+			maxim,fan-pwm-freq = <25000>;
+			maxim,fan-dual-tach;
+			maxim,fan-no-watchdog;
+			maxim,fan-no-fault-ramp;
+			maxim,fan-ramp = <2>;
+			maxim,fan-fault-pin-mon;
+		};
+
+		fan@2 {
+			compatible = "pmbus-fan";
+			reg = <2>;
+			tach-pulses = <2>;
+			maxim,fan-rotor-input = "tach";
+			maxim,fan-pwm-freq = <25000>;
+			maxim,fan-dual-tach;
+			maxim,fan-no-watchdog;
+			maxim,fan-no-fault-ramp;
+			maxim,fan-ramp = <2>;
+			maxim,fan-fault-pin-mon;
+		};
+
+		fan@3 {
+			compatible = "pmbus-fan";
+			reg = <3>;
+			tach-pulses = <2>;
+			maxim,fan-rotor-input = "tach";
+			maxim,fan-pwm-freq = <25000>;
+			maxim,fan-dual-tach;
+			maxim,fan-no-watchdog;
+			maxim,fan-no-fault-ramp;
+			maxim,fan-ramp = <2>;
+			maxim,fan-fault-pin-mon;
+		};
+
+		fan@4 {
+			compatible = "pmbus-fan";
+			reg = <4>;
+			tach-pulses = <2>;
+			maxim,fan-rotor-input = "tach";
+			maxim,fan-pwm-freq = <25000>;
+			maxim,fan-dual-tach;
+			maxim,fan-no-watchdog;
+			maxim,fan-no-fault-ramp;
+			maxim,fan-ramp = <2>;
+			maxim,fan-fault-pin-mon;
+		};
+	};
+
+	pca0: pca9552@60 {
+		compatible = "nxp,pca9552";
+		reg = <0x60>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio@0 {
+			reg = <0>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@1 {
+			reg = <1>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@2 {
+			reg = <2>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@3 {
+			reg = <3>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@4 {
+			reg = <4>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@5 {
+			reg = <5>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@6 {
+			reg = <6>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@7 {
+			reg = <7>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@8 {
+			reg = <8>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@9 {
+			reg = <9>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@10 {
+			reg = <10>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@11 {
+			reg = <11>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@12 {
+			reg = <12>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@13 {
+			reg = <13>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@14 {
+			reg = <14>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@15 {
+			reg = <15>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+	};
+
+	power-supply@68 {
+		compatible = "ibm,cffps1";
+		reg = <0x68>;
+	};
+
+	eeprom@50 {
+		compatible = "atmel,24c64";
+		reg = <0x50>;
+	};
+
+	power-supply@69 {
+		compatible = "ibm,cffps1";
+		reg = <0x69>;
+	};
+
+	eeprom@51 {
+		compatible = "atmel,24c64";
+		reg = <0x51>;
+	};
+};
+
+&i2c7 {
+	status = "okay";
+
+	dps: dps310@76 {
+		compatible = "infineon,dps310";
+		reg = <0x76>;
+		#io-channel-cells = <0>;
+	};
+
+	tmp275@48 {
+		compatible = "ti,tmp275";
+		reg = <0x48>;
+	};
+
+	si7021a20@20 {
+		compatible = "si,si7021a20";
+		reg = <0x20>;
+	};
+
+	eeprom@50 {
+		compatible = "atmel,24c64";
+		reg = <0x50>;
+	};
+
+	pca9551@60 {
+		compatible = "nxp,pca9551";
+		reg = <0x60>;
+	};
+};
+
+&i2c8 {
+	status = "okay";
+
+	pca9552: pca9552@60 {
+		compatible = "nxp,pca9552";
+		reg = <0x60>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio-line-names = "PS_SMBUS_RESET_N", "APSS_RESET_N",
+			"GPU0_TH_OVERT_N_BUFF",	"GPU1_TH_OVERT_N_BUFF",
+			"GPU2_TH_OVERT_N_BUFF", "GPU3_TH_OVERT_N_BUFF",
+			"P9_SCM0_PRES",	"P9_SCM1_PRES",
+			"GPU0_PWR_GOOD_BUFF", "GPU1_PWR_GOOD_BUFF",
+			"GPU2_PWR_GOOD_BUFF", "GPU3_PWR_GOOD_BUFF",
+			"PRESENT_VRM_CP0_N", "PRESENT_VRM_CP1_N",
+			"12V_BREAKER_FLT_N", "THROTTLE_UNLATCHED_N";
+
+		gpio@0 {
+			reg = <0>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@1 {
+			reg = <1>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@2 {
+			reg = <2>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@3 {
+			reg = <3>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@4 {
+			reg = <4>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@5 {
+			reg = <5>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@6 {
+			reg = <6>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@7 {
+			reg = <7>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@8 {
+			reg = <8>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@9 {
+			reg = <9>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@10 {
+			reg = <10>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@11 {
+			reg = <11>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@12 {
+			reg = <12>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@13 {
+			reg = <13>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@14 {
+			reg = <14>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@15 {
+			reg = <15>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+	};
+
+	rtc@32 {
+		compatible = "epson,rx8900";
+		reg = <0x32>;
+	};
+
+	eeprom@51 {
+		compatible = "atmel,24c64";
+		reg = <0x51>;
+	};
+
+	ucd90160@64 {
+		compatible = "ti,ucd90160";
+		reg = <0x64>;
+	};
+};
+
+&i2c9 {
+	status = "okay";
+
+	tmp423a@4c {
+		compatible = "ti,tmp423";
+		reg = <0x4c>;
+	};
+
+	ir35221@71 {
+		compatible = "infineon,ir35221";
+		reg = <0x71>;
+	};
+
+	ir35221@72 {
+		compatible = "infineon,ir35221";
+		reg = <0x72>;
+	};
+};
+
+&i2c10 {
+	status = "okay";
+
+	tmp423a@4c {
+		compatible = "ti,tmp423";
+		reg = <0x4c>;
+	};
+
+	ir35221@71 {
+		compatible = "infineon,ir35221";
+		reg = <0x71>;
+	};
+
+	ir35221@72 {
+		compatible = "infineon,ir35221";
+		reg = <0x72>;
+	};
+};
+
+&i2c11 {
+	/* MUX
+	 *   -> PCIe Slot 0
+	 *   -> PCIe Slot 1
+	 *   -> PCIe Slot 2
+	 *   -> PCIe Slot 3
+	 */
+	status = "okay";
+};
+
+&i2c12 {
+	status = "okay";
+
+	tmp275@48 {
+		compatible = "ti,tmp275";
+		reg = <0x48>;
+	};
+
+	tmp275@4a {
+		compatible = "ti,tmp275";
+		reg = <0x4a>;
+	};
+};
+
+&i2c13 {
+	status = "okay";
+};
+
+&vuart {
+	status = "okay";
+};
+
+&gfx {
+	status = "okay";
+	memory-region = <&gfx_memory>;
+};
+
+&pinctrl {
+	aspeed,external-nodes = <&gfx &lhc>;
+};
+
+&wdt1 {
+	aspeed,reset-type = "none";
+	aspeed,external-signal;
+	aspeed,ext-push-pull;
+	aspeed,ext-active-high;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_wdtrst1_default>;
+};
+
+&wdt2 {
+	aspeed,alt-boot;
+};
+
+&ibt {
+	status = "okay";
+};
+
+&adc {
+	status = "okay";
+};
+
+#include "ibm-power9-dual.dtsi"
-- 
1.8.3.1
