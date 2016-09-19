Return-Path: <maxims@google.com>
Received: from mail-pf0-x233.google.com (mail-pf0-x233.google.com
 [IPv6:2607:f8b0:400e:c00::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sdCVv6DGvzDsd9
 for <openbmc@lists.ozlabs.org>; Tue, 20 Sep 2016 03:27:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=CQ9d8Zqq; 
 dkim-atps=neutral
Received: by mail-pf0-x233.google.com with SMTP id z123so53006826pfz.2
 for <openbmc@lists.ozlabs.org>; Mon, 19 Sep 2016 10:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id;
 bh=/rMlbDZBEB1HB+br8HH0HHw7r5hE8tM7bgV8872YYG8=;
 b=CQ9d8ZqqfbicfCNvWIXUkwaJ9zrzaaGdHzwxKueTv0e2/0QtQAnGR5j6JY0q1TlglJ
 9nI5DGOyWPDcAJJbK8zTE1sFZwdhxIFGgzc738a726jiQPXkt4xybnlCYP1oQe4ioMPf
 7PsLaiCKikQs3EzcpoWkcfHEAE121whbC6m+FVTjL5sU+q+X2inlBavnqx8G5Rr7tSu1
 /6ZZztqFFlWIJNVACswQd5KajxQeljZFHiobT/W7lzj0rxQwZZDXcNIRuw6Gm6b8LEq3
 UgqUVD/UNOkQhVzbyg4Vl8I6HrMTBX+i0m5PLFjdMIX1ArlrUxNXGgclmkkw13UnKpv8
 AsfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=/rMlbDZBEB1HB+br8HH0HHw7r5hE8tM7bgV8872YYG8=;
 b=PeY+fC1wlQwUrrdLkPHeZPDGw8M8DPLsTFWMFqookHnNqAAcZJINas3S2LGWqX6KXy
 4GfKMByjD6fxRVEVm9KMvSoJkZNLwNMI+iUsNF0u+2Mbr9yFVEOdnd8sCxuSv/hl/Q9V
 HAvBlZlpB2quok7hC6S8MzZYM6XPd2PIHtx15wgPz6IfPYcyd7hIhoqSOJzYqzQyzGfS
 YikxvrxhCgqL8jzSrjQDF5MzqpjVDfdxdjYJNU38idK6NVRDrmaRSZjZ/rdyLRDd8gTN
 qSnabIUWcRqm3v1O6pS0+/6uf2+mySwkGTu7Cf82zmCEf/AWq2mJruF/29sN34yTw8mj
 1qOg==
X-Gm-Message-State: AE9vXwMDCZbF9GxMc6zwc9tUyjWBM/VACbAk7hKY7yL+Uoe+n9Oj0NNgx6i7pHmQBsE/bVGt
X-Received: by 10.98.70.132 with SMTP id o4mr31305298pfi.132.1474306020833;
 Mon, 19 Sep 2016 10:27:00 -0700 (PDT)
Received: from mxsl.mtv.corp.google.com ([100.123.242.80])
 by smtp.gmail.com with ESMTPSA id f16sm68883713pfd.84.2016.09.19.10.27.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 19 Sep 2016 10:27:00 -0700 (PDT)
From: maxims@google.com
To: openbmc@lists.ozlabs.org
Subject: [PATCH] aspeed/g5: Device Tree for ast2500 and eval board, I2C driver
Date: Mon, 19 Sep 2016 10:26:58 -0700
Message-Id: <1474306018-101166-1-git-send-email-maxims@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Sep 2016 17:27:04 -0000

From: Maxim Sloyko <maxims@google.com>

The driver is limited: only single master mode is supported and only
byte-by-byte reads and writes are supported, no DMA or Pool Buffers.

Also, pin function configuration is performed by the I2C driver, because
there is no pinctrl driver at the moment.
---
 arch/arm/dts/Makefile                       |   2 +
 arch/arm/dts/aspeed-g5-evb.dts              |  28 ++
 arch/arm/dts/aspeed-g5.dtsi                 | 392 ++++++++++++++++++++++++++++
 arch/arm/include/asm/arch-aspeed/ast_scu.h  |   6 +
 arch/arm/include/asm/arch-aspeed/regs-scu.h |  74 +++---
 arch/arm/mach-aspeed/ast-scu.c              |  31 ++-
 board/aspeed/ast-g5/ast-g5.c                |   2 +-
 configs/ast_g5_defconfig                    |   4 +-
 drivers/i2c/Kconfig                         |   6 +
 drivers/i2c/Makefile                        |   1 +
 drivers/i2c/ast_i2c.c                       | 306 ++++++++++++++++++++++
 drivers/i2c/ast_i2c.h                       | 155 +++++++++++
 12 files changed, 970 insertions(+), 37 deletions(-)
 create mode 100644 arch/arm/dts/aspeed-g5-evb.dts
 create mode 100644 arch/arm/dts/aspeed-g5.dtsi
 create mode 100644 drivers/i2c/ast_i2c.c
 create mode 100644 drivers/i2c/ast_i2c.h

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index d1f8e22..f1f1ab3 100644
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -233,6 +233,8 @@ dtb-$(CONFIG_SOC_KEYSTONE) += k2hk-evm.dtb \
 	k2e-evm.dtb \
 	k2g-evm.dtb
 
+dtb-y += aspeed-g5-evb.dtb
+
 targets += $(dtb-y)
 
 # Add any required device tree compiler flags here
diff --git a/arch/arm/dts/aspeed-g5-evb.dts b/arch/arm/dts/aspeed-g5-evb.dts
new file mode 100644
index 0000000..95dc77a
--- /dev/null
+++ b/arch/arm/dts/aspeed-g5-evb.dts
@@ -0,0 +1,28 @@
+/dts-v1/;
+
+#include "aspeed-g5.dtsi"
+
+/ {
+	memory {
+		device_type = "memory";
+		reg = <0x80000000 0x20000000>;
+	};
+
+	aliases {
+		i2c1 = &i2c0;
+		i2c4 = &i2c3;
+		i2c8 = &i2c7;
+	};
+};
+
+&i2c0 {
+	status = "okay";
+};
+
+&i2c3 {
+	status = "okay";
+};
+
+&i2c7 {
+	status = "okay";
+};
diff --git a/arch/arm/dts/aspeed-g5.dtsi b/arch/arm/dts/aspeed-g5.dtsi
new file mode 100644
index 0000000..f1ff9e3
--- /dev/null
+++ b/arch/arm/dts/aspeed-g5.dtsi
@@ -0,0 +1,392 @@
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+#include "skeleton.dtsi"
+
+/ {
+	model = "Aspeed BMC";
+	compatible = "aspeed,ast2500";
+	#address-cells = <1>;
+	#size-cells = <1>;
+	interrupt-parent = <&vic>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			compatible = "arm,arm1176", "arm,armv6";
+			device_type = "cpu";
+			reg = <0>;
+		};
+	};
+
+	ahb {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		pinmux: pinmux@1e6e2000 {
+			reg= <0x1e6e2000 0x1000>;
+			compatible = "aspeed,ast2500-pinctrl";
+		};
+
+		vic: interrupt-controller@1e6c0080 {
+			compatible = "aspeed,ast2500-vic";
+			interrupt-controller;
+			#interrupt-cells = <1>;
+			valid-sources = <0xfefff7ff 0x0807ffff>;
+			reg = <0x1e6c0080 0x80>;
+		};
+
+		mac0: ethernet@1e660000 {
+			compatible = "faraday,ftgmac100";
+			reg = <0x1e660000 0x180>;
+			interrupts = <2>;
+			aspeed-g5-interface;
+			no-hw-checksum;
+			status = "disabled";
+		};
+
+		mac1: ethernet@1e680000 {
+			compatible = "faraday,ftgmac100";
+			reg = <0x1e680000 0x180>;
+			interrupts = <3>;
+			aspeed-g5-interface;
+			no-hw-checksum;
+			status = "disabled";
+		};
+
+		apb {
+			compatible = "simple-bus";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			clk_clkin: clk_clkin@1e6e2070 {
+				#clock-cells = <0>;
+				compatible = "aspeed,g5-clkin-clock";
+				reg = <0x1e6e2070 0x04>;
+			};
+
+			clk_hpll: clk_hpll@1e6e2024 {
+				#clock-cells = <0>;
+				compatible = "aspeed,g5-hpll-clock";
+				reg = <0x1e6e2024 0x4>;
+				clocks = <&clk_clkin>;
+			};
+
+			clk_ahb: clk_ahb@1e6e2070 {
+				#clock-cells = <0>;
+				compatible = "aspeed,g5-ahb-clock";
+				reg = <0x1e6e2070 0x4>;
+				clocks = <&clk_hpll>;
+			};
+
+			clk_apb: clk_apb@1e6e2008 {
+				#clock-cells = <0>;
+				compatible = "aspeed,g5-apb-clock";
+				reg = <0x1e6e2008 0x4>;
+				clocks = <&clk_hpll>;
+			};
+
+			clk_uart: clk_uart@1e6e2008 {
+				#clock-cells = <0>;
+				compatible = "aspeed,uart-clock";
+				reg = <0x1e6e202c 0x4>;
+			};
+
+			sram@1e720000 {
+				compatible = "mmio-sram";
+				reg = <0x1e720000 0x9000>;	// 36K
+			};
+
+			timer: timer@1e782000 {
+				compatible = "aspeed,ast2500-timer";
+				reg = <0x1e782000 0x90>;
+				// The moxart_timer driver registers only one
+				// interrupt and assumes it's for timer 1
+				//interrupts = <16 17 18 35 36 37 38 39>;
+				interrupts = <16>;
+				clocks = <&clk_apb>;
+			};
+
+			ibt: ibt@1e789140 {
+				compatible = "aspeed,bt-host";
+				reg = <0x1e789140 0x18>;
+				interrupts = <8>;
+			};
+
+			wdt1: wdt@1e785000 {
+				compatible = "aspeed,ast2500-wdt";
+				reg = <0x1e785000 0x1c>;
+			};
+
+			wdt2: wdt@1e785020 {
+				compatible = "aspeed,ast2500-wdt";
+				reg = <0x1e785020 0x1c>;
+				status = "disabled";
+			};
+
+			wdt3: wdt@1e785040 {
+				compatible = "aspeed,wdt";
+				reg = <0x1e785074 0x1c>;
+				status = "disabled";
+			};
+
+			gpio: gpio@1e780000 {
+			       #gpio-cells = <2>;
+			       gpio-controller;
+			       compatible = "aspeed,ast2500-gpio";
+			       reg = <0x1e780000 0x1000>;
+			       interrupts = <20>;
+			};
+
+			uart1: serial@1e783000 {
+				compatible = "ns16550a";
+				reg = <0x1e783000 0x1000>;
+				reg-shift = <2>;
+				interrupts = <9>;
+				clocks = <&clk_uart>;
+				no-loopback-test;
+				status = "disabled";
+			};
+
+			uart2: serial@1e78d000 {
+				compatible = "ns16550a";
+				reg = <0x1e78d000 0x1000>;
+				reg-shift = <2>;
+				interrupts = <32>;
+				clocks = <&clk_uart>;
+				no-loopback-test;
+				status = "disabled";
+			};
+
+			uart3: serial@1e78e000 {
+				compatible = "ns16550a";
+				reg = <0x1e78e000 0x1000>;
+				reg-shift = <2>;
+				interrupts = <33>;
+				clocks = <&clk_uart>;
+				no-loopback-test;
+				status = "disabled";
+			};
+
+			uart4: serial@1e78f000 {
+				compatible = "ns16550a";
+				reg = <0x1e78f000 0x1000>;
+				reg-shift = <2>;
+				interrupts = <34>;
+				clocks = <&clk_uart>;
+				no-loopback-test;
+				status = "disabled";
+			};
+
+			uart5: serial@1e784000 {
+				compatible = "ns16550a";
+				reg = <0x1e784000 0x1000>;
+				reg-shift = <2>;
+				interrupts = <10>;
+				clocks = <&clk_uart>;
+				current-speed = <38400>;
+				no-loopback-test;
+				status = "disabled";
+			};
+
+			uart6: serial@1e787000 {
+				compatible = "ns16550a";
+				reg = <0x1e787000 0x1000>;
+				reg-shift = <2>;
+				interrupts = <10>;
+				clocks = <&clk_uart>;
+				no-loopback-test;
+				status = "disabled";
+			};
+
+			i2c: i2c@1e78a000 {
+				#address-cells = <1>;
+				#size-cells = <1>;
+				#interrupt-cells = <1>;
+
+				compatible = "aspeed,ast2500-i2c-controller";
+				reg = <0x1e78a000 0x40>;
+				ranges = <0 0x1e78a000 0x1000>;
+				interrupts = <12>;
+				clocks = <&clk_apb>;
+				buffer = <0x1e78a200 0x10>;
+				clock-ranges;
+				interrupt-controller;
+
+				i2c0: i2c-bus@40 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x40 0x40>;
+					compatible = "aspeed,ast2500-i2c-bus";
+					bus = <0>;
+					clock-frequency = <100000>;
+					status = "disabled";
+					interrupts = <0>;
+					interrupt-parent = <&i2c>;
+					buffer;
+				};
+
+				i2c1: i2c-bus@80 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x80 0x40>;
+					compatible = "aspeed,ast2500-i2c-bus";
+					bus = <1>;
+					clock-frequency = <100000>;
+					status = "disabled";
+					interrupts = <1>;
+					buffer = <0x10 0x10>;
+				};
+
+				i2c2: i2c-bus@c0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0xC0 0x40>;
+					compatible = "aspeed,ast2500-i2c-bus";
+					bus = <2>;
+					clock-frequency = <100000>;
+					status = "disabled";
+					interrupts = <2>;
+					buffer = <0x20 0x10>;
+				};
+
+				i2c3: i2c-bus@100 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x100 0x40>;
+					compatible = "aspeed,ast2500-i2c-bus";
+					bus = <3>;
+					clock-frequency = <100000>;
+					status = "disabled";
+					interrupts = <3>;
+					buffer = <0x30 0x10>;
+				};
+
+				i2c4: i2c-bus@140 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x140 0x40>;
+					compatible = "aspeed,ast2500-i2c-bus";
+					bus = <4>;
+					clock-frequency = <100000>;
+					status = "disabled";
+					interrupts = <4>;
+					buffer = <0x40 0x10>;
+				};
+
+				i2c5: i2c-bus@180 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x180 0x40>;
+					compatible = "aspeed,ast2500-i2c-bus";
+					bus = <5>;
+					clock-frequency = <100000>;
+					status = "disabled";
+					interrupts = <5>;
+					buffer = <0x50 0x10>;
+				};
+
+				i2c6: i2c-bus@1c0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x1C0 0x40>;
+					compatible = "aspeed,ast2500-i2c-bus";
+					bus = <6>;
+					clock-frequency = <100000>;
+					status = "disabled";
+					interrupts = <6>;
+					buffer = <0x60 0x10>;
+				};
+
+				i2c7: i2c-bus@300 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x300 0x40>;
+					compatible = "aspeed,ast2500-i2c-bus";
+					bus = <7>;
+					clock-frequency = <100000>;
+					status = "disabled";
+					interrupts = <7>;
+					buffer = <0x70 0x10>;
+				};
+
+				i2c8: i2c-bus@340 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x340 0x40>;
+					compatible = "aspeed,ast2500-i2c-bus";
+					bus = <8>;
+					clock-frequency = <100000>;
+					status = "disabled";
+					interrupts = <8>;
+					buffer = <0x80 0x10>;
+				};
+
+				i2c9: i2c-bus@380 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x380 0x40>;
+					compatible = "aspeed,ast2500-i2c-bus";
+					bus = <9>;
+					clock-frequency = <100000>;
+					status = "disabled";
+					interrupts = <9>;
+					buffer = <0x90 0x10>;
+				};
+
+				i2c10: i2c-bus@3c0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x3c0 0x40>;
+					compatible = "aspeed,ast2500-i2c-bus";
+					bus = <10>;
+					clock-frequency = <100000>;
+					status = "disabled";
+					interrupts = <10>;
+					buffer = <0xa0 0x10>;
+				};
+
+				i2c11: i2c-bus@400 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x400 0x40>;
+					compatible = "aspeed,ast2500-i2c-bus";
+					bus = <11>;
+					clock-frequency = <100000>;
+					status = "disabled";
+					interrupts = <11>;
+					buffer = <0xb0 0x10>;
+				};
+
+				i2c12: i2c-bus@440 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x440 0x40>;
+					compatible = "aspeed,ast2500-i2c-bus";
+					bus = <12>;
+					clock-frequency = <100000>;
+					status = "disabled";
+					interrupts = <12>;
+					buffer = <0xc0 0x10>;
+				};
+
+				i2c13: i2c-bus@480 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x480 0x40>;
+					compatible = "aspeed,ast2500-i2c-bus";
+					bus = <13>;
+					clock-frequency = <100000>;
+					status = "disabled";
+					interrupts = <13>;
+					buffer = <0xd0 0x10>;
+				};
+
+			};
+		};
+	};
+};
diff --git a/arch/arm/include/asm/arch-aspeed/ast_scu.h b/arch/arm/include/asm/arch-aspeed/ast_scu.h
index d248416..80ebd6f 100644
--- a/arch/arm/include/asm/arch-aspeed/ast_scu.h
+++ b/arch/arm/include/asm/arch-aspeed/ast_scu.h
@@ -38,6 +38,7 @@ extern void ast_scu_get_who_init_dram(void);
 extern u32 ast_get_clk_source(void);
 extern u32 ast_get_h_pll_clk(void);
 extern u32 ast_get_ahbclk(void);
