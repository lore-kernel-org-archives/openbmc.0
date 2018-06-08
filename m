Return-Path: <clg@kaod.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=178.32.124.100; helo=7.mo5.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 4202 seconds by postgrey-1.36 at bilbo;
 Sat, 09 Jun 2018 00:16:12 AEST
Received: from 7.mo5.mail-out.ovh.net (7.mo5.mail-out.ovh.net [178.32.124.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 412PbJ0f1HzDqJl
 for <openbmc@lists.ozlabs.org>; Sat,  9 Jun 2018 00:16:11 +1000 (AEST)
Received: from player798.ha.ovh.net (unknown [10.109.108.82])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id 9F3A71BF5CB
 for <openbmc@lists.ozlabs.org>; Fri,  8 Jun 2018 15:00:16 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-TOU-1-49-10.w86-201.abo.wanadoo.fr
 [86.201.141.10]) (Authenticated sender: clg@kaod.org)
 by player798.ha.ovh.net (Postfix) with ESMTPSA id E83EA5400B6;
 Fri,  8 Jun 2018 15:00:11 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Cc: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 1/2] ARM: dts: aspeed: Add "spi-max-frequency" property
Date: Fri,  8 Jun 2018 14:59:59 +0200
Message-Id: <20180608130000.22627-2-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20180608130000.22627-1-clg@kaod.org>
References: <20180608130000.22627-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 9070249651462834946
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedthedrjeelgdehhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Jun 2018 14:16:13 -0000

Keep the FMC controller chips at a safe 50 MHz rate but use 100 MHz
for the PNOR.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/arm/boot/dts/aspeed-ast2500-evb.dts         | 2 ++
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts    | 2 ++
 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts     | 2 ++
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 3 +++
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts       | 2 ++
 arch/arm/boot/dts/aspeed-g4.dtsi                 | 2 ++
 arch/arm/boot/dts/aspeed-g5.dtsi                 | 7 +++++++
 7 files changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-ast2500-evb.dts b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
index c0a7f51e7eb6..6b78e40d3259 100644
--- a/arch/arm/boot/dts/aspeed-ast2500-evb.dts
+++ b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
@@ -41,6 +41,7 @@
 		status = "okay";
 		m25p,fast-read;
 		label = "bmc";
+		spi-max-frequency = <50000000>;
 #include "openbmc-flash-layout.dtsi"
 	};
 };
@@ -51,6 +52,7 @@
 		status = "okay";
 		m25p,fast-read;
 		label = "pnor";
+		spi-max-frequency = <100000000>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
index 9e2bb8053f74..76098ebc03bf 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
@@ -66,6 +66,7 @@
 		status = "okay";
 		m25p,fast-read;
 		label = "bmc";
+		spi-max-frequency = <50000000>;
 #include "openbmc-flash-layout.dtsi"
 	};
 };
@@ -78,6 +79,7 @@
 	flash@0 {
 		status = "okay";
 		m25p,fast-read;
+		spi-max-frequency = <50000000>;
 		label = "pnor";
 	};
 };
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
index 0fdf08077ed3..fd909ebfed5b 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
@@ -93,6 +93,7 @@
 		status = "okay";
 		m25p,fast-read;
 		label = "bmc";
+		spi-max-frequency = <50000000>;
 #include "openbmc-flash-layout.dtsi"
 
 	};
@@ -107,6 +108,7 @@
 		status = "okay";
 		m25p,fast-read;
 		label = "pnor";
+		spi-max-frequency = <100000000>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index 214718b7784d..ee7e99bbbc05 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -190,6 +190,7 @@
 		status = "okay";
 		label = "bmc";
 		m25p,fast-read;
+		spi-max-frequency = <50000000>;
 #include "openbmc-flash-layout.dtsi"
 	};
 
@@ -197,6 +198,7 @@
 		status = "okay";
 		label = "alt";
 		m25p,fast-read;
+		spi-max-frequency = <50000000>;
 	};
 };
 
@@ -209,6 +211,7 @@
 		status = "okay";
 		label = "pnor";
 		m25p,fast-read;
+		spi-max-frequency = <100000000>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
index 085926935574..1eae30727fc2 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
@@ -124,6 +124,7 @@
 		status = "okay";
 		label = "bmc";
 		m25p,fast-read;
+		spi-max-frequency = <50000000>;
 #include "openbmc-flash-layout.dtsi"
 	};
 };
@@ -137,6 +138,7 @@
 		status = "okay";
 		label = "pnor";
 		m25p,fast-read;
+		spi-max-frequency = <100000000>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index 9354ac92d928..fd14eb1b8c22 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -60,6 +60,7 @@
 			flash@0 {
 				reg = < 0 >;
 				compatible = "jedec,spi-nor";
+				spi-max-frequency = <50000000>;
 				status = "disabled";
 			};
 		};
@@ -75,6 +76,7 @@
 			flash@0 {
 				reg = < 0 >;
 				compatible = "jedec,spi-nor";
+				spi-max-frequency = <50000000>;
 				status = "disabled";
 			};
 		};
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index f7c33fbcdaee..f155c32aefbc 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -60,16 +60,19 @@
 			flash@0 {
 				reg = < 0 >;
 				compatible = "jedec,spi-nor";
+				spi-max-frequency = <50000000>;
 				status = "disabled";
 			};
 			flash@1 {
 				reg = < 1 >;
 				compatible = "jedec,spi-nor";
+				spi-max-frequency = <50000000>;
 				status = "disabled";
 			};
 			flash@2 {
 				reg = < 2 >;
 				compatible = "jedec,spi-nor";
+				spi-max-frequency = <50000000>;
 				status = "disabled";
 			};
 		};
@@ -85,11 +88,13 @@
 			flash@0 {
 				reg = < 0 >;
 				compatible = "jedec,spi-nor";
+				spi-max-frequency = <50000000>;
 				status = "disabled";
 			};
 			flash@1 {
 				reg = < 1 >;
 				compatible = "jedec,spi-nor";
+				spi-max-frequency = <50000000>;
 				status = "disabled";
 			};
 		};
@@ -105,11 +110,13 @@
 			flash@0 {
 				reg = < 0 >;
 				compatible = "jedec,spi-nor";
+				spi-max-frequency = <50000000>;
 				status = "disabled";
 			};
 			flash@1 {
 				reg = < 1 >;
 				compatible = "jedec,spi-nor";
+				spi-max-frequency = <50000000>;
 				status = "disabled";
 			};
 		};
-- 
2.13.6
