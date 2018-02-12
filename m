Return-Path: <Chen.KenYY@inventec.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=inventec.com
 (client-ip=218.32.67.167; helo=mail.inventec.com;
 envelope-from=chen.kenyy@inventec.com; receiver=<UNKNOWN>)
Received: from mail.inventec.com (hub02.inventec.com [218.32.67.167])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zfqx452H8zF0jQ
 for <openbmc@lists.ozlabs.org>; Mon, 12 Feb 2018 13:53:21 +1100 (AEDT)
Received: from IEC1-MSE-FE1.inventec.com (10.1.254.203) by
 IEC1-EX2010-04.iec.inventec (10.1.254.157) with Microsoft SMTP Server id
 14.3.361.1; Mon, 12 Feb 2018 10:53:14 +0800
Received: from IEC1-SPAM-2.inventec.com (smg2.inventec.com [10.1.254.202])	by
 IEC1-MSE-FE1.inventec.com with ESMTP id w1C2r8cd025539	for
 <openbmc@lists.ozlabs.org>; Mon, 12 Feb 2018 10:53:08 +0800 (GMT-8)
 (envelope-from chen.kenyy@inventec.com)
Received: from mail-pl0-f72.google.com (mail-pl0-f72.google.com
 [209.85.160.72])	by IEC1-SPAM-2.inventec.com with ESMTP id w1C2r1AR051279
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)	for
 <openbmc@lists.ozlabs.org>; Mon, 12 Feb 2018 10:53:02 +0800 (GMT-8)
 (envelope-from chen.kenyy@inventec.com)
Received: by mail-pl0-f72.google.com with SMTP id d21so5691004pll.12
 for <openbmc@lists.ozlabs.org>; Sun, 11 Feb 2018 18:52:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ZFQ4jLP4RIQjvbhj+B4JpPSJLnfJKaTZMOed6y2nfxg=;
 b=gEzRTdA0An+8lbzaJWUhGBIlpwUm6Uj2YgQICEjPN0VsNUJawI9/bINOEdSfG3VfA0
 YGyfwXVh+5GYvljqd3DTZAw4nrg4fFgdL+pxQ5RLQr82fBxjnYTgnpjrX+uX4L+lIUX/
 qyGS6qkTumjHC8Prgv6cGQfRZZ4u6uTcfp6oiQaoLXuaOqXVez00givtyZqtiL85mT6a
 h4A7Q7RX193kEUs/NifvH0qYoVO/DhvG7XFlJjCeXHOwH0FkjAGy/Ps17bBETE+gAX58
 gV2Mbc2LEpWlmpNCMZFGz3ae8s2cCDJEgTY138SyWPbSGZNNxCMWba2yrifwky9g8aIO
 wT9g==
X-Gm-Message-State: APf1xPADrom6UIr208tyJ6DshOgBj3bptr1o2v6kD4CTjdHPjoyecmfZ
 mede5r4PDh3HcN4/Ujc47Oe0WyMMwMSIWKUOnP3IBQ85hQTsPNtbGGTzsNmhv2dD/qseqQOqkEQ
 Nztx1hiSrXshFgATt7bKRAg==
X-Received: by 2002:a17:902:2c43:: with SMTP id
 m61-v6mr8533224plb.387.1518403974269; 
 Sun, 11 Feb 2018 18:52:54 -0800 (PST)
X-Google-Smtp-Source: AH8x224Hm+wKYwpYEU++BYKCjTg9upeNiXYUKJ5SGi8CSyNIXQeDEBup8YNg2igzrqYkju8NdhDyHg==
X-Received: by 2002:a17:902:2c43:: with SMTP id
 m61-v6mr8533211plb.387.1518403973846; 
 Sun, 11 Feb 2018 18:52:53 -0800 (PST)
Received: from localhost ([122.146.87.216])        by smtp.gmail.com with
 ESMTPSA id b84sm20836440pfj.11.2018.02.11.18.52.52        (version=TLS1_2
 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);        Sun, 11 Feb 2018
 18:52:52 -0800 (PST)
From: Ken Chen <chen.kenyy@inventec.com>
To: <openbmc@lists.ozlabs.org>
CC: Ken Chen <chen.kenyy@inventec.com>, <joel@jms.id.au>
Subject: [PATCH linux dev-4.13 v4] ARM: dts: aspeed: Add ARM system BMC device
 tree
Date: Mon, 12 Feb 2018 10:55:23 +0800
Message-ID: <20180212025523.5566-1-chen.kenyy@inventec.com>
X-Mailer: git-send-email 2.9.3
X-DNSRBL: 
X-MAIL: IEC1-MSE-FE1.inventec.com w1C2r8cd025539
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
X-List-Received-Date: Mon, 12 Feb 2018 02:53:29 -0000

Add centriq2400-rep dts and modify platform initial

Signed-off-by: Ken Chen <chen.kenyy@inventec.com>

---
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
 arch/arm/mach-aspeed/aspeed.c                      |  11 +
 3 files changed, 288 insertions(+)
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
index 0000000..6c7784f
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
+                label = "bmc";
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
