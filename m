Return-Path: <Chen.KenYY@inventec.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=inventec.com
 (client-ip=61.220.76.161; helo=mail.inventec.com;
 envelope-from=chen.kenyy@inventec.com; receiver=<UNKNOWN>)
Received: from mail.inventec.com (hub01.inventec.com [61.220.76.161])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zZXS66ND0zF0r5
 for <openbmc@lists.ozlabs.org>; Mon,  5 Feb 2018 14:01:57 +1100 (AEDT)
Received: from IEC1-MSE-FE2.inventec.com (10.1.254.204) by
 IEC1-EX2010-03.iec.inventec (10.1.254.155) with Microsoft SMTP Server id
 14.3.174.1; Mon, 5 Feb 2018 11:01:47 +0800
Received: from IEC1-SPAM-2.inventec.com (smg2.inventec.com [10.1.254.202])	by
 IEC1-MSE-FE2.inventec.com with ESMTP id w1531ekW046074	for
 <openbmc@lists.ozlabs.org>; Mon, 5 Feb 2018 11:01:40 +0800 (GMT-8)
 (envelope-from chen.kenyy@inventec.com)
Received: from mail-pg0-f72.google.com (mail-pg0-f72.google.com
 [74.125.83.72])	by IEC1-SPAM-2.inventec.com with ESMTP id w1531SlG016457
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)	for
 <openbmc@lists.ozlabs.org>; Mon, 5 Feb 2018 11:01:30 +0800 (GMT-8)
 (envelope-from chen.kenyy@inventec.com)
Received: by mail-pg0-f72.google.com with SMTP id b4so18853797pgs.5 for
 <openbmc@lists.ozlabs.org>; Sun, 04 Feb 2018 19:01:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ak+pWp7qT06hfiwFQyGMMvLg8xU+L7OguY8QP3YEkak=;
 b=r2OEGgakc69dlPPbrwwk0jam+8iq7nPvy79WRY3h6se4WykJ6yf8TzulQ2by37iIW+
 03041sWuMHb/k54lj+AER3iT8v6tbqO+9p/9pBxoM9tAM+1TaxTKQBvOQh+R4j1AaKjv
 +hTNHrfRggkYk56evyexUYVRNl5Tv6DqlnxO1TEZKAITQxGLKoP8/gjopKE+AsOyK6w5
 nWHUv6MQ1pO66qP71Gy2ZyeKvavpIC75LLuuH9T8Uc5dASX6EnNgPSM44np09pwtOQy5
 DAL0IjIjr4eOjTeNRAUYK9EqWhPXKVMmmeYIhCALyqTfBrEN192To6hWiDraVDn2lsbc
 rVCQ==
X-Gm-Message-State: AKwxyteUg0rDLtFyyEYl38P/E20Nu2eLvUJ7sagm8uy2NgwLUJ2BHngV
 S1rmYQfwb7ma4KvuNvCtF1mIRqSzruoo3iCW5XZY2k/7vYeTQm6wksQzrUIQlOvmONV2bA7gRb6
 3ggjvV0vVWPxzksI0V3pwVA==
X-Received: by 10.98.208.67 with SMTP id p64mr47276839pfg.158.1517799687692;
 Sun, 04 Feb 2018 19:01:27 -0800 (PST)
X-Google-Smtp-Source: AH8x226vNcDo7IZn02NGwKZmSnTpZaH5de78MM3X/HaQKmFD/2p55xAIkCVCDPVDOLvJ1cJxwqiHIA==
X-Received: by 10.98.208.67 with SMTP id p64mr47276823pfg.158.1517799687371;
 Sun, 04 Feb 2018 19:01:27 -0800 (PST)
Received: from localhost (60-248-18-139.HINET-IP.hinet.net. [60.248.18.139])
 by smtp.gmail.com with ESMTPSA id
 k126sm14618594pfc.24.2018.02.04.19.01.25        (version=TLS1_2
 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);        Sun, 04 Feb 2018
 19:01:26 -0800 (PST)
From: Ken Chen <chen.kenyy@inventec.com>
To: <openbmc@lists.ozlabs.org>
CC: Ken Chen <chen.kenyy@inventec.com>, <joel@jms.id.au>
Subject: [PATCH linux dev-4.10 v2] ARM: dts: aspeed: Add ARM system BMC device
 tree
Date: Mon, 5 Feb 2018 11:03:43 +0800
Message-ID: <20180205030343.25114-1-chen.kenyy@inventec.com>
X-Mailer: git-send-email 2.9.3
X-DNSRBL: 
X-MAIL: IEC1-MSE-FE2.inventec.com w1531ekW046074
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
X-List-Received-Date: Mon, 05 Feb 2018 03:02:00 -0000

Add centriq2400-rep dts and modify platform initial

