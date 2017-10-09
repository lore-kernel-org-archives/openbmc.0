Return-Path: <clg@kaod.org>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.33.73; helo=20.mo4.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 2221 seconds by postgrey-1.36 at bilbo;
 Tue, 10 Oct 2017 01:19:15 AEDT
Received: from 20.mo4.mail-out.ovh.net (20.mo4.mail-out.ovh.net [46.105.33.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y9j6W5SqTzDr6n
 for <openbmc@lists.ozlabs.org>; Tue, 10 Oct 2017 01:19:15 +1100 (AEDT)
Received: from player746.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id C34CBD99D7
 for <openbmc@lists.ozlabs.org>; Mon,  9 Oct 2017 15:42:09 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-1-2231-173.w90-76.abo.wanadoo.fr
 [90.76.52.173]) (Authenticated sender: clg@kaod.org)
 by player746.ha.ovh.net (Postfix) with ESMTPSA id A63B0500081;
 Mon,  9 Oct 2017 15:42:06 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [linux dev-4.13 1/6] ARM: dts: aspeed: import OpenBMC flash layout
Date: Mon,  9 Oct 2017 15:41:03 +0200
Message-Id: <20171009134108.15860-2-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171009134108.15860-1-clg@kaod.org>
References: <20171009134108.15860-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 8984962732110154498
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelledrleelgdehvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Oct 2017 14:19:16 -0000

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/arm/boot/dts/aspeed-ast2500-evb.dts           |  1 +
 arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi | 26 ++++++++++++++++++++++
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts      |  1 +
 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts       |  2 ++
 4 files changed, 30 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi

diff --git a/arch/arm/boot/dts/aspeed-ast2500-evb.dts b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
index dc7d73b02b76..68fd0ec54f3e 100644
--- a/arch/arm/boot/dts/aspeed-ast2500-evb.dts
+++ b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
@@ -26,6 +26,7 @@
 		status = "okay";
 		m25p,fast-read;
 		label = "bmc";
+#include "aspeed-bmc-opp-flash-layout.dtsi"
 	};
 };
 
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi b/arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi
new file mode 100644
index 000000000000..4bcfd1bf8dc5
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi
@@ -0,0 +1,26 @@
+		label = "bmc";
+		partitions {
+				#address-cells = < 1 >;
+				#size-cells = < 1 >;
+				compatible = "fixed-partitions";
+				u-boot@0 {
+					reg = < 0 0x60000 >;
+					label = "u-boot";
+				};
+				u-boot-env@60000 {
+					reg = < 0x60000 0x20000 >;
+					label = "u-boot-env";
+				};
+				kernel@80000 {
+					reg = < 0x80000 0x440000 >;
+					label = "kernel";
+				};
+				rofs@0c0000 {
+					reg = < 0x4c0000 0x1740000 >;
+					label = "rofs";
+				};
+				rwfs@1c00000 {
+					reg = < 0x1c00000 0x400000 >;
+					label = "rwfs";
+				};
+		};
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
index e61cac42e2f5..baf9b02d66b6 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
@@ -33,6 +33,7 @@
 		status = "okay";
 		m25p,fast-read;
 		label = "bmc";
+#include "aspeed-bmc-opp-flash-layout.dtsi"
 	};
 };
 
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
index 5d543d64ace9..440b010a9652 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
@@ -37,6 +37,8 @@
 		status = "okay";
 		m25p,fast-read;
 		label = "bmc";
+#include "aspeed-bmc-opp-flash-layout.dtsi"
+
 	};
 };
 
-- 
2.13.6
