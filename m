Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 738E71A1AFA
 for <openbmc@lists.ozlabs.org>; Sat, 19 Dec 2015 11:00:50 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1450483241584798.1857008841467;
 Fri, 18 Dec 2015 16:00:41 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Ken <ken.sk.lai@mail.foxconn.com>
Subject: [PATCH skeleton 1/5] Set default LED status, pull high BMC_Throttle
Date: Fri, 18 Dec 2015 18:00:36 -0600
Message-Id: <1450483240-5182-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1450483240-5182-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1450483240-5182-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sat, 19 Dec 2015 00:00:51 -0000

From: Ken <ken.sk.lai@mail.foxconn.com>

---
 includes/gpio.c            | 0
 objects/control_host_obj.c | 5 +++++
 objects/led_controller.c   | 6 ++++--
 3 files changed, 9 insertions(+), 2 deletions(-)
 mode change 100644 => 100755 includes/gpio.c
 mode change 100644 => 100755 objects/control_host_obj.c
 mode change 100644 => 100755 objects/led_controller.c

diff --git a/includes/gpio.c b/includes/gpio.c
old mode 100644
new mode 100755
diff --git a/objects/control_host_obj.c b/objects/control_host_obj.c
old mode 100644
new mode 100755
index 672ef85..56b02de
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
@@ -221,6 +225,7 @@ on_bus_acquired (GDBusConnection *connection,
 	gpio_init(connection,&fsi_clk);
 	gpio_init(connection,&fsi_enable);
 	gpio_init(connection,&cronus_sel);
+	gpio_init(connection,&Throttle);
 	emit_object_added((GDBusObjectManager*)manager); 	
 }
 
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
