Return-Path: <raltherr@google.com>
Received: from mail-pg0-x233.google.com (mail-pg0-x233.google.com
 [IPv6:2607:f8b0:400e:c05::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vCm6J1MwnzDqC6
 for <openbmc@lists.ozlabs.org>; Wed,  1 Feb 2017 12:40:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="btYEXe0v"; 
 dkim-atps=neutral
Received: by mail-pg0-x233.google.com with SMTP id 14so104338994pgg.1
 for <openbmc@lists.ozlabs.org>; Tue, 31 Jan 2017 17:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:subject:date:message-id;
 bh=FJFrYpG4avRGBuNhrdzFYSSvDNkXNZB283Q1EBxHO5Y=;
 b=btYEXe0vpjFkJ7vQatCRXg2Tp1GtetfjC43HSmI9Fx4r7GBkJYEhdu8sd47RetuKil
 NeBxfqmPRmHzaaO8Ja8IKOfaAe/Nl/FWHsi2WGTkMGp0kn86L0vrkygTmXnsgAf32ASJ
 RVw8pZgY0D1z1XDNVXJs9JsHd8q8Nz+3itT1DVXmyRhhVlW+SIELyjaBc5yj8FfV42ZU
 cldfr84oygiBMEFNtlj6veF+oQENaX6vNik7OPJLG1odv0aI4ZFoM4gcu/XLf8yahHV6
 VHOm4p2RN6TGoK24A/8Qxn36O2RCrwd/V5gHa5mZXpETc1X6EOJNl4lg8zBJL8aKu5y+
 WMbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=FJFrYpG4avRGBuNhrdzFYSSvDNkXNZB283Q1EBxHO5Y=;
 b=fFip9qR7THHu64DY5XivMcz8yTXBngT8WbCBotFkW05H/U1est4zzwfe4VopbmXPMY
 c6JJKcjWFEdcT2ElbQ87xHeGnQmOguch8/2aex5YS/3WgagsGShxwGn7n32SZ9wY9fvu
 CQczT9fe4pZKuaRgQPBTNV0durGY8hUzmVxf6xs7f7BtJJoSckS89jpylKWwGhesvygh
 8iqHIE6L9g6DalUrpNycALXQEWkGci+v9iUF2LgxzyAtS0XNzqUDHlOKkJfN2ScZXkOZ
 qsFvUTTbUQh24BEtVBykm7rpQW/QPXOCmPdV6+Xk83wB9ck7VQDRoyPLwR4wrDeOT04U
 pFgg==
X-Gm-Message-State: AIkVDXL8bZeXYE88VJHRRTwhQfYVBmgd0AqWehIik9FoDyYJYmSYipWluJyOrFDEcmyXsj3p
X-Received: by 10.99.51.76 with SMTP id z73mr411177pgz.137.1485913221042;
 Tue, 31 Jan 2017 17:40:21 -0800 (PST)
Received: from raltherr-linux.svl.corp.google.com ([100.123.242.49])
 by smtp.gmail.com with ESMTPSA id a25sm44436455pgd.26.2017.01.31.17.40.20
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 31 Jan 2017 17:40:20 -0800 (PST)
From: Rick Altherr <raltherr@google.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux v3] dts: Minimal device tree for Quanta Q71L BMC
Date: Tue, 31 Jan 2017 17:40:19 -0800
Message-Id: <20170201014019.28427-1-raltherr@google.com>
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
X-List-Received-Date: Wed, 01 Feb 2017 01:40:24 -0000

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
Changes in v3:
 - Remove opp prefix from dts filename as this is not an OpenPower
   machine

Signed-off-by: Rick Altherr <raltherr@google.com>

Remove opp prefix

Signed-off-by: Rick Altherr <raltherr@google.com>
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
