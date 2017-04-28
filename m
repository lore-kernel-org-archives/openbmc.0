Return-Path: <joel.stan@gmail.com>
Received: from mail-pg0-x243.google.com (mail-pg0-x243.google.com
 [IPv6:2607:f8b0:400e:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wDbKQ2mNGzDq5b
 for <openbmc@lists.ozlabs.org>; Fri, 28 Apr 2017 11:08:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="OQbHmABA"; 
 dkim-atps=neutral
Received: by mail-pg0-x243.google.com with SMTP id v20so352724pgn.0
 for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2017 18:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=NBFbkLGMak6iCuo5M1ONkX0r4b2aEIVEVvhVZm1819s=;
 b=OQbHmABAdpdWfBJtuodBPHby8f/KsLym5DNanduwUBRQcp3xjrHaRQlhGXsSwOeR/r
 9IbaBaMNCNSBfU3wKiGxrYrx6ZO9oLi8oGQAse8LwOm1AFll87JEsYRtn6ZjfKnV7IvC
 acJ5VPApi9wibLlR2qHAcLUOL647rHIeiz7oU70x21a4Zlaf898lb7K37OO8Qi1j1XNN
 oeR140E8wPcgE2Mf+4y/V/Gz9IJ42XaQWxCCPXWjW4SOZ/a6ak2ewAY98+U6Igpjacy0
 SsCtM/sHfATID+M5c/yUHIe50F3SKrwRQZY0x9XyPI7nHd0wt0ATOYVxJzyt+gUgKyTk
 EvSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=NBFbkLGMak6iCuo5M1ONkX0r4b2aEIVEVvhVZm1819s=;
 b=f4jYNhROvyq+69VCpwC6CQnDfCAaLgjwWndsXGNqAjdwf6sNdOByim4tY4RjaFoC1d
 dT/oZ3c/8jbCZwjUCXMZ4Y50pW94jUV8OUZTX0pTE8KHts7XNFxgHyq5O0xLoHBULj4h
 QkPzGDYVamPA4mKXMdyF1ZRpefy5ob4O4KZj+BCAAU0N1lxBbx3n97FTl1W0DP4fjEgN
 GWno4AroZOTOHNkEDU3uYB4IvfG30PSdWHxf4cX2EUe3rlKfEfupoZhp6bvFxdfX0mpU
 gtVctzqVvLxNaqmTnfwale+SqoDYBY9nUmP/w9KYOL5SuF6vTwCrOasrhQOqJJ5a7bNk
 79LA==
X-Gm-Message-State: AN3rC/4o4tqnma6sGkC1LQtsrpmSud2g/CnW7RMvMWw8joaMmOahdIeO
 E9Uuvm3WLINJfX2cvo2d5Q==
X-Received: by 10.84.233.140 with SMTP id l12mr11316633plk.18.1493341686773;
 Thu, 27 Apr 2017 18:08:06 -0700 (PDT)
Received: from aurora.jms.id.au ([103.232.208.197])
 by smtp.gmail.com with ESMTPSA id a21sm6531932pfc.60.2017.04.27.18.08.03
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Thu, 27 Apr 2017 18:08:06 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Fri, 28 Apr 2017 10:37:58 +0930
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Cc: Andrew Jeffery <andrew@aj.id.au>,
 Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH linux dev-4.10 v3] ARM: dts: aspeed: Update i2c binding
Date: Fri, 28 Apr 2017 10:37:57 +0930
Message-Id: <20170428010757.19566-1-joel@jms.id.au>
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
X-List-Received-Date: Fri, 28 Apr 2017 01:08:11 -0000

The I2C binding changed when upstreaming the I2C driver.

This adds aliases for the 14 built-in I2C busses to ensure userspace
sees the numbering that we had with the old driver.

This change moves the description of the i2c buses to the bottom of the
dtsi to improve readability.

OpenBMC-Staging-Count: 1
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v2:
 Added i2c aliases.

 Boot tested on qemu-palmetto. We see the same i2c entries under /dev as before,
 so the aliases work. Note that we can't use qemu for testing with the new
 driver, tracked at https://github.com/openbmc/qemu/issues/5

v3:
 Fixed missing pinctrl properties for i2c2
 Moved description of buses to the bottom of the dtsi

 arch/arm/boot/dts/aspeed-g4.dtsi | 414 ++++++++++++++++++++++-----------------
 arch/arm/boot/dts/aspeed-g5.dtsi | 413 +++++++++++++++++++++-----------------
 2 files changed, 475 insertions(+), 352 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index b9a6730cc831..952e23d553f8 100644
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
 
@@ -958,200 +975,245 @@
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
+			};
 
