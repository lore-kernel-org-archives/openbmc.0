Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rfwZh47Q8zDqvD
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 07:21:00 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1467235256342733.8247268543263;
 Wed, 29 Jun 2016 14:20:56 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Andrew Geissler <andrewg@us.ibm.com>
Subject: [PATCH skeleton] Disable watchdog timer if debug_mode is set
Date: Wed, 29 Jun 2016 16:20:54 -0500
Message-Id: <20160629212054.18310-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160629212054.18310-1-openbmc-patches@stwcx.xyz>
References: <20160629212054.18310-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 29 Jun 2016 21:21:01 -0000

From: Andrew Geissler <andrewg@us.ibm.com>

https://github.com/openbmc/openbmc/issues/246

debug_mode is used when the host is not going to be started.
In this case, we do not want the watchdog timer to be started
because there is no one to keep it from resetting.

This code change prevents the watchdog from being started
during poweron.

Potential side affects could be if we do start the host
in this code path.  The watchdog is un-tested when it's
not started but software comes in and tries to reset it.
The code in control_host_obj.c currently enforces the
no-host-power-on when debug_mode is set.
---
 pychassisctl/chassis_control.py | 408 +++++++++++++++++++++-------------------
 1 file changed, 216 insertions(+), 192 deletions(-)

diff --git a/pychassisctl/chassis_control.py b/pychassisctl/chassis_control.py
index 376e0e9..6754ea1 100644
--- a/pychassisctl/chassis_control.py
+++ b/pychassisctl/chassis_control.py
@@ -19,197 +19,221 @@ POWER_ON = 1
 
 BOOTED = 100
 
