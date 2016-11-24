Return-Path: <jaghu@google.com>
Received: from mail-pg0-x22d.google.com (mail-pg0-x22d.google.com
 [IPv6:2607:f8b0:400e:c05::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tPYkc310qzDw6p
 for <openbmc@lists.ozlabs.org>; Thu, 24 Nov 2016 20:27:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ePLfonZ6"; 
 dkim-atps=neutral
Received: by mail-pg0-x22d.google.com with SMTP id f188so16668470pgc.3
 for <openbmc@lists.ozlabs.org>; Thu, 24 Nov 2016 01:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=UX/I1W5orN3/fAmYEHBAqrxWk2rWbOsTKiXajV9JI70=;
 b=ePLfonZ67JEi9ZlFJLKu7YUEroZcnwzB6O0AlQ+vklDpN3fq/04c5nxJp5Lkt7L1Pz
 Y4zihdMDrb5BSG9v1uRndhjiYQccswTbeEB/jEa80xd0WrsjWkhzRIZ+3g4+GDBl+PXS
 wHBdLX7MAwVi5nb35tL+7SflPdtyUGRoz0jomQuYyU+Gn116sb20nAmk8dxkhi9yXjZC
 tZQLtZDn6+Aohn3ytGcYKNyfP/jsfKC/WVcbT2vklbnX9B3ZBF4rWx8Qa6J9XeS/VBi5
 EAWV1PaB8rGIx/AGwNEzntVsKSnAzAyxNIhEONyoq5KGJtcWeMFlMXksMiKvEpy5mkn0
 ZjmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=UX/I1W5orN3/fAmYEHBAqrxWk2rWbOsTKiXajV9JI70=;
 b=XohTi9CF39fSHDc6QlYWxh7G22bayf8G5izA1huSZJVgbHJXauCvJq3FNuHvwffwC4
 GGGPbdDLvt+rbKUTKiHtfWA6hvoqN638uaIIAmy6XM7T9fHXINgeXLwNao2DmQ39cZuB
 dtalE/U80fQgOeF0O7oletrOFyrEldMKG3tC3mQ+41uOSMmqy33V9oBtMAuntvIksB+v
 Gq5PeuH1YMFvwwyGpNpHT4RSOHJv0tS1zZjAsFEz4bDlF+zRSMa0yWuUHdhOIbRt/Y6J
 40E/hQM0Hq0xyDL5ws/9F3cOj98BbiFtLjBRXnouPEEqzsNcBcGqK+ZAJSqh423YYpVd
 THfQ==
X-Gm-Message-State: AKaTC03vYdEXTub+azlnJbrglQx2ktXU06mOGQf7fm8K9jn73qBEfoqAIKs8OZVbgxRY3Eb1
X-Received: by 10.98.86.157 with SMTP id h29mr1364233pfj.25.1479979622380;
 Thu, 24 Nov 2016 01:27:02 -0800 (PST)
Received: from jaghu22.svl.corp.google.com ([100.123.242.38])
 by smtp.gmail.com with ESMTPSA id q145sm58705035pfq.22.2016.11.24.01.27.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 24 Nov 2016 01:27:01 -0800 (PST)
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Subject: [PATCH linux v3 3/3] arm: dts: Add dt-binding to support ASPEED
 AST2500 PWM output on zaius
Date: Thu, 24 Nov 2016 01:26:50 -0800
Message-Id: <1479979610-2958-4-git-send-email-jaghu@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1479979610-2958-1-git-send-email-jaghu@google.com>
References: <1479979610-2958-1-git-send-email-jaghu@google.com>
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
X-List-Received-Date: Thu, 24 Nov 2016 09:27:04 -0000

The zaius platform has 4 output fans. Add binding data to control the 4 PWM
outputs on ASPEED AST2500 on the zaius platform.

Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
---
v2:
- make the pwmX entries children of the pwm_controller entry.

v3:
- changed/removed some property names to reflect the rules in binding document.

 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 40 ++++++++++++++++++++++++++++++
 arch/arm/boot/dts/aspeed-g5.dtsi           |  6 +++++
 2 files changed, 46 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
index 8ef4ece..0d5960a 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
@@ -43,6 +43,46 @@
 			gpios = <&gpio ASPEED_GPIO(H, 7) GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	pwm: pwm-controller@1e786000 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		reg = <0x1E786000 0x78>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default
+			&pinctrl_pwm2_default &pinctrl_pwm3_default>;
+		compatible = "aspeed,ast2500-pwm";
+		clocks = <&pwm_typem_clk>;
+		pwm_typem_period = <95>;
+
+		pwm_port0 {
+			pwm_port = /bits/ 8 <0x00>;
+			pwm_enable = /bits/ 8 <0x01>;
+			pwm_type = /bits/ 8 <0x00>;
+			pwm_fan_ctrl = /bits/ 8 <0xFF>;
+		};
+
+		pwm_port1 {
+			pwm_port = /bits/ 8 <0x01>;
+			pwm_enable = /bits/ 8 <0x01>;
+			pwm_type = /bits/ 8 <0x00>;
+			pwm_fan_ctrl = /bits/ 8 <0xFF>;
+		};
+
+		pwm_port2 {
+			pwm_port = /bits/ 8 <0x02>;
+			pwm_enable = /bits/ 8 <0x01>;
+			pwm_type = /bits/ 8 <0x00>;
+			pwm_fan_ctrl = /bits/ 8 <0xFF>;
+		};
+
+		pwm_port3 {
+			pwm_port = /bits/ 8 <0x03>;
+			pwm_enable = /bits/ 8 <0x01>;
+			pwm_type = /bits/ 8 <0x00>;
+			pwm_fan_ctrl = /bits/ 8 <0xFF>;
+		};
+	};
 };

 &fmc {
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 433461b..017cbb7 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -967,6 +967,12 @@
 				reg = <0x1e6e202c 0x4>;
 			};

+			pwm_typem_clk: fixed_clock0 {
+				#clock-cells = <0>;
+				compatible = "fixed-clock";
+				clock-frequency = <25000>;
+			};
+
 			sram@1e720000 {
 				compatible = "mmio-sram";
 				reg = <0x1e720000 0x9000>;	// 36K
--
2.8.0.rc3.226.g39d4020