-				i2c0: i2c-bus@40 {
-					#address-cells = <1>;
-					#size-cells = <0>;
-					reg = <0x40 0x40>;
-					compatible = "aspeed,ast2400-i2c-bus";
-					bus = <0>;
-					clock-frequency = <100000>;
-					status = "disabled";
-					interrupts = <0>;
-					interrupt-parent = <&i2c>;
-					/* Does not need pinctrl node */
-				};
 
-				i2c1: i2c-bus@80 {
-					#address-cells = <1>;
-					#size-cells = <0>;
-					reg = <0x80 0x40>;
-					compatible = "aspeed,ast2400-i2c-bus";
-					bus = <1>;
-					clock-frequency = <100000>;
-					status = "disabled";
-					interrupts = <1>;
-					/* Does not need pinctrl node */
-				};
+		};
+	};
+};
 
-				i2c2: i2c-bus@c0 {
-					#address-cells = <1>;
-					#size-cells = <0>;
-					reg = <0xC0 0x40>;
-					compatible = "aspeed,ast2400-i2c-bus";
-					bus = <2>;
-					clock-frequency = <100000>;
-					status = "disabled";
-					interrupts = <2>;
-					pinctrl-names = "default";
-					pinctrl-0 = <&pinctrl_i2c3_default>;
-				};
+&i2c {
+	i2c_ic: interrupt-controller@0 {
+		#interrupt-cells = <1>;
+		compatible = "aspeed,ast2400-i2c-ic";
+		reg = <0x0 0x40>;
+		interrupts = <12>;
+		interrupt-controller;
+	};
 
-				i2c3: i2c-bus@100 {
-					#address-cells = <1>;
-					#size-cells = <0>;
-					reg = <0x100 0x40>;
-					compatible = "aspeed,ast2400-i2c-bus";
-					bus = <3>;
-					clock-frequency = <100000>;
-					status = "disabled";
-					interrupts = <3>;
-					pinctrl-names = "default";
-					pinctrl-0 = <&pinctrl_i2c4_default>;
-				};
+	i2c0: i2c-bus@40 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		#interrupt-cells = <1>;
+
+		reg = <0x40 0x40>;
+		compatible = "aspeed,ast2400-i2c-bus";
+		clocks = <&clk_apb>;
+		bus-frequency = <100000>;
+		interrupts = <0>;
+		interrupt-parent = <&i2c_ic>;
+		status = "disabled";
+		/* Does not need pinctrl properties */
+	};
 
-				i2c4: i2c-bus@140 {
-					#address-cells = <1>;
-					#size-cells = <0>;
-					reg = <0x140 0x40>;
-					compatible = "aspeed,ast2400-i2c-bus";
-					bus = <4>;
-					clock-frequency = <100000>;
-					status = "disabled";
-					interrupts = <4>;
-					pinctrl-names = "default";
-					pinctrl-0 = <&pinctrl_i2c5_default>;
-				};
+	i2c1: i2c-bus@80 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		#interrupt-cells = <1>;
+
+		reg = <0x80 0x40>;
+		compatible = "aspeed,ast2400-i2c-bus";
+		clocks = <&clk_apb>;
+		bus-frequency = <100000>;
+		interrupts = <1>;
+		interrupt-parent = <&i2c_ic>;
+		status = "disabled";
+		/* Does not need pinctrl properties */
+	};
 