-class ChassisControlObject(DbusProperties,DbusObjectManager):
-	def getUuid(self):
-		uuid = "";
-		try:
-			with open(MACHINE_ID) as f:
-				data = f.readline().rstrip('\n')
-				if (len(data) == 32):
-					uuid = data
-				else:
-					print "ERROR:  UUID is not formatted correctly: "+data
-		except:
-			print "ERROR: Unable to open uuid file: "+MACHINE_ID
-				
-		return uuid
- 
-	def __init__(self,bus,name):
-		self.dbus_objects = { }
-		DbusProperties.__init__(self)
-		DbusObjectManager.__init__(self)
-		dbus.service.Object.__init__(self,bus,name)
-		## load utilized objects
-		self.dbus_objects = {
-			'power_control' : { 
-				'bus_name' : 'org.openbmc.control.Power',
-				'object_name' : '/org/openbmc/control/power0',
-				'interface_name' : 'org.openbmc.control.Power'
-			},
-			'identify_led' : {
-				'bus_name' : 'org.openbmc.control.led',
-				'object_name' : '/org/openbmc/control/led/identify',
-				'interface_name' : 'org.openbmc.Led'
-			},
-			'watchdog' : {				
-				'bus_name' : 'org.openbmc.watchdog.Host',
-				'object_name' : '/org/openbmc/watchdog/host0',
-				'interface_name' : 'org.openbmc.Watchdog'
-			},
-			'host_services' : {
-				'bus_name' : 'org.openbmc.HostServices',
-				'object_name' : '/org/openbmc/HostServices',
-				'interface_name' : 'org.openbmc.HostServices'
-			},
-			'settings' : {
-				'bus_name' : 'org.openbmc.settings.Host',
-				'object_name' : '/org/openbmc/settings/host0',
-				'interface_name' : 'org.freedesktop.DBus.Properties'
-			},
-		}
-
-		#uuid
-		self.Set(DBUS_NAME,"uuid",self.getUuid())
-		self.Set(DBUS_NAME,"reboot",0)
-
-		bus.add_signal_receiver(self.power_button_signal_handler, 
-					dbus_interface = "org.openbmc.Button", signal_name = "Released", 
-					path="/org/openbmc/buttons/power0" )
-		bus.add_signal_receiver(self.reset_button_signal_handler, 
-					dbus_interface = "org.openbmc.Button", signal_name = "PressedLong", 
-					path="/org/openbmc/buttons/power0" )
-		bus.add_signal_receiver(self.softreset_button_signal_handler, 
-					dbus_interface = "org.openbmc.Button", signal_name = "Released", 
-					path="/org/openbmc/buttons/reset0" )
-
-    		bus.add_signal_receiver(self.host_watchdog_signal_handler, 
-					dbus_interface = "org.openbmc.Watchdog", signal_name = "WatchdogError")
-
-   		bus.add_signal_receiver(self.emergency_shutdown_signal_handler, 
-					dbus_interface = "org.openbmc.SensorThresholds", signal_name = "Emergency")
-
-		bus.add_signal_receiver(self.SystemStateHandler,signal_name = "GotoSystemState")
-		self.InterfacesAdded(name,self.properties)
-
-
-	def getInterface(self,name):
-		o = self.dbus_objects[name]
-		obj = bus.get_object(o['bus_name'],o['object_name'],introspect=False)
-		return dbus.Interface(obj,o['interface_name'])
-
-
-	@dbus.service.method(DBUS_NAME,
-		in_signature='', out_signature='')
-	def setIdentify(self):
-		print "Turn on identify"
-		intf = self.getInterface('identify_led')
-		intf.setOn()	
-		return None
-
-	@dbus.service.method(DBUS_NAME,
-		in_signature='', out_signature='')
-	def clearIdentify(self):
-		print "Turn on identify"
-		intf = self.getInterface('identify_led')
-		intf.setOff()
-		return None
-
-	@dbus.service.method(DBUS_NAME,
-		in_signature='', out_signature='')
-	def powerOn(self):
-		print "Turn on power and boot"
-		self.Set(DBUS_NAME,"reboot",0)
-		if (self.getPowerState()==0):
-			intf = self.getInterface('power_control')
-			intf.setPowerState(POWER_ON)
-			intfwatchdog = self.getInterface('watchdog')
-			#Start watchdog with 30s timeout per the OpenPower Host IPMI Spec
-			#Once the host starts booting, it'll reset and refresh the timer
-			intfwatchdog.set(30000)
-			intfwatchdog.start()
-		return None
-
-	@dbus.service.method(DBUS_NAME,
-		in_signature='', out_signature='')
-	def powerOff(self):
-		print "Turn off power"
-		intfwatchdog = self.getInterface('watchdog')
-		intfwatchdog.stop()
-		intf = self.getInterface('power_control')
-		intf.setPowerState(POWER_OFF)
-		return None
-
-	@dbus.service.method(DBUS_NAME,
-		in_signature='', out_signature='')
-	def softPowerOff(self):
-		print "Soft off power"
-		intf = self.getInterface('host_services')
-		## host services will call power off when ready
-		intf.SoftPowerOff()
-		return None
-
-	@dbus.service.method(DBUS_NAME,
-		in_signature='', out_signature='')
-	def reboot(self):
-		print "Rebooting"
-		if self.getPowerState() == POWER_OFF:
-			self.powerOn();
-		else:
-			self.Set(DBUS_NAME,"reboot",1)
-			self.powerOff()
-		return None
-
-	@dbus.service.method(DBUS_NAME,
-		in_signature='', out_signature='')
-	def softReboot(self):
-		print "Soft Rebooting"
-		if self.getPowerState() == POWER_OFF:
-			self.powerOn();
-		else:
-			self.Set(DBUS_NAME,"reboot",1)
-			self.softPowerOff()
-		return None
-
-	@dbus.service.method(DBUS_NAME,
-		in_signature='', out_signature='i')
-	def getPowerState(self):
-		intf = self.getInterface('power_control')
-		return intf.getPowerState()
-
-	## Signal handler
-
-	def SystemStateHandler(self,state_name):
-		if (state_name == "HOST_POWERED_OFF" or state_name == "HOST_POWERED_ON"):
-			intf = self.getInterface('settings')
-			intf.Set("org.openbmc.settings.Host","system_state",state_name)
-
-		if (state_name == "HOST_POWERED_OFF" and self.Get(DBUS_NAME,"reboot")==1):
-			self.powerOn()
-
-	def power_button_signal_handler(self):
-		# toggle power
-		state = self.getPowerState()
-		if state == POWER_OFF:
-			self.powerOn()
-		elif state == POWER_ON:
-			self.powerOff();
-
-	def reset_button_signal_handler(self):
-		self.reboot();
-
-	def softreset_button_signal_handler(self):
-		self.softReboot();
-		
-	def host_watchdog_signal_handler(self):
-		print "Watchdog Error, Hard Rebooting"
-		self.Set(DBUS_NAME,"reboot",1)
-		self.powerOff()
-
-	def emergency_shutdown_signal_handler(self):
-		print "Emergency Shutdown!"
-		self.powerOff()
-		
-		
+
+class ChassisControlObject(DbusProperties, DbusObjectManager):
+    def getUuid(self):
+        uuid = "";
+        try:
+            with open(MACHINE_ID) as f:
+                data = f.readline().rstrip('\n')
+                if (len(data) == 32):
+                    uuid = data
+                else:
+                    print "ERROR:  UUID is not formatted correctly: " + data
+        except:
+            print "ERROR: Unable to open uuid file: " + MACHINE_ID
+
+        return uuid
+
+    def __init__(self, bus, name):
+        self.dbus_objects = {}
+        DbusProperties.__init__(self)
+        DbusObjectManager.__init__(self)
+        dbus.service.Object.__init__(self, bus, name)
+        ## load utilized objects
+        self.dbus_objects = {
+            'power_control': {
+                'bus_name': 'org.openbmc.control.Power',
+                'object_name': '/org/openbmc/control/power0',
+                'interface_name': 'org.openbmc.control.Power'
+            },
+            'identify_led': {
+                'bus_name': 'org.openbmc.control.led',
+                'object_name': '/org/openbmc/control/led/identify',
+                'interface_name': 'org.openbmc.Led'
+            },
+            'watchdog': {
+                'bus_name': 'org.openbmc.watchdog.Host',
+                'object_name': '/org/openbmc/watchdog/host0',
+                'interface_name': 'org.openbmc.Watchdog'
+            },
+            'host_services': {
+                'bus_name': 'org.openbmc.HostServices',
+                'object_name': '/org/openbmc/HostServices',
+                'interface_name': 'org.openbmc.HostServices'
+            },
+            'settings': {
+                'bus_name': 'org.openbmc.settings.Host',
+                'object_name': '/org/openbmc/settings/host0',
+                'interface_name': 'org.freedesktop.DBus.Properties'
+            },
+            'control': {
+                'bus_name': 'org.openbmc.control.Host',
+                'object_name': '/org/openbmc/control/host0',
+                'interface_name': 'org.openbmc.control.Host'
+            },
+        }
+
+        # uuid
+        self.Set(DBUS_NAME, "uuid", self.getUuid())
+        self.Set(DBUS_NAME, "reboot", 0)
+
+        bus.add_signal_receiver(self.power_button_signal_handler,
+                                dbus_interface="org.openbmc.Button",
+                                signal_name="Released",
+                                path="/org/openbmc/buttons/power0")
+        bus.add_signal_receiver(self.reset_button_signal_handler,
+                                dbus_interface="org.openbmc.Button",
+                                signal_name="PressedLong",
+                                path="/org/openbmc/buttons/power0")
+        bus.add_signal_receiver(self.softreset_button_signal_handler,
+                                dbus_interface="org.openbmc.Button",
+                                signal_name="Released",
+                                path="/org/openbmc/buttons/reset0")
+
+        bus.add_signal_receiver(self.host_watchdog_signal_handler,
+                                dbus_interface="org.openbmc.Watchdog",
+                                signal_name="WatchdogError")
+
+        bus.add_signal_receiver(self.emergency_shutdown_signal_handler,
+                                dbus_interface="org.openbmc.SensorThresholds",
+                                signal_name="Emergency")
+
+        bus.add_signal_receiver(self.SystemStateHandler,
+                                signal_name="GotoSystemState")
+        self.InterfacesAdded(name, self.properties)
+
+
+    def getInterface(self, name):
+        o = self.dbus_objects[name]
+        obj = bus.get_object(o['bus_name'], o['object_name'], introspect=False)
+        return dbus.Interface(obj, o['interface_name'])
+
+
+    @dbus.service.method(DBUS_NAME,
+                         in_signature='', out_signature='')
+    def setIdentify(self):
+        print "Turn on identify"
+        intf = self.getInterface('identify_led')
+        intf.setOn()
+        return None
+
+    @dbus.service.method(DBUS_NAME,
+                         in_signature='', out_signature='')
+    def clearIdentify(self):
+        print "Turn on identify"
+        intf = self.getInterface('identify_led')
+        intf.setOff()
+        return None
+
+    @dbus.service.method(DBUS_NAME,
+                         in_signature='', out_signature='')
+    def powerOn(self):
+        print "Turn on power and boot"
+        self.Set(DBUS_NAME, "reboot", 0)
+        if (self.getPowerState() == 0):
+            intf = self.getInterface('power_control')
+            intf.setPowerState(POWER_ON)
+
+            # Determine if debug_mode is set.  If it is then we don't
+            # want to start the watchdog since debug mode
+            intfcontrol = self.getInterface('control')
+            intfproperties = dbus.Interface(intfcontrol,
+                                            "org.freedesktop.DBus.Properties")
+            debug_mode = intfproperties.Get('org.openbmc.control.Host',
+                                            'debug_mode')
+            if(not debug_mode):
+                intfwatchdog = self.getInterface('watchdog')
+                # Start watchdog with 30s timeout per the OpenPower Host IPMI Spec
+                #Once the host starts booting, it'll reset and refresh the timer
+                intfwatchdog.set(30000)
+                intfwatchdog.start()
+            else:
+                print "Debug mode is on, no watchdog"
+        return None
+
+    @dbus.service.method(DBUS_NAME,
+                         in_signature='', out_signature='')
+    def powerOff(self):
+        print "Turn off power"
+        intfwatchdog = self.getInterface('watchdog')
+        intfwatchdog.stop()
+        intf = self.getInterface('power_control')
+        intf.setPowerState(POWER_OFF)
+        return None
+
+    @dbus.service.method(DBUS_NAME,
+                         in_signature='', out_signature='')
+    def softPowerOff(self):
+        print "Soft off power"
+        intf = self.getInterface('host_services')
+        ## host services will call power off when ready
+        intf.SoftPowerOff()
+        return None
+
+    @dbus.service.method(DBUS_NAME,
+                         in_signature='', out_signature='')
+    def reboot(self):
+        print "Rebooting"
+        if self.getPowerState() == POWER_OFF:
+            self.powerOn();
+        else:
+            self.Set(DBUS_NAME, "reboot", 1)
+            self.powerOff()
+        return None
+
+    @dbus.service.method(DBUS_NAME,
+                         in_signature='', out_signature='')
+    def softReboot(self):
+        print "Soft Rebooting"
+        if self.getPowerState() == POWER_OFF:
+            self.powerOn();
+        else:
+            self.Set(DBUS_NAME, "reboot", 1)
+            self.softPowerOff()
+        return None
+
+    @dbus.service.method(DBUS_NAME,
+                         in_signature='', out_signature='i')
+    def getPowerState(self):
+        intf = self.getInterface('power_control')
+        return intf.getPowerState()
+
+    ## Signal handler
+
+    def SystemStateHandler(self, state_name):
+        if (
+            state_name == "HOST_POWERED_OFF" or state_name == "HOST_POWERED_ON"):
+            intf = self.getInterface('settings')
+            intf.Set("org.openbmc.settings.Host", "system_state", state_name)
+
+        if (state_name == "HOST_POWERED_OFF" and self.Get(DBUS_NAME,
+                                                          "reboot") == 1):
+            self.powerOn()
+
+    def power_button_signal_handler(self):
+        # toggle power
+        state = self.getPowerState()
+        if state == POWER_OFF:
+            self.powerOn()
+        elif state == POWER_ON:
+            self.powerOff();
+
+    def reset_button_signal_handler(self):
+        self.reboot();
+
+    def softreset_button_signal_handler(self):
+        self.softReboot();
+
+    def host_watchdog_signal_handler(self):
+        print "Watchdog Error, Hard Rebooting"
+        self.Set(DBUS_NAME, "reboot", 1)
+        self.powerOff()
+
+    def emergency_shutdown_signal_handler(self):
+        print "Emergency Shutdown!"
+        self.powerOff()
+
 
 if __name__ == '__main__':
     dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
@@ -218,7 +242,7 @@ if __name__ == '__main__':
     name = dbus.service.BusName(DBUS_NAME, bus)
     obj = ChassisControlObject(bus, OBJ_NAME)
     mainloop = gobject.MainLoop()
-    
+
     print "Running ChassisControlService"
     mainloop.run()
 
-- 
2.9.0
