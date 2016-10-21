Return-Path: <clg@kaod.org>
Received: from 7.mo69.mail-out.ovh.net (7.mo69.mail-out.ovh.net [46.105.50.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t0ZYS5dptzDsxR
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 16:51:24 +1100 (AEDT)
Received: from player798.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id 834007E37
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 07:45:29 +0200 (CEST)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player798.ha.ovh.net (Postfix) with ESMTPSA id 5464D540069;
 Fri, 21 Oct 2016 07:45:26 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev4.7 v2 8/9] ARM: dts: aspeed: update SMC controller
 nodes supporting DMAs
Date: Fri, 21 Oct 2016 07:44:49 +0200
Message-Id: <1477028690-27239-9-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1477028690-27239-1-git-send-email-clg@kaod.org>
References: <1477028690-27239-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12355907054880918274
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
X-List-Received-Date: Fri, 21 Oct 2016 05:51:25 -0000

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts | 2 ++
 arch/arm/boot/dts/aspeed-g5.dtsi              | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
index 5c689613e5bd..a6ebab1bfe2b 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
@@ -43,6 +43,8 @@
 			#address-cells = <1>;
 			#size-cells = <0>;
 			compatible = "aspeed,ast2400-fmc";
+			aspeed,fmc-has-dma;
+			interrupts = <19>;
 			flash@0 {
 				reg = < 0 >;
 				compatible = "jedec,spi-nor" ;
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index d96f09a9eb1a..d72aea7ab8f2 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -31,6 +31,8 @@
 			#size-cells = <0>;
 			compatible = "aspeed,ast2500-fmc";
 			status = "disabled";
+			aspeed,fmc-has-dma;
+			interrupts = <19>;
 			flash@0 {
 				reg = < 0 >;
 				compatible = "jedec,spi-nor";
-- 
2.7.4