+extern u32 ast_get_apbclk(void);
 
 extern u32 ast_scu_get_vga_memsize(void);
 
@@ -45,4 +46,9 @@ extern void ast_scu_init_eth(u8 num);
 extern void ast_scu_multi_func_eth(u8 num);
 extern void ast_scu_multi_func_romcs(u8 num);
 
+/* Enable I2C controller and pins for a particular device.
+ * Device numbering starts at 1
+ */
+extern void ast_scu_enable_i2c(u8 num);
+
 #endif
diff --git a/arch/arm/include/asm/arch-aspeed/regs-scu.h b/arch/arm/include/asm/arch-aspeed/regs-scu.h
index b89df82..92ce84a 100644
--- a/arch/arm/include/asm/arch-aspeed/regs-scu.h
+++ b/arch/arm/include/asm/arch-aspeed/regs-scu.h
@@ -10,8 +10,8 @@
  *    1. 2012/12/29 Ryan Chen Create
  *
 ********************************************************************************/
-#ifndef __AST_SCU_H
-#define __AST_SCU_H                     1
+#ifndef __AST_REGS_SCU_H
+#define __AST_REGS_SCU_H                     1
 
 #include <asm/arch/aspeed.h>
 
@@ -830,49 +830,50 @@
 /* AST_SCU_FUN_PIN_CTRL5		0x90 - Multi-function Pin Control#5 */
 #define SCU_FUN_PIN_SPICS1		(0x1 << 31)
 #define SCU_FUN_PIN_LPC_PLUS		(0x1 << 30)
