Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w3rgR4PwGzDq5W
 for <openbmc@lists.ozlabs.org>; Fri, 14 Apr 2017 05:38:27 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@bajor.fuzziesquirrel.com
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-4.7 v2 2/2] ARM: dts: Enable checkstop and cooling
 gpio keys
Date: Thu, 13 Apr 2017 15:37:28 -0400
Message-Id: <1492112248-28396-3-git-send-email-bradleyb@fuzziesquirrel.com>
In-Reply-To: <1492112248-28396-1-git-send-email-bradleyb@fuzziesquirrel.com>
References: <1491961541-10864-1-git-send-email-bradleyb@fuzziesquirrel.com>
 <1492112248-28396-1-git-send-email-bradleyb@fuzziesquirrel.com>
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
X-List-Received-Date: Thu, 13 Apr 2017 19:38:27 -0000

Enable gpio-keys events for the checkstop and water/air cooled
gpios for use by applications on the Witherspoon system.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index e3a7b77..4a68b30 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -31,6 +31,22 @@
 		};
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		air-water {
+			label = "air-water";
+			gpios = <&gpio ASPEED_GPIO(B, 5) GPIO_ACTIVE_LOW>;
+			linux,code = <&gpio ASPEED_GPIO(B, 5) GPIO_ACTIVE_LOW>;
+		};
+
+		checkstop {
+			label = "checkstop";
+			gpios = <&gpio ASPEED_GPIO(J, 2) GPIO_ACTIVE_LOW>;
+			linux,code = <&gpio ASPEED_GPIO(J, 2) GPIO_ACTIVE_LOW>;
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
-- 
1.8.3.1
