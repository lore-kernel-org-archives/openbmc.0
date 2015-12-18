Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 9D0DB1A1A21
 for <openbmc@lists.ozlabs.org>; Sat, 19 Dec 2015 10:40:48 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1450482043622694.1246563140841;
 Fri, 18 Dec 2015 15:40:43 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton 11/15] new process to discover initial power state on
 bmc reboot
Date: Fri, 18 Dec 2015 17:40:31 -0600
Message-Id: <1450482035-4530-12-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1450482035-4530-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1450482035-4530-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 18 Dec 2015 23:40:49 -0000

From: Norman James <njames@us.ibm.com>

---
 bin/discover_system_state.py | 49 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100755 bin/discover_system_state.py

diff --git a/bin/discover_system_state.py b/bin/discover_system_state.py
new file mode 100755
index 0000000..236bd01
--- /dev/null
+++ b/bin/discover_system_state.py
@@ -0,0 +1,49 @@
+#!/usr/bin/python
+
+import sys
+import gobject
+import dbus
+import dbus.service
+import dbus.mainloop.glib
+
+
+dbus_objects = {
+	'power' : { 
+		'bus_name' : 'org.openbmc.control.Power',
+		'object_name' : '/org/openbmc/control/power0',
+		'interface_name' : 'org.openbmc.control.Power'
+	},
+	'occstatus' : { 
+		'bus_name' : 'org.openbmc.Sensors',
+		'object_name' : '/org/openbmc/sensors/host/OccStatus',
+		'interface_name' : 'org.openbmc.SensorValue'
+	},
+	'bootprogress' : { 
+		'bus_name' : 'org.openbmc.Sensors',
+		'object_name' : '/org/openbmc/sensors/host/BootProgress',
+		'interface_name' : 'org.openbmc.SensorValue'
+	},
+}
+
+def getInterface(bus,objs,key):
+	obj = bus.get_object(objs[key]['bus_name'],objs[key]['object_name'],introspect=False)
+	return dbus.Interface(obj,objs[key]['interface_name'])
+
+def getProperty(bus,objs,key,prop):
+	obj = bus.get_object(objs[key]['bus_name'],objs[key]['object_name'],introspect=False)
+	intf = dbus.Interface(obj,dbus.PROPERTIES_IFACE)
+	return intf.Get(objs[key]['interface_name'],prop)
+
+
+bus = dbus.SystemBus()
+pgood = getProperty(bus,dbus_objects,'power','pgood')
+
+if (pgood == 1):
+	intf = getInterface(bus,dbus_objects,'bootprogress')
+	intf.setValue("FW Progress, Starting OS")
+	intf = getInterface(bus,dbus_objects,'occstatus')
+	intf.setValue("Enabled")
+	
+
+		
+
-- 
2.6.3
