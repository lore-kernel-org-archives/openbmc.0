Return-Path: <clg@kaod.org>
Received: from 9.mo1.mail-out.ovh.net (9.mo1.mail-out.ovh.net [178.32.108.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3swRwk2hSxzDt3S
 for <openbmc@lists.ozlabs.org>; Fri, 14 Oct 2016 23:38:46 +1100 (AEDT)
Received: from player726.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 88C7014BAA
 for <openbmc@lists.ozlabs.org>; Fri, 14 Oct 2016 14:38:43 +0200 (CEST)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player726.ha.ovh.net (Postfix) with ESMTPSA id 4E6972A0075;
 Fri, 14 Oct 2016 14:38:39 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7 05/12] ARM: dts: aspeed-g5: update witherspoon
 for new spi-nor binding
Date: Fri, 14 Oct 2016 14:37:57 +0200
Message-Id: <1476448684-6149-6-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1476448684-6149-1-git-send-email-clg@kaod.org>
References: <1476448684-6149-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 15119428377937611522
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
X-List-Received-Date: Fri, 14 Oct 2016 12:38:46 -0000

From: Milton Miller <miltonm@us.ibm.com>

Witherspoon has two flash modules for the BMC firmware and one for the
host.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 28 ++++++++++++++----------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index fcc880a80ee0..53af584e8f63 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -19,20 +19,24 @@
 	memory {
 		reg = <0x80000000 0x40000000>;
 	};
+};
 
-	ahb {
-		bmc_pnor: fmc@1e620000 {
-			reg = < 0x1e620000 0x94
-				0x20000000 0x02000000 >;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "aspeed,ast2500-fmc";
-			flash@0 {
-				reg = < 0 >;
-				compatible = "jedec,spi-nor" ;
+&fmc {
+	status = "okay";
+	flash@0 {
+		status = "okay";
 #include "aspeed-bmc-opp-flash-layout.dtsi"
-			};
-		};
+	};
+	flash@1 {
+		status = "okay";
+		label = "alt";
+	};
+};
+
+&spi1 {
+	status = "okay";
+	flash@0 {
+		status = "okay";
 	};
 };
 
-- 
2.7.4
