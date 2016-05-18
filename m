Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r8sFv6RJmzDqDh
 for <openbmc@lists.ozlabs.org>; Wed, 18 May 2016 21:21:07 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1463570459506268.52368140065494;
 Wed, 18 May 2016 04:20:59 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton v3 2/3] Host xstop sensor: Add sensor process to be
 started up, Emit signal on xstop,
 wait 30secs before rebooting host and a python binding object.
Date: Wed, 18 May 2016 06:20:52 -0500
Message-Id: <1463570453-15404-3-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 18 May 2016 11:21:08 -0000

From: Hariharasubramanian R <hramasub@in.ibm.com>

---
 bin/Barreleye.py         |  6 +++++
 bin/Sensors.py           |  9 ++++++++
 bin/chassis_control.py   |  4 +++-
 objects/host_xstop_obj.c | 57 +++++++++++++++++++-----------------------------
 4 files changed, 40 insertions(+), 36 deletions(-)

diff --git a/bin/Barreleye.py b/bin/Barreleye.py
index 537095e..44aa6a3 100755
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
index 470564c..953f9fd 100755
--- a/bin/chassis_control.py
+++ b/bin/chassis_control.py
@@ -2,6 +2,7 @@
 
 import sys
 import uuid
+import time
 #from gi.repository import GObject
 import gobject
 import dbus
@@ -93,7 +94,7 @@ class ChassisControlObject(Openbmc.DbusProperties,Openbmc.DbusObjectManager):
 		self.InterfacesAdded(name,self.properties)
 
 		bus.add_signal_receiver(self.host_xstop_signal_handler, 
-					dbus_interface = "org.openbmc.SensorValue", signal_name = "Changed", 
+					dbus_interface = "org.freedesktop.DBus.Properties", signal_name = "PropertiesChanged", 
 					path="/org/openbmc/sensors/host/cpu0/XStop" )
 
 
@@ -216,6 +217,7 @@ class ChassisControlObject(Openbmc.DbusProperties,Openbmc.DbusObjectManager):
 		
 	def host_xstop_signal_handler(self):
 		print "Checkstop Error, Waiting for 30sec before Hard Rebooting"
+        time.sleep(30)
 		self.Set(DBUS_NAME,"reboot",1)
 		self.reboot()
 
diff --git a/objects/host_xstop_obj.c b/objects/host_xstop_obj.c
index 4f4d87b..1de4d11 100644
--- a/objects/host_xstop_obj.c
+++ b/objects/host_xstop_obj.c
@@ -35,6 +35,9 @@ static const char* iface_name  = "org.openbmc.SensorValue";
 
 int bus_property_get_bool(sd_bus *bus, const char *path, const char *interface, const char *property, sd_bus_message *reply, void *userdata, sd_bus_error *error)
 { 
+        int b = *(bool*) userdata;
+
+        return sd_bus_message_append_basic(reply, 'b', &b);
 }
 
 static const sd_bus_vtable host_xstop_vtable[] =
@@ -49,31 +52,23 @@ sd_bus* bus         = NULL;
 sd_bus_slot* slot   = NULL;
 
 static gboolean
-on_host_xstop (GIOChannel *channel, 
-                GIOCondition condition, 
-                gpointer user_data)
+on_host_xstop (GIOChannel *channel, GIOCondition condition, gpointer user_data)
 {
-
 	GError* error       = 0;
 	gsize bytes_read    = 0;
 	gchar buf[2]; 
 	buf[1] = '\0';
+
 	g_io_channel_seek_position(channel, 0, G_SEEK_SET, 0);
-	GIOStatus rc = g_io_channel_read_chars(channel,
-                                            buf, 1,
-                                            &bytes_read,
-                                            &error);
+	GIOStatus rc = g_io_channel_read_chars(channel, buf, 1, &bytes_read, &error);
+
 	printf("%s\n",buf);
 	
-	if (gpio_xstop.irq_inited)
-	{
-        hostState.isXstopped = true;
-        /* Wait for 30 secs */ 
-        /* and Reboot the host. */
-	} 
-	else 
-    { 
-        gpio_xstop.irq_inited = true; 
+	if (gpio_xstop.irq_inited) {
+         hostState.isXstopped = true;
+    }
+    else {
+        gpio_xstop.irq_inited = true;
     }
 
 	return true;
@@ -92,8 +87,7 @@ int main(void)
 
     /* Latch onto system bus. */
     rc = sd_bus_open_system(&bus);
-    if(rc < 0)
-    {
+    if(rc < 0) {
         fprintf(stderr,"Error opening system bus.\n");
         goto cleanup;
     }
@@ -105,8 +99,7 @@ int main(void)
                                     iface_name,
                                     host_xstop_vtable,
                                     NULL);
-    if (rc < 0)
-    {
+    if (rc < 0) {
         fprintf(stderr, "Failed to add object to dbus: %s\n", strerror(-rc));
         goto cleanup;
     }
@@ -122,16 +115,14 @@ int main(void)
 		if (rc != GPIO_OK) { goto cleanup; }
 	} while(0);
 
-	if (rc != GPIO_OK)
-	{
+	if (rc != GPIO_OK) {
 		printf("ERROR PowerButton: GPIO setup (rc=%d)\n",rc);
         goto cleanup;
 	}
 
     /* Register as a dbus service */
     rc = sd_bus_request_name (bus, srvc_name, 0);
-    if (rc < 0)
-    {
+    if (rc < 0) {
         fprintf(stderr, "Failed to register service: %s\n", strerror(-rc));
         goto cleanup;
     }
@@ -139,13 +130,11 @@ int main(void)
     /* Register for GPIO IRQ */
     gpio_xstop.irq_inited = false;
 	fd = open(gpio_val_xstop, O_RDONLY | O_NONBLOCK );
-	if (fd == -1)
-	{
+	if (fd == -1) {
 		rc = -1;
         goto cleanup;
 	}
-	else
-	{
+	else {
 		GIOChannel* channel = g_io_channel_unix_new(fd);
 		g_io_add_watch(channel, G_IO_PRI, on_host_xstop, NULL);
 	}
@@ -165,23 +154,21 @@ int main(void)
                                 xstop0,
                                 "HostXstopSensor"); /* FIXME: register method needs the Sensor class name ! */
                              
-    if(rc < 0)
-    {
+    if(rc < 0) {
         fprintf(stderr, "Failed to init gpio for %s : %s\n", xstop0, err.message);
         return -1;
     }
+
     for (;;) {
         rc = sd_bus_process (bus, NULL);
-        if (rc < 0)
-        {
+        if (rc < 0) {
             fprintf(stderr, "Failed to process bus: %s\n", strerror(-rc));
             goto cleanup;
         }
         if (rc > 0) continue;
 
         rc = sd_bus_wait (bus, (uint64_t)-1);
-        if (rc < 0)
-        {
+        if (rc < 0) {
             fprintf(stderr, "Failed to wait on bus: %s\n", strerror(-rc));
             goto cleanup;
         }
-- 
2.8.2
