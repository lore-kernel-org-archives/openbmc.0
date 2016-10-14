Return-Path: <clg@kaod.org>
X-Greylist: delayed 84462 seconds by postgrey-1.36 at bilbo;
 Fri, 14 Oct 2016 23:38:42 AEDT
Received: from 9.mo1.mail-out.ovh.net (9.mo1.mail-out.ovh.net [178.32.108.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3swRwf3SFyzDt3r
 for <openbmc@lists.ozlabs.org>; Fri, 14 Oct 2016 23:38:42 +1100 (AEDT)
Received: from player726.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 4A70314B4C
 for <openbmc@lists.ozlabs.org>; Fri, 14 Oct 2016 14:38:39 +0200 (CEST)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player726.ha.ovh.net (Postfix) with ESMTPSA id 162C82A0077;
 Fri, 14 Oct 2016 14:38:35 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7 04/12] ARM: dts: aspeed-g5: update for new
 spi-nor binding
Date: Fri, 14 Oct 2016 14:37:56 +0200
Message-Id: <1476448684-6149-5-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1476448684-6149-1-git-send-email-clg@kaod.org>
References: <1476448684-6149-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 15118302478371621634
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrgeeigdehfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Fri, 14 Oct 2016 12:38:43 -0000

From: Milton Miller <miltonm@us.ibm.com>

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/arm/boot/dts/aspeed-g5.dtsi | 63 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index f73a2b18e152..eeeb5d1505f1 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -24,6 +24,69 @@
 		#size-cells = <1>;
 		ranges;
 
+		fmc: flash-controller@1e620000 {
+			reg = < 0x1e620000 0xc4
+				0x20000000 0x10000000 >;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "aspeed,ast2500-fmc";
+			status = "disabled";
+			flash@0 {
+				reg = < 0 >;
+				compatible = "jedec,spi-nor";
+				status = "disabled";
+			};
+			flash@1 {
+				reg = < 1 >;
+				compatible = "jedec,spi-nor";
+				status = "disabled";
+			};
+			flash@2 {
+				reg = < 2 >;
+				compatible = "jedec,spi-nor";
+				// compatible = "cfi,flash", "jedec,flash";
+				status = "disabled";
+			};
+		};
+
+		spi1: flash-controller@1e630000 {
+			reg = < 0x1e630000 0xc4
+				0x30000000 0x08000000 >;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "aspeed,ast2500-smc";
+			status = "disabled";
+			flash@0 {
+				reg = < 0 >;
+				compatible = "jedec,spi-nor";
+				status = "disabled";
+			};
+			flash@1 {
+				reg = < 1 >;
+				compatible = "jedec,spi-nor";
+				status = "disabled";
+			};
+		};
+
+		spi2: flash-controller@1e631000 {
+			reg = < 0x1e631000 0xc4
+				0x38000000 0x08000000 >;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "aspeed,ast2500-smc";
+			status = "disabled";
+			flash@0 {
+				reg = < 0 >;
+				compatible = "jedec,spi-nor";
+				status = "disabled";
+			};
+			flash@1 {
+				reg = < 1 >;
+				compatible = "jedec,spi-nor";
+				status = "disabled";
+			};
+		};
+
 		vic: interrupt-controller@1e6c0080 {
 			compatible = "aspeed,ast2400-vic";
 			interrupt-controller;
-- 
2.7.4
