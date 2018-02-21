Return-Path: <Chen.KenYY@inventec.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=inventec.com
 (client-ip=218.32.67.167; helo=mail.inventec.com;
 envelope-from=chen.kenyy@inventec.com; receiver=<UNKNOWN>)
Received: from mail.inventec.com (hub02.inventec.com [218.32.67.167])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zmTK31KTNzF0vF
 for <openbmc@lists.ozlabs.org>; Wed, 21 Feb 2018 18:15:18 +1100 (AEDT)
Received: from IEC1-MSE-FE1.inventec.com (10.1.254.203) by
 IEC1-EX2010-04.iec.inventec (10.1.254.157) with Microsoft SMTP Server id
 14.3.361.1; Wed, 21 Feb 2018 15:15:08 +0800
Received: from IEC1-SPAM-2.inventec.com (smg2.inventec.com [10.1.254.202])	by
 IEC1-MSE-FE1.inventec.com with ESMTP id w1L7EwAs047698	for
 <openbmc@lists.ozlabs.org>; Wed, 21 Feb 2018 15:14:58 +0800 (GMT-8)
 (envelope-from chen.kenyy@inventec.com)
Received: from mail-pf0-f197.google.com (mail-pf0-f197.google.com
 [209.85.192.197])	by IEC1-SPAM-2.inventec.com with ESMTP id w1L7F9HC036373
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)	for
 <openbmc@lists.ozlabs.org>; Wed, 21 Feb 2018 15:15:11 +0800 (GMT-8)
 (envelope-from chen.kenyy@inventec.com)
Received: by mail-pf0-f197.google.com with SMTP id m22so433440pfg.15
 for <openbmc@lists.ozlabs.org>; Tue, 20 Feb 2018 23:14:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=dUDQrfOqvVwedq9wrSdqMRKs6+O4z8G+bAVEAdzttqY=;
 b=LdSX1An65X+IL0DlcyQPB6VnJT3tWaTDpKY6/FKVUqj1zHFHF5oBuaazwV7KieeBAR
 Bnuq2MDxrpCuQwNqjnf0jb7AM+ZUMlCMAsJIKhQQRL6SvfV14gdHjeevAO4exN00XovO
 0c0so/srjVLaRTS6HeuQ3ajLvmHv/FPwpuGk7GAq4TyUPSP6r3WX3G9ZH7W6i3OrPO8f
 zsoAm+bLzIWfmgriPVReEL6LVp+s0oal3Rw3c97IsqFIjsYh6Ypn1qj2iKmCZhPUtdoO
 eJGVXP6CEista74z2T3ED7aOqSsGq2zYcJfGa5WHd0/Oie77qsbOZa2kHCaIUNtMr9BI
 Zl8Q==
X-Gm-Message-State: APf1xPAeL9ioCK3WKLyZNVWYlsITH21X54o7u71dnv7ykcnce1YzwdEv
 hTegQmOnQE5XP36+n9fVeM9kTj7vt/yoBP3Mn+yyBPBfK+OKqTC9axi925FVl9iW7i7FLyLfyLA
 f4YJ5p0CKN3Uoq0aWPGJhkw==
X-Received: by 2002:a17:902:8349:: with SMTP id
 z9-v6mr2192542pln.163.1519197293496; 
 Tue, 20 Feb 2018 23:14:53 -0800 (PST)
X-Google-Smtp-Source: AH8x225CX8MynJ6a/OTfWrdiVR+K1njybHYc/gwOEFPbxtfd8VUTmAmfGopENau/IS9PSbbwVhLvmQ==
X-Received: by 2002:a17:902:8349:: with SMTP id
 z9-v6mr2192531pln.163.1519197293241; 
 Tue, 20 Feb 2018 23:14:53 -0800 (PST)
Received: from localhost (60-248-18-139.HINET-IP.hinet.net. [60.248.18.139])
 by smtp.gmail.com with ESMTPSA id
 b88sm57731165pfd.108.2018.02.20.23.14.50        (version=TLS1_2
 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);        Tue, 20 Feb 2018
 23:14:51 -0800 (PST)
From: Ken Chen <chen.kenyy@inventec.com>
To: <openbmc@lists.ozlabs.org>
CC: Ken Chen <chen.kenyy@inventec.com>, <joel@jms.id.au>
Subject: [PATCH linux dev-4.13 v6] Add ARM system BMC device tree
Date: Wed, 21 Feb 2018 15:17:26 +0800
Message-ID: <20180221071726.43440-1-chen.kenyy@inventec.com>
X-Mailer: git-send-email 2.9.3
X-DNSRBL: 
X-MAIL: IEC1-MSE-FE1.inventec.com w1L7EwAs047698
MIME-Version: 1.0
Content-Type: text/plain
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
X-List-Received-Date: Wed, 21 Feb 2018 07:15:19 -0000

The Qualcomm Centriq 2400 REP (Reference Evaluation Platorm) is
aarch64 Armv8 server platform with an ast2520 BMC.

Signed-off-by: Ken Chen <chen.kenyy@inventec.com>
Acked-by: Andrew Jeffery <andrew@aj.id.au>

---
v5->v6
- Modify commit text
- Fix Build fatel error
- Remove PCA9542 and and PAC9641 device
- Rebase to dev-4.13

