Return-Path: <xow@google.com>
Received: from mail-pf0-x229.google.com (mail-pf0-x229.google.com
 [IPv6:2607:f8b0:400e:c00::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t7nXW34q9zDvNS
 for <openbmc@lists.ozlabs.org>; Wed,  2 Nov 2016 10:30:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=orDggcki; 
 dkim-atps=neutral
Received: by mail-pf0-x229.google.com with SMTP id i88so9369446pfk.2
 for <openbmc@lists.ozlabs.org>; Tue, 01 Nov 2016 16:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JPEIODFlUVuOub7uFBanxYcxJ8RjIX5TLGs8dssXEjk=;
 b=orDggckiWz2WnybKAG9E5VNGuLjEs3HFyOoStKpve8m7mO2+hJlkIUO2Aqcp7AxBJG
 7uUvEKYRh2q9X5A9FtX5d55gFdmyC7IHuyLlbwN8smuXd0LCvpHpij2sdnRJbfZQV9hO
 umYE3eT4uzOOAMcEiaao8QKHOUFTb1NltJPCHDnqbUPWDXaOCW611DiLCZ0MBZ3K1/6s
 RtXjkx/RVIMOQK22OhPAkDwwW+LHWHYZ7By0hmvaZATdSchurAXUaAh5FRbW4Sz4MXv9
 +svFpmHi6FDYw8CYCfIeGrCzMZ+T+0T/8+OhfBf7pSwSt6wRoMyfAn/3wfcNk1YgWbLy
 IPtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JPEIODFlUVuOub7uFBanxYcxJ8RjIX5TLGs8dssXEjk=;
 b=Zr1Cii3r4gOKoo9bQcVBCkeVNlYqMXBfO4jxPmmyyGXeLpJ8aB2ssShumeKdPrc0sk
 3jhlRyL9Hf6cpwwRyrLwvEzUCXGOnQcINw2KgNY/2GeDTPe52zLb7ynlMypkzDjROK3/
 K+EB1oVgLfmFY6KNiwv3XMkqiaJa6MbXYgRNWmSizKI0dUswx+WvWgqNYNJjFss0cNH0
 a4vKJuwmIWzMBDo12HO77imbQkjdPhx/7LNDh10O9Dou5zll28pxCR1ZRL13eBGzbOyZ
 i+CoSub9fjvUoM+Nd/zSQplDaIXSDoxtvHjunXPiYNdAlbzpmn70O/MDM+eLfR4l4sqx
 qVNg==
X-Gm-Message-State: ABUngve0eu8/Ncq1eWolILLISgcF0wwU9GzUfF8DH9pXa6OssKlHXe9geGlYslU8icnV2RN4
X-Received: by 10.98.200.203 with SMTP id i72mr985539pfk.181.1478043031546;
 Tue, 01 Nov 2016 16:30:31 -0700 (PDT)
Received: from pewter.svl.corp.google.com ([100.123.242.121])
 by smtp.gmail.com with ESMTPSA id f8sm15486594pfa.72.2016.11.01.16.30.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 01 Nov 2016 16:30:30 -0700 (PDT)
From: Xo Wang <xow@google.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux] ARM: dts: aspeed-g5: Update zaius with new spi-nor
 binding
Date: Tue,  1 Nov 2016 16:30:25 -0700
Message-Id: <1478043025-78465-1-git-send-email-xow@google.com>
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
X-List-Received-Date: Tue, 01 Nov 2016 23:30:36 -0000

Zaius has one flash module for the BMC firmware, one flash module for
the host firmware, and one more flash module on SPI2.

Signed-off-by: Xo Wang <xow@google.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 66 ++++++++++++------------------
 1 file changed, 26 insertions(+), 40 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
index eef045b..2004615 100644
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
 
@@ -85,6 +45,32 @@
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
