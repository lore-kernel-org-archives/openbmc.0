Return-Path: <Chen.KenYY@inventec.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=inventec.com
 (client-ip=61.220.76.161; helo=mail.inventec.com;
 envelope-from=chen.kenyy@inventec.com; receiver=<UNKNOWN>)
X-Greylist: delayed 325 seconds by postgrey-1.36 at bilbo;
 Mon, 08 Jan 2018 14:03:46 AEDT
Received: from mail.inventec.com (hub01.inventec.com [61.220.76.161])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zFKq64hM8zF0Rc
 for <openbmc@lists.ozlabs.org>; Mon,  8 Jan 2018 14:03:46 +1100 (AEDT)
Received: from IEC1-MSE-FE2.inventec.com (10.1.254.204) by
 IEC1-EX2010-03.iec.inventec (10.1.254.155) with Microsoft SMTP Server id
 14.3.174.1; Mon, 8 Jan 2018 10:58:10 +0800
Received: from IEC1-SPAM-2.inventec.com (smg2.inventec.com [10.1.254.202])	by
 IEC1-MSE-FE2.inventec.com with ESMTP id w082w0v3050797	for
 <openbmc@lists.ozlabs.org>; Mon, 8 Jan 2018 10:58:00 +0800 (GMT-8)
 (envelope-from chen.kenyy@inventec.com)
Received: from mail-pf0-f199.google.com (mail-pf0-f199.google.com
 [209.85.192.199])	by IEC1-SPAM-2.inventec.com with ESMTP id w082voO1092308
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)	for
 <openbmc@lists.ozlabs.org>; Mon, 8 Jan 2018 10:57:52 +0800 (GMT-8)
 (envelope-from chen.kenyy@inventec.com)
Received: by mail-pf0-f199.google.com with SMTP id f64so6719052pfd.6
 for <openbmc@lists.ozlabs.org>; Sun, 07 Jan 2018 18:57:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=1B2llt9YdAval+BgqWC4FhfhJV2XyB59Zvw97I7+BR8=;
 b=Qtlp/LOO9LKcuyeHXgflKPUvTES0QXXiUaVJ4Snxbh+xuXIW2FOjdo5DcGzS3epgwW
 urVfTIz11wL9PWTZyupIvxUyfpQaa8pvr49m1PnqiSax6VIRnitR7IG2fbEVLL/3spV3
 XhLJotF6imPw2uiM7XiKLAy1fkR5MqFnYFGkuTJzz/2nZ2e+HG8D3tBGDHrc6jIaCp9/
 jXx2bN7aWUPvOjschSOpTME+w4ZurehNZ3vOGZgb5sRC3MGoKFva+5Bu9tJzAfBruiBa
 kLNF/XbMpfh3BN6NZwNygPpE8NAFeObogMlEGhmi/LRnxW12npMOn3kmYFz5K0tMKeRw
 lAIQ==
X-Gm-Message-State: AKGB3mJNqcNI1Bbu9LnBLfYzJ5JfI/CTEA6W92+9TzXXYBlLVtymSloa
 EKFHCTT/0RKHWheklcLYdESIonCRAEfpo8B8oZTLYlYF4kO4PEl6YjSdBxB5TG6MHEQotQsuyOU
 x3Zjb3kBU6D8G7eO27bAefQ==
X-Received: by 10.98.242.72 with SMTP id y8mr9358346pfl.168.1515380269492;
 Sun, 07 Jan 2018 18:57:49 -0800 (PST)
X-Google-Smtp-Source: ACJfBotNMvmilJ3GLj8RAhUh3rZLWT1jILx5xp8bDETt2PBxC68FWlCx4CwVivZTKNKZ8Wt/lPBJvA==
X-Received: by 10.98.242.72 with SMTP id y8mr9358331pfl.168.1515380269124;
 Sun, 07 Jan 2018 18:57:49 -0800 (PST)
Received: from localhost (60-248-18-139.HINET-IP.hinet.net. [60.248.18.139])
 by smtp.gmail.com with ESMTPSA id
 t80sm614291pgb.88.2018.01.07.18.57.47        (version=TLS1_2
 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);        Sun, 07 Jan 2018
 18:57:47 -0800 (PST)
From: Ken Chen <chen.kenyy@inventec.com>
To: <openbmc@lists.ozlabs.org>
CC: Ken Chen <chen.kenyy@inventec.com>, <joel@jms.id.au>
Subject: [PATCH linux dev-4.10] ARM: dts: aspeed: Add ARM system BMC device
 tree
Date: Mon, 8 Jan 2018 11:00:13 +0800
Message-ID: <20180108030013.20873-1-chen.kenyy@inventec.com>
X-Mailer: git-send-email 2.9.3
X-DNSRBL: 
X-MAIL: IEC1-MSE-FE2.inventec.com w082w0v3050797
MIME-Version: 1.0
Content-Type: text/plain
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
X-List-Received-Date: Mon, 08 Jan 2018 03:03:48 -0000

Add 2400-rep dts and modify platform initial in aspeed.c

