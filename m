Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 882E61A06F5
 for <openbmc@lists.ozlabs.org>; Mon, 22 Feb 2016 19:01:14 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1456128050808391.7017830808634;
 Mon, 22 Feb 2016 00:00:50 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton] Supporting LED blink at user defined intervals
Date: Mon, 22 Feb 2016 02:00:48 -0600
Message-Id: <1456128048-12933-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1456128048-12933-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1456128048-12933-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 22 Feb 2016 08:01:15 -0000

From: vishwa <vishwanath@in.ibm.com>

---
 objects/led_controller.c | 67 +++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 64 insertions(+), 3 deletions(-)

diff --git a/objects/led_controller.c b/objects/led_controller.c
index b4536aa..4fe0aa4 100755
--- a/objects/led_controller.c
+++ b/objects/led_controller.c
@@ -122,6 +122,11 @@ static int led_function_router(sd_bus_message *msg, void *user_data,
         rc = led_default_blink(led_name, led_function);
         return sd_bus_reply_method_return(msg, "i", rc);
     }
+    else if(strcmp(led_function, "BlinkCustom") == 0)
+    {
+        rc = led_custom_blink(led_name, msg);
+        return sd_bus_reply_method_return(msg, "i", rc);
+    }
     else if(strcmp(led_function, "GetLedState") == 0)
     {
         char value_str[10] = {0};
@@ -266,6 +271,62 @@ int led_default_blink(char *led_name, char *blink_type)
 }
 
 /*
+ * -------------------------------------------------
+ * Blinks at user defined 'on' and 'off' intervals.
+ * -------------------------------------------------
+ */
+int led_custom_blink(const char *led_name, sd_bus_message *msg)
+{
+    /* Generic error reporter. */
+    int rc = -1;
+    int led_len = 0;
+
+    /* User supplied 'on' and 'off' duration converted into string */
+    char on_duration[32] = {0};
+    char off_duration[32] = {0};
+
+    /* User supplied 'on' and 'off' duration */
+    uint32_t user_input_on = 0;
+    uint32_t user_input_off = 0;
+
+    /* Extract values into 'ss' ( string, string) */
+    rc = sd_bus_message_read(msg, "uu", &user_input_on, &user_input_off);
+    if(rc < 0)
+    {
+        fprintf(stderr, "Failed to read 'on' and 'off' duration.[%s]\n", strerror(-rc));
+    }
+    else
+    {
+        /*
+         * Converting user supplied integer arguments into string as required by
+         * sys interface. The top level REST will make sure that an error is
+         * thrown right away on invalid inputs. However, REST is allowing the
+         * unsigned decimal and floating numbers but when its received here, its
+         * received as decimal so no input validation needed.
+         */
+        led_len = snprintf(on_duration, sizeof(on_duration),
+                           "%d",user_input_on);
+        if(led_len >= sizeof(on_duration))
+        {
+            fprintf(stderr, "Error. Blink ON duration is too long. :[%d]\n",led_len);
+            return rc;
+        }
+
+        led_len = snprintf(off_duration, sizeof(off_duration),
+                           "%d",user_input_off);
+        if(led_len >= sizeof(off_duration))
+        {
+            fprintf(stderr, "Error. Blink OFF duration is too long. :[%d]\n",led_len);
+            return rc;
+        }
+
+        /* We are good here.*/
+        rc = blink_led(led_name, on_duration, off_duration);
+    }
+    return rc;
+}
+
+/*
  * ---------------------------------------------------------------
  * Gets the current value of passed in LED file
  * Mainly used for reading 'brightness'
@@ -302,8 +363,7 @@ int read_led(const char *name, const char *ctrl_file,
     FILE *fp = fopen(led_path,"rb");
     if(fp == NULL)
     {
-        perror("Error:");
-        fprintf(stderr,"Error opening:[%s]\n",led_path);
+        fprintf(stderr,"Error:[%s] opening:[%s]\n",strerror(errno),led_path);
         return rc;
     }
 
@@ -330,6 +390,7 @@ static const sd_bus_vtable led_control_vtable[] =
     SD_BUS_METHOD("setBlinkFast", "", "i", &led_function_router, SD_BUS_VTABLE_UNPRIVILEGED),
     SD_BUS_METHOD("setBlinkSlow", "", "i", &led_function_router, SD_BUS_VTABLE_UNPRIVILEGED),
     SD_BUS_METHOD("GetLedState", "", "is", &led_function_router, SD_BUS_VTABLE_UNPRIVILEGED),
+    SD_BUS_METHOD("BlinkCustom", "uu", "i", &led_function_router, SD_BUS_VTABLE_UNPRIVILEGED),
     SD_BUS_VTABLE_END,
 };
 
@@ -408,7 +469,7 @@ int start_led_services()
         /* Install the object */
         rc = sd_bus_add_object_vtable(bus_type,
                                       &led_slot,
-                                      led_object,                     /* object path */
+                                      led_object,          /* object path */
                                       "org.openbmc.Led",   /* interface name */
                                       led_control_vtable,
                                       NULL);
-- 
2.7.1
