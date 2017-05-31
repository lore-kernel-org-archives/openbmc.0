Return-Path: <joel.stan@gmail.com>
Received: from mail-pg0-x242.google.com (mail-pg0-x242.google.com
 [IPv6:2607:f8b0:400e:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wdBps2Z72zDq5W
 for <openbmc@lists.ozlabs.org>; Wed, 31 May 2017 23:56:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="gu204rpJ"; 
 dkim-atps=neutral
Received: by mail-pg0-x242.google.com with SMTP id s62so1995387pgc.0
 for <openbmc@lists.ozlabs.org>; Wed, 31 May 2017 06:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=KHL5K6fvHY8mteSecUUPXyyK9PqE9P1KolU5gPe7380=;
 b=gu204rpJqId/p/TWgwCLDCghEWFsC5DMJea98wwx6XvTJ0GWdFhSfRxfP7lB6LtJn9
 gjrU5MH9BZnVvIRetlMEtLjkY+fh5X1jKDIKRqqPtvAX0zcccoUb6h2GikARZuB52tOQ
 La+QwMfP6dBTWra7aYeSRXy4ehzPPsV5cZ1LdHIyyQSIWa4slgWkiWa/CgPuPNNW8qHS
 EWZTF+d8dvVooi6kj9EGcz7EZaz8l0nr9DKV/LiyouVnA+f2OxLIXRNDvV/x1SJ08oNP
 9EpoHJIHFSi3KcDuWXUlH1u9MISA+cE047OKUeCxNbnodOLWEibtLm41gCTR8ltHf0mr
 hH5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=KHL5K6fvHY8mteSecUUPXyyK9PqE9P1KolU5gPe7380=;
 b=twCZAC4msM3w0r4lhMbNvXR093QHxSGElS4E3UnQzZmQHk9Sb3DllRPI0C3Wd7Ifxr
 QptRBE4lUE9aDDygYVuLBb7AagfQ4tQB7NgxtX+c7X+SW79+5Is/guA7dXeW3k1RdMeH
 rx0ttJRratBrifhEDwveFVCKMm3Ss80DwXaMVXZxND1el3NmYl3ZdU/RC7Zm0ndH1AOh
 j14dNNBOPq+V+bJAaDpTGGvP3zTYafUd4nsZ3XwTHNRZZAS7EV7HRdJcQe06DYR0W0iE
 tTi28lGq8sdTLwmrPBc1CAJOu38A1a0KBmrrgVE/EsQjjNB1vQJ4ORt4EsX/WS6W8rJ0
 n3LA==
X-Gm-Message-State: AODbwcC73sjYK8dE/LfciGmZIVz15epgd7B8TqCUj9PcKnTywjjSjP5/
 0IoPw20hVFpcwg==
X-Received: by 10.84.194.34 with SMTP id g31mr52477114pld.89.1496238994802;
 Wed, 31 May 2017 06:56:34 -0700 (PDT)
Received: from aurora.jms.id.au ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id b2sm24846872pgc.16.2017.05.31.06.56.30
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Wed, 31 May 2017 06:56:34 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Wed, 31 May 2017 23:26:26 +0930
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>,
 Eddie James <eajames@linux.vnet.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Andrew Jeffery <andrew@aj.id.au>, Mykola Kostenok <c_mykolak@mellanox.com>
Subject: [PATCH linux dev-4.10] arm: dts: aspeed: Update old style flash nodes
Date: Wed, 31 May 2017 23:26:14 +0930
Message-Id: <20170531135614.7170-1-joel@jms.id.au>
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
X-List-Received-Date: Wed, 31 May 2017 13:56:38 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Reorganize flash controllers into the ast2400 device tree to match what
is used upstream. This moves the nodes from the machine dts to the
common dtsi.

This also affected the newly added Mellanox MSN device tree, which is
also updated in this series.

Barreleye wasn't booting with the new aspeed-smc driver.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
[joel:
  - rework commit message
  - add missing m25p,fast-read properties
  - add pinmux for pnor
  - use upstream node names
     * bmc_pnor becomes fmc
     * host_pnor becomes spi
  - fix the facebook machine
]
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
Eddie, I reworked your patch for you. Please check it looks okay.

Cedric, can you please double check I didn't stuff anything up?

Andrew, can you reivew for pinmux correctness?

Mykola, please reply with "Acked-by: Mykola Kostenok <c_mykolak@mellanox.com>"
if the changes to the Mellanox device tree look okay to you. They should be
functionally the same as before.

 arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts  | 19 ++++-----
 arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts  | 20 ++++-----
 arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts | 49 ++++++++++------------
 arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts | 42 ++++++++-----------
 arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts  | 51 ++++++++---------------
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts  | 57 ++++++++++----------------
 arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts   | 43 ++++++++-----------
 arch/arm/boot/dts/aspeed-g4.dtsi               | 34 +++++++++++++++
 8 files changed, 142 insertions(+), 173 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
index 8df116ea8594..ff5058ee8834 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
@@ -18,21 +18,16 @@
 	memory {
 		reg = <0x80000000 0x3f000000>;
 	};
+};
 
-	ahb {
-		bmc_pnor: fmc@1e620000 {
-			reg = < 0x1e620000 0x94
-				0x20000000 0x02000000 >;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "aspeed,ast2400-fmc";
-			flash@0 {
-				reg = < 0 >;
-				compatible = "jedec,spi-nor" ;
+&fmc {
+	status = "okay";
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
 #include "aspeed-bmc-facebook-cmm-flash-layout.dtsi"
-			};
-		};
 	};
+
 };
 
 &uart1 {
diff --git a/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts b/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
index 649964a3726a..c71a6dbe1410 100644
--- a/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
@@ -22,20 +22,14 @@
 		reg = <0x80000000 0x20000000>;
 	};
 
-	ahb {
-		bmc_pnor: fmc@1e620000 {
-			reg = < 0x1e620000 0xc4
-				0x20000000 0x02000000 >;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "aspeed,ast2500-fmc";
-			interrupts = <19>;
-			flash@0 {
-				reg = < 0 >;
-				compatible = "jedec,spi-nor" ;
+};
+
+&fmc {
+	status = "okay";
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
 #include "aspeed-bmc-mellanox-msn-flash-layout.dtsi"
-			};
-		};
 	};
 };
 
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
index be1f2d120fee..9f7098876ecb 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
@@ -31,34 +31,6 @@
 		};
 	};
 