-#define SCU_FUC_PIN_USB20_HOST		(0x1 << 29)
-#define SCU_FUC_PIN_USB11_PORT4		(0x1 << 28)
-#define SCU_FUC_PIN_I2C14		(0x1 << 27)
-#define SCU_FUC_PIN_I2C13		(0x1 << 26)
-#define SCU_FUC_PIN_I2C12		(0x1 << 25)
-#define SCU_FUC_PIN_I2C11		(0x1 << 24)
-#define SCU_FUC_PIN_I2C10		(0x1 << 23)
-#define SCU_FUC_PIN_I2C9		(0x1 << 22)
-#define SCU_FUC_PIN_I2C8		(0x1 << 21)
-#define SCU_FUC_PIN_I2C7		(0x1 << 20)
-#define SCU_FUC_PIN_I2C6		(0x1 << 19)
-#define SCU_FUC_PIN_I2C5		(0x1 << 18)
-#define SCU_FUC_PIN_I2C4		(0x1 << 17)
-#define SCU_FUC_PIN_I2C3		(0x1 << 16)
-#define SCU_FUC_PIN_MII2_RX_DWN_DIS	(0x1 << 15)
-#define SCU_FUC_PIN_MII2_TX_DWN_DIS	(0x1 << 14)
-#define SCU_FUC_PIN_MII1_RX_DWN_DIS	(0x1 << 13)
-#define SCU_FUC_PIN_MII1_TX_DWN_DIS	(0x1 << 12)
-
-#define SCU_FUC_PIN_MII2_TX_DRIV(x)	(x << 10)
-#define SCU_FUC_PIN_MII2_TX_DRIV_MASK	(0x3 << 10)
-#define SCU_FUC_PIN_MII1_TX_DRIV(x)	(x << 8)
-#define SCU_FUC_PIN_MII1_TX_DRIV_MASK	(0x3 << 8)
+#define SCU_FUN_PIN_USB20_HOST		(0x1 << 29)
+#define SCU_FUN_PIN_USB11_PORT4		(0x1 << 28)
+#define SCU_FUN_PIN_I2C14		(0x1 << 27)
+#define SCU_FUN_PIN_I2C13		(0x1 << 26)
+#define SCU_FUN_PIN_I2C12		(0x1 << 25)
+#define SCU_FUN_PIN_I2C11		(0x1 << 24)
+#define SCU_FUN_PIN_I2C10		(0x1 << 23)
+#define SCU_FUN_PIN_I2C9		(0x1 << 22)
+#define SCU_FUN_PIN_I2C8		(0x1 << 21)
+#define SCU_FUN_PIN_I2C7		(0x1 << 20)
+#define SCU_FUN_PIN_I2C6		(0x1 << 19)
+#define SCU_FUN_PIN_I2C5		(0x1 << 18)
+#define SCU_FUN_PIN_I2C4		(0x1 << 17)
+#define SCU_FUN_PIN_I2C3		(0x1 << 16)
+#define SCU_FUN_PIN_I2C(n)		(0x1 << (16 + (n) - 3))
+#define SCU_FUN_PIN_MII2_RX_DWN_DIS	(0x1 << 15)
+#define SCU_FUN_PIN_MII2_TX_DWN_DIS	(0x1 << 14)
+#define SCU_FUN_PIN_MII1_RX_DWN_DIS	(0x1 << 13)
+#define SCU_FUN_PIN_MII1_TX_DWN_DIS	(0x1 << 12)
+
+#define SCU_FUN_PIN_MII2_TX_DRIV(x)	(x << 10)
+#define SCU_FUN_PIN_MII2_TX_DRIV_MASK	(0x3 << 10)
+#define SCU_FUN_PIN_MII1_TX_DRIV(x)	(x << 8)
+#define SCU_FUN_PIN_MII1_TX_DRIV_MASK	(0x3 << 8)
 
 #define MII_NORMAL_DRIV			0x0
 #define MII_HIGH_DRIV			0x2
 
