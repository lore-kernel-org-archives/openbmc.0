Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 035211A072C
 for <openbmc@lists.ozlabs.org>; Thu, 19 Nov 2015 13:30:48 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 14479002409131023.7209229499879;
 Wed, 18 Nov 2015 18:30:40 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Ken <ken.sk.lai@mail.foxconn.com>
Subject: [PATCH skeleton 8/8] Set default LED status, add GPIO define
Date: Wed, 18 Nov 2015 21:30:32 -0500
Message-Id: <1447900232-1928-9-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447900232-1928-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1447900232-1928-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 19 Nov 2015 02:30:49 -0000

From: Ken <ken.sk.lai@mail.foxconn.com>

---
 bin/Barreleye.py         | 17 +++++++++++++++++
 objects/led_controller.c |  5 +++--
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/bin/Barreleye.py b/bin/Barreleye.py
index a1e7688..615b977 100755
--- a/bin/Barreleye.py
+++ b/bin/Barreleye.py
@@ -6,6 +6,12 @@ FLASH_DOWNLOAD_PATH = "/tmp"
 GPIO_BASE = 320
 SYSTEM_NAME = "Barreleye"
 
+import sys
+import gobject
+import dbus
+import dbus.service
+import dbus.mainloop.glib
+
 ## System states
 ##   state can change to next state in 2 ways:
 ##   - a process emits a GotoSystemState signal with state name to goto
@@ -472,9 +478,12 @@ GPIO_CONFIG['PGOOD']      =   { 'gpio_pin': 'C7', 'direction': 'in'  }
 GPIO_CONFIG['IDENTIFY']   =   { 'gpio_pin': 'R5', 'direction': 'out' }
 GPIO_CONFIG['BMC_READY']   =  { 'gpio_pin': 'H2', 'direction': 'out' }
 GPIO_CONFIG['POWER_BUTTON'] = { 'gpio_pin': 'E0', 'direction': 'both' }
+GPIO_CONFIG['RESET_BUTTON'] = { 'gpio_pin': 'E2', 'direction': 'both' }
 GPIO_CONFIG['PCIE_RESET']   = { 'gpio_pin': 'B5', 'direction': 'out' }
 GPIO_CONFIG['USB_RESET']    = { 'gpio_pin': 'B6', 'direction': 'out' }
 GPIO_CONFIG['BEEP']    	  =   { 'gpio_pin': 'N7', 'direction': 'out' }
+GPIO_CONFIG['BMC_TROTTLE']    	  =   { 'gpio_pin': 'J3', 'direction': 'out' }
+GPIO_CONFIG['BMC_HEARTBEAT']    	  =   { 'gpio_pin': 'R4', 'direction': 'out' }
 GPIO_CONFIG['SLOT0_RISER_PRESENT'] =   { 'gpio_pin': 'N0', 'direction': 'in' }
 GPIO_CONFIG['SLOT1_RISER_PRESENT'] =   { 'gpio_pin': 'N1', 'direction': 'in' }
 GPIO_CONFIG['SLOT2_RISER_PRESENT'] =   { 'gpio_pin': 'N2', 'direction': 'in' }
@@ -484,6 +493,14 @@ GPIO_CONFIG['SLOT2_PRESENT'] =         { 'gpio_pin': 'N5', 'direction': 'in' }
 GPIO_CONFIG['MEZZ0_PRESENT'] =         { 'gpio_pin': 'O0', 'direction': 'in' }
 GPIO_CONFIG['MEZZ1_PRESENT'] =         { 'gpio_pin': 'O1', 'direction': 'in' }
 
+
+## bus = dbus.SystemBus()
+## for i in range(1,6):
+##  print i
+##  obj = bus.get_object("org.openbmc,sensors,hwmon","/org/openbmc/sensors/speed/fan"+str(i))
+##  intf = dbus.Interface (obj,"org.openbmc.SensorValue")
+##  intf.setValue(dbus.UInt32(255))
+
 def convertGpio(name):
 	name = name.upper()
 	c = name[0:1]
diff --git a/objects/led_controller.c b/objects/led_controller.c
index 34945e1..383e9ea 100755
--- a/objects/led_controller.c
+++ b/objects/led_controller.c
@@ -10,12 +10,13 @@ static const gchar* dbus_name        = "org.openbmc.control.led";
 
 static GDBusObjectManagerServer *manager = NULL;
 
-#define  NUM_GPIO 3
+#define  NUM_GPIO 4
 
 GPIO led_gpio[NUM_GPIO] = { 
 	(GPIO){"IDENTIFY"},
 	(GPIO){"BMC_READY"},
-	(GPIO){"BEEP"}
+	(GPIO){"BEEP"},
+        (GPIO){"BMC_HEARTBEAT"}
 };
 
 
-- 
2.6.3
