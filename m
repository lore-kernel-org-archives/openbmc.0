Return-Path: <joel.stan@gmail.com>
Received: from mail-pf0-x241.google.com (mail-pf0-x241.google.com
 [IPv6:2607:f8b0:400e:c00::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wDKSk69NxzDq72
 for <openbmc@lists.ozlabs.org>; Fri, 28 Apr 2017 00:43:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="TtedJNR/"; 
 dkim-atps=neutral
Received: by mail-pf0-x241.google.com with SMTP id v14so10873473pfd.3
 for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2017 07:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=J53rq/8SzeJM4qgMQRTSi4mjV0fiJMSy7V78zIpU1tU=;
 b=TtedJNR/PvWfZzxwvPvx4Yxygh+tUBZvGhmcKZG7skNdXMCHuimpmXrxX1QrnaIplA
 M8+ctUt6eF3d9pFElvosya4XrefWXN4sba8h1Yy5b4TohCjRvBbjI9FVCfoFiWvkeIZM
 8qicv8ltfawC6Ux9US7D2H4tHIhvz62njHzSFlTxE7YKMkA/+H7jEunuuNNWC66lpAgW
 ezFli/MZwywmfwo6V9+bTK9ELb6bKeTiEWOVAU+YbGXXTX0MpRiOAFuFcU69bAHY6Hga
 hh0cxiMaWEzF4PyJeZoUyoqBf8J/iZ9yjMb1ArlVkBULK/yiAT0Rw8g1AS/tGVvvHAJb
 XAvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=J53rq/8SzeJM4qgMQRTSi4mjV0fiJMSy7V78zIpU1tU=;
 b=SSNOWT7jPbBSH0FolwR6plv8HemmrPXG/YLwyHhDMOnRSzdOBTXuvgLnLpq2nTI/BH
 i9xZyLNMKvt357fUKD/7xlrcMEyOf4F4UbNvDWX8X06gEo48EWQXmcRbp6XDYVcECQne
 Y3AwtIOycfotnIsoy2hpoQ6egRlBDQK760yObexq7y1QFDn21W4G7FWnMxiVKtjh/eY+
 5dQ9YKNqFjyTR48MVZCep0OK3UkkzbT6uJzep/A8zhsS+p3EFjayudRfi41drR/CHrSL
 Iu6FDeD21omTV/G9Kmlgtslchi2vSSqsT1TdPldA2vzJeaP2Q72AmlXAtOZfSltPd07/
 DHxA==
X-Gm-Message-State: AN3rC/4k1q9SOY/rKbglT3PxY3M/vs2CLJMsinvd2jCNqALSknaZZbYj
 VcbAr7CUFrU1Jw==
X-Received: by 10.98.204.93 with SMTP id a90mr6371446pfg.6.1493304212564;
 Thu, 27 Apr 2017 07:43:32 -0700 (PDT)
Received: from aurora.jms.id.au ([103.232.208.197])
 by smtp.gmail.com with ESMTPSA id y5sm6844788pge.19.2017.04.27.07.43.28
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Thu, 27 Apr 2017 07:43:31 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Fri, 28 Apr 2017 00:13:24 +0930
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Cc: Andrew Jeffery <andrew@aj.id.au>,
 Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH linux dev-4.10 v2] ARM: dts: aspeed: Update i2c binding
Date: Fri, 28 Apr 2017 00:13:19 +0930
Message-Id: <20170427144319.23130-1-joel@jms.id.au>
X-Mailer: git-send-email 2.11.0
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
X-List-Received-Date: Thu, 27 Apr 2017 14:43:35 -0000

The I2C binding changed when upstreaming the I2C driver.

This adds aliases for the 14 built-in I2C busses to ensure userspace
sees the numbering that we had with the old driver.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---

Boot tested on qemu-palmetto. We see the same i2c entries under /dev as before,
so the aliases work. Note that we can't use qemu for testing with the new
driver, tracked at https://github.com/openbmc/qemu/issues/5

 arch/arm/boot/dts/aspeed-g4.dtsi | 173 ++++++++++++++++++++++------------
 arch/arm/boot/dts/aspeed-g5.dtsi | 197 +++++++++++++++++++++++++--------------
 2 files changed, 241 insertions(+), 129 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index b9a6730cc831..f7767b999791 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -18,6 +18,23 @@
 		};
 	};
 
