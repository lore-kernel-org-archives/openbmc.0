Return-Path: <benh@kernel.crashing.org>
Authentication-Results: lists.ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41Fj083mJtzF1LK;
 Wed, 27 Jun 2018 09:28:23 +1000 (AEST)
Received: from pasglop.au.ibm.com (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w5QNQ6qk022979;
 Tue, 26 Jun 2018 18:27:39 -0500
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Joel Stanley <joel@jms.id.au>
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 devicetree@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>,
 linux-kernel@vger.kernel.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH 13/14] arm: dts: OpenPower Romulus system can use coprocessor
 for FSI
Date: Wed, 27 Jun 2018 09:26:04 +1000
Message-Id: <20180626232605.13420-14-benh@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180626232605.13420-1-benh@kernel.crashing.org>
References: <20180626232605.13420-1-benh@kernel.crashing.org>
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
X-List-Received-Date: Tue, 26 Jun 2018 23:28:25 -0000

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
index 347938673c83..070b8f8f1d62 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
@@ -37,6 +37,11 @@
 			compatible = "shared-dma-pool";
 			reusable;
 		};
+
+		coldfire_memory: codefire_memory@9ef00000 {
+			reg = <0x9ef00000 0x00100000>;
+			no-map;
+		};
 	};
 
 	leds {
@@ -56,10 +61,16 @@
 	};
 
 	fsi: gpio-fsi {
-		compatible = "fsi-master-gpio", "fsi-master";
+		compatible = "ibm,fsi-master-ast2500-cf", "fsi-master";
 		#address-cells = <2>;
 		#size-cells = <0>;
-		no-gpio-delays;
+
+		memory-region = <&coldfire_memory>;
+		sram = <&sram>;
+		cvic = <&cvic>;
+
+		fw-name = "romulus";
+		fw-platform-sig = <0x526d>;
 
 		clock-gpios = <&gpio ASPEED_GPIO(AA, 0) GPIO_ACTIVE_HIGH>;
 		data-gpios = <&gpio ASPEED_GPIO(AA, 2) GPIO_ACTIVE_HIGH>;
-- 
2.17.1