-				i2c5: i2c-bus@180 {
-					#address-cells = <1>;
-					#size-cells = <0>;
-					reg = <0x180 0x40>;
-					compatible = "aspeed,ast2400-i2c-bus";
-					bus = <5>;
-					clock-frequency = <100000>;
-					status = "disabled";
-					interrupts = <5>;
-					pinctrl-names = "default";
-					pinctrl-0 = <&pinctrl_i2c6_default>;
-				};
+	i2c2: i2c-bus@c0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		#interrupt-cells = <1>;
+
+		reg = <0xc0 0x40>;
+		compatible = "aspeed,ast2400-i2c-bus";
+		clocks = <&clk_apb>;
+		bus-frequency = <100000>;
+		interrupts = <2>;
+		interrupt-parent = <&i2c_ic>;
+		status = "disabled";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2c3_default>;
+	};
 
-				i2c6: i2c-bus@1c0 {
-					#address-cells = <1>;
-					#size-cells = <0>;
-					reg = <0x1C0 0x40>;
-					compatible = "aspeed,ast2400-i2c-bus";
-					bus = <6>;
-					clock-frequency = <100000>;
-					status = "disabled";
-					interrupts = <6>;
-					pinctrl-names = "default";
-					pinctrl-0 = <&pinctrl_i2c7_default>;
-				};
+	i2c3: i2c-bus@100 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		#interrupt-cells = <1>;
+
+		reg = <0x100 0x40>;
+		compatible = "aspeed,ast2400-i2c-bus";
+		clocks = <&clk_apb>;
+		bus-frequency = <100000>;
+		interrupts = <3>;
+		interrupt-parent = <&i2c_ic>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2c4_default>;
+		status = "disabled";
+	};
 
-				i2c7: i2c-bus@300 {
-					#address-cells = <1>;
-					#size-cells = <0>;
-					reg = <0x300 0x40>;
-					compatible = "aspeed,ast2400-i2c-bus";
-					bus = <7>;
-					clock-frequency = <100000>;
-					status = "disabled";
-					interrupts = <7>;
-					pinctrl-names = "default";
-					pinctrl-0 = <&pinctrl_i2c8_default>;
-				};
+	i2c4: i2c-bus@140 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		#interrupt-cells = <1>;
+
+		reg = <0x140 0x40>;
+		compatible = "aspeed,ast2400-i2c-bus";
+		clocks = <&clk_apb>;
+		bus-frequency = <100000>;
+		interrupts = <4>;
+		interrupt-parent = <&i2c_ic>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2c5_default>;
+		status = "disabled";
+	};
 
-				i2c8: i2c-bus@340 {
-					#address-cells = <1>;
-					#size-cells = <0>;
-					reg = <0x340 0x40>;
-					compatible = "aspeed,ast2400-i2c-bus";
-					bus = <8>;
-					clock-frequency = <100000>;
-					status = "disabled";
-					interrupts = <8>;
-					pinctrl-names = "default";
-					pinctrl-0 = <&pinctrl_i2c9_default>;
-				};
+	i2c5: i2c-bus@180 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		#interrupt-cells = <1>;
+
+		reg = <0x180 0x40>;
+		compatible = "aspeed,ast2400-i2c-bus";
+		clocks = <&clk_apb>;
+		bus-frequency = <100000>;
+		interrupts = <5>;
+		interrupt-parent = <&i2c_ic>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2c6_default>;
+		status = "disabled";
+	};
 
-				i2c9: i2c-bus@380 {
-					#address-cells = <1>;
-					#size-cells = <0>;
-					reg = <0x380 0x40>;
-					compatible = "aspeed,ast2400-i2c-bus";
-					bus = <9>;
-					clock-frequency = <100000>;
-					status = "disabled";
-					interrupts = <9>;
-					pinctrl-names = "default";
-					pinctrl-0 = <&pinctrl_i2c10_default>;
-				};
+	i2c6: i2c-bus@1c0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		#interrupt-cells = <1>;
+
+		reg = <0x1c0 0x40>;
+		compatible = "aspeed,ast2400-i2c-bus";
+		clocks = <&clk_apb>;
+		bus-frequency = <100000>;
+		interrupts = <6>;
+		interrupt-parent = <&i2c_ic>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2c7_default>;
+		status = "disabled";
+	};
 
