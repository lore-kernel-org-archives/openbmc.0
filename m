Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 146521A03A7
 for <openbmc@lists.ozlabs.org>; Wed, 10 Feb 2016 08:31:00 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1455053456031726.4634473040583;
 Tue, 9 Feb 2016 13:30:56 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton] Implement new LED driver
Date: Tue,  9 Feb 2016 15:30:53 -0600
Message-Id: <1455053453-27303-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1455053453-27303-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1455053453-27303-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 09 Feb 2016 21:31:01 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

Verification for the new LED driver is completed so time to replace the
previous gpio implementation with the new one. This entails
replacing the led_controller file with the led_controller_new file,
updating the dbus interface name so that it is the same as the previous
one, and updating the code with the new led names.
---
 Makefile                     |   7 +-
 bin/Barreleye.py             |  12 +-
 bin/Palmetto.py              |   6 +-
 bin/chassis_control.py       |   2 +-
 bin/obmcutil                 |   2 +-
 objects/led_controller.c     | 617 ++++++++++++++++++++++++++++++++-----------
 objects/led_controller_new.c | 488 ----------------------------------
 7 files changed, 470 insertions(+), 664 deletions(-)
 delete mode 100755 objects/led_controller_new.c

diff --git a/Makefile b/Makefile
index 65787ff..49600ba 100755
--- a/Makefile
+++ b/Makefile
@@ -36,11 +36,8 @@ libopenbmc_intf: openbmc_intf.o
 power_control: power_control_obj.o gpio.o object_mapper.o libopenbmc_intf
 	$(CC) -o bin/$@.exe obj/gpio.o obj/power_control_obj.o obj/object_mapper.o $(LDFLAGS) $(LIBS)
 
-led_controller: led_controller.o gpio.o object_mapper.o libopenbmc_intf
-	$(CC) -o bin/$@.exe obj/gpio.o obj/led_controller.o obj/object_mapper.o $(LDFLAGS) $(LIBS)
-
-led_controller_new: led_controller_new.o
-	$(CC) -o bin/$@.exe obj/led_controller_new.o $(LDFLAGS) $(LIBS) -lsystemd
+led_controller: led_controller.o
+	$(CC) -o bin/$@.exe obj/led_controller.o $(LDFLAGS) $(LIBS) -lsystemd
 
 button_power: button_power_obj.o gpio.o object_mapper.o libopenbmc_intf
 	$(CC) -o bin/$@.exe obj/button_power_obj.o obj/gpio.o obj/object_mapper.o $(LDFLAGS) $(LIBS)
