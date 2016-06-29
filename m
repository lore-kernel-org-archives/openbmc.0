Return-Path: <raltherr@google.com>
Received: from mail-pa0-x22c.google.com (mail-pa0-x22c.google.com
 [IPv6:2607:f8b0:400e:c03::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rfr7k1rytzDqw0
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 04:00:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=Xe9kZeVC; 
 dkim-atps=neutral
Received: by mail-pa0-x22c.google.com with SMTP id hl6so19666308pac.2
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jun 2016 11:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=50Y3PacbnnJdkhc2EF8Wgxrcq5iboHgyl8vz+bHURL4=;
 b=Xe9kZeVCNGgdLB6D2wJ1KBsWHWPXMIDKP6z1oBP2HVKVQRf7D2ogxiM9jWXRELT1Ra
 TgsLtkRRgoLdqE5G8PvZ+1YjtOYt+qejzhGvcGggGsCTnR9BV6SR+7FF3OMyuRJ42Hoy
 dmUPyKXTlDEIZTEA2CL7Yja8kUAvgg+oodAM1456iarURfAPfLDqNCWUl8kN+kvzJqmF
 mjmZB0z4NDr0x3FYHuFd9RyicQZHQxh18P3MHap+di8YANwWFY4Km+If+Czy2HW7nMGO
 UaIEHyAZjhoML0OyNfIqZUnQtXFDBOegI6DiVQx0Wg9o0S/1bvjWgil0Xf112U79ug66
 EGjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=50Y3PacbnnJdkhc2EF8Wgxrcq5iboHgyl8vz+bHURL4=;
 b=QAK0WJFCMlMvga7AXkH58KIbAwPfAfN1i9yEZW4GnocFo4WX+6GjcqWgkfgjvYbc1m
 oot/WgpwiAX3/9atLrNHL3kVzTzP/3ffvic7lzCPpK6tC4IejOlJCZhqXjRoPc1qM+UB
 blw0zaXYysCUUUJN996+c4QBKU97plgPreNBqf1mkc6PFqJrj6p0igrupsht63pK5znh
 BaF1TMhTLLGSJ93eUFRgOPOF715yLb+8+QsjqKGjvTNYGDFq31Hj7E1xCx5C17QT2f+2
 P1iuMmaM6SOXlS+9rzXhPbnb8j7Ddg9zciuWkWVWPpA8ySqJcV2VDwTizSM9n+YIphdb
 YHIQ==
X-Gm-Message-State: ALyK8tLPuQyPnjEzOwXoHpFY35o5fsYgPiKDM5bjx5F9vd7e2m0By9IVgDPi+HUtpP/0fC6W
X-Received: by 10.66.27.174 with SMTP id u14mr13912739pag.119.1467223247663;
 Wed, 29 Jun 2016 11:00:47 -0700 (PDT)
Received: from raltherr-linux.mtv.corp.google.com ([172.18.64.20])
 by smtp.gmail.com with ESMTPSA id ln4sm7513693pab.38.2016.06.29.11.00.46
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 29 Jun 2016 11:00:46 -0700 (PDT)
From: Rick Altherr <raltherr@google.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 2/3] ARM: dts: Refactor aspeed-ast2500-evb.dts into a dtsi
Date: Wed, 29 Jun 2016 11:00:42 -0700
Message-Id: <1467223243-9156-3-git-send-email-raltherr@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1467223243-9156-1-git-send-email-raltherr@google.com>
References: <1467223243-9156-1-git-send-email-raltherr@google.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Jun 2016 18:00:50 -0000

Booting a normal image on the AST2500 EVB doesn't require a flash
layout but OpenBMC does.  Move the contents of the EVB dts into a dtsi
so it can be extended in an OpenBMC-specific dts.

Signed-off-by: Rick Altherr <raltherr@google.com>
---
 arch/arm/boot/dts/aspeed-ast2500-evb.dts  | 103 +-----------------------------
 arch/arm/boot/dts/aspeed-ast2500-evb.dtsi | 102 +++++++++++++++++++++++++++++
 2 files changed, 103 insertions(+), 102 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed-ast2500-evb.dtsi

diff --git a/arch/arm/boot/dts/aspeed-ast2500-evb.dts b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
index a80a6b9..f08b552 100644
--- a/arch/arm/boot/dts/aspeed-ast2500-evb.dts
+++ b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
@@ -1,104 +1,3 @@
 /dts-v1/;
 
-#include "aspeed-g5.dtsi"
-
-/ {
-	model = "AST2500 EVB";
-	compatible = "aspeed,ast2500-evb", "aspeed,ast2500";
-
-	aliases {
-		serial4 = &uart5;
-	};
-
-	chosen {
-		stdout-path = &uart5;
-		bootargs = "console=ttyS4,115200 earlyprintk";
-	};
-
-	memory {
-		reg = <0x80000000 0x20000000>;
-	};
-
-	ahb {
-		bmc_pnor: fmc@1e620000 {
-			reg = < 0x1e620000 0x94
-				0x20000000 0x02000000 >;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "aspeed,fmc";
-			flash@0 {
-				reg = < 0 >;
-				compatible = "jedec,spi-nor" ;
-			};
-		};
-	};
-};
-
-&uart5 {
-	status = "okay";
-};
-
-&mac0 {
-	status = "okay";
-};
-
-&i2c0 {
-	status = "okay";
-};
-
-&i2c1 {
-	status = "okay";
-};
-
-&i2c2 {
-	status = "okay";
-};
-
-&i2c3 {
-	status = "okay";
-};
-
-&i2c4 {
-	status = "okay";
-};
-
-&i2c5 {
-	status = "okay";
-
-//	eeprom@50 {
-//		compatible = "atmel,24c08";
-//		reg = <0xa0>;
-//	};
-};
-
-&i2c6 {
-	status = "okay";
-};
-
-&i2c7 {
-	status = "okay";
-};
-
-&i2c8 {
-	status = "okay";
-};
-
-&i2c9 {
-	status = "okay";
-};
-
-&i2c10 {
-	status = "okay";
-};
-
-&i2c11 {
-	status = "okay";
-};
-
-&i2c12 {
-	status = "okay";
-};
-
-&i2c13 {
-	status = "okay";
-};
+#include "aspeed-ast2500-evb.dtsi"
diff --git a/arch/arm/boot/dts/aspeed-ast2500-evb.dtsi b/arch/arm/boot/dts/aspeed-ast2500-evb.dtsi
new file mode 100644
index 0000000..6cc4932
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-ast2500-evb.dtsi
@@ -0,0 +1,102 @@
+#include "aspeed-g5.dtsi"
+
+/ {
+	model = "AST2500 EVB";
+	compatible = "aspeed,ast2500-evb", "aspeed,ast2500";
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
+		reg = <0x80000000 0x20000000>;
+	};
+
+	ahb {
+		bmc_pnor: fmc@1e620000 {
+			reg = < 0x1e620000 0x94
+				0x20000000 0x02000000 >;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "aspeed,fmc";
+			flash@0 {
+				reg = < 0 >;
+				compatible = "jedec,spi-nor" ;
+			};
+		};
+	};
+};
+
+&uart5 {
+	status = "okay";
+};
+
+&mac0 {
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
+
+//	eeprom@50 {
+//		compatible = "atmel,24c08";
+//		reg = <0xa0>;
+//	};
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
+&i2c9 {
+	status = "okay";
+};
+
+&i2c10 {
+	status = "okay";
+};
+
+&i2c11 {
+	status = "okay";
+};
+
+&i2c12 {
+	status = "okay";
+};
+
+&i2c13 {
+	status = "okay";
+};
-- 
2.8.0.rc3.226.g39d4020
