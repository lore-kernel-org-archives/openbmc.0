Return-Path: <xow@google.com>
Received: from mail-pf0-x232.google.com (mail-pf0-x232.google.com
 [IPv6:2607:f8b0:400e:c00::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t7qK90D2yzDvLj
 for <openbmc@lists.ozlabs.org>; Wed,  2 Nov 2016 11:50:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=OveWLg6G; 
 dkim-atps=neutral
Received: by mail-pf0-x232.google.com with SMTP id i88so502869pfk.2
 for <openbmc@lists.ozlabs.org>; Tue, 01 Nov 2016 17:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9+O4s2rywtLx/mHLvDQBjXxisMdU1mEChxp8FS/Rt8w=;
 b=OveWLg6GX6Hw9WIbWwEZsG1wW28i2u7+SJyxZRejc2D0U+7URqDhS8JP4NPA5R7ws3
 AzNmttGSjnUmUUWhkC1khvtsSi0PBIXDSlo4W18u8a4pktcB18EqpPNKsYAAnbDJmGQ3
 MCnIZfbPyHOjJke1rOrcBXbGqjgTXoSRlxE6hZ2vSI1UmZrZCrHwtEV4f9nSVrXWkcFh
 /Pp+41MJd7Gs4ajArNYWj8J1c9Ztte9j4Jwo/rntuvpQ/OARzTnFzwjGLDC2cCdr4LmS
 cW3x47ZoEgMhuSqEnlTQx8K52gBAiY+bPvPPrQY7gDgmjrIi2aG7Rkjy0+eNJaoNEPmc
 DJPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9+O4s2rywtLx/mHLvDQBjXxisMdU1mEChxp8FS/Rt8w=;
 b=TX+q7vhwlIAsqlURGcnsCSepoqTdrNBshzb5ch/XpbO5MXn8k/3i+TH13N8XgyJ0kG
 Q/gWmPKIBVxtItVm+nGNSL90OzIYc6HRenXdy5T5j89FagBoWFn7hiPjj81sxWU+PgrS
 WVa66VUYIBMDuoBa6y5K/Fqa+5XDr4ejHTYez7r4G9SEh8U4K1NeYCTAeAsOskLgIfPQ
 tA+tyfTokkMo0LRUo52iHIODwWQI+sD+wFaOXfFLwgqkvoMDGmNflV/J6ENTkm2oQBu6
 7fk4QtT71BfACZtmNPPeMWxnk5/bvTXN0kW3TTGeENtHX+j4FVgIAP65OjZMdd9XvLNR
 L7pQ==
X-Gm-Message-State: ABUngvfy9JjmnUzmTK9uom1M4jRgncjz9OjfEf8rQWzgAdYjJirG/Dp3h39veiuY6agMRMg9
X-Received: by 10.98.206.207 with SMTP id y198mr1702379pfg.70.1478047851253;
 Tue, 01 Nov 2016 17:50:51 -0700 (PDT)
Received: from pewter.svl.corp.google.com ([100.123.242.121])
 by smtp.gmail.com with ESMTPSA id yk6sm44854138pab.43.2016.11.01.17.50.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 01 Nov 2016 17:50:50 -0700 (PDT)
From: Xo Wang <xow@google.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux v2] ARM: dts: aspeed: zaius: Update with new spi-nor
 binding
Date: Tue,  1 Nov 2016 17:50:46 -0700
Message-Id: <1478047846-44588-1-git-send-email-xow@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Wed, 02 Nov 2016 00:50:53 -0000

Zaius has one flash module for the BMC firmware, one flash module for
the host firmware, and one more flash module on SPI2.

Signed-off-by: Xo Wang <xow@google.com>

Changes since v1:
- Added SPI2 pinctrl selectors
---
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 73 ++++++++++++++----------------
 1 file changed, 33 insertions(+), 40 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
index eef045b..9e59649 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
@@ -20,46 +20,6 @@
 		reg = <0x80000000 0x40000000>;
 	};
 
-	ahb {
-		bmc_pnor: fmc@1e620000 {
-			reg = < 0x1e620000 0xc4
-				0x20000000 0x04000000 >;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "aspeed,ast2500-fmc";
-			flash@0 {
-				reg = < 0 >;
-				compatible = "jedec,spi-nor" ;
-#include "aspeed-bmc-opp-flash-layout.dtsi"
-			};
-		};
-
-		host_pnor: spi@1e630000 {
-			reg = < 0x1e630000 0xc4
-				0x30000000 0x04000000 >;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "aspeed,ast2500-smc";
-			flash@0 {
-				reg = < 0 >;
-				compatible = "jedec,spi-nor" ;
-				label = "pnor";
-			};
-		};
-
-		data_pnor: spi@1e631000 {
-			reg = < 0x1e631000 0xc4
-				0x38000000 0x00800000 >;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "aspeed,ast2500-smc";
-			flash@0 {
-				reg = < 0 >;
-				compatible = "jedec,spi-nor" ;
-			};
-		};
-	};
-
 	leds {
 		compatible = "gpio-leds";
 
@@ -85,6 +45,39 @@
 	};
 };
 
+&fmc {
+	status = "okay";
+	flash@0 {
+		status = "okay";
+#include "aspeed-bmc-opp-flash-layout.dtsi"
+	};
+};
+
+&spi1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi1_default>;
+
+	flash@0 {
+		status = "okay";
+		label = "pnor";
+	};
+};
+
+&spi2 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi2ck_default
+		     &pinctrl_spi2cs0_default
+		     &pinctrl_spi2cs1_default
+		     &pinctrl_spi2miso_default
+		     &pinctrl_spi2mosi_default>;
+
+	flash@0 {
+		status = "okay";
+	};
+};
+
 &uart5 {
 	status = "okay";
 };
-- 
2.8.0.rc3.226.g39d4020
