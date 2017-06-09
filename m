Return-Path: <clg@kaod.org>
Received: from 12.mo6.mail-out.ovh.net (12.mo6.mail-out.ovh.net
 [178.32.125.228])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wkjbq4jCTzDqLG
 for <openbmc@lists.ozlabs.org>; Fri,  9 Jun 2017 23:21:11 +1000 (AEST)
Received: from player787.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id 23916E32DB
 for <openbmc@lists.ozlabs.org>; Fri,  9 Jun 2017 15:12:58 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-1-10652-153.w90-89.abo.wanadoo.fr
 [90.89.238.153]) (Authenticated sender: clg@kaod.org)
 by player787.ha.ovh.net (Postfix) with ESMTPSA id 06000600086;
 Fri,  9 Jun 2017 15:12:55 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 5/5] ARM: dts: aspeed: witherspoon: Add pca9552 device
Date: Fri,  9 Jun 2017 15:12:29 +0200
Message-Id: <1497013949-8786-6-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1497013949-8786-1-git-send-email-clg@kaod.org>
References: <1497013949-8786-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 11446461403337034498
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeljedrieehgdehlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Fri, 09 Jun 2017 13:21:12 -0000

All pins of the pca9552 are used as GPIOs.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 85 ++++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index 3001597d42d9..b80bf4706b66 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -2,6 +2,7 @@
 
 #include "aspeed-g5.dtsi"
 #include <dt-bindings/gpio/aspeed-gpio.h>
+#include <dt-bindings/leds/leds-pca955x.h>
 
 / {
 	model = "Witherspoon BMC";
@@ -290,6 +291,90 @@
 &i2c11 {
 	status = "okay";
 
+	pca9552: pca9552@60 {
+		compatible = "nxp,pca9552";
+		reg = <0x60>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio-line-names = "PS_SMBUS_RESET_N", "APSS_RESET_N",
+		"GPU0_TH_OVERT_N_BUFF",	"GPU1_TH_OVERT_N_BUFF",
+		"GPU2_TH_OVERT_N_BUFF", "GPU3_TH_OVERT_N_BUFF",
+		"GPU4_TH_OVERT_N_BUFF",	"GPU5_TH_OVERT_N_BUFF",
+		"GPU0_PWR_GOOD_BUFF", "GPU1_PWR_GOOD_BUFF",
+		"GPU2_PWR_GOOD_BUFF", "GPU3_PWR_GOOD_BUFF",
+		"GPU4_PWR_GOOD_BUFF", "GPU5_PWR_GOOD_BUFF",
+		"12V_BREAKER_FLT_N", "THROTTLE_UNLATCHED_N";
+
+		gpio@0 {
+			reg = <0>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+		gpio@1 {
+			reg = <1>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+		gpio@2 {
+			reg = <2>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+		gpio@3 {
+			reg = <3>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+		gpio@4 {
+			reg = <4>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+		gpio@5 {
+			reg = <5>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+		gpio@6 {
+			reg = <6>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+		gpio@7 {
+			reg = <7>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+		gpio@8 {
+			reg = <8>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+		gpio@9 {
+			reg = <9>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+		gpio@10 {
+			reg = <10>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+		gpio@11 {
+			reg = <11>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+		gpio@12 {
+			reg = <12>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+		gpio@13 {
+			reg = <13>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+		gpio@14 {
+			reg = <14>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+		gpio@15 {
+			reg = <15>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+	};
+
 	/* TPM */
 	/* 9552 */
 
-- 
2.7.4
