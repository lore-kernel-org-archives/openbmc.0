Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rNsgx3W2mzDqG1
 for <openbmc@lists.ozlabs.org>; Tue,  7 Jun 2016 10:21:45 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465258901194791.3987207085369;
 Mon, 6 Jun 2016 17:21:41 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Xo Wang <xow@google.com>
Subject: [PATCH linux] ARM: dts: aspeed: Add FMC and phosphor flash layout to
 AST2500 EVB
Date: Mon,  6 Jun 2016 19:21:39 -0500
Message-Id: <20160607002139.28417-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20160607002139.28417-1-openbmc-patches@stwcx.xyz>
References: <20160607002139.28417-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 07 Jun 2016 00:21:50 -0000

From: Xo Wang <xow@google.com>

This is required for init to mount OpenBMC root and rw overlay.

Change-Id: I347bfac0632d199af60b303e22ee21f2716e7669
Google-Bug-Id: 28535971
Signed-off-by: Xo Wang <xow@google.com>
---
 arch/arm/boot/dts/aspeed-ast2500-evb.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-ast2500-evb.dts b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
index 87cfa4f..28b0045 100644
--- a/arch/arm/boot/dts/aspeed-ast2500-evb.dts
+++ b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
@@ -18,6 +18,21 @@
 	memory {
 		reg = <0x80000000 0x20000000>;
 	};
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
+#include "aspeed-bmc-opp-flash-layout.dtsi"
+			};
+		};
+	};
 };
 
 &uart5 {
-- 
2.8.3
