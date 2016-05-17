Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r8K4R5jgVzDqCC
 for <openbmc@lists.ozlabs.org>; Wed, 18 May 2016 00:11:03 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1463494254450216.31486890490544;
 Tue, 17 May 2016 07:10:54 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH pyphosphor] Move sensors.py and propertycacher.py frm skeleton
Date: Tue, 17 May 2016 09:10:50 -0500
Message-Id: <1463494250-27021-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1463494250-27021-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1463494250-27021-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 17 May 2016 14:11:04 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

These skeleton module are somewhat general purpose so move them
here.
This is just a straight copy plus a pep8 run.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 obmc/dbuslib/propertycacher.py |  64 ++++++++++
 obmc/sensors.py                | 281 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 345 insertions(+)
 create mode 100644 obmc/dbuslib/propertycacher.py
 create mode 100644 obmc/sensors.py

diff --git a/obmc/dbuslib/propertycacher.py b/obmc/dbuslib/propertycacher.py
new file mode 100644
index 0000000..701a413
--- /dev/null
+++ b/obmc/dbuslib/propertycacher.py
@@ -0,0 +1,64 @@
+# Contributors Listed Below - COPYRIGHT 2016
+# [+] International Business Machines Corp.
+#
+#
+# Licensed under the Apache License, Version 2.0 (the "License");
+# you may not use this file except in compliance with the License.
+# You may obtain a copy of the License at
+#
+#     http://www.apache.org/licenses/LICENSE-2.0
+#
+# Unless required by applicable law or agreed to in writing, software
+# distributed under the License is distributed on an "AS IS" BASIS,
+# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
+# implied. See the License for the specific language governing
+# permissions and limitations under the License.
+
+import os
+import cPickle
+import json
+
+CACHE_PATH = '/var/cache/obmc/'
+
+
+def getCacheFilename(obj_path, iface_name):
+    name = obj_path.replace('/', '.')
+    filename = CACHE_PATH+name[1:]+"@"+iface_name+".props"
+    return filename
+
+
+def save(obj_path, iface_name, properties):
+    print "Caching: "+obj_path
+    try:
+        filename = getCacheFilename(obj_path, iface_name)
+        output = open(filename, 'wb')
+        try:
+            ## use json module to convert dbus datatypes
+            props = json.dumps(properties[iface_name])
+            prop_obj = json.loads(props)
+            cPickle.dump(prop_obj, output)
+        except Exception as e:
+            print "ERROR: "+str(e)
+        finally:
+            output.close()
+    except:
+        print "ERROR opening cache file: "+filename
+
+
+def load(obj_path, iface_name, properties):
+    ## overlay with pickled data
+    filename = getCacheFilename(obj_path, iface_name)
+    if (os.path.isfile(filename)):
+        if iface_name in properties:
+            properties[iface_name] = {}
+        print "Loading from cache: "+filename
+        try:
+            p = open(filename, 'rb')
+            data = cPickle.load(p)
+            for prop in data.keys():
+                properties[iface_name][prop] = data[prop]
+
+        except Exception as e:
+            print "ERROR: Loading cache file: " + str(e)
+        finally:
+            p.close()
diff --git a/obmc/sensors.py b/obmc/sensors.py
new file mode 100644
index 0000000..e923859
--- /dev/null
+++ b/obmc/sensors.py
@@ -0,0 +1,281 @@
+# Contributors Listed Below - COPYRIGHT 2016
+# [+] International Business Machines Corp.
+#
+#
+# Licensed under the Apache License, Version 2.0 (the "License");
+# you may not use this file except in compliance with the License.
+# You may obtain a copy of the License at
+#
+#     http://www.apache.org/licenses/LICENSE-2.0
+#
+# Unless required by applicable law or agreed to in writing, software
+# distributed under the License is distributed on an "AS IS" BASIS,
+# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
+# implied. See the License for the specific language governing
+# permissions and limitations under the License.
+
+import os
+import subprocess
+import dbus
+import dbus.service
+from obmc.dbuslib.bindings import DbusProperties
+
+
+## Abstract class, must subclass
+class SensorValue(DbusProperties):
+    IFACE_NAME = 'org.openbmc.SensorValue'
+
+    def __init__(self, bus, name):
+        self.Set(SensorValue.IFACE_NAME, 'units', "")
+        self.Set(SensorValue.IFACE_NAME, 'error', False)
+
+    @dbus.service.method(
+        IFACE_NAME, in_signature='v', out_signature='')
+    def setValue(self, value):
+        self.Set(SensorValue.IFACE_NAME, 'value', value)
+
+    @dbus.service.method(
+        IFACE_NAME, in_signature='', out_signature='v')
+    def getValue(self):
+        return self.Get(SensorValue.IFACE_NAME, 'value')
+
+
+class SensorThresholds(DbusProperties):
+    IFACE_NAME = 'org.openbmc.SensorThresholds'
+
+    def __init__(self, bus, name):
+        self.Set(
+            SensorThresholds.IFACE_NAME,
+            'thresholds_enabled',
+            False)
+        self.Set(
+            SensorThresholds.IFACE_NAME,
+            'emergency_enabled',
+            False)
+        self.Set(
+            SensorThresholds.IFACE_NAME,
+            'warning_upper',
+            0)
+        self.Set(
+            SensorThresholds.IFACE_NAME,
+            'warning_lower',
+            0)
+        self.Set(
+            SensorThresholds.IFACE_NAME,
+            'critical_upper',
+            0)
+        self.Set(
+            SensorThresholds.IFACE_NAME,
+            'critical_lower',
+            0)
+        self.Set(
+            SensorThresholds.IFACE_NAME,
+            'critical_lower',
+            0)
+        self.Set(
+            SensorThresholds.IFACE_NAME,
+            'threshold_state',
+            "NORMAL")
+        self.Set(
+            SensorThresholds.IFACE_NAME,
+            'worst_threshold_state',
+            "NORMAL")
+
+    @dbus.service.method(
+        IFACE_NAME, in_signature='', out_signature='')
+    def resetThresholdState(self):
+        self.Set(
+            SensorThresholds.IFACE_NAME,
+            'worst_threshold_state',
+            "NORMAL")
+
+    def check_thresholds(self, value):
+        iface = SensorThresholds.IFACE_NAME
+        if (self.Get(iface, 'thresholds_enabled') is False):
+            return False
+        rtn = False
+        current_state = "NORMAL"
+        if (value >= self.properties[iface]['critical_upper']):
+            current_state = "CRITICAL"
+            rtn = True
+        elif (value <= self.properties[iface]['critical_lower']):
+            current_state = "CRITICAL"
+            rtn = True
+        elif (value >= self.properties[iface]['warning_upper']):
+            current_state = "WARNING"
+            rtn = True
+        elif (value <= self.properties[iface]['warning_lower']):
+            current_state = "WARNING"
+            rtn = True
+
+        if self.Get(iface, 'threshold_state') != current_state and \
+                current_state == "CRITICAL" and \
+                self.Get(iface, 'emergency_enabled') is True:
+            self.Emergency()
+
+        self.Set(iface, 'threshold_state', current_state)
+        worst = self.properties[iface]['worst_threshold_state']
+        if (current_state == "CRITICAL" or
+           (current_state == "WARNING" and worst != "CRITICAL")):
+            self.Set(iface, 'worst_threshold_state', current_state)
+
+        return rtn
+
+    @dbus.service.signal(IFACE_NAME, signature='')
+    def Emergency(self):
+        pass
+
+
+class VirtualSensor(SensorValue):
+    def __init__(self, bus, name):
+        DbusProperties.__init__(self)
+        SensorValue.__init__(self, bus, name)
+        dbus.service.Object.__init__(self, bus, name)
+
+
+class HwmonSensor(SensorValue, SensorThresholds):
+    IFACE_NAME = 'org.openbmc.HwmonSensor'
+
+    def __init__(self, bus, name):
+        DbusProperties.__init__(self)
+        SensorValue.__init__(self, bus, name)
+        SensorThresholds.__init__(self, bus, name)
+        self.Set(HwmonSensor.IFACE_NAME, 'scale', 1)
+        self.Set(HwmonSensor.IFACE_NAME, 'offset', 0)
+        self.Set(HwmonSensor.IFACE_NAME, 'filename', '')
+        self.value_dirty = False
+
+        # need to cache value to know if changed
+        self.value = None
+        dbus.service.Object.__init__(self, bus, name)
+
+    @dbus.service.method(
+        SensorValue.IFACE_NAME, in_signature='v', out_signature='')
+    def setValue(self, value):
+        self.value_dirty = True
+        SensorValue.setValue(self, value)
+
+    ## Called by sensor process to update value from polling
+    ## if returns not None, then sensor process will update hwmon value
+    @dbus.service.method(
+        IFACE_NAME, in_signature='v', out_signature='(bv)')
+    def setByPoll(self, value):
+        scale = self.properties[HwmonSensor.IFACE_NAME]['scale']
+        offset = self.properties[HwmonSensor.IFACE_NAME]['offset']
+        if self.value_dirty:
+            ## new value externally set, so just return to hwmon
+            ## process to write value
+            self.value_dirty = False
+            val = (
+                self.properties[SensorValue.IFACE_NAME]['value']
+                - offset) * scale
+            return [True, val]
+        else:
+            # Keep the val as integer. scale may be floating point
+            val = int(value/scale + offset)
+            if (val != self.value):
+                SensorValue.setValue(self, val)
+                self.check_thresholds(val)
+                self.value = val
+
+            return [False, 0]
+
+
+CONTROL_IFACE = 'org.openbmc.Control'
+
+
+class PowerCap(VirtualSensor):
+    def __init__(self, bus, name):
+        VirtualSensor.__init__(self, bus, name)
+        SensorValue.setValue(self, 0)
+        self.sysfs_attr = "/sys/class/hwmon/hwmon3/user_powercap"
+
+    ##override setValue method
+    @dbus.service.method(
+        SensorValue.IFACE_NAME, in_signature='v', out_signature='')
+    def setValue(self, value):
+        try:
+            cmd_str = "echo "+str(value)+" > "+self.sysfs_attr
+            ret = subprocess.check_output(cmd_str, shell=True)
+        except subprocess.CalledProcessError as powerexc:
+            print "Set PowerCap Error", powerexc.returncode,
+            powerexc.output
+            return
+        print "Set PowerCap: ", value
+        SensorValue.setValue(self, value)
+
+
+class BootProgressSensor(VirtualSensor):
+    def __init__(self, bus, name):
+        VirtualSensor.__init__(self, bus, name)
+        self.setValue("Off")
+        bus.add_signal_receiver(
+            self.SystemStateHandler, signal_name="GotoSystemState")
+
+    def SystemStateHandler(self, state):
+        if (state == "HOST_POWERED_OFF"):
+            self.setValue("Off")
+
+    ##override setValue method
+    @dbus.service.method(
+        SensorValue.IFACE_NAME,
+        in_signature='v', out_signature='')
+    def setValue(self, value):
+        SensorValue.setValue(self, value)
+        if (value == "FW Progress, Starting OS"):
+            self.GotoSystemState("HOST_BOOTED")
+
+    @dbus.service.signal(CONTROL_IFACE, signature='s')
+    def GotoSystemState(self, state):
+        pass
+
+
+class OccStatusSensor(VirtualSensor):
+    def __init__(self, bus, name, sysfs=None):
+        ## default path. can be override
+        if sysfs is None:
+            self.sysfs_attr = "/sys/class/i2c-adapter/i2c-3/3-0050/online"
+        else:
+            self.sysfs_attr = sysfs
+        VirtualSensor.__init__(self, bus, name)
+        self.setValue("Disabled")
+        bus.add_signal_receiver(
+            self.SystemStateHandler, signal_name="GotoSystemState")
+
+    def SystemStateHandler(self, state):
+        if (state == "HOST_POWERED_OFF"):
+            self.setValue("Disabled")
+
+    ##override setValue method
+    @dbus.service.method(
+        SensorValue.IFACE_NAME, in_signature='v', out_signature='')
+    def setValue(self, value):
+        if (value == "Enabled"):
+            print "Installing OCC device"
+            os.system("echo 1 > " + self.sysfs_attr)
+        else:
+            print "Deleting OCC device"
+            os.system("echo 0 > " + self.sysfs_attr)
+        SensorValue.setValue(self, value)
+
+    @dbus.service.signal(CONTROL_IFACE, signature='s')
+    def GotoSystemState(self, state):
+        pass
+
+
+class BootCountSensor(VirtualSensor):
+    def __init__(self, bus, name):
+        VirtualSensor.__init__(self, bus, name)
+        self.setValue(2)
+
+
+class OperatingSystemStatusSensor(VirtualSensor):
+    def __init__(self, bus, name):
+        VirtualSensor.__init__(self, bus, name)
+        self.setValue("Off")
+        bus.add_signal_receiver(
+            self.SystemStateHandler, signal_name="GotoSystemState")
+
+    def SystemStateHandler(self, state):
+        if (state == "HOST_POWERED_OFF"):
+            self.setValue("Off")
-- 
2.8.2
