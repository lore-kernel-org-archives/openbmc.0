Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w77zR3jVPzDq8t
 for <openbmc@lists.ozlabs.org>; Wed, 19 Apr 2017 14:18:42 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@bajor.fuzziesquirrel.com
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-4.7 v3 1/2] ARM: configs: aspeed: Enable
 keyboard-gpio
Date: Wed, 19 Apr 2017 00:18:16 -0400
Message-Id: <1492575497-1419-2-git-send-email-bradleyb@fuzziesquirrel.com>
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
X-List-Received-Date: Wed, 19 Apr 2017 04:18:43 -0000

Some OpenBMC systems will be using keyboard-gpio so enable it
in our configs.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 arch/arm/configs/aspeed_g4_defconfig | 8 +++++++-
 arch/arm/configs/aspeed_g5_defconfig | 8 +++++++-
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/arm/configs/aspeed_g4_defconfig b/arch/arm/configs/aspeed_g4_defconfig
index 552297b..4350f67 100644
--- a/arch/arm/configs/aspeed_g4_defconfig
+++ b/arch/arm/configs/aspeed_g4_defconfig
@@ -103,7 +103,12 @@ CONFIG_FTGMAC100=y
 CONFIG_BROADCOM_PHY=y
 CONFIG_REALTEK_PHY=y
 # CONFIG_WLAN is not set
-# CONFIG_INPUT is not set
+# CONFIG_INPUT_LEDS is not set
+# CONFIG_INPUT_MOUSEDEV is not set
+CONFIG_INPUT_EVDEV=y
+# CONFIG_KEYBOARD_ATKBD is not set
+CONFIG_KEYBOARD_GPIO=y
+# CONFIG_INPUT_MOUSE is not set
 # CONFIG_SERIO is not set
 # CONFIG_VT is not set
 # CONFIG_LEGACY_PTYS is not set
@@ -138,6 +143,7 @@ CONFIG_SENSORS_ADM1275=y
 CONFIG_SENSORS_LM25066=y
 CONFIG_SENSORS_UCD9000=y
 CONFIG_SENSORS_TMP421=y
+# CONFIG_HID is not set
 # CONFIG_USB_SUPPORT is not set
 CONFIG_NEW_LEDS=y
 CONFIG_LEDS_CLASS=y
diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
index c5e7295..b6b3ca0 100644
--- a/arch/arm/configs/aspeed_g5_defconfig
+++ b/arch/arm/configs/aspeed_g5_defconfig
@@ -102,7 +102,12 @@ CONFIG_FTGMAC100=y
 CONFIG_BROADCOM_PHY=y
 CONFIG_REALTEK_PHY=y
 # CONFIG_WLAN is not set
-# CONFIG_INPUT is not set
+# CONFIG_INPUT_LEDS is not set
+# CONFIG_INPUT_MOUSEDEV is not set
+CONFIG_INPUT_EVDEV=y
+# CONFIG_KEYBOARD_ATKBD is not set
+CONFIG_KEYBOARD_GPIO=y
+# CONFIG_INPUT_MOUSE is not set
 # CONFIG_SERIO is not set
 # CONFIG_VT is not set
 # CONFIG_LEGACY_PTYS is not set
@@ -135,6 +140,7 @@ CONFIG_PMBUS=y
 CONFIG_SENSORS_LM25066=y
 CONFIG_SENSORS_UCD9000=y
 CONFIG_SENSORS_TMP421=y
+# CONFIG_HID is not set
 # CONFIG_USB_SUPPORT is not set
 CONFIG_NEW_LEDS=y
 CONFIG_LEDS_CLASS=y
-- 
1.8.3.1
