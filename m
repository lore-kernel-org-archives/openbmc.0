Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id B61A11A0D5C
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2016 13:30:16 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1452565812387126.58023227346246;
 Mon, 11 Jan 2016 18:30:12 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH docs] added chassis, leds, buttons, inventory, and sensors
Date: Mon, 11 Jan 2016 20:30:10 -0600
Message-Id: <1452565810-30792-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1452565810-30792-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1452565810-30792-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 12 Jan 2016 02:30:17 -0000

From: Norman James <njames@us.ibm.com>

---
 dbus-interfaces.md | 138 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 138 insertions(+)

diff --git a/dbus-interfaces.md b/dbus-interfaces.md
index 62363a2..28fe410 100644
--- a/dbus-interfaces.md
+++ b/dbus-interfaces.md
@@ -14,3 +14,141 @@ methods:
   *  `sendMessage(seq : byte, netfn : byte, lun : byte, cmd : byte, cc : byte, data : array[byte])`
    
   *  `setAttention()`
+
+# Chassis Control
+
+## `/org/openbmc/control/chassis0`
+
+signals:
+
+
+methods:
+
+  *  `(state : int) = getPowerState()`
+
+  *  `powerOff()`
+
+  *  `powerOn()`
+
+  *  `softPowerOff()`
+
+  *  `reboot()`
+  
+  *  `softReboot()`
+
+  *  `setIdentify()`
+
+  *  `clearIdentify()`
+
+  *  `setPowerPolicy(policy : int)`
+
+  *  `setDebugMode()`
+
+properties:
+
+  *  `reboot`
+
+
+# Sensors
+
+## `/org/openbmc/sensors/<type>/<name hierarchy>`
+
+signals:
+
+  *  `Warning(value : variant)`
+
+  *  `Critical(value : variant)`
+
+methods:
+
+  *  `(value : variant) = getValue()`
+
+  *  `setValue(value : variant)`
+
+  *  `resetThresholdState()`
+
+properties:
+
+  *  `error`
+
+  *  `units`
+
+  *  `value`
+
+  *  `critical_upper`
+
+  *  `critical_lower`
+
+  *  `warning_upper`
+
+  *  `warning_lower`
+
+  *  `threshold_state`
+
+  *  `worst_threshold_state`
+
+# Inventory
+
+## `/org/openbmc/inventory/<item hierarchy>`
+
+signals:
+
+
+methods:
+
+  *  `setPresent(present : string)`
+
+  *  `setFault(fault : string)`
+
+  *  `update(dict ( key : string, data : variant ) )`
+
+properties:
+
+  *  `fault`
+
+  *  `fru_type`
+
+  *  `is_fru`
+
+  *  `present1`
+
+  *  `version`
+
+
+# Buttons
+
+## `/org/openbmc/buttons/<button_name>`
+
+signals:
+
+  *  `Pressed`
+
+  *  `PressedLong`
+
+  *  `Released`
+
+methods:
+
+  *  `simPress`
+
+# LEDs
+
+## `/org/openbmc/control/leds/<led_name>`
+
+methods:
+
+  *  `setOn()`
+
+  *  `setOff()`
+
+  *  `setBlinkSlow()`
+
+  *  `setBlinkFast()`
+
+properties:
+
+  *  `color`
+
+  *  `state`
+
+
-- 
2.6.4