-				i2c10: i2c-bus@3c0 {
-					#address-cells = <1>;
-					#size-cells = <0>;
-					reg = <0x3c0 0x40>;
-					compatible = "aspeed,ast2400-i2c-bus";
-					bus = <10>;
-					clock-frequency = <100000>;
-					status = "disabled";
-					interrupts = <10>;
-					pinctrl-names = "default";
-					pinctrl-0 = <&pinctrl_i2c11_default>;
-				};
+	i2c7: i2c-bus@300 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		#interrupt-cells = <1>;
+
+		reg = <0x300 0x40>;
+		compatible = "aspeed,ast2400-i2c-bus";
+		clocks = <&clk_apb>;
+		bus-frequency = <100000>;
+		interrupts = <7>;
+		interrupt-parent = <&i2c_ic>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2c8_default>;
+		status = "disabled";
+	};
 
-				i2c11: i2c-bus@400 {
-					#address-cells = <1>;
-					#size-cells = <0>;
-					reg = <0x400 0x40>;
-					compatible = "aspeed,ast2400-i2c-bus";
-					bus = <11>;
-					clock-frequency = <100000>;
-					status = "disabled";
-					interrupts = <11>;
-					pinctrl-names = "default";
-					pinctrl-0 = <&pinctrl_i2c12_default>;
-				};
+	i2c8: i2c-bus@340 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		#interrupt-cells = <1>;
+
+		reg = <0x340 0x40>;
+		compatible = "aspeed,ast2400-i2c-bus";
+		clocks = <&clk_apb>;
+		bus-frequency = <100000>;
+		interrupts = <8>;
+		interrupt-parent = <&i2c_ic>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2c9_default>;
+		status = "disabled";
+	};
 
-				i2c12: i2c-bus@440 {
-					#address-cells = <1>;
-					#size-cells = <0>;
-					reg = <0x440 0x40>;
-					compatible = "aspeed,ast2400-i2c-bus";
-					bus = <12>;
-					clock-frequency = <100000>;
-					status = "disabled";
-					interrupts = <12>;
-					pinctrl-names = "default";
-					pinctrl-0 = <&pinctrl_i2c13_default>;
-				};
+	i2c9: i2c-bus@380 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		#interrupt-cells = <1>;
+
+		reg = <0x380 0x40>;
+		compatible = "aspeed,ast2400-i2c-bus";
+		clocks = <&clk_apb>;
+		bus-frequency = <100000>;
+		interrupts = <9>;
+		interrupt-parent = <&i2c_ic>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2c10_default>;
+		status = "disabled";
+	};
 
-				i2c13: i2c-bus@480 {
-					#address-cells = <1>;
-					#size-cells = <0>;
-					reg = <0x480 0x40>;
-					compatible = "aspeed,ast2400-i2c-bus";
-					bus = <13>;
-					clock-frequency = <100000>;
-					status = "disabled";
-					interrupts = <13>;
-					/* Does not need pinctrl node */
-				};
+	i2c10: i2c-bus@3c0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		#interrupt-cells = <1>;
+
+		reg = <0x3c0 0x40>;
+		compatible = "aspeed,ast2400-i2c-bus";
+		clocks = <&clk_apb>;
+		bus-frequency = <100000>;
+		interrupts = <10>;
+		interrupt-parent = <&i2c_ic>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2c11_default>;
+		status = "disabled";
+	};
 
-			};
+	i2c11: i2c-bus@400 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		#interrupt-cells = <1>;
+
+		reg = <0x400 0x40>;
+		compatible = "aspeed,ast2400-i2c-bus";
+		clocks = <&clk_apb>;
+		bus-frequency = <100000>;
+		interrupts = <11>;
+		interrupt-parent = <&i2c_ic>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2c12_default>;
+		status = "disabled";
+	};
 
