Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r8sFy3LT5zDqFw
 for <openbmc@lists.ozlabs.org>; Wed, 18 May 2016 21:21:10 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 14635704613521021.0029902959268;
 Wed, 18 May 2016 04:21:01 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton v3 3/3] Fix code review comments from Chris Austen.
Date: Wed, 18 May 2016 06:20:53 -0500
Message-Id: <1463570453-15404-4-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1463570453-15404-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1463570453-15404-1-git-send-email-openbmc-patches@stwcx.xyz>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 18 May 2016 11:21:11 -0000

From: Hariharasubramanian R <hramasub@in.ibm.com>

---
 bin/Barreleye.py           |  2 +-
 bin/chassis_control.py     | 20 +++++++-------
 includes/gpio-init-gdbus.c | 22 +++++++--------
 includes/gpio-init-sdbus.c | 53 ++++++++++++++++++------------------
 includes/gpio.c            |  1 -
 objects/host_xstop_obj.c   | 68 ++++++++++++----------------------------------
 6 files changed, 64 insertions(+), 102 deletions(-)

diff --git a/bin/Barreleye.py b/bin/Barreleye.py
index 44aa6a3..8459311 100755
--- a/bin/Barreleye.py
+++ b/bin/Barreleye.py
@@ -551,7 +551,7 @@ GPIO_CONFIG['CPLD_TCK']    	  =   { 'gpio_pin': 'P0', 'direction': 'out' }
 GPIO_CONFIG['CPLD_TDO']    	  =   { 'gpio_pin': 'P1', 'direction': 'out' }
 GPIO_CONFIG['CPLD_TDI']    	  =   { 'gpio_pin': 'P2', 'direction': 'out' }
 GPIO_CONFIG['CPLD_TMS']    	  =   { 'gpio_pin': 'P3', 'direction': 'out' }
-GPIO_CONFIG['CHECKSTOP']      =   { 'gpio_pin': 'P5', 'direction': 'in' }
+GPIO_CONFIG['CHECKSTOP0']			=   { 'gpio_pin': 'P5', 'direction': 'in' }
 
 GPIO_CONFIG['SLOT0_RISER_PRESENT'] =   { 'gpio_pin': 'N0', 'direction': 'in' }
 GPIO_CONFIG['SLOT1_RISER_PRESENT'] =   { 'gpio_pin': 'N1', 'direction': 'in' }
diff --git a/bin/chassis_control.py b/bin/chassis_control.py
index 953f9fd..7b39a9f 100755
--- a/bin/chassis_control.py
+++ b/bin/chassis_control.py
@@ -217,17 +217,17 @@ class ChassisControlObject(Openbmc.DbusProperties,Openbmc.DbusObjectManager):
 		
 	def host_xstop_signal_handler(self):
 		print "Checkstop Error, Waiting for 30sec before Hard Rebooting"
-        time.sleep(30)
+		time.sleep(30)
 		self.Set(DBUS_NAME,"reboot",1)
 		self.reboot()
 
 if __name__ == '__main__':
-    dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
-
-    bus = Openbmc.getDBus()
-    name = dbus.service.BusName(DBUS_NAME, bus)
-    obj = ChassisControlObject(bus, OBJ_NAME)
-    mainloop = gobject.MainLoop()
-    
-    print "Running ChassisControlService"
-    mainloop.run()
+		dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
+
+		bus = Openbmc.getDBus()
+		name = dbus.service.BusName(DBUS_NAME, bus)
+		obj = ChassisControlObject(bus, OBJ_NAME)
+		mainloop = gobject.MainLoop()
+
+		print "Running ChassisControlService"
+		mainloop.run()
diff --git a/includes/gpio-init-gdbus.c b/includes/gpio-init-gdbus.c
index b9d7712..cf47fb1 100644
--- a/includes/gpio-init-gdbus.c
+++ b/includes/gpio-init-gdbus.c
@@ -23,13 +23,13 @@ int gpio_init(void *connection, GPIO* gpio)
 	g_assert_no_error (error);
 	error = NULL;
 	proxy = g_dbus_proxy_new_sync ((GDBusConnection*)connection,
-                                 G_DBUS_PROXY_FLAGS_NONE,
-                                 NULL,                      /* GDBusInterfaceInfo */
-                                 "org.openbmc.managers.System", /* name */
-                                 "/org/openbmc/managers/System", /* object path */
-                                 "org.openbmc.managers.System",        /* interface */
-                                 NULL, /* GCancellable */
-                                 &error);
+						 G_DBUS_PROXY_FLAGS_NONE,
+						 NULL,							/* GDBusInterfaceInfo */
+						 "org.openbmc.managers.System",	/* name */
+						 "/org/openbmc/managers/System",/* object path */
+						 "org.openbmc.managers.System", /* interface */
+						 NULL,							/* GCancellable */
+						 &error);
 	if (error != NULL) {
 		return GPIO_LOOKUP_ERROR;
 	}
