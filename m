Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r9WfM3G5RzDqBK
 for <openbmc@lists.ozlabs.org>; Thu, 19 May 2016 23:11:07 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1463663461333527.1184993309372;
 Thu, 19 May 2016 06:11:01 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton v4] Enable and Handle Checkstop gpio sensor.
Date: Thu, 19 May 2016 08:10:57 -0500
Message-Id: <1463663457-28446-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1463663457-28446-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1463663457-28446-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 19 May 2016 13:11:08 -0000

From: Hariharasubramanian R <hramasub@in.ibm.com>

---
 Makefile                   |  24 ++++----
 bin/Barreleye.py           |   7 +++
 bin/Openbmc.py             |   3 +-
 bin/Sensors.py             |   9 +++
 bin/chassis_control.py     |  26 +++++---
 includes/gpio-init-gdbus.c |  98 ++++++++++++++++++++++++++++++
 includes/gpio-init-sdbus.c |  93 ++++++++++++++++++++++++++++
 includes/gpio.c            |  94 +----------------------------
 includes/gpio.h            |   9 +--
 objects/host_xstop_obj.c   | 147 +++++++++++++++++++++++++++++++++++++++++++++
 10 files changed, 391 insertions(+), 119 deletions(-)
 create mode 100644 includes/gpio-init-gdbus.c
 create mode 100644 includes/gpio-init-sdbus.c
 create mode 100644 objects/host_xstop_obj.c

diff --git a/Makefile b/Makefile
index 7129082..d4a4a73 100755
--- a/Makefile
+++ b/Makefile
@@ -35,21 +35,20 @@ clean:
 libopenbmc_intf: openbmc_intf.o
 	$(CC) -shared -o lib/$@.so obj/openbmc_intf.o $(LDFLAGS)
 
-power_control: power_control_obj.o gpio.o libopenbmc_intf
-	$(CC) -o bin/$@.exe obj/gpio.o obj/power_control_obj.o $(LDFLAGS) $(LIBS)
+power_control: power_control_obj.o gpio.o gpio-init-gdbus.o object_mapper.o libopenbmc_intf
+	$(CC) -o bin/$@.exe obj/gpio.o obj/gpio-init-gdbus.o obj/power_control_obj.o obj/object_mapper.o $(LDFLAGS) $(LIBS)
 
 led_controller: led_controller.o
 	$(CC) -o bin/$@.exe obj/led_controller.o $(LDFLAGS) $(LIB_FLAG)
 
-button_power: button_power_obj.o gpio.o libopenbmc_intf
-	$(CC) -o bin/$@.exe obj/button_power_obj.o obj/gpio.o $(LDFLAGS) $(LIBS)
+button_power: button_power_obj.o gpio.o gpio-init-gdbus.o object_mapper.o libopenbmc_intf
+	$(CC) -o bin/$@.exe obj/button_power_obj.o obj/gpio.o obj/gpio-init-gdbus.o obj/object_mapper.o $(LDFLAGS) $(LIBS)
 
-button_reset: button_reset_obj.o gpio.o libopenbmc_intf
-	$(CC) -o bin/$@.exe obj/button_reset_obj.o obj/gpio.o $(LDFLAGS) $(LIBS)
+button_reset: button_reset_obj.o gpio.o gpio-init-gdbus.o object_mapper.o libopenbmc_intf
+	$(CC) -o bin/$@.exe obj/button_reset_obj.o obj/gpio.o obj/gpio-init-gdbus.o obj/object_mapper.o $(LDFLAGS) $(LIBS)
 
-
-control_host: control_host_obj.o gpio.o libopenbmc_intf
-	$(CC) -o bin/$@.exe obj/gpio.o obj/control_host_obj.o $(LDFLAGS) $(LIBS)
+control_host: control_host_obj.o gpio.o gpio-init-gdbus.o object_mapper.o libopenbmc_intf
+	$(CC) -o bin/$@.exe obj/gpio.o obj/gpio-init-gdbus.o obj/control_host_obj.o obj/object_mapper.o $(LDFLAGS) $(LIBS)
 
 flash_bios:  flash_bios_obj.o libopenbmc_intf
 	$(CC) -o bin/$@.exe obj/flash_bios_obj.o $(LDFLAGS) $(LIBS)