v4->v5
- Removed strange whitespace
- Removed aspeed.c commit
- Modify commit content

v3->v4
- Modify Makefile for centriq2400-rep dts
- Fix typo label
- Removed unnecessary define of spi2 and centriq2400-spi-hwmon device
- Removed lpc device
- Fix coding style
- Removed ssif device
- Removed max31790 device
- Removed register control of GPIO and Watchdog
---
 arch/arm/boot/dts/Makefile                         |   1 +
 .../boot/dts/aspeed-bmc-arm-centriq2400-rep.dts    | 226 +++++++++++++++++++++
 2 files changed, 227 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 79b0218..5cfee25 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1055,6 +1055,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += \
 dtb-$(CONFIG_ARCH_ZX) += zx296702-ad1.dtb
 dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-ast2500-evb.dtb \
+	aspeed-bmc-arm-centriq2400-rep.dtb \
 	aspeed-bmc-intel-s2600wf.dtb \
 	aspeed-bmc-opp-palmetto.dtb \
 	aspeed-bmc-opp-romulus.dtb \
diff --git a/arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts b/arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts
new file mode 100644
index 0000000..b857589
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts
@@ -0,0 +1,226 @@
+// SPDX-License-Identifier: GPL-2.0+
+/dts-v1/;
+
+#include "aspeed-g5.dtsi"
+#include <dt-bindings/gpio/aspeed-gpio.h>
+
+/ {
+	model = "Qualcomm Centriq 2400  REP AST2520";
+	compatible = "qualcomm,centriq2400-rep-bmc", "aspeed,ast2500";
+
+	chosen {
+		stdout-path = &uart5;
+		bootargs = "console=ttyS4,115200 earlyprintk";
+	};
+
+	memory {
+		reg = <0x80000000 0x40000000>;
+	};
+
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
+                        <&adc 4>, <&adc 5>, <&adc 6>, <&adc 8>;
+	};
+
+	iio-hwmon-battery {
+		compatible = "iio-hwmon";
+		io-channels = <&adc 7>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		uid_led {
+			label = "UID_LED";
+			gpios = <&gpio ASPEED_GPIO(Q, 5) GPIO_ACTIVE_LOW>;
+		};
+
+		ras_error_led {
+			label = "RAS_ERROR_LED";
+			gpios = <&gpio ASPEED_GPIO(F, 6) GPIO_ACTIVE_LOW>;
+		};
+
+		system_fault {
+			label = "System_fault";
+			gpios = <&gpio ASPEED_GPIO(A, 1) GPIO_ACTIVE_LOW>;
+		};
+	};
+};
+
+&fmc {
+	status = "okay";
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "bmc";
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
+	};
+};
+
+&spi2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi2ck_default &pinctrl_spi2miso_default &pinctrl_spi2mosi_default &pinctrl_spi2cs0_default>;
+};
+
+&uart3 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_txd3_default &pinctrl_rxd3_default>;
+	current-speed = <115200>;
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
+};
+
+&i2c0 {
+	status = "okay";
+};
+
+&i2c1 {
+	status = "okay";
+
+	tmp421@1e {
+		compatible = "ti,tmp421";
+		reg = <0x1e>;
+	};
+	tmp421@2a {
+		compatible = "ti,tmp421";
+		reg = <0x2a>;
+	};
+	tmp421@4e {
+		compatible = "ti,tmp421";
+		reg = <0x4e>;
+	};
+	tmp421@1c {
+		compatible = "ti,tmp421";
+		reg = <0x1c>;
+	};
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
+
+	tmp421@1d {
+		compatible = "ti,tmp421";
+		reg = <0x1d>;
+	};
+	tmp421@1f {
+		compatible = "ti,tmp421";
+		reg = <0x1f>;
+	};
+	tmp421@4d {
+		compatible = "ti,tmp421";
+		reg = <0x4d>;
+	};
+	tmp421@4f {
+		compatible = "ti,tmp421";
+		reg = <0x4f>;
+	};
+	nvt210@4c {
+		compatible = "nvt210";
+		reg = <0x4c>;
+	};
+	eeprom@50 {
+		compatible = "atmel,24c128";
+		reg = <0x50>;
+		pagesize = <128>;
+	};
+};
+
+&i2c7 {
+	status = "okay";
+};
+
+&i2c8 {
+	status = "okay";
+
+	pca9641@70 {
+		compatible = "nxp,pca9641";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-arb {
+			tmp421@1d {
+				compatible = "tmp421";
+				reg = <0x1d>;
+			};
+			adm1278@12 {
+				compatible = "adi,adm1278";
+				reg = <0x12>;
+				Rsense = <500>;
+			};
+			eeprom@50 {
+				compatible = "atmel,24c02";
+				reg = <0x50>;
+			};
+			ds1100@58 {
+				compatible = "ds1100";
+				reg = <0x58>;
+			};
+		};
+	};
+};
+
+&i2c9 {
+	status = "okay";
+};
+
+&vuart {
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
+&wdt2 {
+	status = "okay";
+};
+
+&gpio {
+	pin_gpio_c7 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(C, 7) GPIO_ACTIVE_HIGH>;
+		output;
+		line-name = "BIOS_SPI_MUX_S";
+	};
+};
-- 
2.9.3