+	aliases {
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		i2c3 = &i2c3;
+		i2c4 = &i2c4;
+		i2c5 = &i2c5;
+		i2c6 = &i2c6;
+		i2c7 = &i2c7;
+		i2c8 = &i2c8;
+		i2c9 = &i2c9;
+		i2c10 = &i2c10;
+		i2c11 = &i2c11;
+		i2c12 = &i2c12;
+		i2c13 = &i2c13;
+	};
+
 	clocks {
 	};
 
@@ -958,200 +975,240 @@
 			};
 
 			i2c: i2c@1e78a000 {
+				compatible = "simple-bus";
 				#address-cells = <1>;
 				#size-cells = <1>;
-				#interrupt-cells = <1>;
-
-				compatible = "aspeed,ast2400-i2c-controller";
-				reg = <0x1e78a000 0x40>;
 				ranges = <0 0x1e78a000 0x1000>;
-				interrupts = <12>;
-				clocks = <&clk_apb>;
-				clock-ranges;
-				interrupt-controller;
+
+				i2c_ic: interrupt-controller@0 {
+					#interrupt-cells = <1>;
+					compatible = "aspeed,ast2400-i2c-ic";
+					reg = <0x0 0x40>;
+					interrupts = <12>;
+					interrupt-controller;
+				};
 
 				i2c0: i2c-bus@40 {
 					#address-cells = <1>;
 					#size-cells = <0>;
+					#interrupt-cells = <1>;
+
 					reg = <0x40 0x40>;
 					compatible = "aspeed,ast2400-i2c-bus";
-					bus = <0>;
-					clock-frequency = <100000>;
-					status = "disabled";
+					clocks = <&clk_apb>;
+					bus-frequency = <100000>;
 					interrupts = <0>;
-					interrupt-parent = <&i2c>;
+					interrupt-parent = <&i2c_ic>;
+					status = "disabled";
 					/* Does not need pinctrl node */
 				};
 
 				i2c1: i2c-bus@80 {
 					#address-cells = <1>;
 					#size-cells = <0>;
+					#interrupt-cells = <1>;
+
 					reg = <0x80 0x40>;
 					compatible = "aspeed,ast2400-i2c-bus";
-					bus = <1>;
-					clock-frequency = <100000>;
-					status = "disabled";
+					clocks = <&clk_apb>;
+					bus-frequency = <100000>;
 					interrupts = <1>;
+					interrupt-parent = <&i2c_ic>;
+					status = "disabled";
 					/* Does not need pinctrl node */
 				};
 
 				i2c2: i2c-bus@c0 {
 					#address-cells = <1>;
 					#size-cells = <0>;
-					reg = <0xC0 0x40>;
+					#interrupt-cells = <1>;
+
+					reg = <0xc0 0x40>;
 					compatible = "aspeed,ast2400-i2c-bus";
-					bus = <2>;
-					clock-frequency = <100000>;
-					status = "disabled";
+					clocks = <&clk_apb>;
+					bus-frequency = <100000>;
 					interrupts = <2>;
-					pinctrl-names = "default";
-					pinctrl-0 = <&pinctrl_i2c3_default>;
+					interrupt-parent = <&i2c_ic>;
+					status = "disabled";
+					/* Does not need pinctrl node */
 				};
 
 				i2c3: i2c-bus@100 {
 					#address-cells = <1>;
 					#size-cells = <0>;
+					#interrupt-cells = <1>;
+
 					reg = <0x100 0x40>;
 					compatible = "aspeed,ast2400-i2c-bus";
-					bus = <3>;
-					clock-frequency = <100000>;
-					status = "disabled";
+					clocks = <&clk_apb>;
+					bus-frequency = <100000>;
 					interrupts = <3>;
+					interrupt-parent = <&i2c_ic>;
 					pinctrl-names = "default";
 					pinctrl-0 = <&pinctrl_i2c4_default>;
+					status = "disabled";
 				};
 
 				i2c4: i2c-bus@140 {
 					#address-cells = <1>;
 					#size-cells = <0>;
+					#interrupt-cells = <1>;
+
 					reg = <0x140 0x40>;
 					compatible = "aspeed,ast2400-i2c-bus";
-					bus = <4>;
-					clock-frequency = <100000>;
-					status = "disabled";
+					clocks = <&clk_apb>;
+					bus-frequency = <100000>;
 					interrupts = <4>;
+					interrupt-parent = <&i2c_ic>;
 					pinctrl-names = "default";
 					pinctrl-0 = <&pinctrl_i2c5_default>;
+					status = "disabled";
 				};
 
 				i2c5: i2c-bus@180 {
 					#address-cells = <1>;
 					#size-cells = <0>;
+					#interrupt-cells = <1>;
+
 					reg = <0x180 0x40>;
 					compatible = "aspeed,ast2400-i2c-bus";
-					bus = <5>;
-					clock-frequency = <100000>;
-					status = "disabled";
+					clocks = <&clk_apb>;
+					bus-frequency = <100000>;
 					interrupts = <5>;
+					interrupt-parent = <&i2c_ic>;
 					pinctrl-names = "default";
 					pinctrl-0 = <&pinctrl_i2c6_default>;
+					status = "disabled";
 				};
 
 				i2c6: i2c-bus@1c0 {
 					#address-cells = <1>;
 					#size-cells = <0>;
-					reg = <0x1C0 0x40>;
+					#interrupt-cells = <1>;
+
+					reg = <0x1c0 0x40>;
 					compatible = "aspeed,ast2400-i2c-bus";
-					bus = <6>;
-					clock-frequency = <100000>;
-					status = "disabled";
+					clocks = <&clk_apb>;
+					bus-frequency = <100000>;
 					interrupts = <6>;
+					interrupt-parent = <&i2c_ic>;
 					pinctrl-names = "default";
 					pinctrl-0 = <&pinctrl_i2c7_default>;
+					status = "disabled";
 				};
 
 				i2c7: i2c-bus@300 {
 					#address-cells = <1>;
 					#size-cells = <0>;
+					#interrupt-cells = <1>;
+
 					reg = <0x300 0x40>;
 					compatible = "aspeed,ast2400-i2c-bus";
-					bus = <7>;
-					clock-frequency = <100000>;
-					status = "disabled";
+					clocks = <&clk_apb>;
+					bus-frequency = <100000>;
 					interrupts = <7>;
+					interrupt-parent = <&i2c_ic>;
 					pinctrl-names = "default";
 					pinctrl-0 = <&pinctrl_i2c8_default>;
+					status = "disabled";
 				};
 
 				i2c8: i2c-bus@340 {
 					#address-cells = <1>;
 					#size-cells = <0>;
+					#interrupt-cells = <1>;
+
 					reg = <0x340 0x40>;
 					compatible = "aspeed,ast2400-i2c-bus";
-					bus = <8>;
-					clock-frequency = <100000>;
-					status = "disabled";
+					clocks = <&clk_apb>;
+					bus-frequency = <100000>;
 					interrupts = <8>;
+					interrupt-parent = <&i2c_ic>;
 					pinctrl-names = "default";
 					pinctrl-0 = <&pinctrl_i2c9_default>;
+					status = "disabled";
 				};
 
 				i2c9: i2c-bus@380 {
 					#address-cells = <1>;
 					#size-cells = <0>;
+					#interrupt-cells = <1>;
+
 					reg = <0x380 0x40>;
 					compatible = "aspeed,ast2400-i2c-bus";
-					bus = <9>;
-					clock-frequency = <100000>;
-					status = "disabled";
+					clocks = <&clk_apb>;
+					bus-frequency = <100000>;
 					interrupts = <9>;
+					interrupt-parent = <&i2c_ic>;
 					pinctrl-names = "default";
 					pinctrl-0 = <&pinctrl_i2c10_default>;
+					status = "disabled";
 				};
 
 				i2c10: i2c-bus@3c0 {
 					#address-cells = <1>;
 					#size-cells = <0>;
+					#interrupt-cells = <1>;
+
 					reg = <0x3c0 0x40>;
 					compatible = "aspeed,ast2400-i2c-bus";
-					bus = <10>;
-					clock-frequency = <100000>;
-					status = "disabled";
+					clocks = <&clk_apb>;
+					bus-frequency = <100000>;
 					interrupts = <10>;
+					interrupt-parent = <&i2c_ic>;
 					pinctrl-names = "default";
 					pinctrl-0 = <&pinctrl_i2c11_default>;
+					status = "disabled";
 				};
 
 				i2c11: i2c-bus@400 {
 					#address-cells = <1>;
 					#size-cells = <0>;
+					#interrupt-cells = <1>;
+
 					reg = <0x400 0x40>;
 					compatible = "aspeed,ast2400-i2c-bus";
-					bus = <11>;
-					clock-frequency = <100000>;
-					status = "disabled";
+					clocks = <&clk_apb>;
+					bus-frequency = <100000>;
 					interrupts = <11>;
+					interrupt-parent = <&i2c_ic>;
 					pinctrl-names = "default";
 					pinctrl-0 = <&pinctrl_i2c12_default>;
+					status = "disabled";
 				};
 
 				i2c12: i2c-bus@440 {
 					#address-cells = <1>;
 					#size-cells = <0>;
+					#interrupt-cells = <1>;
+
 					reg = <0x440 0x40>;
 					compatible = "aspeed,ast2400-i2c-bus";
-					bus = <12>;
-					clock-frequency = <100000>;
-					status = "disabled";
+					clocks = <&clk_apb>;
+					bus-frequency = <100000>;
 					interrupts = <12>;
+					interrupt-parent = <&i2c_ic>;
 					pinctrl-names = "default";
 					pinctrl-0 = <&pinctrl_i2c13_default>;
+					status = "disabled";
 				};
 
 				i2c13: i2c-bus@480 {
 					#address-cells = <1>;
 					#size-cells = <0>;
+					#interrupt-cells = <1>;
+
 					reg = <0x480 0x40>;
 					compatible = "aspeed,ast2400-i2c-bus";
-					bus = <13>;
-					clock-frequency = <100000>;
-					status = "disabled";
+					clocks = <&clk_apb>;
+					bus-frequency = <100000>;
 					interrupts = <13>;
-					/* Does not need pinctrl node */
+					interrupt-parent = <&i2c_ic>;
+					pinctrl-names = "default";
+					pinctrl-0 = <&pinctrl_i2c14_default>;
+					status = "disabled";
 				};
-
 			};
