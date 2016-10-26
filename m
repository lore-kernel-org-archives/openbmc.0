Return-Path: <clg@kaod.org>
X-Greylist: delayed 693 seconds by postgrey-1.36 at bilbo;
 Wed, 26 Oct 2016 17:58:09 AEDT
Received: from 2.mo68.mail-out.ovh.net (2.mo68.mail-out.ovh.net
 [46.105.52.162])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t3gp95x9bzDvp6
 for <openbmc@lists.ozlabs.org>; Wed, 26 Oct 2016 17:58:09 +1100 (AEDT)
Received: from player788.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id E0EE297E7
 for <openbmc@lists.ozlabs.org>; Wed, 26 Oct 2016 08:58:06 +0200 (CEST)
Received: from hermes.kaod.org.com (bad36-1-78-202-132-1.fbx.proxad.net
 [78.202.132.1]) (Authenticated sender: clg@kaod.org)
 by player788.ha.ovh.net (Postfix) with ESMTPSA id C6B0A180085;
 Wed, 26 Oct 2016 08:58:03 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7 3/8] ARM: dts: aspeed: remove previous iBT
 definitions
Date: Wed, 26 Oct 2016 08:57:42 +0200
Message-Id: <1477465067-19034-4-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1477465067-19034-1-git-send-email-clg@kaod.org>
References: <1477465067-19034-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 6052274949743741698
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrieekgdduudekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Wed, 26 Oct 2016 06:58:10 -0000

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/arm/boot/dts/aspeed-g4.dtsi | 6 ------
 arch/arm/boot/dts/aspeed-g5.dtsi | 6 ------
 2 files changed, 12 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index 68eadec4ab34..cfe5c95d863b 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -857,12 +857,6 @@
 				clocks = <&clk_apb>;
 			};
 
-			ibt: ibt@1e789140 {
-				compatible = "aspeed,bt-host";
-				reg = <0x1e789140 0x18>;
-				interrupts = <8>;
-			};
-
 			wdt1: wdt@1e785000 {
 				compatible = "aspeed,ast2400-wdt";
 				reg = <0x1e785000 0x1c>;
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index d72aea7ab8f2..163393a748ed 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -991,12 +991,6 @@
 				clocks = <&clk_apb>;
 			};
 
-			ibt: ibt@1e789140 {
-				compatible = "aspeed,bt-host";
-				reg = <0x1e789140 0x18>;
-				interrupts = <8>;
-			};
-
 			wdt1: wdt@1e785000 {
 				compatible = "aspeed,ast2500-wdt";
 				reg = <0x1e785000 0x1c>;
-- 
2.7.4
