Return-Path: <prvs=27945f81c9=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=27945f81c9=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="ZSHrIkv/"; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42B8fg1dMQzF3S6
 for <openbmc@lists.ozlabs.org>; Fri, 14 Sep 2018 06:01:11 +1000 (AEST)
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w8DJvRTN015560
 for <openbmc@lists.ozlabs.org>; Thu, 13 Sep 2018 13:01:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=facebook;
 bh=MfTF6307d/D8CJv8t4e51oa2KnIhD8+xlpmvlCdUaG8=;
 b=ZSHrIkv/BeI6vK0x+TduKFzWCM7rhHWHcaqUNx9LjeLWsc4mEISfZhbLHm9A/ThDnaIu
 k5fobIHh/mkk0d+MOn8Ijt4wEXIROIWBPw1YIS9jrAQBuJO6OeyS6hD85+nTfXpm1GZ7
 /dLdyu4HZwNluD1vvq19IQNhMhVVjQA+jq0= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2mfx8m01nx-7
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 13 Sep 2018 13:01:09 -0700
Received: from mx-out.facebook.com (192.168.52.123) by mail.thefacebook.com
 (192.168.16.15) with Microsoft SMTP Server (TLS) id 14.3.361.1; Thu, 13 Sep
 2018 13:00:34 -0700
Received: by devvm4117.prn2.facebook.com (Postfix, from userid 167582)	id
 04DC6142B1F5; Thu, 13 Sep 2018 12:58:09 -0700 (PDT)
Smtp-Origin-Hostprefix: devvm
From: Vijay Khemka <vijaykhemka@fb.com>
Smtp-Origin-Hostname: devvm4117.prn2.facebook.com
To: <robh+dt@kernel.org>, <mark.rutland@arm.com>, <joel@jms.id.au>,
 <andrew@aj.id.au>, <afaerber@suse.de>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>
CC: Vijay Khemka <vijaykhemka@fb.com>
Smtp-Origin-Cluster: prn2c23
Subject: [PATCH] ARM: dts: aspeed: Adding Facebook TioagaPass BMC
Date: Thu, 13 Sep 2018 12:57:51 -0700
Message-ID: <20180913195751.1833227-1-vijaykhemka@fb.com>
X-Mailer: git-send-email 2.17.1
X-FB-Internal: Safe
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-09-13_11:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-FB-Internal: Safe
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
X-List-Received-Date: Thu, 13 Sep 2018 20:01:16 -0000

Initial introduction of Facebook TioagaPass family equipped with
Aspeed 2500 BMC SoC. Neptune is a x86 server development kit
with a ASPEED ast2500 BMC manufactured by Facebook.
Specifically, This adds the tiogapass platform device tree file
including the flash layout used by the tiogapass BMC machines.

This also adds an entry of tiogapass device tree file in Makefile
as well an entry of Facebook in Documentation for vendor prefix

Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
---
 .../devicetree/bindings/vendor-prefixes.txt   |   1 +
 arch/arm/boot/dts/Makefile                    |   1 +
 .../dts/aspeed-bmc-facebook-tiogapass.dts     | 152 ++++++++++++++++++
 3 files changed, 154 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 2c3fc512e746..733b2d523642 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -127,6 +127,7 @@ everspin	Everspin Technologies, Inc.
 exar	Exar Corporation
 excito	Excito
 ezchip	EZchip Semiconductor
+facebook  Facebook
 fairphone	Fairphone B.V.
 faraday	Faraday Technology Corporation
 fastrax	Fastrax Oy
diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index b5bd3de87c33..9c82c1681c38 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1206,4 +1206,5 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-opp-witherspoon.dtb \
 	aspeed-bmc-opp-zaius.dtb \
 	aspeed-bmc-portwell-neptune.dtb \
+	aspeed-bmc-facebook-tiogapass.dtb \
 	aspeed-bmc-quanta-q71l.dtb
diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
new file mode 100644
index 000000000000..859a00581e34
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
@@ -0,0 +1,152 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2017 Facebook Inc.
+/dts-v1/;
+
+#include "aspeed-g5.dtsi"
+#include <dt-bindings/gpio/aspeed-gpio.h>
+
+/ {
+	model = "Facebook TiogaPass BMC";
+	compatible = "facebook,tiogapass-bmc", "aspeed,ast2500";
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
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_txd1_default
+		     &pinctrl_rxd1_default>;
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
+&i2c1 {
+	status = "okay";
+	// To PCIe slot SMBUS
+};
+
+&i2c2 {
+	status = "okay";
+	// To LAN I210
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
+  //USB Debug card
+	pca9555@27 {
+		compatible = "nxp,pca9555";
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
+	tmp421@4e {
+		compatible = "ti,tmp421";
+		reg = <0x4e>;
+	};
+	tmp421@4f {
+		compatible = "ti,tmp421";
+		reg = <0x4f>;
+	};
+};
+
+&i2c8 {
+	status = "okay";
+	eeprom@51 {
+		compatible = "atmel,24c128";
+		reg = <0x51>;
+		pagesize = <32>;
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
+		reg = <0x00>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x01>;
+	};
+};
-- 
2.17.1
