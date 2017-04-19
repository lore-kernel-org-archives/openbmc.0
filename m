Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w7XTB3qNtzDq8t
 for <openbmc@lists.ozlabs.org>; Thu, 20 Apr 2017 05:42:22 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@bajor.fuzziesquirrel.com
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@aj.id.au
Subject: [PATCH linux dev-4.7 v4 2/2] ARM: dts: Enable checkstop and cooling
 gpio keys
Date: Wed, 19 Apr 2017 15:42:02 -0400
Message-Id: <1492630922-26202-3-git-send-email-bradleyb@fuzziesquirrel.com>
In-Reply-To: <1492630922-26202-1-git-send-email-bradleyb@fuzziesquirrel.com>
References: <1492630922-26202-1-git-send-email-bradleyb@fuzziesquirrel.com>
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
X-List-Received-Date: Wed, 19 Apr 2017 19:42:22 -0000

Enable gpio-keys events for the checkstop and water/air cooled
gpios for use by applications on the Witherspoon system.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index e3a7b77..750420b 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -31,6 +31,26 @@
 		};
 	};
 
+	air-water {
+		compatible = "gpio-keys";
+
+		air-water {
+			label = "air-water";
+			gpios = <&gpio ASPEED_GPIO(B, 5) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(B, 5)>;
+		};
+	};
+
+	checkstop {
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