@@ -57,11 +56,14 @@ flash_bios:  flash_bios_obj.o libopenbmc_intf
 host_watchdog: host_watchdog_obj.o libopenbmc_intf
 	$(CC) -o bin/$@.exe obj/host_watchdog_obj.o $(LDFLAGS) $(LIBS)
 
+host_xstop: host_xstop_obj.o gpio.o gpio-init-sdbus.o
+	$(CC) -o bin/$@.exe obj/host_xstop_obj.o obj/gpio.o obj/gpio-init-gdbus.o $(LDFLAGS) $(LIBS) -lsystemd
+
 board_vpd: board_vpd_obj.o libopenbmc_intf
 	$(CC) -o bin/$@.exe obj/board_vpd_obj.o $(LDFLAGS) $(LIBS)
 
-pcie_slot_present: pcie_slot_present_obj.o gpio.o libopenbmc_intf
-	$(CC) -o bin/$@.exe obj/pcie_slot_present_obj.o obj/gpio.o $(LDFLAGS) $(LIBS)
+pcie_slot_present: pcie_slot_present_obj.o gpio.o gpio-init-gdbus.o libopenbmc_intf
+	$(CC) -o bin/$@.exe obj/pcie_slot_present_obj.o obj/gpio.o obj/gpio-init-gdbus.o $(LDFLAGS) $(LIBS)
 
 flasher:  $(OBJS2) flasher_obj.o libopenbmc_intf
 	$(CC) -o bin/$@.exe obj/flasher_obj.o $(OBJS3) $(LDFLAGS) $(LIBS)
diff --git a/bin/Barreleye.py b/bin/Barreleye.py
index 6c28fc2..b3b8fc1 100755
--- a/bin/Barreleye.py
+++ b/bin/Barreleye.py
@@ -127,6 +127,12 @@ APPS = {
 		'monitor_process' : True,
 		'process_name'    : 'host_watchdog.exe',
 	},