-
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index ddfb729bb85a..6aef4b7fa529 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -18,6 +18,23 @@
 		};
 	};
 
+	aliases {
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		i2c3 = &i2c3;
+		i2c4 = &i2c4;
+		i2c5 = &i2c5;
+		i2c6 = &i2c6;
+		i2c7 = &i2c7;
+		i2c8 = &i2c8;
+		i2c9 = &i2c9;
+		i2c10 = &i2c10;
+		i2c11 = &i2c11;
+		i2c12 = &i2c12;
+		i2c13 = &i2c13;
+	};
+
 	ahb {
 		compatible = "simple-bus";
 		#address-cells = <1>;
@@ -1149,199 +1166,237 @@
 			};
 
 			i2c: i2c@1e78a000 {
+				compatible = "simple-bus";
 				#address-cells = <1>;
 				#size-cells = <1>;
-				#interrupt-cells = <1>;
-
-				compatible = "aspeed,ast2400-i2c-controller";
-				reg = <0x1e78a000 0x40>;
 				ranges = <0 0x1e78a000 0x1000>;
-				interrupts = <12>;
-				clocks = <&clk_apb>;
-				clock-ranges;
-				interrupt-controller;
+
+				i2c_ic: interrupt-controller@0 {
+					#interrupt-cells = <1>;
+					compatible = "aspeed,ast2500-i2c-ic";
+					reg = <0x0 0x40>;
+					interrupts = <12>;
+					interrupt-controller;
+				};
 
 				i2c0: i2c-bus@40 {
 					#address-cells = <1>;
 					#size-cells = <0>;
+					#interrupt-cells = <1>;
+
 					reg = <0x40 0x40>;
-					compatible = "aspeed,ast2400-i2c-bus";
-					bus = <0>;
-					clock-frequency = <100000>;
-					status = "disabled";
+					compatible = "aspeed,ast2500-i2c-bus";
+					clocks = <&clk_apb>;
+					bus-frequency = <100000>;
 					interrupts = <0>;
-					interrupt-parent = <&i2c>;
+					interrupt-parent = <&i2c_ic>;
+					status = "disabled";
 				};
 
 				i2c1: i2c-bus@80 {
 					#address-cells = <1>;
 					#size-cells = <0>;
+					#interrupt-cells = <1>;
+
 					reg = <0x80 0x40>;
-					compatible = "aspeed,ast2400-i2c-bus";
-					bus = <1>;
-					clock-frequency = <100000>;
-					status = "disabled";
+					compatible = "aspeed,ast2500-i2c-bus";
+					clocks = <&clk_apb>;
+					bus-frequency = <100000>;
 					interrupts = <1>;
+					interrupt-parent = <&i2c_ic>;
+					status = "disabled";
 				};
 
 				i2c2: i2c-bus@c0 {
 					#address-cells = <1>;
 					#size-cells = <0>;
-					reg = <0xC0 0x40>;
-					compatible = "aspeed,ast2400-i2c-bus";
-					bus = <2>;
-					clock-frequency = <100000>;
-					status = "disabled";
+					#interrupt-cells = <1>;
+
+					reg = <0xc0 0x40>;
+					compatible = "aspeed,ast2500-i2c-bus";
+					clocks = <&clk_apb>;
+					bus-frequency = <100000>;
 					interrupts = <2>;
-					pinctrl-names = "default";
-					pinctrl-0 = <&pinctrl_i2c3_default>;
+					interrupt-parent = <&i2c_ic>;
+					status = "disabled";
 				};
 
 				i2c3: i2c-bus@100 {
 					#address-cells = <1>;
 					#size-cells = <0>;
+					#interrupt-cells = <1>;
+
 					reg = <0x100 0x40>;
-					compatible = "aspeed,ast2400-i2c-bus";
-					bus = <3>;
-					clock-frequency = <100000>;
-					status = "disabled";
+					compatible = "aspeed,ast2500-i2c-bus";
+					clocks = <&clk_apb>;
+					bus-frequency = <100000>;
 					interrupts = <3>;
+					interrupt-parent = <&i2c_ic>;
 					pinctrl-names = "default";
 					pinctrl-0 = <&pinctrl_i2c4_default>;
+					status = "disabled";
 				};
 
 				i2c4: i2c-bus@140 {
 					#address-cells = <1>;
 					#size-cells = <0>;
+					#interrupt-cells = <1>;
+
 					reg = <0x140 0x40>;
-					compatible = "aspeed,ast2400-i2c-bus";
-					bus = <4>;
-					clock-frequency = <100000>;
-					status = "disabled";
+					compatible = "aspeed,ast2500-i2c-bus";
+					clocks = <&clk_apb>;
+					bus-frequency = <100000>;
 					interrupts = <4>;
+					interrupt-parent = <&i2c_ic>;
 					pinctrl-names = "default";
 					pinctrl-0 = <&pinctrl_i2c5_default>;
+					status = "disabled";
 				};
 
 				i2c5: i2c-bus@180 {
 					#address-cells = <1>;
 					#size-cells = <0>;
+					#interrupt-cells = <1>;
+
 					reg = <0x180 0x40>;
-					compatible = "aspeed,ast2400-i2c-bus";
-					bus = <5>;
-					clock-frequency = <100000>;
-					status = "disabled";
+					compatible = "aspeed,ast2500-i2c-bus";
+					clocks = <&clk_apb>;
+					bus-frequency = <100000>;
 					interrupts = <5>;
+					interrupt-parent = <&i2c_ic>;
 					pinctrl-names = "default";
 					pinctrl-0 = <&pinctrl_i2c6_default>;
+					status = "disabled";
 				};
 
 				i2c6: i2c-bus@1c0 {
 					#address-cells = <1>;
 					#size-cells = <0>;
-					reg = <0x1C0 0x40>;
-					compatible = "aspeed,ast2400-i2c-bus";
-					bus = <6>;
-					clock-frequency = <100000>;
-					status = "disabled";
+					#interrupt-cells = <1>;
+
+					reg = <0x1c0 0x40>;
+					compatible = "aspeed,ast2500-i2c-bus";
+					clocks = <&clk_apb>;
+					bus-frequency = <100000>;
 					interrupts = <6>;
+					interrupt-parent = <&i2c_ic>;
 					pinctrl-names = "default";
 					pinctrl-0 = <&pinctrl_i2c7_default>;
+					status = "disabled";
 				};
 
 				i2c7: i2c-bus@300 {
 					#address-cells = <1>;
 					#size-cells = <0>;
+					#interrupt-cells = <1>;
+
 					reg = <0x300 0x40>;
-					compatible = "aspeed,ast2400-i2c-bus";
-					bus = <7>;
-					clock-frequency = <100000>;
-					status = "disabled";
+					compatible = "aspeed,ast2500-i2c-bus";
+					clocks = <&clk_apb>;
+					bus-frequency = <100000>;
 					interrupts = <7>;
+					interrupt-parent = <&i2c_ic>;
 					pinctrl-names = "default";
 					pinctrl-0 = <&pinctrl_i2c8_default>;
+					status = "disabled";
 				};
 
 				i2c8: i2c-bus@340 {
 					#address-cells = <1>;
 					#size-cells = <0>;
+					#interrupt-cells = <1>;
+
 					reg = <0x340 0x40>;
-					compatible = "aspeed,ast2400-i2c-bus";
-					bus = <8>;
-					clock-frequency = <100000>;
-					status = "disabled";
+					compatible = "aspeed,ast2500-i2c-bus";
+					clocks = <&clk_apb>;
+					bus-frequency = <100000>;
 					interrupts = <8>;
+					interrupt-parent = <&i2c_ic>;
 					pinctrl-names = "default";
 					pinctrl-0 = <&pinctrl_i2c9_default>;
+					status = "disabled";
 				};
 
 				i2c9: i2c-bus@380 {
 					#address-cells = <1>;
 					#size-cells = <0>;
+					#interrupt-cells = <1>;
+
 					reg = <0x380 0x40>;
-					compatible = "aspeed,ast2400-i2c-bus";
-					bus = <9>;
-					clock-frequency = <100000>;
-					status = "disabled";
+					compatible = "aspeed,ast2500-i2c-bus";
+					clocks = <&clk_apb>;
+					bus-frequency = <100000>;
 					interrupts = <9>;
+					interrupt-parent = <&i2c_ic>;
 					pinctrl-names = "default";
 					pinctrl-0 = <&pinctrl_i2c10_default>;
+					status = "disabled";
 				};
 
 				i2c10: i2c-bus@3c0 {
 					#address-cells = <1>;
 					#size-cells = <0>;
+					#interrupt-cells = <1>;
+
 					reg = <0x3c0 0x40>;
-					compatible = "aspeed,ast2400-i2c-bus";
-					bus = <10>;
-					clock-frequency = <100000>;
-					status = "disabled";
+					compatible = "aspeed,ast2500-i2c-bus";
+					clocks = <&clk_apb>;
+					bus-frequency = <100000>;
 					interrupts = <10>;
+					interrupt-parent = <&i2c_ic>;
 					pinctrl-names = "default";
 					pinctrl-0 = <&pinctrl_i2c11_default>;
+					status = "disabled";
 				};
 
 				i2c11: i2c-bus@400 {
 					#address-cells = <1>;
 					#size-cells = <0>;
+					#interrupt-cells = <1>;
+
 					reg = <0x400 0x40>;
-					compatible = "aspeed,ast2400-i2c-bus";
-					bus = <11>;
-					clock-frequency = <100000>;
-					status = "disabled";
+					compatible = "aspeed,ast2500-i2c-bus";
+					clocks = <&clk_apb>;
+					bus-frequency = <100000>;
 					interrupts = <11>;
+					interrupt-parent = <&i2c_ic>;
 					pinctrl-names = "default";
 					pinctrl-0 = <&pinctrl_i2c12_default>;
+					status = "disabled";
 				};
 
 				i2c12: i2c-bus@440 {
 					#address-cells = <1>;
 					#size-cells = <0>;
+					#interrupt-cells = <1>;
+
 					reg = <0x440 0x40>;
-					compatible = "aspeed,ast2400-i2c-bus";
-					bus = <12>;
-					clock-frequency = <100000>;
-					status = "disabled";
+					compatible = "aspeed,ast2500-i2c-bus";
+					clocks = <&clk_apb>;
+					bus-frequency = <100000>;
 					interrupts = <12>;
+					interrupt-parent = <&i2c_ic>;
 					pinctrl-names = "default";
 					pinctrl-0 = <&pinctrl_i2c13_default>;
+					status = "disabled";
 				};
 
 				i2c13: i2c-bus@480 {
 					#address-cells = <1>;
 					#size-cells = <0>;
+					#interrupt-cells = <1>;
+
 					reg = <0x480 0x40>;
-					compatible = "aspeed,ast2400-i2c-bus";
-					bus = <13>;
-					clock-frequency = <100000>;
-					status = "disabled";
+					compatible = "aspeed,ast2500-i2c-bus";
+					clocks = <&clk_apb>;
+					bus-frequency = <100000>;
 					interrupts = <13>;
+					interrupt-parent = <&i2c_ic>;
 					pinctrl-names = "default";
 					pinctrl-0 = <&pinctrl_i2c14_default>;
+					status = "disabled";
 				};
-
 			};
-
 		};
 	};
 };
-- 
2.11.0
