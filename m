Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id D12481A03C3
 for <openbmc@lists.ozlabs.org>; Tue,  3 Nov 2015 00:12:10 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446469926006109.66584341071314;
 Mon, 2 Nov 2015 05:12:06 -0800 (PST)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH openbmc 2/4] Use out of (kernel) tree device tree (Palmetto)
Date: Mon,  2 Nov 2015 07:11:59 -0600
Message-Id: <1446469921-23240-3-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1446469921-23240-1-git-send-email-patches@stwcx.xyz>
References: <1446469921-23240-1-git-send-email-patches@stwcx.xyz>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 02 Nov 2015 13:12:11 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

---
 .../meta-ibm/meta-palmetto/conf/layer.conf         |   4 +
 .../meta-palmetto/conf/machine/palmetto.conf       |   2 +-
 .../recipes-kernel/linux/linux-obmc/palmetto.dts   | 325 +++++++++++++++++++++
 .../recipes-kernel/linux/linux-obmc_%.bbappend     |   2 +
 .../meta-ibm/meta-palmetto/recipes.txt             |   1 +
 5 files changed, 333 insertions(+), 1 deletion(-)
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc/palmetto.dts
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc_%.bbappend
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes.txt

diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/conf/layer.conf b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/conf/layer.conf
index ac8a2a2..71cad6d 100644
--- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/conf/layer.conf
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/conf/layer.conf
@@ -1,5 +1,9 @@
 # We have a conf and classes directory, add to BBPATH
 BBPATH .= ":${LAYERDIR}"
 
+# We have recipes-* directories, add to BBFILES
+BBFILES += "${LAYERDIR}/recipes-*/*/*.bb \
+            ${LAYERDIR}/recipes-*/*/*.bbappend"
+
 BBFILE_COLLECTIONS += "palmetto"
 BBFILE_PATTERN_palmetto = ""
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/conf/machine/palmetto.conf b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/conf/machine/palmetto.conf
index f6256a7..d57bdcb 100644
--- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/conf/machine/palmetto.conf
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/conf/machine/palmetto.conf
@@ -1,5 +1,5 @@
 KMACHINE = "aspeed"
