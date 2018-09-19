Return-Path: <prvs=2800ee65b3=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=2800ee65b3=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="iYC/pEeO"; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42FllP3qCZzDrRP
 for <openbmc@lists.ozlabs.org>; Thu, 20 Sep 2018 02:32:49 +1000 (AEST)
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w8JGWLUu026416
 for <openbmc@lists.ozlabs.org>; Wed, 19 Sep 2018 09:32:47 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=facebook;
 bh=JriOzuGSBXjp2zfTuinXCfo08czmhOPGUL1rWQK3bQE=;
 b=iYC/pEeOsTEsA7G/4/185LmtwJScJHXkZLv99A7mi3c32OfP+Xdq6ozfkRdEJo3vxVIJ
 8uryzop7uShe25+1M3gIv8JrM2ljssxulUy7Q3L78aA1/r45/HuVrq7cjNHUuMbG/kke
 AZb2Wd3mWhK3UjDw4yCtDWK/e6jqGWyQixM= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2mkt0w80gk-11
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 19 Sep 2018 09:32:47 -0700
Received: from mx-out.facebook.com (192.168.52.123) by mail.thefacebook.com
 (192.168.16.24) with Microsoft SMTP Server (TLS) id 14.3.361.1; Wed, 19 Sep
 2018 09:32:23 -0700
Received: by devvm4117.prn2.facebook.com (Postfix, from userid 167582)	id
 00D5E17560E9; Wed, 19 Sep 2018 09:32:20 -0700 (PDT)
Smtp-Origin-Hostprefix: devvm
From: Vijay Khemka <vijaykhemka@fb.com>
Smtp-Origin-Hostname: devvm4117.prn2.facebook.com
To: <openbmc@lists.ozlabs.org>
CC: Vijay Khemka <vijaykhemka@fb.com>
Smtp-Origin-Cluster: prn2c23
Subject: [PATCH v3] ARM: dts: aspeed: Adding Facebook TiogaPass BMC
Date: Wed, 19 Sep 2018 09:32:07 -0700
Message-ID: <20180919163207.3998562-1-vijaykhemka@fb.com>
X-Mailer: git-send-email 2.17.1
X-FB-Internal: Safe
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-09-19_10:, , signatures=0
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
X-List-Received-Date: Wed, 19 Sep 2018 16:32:53 -0000

Initial introduction of Facebook TiogaPass family equipped with
Aspeed 2500 BMC SoC. TiogaPass is a x86 server development kit
with a ASPEED ast2500 BMC manufactured by Facebook.
Specifically, This adds the tiogapass platform device tree file
including the flash layout used by the tiogapass BMC machines.

This also adds an entry of tiogapass device tree file in Makefile

Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
---
 arch/arm/boot/dts/Makefile                    |   1 +
 .../dts/aspeed-bmc-facebook-tiogapass.dts     | 146 ++++++++++++++++++
 2 files changed, 147 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index b5bd3de87c33..1a2db605185a 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1199,6 +1199,7 @@ dtb-$(CONFIG_ARCH_ZX) += zx296702-ad1.dtb
 dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-ast2500-evb.dtb \
 	aspeed-bmc-arm-centriq2400-rep.dtb \
+	aspeed-bmc-facebook-tiogapass.dtb \
 	aspeed-bmc-intel-s2600wf.dtb \
 	aspeed-bmc-opp-lanyang.dtb \
 	aspeed-bmc-opp-palmetto.dtb \
diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
new file mode 100644
index 000000000000..050e72df8683
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
@@ -0,0 +1,146 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright (c) 2018 Facebook Inc.
+// Author: Vijay Khemka <vijaykhemka@fb.com>
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
+	memory@80000000 {
+		reg = <0x80000000 0x20000000>;
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
+&i2c0 {
+	status = "okay";
+	//Airmax Conn B, CPU0 PIROM, CPU1 PIROM
+};
+
+&i2c1 {
+	status = "okay";
+	//X24 Riser
+};
+
+&i2c2 {
+	status = "okay";
+	// Mezz Management SMBus
+};
+
+&i2c3 {
+	status = "okay";
+	// SMBus to Board ID EEPROM
+};
+
+&i2c4 {
+	status = "okay";
+	// BMC Debug Header
+};
+
+&i2c5 {
+	status = "okay";
+  //CPU Voltage regulators
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
+	eeprom@54 {
+		compatible = "atmel,24c64";
+		reg = <0x54>;
+		pagesize = <32>;
+	};
+};
+
+&i2c7 {
+	status = "okay";
+  //HSC, AirMax Conn A
+};
+
+&i2c8 {
+	status = "okay";
+  //Mezz Sensor SMBus
+};
+
+&i2c9 {
+	status = "okay";
+  //USB Debug Connector
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
