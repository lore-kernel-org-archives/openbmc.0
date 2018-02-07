Return-Path: <Chen.KenYY@inventec.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=inventec.com
 (client-ip=61.220.76.161; helo=mail.inventec.com;
 envelope-from=chen.kenyy@inventec.com; receiver=<UNKNOWN>)
Received: from mail.inventec.com (hub01.inventec.com [61.220.76.161])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zbrHf3W30zF0xq
 for <openbmc@lists.ozlabs.org>; Wed,  7 Feb 2018 16:59:09 +1100 (AEDT)
Received: from IEC1-MSE-FE1.inventec.com (10.1.254.203) by
 IEC1-EX2010-03.iec.inventec (10.1.254.155) with Microsoft SMTP Server id
 14.3.174.1; Wed, 7 Feb 2018 13:59:01 +0800
Received: from IEC1-SPAM-2.inventec.com (smg2.inventec.com [10.1.254.202])	by
 IEC1-MSE-FE1.inventec.com with ESMTP id w175wtlc061174	for
 <openbmc@lists.ozlabs.org>; Wed, 7 Feb 2018 13:58:55 +0800 (GMT-8)
 (envelope-from chen.kenyy@inventec.com)
Received: from mail-pl0-f72.google.com (mail-pl0-f72.google.com
 [209.85.160.72])	by IEC1-SPAM-2.inventec.com with ESMTP id w175wl5Z013486
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)	for
 <openbmc@lists.ozlabs.org>; Wed, 7 Feb 2018 13:58:48 +0800 (GMT-8)
 (envelope-from chen.kenyy@inventec.com)
Received: by mail-pl0-f72.google.com with SMTP id f1so3063030plb.7 for
 <openbmc@lists.ozlabs.org>; Tue, 06 Feb 2018 21:58:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Yd01RIy7hgSiNsK+H2Gt1SiDi2P2KyiXxj8S2Sp0qfo=;
 b=MIB+ck8AKcFXhRPMTnBImSTtK8s11a9rZtry7bB7+W1P9u1XJT3GGi1Mnj98O7vI6g
 yxm9pp38XbmhiKnDVv2nMHl3tacbCeXWXaFZRlR59ptboir79YUkK8gZB2MnoxjcYVYB
 IPpcpvx6Fjs+jvbJvR1e73/do203b1Hr8DIg7FW+2vv9q9V3zaMuROpMX6wMP8ng+d7T
 7Y3QU4QO/g0y39unkwWI/LB34djgk/ziVzcjbE3VKBe+kVROtjVdkCJ5AeDjaRlp2r9S
 eGgRkggaT4O6Om1QTpiy2eZmn9k4bnCXJkeP7tHuZTjJt44k0zq6cDdNo45r0cIoxXAn
 axRA==
X-Gm-Message-State: APf1xPCBApRa3jWUuy8NBVo7QldmWNQZUbhqh26WZdEOWGNCkwKw8xkg
 xcwDJxvg7UzyYicZ6PEKfczSkbTe6s+Ng11HxQRoNOH/iEdsUnAQtZxGhIxbcqaitZXMtf/OJQS
 MYuKRC21KCCpeNihpFAufkQ==
X-Received: by 2002:a17:902:1665:: with SMTP id
 g92-v6mr4857503plg.245.1517983124676; 
 Tue, 06 Feb 2018 21:58:44 -0800 (PST)
X-Google-Smtp-Source: AH8x224J2oR6Iwdr088evX9u9RgpBaEN3QRPM7/R2cvKjLPiZjdiHfQFGF87lDH+cH/0fwKNInjQfg==
X-Received: by 2002:a17:902:1665:: with SMTP id
 g92-v6mr4857491plg.245.1517983124463; 
 Tue, 06 Feb 2018 21:58:44 -0800 (PST)
Received: from localhost ([122.146.87.216])        by smtp.gmail.com with
 ESMTPSA id k71sm1671871pfg.52.2018.02.06.21.58.42        (version=TLS1_2
 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);        Tue, 06 Feb 2018
 21:58:43 -0800 (PST)
From: Ken Chen <chen.kenyy@inventec.com>
To: <openbmc@lists.ozlabs.org>
CC: Ken Chen <chen.kenyy@inventec.com>, <joel@jms.id.au>
Subject: [PATCH linux dev-4.10 v3] ARM: dts: aspeed: Add ARM system BMC device
 tree
Date: Wed, 7 Feb 2018 14:01:11 +0800
Message-ID: <20180207060111.3280-1-chen.kenyy@inventec.com>
X-Mailer: git-send-email 2.9.3
X-DNSRBL: 
X-MAIL: IEC1-MSE-FE1.inventec.com w175wtlc061174
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Feb 2018 05:59:11 -0000