-#define SCU_FUC_PIN_UART6		(0x1 << 7)
-#define SCU_FUC_PIN_ROM_16BIT		(0x1 << 6)
-#define SCU_FUC_PIN_DIGI_V_OUT(x)	(x)
-#define SCU_FUC_PIN_DIGI_V_OUT_MASK	(0x3)
+#define SCU_FUN_PIN_UART6		(0x1 << 7)
+#define SCU_FUN_PIN_ROM_16BIT		(0x1 << 6)
+#define SCU_FUN_PIN_DIGI_V_OUT(x)	(x)
+#define SCU_FUN_PIN_DIGI_V_OUT_MASK	(0x3)
 
 #define VIDEO_DISABLE			0x0
 #define VIDEO_12BITS			0x1
 #define VIDEO_24BITS			0x2
 //#define VIDEO_DISABLE			0x3
 
-#define SCU_FUC_PIN_USB11_PORT2		(0x1 << 3)
-#define SCU_FUC_PIN_SD1_8BIT		(0x1 << 3)
+#define SCU_FUN_PIN_USB11_PORT2		(0x1 << 3)
+#define SCU_FUN_PIN_SD1_8BIT		(0x1 << 3)
 
-#define SCU_FUC_PIN_MAC1_MDIO		(0x1 << 2)
-#define SCU_FUC_PIN_SD2			(0x1 << 1)
-#define SCU_FUC_PIN_SD1			(0x1 << 0)
+#define SCU_FUN_PIN_MAC1_MDIO		(0x1 << 2)
+#define SCU_FUN_PIN_SD2			(0x1 << 1)
+#define SCU_FUN_PIN_SD1			(0x1 << 0)
 
 
 /* AST_SCU_FUN_PIN_CTRL6		0x94 - Multi-function Pin Control#6*/
@@ -914,6 +915,11 @@
 #define SCU_FUN_PIN_ROMA4		(0x1 << 18)
 #define SCU_FUN_PIN_ROMA3		(0x1 << 17)
 #define SCU_FUN_PIN_ROMA2		(0x1 << 16)
+/* AST2500 only */
+#define SCU_FUN_PIN_SDA2		(0x1 << 15)
+#define SCU_FUN_PIN_SCL2		(0x1 << 14)
+#define SCU_FUN_PIN_SDA1		(0x1 << 13)
+#define SCU_FUN_PIN_SCL1		(0x1 << 12)
 
 /* AST_SCU_FUN_PIN_CTRL9		0xA8 - Multi-function Pin Control#9 */
 #define SCU_FUN_PIN_ROMA21		(0x1 << 3)
diff --git a/arch/arm/mach-aspeed/ast-scu.c b/arch/arm/mach-aspeed/ast-scu.c
index 0cc0d67..31cea60 100644
--- a/arch/arm/mach-aspeed/ast-scu.c
+++ b/arch/arm/mach-aspeed/ast-scu.c
@@ -250,6 +250,7 @@ u32 ast_get_ahbclk(void)
 	return ((hpll / axi_div) / ahb_div);
 }
 
+
 #else /* ! AST_SOC_G5 */
 
 u32 ast_get_h_pll_clk(void)
@@ -318,6 +319,14 @@ u32 ast_get_ahbclk(void)
 
 #endif /* AST_SOC_G5 */
 
+u32 ast_get_apbclk(void)
+{
+	u32 h_pll = ast_get_h_pll_clk();
+	u32 apb_div = SCU_GET_PCLK_DIV(ast_scu_read(AST_SCU_CLK_SEL));
+	return h_pll / apb_div;
+}
+
+
 void ast_scu_show_system_info(void)
 {
 
@@ -394,7 +403,7 @@ void ast_scu_multi_func_eth(u8 num)
 			      AST_SCU_FUN_PIN_CTRL1);
 
 		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) |