+	'host_xstop' : {
+		'system_state'    : 'BMC_STARTING',
+		'start_process'   : True,
+		'monitor_process' : True,
+		'process_name'    : 'host_xstop.exe',
+	},
 	'power_control' : {
 		'system_state'    : 'BMC_STARTING',
 		'start_process'   : True,
@@ -546,6 +552,7 @@ GPIO_CONFIG['CPLD_TCK']    	  =   { 'gpio_pin': 'P0', 'direction': 'out' }
 GPIO_CONFIG['CPLD_TDO']    	  =   { 'gpio_pin': 'P1', 'direction': 'out' }
 GPIO_CONFIG['CPLD_TDI']    	  =   { 'gpio_pin': 'P2', 'direction': 'out' }
 GPIO_CONFIG['CPLD_TMS']    	  =   { 'gpio_pin': 'P3', 'direction': 'out' }
+GPIO_CONFIG['CHECKSTOP0']			=   { 'gpio_pin': 'P5', 'direction': 'in' }
 
 GPIO_CONFIG['SLOT0_RISER_PRESENT'] =   { 'gpio_pin': 'N0', 'direction': 'in' }
 GPIO_CONFIG['SLOT1_RISER_PRESENT'] =   { 'gpio_pin': 'N1', 'direction': 'in' }
diff --git a/bin/Openbmc.py b/bin/Openbmc.py
index b87fec8..70e9bd8 100755
--- a/bin/Openbmc.py
+++ b/bin/Openbmc.py
@@ -60,8 +60,7 @@ class DbusProperties(dbus.service.Object):
         		self.properties[interface_name][property_name] = new_value
 			self.PropertiesChanged(interface_name,{ property_name: new_value }, [])
 
-	@dbus.service.method("org.openbmc.Object.Properties",
-		in_signature='sa{sv}')
+	@dbus.service.method("org.openbmc.Object.Properties", in_signature='sa{sv}')
 	def SetMultiple(self, interface_name, prop_dict):
 		if (self.properties.has_key(interface_name) == False):
 			self.properties[interface_name] = {}
diff --git a/bin/Sensors.py b/bin/Sensors.py
index ecdac91..7349067 100755
--- a/bin/Sensors.py
+++ b/bin/Sensors.py
@@ -221,3 +221,12 @@ class OperatingSystemStatusSensor(VirtualSensor):
 	def SystemStateHandler(self,state):
 		if (state == "HOST_POWERED_OFF"):
 			self.setValue("Off")
+
+class HostXstopSensor(VirtualSensor):
+	def __init__(self,bus,name):
+		VirtualSensor.__init__(self,bus,name)
+		self.setValue("Off")
+		bus.add_signal_receiver(self.SystemStateHandler,signal_name = "GotoSystemState")
+
+	def SystemStateHandler(self,state):
+        print "Host Checkstop Asserted"
diff --git a/bin/chassis_control.py b/bin/chassis_control.py
index 334fbbf..7b39a9f 100755
--- a/bin/chassis_control.py
+++ b/bin/chassis_control.py
@@ -2,6 +2,7 @@
 
 import sys
 import uuid
+import time
 #from gi.repository import GObject
 import gobject
 import dbus
@@ -92,6 +93,10 @@ class ChassisControlObject(Openbmc.DbusProperties,Openbmc.DbusObjectManager):
 		bus.add_signal_receiver(self.SystemStateHandler,signal_name = "GotoSystemState")
 		self.InterfacesAdded(name,self.properties)
 
+		bus.add_signal_receiver(self.host_xstop_signal_handler, 
+					dbus_interface = "org.freedesktop.DBus.Properties", signal_name = "PropertiesChanged", 
+					path="/org/openbmc/sensors/host/cpu0/XStop" )
+
 
 	def getInterface(self,name):
 		o = self.dbus_objects[name]
@@ -210,16 +215,19 @@ class ChassisControlObject(Openbmc.DbusProperties,Openbmc.DbusObjectManager):
 		print "Emergency Shutdown!"
 		self.powerOff()
 		
-		
+	def host_xstop_signal_handler(self):
+		print "Checkstop Error, Waiting for 30sec before Hard Rebooting"
+		time.sleep(30)
+		self.Set(DBUS_NAME,"reboot",1)
+		self.reboot()
 
 if __name__ == '__main__':
-    dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
+		dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
 
-    bus = Openbmc.getDBus()
-    name = dbus.service.BusName(DBUS_NAME, bus)
-    obj = ChassisControlObject(bus, OBJ_NAME)
-    mainloop = gobject.MainLoop()
-    
-    print "Running ChassisControlService"
-    mainloop.run()
+		bus = Openbmc.getDBus()
+		name = dbus.service.BusName(DBUS_NAME, bus)
+		obj = ChassisControlObject(bus, OBJ_NAME)
+		mainloop = gobject.MainLoop()
 
+		print "Running ChassisControlService"
+		mainloop.run()
diff --git a/includes/gpio-init-gdbus.c b/includes/gpio-init-gdbus.c
new file mode 100644
index 0000000..cf47fb1
--- /dev/null
+++ b/includes/gpio-init-gdbus.c
@@ -0,0 +1,98 @@
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <fcntl.h>
+#include <unistd.h>
+#include <argp.h>
+#include <sys/stat.h>
+#include <sys/mman.h>
+#include "interfaces/openbmc_intf.h"
+#include "gpio.h"
+
+
+// Gets the gpio device path from gpio manager object
+int gpio_init(void *connection, GPIO* gpio)
+{
+	int rc = GPIO_OK;
+	GDBusProxy *proxy;
+	GError *error;
+	GVariant *result;
+
+	error = NULL;
+	g_assert_no_error (error);
+	error = NULL;
+	proxy = g_dbus_proxy_new_sync ((GDBusConnection*)connection,
+						 G_DBUS_PROXY_FLAGS_NONE,
+						 NULL,							/* GDBusInterfaceInfo */
+						 "org.openbmc.managers.System",	/* name */
+						 "/org/openbmc/managers/System",/* object path */
+						 "org.openbmc.managers.System", /* interface */
+						 NULL,							/* GCancellable */
+						 &error);
+	if (error != NULL) {
+		return GPIO_LOOKUP_ERROR;
+	}
+
+	result = g_dbus_proxy_call_sync (proxy,
+                                   "gpioInit",
+                                   g_variant_new ("(s)", gpio->name),
+                                   G_DBUS_CALL_FLAGS_NONE,
+                                   -1,
+                                   NULL,
+                                   &error);
+  
+	if (error != NULL) {
+		return GPIO_LOOKUP_ERROR;
+	}
+	g_assert (result != NULL);
+	g_variant_get (result, "(&si&s)", &gpio->dev,&gpio->num,&gpio->direction);
+	g_print("GPIO Lookup:  %s = %d,%s\n",gpio->name,gpio->num,gpio->direction);
+	
+	//export and set direction
+	char dev[254];
+	char data[4];
+	int fd;
+	do {
+		struct stat st;
+		
+		sprintf(dev,"%s/gpio%d/value",gpio->dev,gpio->num);
+		//check if gpio is exported, if not export
+		int result = stat(dev, &st);
+		if (result) {
+			sprintf(dev,"%s/export",gpio->dev);
+			fd = open(dev, O_WRONLY);
+			if (fd == GPIO_ERROR) {
+				rc = GPIO_OPEN_ERROR;
+				break;
+			} 
+			sprintf(data,"%d",gpio->num);
+			rc = write(fd,data,strlen(data));
+			close(fd);
+			if (rc != strlen(data)) {
+				rc = GPIO_WRITE_ERROR;
+				break;
+			}
+		}
+		const char* file = "edge";
+		if (strcmp(gpio->direction,"in")==0 || strcmp(gpio->direction,"out")==0) {
+			file = "direction";
+		}
+		sprintf(dev,"%s/gpio%d/%s",gpio->dev,gpio->num,file);
+		fd = open(dev,O_WRONLY);
+		if (fd == GPIO_ERROR) {
+			rc = GPIO_WRITE_ERROR;
+			break;
+		}
+		rc = write(fd,gpio->direction,strlen(gpio->direction));
+		if (rc != strlen(gpio->direction)) {
+			rc = GPIO_WRITE_ERROR;
+			break;
+		}
+
+		close(fd);
+		rc = GPIO_OK;
+	} while(0);
+
+	return rc;
+}
diff --git a/includes/gpio-init-sdbus.c b/includes/gpio-init-sdbus.c
new file mode 100644
index 0000000..d2d0a42
--- /dev/null
+++ b/includes/gpio-init-sdbus.c
@@ -0,0 +1,93 @@
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <fcntl.h>
+#include <unistd.h>
+#include <argp.h>
+#include <sys/stat.h>
+#include <sys/mman.h>
+#include "gpio.h"
+#include <systemd/sd-bus.h>
+
+// Gets the gpio device path from gpio manager object
+int gpio_init(void *connection, GPIO* gpio)
+{
+	int rc = GPIO_OK;
+	sd_bus_error err    = SD_BUS_ERROR_NULL;
+	sd_bus_message *res = NULL;
+
+	sd_bus_error_free(&err);
+	sd_bus_message_unref(res);
+
+	rc = sd_bus_call_method ((sd_bus*)connection,
+							"org.openbmc.managers.System",  /* name */
+							"/org/openbmc/managers/System", /* object path */
+							"org.openbmc.managers.System",  /* interface */
+							"gpioInit",
+							&err,
+							&res,
+							"s",
+							gpio->name);
+                             
+	if(rc < 0)
+	{
+		fprintf(stderr, "Failed to init gpio for %s : %s\n", gpio->name, err.message);
+		return -1;
+	}
+    
+	rc = sd_bus_message_read (res, "sis", &gpio->dev, &gpio->num, &gpio->direction);
+	if (rc < 0)
+		return -1;
+	else
+		g_print("GPIO Lookup:  %s = %d,%s\n",gpio->name,gpio->num,gpio->direction);
+	
+	//export and set direction
+	char dev[254];
+	char data[4];
+	int fd;
+	do {
+		struct stat st;
+
+		sprintf(dev,"%s/gpio%d/value",gpio->dev,gpio->num);
+		//check if gpio is exported, if not export
+		int result = stat(dev, &st);
+		if (result)
+		{
+			sprintf(dev,"%s/export",gpio->dev);
+			fd = open(dev, O_WRONLY);
+			if (fd == GPIO_ERROR) {
+				rc = GPIO_OPEN_ERROR;
+				break;
+			} 
+			sprintf(data,"%d",gpio->num);
+			rc = write(fd,data,strlen(data));
+			close(fd);
+			if (rc != strlen(data)) {
+				rc = GPIO_WRITE_ERROR;
+				break;
+			}
+		}
+		const char* file = "edge";
+		if (strcmp(gpio->direction,"in")==0 || strcmp(gpio->direction,"out")==0)
+		{
+			file = "direction";
+		}
+		sprintf(dev,"%s/gpio%d/%s",gpio->dev,gpio->num,file);
+		fd = open(dev,O_WRONLY);
+		if (fd == GPIO_ERROR) {
+			rc = GPIO_WRITE_ERROR;
+			break;
+		}
+		rc = write(fd,gpio->direction,strlen(gpio->direction));
+		if (rc != strlen(gpio->direction)) {
+			rc = GPIO_WRITE_ERROR;
+			break;
+		}
+
+		close(fd);
+		rc = GPIO_OK;
+	} while(0);
+
+	return rc;
+}
diff --git a/includes/gpio.c b/includes/gpio.c
index 25a9df8..52cfaeb 100755
--- a/includes/gpio.c
+++ b/includes/gpio.c
@@ -7,10 +7,8 @@
 #include <argp.h>
 #include <sys/stat.h>
 #include <sys/mman.h>
-#include "interfaces/openbmc_intf.h"
 #include "gpio.h"
 
-
 int gpio_writec(GPIO* gpio, char value)
 {
 	g_assert (gpio != NULL);
@@ -65,6 +63,7 @@ int gpio_read(GPIO* gpio, uint8_t *value)
 	}
 	return r;
 }
