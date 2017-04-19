Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w77zR55gTzDq99
 for <openbmc@lists.ozlabs.org>; Wed, 19 Apr 2017 14:18:43 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@bajor.fuzziesquirrel.com
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-4.7 v3 2/2] ARM: dts: Enable checkstop and cooling
 gpio keys
Date: Wed, 19 Apr 2017 00:18:17 -0400
Message-Id: <1492575497-1419-3-git-send-email-bradleyb@fuzziesquirrel.com>
In-Reply-To: <1492575497-1419-1-git-send-email-bradleyb@fuzziesquirrel.com>
References: <1492575497-1419-1-git-send-email-bradleyb@fuzziesquirrel.com>
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
X-List-Received-Date: Wed, 19 Apr 2017 04:18:44 -0000

Enable gpio-keys events for the checkstop and water/air cooled
gpios for use by applications on the Witherspoon system.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index e3a7b77..aa1708e 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -31,6 +31,26 @@
 		};
 	};
 
+	gpio-keys@0 {
+		compatible = "gpio-keys";
+
+		air-water {
+			label = "air-water";
+			gpios = <&gpio ASPEED_GPIO(B, 5) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(B, 5)>;
+		};
+	};
+
+	gpio-keys@1 {
+		compatible = "gpio-keys";
+
+		checkstop {
+			label = "checkstop";
+			gpios = <&gpio ASPEED_GPIO(J, 2) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(J, 2)>;
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
-- 
1.8.3.1
