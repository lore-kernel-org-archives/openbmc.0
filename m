Return-Path: <Chen.KenYY@inventec.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=inventec.com
 (client-ip=61.220.76.161; helo=mail.inventec.com;
 envelope-from=chen.kenyy@inventec.com; receiver=<UNKNOWN>)
Received: from mail.inventec.com (hub01.inventec.com [61.220.76.161])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zg4Fb1jZFzDqHt
 for <openbmc@lists.ozlabs.org>; Mon, 12 Feb 2018 23:08:34 +1100 (AEDT)
Received: from IEC1-MSE-FE2.inventec.com (10.1.254.204) by
 IEC1-EX2010-03.iec.inventec (10.1.254.155) with Microsoft SMTP Server id
 14.3.174.1; Mon, 12 Feb 2018 20:08:29 +0800
Received: from IEC1-SPAM-2.inventec.com (smg2.inventec.com [10.1.254.202])	by
 IEC1-MSE-FE2.inventec.com with ESMTP id w1CC8MwV096618	for
 <openbmc@lists.ozlabs.org>; Mon, 12 Feb 2018 20:08:22 +0800 (GMT-8)
 (envelope-from chen.kenyy@inventec.com)
Received: from mail-pl0-f70.google.com (mail-pl0-f70.google.com
 [209.85.160.70])	by IEC1-SPAM-2.inventec.com with ESMTP id w1CC8Nlr002886
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)	for
 <openbmc@lists.ozlabs.org>; Mon, 12 Feb 2018 20:08:24 +0800 (GMT-8)
 (envelope-from chen.kenyy@inventec.com)
Received: by mail-pl0-f70.google.com with SMTP id b34so6367954plc.2 for
 <openbmc@lists.ozlabs.org>; Mon, 12 Feb 2018 04:08:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=tQZSXH5wYwzDPS4q9kwG3+7iCuEIpYVvukZ8Jld4cxY=;
 b=D1zEJhSeWwvaCXYW4lR+5Y0HZRinsQyWAaguKBahc3T/asPc1FslJf4t2ayLanUu9C
 XPtdE/y9vLhETXChQVEJNN6K1xdm8M2ub3cG0cEyKPrO1br847D112ZnQDj5wgrcl/DP
 3ouscEaPDj0Y7XhzilUAyfYEQy/7Az/cZO6QjDVqXSXY2/rkgpg133/CPgaQ+gMVG8eT
 /VaH3T7A9ybAH42lveod5zMb+nkLsYzJZ37IoHCkhIuEBmT7xnlu+i8Con/KyOekt+OP
 rQrNDYTGdO3IacStRXQmqAPJKI8HI+XlcT0z6+vnm6HDMEjMToCmAvwNTsPtpjnckNuh
 PQDQ==
X-Gm-Message-State: APf1xPBz6y8BEBCf7/6VFlg+EOQDWYPvsOcyFXdVHGrUAIRS0X7uLF8a
 zyfCQOGtNV0aMaSkkSEjeabtyP/Re7JX+PUMiAjZAIJg1g3gGpwSgisK8CS3g6ny0iuhPVQ3b+t
 efhF8uaTDUagtouzhB0yLVw==
X-Received: by 10.101.72.198 with SMTP id o6mr2919579pgs.279.1518437295892;
 Mon, 12 Feb 2018 04:08:15 -0800 (PST)
X-Google-Smtp-Source: AH8x227YaKyTRUEFLq7qZ4fufV9WOTRZU9oWqVZwY3PqZM+4n+WsEvNcB8RLL63Ymf9tpp6K/aCrDw==
X-Received: by 10.101.72.198 with SMTP id o6mr2919567pgs.279.1518437295635;
 Mon, 12 Feb 2018 04:08:15 -0800 (PST)
Received: from localhost (59-120-179-172.HINET-IP.hinet.net. [59.120.179.172])
 by smtp.gmail.com with ESMTPSA id
 w71sm11118895pfd.184.2018.02.12.04.08.13        (version=TLS1_2
 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);        Mon, 12 Feb 2018
 04:08:14 -0800 (PST)
From: Ken Chen <chen.kenyy@inventec.com>
To: <openbmc@lists.ozlabs.org>
CC: Ken Chen <chen.kenyy@inventec.com>, <joel@jms.id.au>
Subject: [PATCH linux dev-4.13 v5] Add ARM system BMC device tree
Date: Mon, 12 Feb 2018 20:10:47 +0800
Message-ID: <20180212121047.24831-1-chen.kenyy@inventec.com>
X-Mailer: git-send-email 2.9.3
X-DNSRBL: 
X-MAIL: IEC1-MSE-FE2.inventec.com w1CC8MwV096618
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
X-List-Received-Date: Mon, 12 Feb 2018 12:08:36 -0000

Centriq2400-rep is ARM system reference evalutiion platform
with ast2520 BMC.

Signed-off-by: Ken Chen <chen.kenyy@inventec.com>

---
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
 .../boot/dts/aspeed-bmc-arm-centriq2400-rep.dts    | 276 +++++++++++++++++++++
 2 files changed, 277 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 7c54fc8..77aef19 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -993,6 +993,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += aspeed-bmc-opp-palmetto.dtb \
 	aspeed-bmc-mellanox-msn.dtb \
 	aspeed-bmc-quanta-q71l.dtb \
 	aspeed-bmc-intel-s2600wf.dtb \
+        aspeed-bmc-arm-centriq2400-rep.dtb \
 	aspeed-ast2500-evb.dtb
 endif
 
diff --git a/arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts b/arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts
new file mode 100644
index 0000000..b0195e0
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts
@@ -0,0 +1,276 @@
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
+
+	pca9542@70 {
+		compatible = "pca9542";
+		reg = <0x70>;
+		i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+			pca9546@77 {
+				compatible = "pca9546";
+				reg = <0x77>;
+				i2c@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+					eeprom@52 {
+						compatible = "atmel,24c02";
+						reg = <0x52>;
+					};
+				};
+				i2c@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+					eeprom@57 {
+						compatible = "atmel,24c02";
+						reg = <0x57>;
+					};
+				};
+			};
+		};
+		i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+			pca9546@77 {
+				compatible = "pca9546";
+				reg = <0x77>;
+				i2c@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+					eeprom@57 {
+						compatible = "atmel,24c02";
+						reg = <0x57>;
+					};
+				};
+			};
+		};
+
+        };
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
+}
-- 
2.9.3