+
 int gpio_clock_cycle(GPIO* gpio, int num_clks) {
 	g_assert (gpio != NULL);
         int i=0;
@@ -82,97 +81,6 @@ int gpio_clock_cycle(GPIO* gpio, int num_clks) {
 	return r;
 }
 
-// Gets the gpio device path from gpio manager object
-int gpio_init(GDBusConnection *connection, GPIO* gpio)
-{
-	int rc = GPIO_OK;
-	GDBusProxy *proxy;
-	GError *error;
-	GVariant *result;
-
-	error = NULL;
-	g_assert_no_error (error);
-	error = NULL;
-	proxy = g_dbus_proxy_new_sync (connection,
-                                 G_DBUS_PROXY_FLAGS_NONE,
-                                 NULL,                      /* GDBusInterfaceInfo */
-                                 "org.openbmc.managers.System", /* name */
-                                 "/org/openbmc/managers/System", /* object path */
-                                 "org.openbmc.managers.System",        /* interface */
-                                 NULL, /* GCancellable */
-                                 &error);
-	if (error != NULL) {
-		return GPIO_LOOKUP_ERROR;
-	}
-
-	result = g_dbus_proxy_call_sync (proxy,
-                                   "gpioInit",
-                                   g_variant_new ("(s)", gpio->name),
-                                   G_DBUS_CALL_FLAGS_NONE,
-                                   -1,
-                                   NULL,
-                                   &error);
-  
-	if (error != NULL) {
-		return GPIO_LOOKUP_ERROR;
-	}
-	g_assert (result != NULL);
-	g_variant_get (result, "(&si&s)", &gpio->dev,&gpio->num,&gpio->direction);
-	g_print("GPIO Lookup:  %s = %d,%s\n",gpio->name,gpio->num,gpio->direction);
-	
-	//export and set direction
-	char dev[254];
-	char data[4];
-	int fd;
-	do {
-		struct stat st;
-		
-		sprintf(dev,"%s/gpio%d/value",gpio->dev,gpio->num);
-		//check if gpio is exported, if not export
-    		int result = stat(dev, &st);
-    		if (result)
-		{
-			sprintf(dev,"%s/export",gpio->dev);
-			fd = open(dev, O_WRONLY);
-			if (fd == GPIO_ERROR) {
-				rc = GPIO_OPEN_ERROR;
-				break;
-			} 
-			sprintf(data,"%d",gpio->num);
-			rc = write(fd,data,strlen(data));
-			close(fd);
-			if (rc != strlen(data)) {
-				rc = GPIO_WRITE_ERROR;
-				break;
-			}
-		}
-		const char* file = "edge";
-		if (strcmp(gpio->direction,"in")==0 || strcmp(gpio->direction,"out")==0)
-		{
-			file = "direction";
-		}
-		sprintf(dev,"%s/gpio%d/%s",gpio->dev,gpio->num,file);
-		fd = open(dev,O_WRONLY);
-		if (fd == GPIO_ERROR) {
-			rc = GPIO_WRITE_ERROR;
-			break;
-		}
-		rc = write(fd,gpio->direction,strlen(gpio->direction));
-		if (rc != strlen(gpio->direction)) {
-			rc = GPIO_WRITE_ERROR;
-			break;
-		}
-
-		close(fd);
-		rc = GPIO_OK;
-	} while(0);
-
-	return rc;
-}
-
-
-
-
 char* get_gpio_dev(GPIO* gpio)
 {
 	char* buf;
diff --git a/includes/gpio.h b/includes/gpio.h
index 8cfc59f..6c693a1 100644
--- a/includes/gpio.h
+++ b/includes/gpio.h
@@ -6,10 +6,10 @@
 #include <stdbool.h>
 
 typedef struct {
-  gchar* name;
-  gchar* dev;
+  char* name;
+  char* dev;
   uint16_t num;
-  gchar* direction;
+  char* direction;
   int fd;
   bool irq_inited;
 } GPIO;
@@ -24,7 +24,8 @@ typedef struct {
 #define GPIO_WRITE_ERROR  0x10
 #define GPIO_LOOKUP_ERROR 0x20
 
-int gpio_init(GDBusConnection*, GPIO*);
+/*int gpio_init(GDBusConnection*, GPIO*);*/
+int gpio_init(void*, GPIO*);
 void gpio_close(GPIO*);
 int  gpio_open(GPIO*);
 int gpio_open_interrupt(GPIO*, GIOFunc, gpointer);
diff --git a/objects/host_xstop_obj.c b/objects/host_xstop_obj.c
new file mode 100644
index 0000000..d1f8491
--- /dev/null
+++ b/objects/host_xstop_obj.c
@@ -0,0 +1,147 @@
+#include <stdio.h>
+#include <stdlib.h>
+#include <stdbool.h>
+#include <errno.h>
+#include <string.h>
+#include <time.h>
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <fcntl.h>
+#include <systemd/sd-bus.h>
+#include "gpio.h"
+
+static const char* xstop0      = "/org/openbmc/sensors/host/cpu0/Xstop";
+static const char* srvc_name   = "org.openbmc.Sensors";
+static const char* iface_name  = "org.openbmc.SensorValue";
+
+GPIO gpio_xstop0	= (GPIO){ "CHECKSTOP0" }; /* This object will use these GPIOs */
+sd_bus* bus         = NULL;
+sd_bus_slot* slot   = NULL;
+
+typedef struct {
+    bool isXstopped;
+} HostState;
+
+HostState hostState0 = (HostState) {false};
+
+int bus_property_get_bool(sd_bus *bus, const char *path, const char *interface, const char *property, sd_bus_message *reply, void *userdata, sd_bus_error *error)
+{ 
+        int b = *(bool*) userdata;
+
+        return sd_bus_message_append_basic(reply, 'b', &b);
+}
+
+static const sd_bus_vtable host_xstop_vtable[] =
+{
+    SD_BUS_VTABLE_START(0),
+    SD_BUS_PROPERTY("IsXstopped", "b", bus_property_get_bool, offsetof(HostState, isXstopped), SD_BUS_VTABLE_PROPERTY_EMITS_CHANGE),
+    SD_BUS_VTABLE_END,
+};
+
+static gboolean
+on_host_xstop (GIOChannel *channel, GIOCondition condition, gpointer user_data)
+{
+	GError* error       = 0;
+	gsize bytes_read    = 0;
+	gchar buf[2]; 
+	buf[1] = '\0';
+
+	g_io_channel_seek_position(channel, 0, G_SEEK_SET, 0);
+	GIOStatus rc = g_io_channel_read_chars(channel, buf, 1, &bytes_read, &error);
+
+	if (gpio_xstop0.irq_inited) {
+         hostState0.isXstopped = true;
+    }
+    else {
+        gpio_xstop0.irq_inited = true;
+    }
+
+	return true;
+}
+
+int main(void)
+{
+    int rc              = 0;
+    sd_bus_error err    = SD_BUS_ERROR_NULL;
+    sd_bus_message *res = NULL;
+
+    /* Latch onto system bus. */
+    rc = sd_bus_open_system(&bus);
+    if(rc < 0) {
+        fprintf(stderr,"Error opening system bus.\n");
+        goto cleanup;
+    }
+
+    /* Install object for Host0 */
+    rc = sd_bus_add_object_vtable (bus,
+                                    &slot,
+                                    xstop0,
+                                    iface_name,
+                                    host_xstop_vtable,
+                                    NULL);
+    if (rc < 0) {
+        fprintf(stderr, "Failed to add object to dbus: %s\n", strerror(-rc));
+        goto cleanup;
+    }
+
+    /* Setup GPIO IRQ for Host xstop */
+	rc = GPIO_OK;
+	do {
+		rc = gpio_init(bus, &gpio_xstop0);
+		if (rc != GPIO_OK) { goto cleanup; }
+		rc = gpio_open_interrupt(&gpio_xstop0, on_host_xstop, NULL/*object*/);
+		if (rc != GPIO_OK) { goto cleanup; }
+	} while(0);
+
+	if (rc != GPIO_OK) {
+		fprintf(stderr, "ERROR CHECKSTOP0: GPIO setup =%d\n", rc);
+        goto cleanup;
+	}
+
+    /* Register as a dbus service */
+    rc = sd_bus_request_name (bus, srvc_name, 0);
+    if (rc < 0) {
+        fprintf(stderr, "Failed to register service: %s\n", strerror(-rc));
+        goto cleanup;
+    }
+
+    /* Register with Sensor Manager */
+    sd_bus_error_free(&err);
+    sd_bus_message_unref(res);
+
+    rc = sd_bus_call_method (bus,
+                                "org.openbmc.Sensors",  /* name */
+                                "/org/openbmc/sensors", /* object path */
+                                "org.openbmc.Sensors",  /* interface */
+                                "register",
+                                &err,
+                                &res,
+                                "ss",
+                                xstop0,
+                                "HostXstopSensor");
+
+    if(rc < 0) {
+        fprintf(stderr, "Failed to init gpio for %s : %s\n", xstop0, err.message);
+        return -1;
+    }
+
+    for (;;) {
+        rc = sd_bus_process (bus, NULL);
+        if (rc < 0) {
+            fprintf(stderr, "Failed to process bus: %s\n", strerror(-rc));
+            goto cleanup;
+        }
+        if (rc > 0) continue;
+
+        rc = sd_bus_wait (bus, (uint64_t)-1);
+        if (rc < 0) {
+            fprintf(stderr, "Failed to wait on bus: %s\n", strerror(-rc));
+            goto cleanup;
+        }
+    }
+                                
+cleanup:
+    sd_bus_slot_unref (slot);
+    sd_bus_unref (bus);
+    return rc;
+}
-- 
2.8.2