@@ -58,9 +58,8 @@ int gpio_init(void *connection, GPIO* gpio)
 		
 		sprintf(dev,"%s/gpio%d/value",gpio->dev,gpio->num);
 		//check if gpio is exported, if not export
-    		int result = stat(dev, &st);
-    		if (result)
-		{
+		int result = stat(dev, &st);
+		if (result) {
 			sprintf(dev,"%s/export",gpio->dev);
 			fd = open(dev, O_WRONLY);
 			if (fd == GPIO_ERROR) {
@@ -76,8 +75,7 @@ int gpio_init(void *connection, GPIO* gpio)
 			}
 		}
 		const char* file = "edge";
-		if (strcmp(gpio->direction,"in")==0 || strcmp(gpio->direction,"out")==0)
-		{
+		if (strcmp(gpio->direction,"in")==0 || strcmp(gpio->direction,"out")==0) {
 			file = "direction";
 		}
 		sprintf(dev,"%s/gpio%d/%s",gpio->dev,gpio->num,file);
diff --git a/includes/gpio-init-sdbus.c b/includes/gpio-init-sdbus.c
index f756038..d2d0a42 100644
--- a/includes/gpio-init-sdbus.c
+++ b/includes/gpio-init-sdbus.c
@@ -10,38 +10,37 @@
 #include "gpio.h"
 #include <systemd/sd-bus.h>
 
-
 // Gets the gpio device path from gpio manager object
 int gpio_init(void *connection, GPIO* gpio)
 {
 	int rc = GPIO_OK;
-    sd_bus_error err    = SD_BUS_ERROR_NULL;
-    sd_bus_message *res = NULL;
+	sd_bus_error err    = SD_BUS_ERROR_NULL;
+	sd_bus_message *res = NULL;
 
-    sd_bus_error_free(&err);
-    sd_bus_message_unref(res);
+	sd_bus_error_free(&err);
+	sd_bus_message_unref(res);
 
-    rc = sd_bus_call_method ((sd_bus*)connection,
-                                "org.openbmc.managers.System",  /* name */
-                                "/org/openbmc/managers/System", /* object path */
-                                "org.openbmc.managers.System",  /* interface */
-                                "gpioInit",
-                                &err,
-                                &res,
-                                "s",
-                                gpio->name);
+	rc = sd_bus_call_method ((sd_bus*)connection,
+							"org.openbmc.managers.System",  /* name */
+							"/org/openbmc/managers/System", /* object path */
+							"org.openbmc.managers.System",  /* interface */
+							"gpioInit",
+							&err,
+							&res,
+							"s",
+							gpio->name);
                              
-    if(rc < 0)
-    {
-        fprintf(stderr, "Failed to init gpio for %s : %s\n", gpio->name, err.message);
-        return -1;
-    }
+	if(rc < 0)
+	{
+		fprintf(stderr, "Failed to init gpio for %s : %s\n", gpio->name, err.message);
+		return -1;
+	}
     
-    rc = sd_bus_message_read (res, "sis", &gpio->dev, &gpio->num, &gpio->direction);
-    if (rc < 0)
-        return -1;
-    else
-        g_print("GPIO Lookup:  %s = %d,%s\n",gpio->name,gpio->num,gpio->direction);
+	rc = sd_bus_message_read (res, "sis", &gpio->dev, &gpio->num, &gpio->direction);
+	if (rc < 0)
+		return -1;
+	else
+		g_print("GPIO Lookup:  %s = %d,%s\n",gpio->name,gpio->num,gpio->direction);
 	
 	//export and set direction
 	char dev[254];
@@ -49,11 +48,11 @@ int gpio_init(void *connection, GPIO* gpio)
 	int fd;
 	do {
 		struct stat st;
-		
+
 		sprintf(dev,"%s/gpio%d/value",gpio->dev,gpio->num);
 		//check if gpio is exported, if not export
-    		int result = stat(dev, &st);
-    		if (result)
+		int result = stat(dev, &st);
+		if (result)
 		{
 			sprintf(dev,"%s/export",gpio->dev);
 			fd = open(dev, O_WRONLY);
diff --git a/includes/gpio.c b/includes/gpio.c
index b6fbf13..52cfaeb 100755
--- a/includes/gpio.c
+++ b/includes/gpio.c
@@ -9,7 +9,6 @@
 #include <sys/mman.h>
 #include "gpio.h"
 
-
 int gpio_writec(GPIO* gpio, char value)
 {
 	g_assert (gpio != NULL);
diff --git a/objects/host_xstop_obj.c b/objects/host_xstop_obj.c
index 1de4d11..d1f8491 100644
--- a/objects/host_xstop_obj.c
+++ b/objects/host_xstop_obj.c
@@ -10,28 +10,19 @@
 #include <systemd/sd-bus.h>
 #include "gpio.h"
 
-/* 
- * -----------------------------------------------
- * FIXME: Fetch GPIO NUM from MRW instead?
- * -----------------------------------------------
- */
-GPIO gpio_xstop    = (GPIO){ "CHECKSTOP" }; /* This object will use these GPIOs */
-const int gpio_num_xstop    = 440;
-const char* gpio_dev_path   = "/sys/class/gpio";
-const char* gpio_dev_exp    = "/sys/class/gpio/export";
-const char* gpio_dev_xstop  = "/sys/class/gpio/gpio440";
-const char* gpio_val_xstop  = "/sys/class/gpio/gpio440/value";
-const char* gpio_dir_xstop  = "/sys/class/gpio/gpio440/direction";
+static const char* xstop0      = "/org/openbmc/sensors/host/cpu0/Xstop";
+static const char* srvc_name   = "org.openbmc.Sensors";
+static const char* iface_name  = "org.openbmc.SensorValue";
+
+GPIO gpio_xstop0	= (GPIO){ "CHECKSTOP0" }; /* This object will use these GPIOs */
+sd_bus* bus         = NULL;
+sd_bus_slot* slot   = NULL;
 
 typedef struct {
     bool isXstopped;
 } HostState;
 
-HostState hostState = (HostState) {false};
-
-static const char* xstop0      = "/org/openbmc/sensors/host/cpu0/Xstop";
-static const char* srvc_name   = "org.openbmc.Sensors";
-static const char* iface_name  = "org.openbmc.SensorValue";
+HostState hostState0 = (HostState) {false};
 
 int bus_property_get_bool(sd_bus *bus, const char *path, const char *interface, const char *property, sd_bus_message *reply, void *userdata, sd_bus_error *error)
 { 
@@ -47,10 +38,6 @@ static const sd_bus_vtable host_xstop_vtable[] =
     SD_BUS_VTABLE_END,
 };
 
-
-sd_bus* bus         = NULL;
-sd_bus_slot* slot   = NULL;
-
 static gboolean
 on_host_xstop (GIOChannel *channel, GIOCondition condition, gpointer user_data)
 {
@@ -62,13 +49,11 @@ on_host_xstop (GIOChannel *channel, GIOCondition condition, gpointer user_data)
 	g_io_channel_seek_position(channel, 0, G_SEEK_SET, 0);
 	GIOStatus rc = g_io_channel_read_chars(channel, buf, 1, &bytes_read, &error);
 
-	printf("%s\n",buf);
-	
-	if (gpio_xstop.irq_inited) {
-         hostState.isXstopped = true;
+	if (gpio_xstop0.irq_inited) {
+         hostState0.isXstopped = true;
     }
     else {
-        gpio_xstop.irq_inited = true;
+        gpio_xstop0.irq_inited = true;
     }
 
 	return true;
@@ -77,11 +62,6 @@ on_host_xstop (GIOChannel *channel, GIOCondition condition, gpointer user_data)
 int main(void)
 {
     int rc              = 0;
-    int fd              = 0;
-    int result          = 0;
-    struct stat st;
-	char data[4];
-
     sd_bus_error err    = SD_BUS_ERROR_NULL;
     sd_bus_message *res = NULL;
 
@@ -104,19 +84,17 @@ int main(void)
         goto cleanup;
     }
 
-    /*
-     * Setup GPIO IRQ for Host xstop
-     */
+    /* Setup GPIO IRQ for Host xstop */
 	rc = GPIO_OK;
 	do {
-		rc = gpio_init(bus, &gpio_xstop);
+		rc = gpio_init(bus, &gpio_xstop0);
 		if (rc != GPIO_OK) { goto cleanup; }
-		rc = gpio_open_interrupt(&gpio_xstop, on_host_xstop, NULL/*object*/);
+		rc = gpio_open_interrupt(&gpio_xstop0, on_host_xstop, NULL/*object*/);
 		if (rc != GPIO_OK) { goto cleanup; }
 	} while(0);
 
 	if (rc != GPIO_OK) {
-		printf("ERROR PowerButton: GPIO setup (rc=%d)\n",rc);
+		fprintf(stderr, "ERROR CHECKSTOP0: GPIO setup =%d\n", rc);
         goto cleanup;
 	}
 
@@ -127,18 +105,6 @@ int main(void)
         goto cleanup;
     }
 
-    /* Register for GPIO IRQ */
-    gpio_xstop.irq_inited = false;
-	fd = open(gpio_val_xstop, O_RDONLY | O_NONBLOCK );
-	if (fd == -1) {
-		rc = -1;
-        goto cleanup;
-	}
-	else {
-		GIOChannel* channel = g_io_channel_unix_new(fd);
-		g_io_add_watch(channel, G_IO_PRI, on_host_xstop, NULL);
-	}
-
     /* Register with Sensor Manager */
     sd_bus_error_free(&err);
     sd_bus_message_unref(res);
@@ -152,8 +118,8 @@ int main(void)
                                 &res,
                                 "ss",
                                 xstop0,
-                                "HostXstopSensor"); /* FIXME: register method needs the Sensor class name ! */
-                             
+                                "HostXstopSensor");
+
     if(rc < 0) {
         fprintf(stderr, "Failed to init gpio for %s : %s\n", xstop0, err.message);
         return -1;
-- 
2.8.2