-	ahb {
-		bmc_pnor: fmc@1e620000 {
-			reg = < 0x1e620000 0x94
-				0x20000000 0x02000000 >;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "aspeed,ast2400-fmc";
-			flash@0 {
-				reg = < 0 >;
-				compatible = "jedec,spi-nor" ;
-#include "aspeed-bmc-opp-flash-layout.dtsi"
-			};
-		};
-
-		host_pnor: spi@1e630000 {
-			reg = < 0x1e630000 0x18
-				0x30000000 0x02000000 >;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "aspeed,ast2400-spi";
-			flash@0 {
-				reg = < 0 >;
-				compatible = "jedec,spi-nor" ;
-				label = "pnor";
-			};
-		};
-	};
-
 	leds {
 		compatible = "gpio-leds";
 
@@ -76,6 +48,27 @@
 	};
 };
 
+&fmc {
+	status = "okay";
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+#include "aspeed-bmc-opp-flash-layout.dtsi"
+	};
+};
+
+&spi {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi1_default>;
+
+	flash@0 {
+		m25p,fast-read;
+		status = "okay";
+		label = "pnor";
+	};
+};
+
 &pinctrl {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_flbusy_default &pinctrl_flwp_default
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
index fe63621365fd..430622c86ef7 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
@@ -50,34 +50,26 @@
 			gpios = <&gpio ASPEED_GPIO(A, 2) GPIO_ACTIVE_LOW>;
 		};
 	};
+};
 
-	ahb {
-		fmc@1e620000 {
-			reg = < 0x1e620000 0x94
-				0x20000000 0x02000000 >;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "aspeed,ast2400-fmc";
-
-			flash@0 {
-				reg = < 0 >;
-				compatible = "jedec,spi-nor" ;
+&fmc {
+	status = "okay";
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
 #include "aspeed-bmc-opp-flash-layout.dtsi"
-			};
-		};
+	};
+};
 
-		spi@1e630000 {
-			reg = < 0x1e630000 0x18
-				0x30000000 0x02000000 >;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "aspeed,ast2400-spi";
-			flash@0 {
-				reg = < 0 >;
-				compatible = "jedec,spi-nor" ;
-				label = "pnor";
-			};
-		};
+&spi {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi1_default>;
+
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "pnor";
 	};
 };
 
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
index 121612a8776e..b64edad3e050 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
@@ -30,42 +30,27 @@
 			reg = <0x5f000000 0x01000000>; /* 16MB */
 		};
 	};
+};
+
+&fmc {
+	status = "okay";
 
-	ahb {
-
-		bmc_pnor: fmc@1e620000 {
-			reg = < 0x1e620000 0x94
-				0x20000000 0x02000000 >;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "aspeed,ast2400-fmc";
-			aspeed,fmc-has-dma;
-			interrupts = <19>;
-			clocks = <&clk_ahb>;
-			clock-names = "ahb";
-			flash@0 {
-				reg = < 0 >;
-				compatible = "jedec,spi-nor" ;
-				m25p,fast-read;
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
 #include "aspeed-bmc-opp-flash-layout.dtsi"
-			};
-		};
+	};
+};
 
