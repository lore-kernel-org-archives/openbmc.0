Return-Path: <cyrilbur@gmail.com>
Received: from mail-pf0-x243.google.com (mail-pf0-x243.google.com
 [IPv6:2607:f8b0:400e:c00::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r8cCD5q5TzDqD3
 for <openbmc@lists.ozlabs.org>; Wed, 18 May 2016 11:32:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=mnwVeRRL; 
 dkim-atps=neutral
Received: by mail-pf0-x243.google.com with SMTP id 145so3449880pfz.1
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2016 18:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3ybAAiSYUxVVQphgGGwbHznw/Mq8EzhGBEpiVT4dHhM=;
 b=mnwVeRRLfTtx195qR8dUsrDtp60wnnld6BUi2MyC3OWDb5ydf7Xyh3LQY19zNIcMRO
 aTWDpOvM1ZXESCbWFq5Z/Uji3jyXjJoojXOBBdfxFrrbGAHHgRfIHnq9+Dn2zp3v/44i
 KN0WZXaRJd/I6C0cDCPVV4XstyuDRye1xOwIwj4cq0IfbYmpbJXkpl6V/ntCpiK46W4l
 XHv8Eci0jMQ4hv+oZYcXNlII9lEUr9cArV3w0SnuVWJjLB3iIec+wdLqwIsakokIuXag
 VjNpCM1VWVGcAxEzy5+zjjvkw6JljFzE+DPI09vz/7BxkMdlTfdlA9yWGWThfaOA4Cwo
 1/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3ybAAiSYUxVVQphgGGwbHznw/Mq8EzhGBEpiVT4dHhM=;
 b=CB/Yzx0nsz8n+pUHDzT3hgv91WEgoe8Xx/ApkcmBSSpu5fXOkETIbVx6yrFjLA3f+T
 bUMP9Vm0tpckFkPggprCGXOBxH6uMmMyjDGvoqdHjrlgc3tyFECgmC0w6BVhNGXX8jWE
 rvzsY8fXQ/0P5EbWL6BonoyfybF098DsFQ/RxdCoLex0/JnXJTOqhO5LRAWF1R0ml4Xl
 DfDnqU4lti6ai/q95ubgY7hEkKYP1RbnNepNycvQnyOqvswnVwIB6njVswtjvBt/or1i
 BEMP/ywmSm3x50wZS8PfngfB0bF3lthprtVkeez0qt0zMUe0JyYlutUhvF2YRJr1msgO
 ou2Q==
X-Gm-Message-State: AOPr4FWiczvSbaqMQipmNjRkekqfsUuV85V2Iwp+Z0HhD/nNBSYch2FRcuE9xG2bheeU/g==
X-Received: by 10.98.1.202 with SMTP id 193mr6869221pfb.10.1463535155260;
 Tue, 17 May 2016 18:32:35 -0700 (PDT)
Received: from camb691 ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id ry2sm7581021pac.9.2016.05.17.18.32.33
 (version=TLSv1/SSLv3 cipher=OTHER);
 Tue, 17 May 2016 18:32:35 -0700 (PDT)
Date: Wed, 18 May 2016 11:32:26 +1000
From: Cyril Bur <cyrilbur@gmail.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org, Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: Re: [PATCH skeleton v2 1/3] Deprecate Openbmc.py
Message-ID: <20160518113226.49aa8f0e@camb691>
In-Reply-To: <1463533256-19471-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1463533256-19471-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1463533256-19471-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Wed, 18 May 2016 01:32:57 -0000

On Tue, 17 May 2016 20:00:54 -0500
OpenBMC Patches <openbmc-patches@stwcx.xyz> wrote:

> From: Brad Bishop <bradleyb@fuzziesquirrel.com>
> 
> The pyphosphor package provides equivalent function
> so use that and drop the duplicated code.
> 
> Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>

Love deleting duplicated code!

Reviewed-by: Cyril Bur <cyrilbur@gmail.com>

> ---
>  bin/Openbmc.py          | 146 ------------------------------------------------
>  bin/PropertyCacher.py   |   1 -
>  bin/Sensors.py          |  11 ++--
>  bin/bmc_update.py       |  10 ++--
>  bin/chassis_control.py  |  11 ++--
>  bin/download_manager.py |   5 +-
>  bin/fan_control.py      |  10 ++--
>  bin/hwmon.py            |   4 +-
>  bin/inventory_items.py  |  14 ++---
>  bin/sensor_manager2.py  |  10 ++--
>  bin/system_manager.py   |  14 ++---
>  11 files changed, 44 insertions(+), 192 deletions(-)
>  delete mode 100755 bin/Openbmc.py
> 
> diff --git a/bin/Openbmc.py b/bin/Openbmc.py
> deleted file mode 100755
> index b87fec8..0000000
> --- a/bin/Openbmc.py
> +++ /dev/null
> @@ -1,146 +0,0 @@
> -import dbus
> -
> -BUS_PREFIX = 'org.openbmc'
> -OBJ_PREFIX = "/org/openbmc"
> -GPIO_DEV = '/sys/class/gpio'
> -BUS = "system"
> -
> -def getSystemName():
> -	#use filename as system name, strip off path and ext
> -	parts = __file__.replace('.pyc','').replace('.py','').split('/')
> -	return parts[len(parts)-1]
> -
> -def getDBus():
> -	bus = None
> -	if (BUS == "session"):
> -		bus = dbus.SessionBus()
> -	else:
> -		bus = dbus.SystemBus()
> -	return bus
> -
> -class DbusProperties(dbus.service.Object):
> -	def __init__(self):
> -		dbus.service.Object.__init__(self)
> -		self.properties = {}
> -		self.object_path = ""
> -
> -	@dbus.service.method(dbus.PROPERTIES_IFACE,
> -		in_signature='ss', out_signature='v')
> -	def Get(self, interface_name, property_name):
> -		d = self.GetAll(interface_name)
> -		try:
> -			v = d[property_name]
> -			return v
> -		except:
> - 			raise dbus.exceptions.DBusException(
> -				"org.freedesktop.UnknownPropery: "+property_name)
> -
> -	@dbus.service.method(dbus.PROPERTIES_IFACE,
> -		in_signature='s', out_signature='a{sv}')
> -	def GetAll(self, interface_name):
> -		try:
> -			d = self.properties[interface_name]
> -			return d
> - 		except:
> - 			raise dbus.exceptions.DBusException(
> -				"org.freedesktop.UnknownInterface: "+interface_name)
> -
> -	@dbus.service.method(dbus.PROPERTIES_IFACE,
> -		in_signature='ssv')
> -	def Set(self, interface_name, property_name, new_value):
> -		if (self.properties.has_key(interface_name) == False):
> -			self.properties[interface_name] = {}
> -		try:
> -			old_value = self.properties[interface_name][property_name] 
> -			if (old_value != new_value):
> -				self.properties[interface_name][property_name] = new_value
> -				self.PropertiesChanged(interface_name,{ property_name: new_value }, [])
> -				
> -		except:
> -        		self.properties[interface_name][property_name] = new_value
> -			self.PropertiesChanged(interface_name,{ property_name: new_value }, [])
> -
> -	@dbus.service.method("org.openbmc.Object.Properties",
> -		in_signature='sa{sv}')
> -	def SetMultiple(self, interface_name, prop_dict):
> -		if (self.properties.has_key(interface_name) == False):
> -			self.properties[interface_name] = {}
> -
> -		value_changed  = False
> -		for property_name in prop_dict:
> -			new_value = prop_dict[property_name]
> -			try:
> -				old_value = self.properties[interface_name][property_name] 
> -				if (old_value != new_value):
> -					self.properties[interface_name][property_name] = new_value
> -					value_changed = True
> -				
> -			except:
> -        			self.properties[interface_name][property_name] = new_value
> -				value_changed = True
> -		if (value_changed == True):
> -			self.PropertiesChanged(interface_name, prop_dict, [])
> -	
> -	@dbus.service.signal(dbus.PROPERTIES_IFACE,
> -		signature='sa{sv}as')
> -	def PropertiesChanged(self, interface_name, changed_properties,
> -		invalidated_properties):
> -		pass
> -
> -class DbusObjectManager(dbus.service.Object):
> -	def __init__(self):
> -		dbus.service.Object.__init__(self)
> -		self.objects = {}
> -
> -	def add(self,object_path,obj):
> -		self.objects[object_path] = obj
> -		self.InterfacesAdded(object_path,obj.properties)
> -
> -	def remove(self,object_path):
> -		obj = self.objects.pop(object_path,None)
> -		obj.remove_from_connection()
> -		self.InterfacesRemoved(object_path,obj.properties.keys())
> -
> -	def get(self,object_path):
> -		return self.objects[object_path]
> -
> -	@dbus.service.method("org.freedesktop.DBus.ObjectManager",
> -		in_signature='', out_signature='a{oa{sa{sv}}}')
> -	def GetManagedObjects(self):
> -		data = {}
> -		for objpath in self.objects.keys():
> -			data[objpath] = self.objects[objpath].properties
> -		return data
> -
> -	@dbus.service.signal("org.freedesktop.DBus.ObjectManager",
> -		signature='oa{sa{sv}}')
> -	def InterfacesAdded(self,object_path,properties):
> -		self.ObjectAdded(object_path,"")
> -
> -	@dbus.service.signal("org.freedesktop.DBus.ObjectManager",
> -		signature='oas')
> -	def InterfacesRemoved(self,object_path,interfaces):
> -		pass
> -
> -	## Legacy support, need to eventually refactor out
> -	@dbus.service.signal("org.openbmc.Object.ObjectMapper",
> -		signature='ss')
> -	def ObjectAdded(self,object_path,interface_name):
> -		pass
> -
> -	## flattens interfaces
> -	@dbus.service.method('org.openbmc.Object.Enumerate',
> -		in_signature='', out_signature='a{sa{sv}}')
> -	def enumerate(self):
> -		data = {}
> -		for objpath in self.objects.keys():
> -			props = self.objects[objpath].properties
> -			data[objpath] = { }
> -			for iface in props.keys():
> -				data[objpath].update(props[iface])
> -				
> -		return data
> -		
> -
> -
> -
> diff --git a/bin/PropertyCacher.py b/bin/PropertyCacher.py
> index b10edcb..dfbb0b9 100644
> --- a/bin/PropertyCacher.py
> +++ b/bin/PropertyCacher.py
> @@ -1,7 +1,6 @@
>  import os
>  import cPickle
>  import json
> -import Openbmc
>  
>  CACHE_PATH = '/var/cache/obmc/'
>  
> diff --git a/bin/Sensors.py b/bin/Sensors.py
> index ecdac91..7c58c97 100755
> --- a/bin/Sensors.py
> +++ b/bin/Sensors.py
> @@ -8,13 +8,12 @@ import dbus
>  import dbus.service
>  import dbus.mainloop.glib
>  import os
> -import Openbmc
> +from obmc.dbuslib.bindings import DbusProperties
>  
>  ## Abstract class, must subclass
> -class SensorValue(Openbmc.DbusProperties):
> +class SensorValue(DbusProperties):
>  	IFACE_NAME = 'org.openbmc.SensorValue'
>  	def __init__(self,bus,name):
> -		#Openbmc.DbusProperties.__init__(self)
>  		self.Set(SensorValue.IFACE_NAME,'units',"")
>  		self.Set(SensorValue.IFACE_NAME,'error',False)
>  		
> @@ -28,7 +27,7 @@ class SensorValue(Openbmc.DbusProperties):
>  	def getValue(self):
>  		return self.Get(SensorValue.IFACE_NAME,'value')
>  
> -class SensorThresholds(Openbmc.DbusProperties):
> +class SensorThresholds(DbusProperties):
>  	IFACE_NAME = 'org.openbmc.SensorThresholds'
>  	def __init__(self,bus,name):
>  		self.Set(SensorThresholds.IFACE_NAME,'thresholds_enabled',False)
> @@ -85,14 +84,14 @@ class SensorThresholds(Openbmc.DbusProperties):
>  
>  class VirtualSensor(SensorValue):
>  	def __init__(self,bus,name):
> -		Openbmc.DbusProperties.__init__(self)
> +		DbusProperties.__init__(self)
>  		SensorValue.__init__(self,bus,name)
>  		dbus.service.Object.__init__(self,bus,name)
>  
>  class HwmonSensor(SensorValue,SensorThresholds):
>  	IFACE_NAME = 'org.openbmc.HwmonSensor'
>  	def __init__(self,bus,name):
> -		Openbmc.DbusProperties.__init__(self)
> +		DbusProperties.__init__(self)
>  		SensorValue.__init__(self,bus,name)
>  		SensorThresholds.__init__(self,bus,name)
>  		self.Set(HwmonSensor.IFACE_NAME,'scale',1)
> diff --git a/bin/bmc_update.py b/bin/bmc_update.py
> index a3032cf..0555fd3 100755
> --- a/bin/bmc_update.py
> +++ b/bin/bmc_update.py
> @@ -4,10 +4,10 @@ import gobject
>  import dbus
>  import dbus.service
>  import dbus.mainloop.glib
> -import Openbmc
>  import shutil
>  import tarfile
>  import os
> +from obmc.dbuslib.bindings import get_dbus, DbusProperties, DbusObjectManager
>  
>  DBUS_NAME = 'org.openbmc.control.BmcFlash'
>  OBJ_NAME = '/org/openbmc/control/flash/bmc'
> @@ -23,11 +23,11 @@ def doExtract(members,files):
>              yield tarinfo
>  
>  
> -class BmcFlashControl(Openbmc.DbusProperties,Openbmc.DbusObjectManager):
> +class BmcFlashControl(DbusProperties,DbusObjectManager):
>  	def __init__(self,bus,name):
>  		self.dbus_objects = { }
> -		Openbmc.DbusProperties.__init__(self)
> -		Openbmc.DbusObjectManager.__init__(self)
> +		DbusProperties.__init__(self)
> +		DbusObjectManager.__init__(self)
>  		dbus.service.Object.__init__(self,bus,name)
>  		
>  		self.Set(DBUS_NAME,"status","Idle")
> @@ -122,7 +122,7 @@ class BmcFlashControl(Openbmc.DbusProperties,Openbmc.DbusObjectManager):
>  if __name__ == '__main__':
>      dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
>  
> -    bus = Openbmc.getDBus()
> +    bus = get_dbus()
>      name = dbus.service.BusName(DBUS_NAME, bus)
>      obj = BmcFlashControl(bus, OBJ_NAME)
>      mainloop = gobject.MainLoop()
> diff --git a/bin/chassis_control.py b/bin/chassis_control.py
> index 334fbbf..376e0e9 100755
> --- a/bin/chassis_control.py
> +++ b/bin/chassis_control.py
> @@ -2,12 +2,11 @@
>  
>  import sys
>  import uuid
> -#from gi.repository import GObject
>  import gobject
>  import dbus
>  import dbus.service
>  import dbus.mainloop.glib
> -import Openbmc
> +from obmc.dbuslib.bindings import get_dbus, DbusProperties, DbusObjectManager
>  
>  DBUS_NAME = 'org.openbmc.control.Chassis'
>  OBJ_NAME = '/org/openbmc/control/chassis0'
> @@ -20,7 +19,7 @@ POWER_ON = 1
>  
>  BOOTED = 100
>  
> -class ChassisControlObject(Openbmc.DbusProperties,Openbmc.DbusObjectManager):
> +class ChassisControlObject(DbusProperties,DbusObjectManager):
>  	def getUuid(self):
>  		uuid = "";
>  		try:
> @@ -37,8 +36,8 @@ class ChassisControlObject(Openbmc.DbusProperties,Openbmc.DbusObjectManager):
>   
>  	def __init__(self,bus,name):
>  		self.dbus_objects = { }
> -		Openbmc.DbusProperties.__init__(self)
> -		Openbmc.DbusObjectManager.__init__(self)
> +		DbusProperties.__init__(self)
> +		DbusObjectManager.__init__(self)
>  		dbus.service.Object.__init__(self,bus,name)
>  		## load utilized objects
>  		self.dbus_objects = {
> @@ -215,7 +214,7 @@ class ChassisControlObject(Openbmc.DbusProperties,Openbmc.DbusObjectManager):
>  if __name__ == '__main__':
>      dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
>  
> -    bus = Openbmc.getDBus()
> +    bus = get_dbus()
>      name = dbus.service.BusName(DBUS_NAME, bus)
>      obj = ChassisControlObject(bus, OBJ_NAME)
>      mainloop = gobject.MainLoop()
> diff --git a/bin/download_manager.py b/bin/download_manager.py
> index 36005d5..ba502da 100755
> --- a/bin/download_manager.py
> +++ b/bin/download_manager.py
> @@ -6,7 +6,8 @@ import dbus
>  import dbus.service
>  import dbus.mainloop.glib
>  import subprocess
> -import Openbmc
> +from obmc.dbuslib.bindings import get_dbus
> +
>  if (len(sys.argv) < 2):
>  	print "Usage:  download_manager.py [system name]"
>  	exit(1)
> @@ -73,7 +74,7 @@ class DownloadManagerObject(dbus.service.Object):
>  
>  if __name__ == '__main__':
>      dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
> -    bus = Openbmc.getDBus()
> +    bus = get_dbus()
>      name = dbus.service.BusName(DBUS_NAME, bus)
>      obj = DownloadManagerObject(bus, OBJ_NAME)
>      mainloop = gobject.MainLoop()
> diff --git a/bin/fan_control.py b/bin/fan_control.py
> index bb070e5..cea2215 100755
> --- a/bin/fan_control.py
> +++ b/bin/fan_control.py
> @@ -6,7 +6,7 @@ import gobject
>  import dbus
>  import dbus.service
>  import dbus.mainloop.glib
> -import Openbmc
> +from obmc.dbuslib.bindings import get_dbus, DbusProperties, DbusObjectManager
>  
>  DBUS_NAME = 'org.openbmc.control.Fans'
>  OBJ_PATH = '/org/openbmc/control/fans'
> @@ -23,10 +23,10 @@ FAN_OBJS = [
>  ]
>  FAN_IFACE = 'org.openbmc.SensorValue'
>  
> -class FanControl(Openbmc.DbusProperties,Openbmc.DbusObjectManager):
> +class FanControl(DbusProperties,DbusObjectManager):
>  	def __init__(self,bus,name):
> -		Openbmc.DbusProperties.__init__(self)
> -		Openbmc.DbusObjectManager.__init__(self)
> +		DbusProperties.__init__(self)
> +		DbusObjectManager.__init__(self)
>  		dbus.service.Object.__init__(self,bus,name)
>  		self.Set(IFACE_NAME,"floor",250)
>  		self.Set(IFACE_NAME,"ceiling",255)
> @@ -49,7 +49,7 @@ class FanControl(Openbmc.DbusProperties,Openbmc.DbusObjectManager):
>  if __name__ == '__main__':
>  	
>  	dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
> -	bus = Openbmc.getDBus()
> +	bus = get_dbus()
>  	name = dbus.service.BusName(DBUS_NAME,bus)
>  	fan_control = FanControl(bus,OBJ_PATH)
>  	mainloop = gobject.MainLoop()
> diff --git a/bin/hwmon.py b/bin/hwmon.py
> index 08c6f06..7e1858e 100755
> --- a/bin/hwmon.py
> +++ b/bin/hwmon.py
> @@ -7,8 +7,8 @@ import glob
>  import dbus
>  import dbus.service
>  import dbus.mainloop.glib
> -import Openbmc
>  import re
> +from obmc.dbuslib.bindings import get_dbus
>  
>  from Sensors import SensorValue as SensorValue
>  from Sensors import HwmonSensor as HwmonSensor
> @@ -159,7 +159,7 @@ class Hwmons():
>  if __name__ == '__main__':
>  	
>  	dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
> -	bus = Openbmc.getDBus()
> +	bus = get_dbus()
>  	root_sensor = Hwmons(bus)
>  	mainloop = gobject.MainLoop()
>  
> diff --git a/bin/inventory_items.py b/bin/inventory_items.py
> index e0351a8..bf7f414 100755
> --- a/bin/inventory_items.py
> +++ b/bin/inventory_items.py
> @@ -9,29 +9,29 @@ import dbus.mainloop.glib
>  import cPickle
>  import json
>  import PropertyCacher
> +from obmc.dbuslib.bindings import get_dbus, DbusProperties, DbusObjectManager
>  
>  if (len(sys.argv) < 2):
>  	print "Usage:  inventory_items.py [system name]"
>  	exit(1)
>  System = __import__(sys.argv[1])
> -import Openbmc
>  
>  
>  INTF_NAME = 'org.openbmc.InventoryItem'
>  DBUS_NAME = 'org.openbmc.Inventory'
>  FRUS = System.FRU_INSTANCES
>  
> -class Inventory(Openbmc.DbusProperties,Openbmc.DbusObjectManager):
> +class Inventory(DbusProperties,DbusObjectManager):
>  	def __init__(self,bus,name):
> -		Openbmc.DbusProperties.__init__(self)
> -		Openbmc.DbusObjectManager.__init__(self)
> +		DbusProperties.__init__(self)
> +		DbusObjectManager.__init__(self)
>  		dbus.service.Object.__init__(self,bus,name)
>  		self.InterfacesAdded(name,self.properties)
>  
>  
> -class InventoryItem(Openbmc.DbusProperties):
> +class InventoryItem(DbusProperties):
>  	def __init__(self,bus,name,data):		
> -		Openbmc.DbusProperties.__init__(self)
> +		DbusProperties.__init__(self)
>  		dbus.service.Object.__init__(self,bus,name)
>  
>  		self.name = name
> @@ -78,7 +78,7 @@ def getVersion():
>  
>  if __name__ == '__main__':
>      dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
> -    bus = Openbmc.getDBus()
> +    bus = get_dbus()
>      mainloop = gobject.MainLoop()
>      obj_parent = Inventory(bus, '/org/openbmc/inventory')
>  
> diff --git a/bin/sensor_manager2.py b/bin/sensor_manager2.py
> index b5aac53..b06b9a5 100755
> --- a/bin/sensor_manager2.py
> +++ b/bin/sensor_manager2.py
> @@ -6,17 +6,17 @@ import gobject
>  import dbus
>  import dbus.service
>  import dbus.mainloop.glib
> -import Openbmc
>  import Sensors
> +from obmc.dbuslib.bindings import DbusProperties, DbusObjectManager, get_dbus
>  
>  DBUS_NAME = 'org.openbmc.Sensors'
>  OBJ_PATH = '/org/openbmc/sensors'
>  
>  
> -class SensorManager(Openbmc.DbusProperties,Openbmc.DbusObjectManager):
> +class SensorManager(DbusProperties,DbusObjectManager):
>  	def __init__(self,bus,name):
> -		Openbmc.DbusProperties.__init__(self)
> -		Openbmc.DbusObjectManager.__init__(self)
> +		DbusProperties.__init__(self)
> +		DbusObjectManager.__init__(self)
>  		dbus.service.Object.__init__(self,bus,name)
>  		self.InterfacesAdded(name,self.properties)
>  
> @@ -43,7 +43,7 @@ class SensorManager(Openbmc.DbusProperties,Openbmc.DbusObjectManager):
>  			
>  if __name__ == '__main__':
>  	dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
> -	bus = Openbmc.getDBus()
> +	bus = get_dbus()
>  	name = dbus.service.BusName(DBUS_NAME,bus)
>  	root_sensor = SensorManager(bus,OBJ_PATH)
>  
> diff --git a/bin/system_manager.py b/bin/system_manager.py
> index e74788a..2331131 100755
> --- a/bin/system_manager.py
> +++ b/bin/system_manager.py
> @@ -9,14 +9,14 @@ import dbus.mainloop.glib
>  import os
>  import time
>  import PropertyCacher
> -import Openbmc
> +from obmc.dbuslib.bindings import DbusProperties, DbusObjectManager, get_dbus
> +import obmc.enums
>  
>  if (len(sys.argv) < 2):
>  	print "Usage:  system_manager.py [system name]"
>  	exit(1)
>  
>  System = __import__(sys.argv[1])
> -import Openbmc
>  
>  DBUS_NAME = 'org.openbmc.managers.System'
>  OBJ_NAME = '/org/openbmc/managers/System'
> @@ -27,10 +27,10 @@ INTF_ITEM = 'org.openbmc.InventoryItem'
>  INTF_CONTROL = 'org.openbmc.Control'
>  
>  
> -class SystemManager(Openbmc.DbusProperties,Openbmc.DbusObjectManager):
> +class SystemManager(DbusProperties,DbusObjectManager):
>  	def __init__(self,bus,obj_name):
> -		Openbmc.DbusProperties.__init__(self)
> -		Openbmc.DbusObjectManager.__init__(self)
> +		DbusProperties.__init__(self)
> +		DbusObjectManager.__init__(self)
>  		dbus.service.Object.__init__(self,bus,obj_name)
>  
>  		bus.add_signal_receiver(self.NewObjectHandler,
> @@ -218,14 +218,14 @@ class SystemManager(Openbmc.DbusProperties,Openbmc.DbusObjectManager):
>  					print "ERROR: SystemManager - GPIO lookup failed for "+name
>  		
>  			if (gpio_num != -1):
> -				r = [Openbmc.GPIO_DEV, gpio_num, gpio['direction']]
> +				r = [obmc.enums.GPIO_DEV, gpio_num, gpio['direction']]
>  		return r
>  
>  		
>  
>  if __name__ == '__main__':
>      dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
> -    bus = Openbmc.getDBus()
> +    bus = get_dbus()
>      name = dbus.service.BusName(DBUS_NAME,bus)
>      obj = SystemManager(bus,OBJ_NAME)
>      mainloop = gobject.MainLoop()
