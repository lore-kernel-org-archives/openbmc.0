Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 605B41A0592
 for <openbmc@lists.ozlabs.org>; Thu, 14 Jan 2016 22:50:46 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1452772241174646.6857470559285;
 Thu, 14 Jan 2016 03:50:41 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Ken <ken.sk.lai@mail.foxconn.com>
Subject: [PATCH skeleton v3 4/4] Solve auto power on issue,
 confirm GPIO status before send the signal
Date: Thu, 14 Jan 2016 05:50:37 -0600
Message-Id: <1452772237-6542-5-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1452772237-6542-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1452772237-6542-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 14 Jan 2016 11:50:47 -0000

From: Ken <ken.sk.lai@mail.foxconn.com>

---
 objects/button_power_obj.c | 37 ++++++++++++++++++++++++-------------
 1 file changed, 24 insertions(+), 13 deletions(-)
 mode change 100644 => 100755 objects/button_power_obj.c

diff --git a/objects/button_power_obj.c b/objects/button_power_obj.c
old mode 100644
new mode 100755
index 94f8922..4c986a1
--- a/objects/button_power_obj.c
+++ b/objects/button_power_obj.c
@@ -1,4 +1,5 @@
 #include <stdio.h>
+#include <stdlib.h>
 #include "interfaces/openbmc_intf.h"
 #include "gpio.h"
 #include "openbmc.h"
@@ -42,7 +43,11 @@ on_button_interrupt( GIOChannel *channel,
 
 	GError *error = 0;
 	gsize bytes_read = 0;
-	gchar buf[2]; 
+	gchar buf[2];
+
+	uint8_t val;
+	int rc1 = GPIO_OK;
+
 	buf[1] = '\0';
 	g_io_channel_seek_position( channel, 0, G_SEEK_SET, 0 );
 	GIOStatus rc = g_io_channel_read_chars( channel,
@@ -50,7 +55,7 @@ on_button_interrupt( GIOChannel *channel,
                                             &bytes_read,
                                             &error );
 	printf("%s\n",buf);
-	
+
 	time_t current_time = time(NULL);
 	if (gpio_button.irq_inited)
 	{
@@ -65,19 +70,25 @@ on_button_interrupt( GIOChannel *channel,
 		{
 			long press_time = current_time-button_get_timer(button);
 			printf("Power Button released, held for %ld seconds\n",press_time);
-			if (press_time > LONG_PRESS_SECONDS)
-			{
-				button_emit_pressed_long(button);
-			} else {
-				button_emit_released(button);
-			}
+		//	if (press_time > LONG_PRESS_SECONDS)
+		//	{
+		//		button_emit_pressed_long(button);
+		//	} else {
+			rc1 =  gpio_open(&gpio_button);
+			rc1 = gpio_read(&gpio_button,&val);
+			if (val == 1)
+			button_emit_released(button);
+
+			//	if (press_time > 1)
+			//	sleep(1);
+			//}
 		}
-	} 
+	}
 	else { gpio_button.irq_inited = true; }
 
 	return TRUE;
 }
-static void 
+static void
 on_bus_acquired (GDBusConnection *connection,
                  const gchar     *name,
                  gpointer         user_data)
@@ -110,7 +121,7 @@ on_bus_acquired (GDBusConnection *connection,
                     G_CALLBACK (on_button_press),
                     NULL); /* user_data */
 
-		
+
 	/* Export the object (@manager takes its own reference to @object) */
 	g_dbus_object_manager_server_export (manager, G_DBUS_OBJECT_SKELETON (object));
 	g_object_unref (object);
@@ -130,7 +141,7 @@ on_bus_acquired (GDBusConnection *connection,
 	{
 		printf("ERROR PowerButton: GPIO setup (rc=%d)\n",rc);
 	}
-	emit_object_added((GDBusObjectManager*)manager); 
+	emit_object_added((GDBusObjectManager*)manager);
 }
 
 static void
@@ -171,7 +182,7 @@ main (gint argc, gchar *argv[])
                        NULL);
 
   g_main_loop_run (loop);
-  
+
   g_bus_unown_name (id);
   g_main_loop_unref (loop);
   return 0;
-- 
2.6.4
