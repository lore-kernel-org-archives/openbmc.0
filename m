Return-Path: <mine260309@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c05::243; helo=mail-pg0-x243.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="b+0jQnG3"; 
 dkim-atps=neutral
Received: from mail-pg0-x243.google.com (mail-pg0-x243.google.com
 [IPv6:2607:f8b0:400e:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yQTWf71ttzDqMY
 for <openbmc@lists.ozlabs.org>; Mon, 30 Oct 2017 20:21:50 +1100 (AEDT)
Received: by mail-pg0-x243.google.com with SMTP id p9so11061458pgc.8
 for <openbmc@lists.ozlabs.org>; Mon, 30 Oct 2017 02:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=4s8mz2kLa5xWAo8XaOvyyozIJziAMujbvU2MAjjcwgM=;
 b=b+0jQnG34/yZVJsck6IiM7SrCzsIigjd/uwpMRqLVIbuAqJ8CZT1hsVaRgJcwP3D3w
 2TRjD+hcoWhl+0K2FJyIy6TNQpomFq4iEfhJqxrGM8jL5Kg5kuy63SwCNCtxt3/H25Pi
 oHlxJHyLc+YVe24/EdwtvpgEZhKcojoKqHRdDlDnVKSWTe6Df8FwhFq56NkYFwxtbRRR
 /+w4nYzEVsloge5zOY1mlcvGy4MZ9eHF8ocXfj7o/zPUGVA7xAYPwqPo/tNfvSim1KFr
 KOmcs/0SzYwSqekz1Kx7sekZu8UvIZVhxkiDHfHlKLOfPhjq/f09vGODOyzaIxcxC40C
 +13g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=4s8mz2kLa5xWAo8XaOvyyozIJziAMujbvU2MAjjcwgM=;
 b=jYhmz1P5a07yuNi5gtA5Sf3dJaPCHmeaZ2S2u1hFcVmC4fj0W2deDOfLJroAZDClFu
 op8O7Nra+cdnu4i9K9u9CcnYbNGcPID2uumZqOVLMF8NesPoQLiEexDhG8gu7DhZQ/lO
 6ZRfAuhR1yYktxZxgtE+STAhu3p9KrBYLUugFkAsqKVLGNUwByf6FPmTy0r+x1xX71el
 L2lE+xf8lUBMNcMoUnFjIxc4doZ3VQv8zMfJjXlM9mFnFiDBG/3NNFxh1gOQd0SYyATq
 de7n4fdB+66zxJACrgViOThVu+zU2A7KPqibTuf2X1e0J5s61usR4fGq5+1dymdBGu3N
 cfjw==
X-Gm-Message-State: AMCzsaXfHzsQfzPlpUZ+4Pd+bFwBFTYVFdSbw8tQOKh5Ew7FhuLTO3I8
 QbFYU3DmUjbqf0bblj2/BWwwL9BD
X-Google-Smtp-Source: ABhQp+TCfbrsZi6b2an7qlPLkplvFSrywNfCgXeyghLIdGlifxFja4rYFyjlu1aiP31/XoJML63LtQ==
X-Received: by 10.159.218.142 with SMTP id w14mr7056323plp.310.1509355308729; 
 Mon, 30 Oct 2017 02:21:48 -0700 (PDT)
Received: from localhost ([204.110.13.80])
 by smtp.gmail.com with ESMTPSA id h67sm32375307pfk.60.2017.10.30.02.21.46
 (version=TLS1_2 cipher=AES128-SHA bits=128/128);
 Mon, 30 Oct 2017 02:21:48 -0700 (PDT)
From: Lei YU <mine260309@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: Lei YU <mine260309@gmail.com>,
	andrew@aj.id.au
Subject: [PATCH linux dev-4.10] ARM: dts: aspeed: romulus: Add aspeed fan tach
Date: Mon, 30 Oct 2017 17:21:24 +0800
Message-Id: <1509355284-28799-1-git-send-email-mine260309@gmail.com>
X-Mailer: git-send-email 1.9.1
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
X-List-Received-Date: Mon, 30 Oct 2017 09:21:51 -0000

Romulus uses aspeed fan tach instead of max31785:
* Pass1's max31785 is always reset by CPLD;
* Pass2's max31785 is not connected.

The board has 7 fan taches connected to BMC_FANTACH8~14,
and controlled by two PWMs.

This commit also change "enabled" to "okay" for the i2c devices.

Signed-off-by: Lei YU <mine260309@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts | 138 +++++++++------------------
 1 file changed, 47 insertions(+), 91 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
index dea556f..86f7927 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
@@ -68,6 +68,47 @@
 
 #include "ibm-power9-cfam.dtsi"
 
+&pwm_tacho {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default>;
+
+	fan@0 {
+		reg = <0x00>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x08>;
+	};
+
+	fan@1 {
+		reg = <0x00>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x09>;
+	};
+
+	fan@2 {
+		reg = <0x01>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x0a>;
+	};
+
+	fan@3 {
+		reg = <0x01>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x0b>;
+	};
+
+	fan@4 {
+		reg = <0x00>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x0c>;
+	};
+
+	fan@5 {
+		reg = <0x00>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x0d>;
+	};
+
+	fan@6 {
+		reg = <0x01>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x0e>;
+	};
+};
+
 &fmc {
 	status = "okay";
 	flash@0 {
@@ -132,7 +173,7 @@
 };
 
 &i2c1 {
-	status = "enabled";
+	status = "okay";
 
 	/* CPU1 */
 };
@@ -173,27 +214,27 @@
 
 &i2c6 {
 	/* PCIe slot 1 (x8) */
-	status = "enabled";
+	status = "okay";
 };
 
 &i2c7 {
 	/* PCIe slot 2 (x16) */
-	status = "enabled";
+	status = "okay";
 };
 
 &i2c8 {
 	/* PCIe slot 3 (x16) */
-	status = "enabled";
+	status = "okay";
 };
 
 &i2c9 {
 	/* PCIe slot 4 (x16) */
-	status = "enabled";
+	status = "okay";
 };
 
 &i2c10 {
 	/* PCIe slot 5 (x8) */
-	status = "enabled";
+	status = "okay";
 };
 
 &i2c11 {
@@ -211,91 +252,6 @@
 	status = "okay";
 
 	/* Fan Controller */
-	max31785@52 {
-		compatible = "maxim,max31785";
-		reg = <0x52>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		fan@0 {
-			compatible = "pmbus-fan";
-			reg = <0>;
-			tach-pulses = <2>;
-			maxim,fan-rotor-input = "tach";
-			maxim,fan-pwm-freq = <25000>;
-			maxim,fan-dual-tach;
-			maxim,fan-no-watchdog;
-			maxim,fan-no-fault-ramp;
-			maxim,fan-ramp = <2>;
-			maxim,fan-fault-pin-mon;
-		};
-
-		fan@1 {
-			compatible = "pmbus-fan";
-			reg = <1>;
-			tach-pulses = <2>;
-			maxim,fan-rotor-input = "tach";
-			maxim,fan-pwm-freq = <25000>;
-			maxim,fan-dual-tach;
-			maxim,fan-no-watchdog;
-			maxim,fan-no-fault-ramp;
-			maxim,fan-ramp = <2>;
-			maxim,fan-fault-pin-mon;
-		};
-
-		fan@2 {
-			compatible = "pmbus-fan";
-			reg = <2>;
-			tach-pulses = <2>;
-			maxim,fan-rotor-input = "tach";
-			maxim,fan-pwm-freq = <25000>;
-			maxim,fan-dual-tach;
-			maxim,fan-no-watchdog;
-			maxim,fan-no-fault-ramp;
-			maxim,fan-ramp = <2>;
-			maxim,fan-fault-pin-mon;
-		};
-
-		fan@3 {
-			compatible = "pmbus-fan";
-			reg = <3>;
-			tach-pulses = <2>;
-			maxim,fan-rotor-input = "tach";
-			maxim,fan-pwm-freq = <25000>;
-			maxim,fan-dual-tach;
-			maxim,fan-no-watchdog;
-			maxim,fan-no-fault-ramp;
-			maxim,fan-ramp = <2>;
-			maxim,fan-fault-pin-mon;
-		};
-
-		fan@4 {
-			compatible = "pmbus-fan";
-			reg = <4>;
-			tach-pulses = <2>;
-			maxim,fan-rotor-input = "tach";
-			maxim,fan-pwm-freq = <25000>;
-			maxim,fan-dual-tach;
-			maxim,fan-no-watchdog;
-			maxim,fan-no-fault-ramp;
-			maxim,fan-ramp = <2>;
-			maxim,fan-fault-pin-mon;
-		};
-
-		fan@5 {
-			compatible = "pmbus-fan";
-			reg = <5>;
-			tach-pulses = <2>;
-			maxim,fan-rotor-input = "tach";
-			maxim,fan-pwm-freq = <25000>;
-			maxim,fan-dual-tach;
-			maxim,fan-no-watchdog;
-			maxim,fan-no-fault-ramp;
-			maxim,fan-ramp = <2>;
-			maxim,fan-fault-pin-mon;
-		};
-	};
-
 	/* CPLD */
 	/* Power Supply */
 	/* Temp Sensor */
-- 
1.9.1