-		host_pnor: spi@1e630000 {
-			reg = < 0x1e630000 0x18
-				0x30000000 0x02000000 >;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "aspeed,ast2400-spi";
-			clocks = <&clk_ahb>;
-			clock-names = "ahb";
-			flash {
-				reg = < 0 >;
-				compatible = "jedec,spi-nor" ;
-				label = "pnor";
-				m25p,fast-read;
-			};
-		};
+&spi {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi1_default>;
+
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "pnor";
 	};
 };
 
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
index b4faa1d79460..60792f6ff7ec 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
@@ -47,42 +47,6 @@
                 };
         };
 
-	ahb {
-		bmc_pnor: fmc@1e620000 {
-			reg = < 0x1e620000 0x94
-				0x20000000 0x02000000 >;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "aspeed,ast2400-fmc";
-			aspeed,fmc-has-dma;
-			interrupts = <19>;
-			clocks = <&clk_ahb>;
-			clock-names = "ahb";
-			flash@0 {
-				reg = < 0 >;
-				compatible = "jedec,spi-nor" ;
-				m25p,fast-read;
-#include "aspeed-bmc-opp-flash-layout.dtsi"
-			};
-		};
-
-		host_pnor: spi@1e630000 {
-			reg = < 0x1e630000 0x18
-				0x30000000 0x02000000 >;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "aspeed,ast2400-spi";
-			clocks = <&clk_ahb>;
-			clock-names = "ahb";
-			flash {
-				reg = < 0 >;
-				compatible = "jedec,spi-nor" ;
-				label = "pnor";
-				m25p,fast-read;
-			};
-		};
-	};
-
 	gpio-fsi {
 		compatible = "fsi-master-gpio", "fsi-master";
 
@@ -94,6 +58,27 @@
 	};
 };
 
+&fmc {
+	status = "okay";
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+#include "aspeed-bmc-opp-flash-layout.dtsi"
+	};
+};
+
+&spi {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi1_default>;
+
+	flash@0 {
+		status = "okay";
+		label = "pnor";
+		m25p,fast-read;
+	};
+};
+
 &pinctrl {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_flbusy_default &pinctrl_flwp_default
diff --git a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
index 713246090906..50be8dd921cf 100644
--- a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
@@ -30,35 +30,26 @@
 			reg = <0x47800000 0x00800000>; /* 8MB */
 		};
 	};
+};
 
-	ahb {
-		bmc_pnor: fmc@1e620000 {
-			reg = < 0x1e620000 0x94
-				0x20000000 0x02000000 >;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "aspeed,ast2400-fmc";
-			aspeed,fmc-has-dma;
-			interrupts = <19>;
-			flash@0 {
-				reg = < 0 >;
-				compatible = "jedec,spi-nor" ;
+&fmc {
+	status = "okay";
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
 #include "aspeed-bmc-opp-flash-layout.dtsi"
-			};
-		};
+	};
+};
 
-		host_pnor: spi@1e630000 {
-			reg = < 0x1e630000 0x18
-				0x30000000 0x01000000 >;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "aspeed,ast2400-smc";
-			flash {
-				reg = < 0 >;
-				compatible = "jedec,spi-nor" ;
-				label = "pnor";
-			};
-		};
+&spi {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi1_default>;
+
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "pnor";
 	};
 };
 
diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index d8827d522dfe..9a329cee72bf 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -44,6 +44,40 @@
 		#size-cells = <1>;
 		ranges;
 
+		fmc: fmc@1e620000 {
+			reg = < 0x1e620000 0x94
+				0x20000000 0x02000000 >;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "aspeed,ast2400-fmc";
+			status = "disabled";
+			aspeed,fmc-has-dma;
+			interrupts = <19>;
+			clocks = <&clk_ahb>;
+			clock-names = "ahb";
+			flash@0 {
+				reg = < 0 >;
+				compatible = "jedec,spi-nor" ;
+				status = "disabled";
+			};
+		};
+
+		spi: spi@1e630000 {
+			reg = < 0x1e630000 0x18
+				0x30000000 0x02000000 >;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "aspeed,ast2400-spi";
+			status = "disabled";
+			clocks = <&clk_ahb>;
+			clock-names = "ahb";
+			flash@0 {
+				reg = < 0 >;
+				compatible = "jedec,spi-nor" ;
+				status = "disabled";
+			};
+		};
+
 		vic: interrupt-controller@1e6c0080 {
 			compatible = "aspeed,ast2400-vic";
 			interrupt-controller;
-- 
2.11.0
