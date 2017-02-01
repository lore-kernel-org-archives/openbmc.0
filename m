Return-Path: <raltherr@google.com>
Received: from mail-pf0-x22a.google.com (mail-pf0-x22a.google.com
 [IPv6:2607:f8b0:400e:c00::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vCmBp2Ws6zDqBX
 for <openbmc@lists.ozlabs.org>; Wed,  1 Feb 2017 12:44:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="jzD6NhpU"; 
 dkim-atps=neutral
Received: by mail-pf0-x22a.google.com with SMTP id 189so114342149pfu.3
 for <openbmc@lists.ozlabs.org>; Tue, 31 Jan 2017 17:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:subject:date:message-id;
 bh=2gygxQWGdP2lGXfcESSvDUqlw5TFzE0jybJSQubwdRw=;
 b=jzD6NhpUuxueMFWUcBflabmT8RCmohlwewPvlKdHjKknFEKsmONxcLLV9pAV1hD8LJ
 HvE0txUF0hCpp/ohHNST04pvyNakkGlv70GXa0Q5hmJRfhmo7NGQPkbSe6p3II1+2iMa
 kIEOE0o1vYxSrEZ+Rnubya2hALD9TH3CWd8yomDrDMFLsMCx06SgydaJV2TV2XnrBQpZ
 DSVhpk3y3sFL98mkrYIoumfbRw6hJXSVOcdGBZGsLNAnGcbUAlDcnJyNh7pOdL6tuZUG
 Qyg2c4SEZhgD/ThJMW0Adpy5W9sftGAOAOVr52Xi1sAu0yxtCz8OLWDpsVljnGVIuPaJ
 wFbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=2gygxQWGdP2lGXfcESSvDUqlw5TFzE0jybJSQubwdRw=;
 b=Nf8cZp1h/Q28MihhU/rSUFvvY5e0/91OGzID32ILtMYm488rclzmxmDc4aMN4ItUNH
 d40EdG2YNFCj3YEWi9oAK2gToz4Oh8yfQoQ72KEXhMwa8gKxydKOEce1j9m8j6POhPaT
 oVgO3FeeKdG+GKnItM2GM2dpXPaFjb0LgB2icvOPik4QOTph3ckfAoUs3Cm8vQBsv3tX
 zbifo25Q62eHzhbAQOde61ea5b/unCrPcPqa6JmdRuyuMmP/vk1ossf8Wau8E9C6zkJh
 UOldrJfktQ77XJNSv96X8YYhyydvo7+O4ajFDmhebqJkOgmenjSnr5TIJaQ9menGcgR5
 51cw==
X-Gm-Message-State: AIkVDXIQLmVn2m4oz3GwRlqiKlWsgSvwNKXTFMPc5FRP9kuYTCPCcpO/4C/SDym+xmNOPBzC
X-Received: by 10.84.178.131 with SMTP id z3mr549078plb.176.1485913455945;
 Tue, 31 Jan 2017 17:44:15 -0800 (PST)
Received: from raltherr-linux.svl.corp.google.com ([100.123.242.49])
 by smtp.gmail.com with ESMTPSA id r17sm44475845pgg.19.2017.01.31.17.44.15
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 31 Jan 2017 17:44:15 -0800 (PST)
From: Rick Altherr <raltherr@google.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux v4] dts: Minimal device tree for Quanta Q71L BMC
Date: Tue, 31 Jan 2017 17:44:14 -0800
Message-Id: <20170201014414.31868-1-raltherr@google.com>
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
X-List-Received-Date: Wed, 01 Feb 2017 01:44:19 -0000

Supports:
  - BMC console UART
  - BMC boot flash
  - host boot flash
  - host virtual UART (host console)

Signed-off-by: Rick Altherr <raltherr@google.com>

---
Changes in v2:
 - Reserve correct VGA framebuffer location in RAM
 - Remove pinctl settings for FLBUSY and FLWP as Q71L uses those pins as
   GPIOs
 - Enable I2C masters used by Q71L
Changes in v3:
 - Remove opp prefix from dts filename as this is not an OpenPower
   machine
Changes in v4:
 - Fix commit message noise.  Time to go home.
---
 arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts | 120 +++++++++++++++++++++++++++
 1 file changed, 120 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts

diff --git a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
new file mode 100644
index 000000000000..229764c091dd
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
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
