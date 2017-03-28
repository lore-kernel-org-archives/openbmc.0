Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vsrqb3q7yzDqC2
 for <openbmc@lists.ozlabs.org>; Wed, 29 Mar 2017 00:10:51 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@bajor.fuzziesquirrel.com
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7 2/2] ARM: dts: Use IIO version of bmp180 on
 Witherspoon
Date: Tue, 28 Mar 2017 09:10:38 -0400
Message-Id: <1490706638-5782-3-git-send-email-bradleyb@fuzziesquirrel.com>
In-Reply-To: <1490706638-5782-1-git-send-email-bradleyb@fuzziesquirrel.com>
References: <1490706638-5782-1-git-send-email-bradleyb@fuzziesquirrel.com>
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
X-List-Received-Date: Tue, 28 Mar 2017 13:10:51 -0000

Early Witherspoon boards had a bmp180 but v2 boards
have a BMP280.  Switch to the IIO driver that supports both.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>

Witherspoon: attach bmp180 to hwmon
---
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index 6e7b5a4..658d9a7 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -58,6 +58,11 @@
 		enable-gpios = <&gpio ASPEED_GPIO(D, 0) GPIO_ACTIVE_HIGH>;
 		trans-gpios = <&gpio ASPEED_GPIO(R, 2) GPIO_ACTIVE_HIGH>;
 	};
+
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&bmp 1>;
+	};
 };
 
 &fmc {
@@ -160,9 +165,10 @@
 	 *    Regs 3.3VS, 1.1VCS, 5VCS, 1.8V
 	 */
 
-	bmp180@77 {
-		compatible = "bosch,bmp180";
+	bmp: bmp180@77 {
+		compatible = "bosch,bmp280";
 		reg = <0x77>;
+		#io-channel-cells = <1>;
 	};
 
 	max31785@52 {
-- 
1.8.3.1
