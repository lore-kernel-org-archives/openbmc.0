Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 187D81A0018
 for <openbmc@lists.ozlabs.org>; Tue,  9 Feb 2016 06:10:35 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1454958629710509.40408223799454;
 Mon, 8 Feb 2016 11:10:29 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Norman James <njames@us.ibm.com>,
	Norman James <nkskjames@gmail.com>
Subject: [PATCH linux] Fix polarity and names of LEDs
Date: Mon,  8 Feb 2016 13:10:27 -0600
Message-Id: <1454958627-1783-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1454958627-1783-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1454958627-1783-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Zoho-Virus-Status: 1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Feb 2016 19:10:36 -0000

From: Norman James <njames@us.ibm.com>

Makes names consistent with schematic.

Signed-off-by: Norman James <nkskjames@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
index 25ff8bb..8a7347b 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
@@ -100,17 +100,14 @@
 		compatible = "gpio-leds";
 
 		heartbeat {
-			gpios = <&gpio 140 GPIO_ACTIVE_LOW>;
+			gpios = <&gpio 140 GPIO_ACTIVE_HIGH>;
 		};
-
-		power {
-			gpios = <&gpio 141 GPIO_ACTIVE_LOW>;
-		};
-
 		identify {
-			gpios = <&gpio 2 GPIO_ACTIVE_LOW>;
+			gpios = <&gpio 58 GPIO_ACTIVE_LOW>;
+		};
+		beep {
+			gpios = <&gpio 111 GPIO_ACTIVE_HIGH>;
 		};
-
 	};
 };
 
-- 
2.6.4
