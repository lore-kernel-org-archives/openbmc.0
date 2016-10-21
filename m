Return-Path: <clg@kaod.org>
Received: from 6.mo69.mail-out.ovh.net (6.mo69.mail-out.ovh.net
 [46.105.50.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t0ZQQ3rK5zDvZh
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 16:45:18 +1100 (AEDT)
Received: from player798.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id 7BE9B7EAF
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 07:45:15 +0200 (CEST)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player798.ha.ovh.net (Postfix) with ESMTPSA id 45063540069;
 Fri, 21 Oct 2016 07:45:11 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev4.7 v2 4/9] ARM: dts: aspeed-g5: update for new
 spi-nor binding
Date: Fri, 21 Oct 2016 07:44:45 +0200
Message-Id: <1477028690-27239-5-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1477028690-27239-1-git-send-email-clg@kaod.org>
References: <1477028690-27239-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12351966405885922050
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrheelgddutdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Fri, 21 Oct 2016 05:45:18 -0000

From: Milton Miller <miltonm@us.ibm.com>

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/arm/boot/dts/aspeed-g5.dtsi | 63 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 7e18a8e2c083..d96f09a9eb1a 100644
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