-		};
+	i2c12: i2c-bus@440 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		#interrupt-cells = <1>;
+
+		reg = <0x440 0x40>;
+		compatible = "aspeed,ast2400-i2c-bus";
+		clocks = <&clk_apb>;
+		bus-frequency = <100000>;
+		interrupts = <12>;
+		interrupt-parent = <&i2c_ic>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2c13_default>;
+		status = "disabled";
+	};
+
+	i2c13: i2c-bus@480 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		#interrupt-cells = <1>;
+
+		reg = <0x480 0x40>;
+		compatible = "aspeed,ast2400-i2c-bus";
+		clocks = <&clk_apb>;
+		bus-frequency = <100000>;
+		interrupts = <13>;
+		interrupt-parent = <&i2c_ic>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2c14_default>;
+		status = "disabled";
 	};
 };
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index ddfb729bb85a..905edd7b83ae 100644
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
@@ -1149,199 +1166,243 @@
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
-
-				i2c0: i2c-bus@40 {
-					#address-cells = <1>;
-					#size-cells = <0>;
-					reg = <0x40 0x40>;
-					compatible = "aspeed,ast2400-i2c-bus";
-					bus = <0>;
-					clock-frequency = <100000>;
-					status = "disabled";
-					interrupts = <0>;
-					interrupt-parent = <&i2c>;
-				};
+			};
+		};
+	};
+};
 
-				i2c1: i2c-bus@80 {
-					#address-cells = <1>;
-					#size-cells = <0>;
-					reg = <0x80 0x40>;
-					compatible = "aspeed,ast2400-i2c-bus";
-					bus = <1>;
-					clock-frequency = <100000>;
-					status = "disabled";
-					interrupts = <1>;
-				};
+&i2c {
+	i2c_ic: interrupt-controller@0 {
+		#interrupt-cells = <1>;
+		compatible = "aspeed,ast2500-i2c-ic";
+		reg = <0x0 0x40>;
+		interrupts = <12>;
+		interrupt-controller;
+	};
 
-				i2c2: i2c-bus@c0 {
-					#address-cells = <1>;
-					#size-cells = <0>;
-					reg = <0xC0 0x40>;
-					compatible = "aspeed,ast2400-i2c-bus";
-					bus = <2>;
-					clock-frequency = <100000>;
-					status = "disabled";
-					interrupts = <2>;
-					pinctrl-names = "default";
-					pinctrl-0 = <&pinctrl_i2c3_default>;
-				};
+	i2c0: i2c-bus@40 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		#interrupt-cells = <1>;
+
+		reg = <0x40 0x40>;
+		compatible = "aspeed,ast2500-i2c-bus";
+		clocks = <&clk_apb>;
+		bus-frequency = <100000>;
+		interrupts = <0>;
+		interrupt-parent = <&i2c_ic>;
+		status = "disabled";
+		/* Does not need pinctrl properties */
+	};
 
-				i2c3: i2c-bus@100 {
-					#address-cells = <1>;
-					#size-cells = <0>;
-					reg = <0x100 0x40>;
-					compatible = "aspeed,ast2400-i2c-bus";
-					bus = <3>;
-					clock-frequency = <100000>;
-					status = "disabled";
-					interrupts = <3>;
-					pinctrl-names = "default";
-					pinctrl-0 = <&pinctrl_i2c4_default>;
-				};
+	i2c1: i2c-bus@80 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		#interrupt-cells = <1>;
+
+		reg = <0x80 0x40>;
+		compatible = "aspeed,ast2500-i2c-bus";
+		clocks = <&clk_apb>;
+		bus-frequency = <100000>;
+		interrupts = <1>;
+		interrupt-parent = <&i2c_ic>;
+		status = "disabled";
+		/* Does not need pinctrl properties */
+	};
 
-				i2c4: i2c-bus@140 {
-					#address-cells = <1>;
-					#size-cells = <0>;
-					reg = <0x140 0x40>;
-					compatible = "aspeed,ast2400-i2c-bus";
-					bus = <4>;
-					clock-frequency = <100000>;
-					status = "disabled";
-					interrupts = <4>;
-					pinctrl-names = "default";
-					pinctrl-0 = <&pinctrl_i2c5_default>;
-				};
+	i2c2: i2c-bus@c0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		#interrupt-cells = <1>;
+
+		reg = <0xc0 0x40>;
+		compatible = "aspeed,ast2500-i2c-bus";
+		clocks = <&clk_apb>;
+		bus-frequency = <100000>;
+		interrupts = <2>;
+		interrupt-parent = <&i2c_ic>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2c3_default>;
+		status = "disabled";
+	};
 
