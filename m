Return-Path: <cyrilbur@gmail.com>
Received: from mail-pa0-x242.google.com (mail-pa0-x242.google.com
 [IPv6:2607:f8b0:400e:c03::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r8cCs2BDWzDqBM
 for <openbmc@lists.ozlabs.org>; Wed, 18 May 2016 11:33:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=AAhpWKOh; 
 dkim-atps=neutral
Received: by mail-pa0-x242.google.com with SMTP id yl2so3325563pac.1
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2016 18:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jutbEH5tLXJpnzugwsj80ovICC4H4q4QwQib8EKtnqA=;
 b=AAhpWKOhTMkYPPjqp8bgtTOpgwPHoutFThTrCnpfYellRrPhB89D5Ev7SSpnvmhpOB
 bGNs+kX5tJsAYeP0OsExS4icl7bPZhOTOVSHQHkEmQFE1VYXeTMWrnrTllZRsXruQBBI
 uHlOu2wRg12bSTBbjT83+6qoY2GogmCZ2GMFgxdMCGBrGBil+qY8ZGCLuKQgQVRa6yLs
 Qa4ZabpoKRTQod0Rj16MDeYpI+AJMn1EuZVVu6/uxG2x+4Uv72Lj3JAWU2q5KSD7TOcO
 1W0t33rOPr7S0wFk5RVQyIPodlhvylhxP9ouXWTuk4ooczz8m9XCzO2XFIVp9489m3s4
 L6SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jutbEH5tLXJpnzugwsj80ovICC4H4q4QwQib8EKtnqA=;
 b=KHEtDrV1ZYQA5lI4BZ9PTwuEQllhebCtasjoU240u1NK6BnjJSuGoubMjaBg6TcbLm
 zQOVsElQMtEHWLKEboVYOwwmjKLRZyvG1D8fSMDIKv55pwBQUqE0U9cyM7GfJTazcLqL
 ZoGqDl1y64EfCG4u91dsZkQobG/FMJF2FUPiCWTFE2XAWP8t9+NKG5dgZeDe5RE84Jvw
 IMypb+2RX9HGm/wf4ZVPJ+ywaK8Gy0xwgRtp3SU6+pogcW3+Ul7+zbADRrI8tftJ/v3/
 kul2sr10YrEykGyvShAXJ//jCDUkwoI4Loe4O4fWiSCWiEXMRwjbrkqAkO/jLLe8VJTH
 FLuA==
X-Gm-Message-State: AOPr4FUzZBFCpfi3tsUXJZa6tOlQXo+pmiJeEwNKTsihX1CQM0KO8k2emQ7ZmCWdLp9XLw==
X-Received: by 10.66.122.175 with SMTP id lt15mr6679559pab.51.1463535207529;
 Tue, 17 May 2016 18:33:27 -0700 (PDT)
Received: from camb691 ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id pw3sm7585949pac.6.2016.05.17.18.33.25
 (version=TLSv1/SSLv3 cipher=OTHER);
 Tue, 17 May 2016 18:33:27 -0700 (PDT)
Date: Wed, 18 May 2016 11:33:21 +1000
From: Cyril Bur <cyrilbur@gmail.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org, Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: Re: [PATCH skeleton v2 3/3] Deprecate Sensors.py
Message-ID: <20160518113321.06d576f9@camb691>
In-Reply-To: <1463533256-19471-4-git-send-email-openbmc-patches@stwcx.xyz>
References: <1463533256-19471-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1463533256-19471-4-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 18 May 2016 01:33:29 -0000

On Tue, 17 May 2016 20:00:56 -0500
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
>  bin/Sensors.py         | 222 -------------------------------------------------
>  bin/hwmon.py           |   6 +-
>  bin/inventory_items.py |   2 +-
>  bin/sensor_manager2.py |  16 ++--
>  bin/system_manager.py  |   2 +-
>  5 files changed, 13 insertions(+), 235 deletions(-)
>  delete mode 100755 bin/Sensors.py
> 
> diff --git a/bin/Sensors.py b/bin/Sensors.py
> deleted file mode 100755
> index 7c58c97..0000000
> --- a/bin/Sensors.py
> +++ /dev/null
> @@ -1,222 +0,0 @@
> -#!/usr/bin/python -u
> -
> -import sys
> -import subprocess
> -#from gi.repository import GObject
> -import gobject
> -import dbus
> -import dbus.service
> -import dbus.mainloop.glib
> -import os
> -from obmc.dbuslib.bindings import DbusProperties
> -
> -## Abstract class, must subclass
> -class SensorValue(DbusProperties):
> -	IFACE_NAME = 'org.openbmc.SensorValue'
> -	def __init__(self,bus,name):
> -		self.Set(SensorValue.IFACE_NAME,'units',"")
> -		self.Set(SensorValue.IFACE_NAME,'error',False)
> -		
> -	@dbus.service.method(IFACE_NAME,
> -		in_signature='v', out_signature='')
> -	def setValue(self,value):
> -		self.Set(SensorValue.IFACE_NAME,'value',value)
> -
> -	@dbus.service.method(IFACE_NAME,
> -		in_signature='', out_signature='v')
> -	def getValue(self):
> -		return self.Get(SensorValue.IFACE_NAME,'value')
> -
> -class SensorThresholds(DbusProperties):
> -	IFACE_NAME = 'org.openbmc.SensorThresholds'
> -	def __init__(self,bus,name):
> -		self.Set(SensorThresholds.IFACE_NAME,'thresholds_enabled',False)
> -		self.Set(SensorThresholds.IFACE_NAME,'emergency_enabled',False)
> -		self.Set(SensorThresholds.IFACE_NAME,'warning_upper',0)
> -		self.Set(SensorThresholds.IFACE_NAME,'warning_lower',0)
> -		self.Set(SensorThresholds.IFACE_NAME,'critical_upper',0)
> -		self.Set(SensorThresholds.IFACE_NAME,'critical_lower',0)
> -		self.Set(SensorThresholds.IFACE_NAME,'critical_lower',0)
> -		self.Set(SensorThresholds.IFACE_NAME,'threshold_state',"NORMAL")
> -		self.Set(SensorThresholds.IFACE_NAME,'worst_threshold_state',"NORMAL")
> -	
> -	@dbus.service.method(IFACE_NAME,
> -		in_signature='', out_signature='')
> -	def resetThresholdState(self):
> -		self.Set(SensorThresholds.IFACE_NAME,'worst_threshold_state',"NORMAL")
> -
> -	def check_thresholds(self,value):
> -		iface = SensorThresholds.IFACE_NAME
> -		if (self.Get(iface,'thresholds_enabled') == False):
> -			return False
> -		rtn = False
> -		current_state = "NORMAL"
> -		if (value >= self.properties[iface]['critical_upper']):
> -			current_state = "CRITICAL"
> -			rtn = True
> -		elif (value <= self.properties[iface]['critical_lower']):
> -			current_state = "CRITICAL"
> -			rtn = True
> -		elif (value >= self.properties[iface]['warning_upper']):
> -			current_state = "WARNING"
> -			rtn = True
> -		elif (value <= self.properties[iface]['warning_lower']):
> -			current_state = "WARNING"
> -			rtn = True
> -
> -		if (self.Get(iface,'threshold_state') != current_state and
> -		 		current_state == "CRITICAL" and
> -				self.Get(iface,'emergency_enabled') == True):
> -			self.Emergency()
> -
> -		self.Set(iface,'threshold_state',current_state)
> -		worst = self.properties[iface]['worst_threshold_state']
> -		if (current_state == "CRITICAL" or 
> -		   (current_state == "WARNING" and worst != "CRITICAL")):
> -			self.Set(iface,'worst_threshold_state',current_state)
> -
> -		return rtn
> -
> -	@dbus.service.signal(IFACE_NAME,signature='')
> -	def Emergency(self):
> -		pass
> -
> -
> -class VirtualSensor(SensorValue):
> -	def __init__(self,bus,name):
> -		DbusProperties.__init__(self)
> -		SensorValue.__init__(self,bus,name)
> -		dbus.service.Object.__init__(self,bus,name)
> -
> -class HwmonSensor(SensorValue,SensorThresholds):
> -	IFACE_NAME = 'org.openbmc.HwmonSensor'
> -	def __init__(self,bus,name):
> -		DbusProperties.__init__(self)
> -		SensorValue.__init__(self,bus,name)
> -		SensorThresholds.__init__(self,bus,name)
> -		self.Set(HwmonSensor.IFACE_NAME,'scale',1)
> -		self.Set(HwmonSensor.IFACE_NAME,'offset',0)
> -		self.Set(HwmonSensor.IFACE_NAME,'filename','')
> -		self.value_dirty = False
> -
> -		# need to cache value to know if changed
> -		self.value = None
> -		dbus.service.Object.__init__(self,bus,name)
> -
> -	@dbus.service.method(SensorValue.IFACE_NAME,
> -		in_signature='v', out_signature='')
> -	def setValue(self,value):
> -		self.value_dirty = True
> -		SensorValue.setValue(self,value)
> -
> -	## Called by sensor process to update value from polling
> -	## if returns not None, then sensor process will update hwmon value
> -	@dbus.service.method(IFACE_NAME,
> -		in_signature='v', out_signature='(bv)')
> -	def setByPoll(self,value):
> -		scale = self.properties[HwmonSensor.IFACE_NAME]['scale']
> -		offset = self.properties[HwmonSensor.IFACE_NAME]['offset']
> -		if (self.value_dirty == True):
> -			## new value externally set, so just return to hwmon
> -			## process to write value
> -			self.value_dirty = False
> -			val = (self.properties[SensorValue.IFACE_NAME]['value']-offset) * scale
> -			return [True,val]
> -		else:
> -			# Keep the val as integer. scale may be floating point
> -			val = int(value/scale + offset)
> -			if (val != self.value):
> -				SensorValue.setValue(self,val)
> -				self.check_thresholds(val)
> -				self.value = val
> -
> -			return [False,0]
> -		
> -CONTROL_IFACE = 'org.openbmc.Control'
> -class PowerCap(VirtualSensor):
> -	def __init__(self, bus, name):
> -		VirtualSensor.__init__(self, bus, name)
> -		SensorValue.setValue(self, 0)
> -		self.sysfs_attr = "/sys/class/hwmon/hwmon3/user_powercap"
> -	##override setValue method
> -	@dbus.service.method(SensorValue.IFACE_NAME,
> -		in_signature='v', out_signature='')
> -	def setValue(self, value):
> -		try:
> -			cmd_str = "echo "+str(value)+" > "+self.sysfs_attr
> -			ret = subprocess.check_output(cmd_str, shell=True)
> -		except subprocess.CalledProcessError as powerexc:
> -			print "Set PowerCap Error", powerexc.returncode,
> -			powerexc.output
> -			return
> -		print "Set PowerCap: ", value
> -		SensorValue.setValue(self, value)
> -		
> -class BootProgressSensor(VirtualSensor):
> -	def __init__(self,bus,name):
> -		VirtualSensor.__init__(self,bus,name)
> -		self.setValue("Off")
> -		bus.add_signal_receiver(self.SystemStateHandler,signal_name = "GotoSystemState")
> -
> -	def SystemStateHandler(self,state):
> -		if (state == "HOST_POWERED_OFF"):
> -			self.setValue("Off")
> -
> -
> -	##override setValue method
> -	@dbus.service.method(SensorValue.IFACE_NAME,
> -		in_signature='v', out_signature='')
> -	def setValue(self,value):
> -		SensorValue.setValue(self,value)
> -		if (value == "FW Progress, Starting OS"):
> -			self.GotoSystemState("HOST_BOOTED")
> -			
> -	@dbus.service.signal(CONTROL_IFACE,signature='s')
> -	def GotoSystemState(self,state):
> -		pass
> -		
> -class OccStatusSensor(VirtualSensor):
> -	def __init__(self,bus,name, sysfs = None):
> -		## default path. can be override
> -		if sysfs is None:
> -			self.sysfs_attr = "/sys/class/i2c-adapter/i2c-3/3-0050/online"
> -		else:
> -			self.sysfs_attr = sysfs
> -		VirtualSensor.__init__(self,bus,name)
> -		self.setValue("Disabled")
> -		bus.add_signal_receiver(self.SystemStateHandler,signal_name = "GotoSystemState")
> -
> -	def SystemStateHandler(self,state):
> -		if (state == "HOST_POWERED_OFF"):
> -			self.setValue("Disabled")
> -
> -	##override setValue method
> -	@dbus.service.method(SensorValue.IFACE_NAME,
> -		in_signature='v', out_signature='')
> -	def setValue(self,value):
> -		if (value == "Enabled"):
> -			print "Installing OCC device"
> -			os.system("echo 1 > " +  self.sysfs_attr)
> -		else:
> -			print "Deleting OCC device"
> -			os.system("echo 0 > " +  self.sysfs_attr)
> -		SensorValue.setValue(self,value)
> -			
> -	@dbus.service.signal(CONTROL_IFACE,signature='s')
> -	def GotoSystemState(self,state):
> -		pass
> -	
> -class BootCountSensor(VirtualSensor):
> -	def __init__(self,bus,name):
> -		VirtualSensor.__init__(self,bus,name)
> -		self.setValue(2)
> -
> -class OperatingSystemStatusSensor(VirtualSensor):
> -	def __init__(self,bus,name):
> -		VirtualSensor.__init__(self,bus,name)
> -		self.setValue("Off")
> -		bus.add_signal_receiver(self.SystemStateHandler,signal_name = "GotoSystemState")
> -
> -	def SystemStateHandler(self,state):
> -		if (state == "HOST_POWERED_OFF"):
> -			self.setValue("Off")
> diff --git a/bin/hwmon.py b/bin/hwmon.py
> index 7e1858e..0cf570c 100755
> --- a/bin/hwmon.py
> +++ b/bin/hwmon.py
> @@ -10,9 +10,9 @@ import dbus.mainloop.glib
>  import re
>  from obmc.dbuslib.bindings import get_dbus
>  
> -from Sensors import SensorValue as SensorValue
> -from Sensors import HwmonSensor as HwmonSensor
> -from Sensors import SensorThresholds as SensorThresholds
> +from obmc.sensors import SensorValue as SensorValue
> +from obmc.sensors import HwmonSensor as HwmonSensor
> +from obmc.sensors import SensorThresholds as SensorThresholds
>  
>  if (len(sys.argv) < 2):
>  	print "Usage:  sensors_hwmon.py [system name]"
> diff --git a/bin/inventory_items.py b/bin/inventory_items.py
> index 1b0fa39..5e53293 100755
> --- a/bin/inventory_items.py
> +++ b/bin/inventory_items.py
> @@ -8,7 +8,7 @@ import dbus.service
>  import dbus.mainloop.glib
>  import cPickle
>  import json
> -from obmc.dbuslib.propertycacher import PropertyCacher
> +import obmc.dbuslib.propertycacher as PropertyCacher
>  from obmc.dbuslib.bindings import get_dbus, DbusProperties, DbusObjectManager
>  
>  if (len(sys.argv) < 2):
> diff --git a/bin/sensor_manager2.py b/bin/sensor_manager2.py
> index b06b9a5..9ed51f3 100755
> --- a/bin/sensor_manager2.py
> +++ b/bin/sensor_manager2.py
> @@ -6,7 +6,7 @@ import gobject
>  import dbus
>  import dbus.service
>  import dbus.mainloop.glib
> -import Sensors
> +import obmc.sensors
>  from obmc.dbuslib.bindings import DbusProperties, DbusObjectManager, get_dbus
>  
>  DBUS_NAME = 'org.openbmc.Sensors'
> @@ -25,7 +25,7 @@ class SensorManager(DbusProperties,DbusObjectManager):
>  	def register(self,object_name,obj_path):
>  		if (self.objects.has_key(obj_path) == False):
>  			print "Register: "+object_name+" : "+obj_path
> -			sensor = eval('Sensors.'+object_name+'(bus,obj_path)')
> +			sensor = eval('obmc.sensors.Sensors.'+object_name+'(bus,obj_path)')
>  			self.add(obj_path,sensor)
>  
>  	@dbus.service.method(DBUS_NAME,
> @@ -53,29 +53,29 @@ if __name__ == '__main__':
>  	## TODO: this should not be hardcoded
>  
>  	obj_path = OBJ_PATH+"/host/PowerCap"
> -	sensor_obj = Sensors.PowerCap(bus,obj_path)
> +	sensor_obj = obmc.sensors.PowerCap(bus,obj_path)
>  	## hwmon3 is default for master OCC on Barreleye.
>  	## should rewrite sensor_manager to remove hardcode
>  	sensor_obj.sysfs_attr = "/sys/class/hwmon/hwmon3/user_powercap"
>  	root_sensor.add(obj_path,sensor_obj)
>  
>  	obj_path = OBJ_PATH+"/host/BootProgress"
> -	root_sensor.add(obj_path,Sensors.BootProgressSensor(bus,obj_path))
> +	root_sensor.add(obj_path,obmc.sensors.BootProgressSensor(bus,obj_path))
>  
>  	obj_path = OBJ_PATH+"/host/cpu0/OccStatus"
> -	sensor_obj = Sensors.OccStatusSensor(bus,obj_path)
> +	sensor_obj = obmc.sensors.OccStatusSensor(bus,obj_path)
>  	sensor_obj.sysfs_attr = "/sys/class/i2c-adapter/i2c-3/3-0050/online"
>  	root_sensor.add(obj_path,sensor_obj)
>  
>  	obj_path = OBJ_PATH+"/host/cpu1/OccStatus"
> -	sensor_obj = Sensors.OccStatusSensor(bus,obj_path)
> +	sensor_obj = obmc.sensors.OccStatusSensor(bus,obj_path)
>  	sensor_obj.sysfs_attr = "/sys/class/i2c-adapter/i2c-3/3-0051/online"
>  	root_sensor.add(obj_path,sensor_obj)
>  
>  	obj_path = OBJ_PATH+"/host/BootCount"
> -	root_sensor.add(obj_path,Sensors.BootCountSensor(bus,obj_path))
> +	root_sensor.add(obj_path,obmc.sensors.BootCountSensor(bus,obj_path))
>  	obj_path = OBJ_PATH+"/host/OperatingSystemStatus"
> -	root_sensor.add(obj_path,Sensors.OperatingSystemStatusSensor(bus,obj_path))
> +	root_sensor.add(obj_path,obmc.sensors.OperatingSystemStatusSensor(bus,obj_path))
>  
>  	mainloop = gobject.MainLoop()
>  	print "Starting sensor manager"
> diff --git a/bin/system_manager.py b/bin/system_manager.py
> index fdb1bf1..ad22f4a 100755
> --- a/bin/system_manager.py
> +++ b/bin/system_manager.py
> @@ -8,7 +8,7 @@ import dbus.service
>  import dbus.mainloop.glib
>  import os
>  import time
> -from obmc.dbuslib.propertycacher import PropertyCacher
> +import obmc.dbuslib.propertycacher as PropertyCacher
>  from obmc.dbuslib.bindings import DbusProperties, DbusObjectManager, get_dbus
>  import obmc.enums
>  
