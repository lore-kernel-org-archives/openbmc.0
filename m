Return-Path: <raltherr@google.com>
Received: from mail-pg0-x22d.google.com (mail-pg0-x22d.google.com
 [IPv6:2607:f8b0:400e:c05::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vCm1z09mtzDqC6
 for <openbmc@lists.ozlabs.org>; Wed,  1 Feb 2017 12:36:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="GyU+5TBF"; 
 dkim-atps=neutral
Received: by mail-pg0-x22d.google.com with SMTP id 3so45692961pgj.3
 for <openbmc@lists.ozlabs.org>; Tue, 31 Jan 2017 17:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:subject:date:message-id;
 bh=zcn/AUWfCtuVZ6phNkmM6TOFWM9FOcsnpTs+wPDuYP0=;
 b=GyU+5TBFD9Krlx1RcUQsl3MMMBjh8/iJXwWKZmpFTAidt7f2oK5AllH6f0542+mg8l
 uHkipfvXVUepRLhasyJKbDr8ufqsfe9FgX/88v+ghM+tRYS/kOgQU60BjFbX2VIKeUl8
 WMwXA5GkN9znRyTAyGS17qGgeHkVpxkctugnTfShRBm7TJEynYtalgr+aJp1Vucgg8Tj
 Z78miGx26tcNvS4x4t2hpf4IZcG4cwFyNbGkMXg7RpEHBLUpfgmdRvPn68wmbzKGaHCQ
 No3iSXNwp6cy95qnxZQMIhJ8bncqYMcXIgeCo/j2Q4gK+KFdVStT4CCvsz5Gml5jP2Bn
 rcEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=zcn/AUWfCtuVZ6phNkmM6TOFWM9FOcsnpTs+wPDuYP0=;
 b=hcvNl1dJGZodTTfo/uhXODbqJGaUg/y8vqU7oCdgWt9VakD28ualDn4DhomzS5JlEC
 IUGRsd0NO3WL0vwe0aGlZgjRey8fhV7p4iX0HCLRE4YunUcXXd0KmgrcqmNnJQXluxEJ
 uhKDOAYX9rhBX0iXjcPrDrr/WU1r16y5KDDGAibO14V5y4Xvy7CTsdwMfnkZg0Uqc7Sa
 R6PmVioIq98aZVmf2ZohiyK7Ox4WjaA/6ljsw46BpKCjyykRNE+Bam/Q2UL5JNY5//mt
 0Z23CxVk3E1c2+JWSIH7NdYuj6agYelwK0I1MrhGtuWSlEUjp54p7X9WKimDt6WuXCJB
 Ycig==
X-Gm-Message-State: AIkVDXIMC3Cd+PWEqD1vcj1iMAW0hlsrCrbu4ahrvVS3FOsDe860zYckqIzEAB1tFSpIcqXY
X-Received: by 10.98.26.210 with SMTP id a201mr402646pfa.57.1485912996443;
 Tue, 31 Jan 2017 17:36:36 -0800 (PST)
Received: from raltherr-linux.svl.corp.google.com ([100.123.242.49])
 by smtp.gmail.com with ESMTPSA id l12sm44140735pfj.37.2017.01.31.17.36.35
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 31 Jan 2017 17:36:35 -0800 (PST)
From: Rick Altherr <raltherr@google.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux v2] dts: Minimal device tree for Quanta Q71L BMC
Date: Tue, 31 Jan 2017 17:36:34 -0800
Message-Id: <20170201013634.26965-1-raltherr@google.com>
X-Mailer: git-send-email 2.11.0.483.g087da7b7c-goog
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
X-List-Received-Date: Wed, 01 Feb 2017 01:36:39 -0000

Supports:
  - BMC console UART
  - BMC boot flash
  - host boot flash
  - host virtual UART (host console)

--
Changes in v2:
 - Reserve correct VGA framebuffer location in RAM
 - Remove pinctl settings for FLBUSY and FLWP as Q71L uses those pins as
   GPIOs
 - Enable I2C masters used by Q71L

Signed-off-by: Rick Altherr <raltherr@google.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-quanta-q71l.dts | 120 +++++++++++++++++++++++
 1 file changed, 120 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-opp-quanta-q71l.dts

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-quanta-q71l.dts b/arch/arm/boot/dts/aspeed-bmc-opp-quanta-q71l.dts
new file mode 100644
index 000000000000..229764c091dd
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-quanta-q71l.dts
@@ -0,0 +1,120 @@
+/dts-v1/;
+
+#include "aspeed-g4.dtsi"
+#include <dt-bindings/gpio/aspeed-gpio.h>
+
+/ {
+	model = "Quanta Q71L BMC";
+	compatible = "quanta,q71l-bmc", "aspeed,ast2400";
+
+	aliases {
+		serial4 = &uart5;
+	};
+
+	chosen {
+		stdout-path = &uart5;
+		bootargs = "console=ttyS4,115200 earlyprintk";
+	};
+
+	memory {
+		reg = <0x40000000 0x8000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		vga_memory: framebuffer@47800000 {
+			no-map;
+			reg = <0x47800000 0x00800000>; /* 8MB */
+		};
+	};
+
+	ahb {
+		bmc_pnor: fmc@1e620000 {
+			reg = < 0x1e620000 0x94
+				0x20000000 0x02000000 >;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "aspeed,ast2400-fmc";
+			aspeed,fmc-has-dma;
+			interrupts = <19>;
+			flash@0 {
+				reg = < 0 >;
+				compatible = "jedec,spi-nor" ;
+#include "aspeed-bmc-opp-flash-layout.dtsi"
+			};
+		};
+
+		host_pnor: spi@1e630000 {
+			reg = < 0x1e630000 0x18
+				0x30000000 0x01000000 >;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "aspeed,ast2400-smc";
+			flash {
+				reg = < 0 >;
+				compatible = "jedec,spi-nor" ;
+				label = "pnor";
+			};
+		};
+	};
+};
+
+&pinctrl {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_vgahs_default &pinctrl_vgavs_default
+			&pinctrl_ddcclk_default &pinctrl_ddcdat_default>;
+};
+
+&mac0 {
+	status = "okay";
+
+	use-ncsi;
+	no-hw-checksum;
+};
+
+&uart5 {
+	status = "okay";
+};
+
+&i2c0 {
+	status = "okay";
+};
+
+&i2c1 {
+	status = "okay";
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
+};
+
+&i2c7 {
+	status = "okay";
+};
+
+&i2c8 {
+	status = "okay";
+};
+
+&vuart {
+	status = "okay";
+};
-- 
2.11.0.483.g087da7b7c-goog
