Return-Path: <joel.stan@gmail.com>
Received: from mail-pf0-x244.google.com (mail-pf0-x244.google.com
 [IPv6:2607:f8b0:400e:c00::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wD7dQ1qwTzDqCL
 for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2017 17:20:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="I/LG6vWD"; 
 dkim-atps=neutral
Received: by mail-pf0-x244.google.com with SMTP id v14so7070305pfd.3
 for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2017 00:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=ZNHB4tsVYikNe8k0WfluItVs/wIOuk/GjJTqRTjvRa8=;
 b=I/LG6vWDuGuEe06x+48PmDI2fp2A6LwHKQSUYFqxBxfdP+Yx403all9GEJBhVf+Dfx
 pMU9bmN5A0IGFPlowpu/g4Yb6m0X0niAw1F40sF28g9g8Fw753q/OscGseHBLhI669ON
 BhDx/9bspbY6/HDUcemNpIfCHLNCszwGakZwuALyPakI/g1SH/3mDrFF4UE8SwOh6dpD
 q4rs+Gl48pL+qcdHyTLap6vkJAqMU7XQ/ug5FAhOcZGd6ljhDDWkWxrD6D793D5Mqo80
 0XiEHPTQ3d7pLPN4Sh5XDl3vjLtAg+BZ2RrSW4HzFdgFeMJA4/GjjGQpdmrrwA+6sUOw
 afhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=ZNHB4tsVYikNe8k0WfluItVs/wIOuk/GjJTqRTjvRa8=;
 b=apTVA+CAqffSBscG5OeagboJC6S9ZFj3rSD7si+h8TWCBO8Q6/Guy24vNGTGvhfCH6
 QOEAn6XOmRHc1lNRI5euhskEzVcn8FI5st3eCYNSlk/K/DXl3k970qvC2AtEr0LR178r
 lfDrU8oxv09YtwBtu0PfT3Gm20r2XPwxfEeOX2G8H9D9E4RrebCA7wB5jnsNjKDQczgZ
 8FpNEtCYh3F/otoLdOGGSGjFCkcTBwaOsAXJdZ2ok4IeY9iDF2Iq/EtW/6ZhT39MMBoW
 PPCqLtWpwVjlAzXCw1aR5KqmosvhjHMJyqfdGJ5LDAe3wFmnjHnchMEJfoOzxzlPWCJ/
 GYsg==
X-Gm-Message-State: AN3rC/6TqSUrYpqzZTmHIRwCsdYxEu9hU7g9ghwuqyLxQlFNNF/2ZZQH
 ctv81ROxV1WiBYZrKrpeQQ==
X-Received: by 10.99.151.18 with SMTP id n18mr4192727pge.199.1493277623328;
 Thu, 27 Apr 2017 00:20:23 -0700 (PDT)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id m3sm3159590pgn.30.2017.04.27.00.20.19
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Thu, 27 Apr 2017 00:20:22 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Thu, 27 Apr 2017 16:50:16 +0930
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Cc: Andrew Jeffery <andrew@aj.id.au>,
 Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH linux dev-4.10] ARM: dts: aspeed: Update i2c binding
Date: Thu, 27 Apr 2017 16:50:15 +0930
Message-Id: <20170427072015.23334-1-joel@jms.id.au>
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
X-List-Received-Date: Thu, 27 Apr 2017 07:20:27 -0000

The I2C binding changed when upstreaming the I2C driver.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---

I've boot tested this, but please take a look to make sure I didn't stuff it up.

 arch/arm/boot/dts/aspeed-g4.dtsi | 156 ++++++++++++++++++++-------------
 arch/arm/boot/dts/aspeed-g5.dtsi | 180 ++++++++++++++++++++++++---------------
 2 files changed, 207 insertions(+), 129 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index b9a6730cc831..c25c5f839d58 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -958,200 +958,240 @@
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
index ddfb729bb85a..9f43c978df40 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -1149,199 +1149,237 @@
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