Add centriq2400-rep dts and modify platform initial

Signed-off-by: Ken Chen <chen.kenyy@inventec.com>
---
 .../boot/dts/aspeed-bmc-arm-centriq2400-rep.dts    | 286 +++++++++++++++++++++
 arch/arm/mach-aspeed/aspeed.c                      |  11 +
 2 files changed, 297 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts

diff --git a/arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts b/arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts
new file mode 100644
index 0000000..de1240b
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts
@@ -0,0 +1,286 @@
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
+                lable = "bmc";
+#include "openbmc-flash-layout.dtsi"
+	};
+};
+
+&spi1 {
+        status = "okay";
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_spi1_default>;
+        flash@0 {
+                reg = < 0 >; /* chip select number */
+                compatible = "jedec,spi-nor";
+                status = "okay";
+        };
+};
+
+&spi2 {
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_spi2ck_default &pinctrl_spi2miso_default &pinctrl_spi2mosi_default &pinctrl_spi2cs0_default>; 
+};
+
+&uart3 {
+        status = "okay";
+
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_txd3_default
+                     &pinctrl_rxd3_default>;
+        current-speed = <115200>;
+};
+
+&lpc_ctrl {
+	status = "okay";
+	memory-region = <&flash_memory>;
+	flash = <&spi1>;
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
+                compatible = "pca9542";
+                reg = <0x70>;
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
+        tmp421@1e {
+                compatible = "ti,tmp421";
+                reg = <0x1e>;
+        };
+        tmp421@2a {
+                compatible = "ti,tmp421";
+                reg = <0x2a>;
+        };
+        tmp421@4e {
+                compatible = "ti,tmp421";
+                reg = <0x4e>;
+        };
+        tmp421@1c {
+                compatible = "ti,tmp421";
+                reg = <0x1c>;
+        };
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
+                compatible = "ti,tmp421";
+                reg = <0x1d>;
+        };
+        tmp421@1f {
+                compatible = "ti,tmp421";
+                reg = <0x1f>;
+        };
+        tmp421@4d {
+                compatible = "ti,tmp421";
+                reg = <0x4d>;
+        };
+        tmp421@4f {
+                compatible = "ti,tmp421";
+                reg = <0x4f>;
+        };
+        nvt210@4c {
+                compatible = "nvt210";
+                reg = <0x4c>;
+        };
+        eeprom@50 {
+                compatible = "atmel,24c128";
+                reg = <0x50>;
+                pagesize = <128>;
+        };
+};
+
+&i2c7 {
+	status = "okay";
+};
+
+&i2c8 {
+        status = "okay";
+
+        pca9641@70 {
+                compatible = "nxp,pca9641";
+                reg = <0x70>;
+                #address-cells = <1>;
+                #size-cells = <0>;
+                i2c-arb{
+                        tmp421@1d {
+                                compatible = "tmp421";
+                                reg = <0x1d>;
+                        };
+                        adm1278@12 {
+                                compatible = "adi,adm1278";
+                                reg = <0x12>;
+				Rsense = <500>;
+                        };
+			eeprom@50 {
+				compatible = "atmel,24c02";
+				reg = <0x50>;
+			};
+                        ds1100@58 {
+                                compatible = "ds1100";
+                                reg = <0x58>;
+                        };
+               };
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
+        status = "okay";
+};
+
+&pinctrl {
+	aspeed,external-nodes = <&gfx &lhc>;
+};
+&wdt2 {
+        status = "okay";
+};
+
+&gpio {
+        pin_gpio_c7 {
+                gpio-hog;
+                gpios = <ASPEED_GPIO(C, 7) GPIO_ACTIVE_HIGH>;
+                output;
+                line-name = "BIOS_SPI_MUX_S";
+        };
+
+}
diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index 5965bbf..8fce9bc 100644
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -232,6 +232,15 @@ static void __init do_mellanox_setup(void)
 	writel(reg, AST_IO(AST_BASE_SCU | 0x48));
 }
 
+
+static void __init do_centriq2400rep_setup(void)
+{
+       u32 reg;
+
+       do_common_setup();
+}
+
+
 #define SCU_PASSWORD	0x1688A8A8
 
 static void __init aspeed_init_early(void)
@@ -284,6 +293,8 @@ static void __init aspeed_init_early(void)
 		do_lanyang_setup();
 	if (of_machine_is_compatible("mellanox,msn-bmc"))
 		do_mellanox_setup();
+        if (of_machine_is_compatible("qualcomm,centriq2400-rep-bmc"))
+                do_centriq2400rep_setup();
 }
 
 static void __init aspeed_map_io(void)
-- 
2.9.3