-KERNEL_DEVICETREE = "${KMACHINE}-bmc-opp-${MACHINE}.dtb"
+KERNEL_DEVICETREE = "${MACHINE}.dtb"
 
 require conf/machine/include/ast2400.inc
 require conf/machine/include/obmc-bsp-common.inc
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc/palmetto.dts b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc/palmetto.dts
new file mode 100644
index 0000000..d55096b
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc/palmetto.dts
@@ -0,0 +1,325 @@
+/dts-v1/;
+
+#include "skeleton.dtsi"
+
+/ {
+	model = "Palmetto BMC";
+	compatible = "tyan,palmetto-bmc", "aspeed,ast2400";
+	#address-cells = <1>;
+	#size-cells = <1>;
+	interrupt-parent = <&vic>;
+
+	aliases {
+		serial0 = &uart5;
+	};
+
+	chosen {
+		stdout-path = &uart5;
+		bootargs = "console=ttyS4,38400";
+	};
+
+	memory {
+		reg = < 0x40000000 0x10000000 >;
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			compatible = "arm,arm926ej-s";
+			device_type = "cpu";
+			reg = <0>;
+		};
+	};
+
+	// FIXME
+	clocks {
+		// Do a proper driver... for now, we know the straps
+		// and uboot config on palmetto are:
+		// - CLKIN is 48Mhz
+		// - HPLL is 384Mhz
+		// - CPU:AHB is strapped 2:1
+		// - PCLK is HPLL/8 = 48Mhz
+		clk_apb: clk_apb {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <48000000>;
+		};
+		clk_hpll: clk_hpll {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <384000000>;
+		};
+	};
+
+	ahb {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		vic: interrupt-controller@1e6c0080 {
+			compatible = "aspeed,new-vic";
+	     		interrupt-controller;
+			#interrupt-cells = <1>;
+			valid-sources = < 0xffffffff 0x0007ffff>;
+			reg = <0x1e6c0080 0x80>;
+		};
+
+		mac0: ethernet@1e660000 {
+			compatible = "faraday,ftgmac100", "aspeed,ast2400-mac";
+			reg = <0x1e660000 0x180>;
+			interrupts = <2>;
+			use-nc-si;
+			no-hw-checksum;
+		};
+
+		apb {
+			compatible = "simple-bus";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			sram@1e72000 {
+				compatible = "mmio-sram";
+				reg = <0x1e72000 0x8000>;	// 32K
+			};
+
+			ibt@1e789140 {
+				compatible = "aspeed,bt-host";
+				reg = <0x1e789140 0x18>;
+			};
+
+			i2c: i2c@1e78a040 {
+				compatible = "aspeed,ast2400-i2c-common";
+				reg = <0x1e78a000 0x40>;
+				ranges = <0 0x1e78a000 0x1000>;
+				interrupts = <12>;
+				clocks = <&clk_apb>;
+
+				i2c0: i2c-bus@0x40 {
+					reg = <0x40 0x40>;
+					compatible = "aspeed,ast2400-i2c-bus";
+					bus = <0>;
+					clock-frequency = <100000>;
+					status = "okay";
+					eeprom@50 {
+						compatible = "atmel,24c256";
+						reg = <0x50>;
+						pagesize = <64>;
+					};
+					rtc@68 {
+						compatible = "dallas,ds3231";
+						reg = <0x68>;
+						// interrupts = <GPIOF0>
+					};
+				};
+
+				i2c1: i2c-bus@0x80 {
+					reg = <0x80 0x40>;
+					compatible = "aspeed,ast2400-i2c-bus";
+					bus = <1>;
+					clock-frequency = <100000>;
+					status = "okay";
+				};
+
+				i2c2: i2c-bus@0xC0 {
+					reg = <0xC0 0x40>;
+					compatible = "aspeed,ast2400-i2c-bus";
+					bus = <2>;
+					clock-frequency = <100000>;
+					status = "okay";
+					tmp423@4c {
+						compatible = "ti,tmp423";
+						reg = <0x4c>;
+					};
+				};
+
+				i2c3: i2c-bus@0x100 {
+					reg = <0x100 0x40>;
+					compatible = "aspeed,ast2400-i2c-bus";
+					bus = <3>;
+					clock-frequency = <100000>;
+					status = "okay";
+				};
+
+				i2c4: i2c-bus@0x140 {
+					reg = <0x140 0x40>;
+					compatible = "aspeed,ast2400-i2c-bus";
+					bus = <4>;
+					clock-frequency = <100000>;
+					status = "okay";
+				};
+
+				i2c5: i2c-bus@0x180 {
+					reg = <0x180 0x40>;
+					compatible = "aspeed,ast2400-i2c-bus";
+					bus = <5>;
+					clock-frequency = <100000>;
+					status = "okay";
+				};
+
+				i2c6: i2c-bus@0x1C0 {
+					reg = <0x1C0 0x40>;
+					compatible = "aspeed,ast2400-i2c-bus";
+					bus = <6>;
+					clock-frequency = <100000>;
+					status = "okay";
+				};
+
+				i2c7: i2c-bus@0x300 {
+					reg = <0x300 0x40>;
+					compatible = "aspeed,ast2400-i2c-bus";
+					bus = <7>;
+					clock-frequency = <100000>;
+					status = "okay";
+				};
+
+				i2c8: i2c-bus@0x340 {
+					reg = <0x340 0x40>;
+					compatible = "aspeed,ast2400-i2c-bus";
+					bus = <8>;
+					clock-frequency = <100000>;
+					status = "okay";
+				};
+
+				i2c9: i2c-bus@0x380 {
+					reg = <0x380 0x40>;
+					compatible = "aspeed,ast2400-i2c-bus";
+					bus = <9>;
+					clock-frequency = <100000>;
+					status = "disabled";
+				};
+
+				i2c10: i2c-bus@0x3C0 {
+					reg = <0x380 0x40>;
+					compatible = "aspeed,ast2400-i2c-bus";
+					bus = <10>;
+					clock-frequency = <100000>;
+					status = "disabled";
+				};
+
+				i2c11: i2c-bus@0x400 {
+					reg = <0x400 0x40>;
+					compatible = "aspeed,ast2400-i2c-bus";
+					bus = <11>;
+					clock-frequency = <100000>;
+					status = "disabled";
+				};
+
+				i2c12: i2c-bus@0x440 {
+					reg = <0x400 0x40>;
+					compatible = "aspeed,ast2400-i2c-bus";
+					bus = <12>;
+					clock-frequency = <100000>;
+					status = "disabled";
+				};
+
+				i2c13: i2c-bus@0x480 {
+					reg = <0x480 0x40>;
+					compatible = "aspeed,ast2400-i2c-bus";
+					bus = <13>;
+					clock-frequency = <100000>;
+					status = "disabled";
+				};
+
+			};
+
+			syscon: syscon@1e6e2000 {
+				compatible = "aspeed,syscon", "syscon";
+				reg = <0x1e6e2000 0x1a8>;
+				interrupts = <19>;
+				clocks = <&clk_apb>;
+				status = "okay";
+			};
+
+			wdt: wdt@1e785000 {
+				compatible = "aspeed,wdt", "wdt";
+				reg = <0x1e785000 0x1c4>;
+				interrupts = <27>;
+				clocks = <&clk_apb>;
+			};
+
+			rtc: rtc@1e781000 {
+				compatible = "aspeed,rtc";
+				reg = <0x1e781000 0x18>;
+			};
+
+			timer: timer@98400000 {
+				compatible = "aspeed,timer";
+				reg = <0x1e782000 0x90>;
+				// The moxart_timer driver registers only one interrupt
+				// and assumes it's for timer 1
+				//interrupts = <16 17 18 35 36 37 38 39>;
+				interrupts = <16>;
+				clocks = <&clk_apb>;
+			};
+
+			gpio: gpio@1e780000 {
+			       compatible = "aspeed,ast2400-gpio";
+			       reg = <0x1e780000 0x1000>;
+			       interrupts = <20>;
+			};
+
+			uart1: serial@1e783000 {
+			       compatible = "ns16550a";
+			       reg = <0x1e783000 0x1000>;
+			       reg-shift = <2>;
+			       interrupts = <9>;
+			       clock-frequency = < 1843200 >;
+			       no-loopback-test;
+			};
+			uart2: serial@1e78d000 {
+			       compatible = "ns16550a";
+			       reg = <0x1e78d000 0x1000>;
+			       reg-shift = <2>;
+			       interrupts = <32>;
+			       clock-frequency = < 1843200 >;
+			       no-loopback-test;
+			};
+			/* APSS UART */
+			uart3: serial@1e78e000 {
+			       compatible = "ns16550a";
+			       reg = <0x1e78e000 0x1000>;
+			       reg-shift = <2>;
+			       interrupts = <33>;
+			       clock-frequency = < 1843200 >;
+			       no-loopback-test;
+			};
+
+			/* Host UART */
+			uart4: serial@1e78f000 {
+			       compatible = "ns16550a";
+			       reg = <0x1e78f000 0x1000>;
+			       reg-shift = <2>;
+			       interrupts = <34>;
+			       clock-frequency = < 1843200 >;
+			       current-speed = < 115200 >;
+			       no-loopback-test;
+			};
+#if 1
+			/* BMC UART */
+			uart5: serial@1e784000 {
+			       compatible = "ns16550a";
+			       reg = <0x1e784000 0x1000>;
+			       reg-shift = <2>;
+			       interrupts = <10>;
+			       clock-frequency = < 1843200 >;
+			       current-speed = < 38400 >;
+			       no-loopback-test;
+			};
+#endif
+
+			uart6: serial@1e787000 {
+			       compatible = "ns16550a";
+			       reg = <0x1e787000 0x1000>;
+			       reg-shift = <2>;
+			       interrupts = <10>;
+			       clock-frequency = < 1843200 >;
+			       current-speed = < 38400 >;
+			       no-loopback-test;
+			};
+		};
+	};
+};
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc_%.bbappend b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc_%.bbappend
new file mode 100644
index 0000000..2c8056c
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc_%.bbappend
@@ -0,0 +1,2 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/linux-obmc:"
+SRC_URI += "file://palmetto.dts"
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes.txt b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes.txt
new file mode 100644
index 0000000..db84c6f
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes.txt
@@ -0,0 +1 @@
+recipes-kernel       - The kernel and generic applications/libraries with strong kernel dependencies
-- 
2.6.0
