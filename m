Return-Path: <clg@kaod.org>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=188.165.44.50; helo=5.mo4.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Received: from 5.mo4.mail-out.ovh.net (5.mo4.mail-out.ovh.net [188.165.44.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y9hg53SLhzDqlv
 for <openbmc@lists.ozlabs.org>; Tue, 10 Oct 2017 00:58:55 +1100 (AEDT)
Received: from player746.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id 2E3FED71BD
 for <openbmc@lists.ozlabs.org>; Mon,  9 Oct 2017 15:42:19 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-1-2231-173.w90-76.abo.wanadoo.fr
 [90.76.52.173]) (Authenticated sender: clg@kaod.org)
 by player746.ha.ovh.net (Postfix) with ESMTPSA id 0D68D50006C;
 Mon,  9 Oct 2017 15:42:16 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [linux dev-4.13 4/6] ARM: dts: aspeed: add a AHB clock to the G4 SMC
 controllers
Date: Mon,  9 Oct 2017 15:41:06 +0200
Message-Id: <20171009134108.15860-5-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171009134108.15860-1-clg@kaod.org>
References: <20171009134108.15860-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 8987777483368794882
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
X-List-Received-Date: Mon, 09 Oct 2017 13:58:57 -0000

We will need the AHB frequency to set the HCLK settings in the SMC
controller to optimize the reads.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/arm/boot/dts/aspeed-g4.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index 60ab04aa75ea..50d664058344 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -54,6 +54,7 @@
 			#address-cells = <1>;
 			#size-cells = <0>;
 			compatible = "aspeed,ast2400-fmc";
+			clocks = <&syscon ASPEED_CLK_AHB>;
 			status = "disabled";
 			interrupts = <19>;
 			flash@0 {
@@ -69,6 +70,7 @@
 			#address-cells = <1>;
 			#size-cells = <0>;
 			compatible = "aspeed,ast2400-spi";
+			clocks = <&syscon ASPEED_CLK_AHB>;
 			status = "disabled";
 			flash@0 {
 				reg = < 0 >;
-- 
2.13.6
