Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 824C41A1B03
 for <openbmc@lists.ozlabs.org>; Sat, 19 Dec 2015 10:40:50 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1450482036756244.8517687279475;
 Fri, 18 Dec 2015 15:40:36 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Ken <ken.sk.lai@mail.foxconn.com>
Subject: [PATCH skeleton 01/15] Set default LED status, pull high BMC_Throttle
Date: Fri, 18 Dec 2015 17:40:21 -0600
Message-Id: <1450482035-4530-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1450482035-4530-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1450482035-4530-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 18 Dec 2015 23:40:51 -0000

From: Ken <ken.sk.lai@mail.foxconn.com>

---
 bin/Barreleye.py           | 15 +++++++++++++++
 objects/control_host_obj.c |  4 ++++
 objects/led_controller.c   |  6 ++++--
 3 files changed, 23 insertions(+), 2 deletions(-)
 mode change 100644 => 100755 objects/control_host_obj.c
 mode change 100644 => 100755 objects/led_controller.c

diff --git a/bin/Barreleye.py b/bin/Barreleye.py
index 306f293..2006c83 100755
--- a/bin/Barreleye.py
+++ b/bin/Barreleye.py
@@ -62,6 +62,11 @@ ENTER_STATE_CALLBACK = {
 			'obj_name'   : '/org/openbmc/control/led/BMC_READY',
 			'interface_name' : 'org.openbmc.Led',
 		},
+		'setOn' : {
+			'bus_name'   : 'org.openbmc.control.led',
+			'obj_name'   : '/org/openbmc/control/led/BEEP',
+			'interface_name' : 'org.openbmc.Led',
+		},
 		'init' : {
 			'bus_name'   : 'org.openbmc.control.Flash',
 			'obj_name'   : '/org/openbmc/control/flash/bios',
@@ -500,6 +505,16 @@ GPIO_CONFIG['BMC_READY']   =  { 'gpio_pin': 'H2', 'direction': 'out' }
 GPIO_CONFIG['POWER_BUTTON'] = { 'gpio_pin': 'E0', 'direction': 'both' }
 GPIO_CONFIG['PCIE_RESET']   = { 'gpio_pin': 'B5', 'direction': 'out' }
 GPIO_CONFIG['USB_RESET']    = { 'gpio_pin': 'B6', 'direction': 'out' }
+
+GPIO_CONFIG['BEEP']       = { 'gpio_pin': 'N7', 'direction': 'out' }
+GPIO_CONFIG['HEART_BEAT']       = { 'gpio_pin': 'R4', 'direction': 'out' }
+GPIO_CONFIG['BMC_THROTTLE']       = { 'gpio_pin': 'J3', 'direction': 'out' }
+GPIO_CONFIG['RESET_BUTTON']       = { 'gpio_pin': 'E2', 'direction': 'both' }
+GPIO_CONFIG['CPLD_TCK']    	  =   { 'gpio_pin': 'P0', 'direction': 'out' }
+GPIO_CONFIG['CPLD_TDO']    	  =   { 'gpio_pin': 'P1', 'direction': 'out' }
+GPIO_CONFIG['CPLD_TDI']    	  =   { 'gpio_pin': 'P2', 'direction': 'out' }
+GPIO_CONFIG['CPLD_TMS']    	  =   { 'gpio_pin': 'P3', 'direction': 'out' }
+
 GPIO_CONFIG['SLOT0_RISER_PRESENT'] =   { 'gpio_pin': 'N0', 'direction': 'in' }
 GPIO_CONFIG['SLOT1_RISER_PRESENT'] =   { 'gpio_pin': 'N1', 'direction': 'in' }
 GPIO_CONFIG['SLOT2_RISER_PRESENT'] =   { 'gpio_pin': 'N2', 'direction': 'in' }
diff --git a/objects/control_host_obj.c b/objects/control_host_obj.c
old mode 100644
new mode 100755
index 672ef85..79d375b
--- a/objects/control_host_obj.c
+++ b/objects/control_host_obj.c
@@ -21,6 +21,7 @@ GPIO fsi_data     = (GPIO){ "FSI_DATA" };
 GPIO fsi_clk      = (GPIO){ "FSI_CLK" };
 GPIO fsi_enable   = (GPIO){ "FSI_ENABLE" };
 GPIO cronus_sel   = (GPIO){ "CRONUS_SEL" };
+GPIO Throttle   = (GPIO){ "BMC_TROTTLE" };
 
 /* Bit bang patterns */
 
@@ -102,12 +103,14 @@ on_boot         (ControlHost        *host,
 		rc |= gpio_open(&fsi_data);
 		rc |= gpio_open(&fsi_enable);
 		rc |= gpio_open(&cronus_sel);
+		rc |= gpio_open(&Throttle);
 		if (rc!=GPIO_OK) { break; }
 
 		//setup dc pins		
 		rc = gpio_write(&cronus_sel,1);
 		rc |= gpio_write(&fsi_enable,1);
 		rc |= gpio_write(&fsi_clk,1);
+		rc |= gpio_write(&Throttle,1);
 		if (rc!=GPIO_OK) { break; }
 
 		//data standy state
@@ -165,6 +168,7 @@ on_boot         (ControlHost        *host,
 	gpio_close(&fsi_data);
 	gpio_close(&fsi_enable);
 	gpio_close(&cronus_sel);
+	gpio_close(&Throttle);
 
 	control_host_emit_booted(host);
 	return TRUE;
diff --git a/objects/led_controller.c b/objects/led_controller.c
old mode 100644
new mode 100755
index 8c3fa3c..1240b30
--- a/objects/led_controller.c
+++ b/objects/led_controller.c
@@ -10,11 +10,13 @@ static const gchar* dbus_name        = "org.openbmc.control.led";
 
 static GDBusObjectManagerServer *manager = NULL;
 
-#define  NUM_GPIO 2
+#define  NUM_GPIO 4
 
 GPIO led_gpio[NUM_GPIO] = { 
 	(GPIO){"IDENTIFY"},
-	(GPIO){"BMC_READY"}
+	(GPIO){"BMC_READY"},
+	(GPIO){"BEEP"},
+    (GPIO){"HEART_BEAT"}
 };
 
 
-- 
2.6.3