diff --git a/bin/Barreleye.py b/bin/Barreleye.py
index 386a2d6..2fa1c20 100755
--- a/bin/Barreleye.py
+++ b/bin/Barreleye.py
@@ -29,7 +29,7 @@ EXIT_STATE_DEPEND = {
 	},
 	'BMC_STARTING' : {
 		'/org/openbmc/control/power0' : 0,
-		'/org/openbmc/control/led/BMC_READY' : 0,
+		'/org/openbmc/control/led/identify' : 0,
 		'/org/openbmc/control/host0' : 0,
 		'/org/openbmc/control/flash/bios' : 0,
 		'/org/openbmc/sensors/speed/fan5': 0,
@@ -56,14 +56,14 @@ ENTER_STATE_CALLBACK = {
 		},
 		'setOn' : {
 			'bus_name'   : 'org.openbmc.control.led',
-			'obj_name'   : '/org/openbmc/control/led/BMC_READY',
+			'obj_name'   : '/org/openbmc/control/led/identify',
 			'interface_name' : 'org.openbmc.Led',
 		}
 	},
 	'HOST_POWERED_OFF' : {
 		'setOff' : {
 			'bus_name'   : 'org.openbmc.control.led',
-			'obj_name'   : '/org/openbmc/control/led/BMC_READY',
+			'obj_name'   : '/org/openbmc/control/led/identify',
 			'interface_name' : 'org.openbmc.Led',
 		}
 
@@ -71,7 +71,7 @@ ENTER_STATE_CALLBACK = {
 	'BMC_READY' : {
 		'setOn' : {
 			'bus_name'   : 'org.openbmc.control.led',
-			'obj_name'   : '/org/openbmc/control/led/BEEP',
+			'obj_name'   : '/org/openbmc/control/led/beep',
 			'interface_name' : 'org.openbmc.Led',
 		},
 		'init' : {
@@ -537,14 +537,10 @@ GPIO_CONFIG['FSI_ENABLE'] =   { 'gpio_pin': 'D0', 'direction': 'out' }
 GPIO_CONFIG['POWER_PIN']  =   { 'gpio_pin': 'E1', 'direction': 'out'  }
 GPIO_CONFIG['CRONUS_SEL'] =   { 'gpio_pin': 'A6', 'direction': 'out'  }
 GPIO_CONFIG['PGOOD']      =   { 'gpio_pin': 'C7', 'direction': 'in'  }
-GPIO_CONFIG['IDENTIFY']   =   { 'gpio_pin': 'R5', 'direction': 'out' }
-GPIO_CONFIG['BMC_READY']   =  { 'gpio_pin': 'H2', 'direction': 'out' }
 GPIO_CONFIG['POWER_BUTTON'] = { 'gpio_pin': 'E0', 'direction': 'both' }
 GPIO_CONFIG['PCIE_RESET']   = { 'gpio_pin': 'B5', 'direction': 'out' }
 GPIO_CONFIG['USB_RESET']    = { 'gpio_pin': 'B6', 'direction': 'out' }
 
-GPIO_CONFIG['BEEP']       = { 'gpio_pin': 'N7', 'direction': 'out' }
-GPIO_CONFIG['HEART_BEAT']       = { 'gpio_pin': 'R4', 'direction': 'out' }
 GPIO_CONFIG['BMC_THROTTLE']       = { 'gpio_pin': 'J3', 'direction': 'out' }
 GPIO_CONFIG['RESET_BUTTON']       = { 'gpio_pin': 'E2', 'direction': 'both' }
 GPIO_CONFIG['CPLD_TCK']    	  =   { 'gpio_pin': 'P0', 'direction': 'out' }
diff --git a/bin/Palmetto.py b/bin/Palmetto.py
index 7a6c704..ee95999 100755
--- a/bin/Palmetto.py
+++ b/bin/Palmetto.py
@@ -29,7 +29,7 @@ EXIT_STATE_DEPEND = {
 	'BMC_STARTING' : {
 		'/org/openbmc/control/chassis0': 0,
 		'/org/openbmc/control/power0' : 0,
-		'/org/openbmc/control/led/BMC_READY' : 0,
+		'/org/openbmc/control/led/identify' : 0,
 		'/org/openbmc/control/host0' : 0,
 		'/org/openbmc/control/flash/bios' : 0,
 	}
@@ -47,7 +47,7 @@ ENTER_STATE_CALLBACK = {
 	'BMC_READY' : {
 		'setOn' : {
 			'bus_name'   : 'org.openbmc.control.led',
-			'obj_name'   : '/org/openbmc/control/led/BMC_READY',
+			'obj_name'   : '/org/openbmc/control/led/identify',
 			'interface_name' : 'org.openbmc.Led',
 		},
 		'init' : {
@@ -276,8 +276,6 @@ GPIO_CONFIG['POWER_PIN']  =   { 'gpio_pin': 'E1', 'direction': 'out'  }
 GPIO_CONFIG['CRONUS_SEL'] =   { 'gpio_pin': 'A6', 'direction': 'out'  }
 GPIO_CONFIG['PGOOD']      =   { 'gpio_pin': 'C7', 'direction': 'in'  }
 GPIO_CONFIG['BMC_THROTTLE'] = { 'gpio_pin': 'J3', 'direction': 'out' }
-GPIO_CONFIG['IDENTIFY']   =   { 'gpio_pin': 'R4', 'direction': 'out' }
-GPIO_CONFIG['BMC_READY']   =  { 'gpio_pin': 'R4', 'direction': 'out' }
 GPIO_CONFIG['POWER_BUTTON'] = { 'gpio_pin': 'E0', 'direction': 'both' }
 GPIO_CONFIG['PCIE_RESET']   = { 'gpio_pin': 'B5', 'direction': 'out' }
 GPIO_CONFIG['USB_RESET']    = { 'gpio_pin': 'B6', 'direction': 'out' }
diff --git a/bin/chassis_control.py b/bin/chassis_control.py
index ad7a6ad..fbadcde 100755
--- a/bin/chassis_control.py
+++ b/bin/chassis_control.py
@@ -33,7 +33,7 @@ class ChassisControlObject(Openbmc.DbusProperties,Openbmc.DbusObjectManager):
 			},
 			'identify_led' : {
 				'bus_name' : 'org.openbmc.control.led',
-				'object_name' : '/org/openbmc/led/IDENTIFY',
+				'object_name' : '/org/openbmc/control/led/identify',
 				'interface_name' : 'org.openbmc.Led'
 			},
 			'watchdog' : {				
diff --git a/bin/obmcutil b/bin/obmcutil
index 6985e8b..bd753ca 100755
--- a/bin/obmcutil
+++ b/bin/obmcutil
@@ -62,7 +62,7 @@ dbus_objects = {
 	},
 	'identify_led' : {
 		'bus_name' : 'org.openbmc.control.led',
-		'object_name' : '/org/openbmc/control/led/IDENTIFY',
+		'object_name' : '/org/openbmc/control/led/identify',
 		'interface_name' : 'org.openbmc.Led'
 	},	
 	'chassis' : { 
diff --git a/objects/led_controller.c b/objects/led_controller.c
index 1240b30..3ceda38 100755
--- a/objects/led_controller.c
+++ b/objects/led_controller.c
@@ -1,185 +1,488 @@
-#include "interfaces/openbmc_intf.h"
 #include <stdio.h>
-#include "openbmc.h"
-#include "gpio.h"
-#include "object_mapper.h"
+#include <stdlib.h>
+#include <errno.h>
+#include <string.h>
+#include <dirent.h>
+#include <systemd/sd-bus.h>
 
-/* ---------------------------------------------------------------------------------------------------- */
-static const gchar* dbus_object_path = "/org/openbmc/control/led";
-static const gchar* dbus_name        = "org.openbmc.control.led";
+/*
+ * These are control files that are present for each led under
+ *'/sys/class/leds/<led_name>/' which are used to trigger action
+ * on the respective leds by writing predefined data.
+ */
+const char *power_ctrl = "brightness";
+const char *blink_ctrl = "trigger";
+const char *duty_on    = "delay_on";
+const char *duty_off   = "delay_off";
 
-static GDBusObjectManagerServer *manager = NULL;
+/*
+ * --------------------------------------------------
+ * Given the dbus path, returns the name of the LED
+ * --------------------------------------------------
+ */
+char *get_led_name(const char *dbus_path)
+{
+    char *led_name = NULL;
 
-#define  NUM_GPIO 4
+    /* Get the led name from /org/openbmc/control/led/<name> */
+    led_name = strrchr(dbus_path, '/');
+    if(led_name)
+    {
+        led_name++;
+    }
 
-GPIO led_gpio[NUM_GPIO] = { 
-	(GPIO){"IDENTIFY"},
-	(GPIO){"BMC_READY"},
-	(GPIO){"BEEP"},
-    (GPIO){"HEART_BEAT"}
-};
+    return led_name;
+}
+
+/*
+ * -------------------------------------------------------------------------
+ * Writes the 'on / off / blink' trigger to leds.
+ * -------------------------------------------------------------------------
+ */
+int write_to_led(const char *name, const char *ctrl_file, const char *value)
+{
+    /* Generic error reporter. */
+    int rc = -1;
+
+    /* To get /sys/class/leds/<name>/<control file> */
+    char led_path[128] = {0};
+
+    int len = 0;
+    len = snprintf(led_path, sizeof(led_path), 
+                   "/sys/class/leds/%s/%s",name, ctrl_file);
+    if(len >= sizeof(led_path))
+    {
+        fprintf(stderr, "Error. LED path is too long. :[%d]\n",len);
+        return rc;
+    }
 
+    FILE *fp = fopen(led_path,"w");
+    if(fp == NULL)
+    {
+        perror("Error:");
+        fprintf(stderr,"Error opening:[%s]\n",led_path);
+        return rc;
+    }
 
-static gboolean
-on_set_on       (Led          *led,
-                GDBusMethodInvocation  *invocation,
-                gpointer                user_data)
+    rc = fwrite(value, strlen(value), 1, fp);
+    if(rc != 1)
+    {
+        perror("Error:");
+        fprintf(stderr, "Error writing to :[%s]\n",led_path);
+    }
+
+    fclose(fp);
+
+    /* When we get here, rc would be what it was from writing to the file */
+    return (rc == 1) ? 0 : -1;
+}
+
+/*
+ * ----------------------------------------------------------------
+ * Router function for any LED operations that come via dbus
+ *----------------------------------------------------------------
+ */
+static int led_function_router(sd_bus_message *msg, void *user_data,
+                               sd_bus_error *ret_error)
 {
-	GPIO* mygpio = (GPIO*)user_data;
-	g_print("Turn on LED: %s\n",mygpio->name);
-	led_complete_set_on(led,invocation);
-	int rc = GPIO_OK;
-	do {
-		rc = gpio_open(mygpio);
-		if (rc != GPIO_OK) { break; }
-		rc = gpio_write(mygpio,0); 
-		if (rc != GPIO_OK) { break; }
-		led_set_state(led,"on");
-		
-	} while(0);
-	gpio_close(mygpio);
-	if (rc != GPIO_OK)
-	{
-		g_print("ERROR ledcontrol: GPIO error %s (rc=%d)\n",mygpio->name,rc);
-	}
-	return TRUE;
+    /* Generic error reporter. */
+    int rc = -1;
+
+    /* Extract the led name from the full dbus path */
+    const char *led_path = sd_bus_message_get_path(msg);
+    if(led_path == NULL)
+    {
+        fprintf(stderr, "Error. LED path is empty");
+        return sd_bus_reply_method_return(msg, "i", rc);
+    }
+
+    char *led_name = get_led_name(led_path);
+    if(led_name == NULL)
+    {
+        fprintf(stderr, "Invalid LED name for path :[%s]\n",led_path);
+        return sd_bus_reply_method_return(msg, "i", rc);
+    }
+
+    /* Now that we have the LED name, get the Operation. */
+    const char *led_function = sd_bus_message_get_member(msg);
+    if(led_function == NULL)
+    {
+        fprintf(stderr, "Null LED function specificed for : [%s]\n",led_name);
+        return sd_bus_reply_method_return(msg, "i", rc);
+    }
+
+    /* Route the user action to appropriate handlers. */
+    if( (strcmp(led_function, "setOn") == 0) ||
+        (strcmp(led_function, "setOff") == 0))
+    {
+        rc = led_stable_state_function(led_name, led_function);
+        return sd_bus_reply_method_return(msg, "i", rc);
+    }
+    else if( (strcmp(led_function, "setBlinkFast") == 0) ||
+             (strcmp(led_function, "setBlinkSlow") == 0))
+    {
+        rc = led_default_blink(led_name, led_function);
+        return sd_bus_reply_method_return(msg, "i", rc);
+    }
+    else if(strcmp(led_function, "GetLedState") == 0)
+    {
+        char value_str[10] = {0};
+        const char *led_state = NULL;
+
+        rc = read_led(led_name, power_ctrl, value_str, sizeof(value_str));
+        if(rc >= 0)
+        {
+            /* LED is active low */
+            led_state = strtoul(value_str, NULL, 0) ? "Off" : "On";
+        }
+        return sd_bus_reply_method_return(msg, "is", rc, led_state);
+    }
+    else
+    {
+        fprintf(stderr,"Invalid LED function:[%s]\n",led_function);
+    }
+
+    return sd_bus_reply_method_return(msg, "i", rc);
 }
 
-static gboolean
-on_set_off       (Led          *led,
-                GDBusMethodInvocation  *invocation,
-                gpointer                user_data)
+/*
+ * --------------------------------------------------------------
+ * Turn On or Turn Off the LED
+ * --------------------------------------------------------------
+ */
+int led_stable_state_function(char *led_name, char *led_function)
 {
-	GPIO* mygpio = (GPIO*)user_data;
-	g_print("Turn off LED: %s\n",mygpio->name);
-	led_complete_set_off(led,invocation);
-	int rc = GPIO_OK;
-	do {
-		rc = gpio_open(mygpio);
-		if (rc != GPIO_OK) { break; }
-		rc = gpio_write(mygpio,1); 
-		if (rc != GPIO_OK) { break; }
-		led_set_state(led,"off");
-	} while(0);
-	gpio_close(mygpio);
-	if (rc != GPIO_OK)
-	{
-		g_print("ERROR led controller: GPIO error %s (rc=%d)\n",mygpio->name,rc);
-	}
-	return TRUE;
+    /* Generic error reporter. */
+    int rc = -1;
+
+    const char *value = NULL;
+    if(strcmp(led_function, "setOn") == 0)
+    {
+        /* LED active low */
+        value = "0";
+    }
+    else if(strcmp(led_function, "setOff") == 0)
+    {
+        value  = "255";
+    }
+    else
+    {
+        fprintf(stderr,"Invalid LED stable state operation:[%s] \n",led_function);
+        return rc;
+    }
+
+    /*
+     * Before doing anything, need to turn off the blinking
+     * if there is one in progress by writing 'none' to trigger
+     */
+    rc = write_to_led(led_name, blink_ctrl, "none");
+    if(rc < 0)
+    {
+        fprintf(stderr,"Error disabling blink. Function:[%s]\n", led_function);
+        return rc;
+    }
+
+    /*
+     * Open the brightness file and write corresponding values.
+     */
+    rc = write_to_led(led_name, power_ctrl, value);
+    if(rc < 0)
+    {
+        fprintf(stderr,"Error driving LED. Function:[%s]\n", led_function);
+    }
+
+    return rc;
 }
 
-void init_led(Led* led, GPIO* mygpio)
+//-----------------------------------------------------------------------------------
+// Given the on and off duration, applies the action on the specified LED.
+//-----------------------------------------------------------------------------------
+int blink_led(const char *led_name, const char *on_duration, const char *off_duration)
 {
-	int rc = GPIO_OK;
-	do {
-		uint8_t val;
-		rc = gpio_open(mygpio);
-		if (rc != GPIO_OK) { break; }
-		rc = gpio_read(mygpio,&val);
-		if (rc != GPIO_OK) { break; }
-		if (val == 0) {
-			led_set_state(led,"on");
-		} else {
-			led_set_state(led,"off");
-		}
-	} while(0);
-	gpio_close(mygpio);
-	if (rc != GPIO_OK) {
-		g_print("ERROR led controller: GPIO error %s (rc=%d)\n",
-			mygpio->name,rc);
-	}
+    /* Generic error reporter */
+    int rc = -1;
+
+    /* Protocol demands that 'timer' be echoed to 'trigger' */
+    rc = write_to_led(led_name, blink_ctrl, "timer");
+    if(rc < 0)
+    {
+        fprintf(stderr,"Error writing timer to Led:[%s]\n", led_name);
+        return rc;
+    }
+
+    /*
+     * After writing 'timer to 'trigger', 2 new files get generated namely
+     *'delay_on' and 'delay_off' which are telling the time duration for a
+     * particular LED on and off.
+     */
+    rc = write_to_led(led_name, duty_on, on_duration);
+    if(rc < 0)
+    {
+        fprintf(stderr,"Error writing [%s] to delay_on:[%s]\n",on_duration,led_name);
+        return rc;
+    }
+
+    rc = write_to_led(led_name, duty_off, off_duration);
+    if(rc < 0)
+    {
+        fprintf(stderr,"Error writing [%s] to delay_off:[%s]\n",off_duration,led_name);
+    }
+
+    return rc;
 }
 
-static void 
-on_bus_acquired (GDBusConnection *connection,
-                 const gchar     *name,
-                 gpointer         user_data)
+/*
+ * ----------------------------------------------------
+ * Default blink action on the LED.
+ * ----------------------------------------------------
+ */
+int led_default_blink(char *led_name, char *blink_type)
 {
-	ObjectSkeleton *object;
-
-	cmdline *cmd = user_data;
-
-	manager = g_dbus_object_manager_server_new (dbus_object_path);
-	int i = 0;
-	for (i=0;i<NUM_GPIO;i++)
-  	{
-		gchar *s;
-		s = g_strdup_printf ("%s/%s",dbus_object_path,led_gpio[i].name);
-		object = object_skeleton_new (s);
-		g_free (s);
-
-		Led *led = led_skeleton_new ();
-		object_skeleton_set_led (object, led);
-		g_object_unref (led);
-
-		ObjectMapper* mapper = object_mapper_skeleton_new ();
-		object_skeleton_set_object_mapper (object, mapper);
-		g_object_unref (mapper);
-
-		//define method callbacks
-		g_signal_connect (led,
-                    "handle-set-on",
-                    G_CALLBACK (on_set_on),
-                    &led_gpio[i]); /* user_data */
-		g_signal_connect (led,
-                    "handle-set-off",
-                    G_CALLBACK (on_set_off),
-                    &led_gpio[i]);
-
-		led_set_color(led,0);
-		led_set_function(led,led_gpio[i].name);
- 
-		gpio_init(connection,&led_gpio[i]);
-		init_led(led, &led_gpio[i]);
-		/* Export the object (@manager takes its own reference to @object) */
-		g_dbus_object_manager_server_export (manager, G_DBUS_OBJECT_SKELETON (object));
-		g_object_unref (object);
-	}
-	/* Export all objects */
- 	g_dbus_object_manager_server_set_connection (manager, connection);
-	emit_object_added((GDBusObjectManager*)manager); 
+    /* Generic error reporter */
+    int rc = -1;
+
+    /* How long the LED needs to be in on and off state while blinking */
+    const char *on_duration = NULL;
+    const char *off_duration = NULL;
+    if(strcmp(blink_type, "setBlinkSlow") == 0)
+    {
+        //*Delay 900 millisec before 'on' and delay 900 millisec before off */
+        on_duration = "900";
+        off_duration = "900";
+    }
+    else if(strcmp(blink_type, "setBlinkFast") == 0)
+    {
+        /* Delay 200 millisec before 'on' and delay 200 millisec before off */
+        on_duration = "200";
+        off_duration = "200";
+    }
+    else
+    {
+        fprintf(stderr,"Invalid blink operation:[%s]\n",blink_type);
+        return rc;
+    }
+
+    rc = blink_led(led_name, on_duration, off_duration);
+
+    return rc;
 }
 
-static void
-on_name_acquired (GDBusConnection *connection,
-                  const gchar     *name,
-                  gpointer         user_data)
+/*
+ * ---------------------------------------------------------------
+ * Gets the current value of passed in LED file
+ * Mainly used for reading 'brightness'
+ * NOTE : It is the responsibility of the caller to allocate
+ * sufficient space for buffer. This will read upto user supplied 
+ * size -or- entire contents of file whichever is smaller
+ * ----------------------------------------------------------------
+ */
+int read_led(const char *name, const char *ctrl_file, 
+             void *value, const size_t len)
 {
+    /* Generic error reporter. */
+    int rc = -1;
+    int count = 0;
+
+    if(value == NULL || len <= 0)
+    {
+        fprintf(stderr, "Invalid buffer passed to LED read\n");
+        return rc;
+    }
+
+    /* To get /sys/class/leds/<name>/<control file> */
+    char led_path[128] = {0};
+
+    int led_len = 0;
+    led_len = snprintf(led_path, sizeof(led_path), 
+                   "/sys/class/leds/%s/%s",name, ctrl_file);
+    if(led_len >= sizeof(led_path))
+    {
+        fprintf(stderr, "Error. LED path is too long. :[%d]\n",led_len);
+        return rc;
+    }
+
+    FILE *fp = fopen(led_path,"rb");
+    if(fp == NULL)
+    {
+        perror("Error:");
+        fprintf(stderr,"Error opening:[%s]\n",led_path);
+        return rc;
+    }
+
+    char *sysfs_value = (char *)value;
+    while(!feof(fp) && (count < len))
+    {
+        sysfs_value[count++] = fgetc(fp);
+    }
+    sysfs_value[count]='\0';
+
+    fclose(fp);
+    return 0;
 }
 
-static void
-on_name_lost (GDBusConnection *connection,
-              const gchar     *name,
-              gpointer         user_data)
+/*
+ * -----------------------------------------------
+ * Dbus Services offered by this LED controller
+ * -----------------------------------------------
+ */
+static const sd_bus_vtable led_control_vtable[] =
+{
+    SD_BUS_VTABLE_START(0),
+    SD_BUS_METHOD("setOn", "", "i", &led_function_router, SD_BUS_VTABLE_UNPRIVILEGED),
+    SD_BUS_METHOD("setOff", "", "i", &led_function_router, SD_BUS_VTABLE_UNPRIVILEGED),
+    SD_BUS_METHOD("setBlinkFast", "", "i", &led_function_router, SD_BUS_VTABLE_UNPRIVILEGED),
+    SD_BUS_METHOD("setBlinkSlow", "", "i", &led_function_router, SD_BUS_VTABLE_UNPRIVILEGED),
+    SD_BUS_METHOD("GetLedState", "", "is", &led_function_router, SD_BUS_VTABLE_UNPRIVILEGED),
+    SD_BUS_VTABLE_END,
+};
+
+/*
+ * ---------------------------------------------
+ * Interested in all files except standard ones
+ * ---------------------------------------------
+ */
+int led_select(const struct dirent *entry)
 {
+    if( (strcmp(entry->d_name, ".") == 0) ||
+        (strcmp(entry->d_name, "..") == 0))
+    {
+        return 0;
+    }
+    return 1;
 }
 
+/*
+ * ------------------------------------------------
+ * Called as part of setting up skeleton services.
+ * -----------------------------------------------
+ */
+int start_led_services()
+{
+    /* Generic error reporter. */
+    int rc = -1;
+    int num_leds = 0;
+    int count_leds = 0;
+
+    /* Bus and slot where we are offering the LED dbus service. */
+    sd_bus *bus_type = NULL;
+    sd_bus_slot *led_slot = NULL;
+
+    /* For walking '/sys/class/leds/' looking for names of LED.*/
+    struct dirent **led_list;
+
+    /* Get a hook onto system bus. */
+    rc = sd_bus_open_system(&bus_type);
+    if(rc < 0)
+    {
+        fprintf(stderr,"Error opening system bus.\n");
+        return rc;
+    }
+
+    count_leds = num_leds = scandir("/sys/class/leds/", 
+                                    &led_list, led_select, alphasort);
+    if(num_leds <= 0)
+    {
+        fprintf(stderr,"No LEDs present in the system\n");
 
-gint
-main (gint argc, gchar *argv[])
+        sd_bus_slot_unref(led_slot);
+        sd_bus_unref(bus_type);
+        return rc;
+    }
+
+    /* Fully qualified Dbus object for a particular LED */
+    char led_object[128] = {0};
+    int len = 0;
+
+    /* For each led present, announce the service on dbus. */
+    while(num_leds--)
+    {
+        memset(led_object, 0x0, sizeof(led_object));
+
+        len = snprintf(led_object, sizeof(led_object), "%s%s",
+                "/org/openbmc/control/led/", led_list[num_leds]->d_name);
+
+        if(len >= sizeof(led_object))
+        {
+            fprintf(stderr, "Error. LED object is too long:[%d]\n",len);
+            rc = -1;
+            break;
+        }
+
+        /* Install the object */
+        rc = sd_bus_add_object_vtable(bus_type,
+                                      &led_slot,
+                                      led_object,                     /* object path */
+                                      "org.openbmc.Led",   /* interface name */
+                                      led_control_vtable,
+                                      NULL);
+
+        if (rc < 0)
+        {
+            fprintf(stderr, "Failed to add object to dbus: %s\n", strerror(-rc));
+            break;
+        }
+    }
+
+    /* Done with all registration. */
+    while (count_leds > 0)
+    {
+        free(led_list[--count_leds]);
+        if(count_leds == 0)
+        {
+            free(led_list);
+        }
+    }
+
+    /* If we had success in adding the providers, request for a bus name. */
+    if(rc == 0)
+    {
+        /* Take one in OpenBmc */
+        rc = sd_bus_request_name(bus_type, "org.openbmc.control.led", 0);
+        if (rc < 0)
+        {
+            fprintf(stderr, "Failed to acquire service name: %s\n", strerror(-rc));
+        }
+        else
+        {
+            for (;;)
+            {
+                /* Process requests */
+                rc = sd_bus_process(bus_type, NULL);
+                if (rc < 0)
+                {
+                    fprintf(stderr, "Failed to process bus: %s\n", strerror(-rc));
+                    break;
+                }
+                if (rc > 0)
+                {
+                    continue;
+                }
+
+                rc = sd_bus_wait(bus_type, (uint64_t) - 1);
+                if (rc < 0)
+                {
+                    fprintf(stderr, "Failed to wait on bus: %s\n", strerror(-rc));
+                    break;
+                }
+            }
+        }
+    }
+    sd_bus_slot_unref(led_slot);
+    sd_bus_unref(bus_type);
+
+    return rc;
+}
+
+int main(void)
 {
-  GMainLoop *loop;
-  cmdline cmd;
-  cmd.argc = argc;
-  cmd.argv = argv;
-
-  guint id;
-  loop = g_main_loop_new (NULL, FALSE);
-
-  id = g_bus_own_name (DBUS_TYPE,
-                       dbus_name,
-                       G_BUS_NAME_OWNER_FLAGS_ALLOW_REPLACEMENT |
-                       G_BUS_NAME_OWNER_FLAGS_REPLACE,
-                       on_bus_acquired,
-                       on_name_acquired,
-                       on_name_lost,
-                       &cmd,
-                       NULL);
-
-  g_main_loop_run (loop);
-  
-  g_bus_unown_name (id);
-  g_main_loop_unref (loop);
-  return 0;
+    int rc = 0;
+
+    /* This call is not supposed to return. If it does, then an error */
+    rc = start_led_services();
+    if(rc < 0)
+    {
+        fprintf(stderr, "Error starting LED Services. Exiting");
+    }
+
+    return rc;
 }
diff --git a/objects/led_controller_new.c b/objects/led_controller_new.c
deleted file mode 100755
index c8b3f92..0000000
--- a/objects/led_controller_new.c
+++ /dev/null
@@ -1,488 +0,0 @@
-#include <stdio.h>
-#include <stdlib.h>
-#include <errno.h>
-#include <string.h>
-#include <dirent.h>
-#include <systemd/sd-bus.h>
-
-/*
- * These are control files that are present for each led under
- *'/sys/class/leds/<led_name>/' which are used to trigger action
- * on the respective leds by writing predefined data.
- */
-const char *power_ctrl = "brightness";
-const char *blink_ctrl = "trigger";
-const char *duty_on    = "delay_on";
-const char *duty_off   = "delay_off";
-
-/*
- * --------------------------------------------------
- * Given the dbus path, returns the name of the LED
- * --------------------------------------------------
- */
-char *get_led_name(const char *dbus_path)
-{
-    char *led_name = NULL;
-
-    /* Get the led name from /org/openbmc/control/led/<name> */
-    led_name = strrchr(dbus_path, '/');
-    if(led_name)
-    {
-        led_name++;
-    }
-
-    return led_name;
-}
-
-/*
- * -------------------------------------------------------------------------
- * Writes the 'on / off / blink' trigger to leds.
- * -------------------------------------------------------------------------
- */
-int write_to_led(const char *name, const char *ctrl_file, const char *value)
-{
-    /* Generic error reporter. */
-    int rc = -1;
-
-    /* To get /sys/class/leds/<name>/<control file> */
-    char led_path[128] = {0};
-
-    int len = 0;
-    len = snprintf(led_path, sizeof(led_path), 
-                   "/sys/class/leds/%s/%s",name, ctrl_file);
-    if(len >= sizeof(led_path))
-    {
-        fprintf(stderr, "Error. LED path is too long. :[%d]\n",len);
-        return rc;
-    }
-
-    FILE *fp = fopen(led_path,"w");
-    if(fp == NULL)
-    {
-        perror("Error:");
-        fprintf(stderr,"Error opening:[%s]\n",led_path);
-        return rc;
-    }
-
-    rc = fwrite(value, strlen(value), 1, fp);
-    if(rc != 1)
-    {
-        perror("Error:");
-        fprintf(stderr, "Error writing to :[%s]\n",led_path);
-    }
-
-    fclose(fp);
-
-    /* When we get here, rc would be what it was from writing to the file */
-    return (rc == 1) ? 0 : -1;
-}
-
-/*
- * ----------------------------------------------------------------
- * Router function for any LED operations that come via dbus
- *----------------------------------------------------------------
- */
-static int led_function_router(sd_bus_message *msg, void *user_data,
-                               sd_bus_error *ret_error)
-{
-    /* Generic error reporter. */
-    int rc = -1;
-
-    /* Extract the led name from the full dbus path */
-    const char *led_path = sd_bus_message_get_path(msg);
-    if(led_path == NULL)
-    {
-        fprintf(stderr, "Error. LED path is empty");
-        return sd_bus_reply_method_return(msg, "i", rc);
-    }
-
-    char *led_name = get_led_name(led_path);
-    if(led_name == NULL)
-    {
-        fprintf(stderr, "Invalid LED name for path :[%s]\n",led_path);
-        return sd_bus_reply_method_return(msg, "i", rc);
-    }
-
-    /* Now that we have the LED name, get the Operation. */
-    const char *led_function = sd_bus_message_get_member(msg);
-    if(led_function == NULL)
-    {
-        fprintf(stderr, "Null LED function specificed for : [%s]\n",led_name);
-        return sd_bus_reply_method_return(msg, "i", rc);
-    }
-
-    /* Route the user action to appropriate handlers. */
-    if( (strcmp(led_function, "setOn") == 0) ||
-        (strcmp(led_function, "setOff") == 0))
-    {
-        rc = led_stable_state_function(led_name, led_function);
-        return sd_bus_reply_method_return(msg, "i", rc);
-    }
-    else if( (strcmp(led_function, "setBlinkFast") == 0) ||
-             (strcmp(led_function, "setBlinkSlow") == 0))
-    {
-        rc = led_default_blink(led_name, led_function);
-        return sd_bus_reply_method_return(msg, "i", rc);
-    }
-    else if(strcmp(led_function, "GetLedState") == 0)
-    {
-        char value_str[10] = {0};
-        const char *led_state = NULL;
-
-        rc = read_led(led_name, power_ctrl, value_str, sizeof(value_str));
-        if(rc >= 0)
-        {
-            /* LED is active low */
-            led_state = strtoul(value_str, NULL, 0) ? "Off" : "On";
-        }
-        return sd_bus_reply_method_return(msg, "is", rc, led_state);
-    }
-    else
-    {
-        fprintf(stderr,"Invalid LED function:[%s]\n",led_function);
-    }
-
-    return sd_bus_reply_method_return(msg, "i", rc);
-}
-
-/*
- * --------------------------------------------------------------
- * Turn On or Turn Off the LED
- * --------------------------------------------------------------
- */
-int led_stable_state_function(char *led_name, char *led_function)
-{
-    /* Generic error reporter. */
-    int rc = -1;
-
-    const char *value = NULL;
-    if(strcmp(led_function, "setOn") == 0)
-    {
-        /* LED active low */
-        value = "0";
-    }
-    else if(strcmp(led_function, "setOff") == 0)
-    {
-        value  = "255";
-    }
-    else
-    {
-        fprintf(stderr,"Invalid LED stable state operation:[%s] \n",led_function);
-        return rc;
-    }
-
-    /*
-     * Before doing anything, need to turn off the blinking
-     * if there is one in progress by writing 'none' to trigger
-     */
-    rc = write_to_led(led_name, blink_ctrl, "none");
-    if(rc < 0)
-    {
-        fprintf(stderr,"Error disabling blink. Function:[%s]\n", led_function);
-        return rc;
-    }
-
-    /*
-     * Open the brightness file and write corresponding values.
-     */
-    rc = write_to_led(led_name, power_ctrl, value);
-    if(rc < 0)
-    {
-        fprintf(stderr,"Error driving LED. Function:[%s]\n", led_function);
-    }
-
-    return rc;
-}
-
-//-----------------------------------------------------------------------------------
-// Given the on and off duration, applies the action on the specified LED.
-//-----------------------------------------------------------------------------------
-int blink_led(const char *led_name, const char *on_duration, const char *off_duration)
-{
-    /* Generic error reporter */
-    int rc = -1;
-
-    /* Protocol demands that 'timer' be echoed to 'trigger' */
-    rc = write_to_led(led_name, blink_ctrl, "timer");
-    if(rc < 0)
-    {
-        fprintf(stderr,"Error writing timer to Led:[%s]\n", led_name);
-        return rc;
-    }
-
-    /*
-     * After writing 'timer to 'trigger', 2 new files get generated namely
-     *'delay_on' and 'delay_off' which are telling the time duration for a
-     * particular LED on and off.
-     */
-    rc = write_to_led(led_name, duty_on, on_duration);
-    if(rc < 0)
-    {
-        fprintf(stderr,"Error writing [%s] to delay_on:[%s]\n",on_duration,led_name);
-        return rc;
-    }
-
-    rc = write_to_led(led_name, duty_off, off_duration);
-    if(rc < 0)
-    {
-        fprintf(stderr,"Error writing [%s] to delay_off:[%s]\n",off_duration,led_name);
-    }
-
-    return rc;
-}
-
-/*
- * ----------------------------------------------------
- * Default blink action on the LED.
- * ----------------------------------------------------
- */
-int led_default_blink(char *led_name, char *blink_type)
-{
-    /* Generic error reporter */
-    int rc = -1;
-
-    /* How long the LED needs to be in on and off state while blinking */
-    const char *on_duration = NULL;
-    const char *off_duration = NULL;
-    if(strcmp(blink_type, "setBlinkSlow") == 0)
-    {
-        //*Delay 900 millisec before 'on' and delay 900 millisec before off */
-        on_duration = "900";
-        off_duration = "900";
-    }
-    else if(strcmp(blink_type, "setBlinkFast") == 0)
-    {
-        /* Delay 200 millisec before 'on' and delay 200 millisec before off */
-        on_duration = "200";
-        off_duration = "200";
-    }
-    else
-    {
-        fprintf(stderr,"Invalid blink operation:[%s]\n",blink_type);
-        return rc;
-    }
-
-    rc = blink_led(led_name, on_duration, off_duration);
-
-    return rc;
-}
-
-/*
- * ---------------------------------------------------------------
- * Gets the current value of passed in LED file
- * Mainly used for reading 'brightness'
- * NOTE : It is the responsibility of the caller to allocate
- * sufficient space for buffer. This will read upto user supplied 
- * size -or- entire contents of file whichever is smaller
- * ----------------------------------------------------------------
- */
-int read_led(const char *name, const char *ctrl_file, 
-             void *value, const size_t len)
-{
-    /* Generic error reporter. */
-    int rc = -1;
-    int count = 0;
-
-    if(value == NULL || len <= 0)
-    {
-        fprintf(stderr, "Invalid buffer passed to LED read\n");
-        return rc;
-    }
-
-    /* To get /sys/class/leds/<name>/<control file> */
-    char led_path[128] = {0};
-
-    int led_len = 0;
-    led_len = snprintf(led_path, sizeof(led_path), 
-                   "/sys/class/leds/%s/%s",name, ctrl_file);
-    if(led_len >= sizeof(led_path))
-    {
-        fprintf(stderr, "Error. LED path is too long. :[%d]\n",led_len);
-        return rc;
-    }
-
-    FILE *fp = fopen(led_path,"rb");
-    if(fp == NULL)
-    {
-        perror("Error:");
-        fprintf(stderr,"Error opening:[%s]\n",led_path);
-        return rc;
-    }
-
-    char *sysfs_value = (char *)value;
-    while(!feof(fp) && (count < len))
-    {
-        sysfs_value[count++] = fgetc(fp);
-    }
-    sysfs_value[count]='\0';
-
-    fclose(fp);
-    return 0;
-}
-
-/*
- * -----------------------------------------------
- * Dbus Services offered by this LED controller
- * -----------------------------------------------
- */
-static const sd_bus_vtable led_control_vtable[] =
-{
-    SD_BUS_VTABLE_START(0),
-    SD_BUS_METHOD("setOn", "", "i", &led_function_router, SD_BUS_VTABLE_UNPRIVILEGED),
-    SD_BUS_METHOD("setOff", "", "i", &led_function_router, SD_BUS_VTABLE_UNPRIVILEGED),
-    SD_BUS_METHOD("setBlinkFast", "", "i", &led_function_router, SD_BUS_VTABLE_UNPRIVILEGED),
-    SD_BUS_METHOD("setBlinkSlow", "", "i", &led_function_router, SD_BUS_VTABLE_UNPRIVILEGED),
-    SD_BUS_METHOD("GetLedState", "", "is", &led_function_router, SD_BUS_VTABLE_UNPRIVILEGED),
-    SD_BUS_VTABLE_END,
-};
-
-/*
- * ---------------------------------------------
- * Interested in all files except standard ones
- * ---------------------------------------------
- */
-int led_select(const struct dirent *entry)
-{
-    if( (strcmp(entry->d_name, ".") == 0) ||
-        (strcmp(entry->d_name, "..") == 0))
-    {
-        return 0;
-    }
-    return 1;
-}
-
-/*
- * ------------------------------------------------
- * Called as part of setting up skeleton services.
- * -----------------------------------------------
- */
-int start_led_services()
-{
-    /* Generic error reporter. */
-    int rc = -1;
-    int num_leds = 0;
-    int count_leds = 0;
-
-    /* Bus and slot where we are offering the LED dbus service. */
-    sd_bus *bus_type = NULL;
-    sd_bus_slot *led_slot = NULL;
-
-    /* For walking '/sys/class/leds/' looking for names of LED.*/
-    struct dirent **led_list;
-
-    /* Get a hook onto system bus. */
-    rc = sd_bus_open_system(&bus_type);
-    if(rc < 0)
-    {
-        fprintf(stderr,"Error opening system bus.\n");
-        return rc;
-    }
-
-    count_leds = num_leds = scandir("/sys/class/leds/", 
-                                    &led_list, led_select, alphasort);
-    if(num_leds <= 0)
-    {
-        fprintf(stderr,"No LEDs present in the system\n");
-
-        sd_bus_slot_unref(led_slot);
-        sd_bus_unref(bus_type);
-        return rc;
-    }
-
-    /* Fully qualified Dbus object for a particular LED */
-    char led_object[128] = {0};
-    int len = 0;
-
-    /* For each led present, announce the service on dbus. */
-    while(num_leds--)
-    {
-        memset(led_object, 0x0, sizeof(led_object));
-
-        len = snprintf(led_object, sizeof(led_object), "%s%s",
-                "/org/openbmc/controller/led/", led_list[num_leds]->d_name);
-
-        if(len >= sizeof(led_object))
-        {
-            fprintf(stderr, "Error. LED object is too long:[%d]\n",len);
-            rc = -1;
-            break;
-        }
-
-        /* Install the object */
-        rc = sd_bus_add_object_vtable(bus_type,
-                                      &led_slot,
-                                      led_object,                     /* object path */
-                                      "org.openbmc.controller.led",   /* interface name */
-                                      led_control_vtable,
-                                      NULL);
-
-        if (rc < 0)
-        {
-            fprintf(stderr, "Failed to add object to dbus: %s\n", strerror(-rc));
-            break;
-        }
-    }
-
-    /* Done with all registration. */
-    while (count_leds > 0)
-    {
-        free(led_list[--count_leds]);
-        if(count_leds == 0)
-        {
-            free(led_list);
-        }
-    }
-
-    /* If we had success in adding the providers, request for a bus name. */
-    if(rc == 0)
-    {
-        /* Take one in OpenBmc */
-        rc = sd_bus_request_name(bus_type, "org.openbmc.controller.led", 0);
-        if (rc < 0)
-        {
-            fprintf(stderr, "Failed to acquire service name: %s\n", strerror(-rc));
-        }
-        else
-        {
-            for (;;)
-            {
-                /* Process requests */
-                rc = sd_bus_process(bus_type, NULL);
-                if (rc < 0)
-                {
-                    fprintf(stderr, "Failed to process bus: %s\n", strerror(-rc));
-                    break;
-                }
-                if (rc > 0)
-                {
-                    continue;
-                }
-
-                rc = sd_bus_wait(bus_type, (uint64_t) - 1);
-                if (rc < 0)
-                {
-                    fprintf(stderr, "Failed to wait on bus: %s\n", strerror(-rc));
-                    break;
-                }
-            }
-        }
-    }
-    sd_bus_slot_unref(led_slot);
-    sd_bus_unref(bus_type);
-
-    return rc;
-}
-
-int main(void)
-{
-    int rc = 0;
-
-    /* This call is not supposed to return. If it does, then an error */
-    rc = start_led_services();
-    if(rc < 0)
-    {
-        fprintf(stderr, "Error starting LED Services. Exiting");
-    }
-
-    return rc;
-}
-- 
2.7.1