-			      SCU_FUC_PIN_MAC1_MDIO,
+			      SCU_FUN_PIN_MAC1_MDIO,
 			      AST_SCU_FUN_PIN_CTRL5);
 
 		break;
@@ -496,3 +505,23 @@ void ast_scu_get_who_init_dram(void)
 		break;
 	}
 }
+
+void ast_scu_enable_i2c(u8 num)
+{
+	/* Enable I2C Controllers */
+	clrbits_le32(AST_SCU_BASE + AST_SCU_RESET, SCU_RESET_I2C);
+
+	if (num < 3) {
+#ifdef AST_SOC_G5
+		if (num == 1) {
+			setbits_le32(AST_SCU_BASE + AST_SCU_FUN_PIN_CTRL8,
+						 SCU_FUN_PIN_SDA1 | SCU_FUN_PIN_SCL1);
+		} else {
+			setbits_le32(AST_SCU_BASE + AST_SCU_FUN_PIN_CTRL8,
+						 SCU_FUN_PIN_SDA2 | SCU_FUN_PIN_SCL2);
+		}
+#endif
+	} else {
+		setbits_le32(AST_SCU_BASE + AST_SCU_FUN_PIN_CTRL5, SCU_FUN_PIN_I2C(num));
+	}
+}
diff --git a/board/aspeed/ast-g5/ast-g5.c b/board/aspeed/ast-g5/ast-g5.c
index 81ea88a..03ce0de 100644
--- a/board/aspeed/ast-g5/ast-g5.c
+++ b/board/aspeed/ast-g5/ast-g5.c
@@ -36,6 +36,7 @@
 #include <common.h>
 #include <netdev.h>
 #include <asm/arch/ast_scu.h>
+#include <asm/arch/regs-scu.h>
 #include <asm/arch/ast-sdmc.h>
 #include <asm/io.h>
 
@@ -52,7 +53,6 @@ int board_init(void)
 {
 	/* adress of boot parameters */
 	gd->bd->bi_boot_params = CONFIG_SYS_SDRAM_BASE + 0x100;
-	gd->flags = 0;
 	return 0;
 }
 
diff --git a/configs/ast_g5_defconfig b/configs/ast_g5_defconfig
index b5f2b24..20b02a3 100644
--- a/configs/ast_g5_defconfig
+++ b/configs/ast_g5_defconfig
@@ -1,4 +1,5 @@
 CONFIG_ARM=y
+CONFIG_DEFAULT_DEVICE_TREE="aspeed-g5"
 CONFIG_TARGET_AST_G5=y
 CONFIG_SPI_FLASH=y
 CONFIG_SYS_NS16550=y
@@ -6,4 +7,5 @@ CONFIG_SYS_PROMPT="ast# "
 CONFIG_CMD_SAVEENV=y
 CONFIG_CMD_FLASH=y
 CONFIG_CMD_PING=y
-CONFIG_CMD_DHCP=y
\ No newline at end of file
+CONFIG_CMD_DHCP=y
+CONFIG_SYS_I2C_ASPEED=y
diff --git a/drivers/i2c/Kconfig b/drivers/i2c/Kconfig
index 9324c6c..6501e91 100644
--- a/drivers/i2c/Kconfig
+++ b/drivers/i2c/Kconfig
@@ -65,6 +65,12 @@ config SYS_I2C_CADENCE
 	  Say yes here to select Cadence I2C Host Controller. This controller is
 	  e.g. used by Xilinx Zynq.
 
+config SYS_I2C_AST
+	tristate "Aspeed I2C Controller"
+	depends on DM_I2C
+	help
+	  Say yes here to select Aspeed I2C Host Controller.
+
 config SYS_I2C_INTEL
 	bool "Intel I2C/SMBUS driver"
 	depends on DM_I2C
diff --git a/drivers/i2c/Makefile b/drivers/i2c/Makefile
index 167424d..89e046e 100644
--- a/drivers/i2c/Makefile
+++ b/drivers/i2c/Makefile
@@ -16,6 +16,7 @@ obj-$(CONFIG_PCA9564_I2C) += pca9564_i2c.o
 obj-$(CONFIG_TSI108_I2C) += tsi108_i2c.o
 obj-$(CONFIG_SH_SH7734_I2C) += sh_sh7734_i2c.o
 obj-$(CONFIG_SYS_I2C) += i2c_core.o
+obj-$(CONFIG_SYS_I2C_AST) += ast_i2c.o
 obj-$(CONFIG_SYS_I2C_CADENCE) += i2c-cdns.o
 obj-$(CONFIG_SYS_I2C_DAVINCI) += davinci_i2c.o
 obj-$(CONFIG_SYS_I2C_DW) += designware_i2c.o
