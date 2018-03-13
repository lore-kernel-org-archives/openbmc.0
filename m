Return-Path: <prvs=6610abad47=amithash@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=6610abad47=amithash@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="JteWBJ5d"; 
 dkim-atps=neutral
X-Greylist: delayed 550 seconds by postgrey-1.36 at bilbo;
 Wed, 14 Mar 2018 10:13:37 AEDT
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4019dY5WXJzF170
 for <openbmc@lists.ozlabs.org>; Wed, 14 Mar 2018 10:13:36 +1100 (AEDT)
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w2DN0LDK001207
 for <openbmc@lists.ozlabs.org>; Tue, 13 Mar 2018 16:04:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=facebook;
 bh=qQeUMSqRQrsqP+7rx9ihFOu/z8ZbeHAspSFOZbtpWAI=;
 b=JteWBJ5d/qypDatftVSLOkfiGKgsM0Ga+BWmPJcL9Q7wAV0cdgw/DBd9/kB2RBArtKxm
 LhHHy1Y7bLC8jfs1oDTgC3ZENnsHBUkEbH1XEwh6HU6yErGiIZoDrN+yy7CqHs+Xo52S
 xmcR6A9W7askYK7SSAXZVftbUeJL5PIfnIY= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2gpqq9r21g-2
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 13 Mar 2018 16:04:20 -0700
Received: from mx-out.facebook.com (192.168.52.123) by
 PRN-CHUB13.TheFacebook.com (192.168.16.23) with Microsoft SMTP Server id
 14.3.361.1; Tue, 13 Mar 2018 16:04:19 -0700
Received: by devvm25134.prn1.facebook.com (Postfix, from userid 122613)	id
 D861F1580221; Tue, 13 Mar 2018 16:04:18 -0700 (PDT)
Smtp-Origin-Hostprefix: devvm
From: Amithash Prasad <amithash@fb.com>
Smtp-Origin-Hostname: devvm25134.prn1.facebook.com
To: <openbmc@lists.ozlabs.org>, <joel@jms.id.au>
CC: Amithash Prasad <amithash@fb.com>
Smtp-Origin-Cluster: prn1c35
Subject: [PATCH linux dev-4.10] ARM: dts: aspeed: Add Portwell Neptune machine
Date: Tue, 13 Mar 2018 16:04:15 -0700
Message-ID: <20180313230415.1902364-1-amithash@fb.com>
X-Mailer: git-send-email 2.9.5
X-FB-Internal: Safe
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-03-13_09:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-FB-Internal: Safe
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Mar 2018 23:13:38 -0000

Initial introduction of Portwell Neptune family equipped with
Aspeed 2500 BMC SoC. This adds the neptune platform device tree
file including the flash layout used by the neptune machines.

Signed-off-by: Amithash Prasad <amithash@fb.com>
---
 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts  | 145 +++++++++++++++++++++
 3 files changed, 147 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 84601d8..9dbbe7d 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -228,6 +228,7 @@ pine64	Pine64
 pixcir  PIXCIR MICROELECTRONICS Co., Ltd
 plathome	Plat'Home Co., Ltd.
 plda	PLDA
+portwell	Portwell Inc.
 powervr	PowerVR (deprecated, use img)
 pulsedlight	PulsedLight, Inc
 qca	Qualcomm Atheros, Inc.
diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 7c54fc8..044b960 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -993,6 +993,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += aspeed-bmc-opp-palmetto.dtb \
 	aspeed-bmc-mellanox-msn.dtb \
 	aspeed-bmc-quanta-q71l.dtb \
 	aspeed-bmc-intel-s2600wf.dtb \
+	aspeed-bmc-portwell-neptune.dtb \
 	aspeed-ast2500-evb.dtb
 endif
 
diff --git a/arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts b/arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts
new file mode 100644
index 0000000..542a4cad
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts
@@ -0,0 +1,145 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2017 Facebook Inc.
+/dts-v1/;
+
+#include "aspeed-g5.dtsi"
+#include <dt-bindings/gpio/aspeed-gpio.h>
+
+/ {
+	model = "Portwell Neptune BMC";
+	compatible = "portwell,neptune-bmc", "aspeed,ast2500";
+	aliases {
+		serial0 = &uart1;
+		serial4 = &uart5;
+	};
+	chosen {
+		stdout-path = &uart5;
+		bootargs = "console=ttyS4,115200 earlyprintk";
+	};
+
+	memory {
+		reg = <0x80000000 0x20000000>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		postcode0 {
+			label="BMC_UP";
+			gpios = <&gpio ASPEED_GPIO(H, 0) GPIO_ACTIVE_HIGH>;
+			default-state = "on";
+		};
+		postcode1 {
+			label="BMC_HB";
+			gpios = <&gpio ASPEED_GPIO(H, 1) GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+		};
+		postcode2 {
+			label="FAULT";
+			gpios = <&gpio ASPEED_GPIO(H, 2) GPIO_ACTIVE_HIGH>;
+		};
+		// postcode3-7 are GPIOH3-H7
+	};
+};
+
+&wdt2 {
+	status = "okay";
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
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "pnor";
+	};
+};
+
+&uart1 {
+	// Host Console
+	status = "okay";
+};
+
+&uart5 {
+	// BMC Console
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
+&i2c3 {
+	status = "okay";
+	// SMBus to COMe AB
+};
+
+&i2c4 {
+	status = "okay";
+	// I2C to COMe AB
+};
+
+&i2c5 {
+	status = "okay";
+	pca9555@4e {
+		compatible = "nxp,pca9555";
+		pinctrl-names = "default";
+		gpio-controller;
+		#gpio-cells = <2>;
+		reg = <0x27>;
+	};
+};
+
+&i2c6 {
+	status = "okay";
+	tpm@20 {
+		compatible = "infineon,slb9645tt";
+		reg = <0x20>;
+	};
+	tmp421@9c {
+		compatible = "ti,tmp421";
+		reg = <0x4e>;
+	};
+	tmp421@9e {
+		compatible = "ti,tmp421";
+		reg = <0x4f>;
+	};
+};
+
+&i2c8 {
+	status = "okay";
+	eeprom@a2 {
+		compatible = "atmel,24c128";
+		reg = <0x51>;
+		pagesize = <0x32>;
+	};
+};
+
+&pwm_tacho {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default>;
+	fan@0 {
+		reg = <0x00>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x00>;
+	};
+
+	fan@1 {
+		reg = <0x01>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x01>;
+	};
+};
-- 
2.9.5
