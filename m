Return-Path: <clg@kaod.org>
X-Greylist: delayed 430 seconds by postgrey-1.36 at bilbo;
 Thu, 15 Sep 2016 16:39:59 AEST
Received: from 1.mo177.mail-out.ovh.net (1.mo177.mail-out.ovh.net
 [178.33.107.143])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sZTL74p7czDsWb
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 16:39:59 +1000 (AEST)
Received: from player699.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id F1C061000EEA
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 08:33:01 +0200 (CEST)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player699.ha.ovh.net (Postfix) with ESMTPSA id BD2E0240067;
 Thu, 15 Sep 2016 08:32:58 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [RFC PATCH linux dev-4.7 6/6] ARM: dts: aspeed: Enable BT IPMI BMC
 device
Date: Thu, 15 Sep 2016 08:32:26 +0200
Message-Id: <1473921146-19509-7-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1473921146-19509-1-git-send-email-clg@kaod.org>
References: <1473921146-19509-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 4655877593805523714
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeluddrjeeggddutdekucdltddurdefledtrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Thu, 15 Sep 2016 06:40:00 -0000

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/arm/boot/dts/aspeed-g4.dtsi | 6 ++++++
 arch/arm/boot/dts/aspeed-g5.dtsi | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index eb0122fa34c2..4480b858103e 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -391,6 +391,12 @@
 				clocks = <&clk_apb>;
 			};
 
+			ibt: ibt@1e789140 {
+				compatible = "aspeed,bt-bmc";
+				reg = <0x1e789140 0x18>;
+				interrupts = <8>;
+			};
+
 			wdt1: wdt@1e785000 {
 				compatible = "aspeed,ast2400-wdt";
 				reg = <0x1e785000 0x1c>;
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 79abac876abf..7c781fb613f8 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -255,6 +255,12 @@
 				clocks = <&clk_apb>;
 			};
 
+			ibt: ibt@1e789140 {
+				compatible = "aspeed,bt-bmc";
+				reg = <0x1e789140 0x18>;
+				interrupts = <8>;
+			};
+
 			wdt1: wdt@1e785000 {
 				compatible = "aspeed,ast2500-wdt";
 				reg = <0x1e785000 0x1c>;
-- 
2.7.4