diff --git a/drivers/i2c/ast_i2c.c b/drivers/i2c/ast_i2c.c
new file mode 100644
index 0000000..144bf02
--- /dev/null
+++ b/drivers/i2c/ast_i2c.c
@@ -0,0 +1,306 @@
+/*
+ * Copyright (C) 2016 Google, Inc
+ *
+ * SPDX-License-Identifier:	GPL-2.0+
+ */
+
+#include <common.h>
+#include <dm.h>
+#include <fdtdec.h>
+#include <i2c.h>
+
+#include <asm/arch/ast_scu.h>
+#include <asm/arch/regs-scu.h>
+#include <asm/io.h>
+
+#include "ast_i2c.h"
+
+#define I2C_TIMEOUT_US (100000)
+#define I2C_SLEEP_STEP (20)
+#define EI2C_TIMEOUT (1001)
+
+DECLARE_GLOBAL_DATA_PTR;
+
+struct ast_i2c {
+	u32 id;
+	struct ast_i2c_regs *regs;
+	int speed;
+};
+
+#define RETURN_IF_ERROR(expr) do {\
+	int err = (expr);\
+	if (err < 0) {\
+		return err;\
+	}\
+} while (0)
+
+static u32 __get_clk_reg_val(u32 divider_ratio)
+{
+	unsigned int inc = 0, div;
+	u32 scl_low, scl_high, data;
+
+	for (div = 0; divider_ratio >= 16; div++) {
+		inc |= (divider_ratio & 1);
+		divider_ratio >>= 1;
+	}
+	divider_ratio += inc;
+	scl_low = (divider_ratio >> 1) - 1;
+	scl_high = divider_ratio - scl_low - 2;
+	data = 0x77700300 | (scl_high << 16) | (scl_low << 12) | div;
+	return data;
+}
+
+static inline void __ast_i2c_clear_interrupts(struct ast_i2c_regs *i2c_base)
+{
+	writel(~0, &i2c_base->isr);
+}
+
+static int __ast_i2c_init_bus(struct ast_i2c *i2c_bus)
+{
+	/* Reset device */
+	writel(0, &i2c_bus->regs->fcr);
+	/* Enable Master Mode. Assuming single-master. */
+	debug("Enable Master for %p\n", i2c_bus->regs);
+	setbits_le32(&i2c_bus->regs->fcr,
+		     AST_I2CD_MASTER_EN
+		     | AST_I2CD_M_SDA_LOCK_EN
+		     | AST_I2CD_MULTI_MASTER_DIS | AST_I2CD_M_SCL_DRIVE_EN);
+	debug("FCR: %p\n", &i2c_bus->regs->fcr);
+	/* Enable Interrupts */
+	writel(AST_I2CD_INTR_TX_ACK
+	       | AST_I2CD_INTR_TX_NAK
+	       | AST_I2CD_INTR_RX_DONE
+	       | AST_I2CD_INTR_BUS_RECOVER_DONE
+	       | AST_I2CD_INTR_NORMAL_STOP
+	       | AST_I2CD_INTR_ABNORMAL, &i2c_bus->regs->icr);
+	return 0;
+}
+
+static int ast_i2c_probe(struct udevice *dev)
+{
+	struct ast_i2c *i2c_bus = dev_get_priv(dev);
+
+	debug("Enabling I2C%u \n", dev->seq);
+	ast_scu_enable_i2c(dev->seq);
+
+	i2c_bus->id = dev->seq;
+	struct ast_i2c_regs *i2c_base =
+	    (struct ast_i2c_regs *)dev_get_addr(dev);
+	i2c_bus->regs = i2c_base;
+
+	return __ast_i2c_init_bus(i2c_bus);
+}
+
+static inline int __ast_i2c_wait_isr(struct ast_i2c_regs *i2c_base, u32 flag)
+{
+	int timeout = I2C_TIMEOUT_US;
+	while (!(readl(&i2c_base->isr) & flag) && timeout > 0) {
+		udelay(I2C_SLEEP_STEP);
+		timeout -= I2C_SLEEP_STEP;
+	}
+
+	__ast_i2c_clear_interrupts(i2c_base);
+	if (timeout <= 0)
+		return -EI2C_TIMEOUT;
+	return 0;
+}
+
+static inline int __ast_i2c_send_stop(struct ast_i2c_regs *i2c_base)
+{
+	writel(AST_I2CD_M_STOP_CMD, &i2c_base->csr);
+	RETURN_IF_ERROR(__ast_i2c_wait_isr
+			(i2c_base, AST_I2CD_INTR_NORMAL_STOP));
+	return 0;
+}
+
+static inline int __ast_i2c_wait_tx(struct ast_i2c_regs *i2c_base)
+{
+	int timeout = I2C_TIMEOUT_US;
+	u32 flag = AST_I2CD_INTR_TX_ACK | AST_I2CD_INTR_TX_NAK;
+	u32 status = readl(&i2c_base->isr) & flag;
+	while (!status && timeout > 0) {
+		status = readl(&i2c_base->isr) & flag;
+		udelay(I2C_SLEEP_STEP);
+		timeout -= I2C_SLEEP_STEP;
+	}
+
+	int ret = 0;
+	if (status == AST_I2CD_INTR_TX_NAK) {
+		ret = -EREMOTEIO;
+	}
+
+	if (timeout <= 0) {
+		ret = -EI2C_TIMEOUT;
+	}
+
+	__ast_i2c_clear_interrupts(i2c_base);
+	return ret;
+}
+
+static inline int __ast_i2c_start_txn(struct ast_i2c_regs *i2c_base, u8 devaddr)
+{
+	/* Start and Send Device Address */
+	writel(devaddr, &i2c_base->trbbr);
+	writel(AST_I2CD_M_START_CMD | AST_I2CD_M_TX_CMD, &i2c_base->csr);
+	RETURN_IF_ERROR(__ast_i2c_wait_tx(i2c_base));
+	return 0;
+}
+
+static int __ast_i2c_read_data(struct ast_i2c *i2c_bus, u8 chip, u8 *buffer,
+			       int len)
+{
+	int i2c_error = 0;
+	struct ast_i2c_regs *i2c_base = i2c_bus->regs;
+
+	i2c_error = __ast_i2c_start_txn(i2c_base, (chip << 1) | I2C_M_RD);
+
+	if (!i2c_error) {
+		u32 i2c_cmd = AST_I2CD_M_RX_CMD;
+		for (; len > 0; len--, buffer++) {
+			if (len == 1) {
+				i2c_cmd |= AST_I2CD_M_S_RX_CMD_LAST;
+			}
+			writel(i2c_cmd, &i2c_base->csr);
+			RETURN_IF_ERROR(__ast_i2c_wait_isr
+					(i2c_base, AST_I2CD_INTR_RX_DONE));
+			*buffer = AST_I2CD_RX_DATA_BUF_GET(readl(&i2c_base->trbbr));
+		}
+		__ast_i2c_clear_interrupts(i2c_base);
+	}
+	RETURN_IF_ERROR(__ast_i2c_send_stop(i2c_base));
+
+	return i2c_error;
+}
+
+static int __ast_i2c_write_data(struct ast_i2c *i2c_bus, u8 chip, u8 *buffer,
+				int len)
+{
+	int i2c_error = 0;
+	struct ast_i2c_regs *i2c_base = i2c_bus->regs;
+
+	i2c_error = __ast_i2c_start_txn(i2c_base, (chip << 1));
+	for (; len > 0 && 0 == i2c_error; len--, buffer++) {
+		writel(*buffer, &i2c_base->trbbr);
+		writel(AST_I2CD_M_TX_CMD, &i2c_base->csr);
+		i2c_error = __ast_i2c_wait_tx(i2c_base);
+	}
+	RETURN_IF_ERROR(__ast_i2c_send_stop(i2c_base));
+	return i2c_error;
+}
+
+static int ast_i2c_deblock(struct udevice *dev)
+{
+	struct ast_i2c *i2c_bus = dev_get_priv(dev);
+	struct ast_i2c_regs *i2c_base = i2c_bus->regs;
+
+	u32 csr = readl(&i2c_base->csr);
+	debug("Bus hung (%x), attempting recovery\n", csr);
+
+	bool sda_high = csr & AST_I2CD_SDA_LINE_STS;
+	bool scl_high = csr & AST_I2CD_SCL_LINE_STS;
+	if (sda_high && scl_high) {
+		/* Bus is idle, no deblocking needed. */
+		return 0;
+	} else if (sda_high) {
+		/* Send stop command */
+		RETURN_IF_ERROR(__ast_i2c_send_stop(i2c_base));
+	} else if (scl_high) {
+		/* Possibly stuck slave */
+		writel(AST_I2CD_BUS_RECOVER_CMD, &i2c_base->csr);
+		RETURN_IF_ERROR(__ast_i2c_wait_isr
+				(i2c_base, AST_I2CD_INTR_BUS_RECOVER_DONE));
+	} else {
+		/* Just try to reinit the device. */
+		RETURN_IF_ERROR(__ast_i2c_init_bus(i2c_bus));
+	}
+
+	return 0;
+}
+
+static int ast_i2c_xfer(struct udevice *dev, struct i2c_msg *msg, int nmsgs)
+{
+	struct ast_i2c *i2c_bus = dev_get_priv(dev);
+	int ret;
+
+	debug("i2c_xfer: %d messages\n", nmsgs);
+	for (; nmsgs > 0; nmsgs--, msg++) {
+		/* TODO: use this for repeated start */
+		bool next_is_read = nmsgs > 1 && (msg[1].flags & I2C_M_RD);
+
+		if (msg->flags & I2C_M_RD) {
+			debug("i2c_read: chip=0x%x, len=0x%x, flags=0x%x\n",
+			      msg->addr, msg->len, msg->flags);
+			ret =
+			    __ast_i2c_read_data(i2c_bus, msg->addr, msg->buf,
+						msg->len);
+		} else {
+			debug("i2c_write: chip=0x%x, len=0x%x, flags=0x%x\n",
+			      msg->addr, msg->len, msg->flags);
+			ret =
+			    __ast_i2c_write_data(i2c_bus, msg->addr, msg->buf,
+						 msg->len);
+		}
+		if (ret) {
+			debug("%s: error (%d)\n", __func__, ret);
+			return -EREMOTEIO;
+		}
+	}
+
+	return 0;
+}
+
+static int ast_i2c_set_speed(struct udevice *dev, unsigned int speed)
+{
+	debug("Setting speed ofr I2C%d to <%u>\n", dev->seq, speed);
+	if (!speed) {
+		debug("No valid speed specified.\n");
+		return -EINVAL;
+	}
+	struct ast_i2c *i2c_bus = dev_get_priv(dev);
+
+	i2c_bus->speed = speed;
+	/* TODO: get this from device tree */
+	u32 pclk = ast_get_apbclk();
+	u32 divider = pclk / speed;
+
+	struct ast_i2c_regs *i2c_base = i2c_bus->regs;
+	if (speed > 400000) {
+		debug("Enabling High Speed\n");
+		setbits_le32(&i2c_base->fcr, AST_I2CD_M_HIGH_SPEED_EN
+			     | AST_I2CD_M_SDA_DRIVE_1T_EN
+			     | AST_I2CD_SDA_DRIVE_1T_EN);
+		writel(0x3, &i2c_base->cactcr2);
+		writel(__get_clk_reg_val(divider), &i2c_base->cactcr1);
+	} else {
+		debug("Enabling Normal Speed\n");
+		writel(__get_clk_reg_val(divider), &i2c_base->cactcr1);
+		writel(AST_NO_TIMEOUT_CTRL, &i2c_base->cactcr2);
+	}
+
+	__ast_i2c_clear_interrupts(i2c_base);
+	return 0;
+}
+
+static const struct dm_i2c_ops ast_i2c_ops = {
+	.xfer = ast_i2c_xfer,
+	.set_bus_speed = ast_i2c_set_speed,
+	.deblock = ast_i2c_deblock,
+};
+
+static const struct udevice_id ast_i2c_ids[] = {
+	{.compatible = "aspeed,ast2500-i2c-controller",},
+	{.compatible = "aspeed,ast2500-i2c-bus",},
+	{},
+};
+
+/* Tell GNU Indent to keep this as is: */
+/* *INDENT-OFF* */
+U_BOOT_DRIVER(i2c_aspeed) = {
+	.name = "i2c_aspeed",
+	.id = UCLASS_I2C,
+	.of_match = ast_i2c_ids,
+	.probe = ast_i2c_probe,
+	.priv_auto_alloc_size = sizeof(struct ast_i2c),
+	.ops = &ast_i2c_ops,
+};
+/* *INDENT-ON* */
diff --git a/drivers/i2c/ast_i2c.h b/drivers/i2c/ast_i2c.h
new file mode 100644
index 0000000..e221b41
--- /dev/null
+++ b/drivers/i2c/ast_i2c.h
@@ -0,0 +1,155 @@
+/*
+ * Copyright (C) 2016 Google, Inc
+ *
+ * SPDX-License-Identifier:	GPL-2.0+
+ */
+#ifndef __AST_I2C_H_
+#define __AST_I2C_H_
+
+struct ast_i2c_regs {
+	uint32_t fcr;
+	uint32_t cactcr1;
+	uint32_t cactcr2;
+	uint32_t icr;
+	uint32_t isr;
+	uint32_t csr;
+	uint32_t sdar;
+	uint32_t pbcr;
+	uint32_t trbbr;
+#ifdef CONFIG_TARGET_AST_G5
+	uint32_t dma_mbar;
+	uint32_t dma_tlr;
+#endif
+};
+
+/* Device Register Definition */
+/* 0x00 : I2CD Function Control Register  */
+#define AST_I2CD_BUFF_SEL_MASK				(0x7 << 20)
+#define AST_I2CD_BUFF_SEL(x) 				(x << 20)	// page 0 ~ 7
+#define AST_I2CD_M_SDA_LOCK_EN			(0x1 << 16)
+#define AST_I2CD_MULTI_MASTER_DIS			(0x1 << 15)
+#define AST_I2CD_M_SCL_DRIVE_EN		(0x1 << 14)
+#define AST_I2CD_MSB_STS					(0x1 << 9)
+#define AST_I2CD_SDA_DRIVE_1T_EN			(0x1 << 8)
+#define AST_I2CD_M_SDA_DRIVE_1T_EN		(0x1 << 7)
+#define AST_I2CD_M_HIGH_SPEED_EN		(0x1 << 6)
+#define AST_I2CD_DEF_ADDR_EN				(0x1 << 5)
+#define AST_I2CD_DEF_ALERT_EN				(0x1 << 4)
+#define AST_I2CD_DEF_ARP_EN					(0x1 << 3)
+#define AST_I2CD_DEF_GCALL_EN				(0x1 << 2)
+#define AST_I2CD_SLAVE_EN					(0x1 << 1)
+#define AST_I2CD_MASTER_EN					(0x1 )
+
+/* 0x04 : I2CD Clock and AC Timing Control Register #1 */
+#define AST_I2CD_tBUF						(0x1 << 28)	// 0~7
+#define AST_I2CD_tHDSTA						(0x1 << 24)	// 0~7
+#define AST_I2CD_tACST						(0x1 << 20)	// 0~7
+#define AST_I2CD_tCKHIGH					(0x1 << 16)	// 0~7
+#define AST_I2CD_tCKLOW						(0x1 << 12)	// 0~7
+#define AST_I2CD_tHDDAT						(0x1 << 10)	// 0~7
+#define AST_I2CD_CLK_TO_BASE_DIV			(0x1 << 8)	// 0~3
+#define AST_I2CD_CLK_BASE_DIV				(0x1 )	// 0~0xf
+
+/* 0x08 : I2CD Clock and AC Timing Control Register #2 */
+#define AST_I2CD_tTIMEOUT					(0x1 )	// 0~7
+#define AST_NO_TIMEOUT_CTRL					0x0
+
+/* 0x0c : I2CD Interrupt Control Register &
+ * 0x10 : I2CD Interrupt Status Register
+ *
+ * These share bit definitions, so use the same values for the enable &
+ * status bits.
+ */
+#define AST_I2CD_INTR_SDA_DL_TIMEOUT			(0x1 << 14)
+#define AST_I2CD_INTR_BUS_RECOVER_DONE			(0x1 << 13)
+#define AST_I2CD_INTR_SMBUS_ALERT			(0x1 << 12)
+#define AST_I2CD_INTR_SMBUS_ARP_ADDR			(0x1 << 11)
+#define AST_I2CD_INTR_SMBUS_DEV_ALERT_ADDR		(0x1 << 10)
+#define AST_I2CD_INTR_SMBUS_DEF_ADDR			(0x1 << 9)
+#define AST_I2CD_INTR_GCALL_ADDR			(0x1 << 8)
+#define AST_I2CD_INTR_SLAVE_MATCH			(0x1 << 7)
+#define AST_I2CD_INTR_SCL_TIMEOUT			(0x1 << 6)
+#define AST_I2CD_INTR_ABNORMAL				(0x1 << 5)
+#define AST_I2CD_INTR_NORMAL_STOP			(0x1 << 4)
+#define AST_I2CD_INTR_ARBIT_LOSS			(0x1 << 3)
+#define AST_I2CD_INTR_RX_DONE				(0x1 << 2)
+#define AST_I2CD_INTR_TX_NAK				(0x1 << 1)
+#define AST_I2CD_INTR_TX_ACK				(0x1 << 0)
+
+/* 0x14 : I2CD Command/Status Register   */
+#define AST_I2CD_SDA_OE					(0x1 << 28)
+#define AST_I2CD_SDA_O					(0x1 << 27)
+#define AST_I2CD_SCL_OE					(0x1 << 26)
+#define AST_I2CD_SCL_O					(0x1 << 25)
+#define AST_I2CD_TX_TIMING				(0x1 << 24)	// 0 ~3
+#define AST_I2CD_TX_STATUS				(0x1 << 23)
+
+// Tx State Machine
+#define AST_I2CD_IDLE	 				0x0
+#define AST_I2CD_MACTIVE				0x8
+#define AST_I2CD_MSTART					0x9
+#define AST_I2CD_MSTARTR				0xa
+#define AST_I2CD_MSTOP					0xb
+#define AST_I2CD_MTXD					0xc
+#define AST_I2CD_MRXACK					0xd
+#define AST_I2CD_MRXD 					0xe
+#define AST_I2CD_MTXACK 				0xf
+#define AST_I2CD_SWAIT					0x1
+#define AST_I2CD_SRXD 					0x4
+#define AST_I2CD_STXACK 				0x5
+#define AST_I2CD_STXD					0x6
+#define AST_I2CD_SRXACK 				0x7
+#define AST_I2CD_RECOVER 				0x3
+
+#define AST_I2CD_SCL_LINE_STS				(0x1 << 18)
+#define AST_I2CD_SDA_LINE_STS				(0x1 << 17)
+#define AST_I2CD_BUS_BUSY_STS				(0x1 << 16)
+#define AST_I2CD_SDA_OE_OUT_DIR				(0x1 << 15)
+#define AST_I2CD_SDA_O_OUT_DIR				(0x1 << 14)
+#define AST_I2CD_SCL_OE_OUT_DIR				(0x1 << 13)
+#define AST_I2CD_SCL_O_OUT_DIR				(0x1 << 12)
+#define AST_I2CD_BUS_RECOVER_CMD			(0x1 << 11)
+#define AST_I2CD_S_ALT_EN				(0x1 << 10)
+// 0 : DMA Buffer, 1: Pool Buffer
+//AST1070 DMA register
+#define AST_I2CD_RX_DMA_ENABLE				(0x1 << 9)
+#define AST_I2CD_TX_DMA_ENABLE				(0x1 << 8)
+
+/* Command Bit */
+#define AST_I2CD_RX_BUFF_ENABLE				(0x1 << 7)
+#define AST_I2CD_TX_BUFF_ENABLE				(0x1 << 6)
+#define AST_I2CD_M_STOP_CMD					(0x1 << 5)
+#define AST_I2CD_M_S_RX_CMD_LAST			(0x1 << 4)
+#define AST_I2CD_M_RX_CMD					(0x1 << 3)
+#define AST_I2CD_S_TX_CMD					(0x1 << 2)
+#define AST_I2CD_M_TX_CMD					(0x1 << 1)
+#define AST_I2CD_M_START_CMD				(0x1 )
+
+/* 0x18 : I2CD Slave Device Address Register   */
+
+/* 0x1C : I2CD Pool Buffer Control Register   */
+#define AST_I2CD_RX_BUF_ADDR_GET(x)				(((x) >> 24) & 0xff)
+#define AST_I2CD_RX_BUF_END_ADDR_SET(x)			((x) << 16)
+#define AST_I2CD_TX_DATA_BUF_END_SET(x)			(((x) & 0xff) << 8)
+#define AST_I2CD_RX_DATA_BUF_GET(x)			(((x) >> 8) & 0xff)
+#define AST_I2CD_BUF_BASE_ADDR_SET(x)			((x) & 0x3f)
+
+/* 0x20 : I2CD Transmit/Receive Byte Buffer Register   */
+#define AST_I2CD_GET_MODE(x)					(((x) >> 8) & 0x1)
+
+#define AST_I2CD_RX_BYTE_BUFFER					(0xff << 8)
+#define AST_I2CD_TX_BYTE_BUFFER					(0xff )
+
+//1. usage flag , 2 size,       3. request address
+/* Use platform_data instead of module parameters */
+/* Fast Mode = 400 kHz, Standard = 100 kHz */
+//static int clock = 100; /* Default: 100 kHz */
+
+#define AST_I2CD_CMDS	(AST_I2CD_BUS_RECOVER_CMD_EN | \
+			 AST_I2CD_M_STOP_CMD | \
+			 AST_I2CD_M_S_RX_CMD_LAST | \
+			 AST_I2CD_M_RX_CMD | \
+			 AST_I2CD_M_TX_CMD | \
+			 AST_I2CD_M_START_CMD)
+
+#endif				/* _ASPEED_REGS_I2C_H_ */
-- 
2.8.0.rc3.226.g39d4020