Signed-off-by: Ken Chen <chen.kenyy@inventec.com>
---
 .../boot/dts/aspeed-bmc-arm-centriq2400-rep.dts    | 350 +++++++++++++++++++++
 arch/arm/mach-aspeed/aspeed.c                      |  22 ++
 2 files changed, 372 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts

diff --git a/arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts b/arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts
new file mode 100644
index 0000000..4094732
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts
@@ -0,0 +1,350 @@
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
+        compatible = "aspeed,ast2500-spi-generic";
+        reg = <0x1e631000 0xc4 0x38000000 0x02000000>;
+        interrupts = <59>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        status = "okay";
+        spi2@0 {
+                reg = < 0 >;
+                compatible = "centriq,centriq2400-spi-hwmon";
+                spi-max-frequency = <16000000>;
+                status = "okay";
+        };
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
+	ssif {
+                compatible = "ssif-smbus-slave";
+                reg = <0x42>;
+        };
+
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
+
+        ir38163@42 {
+                compatible = "ir38163";
+                reg = <0x42>;
+        };
+	ir38163@44 {
+                compatible = "ir38163";
+                reg = <0x44>;
+        };
+	ir38163@46 {
+                compatible = "ir38163";
+                reg = <0x46>;
+        };
+	ir38163@48 {
+                compatible = "ir38163";
+                reg = <0x48>;
+        };
+	pxm1310@02 {
+                compatible = "pxm1310";
+                reg = <0x02>;
+        };
+	pxm1310@04 {
+                compatible = "pxm1310";
+                reg = <0x04>;
+        };
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
+
+        adm1278@10 {
+                compatible = "adi,adm1278";
+                reg = <0x10>;
+		Rsense = <250>;
+        };
+        adm1278@11 {
+                compatible = "adi,adm1278";
+                reg = <0x11>;
+		Rsense = <250>;
+        };
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
+                        max31790@20 {
+                                compatible = "max31790";
+                                reg = <0x20>;
+                                #address-cells = <1>;
+                                #size-cells = <0>;
+				fan-mode = "pwm";
+                                fanconfig1 = <0x08>;
+                                fanconfig2 = <0x09>;
+                                fanconfig3 = <0x08>;
+                                fanconfig4 = <0x08>;
+                                fanconfig5 = <0x09>;
+                                fanconfig6 = <0x08>;
+                        };
+	                max31790@23 {
+                                compatible = "max31790";
+                                reg = <0x23>;
+                                #address-cells = <2>;
+				#size-cells = <0>;
+				fan-mode = "pwm";
+                                fanconfig1 = <0x08>;
+                                fanconfig2 = <0x09>;
+                                fanconfig3 = <0x08>;
+                                fanconfig4 = <0x08>;
+                                fanconfig5 = <0x09>;
+                                fanconfig6 = <0x08>;
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
diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index 5965bbf..4f6a5e9 100644
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -29,6 +29,7 @@
 #define AST_BASE_MAC0		0X1E660000 /* MAC 1 */
 #define AST_BASE_SCU		0x1E6E2000 /* System Control Unit (SCU) */
 #define AST_BASE_GPIO		0x1E780000 /* GPIO Controller */
+#define AST_BASE_WDT		0x1E785000 /* Watchdog Timer */
 
 static struct map_desc aspeed_io_desc[] __initdata __maybe_unused = {
 	{
@@ -232,6 +233,25 @@ static void __init do_mellanox_setup(void)
 	writel(reg, AST_IO(AST_BASE_SCU | 0x48));
 }
 
+
+static void __init do_centriq2400rep_setup(void)
+{
+       u32 reg;
+
+       do_common_setup();
+       writel(0x00000010, AST_IO(AST_BASE_WDT | 0x2c));
+
+       writel(0xff000000, AST_IO(AST_BASE_SCU | 0x88));
+
+       /* Set GPIOC7 to output high to init host spi driver */
+       reg = readl(AST_IO(AST_BASE_GPIO | 0x04)) | BIT(23);
+       writel(reg, AST_IO(AST_BASE_GPIO | 0x04));
+
+       reg = readl(AST_IO(AST_BASE_GPIO)) | BIT(23);
+       writel(reg, AST_IO(AST_BASE_GPIO));
+}
+
+
 #define SCU_PASSWORD	0x1688A8A8
 
 static void __init aspeed_init_early(void)
@@ -284,6 +304,8 @@ static void __init aspeed_init_early(void)
 		do_lanyang_setup();
 	if (of_machine_is_compatible("mellanox,msn-bmc"))
 		do_mellanox_setup();
+        if (of_machine_is_compatible("qualcomm,centriq2400-rep-bmc"))
+                do_centriq2400rep_setup();
 }
 
 static void __init aspeed_map_io(void)
-- 
2.9.3