Signed-off-by: Ken Chen <chen.kenyy@inventec.com>
---
 arch/arm/boot/dts/aspeed-bmc-arm-2400-rep.dts | 440 ++++++++++++++++++++++++++
 arch/arm/mach-aspeed/aspeed.c                 |  22 ++
 2 files changed, 462 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-arm-2400-rep.dts

diff --git a/arch/arm/boot/dts/aspeed-bmc-arm-2400-rep.dts b/arch/arm/boot/dts/aspeed-bmc-arm-2400-rep.dts
new file mode 100644
index 0000000..cf389f5
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-arm-2400-rep.dts
@@ -0,0 +1,440 @@
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
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		flash_memory: region@98000000 {
+			no-map;
+			reg = <0x98000000 0x04000000>; /* 64M */
+		};
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
+		UID_LED {
+			label = "UID_LED";
+			gpios = <&gpio ASPEED_GPIO(Q, 5) GPIO_ACTIVE_LOW>;
+		};
+
+		RAS_ERROR_LED {
+			label = "RAS_ERROR_LED";
+			gpios = <&gpio ASPEED_GPIO(F, 6) GPIO_ACTIVE_LOW>;
+		};
+
+		System_Fault {
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
+#include "openbmc-flash-layout.dtsi"
+	};
+};
+
+&spi1 {
+        reg = <0x1e630000 0xc4 0x30000000 0x08000000>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        compatible = "aspeed,ast2500-spi";
+        status = "okay";
+        clocks = <&clk_ahb>;
+        clock-names = "ahb";
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
+			
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
+
+        nvt210@4c {
+                compatible = "nvt210";
+                reg = <0x4c>;
+        };
+
+	eeprom@50 {
+                compatible = "atmel,24c128";
+                reg = <0x50>;
+		pagesize = <128>;
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
+	status = "okay";
+	
+	pca9641@70 {
+		compatible = "nxp,pca9641";
+		reg = <0x70>;
+                #address-cells = <1>;
+                #size-cells = <0>;
+                i2c-arb{
+                        tmp421@1d {
+                                compatible = "tmp421";
+                                reg = <0x1d>;
+                        };
+                	adm1278@12 {
+                        	compatible = "adi,adm1278";
+                        	reg = <0x12>;
+				Rsense = <500>;
+                	};
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
+        	                compatible = "max31790";
+                	        reg = <0x23>;
+                        	#address-cells = <2>;
+				#size-cells = <0>;
+				fan-mode = "pwm";
+                                fanconfig1 = <0x08>;
+                                fanconfig2 = <0x09>;
+                                fanconfig3 = <0x08>;
+                                fanconfig4 = <0x08>;
+                                fanconfig5 = <0x09>;
+                                fanconfig6 = <0x08>;
+                	};
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
+&i2c10 {
+	status = "disabled";
+};
+
+&i2c11 {
+	status = "disabled";
+};
+
+&i2c12 {
+	status = "disabled";
+};
+
+&i2c13 {
+	status = "disabled";
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
+&gpio {
+	pin_gpio_a3 {
+		gpios = <ASPEED_GPIO(A, 3) GPIO_ACTIVE_HIGH>;
+		output-low;
+	};
+	pin_gpio_c7 {
+		gpios = <ASPEED_GPIO(C, 7) GPIO_ACTIVE_HIGH>;
+		output-low;
+	};
+	pin_gpio_d2 {
+		gpios = <ASPEED_GPIO(D, 2) GPIO_ACTIVE_HIGH>;
+		output-high;
+	};
+	pin_gpio_d3 {
+		gpios = <ASPEED_GPIO(D, 3) GPIO_ACTIVE_LOW>;
+		output-high;
+	};
+	pin_gpio_f6 {
+		gpios = <ASPEED_GPIO(F, 6) GPIO_ACTIVE_LOW>;
+		output-high;
+	};
+	pin_gpio_g4 {
+		gpios = <ASPEED_GPIO(G, 4) GPIO_ACTIVE_LOW>;
+		output-low;
+	};
+	pin_gpio_g6 {
+		gpios = <ASPEED_GPIO(G, 6) GPIO_ACTIVE_HIGH>;
+		output-low;
+	};
+	pin_gpio_l4 {
+		gpios = <ASPEED_GPIO(L, 4) GPIO_ACTIVE_LOW>;
+		output-high;
+	};
+	pin_gpio_o6 {
+		gpios = <ASPEED_GPIO(O, 6) GPIO_ACTIVE_HIGH>;
+		output-low;
+	};
+	pin_gpio_p0 {
+		gpios = <ASPEED_GPIO(P, 0) GPIO_ACTIVE_HIGH>;
+		output-high;
+	};
+	pin_gpio_p2 {
+		gpios = <ASPEED_GPIO(P, 2) GPIO_ACTIVE_HIGH>;
+		output-low;
+	};
+	pin_gpio_q4 {
+		gpios = <ASPEED_GPIO(Q, 4) GPIO_ACTIVE_HIGH>;
+		output-low;
+	};
+	pin_gpio_r1 {
+		gpios = <ASPEED_GPIO(R, 1) GPIO_ACTIVE_LOW>;
+		output-high;
+	};
+	pin_gpio_y2 {
+		gpios = <ASPEED_GPIO(Y, 2) GPIO_ACTIVE_HIGH>;
+		output-high;
+	};
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