-				i2c5: i2c-bus@180 {
-					#address-cells = <1>;
-					#size-cells = <0>;
-					reg = <0x180 0x40>;
-					compatible = "aspeed,ast2400-i2c-bus";
-					bus = <5>;
-					clock-frequency = <100000>;
-					status = "disabled";
-					interrupts = <5>;
-					pinctrl-names = "default";
-					pinctrl-0 = <&pinctrl_i2c6_default>;
-				};
+	i2c3: i2c-bus@100 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		#interrupt-cells = <1>;
+
+		reg = <0x100 0x40>;
+		compatible = "aspeed,ast2500-i2c-bus";
+		clocks = <&clk_apb>;
+		bus-frequency = <100000>;
+		interrupts = <3>;
+		interrupt-parent = <&i2c_ic>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2c4_default>;
+		status = "disabled";
+	};
 
-				i2c6: i2c-bus@1c0 {
-					#address-cells = <1>;
-					#size-cells = <0>;
-					reg = <0x1C0 0x40>;
-					compatible = "aspeed,ast2400-i2c-bus";
-					bus = <6>;
-					clock-frequency = <100000>;
-					status = "disabled";
-					interrupts = <6>;
-					pinctrl-names = "default";
-					pinctrl-0 = <&pinctrl_i2c7_default>;
-				};
+	i2c4: i2c-bus@140 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		#interrupt-cells = <1>;
+
+		reg = <0x140 0x40>;
+		compatible = "aspeed,ast2500-i2c-bus";
+		clocks = <&clk_apb>;
+		bus-frequency = <100000>;
+		interrupts = <4>;
+		interrupt-parent = <&i2c_ic>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2c5_default>;
+		status = "disabled";
+	};
 
-				i2c7: i2c-bus@300 {
-					#address-cells = <1>;
-					#size-cells = <0>;
-					reg = <0x300 0x40>;
-					compatible = "aspeed,ast2400-i2c-bus";
-					bus = <7>;
-					clock-frequency = <100000>;
-					status = "disabled";
-					interrupts = <7>;
-					pinctrl-names = "default";
-					pinctrl-0 = <&pinctrl_i2c8_default>;
-				};
+	i2c5: i2c-bus@180 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		#interrupt-cells = <1>;
+
+		reg = <0x180 0x40>;
+		compatible = "aspeed,ast2500-i2c-bus";
+		clocks = <&clk_apb>;
+		bus-frequency = <100000>;
+		interrupts = <5>;
+		interrupt-parent = <&i2c_ic>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2c6_default>;
+		status = "disabled";
+	};
 
-				i2c8: i2c-bus@340 {
-					#address-cells = <1>;
-					#size-cells = <0>;
-					reg = <0x340 0x40>;
-					compatible = "aspeed,ast2400-i2c-bus";
-					bus = <8>;
-					clock-frequency = <100000>;
-					status = "disabled";
-					interrupts = <8>;
-					pinctrl-names = "default";
-					pinctrl-0 = <&pinctrl_i2c9_default>;
-				};
+	i2c6: i2c-bus@1c0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		#interrupt-cells = <1>;
+
+		reg = <0x1c0 0x40>;
+		compatible = "aspeed,ast2500-i2c-bus";
+		clocks = <&clk_apb>;
+		bus-frequency = <100000>;
+		interrupts = <6>;
+		interrupt-parent = <&i2c_ic>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2c7_default>;
+		status = "disabled";
+	};
 
-				i2c9: i2c-bus@380 {
-					#address-cells = <1>;
-					#size-cells = <0>;
-					reg = <0x380 0x40>;
-					compatible = "aspeed,ast2400-i2c-bus";
-					bus = <9>;
-					clock-frequency = <100000>;
-					status = "disabled";
-					interrupts = <9>;
-					pinctrl-names = "default";
-					pinctrl-0 = <&pinctrl_i2c10_default>;
-				};
+	i2c7: i2c-bus@300 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		#interrupt-cells = <1>;
+
+		reg = <0x300 0x40>;
+		compatible = "aspeed,ast2500-i2c-bus";
+		clocks = <&clk_apb>;
+		bus-frequency = <100000>;
+		interrupts = <7>;
+		interrupt-parent = <&i2c_ic>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2c8_default>;
+		status = "disabled";
+	};
 
