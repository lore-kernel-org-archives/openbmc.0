Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 5C3E11A0BF7
 for <openbmc@lists.ozlabs.org>; Wed,  2 Dec 2015 19:30:58 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1449045042625291.8592438368461;
 Wed, 2 Dec 2015 00:30:42 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Ken <ken.sk.lai@mail.foxconn.com>
Subject: [PATCH skeleton v7 10/19] LED test
Date: Wed,  2 Dec 2015 03:30:24 -0500
Message-Id: <1449045033-30280-11-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1449045033-30280-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1449045033-30280-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 02 Dec 2015 08:30:58 -0000

From: Ken <ken.sk.lai@mail.foxconn.com>

---
 bin/Barreleye.py         |  1 +
 objects/led_controller.c | 16 +++++++++++++---
 2 files changed, 14 insertions(+), 3 deletions(-)
 mode change 100644 => 100755 objects/led_controller.c

diff --git a/bin/Barreleye.py b/bin/Barreleye.py
index 3782766..9f3d1d1 100755
--- a/bin/Barreleye.py
+++ b/bin/Barreleye.py
@@ -470,6 +470,7 @@ GPIO_CONFIG['BMC_READY']   =  { 'gpio_pin': 'H2', 'direction': 'out' }
 GPIO_CONFIG['POWER_BUTTON'] = { 'gpio_pin': 'E0', 'direction': 'both' }
 GPIO_CONFIG['PCIE_RESET']   = { 'gpio_pin': 'B5', 'direction': 'out' }
 GPIO_CONFIG['USB_RESET']    = { 'gpio_pin': 'B6', 'direction': 'out' }
+GPIO_CONFIG['BEEP']    	  =   { 'gpio_pin': 'N7', 'direction': 'out' }
 GPIO_CONFIG['SLOT0_RISER_PRESENT'] =   { 'gpio_pin': 'N0', 'direction': 'in' }
 GPIO_CONFIG['SLOT1_RISER_PRESENT'] =   { 'gpio_pin': 'N1', 'direction': 'in' }
 GPIO_CONFIG['SLOT2_RISER_PRESENT'] =   { 'gpio_pin': 'N2', 'direction': 'in' }
diff --git a/objects/led_controller.c b/objects/led_controller.c
old mode 100644
new mode 100755
index 8c3fa3c..5bb4542
--- a/objects/led_controller.c
+++ b/objects/led_controller.c
@@ -10,11 +10,12 @@ static const gchar* dbus_name        = "org.openbmc.control.led";
 
 static GDBusObjectManagerServer *manager = NULL;
 
-#define  NUM_GPIO 2
+#define  NUM_GPIO 3
 
 GPIO led_gpio[NUM_GPIO] = { 
 	(GPIO){"IDENTIFY"},
-	(GPIO){"BMC_READY"}
+	(GPIO){"BMC_READY"},
+	(GPIO){"BEEP"}
 };
 
 
@@ -67,21 +68,30 @@ on_set_off       (Led          *led,
 	return TRUE;
 }
 
+int tmp=0;
 void init_led(Led* led, GPIO* mygpio)
 {
 	int rc = GPIO_OK;
+	int i=5;
+	tmp++;
 	do {
 		uint8_t val;
 		rc = gpio_open(mygpio);
 		if (rc != GPIO_OK) { break; }
 		rc = gpio_read(mygpio,&val);
 		if (rc != GPIO_OK) { break; }
+		led_set_state(led,"off");
 		if (val == 0) {
 			led_set_state(led,"on");
 		} else {
 			led_set_state(led,"off");
 		}
-	} while(0);
+	i--;
+	} while(i!=0);
+	
+if(tmp==3)
+	led_set_state(led,"off");
+
 	gpio_close(mygpio);
 	if (rc != GPIO_OK) {
 		g_print("ERROR led controller: GPIO error %s (rc=%d)\n",
-- 
2.6.3