-				i2c10: i2c-bus@3c0 {
-					#address-cells = <1>;
-					#size-cells = <0>;
-					reg = <0x3c0 0x40>;
-					compatible = "aspeed,ast2400-i2c-bus";
-					bus = <10>;
-					clock-frequency = <100000>;
-					status = "disabled";
-					interrupts = <10>;
-					pinctrl-names = "default";
-					pinctrl-0 = <&pinctrl_i2c11_default>;
-				};
+	i2c8: i2c-bus@340 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		#interrupt-cells = <1>;
+
+		reg = <0x340 0x40>;
+		compatible = "aspeed,ast2500-i2c-bus";
+		clocks = <&clk_apb>;
+		bus-frequency = <100000>;
+		interrupts = <8>;
+		interrupt-parent = <&i2c_ic>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2c9_default>;
+		status = "disabled";
+	};
 
-				i2c11: i2c-bus@400 {
-					#address-cells = <1>;
-					#size-cells = <0>;
-					reg = <0x400 0x40>;
-					compatible = "aspeed,ast2400-i2c-bus";
-					bus = <11>;
-					clock-frequency = <100000>;
-					status = "disabled";
-					interrupts = <11>;
-					pinctrl-names = "default";
-					pinctrl-0 = <&pinctrl_i2c12_default>;
-				};
+	i2c9: i2c-bus@380 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		#interrupt-cells = <1>;
+
+		reg = <0x380 0x40>;
+		compatible = "aspeed,ast2500-i2c-bus";
+		clocks = <&clk_apb>;
+		bus-frequency = <100000>;
+		interrupts = <9>;
+		interrupt-parent = <&i2c_ic>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2c10_default>;
+		status = "disabled";
+	};
 
-				i2c12: i2c-bus@440 {
-					#address-cells = <1>;
-					#size-cells = <0>;
-					reg = <0x440 0x40>;
-					compatible = "aspeed,ast2400-i2c-bus";
-					bus = <12>;
-					clock-frequency = <100000>;
-					status = "disabled";
-					interrupts = <12>;
-					pinctrl-names = "default";
-					pinctrl-0 = <&pinctrl_i2c13_default>;
-				};
+	i2c10: i2c-bus@3c0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		#interrupt-cells = <1>;
+
+		reg = <0x3c0 0x40>;
+		compatible = "aspeed,ast2500-i2c-bus";
+		clocks = <&clk_apb>;
+		bus-frequency = <100000>;
+		interrupts = <10>;
+		interrupt-parent = <&i2c_ic>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2c11_default>;
+		status = "disabled";
+	};
 
-				i2c13: i2c-bus@480 {
-					#address-cells = <1>;
-					#size-cells = <0>;
-					reg = <0x480 0x40>;
-					compatible = "aspeed,ast2400-i2c-bus";
-					bus = <13>;
-					clock-frequency = <100000>;
-					status = "disabled";
-					interrupts = <13>;
-					pinctrl-names = "default";
-					pinctrl-0 = <&pinctrl_i2c14_default>;
-				};
+	i2c11: i2c-bus@400 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		#interrupt-cells = <1>;
+
+		reg = <0x400 0x40>;
+		compatible = "aspeed,ast2500-i2c-bus";
+		clocks = <&clk_apb>;
+		bus-frequency = <100000>;
+		interrupts = <11>;
+		interrupt-parent = <&i2c_ic>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2c12_default>;
+		status = "disabled";
+	};
 
-			};
+	i2c12: i2c-bus@440 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		#interrupt-cells = <1>;
+
+		reg = <0x440 0x40>;
+		compatible = "aspeed,ast2500-i2c-bus";
+		clocks = <&clk_apb>;
+		bus-frequency = <100000>;
+		interrupts = <12>;
+		interrupt-parent = <&i2c_ic>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2c13_default>;
+		status = "disabled";
+	};
 
-		};
+	i2c13: i2c-bus@480 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		#interrupt-cells = <1>;
+
+		reg = <0x480 0x40>;
+		compatible = "aspeed,ast2500-i2c-bus";
+		clocks = <&clk_apb>;
+		bus-frequency = <100000>;
+		interrupts = <13>;
+		interrupt-parent = <&i2c_ic>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2c14_default>;
+		status = "disabled";
 	};
 };
-- 
2.11.0
