Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 084871A03CA
 for <openbmc@lists.ozlabs.org>; Wed, 21 Oct 2015 14:24:53 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445397891406262.27940564109895;
 Tue, 20 Oct 2015 20:24:51 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-objmgr] ObjectManager work in progress
Date: Tue, 20 Oct 2015 22:24:48 -0500
Message-Id: <1445397888-31800-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445397888-31800-1-git-send-email-patches@stwcx.xyz>
References: <1445397888-31800-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 21 Oct 2015 03:24:54 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

Supports:
 initial discovery
 service name ownership changes
 interfaces added and removed signals
 getobjs, getowners, getownersrecurse methods
---
 Makefile          |  13 ++++
 object-manager.py | 218 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 231 insertions(+)
 create mode 100644 Makefile
 create mode 100644 object-manager.py

diff --git a/Makefile b/Makefile
new file mode 100644
index 0000000..2ef3b43
--- /dev/null
+++ b/Makefile
@@ -0,0 +1,13 @@
+PACKAGE=object-manager
+
+prefix ?=/usr/local
+sbin=$(prefix)/sbin
+
+all clean distclean: 
+
+install:
+	@install -d $(sbin)
+	@install -m 755 $(PACKAGE).py $(sbin)/$(PACKAGE)
+
+uninstall:
+	@rm -f $(sbin)/$(PACKAGE)
diff --git a/object-manager.py b/object-manager.py
new file mode 100644
index 0000000..899e33e
--- /dev/null
+++ b/object-manager.py
@@ -0,0 +1,218 @@
+#!/usr/bin/env python
+
+# Contributors Listed Below - COPYRIGHT 2015
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
+import sys
+import dbus
+import dbus.service
+import dbus.mainloop.glib
+import gobject
+from xml.etree import ElementTree
+
+SERVICE_NAME = 'org.openbmc.objectmanager'
+IFACE_NAME = SERVICE_NAME + '.ObjectManager'
+OBJ_PATH = '/org/openbmc/objectmanager/objectmanager'
+
+class BusWrapper:
+	def __init__(self, bus):
+		self.dbus = bus
+
+	def get_service_names(self, match):
+		# these are well known names
+		return [ x for x in self.dbus.list_names() \
+				if match in x and x != SERVICE_NAME ]
+
+	def get_owner_names(self, match):
+		# these are unique connection names
+		return list( set( [ self.dbus.get_name_owner(x) \
+				for x in self.get_service_names(match) ] ) )
+
+	def get_owners(self, match):
+		return [ Owner(x, self) \
+				for x in self.get_owner_names(match) ]
+
+class DisplayCache:
+	def __init__(self, objs):
+		self.objs = objs
+
+	@staticmethod
+	def interfaces(interfaces):
+		return "\n".join( [ "    %s" %(x) for x in interfaces] )
+
+	def __str__(self):
+		return "\n".join( [ "%s %s\n%s" %(x, y.owner_name, self.interfaces(y.interfaces)) \
+				for x,y in self.objs.iteritems() ] )
+
+class CacheItems:
+	def __init__(self, owner_name, interfaces):
+		self.owner_name = owner_name
+		self.interfaces = interfaces
+
+class ObjectManager(dbus.service.Object):
+	def __init__(self, bus, path,
+			name_match = 'org.openbmc',
+			intf_match = 'org.openbmc'):
+		super(ObjectManager, self).__init__(bus.dbus, path)
+		self.cache = {}
+		self.bus = bus
+		self.name_match = name_match
+		self.intf_match = intf_match
+		self.discovery_done = False
+
+		gobject.idle_add(self.discover)
+		self.bus.dbus.add_signal_receiver(self.bus_handler,
+			dbus_interface = dbus.BUS_DAEMON_IFACE,
+			signal_name = 'NameOwnerChanged')
+		self.bus.dbus.add_signal_receiver(self.interface_added_handler,
+			dbus_interface = dbus.BUS_DAEMON_IFACE + '.ObjectManager',
+			signal_name = 'InterfaceesAdded')
+		self.bus.dbus.add_signal_receiver(self.interface_removed_handler,
+			dbus_interface = dbus.BUS_DAEMON_IFACE + '.ObjectManager',
+			signal_name = 'InterfacesRemoved')
+
+	def interface_added_handler(self, path, iprops):
+		interfaces = [ x for x in iprops.iterkeys() \
+				if self.intf_match in x ]
+		self.cache[path].interfaces.extend(interfaces)
+
+	def interface_removed_handler(self, path, interfaces):
+		self.cache[path].interfaces = \
+			[ x for x in self.cache[path].interfaces \
+			if x not in interfaces ]
+
+		if not self.cache[path].interfaces:
+			del self.cache[path]
+
+	def process_new_owner(self, name):
+		# unique name
+		return self.discover([ Owner(name, self.bus) ])
+
+	def process_old_owner(self, name):
+		# unique name
+		for x,y in self.cache.items():
+			if name == y.owner_name:
+				del self.cache[x]
+
+	def bus_handler(self, service, old, new):
+		if not self.discovery_done or \
+				self.name_match not in service:
+			return
+		
+		if new:
+			self.process_new_owner(new)
+		if old:
+			self.process_old_owner(old)
+
+	def owner_name_in_cache(self, name):
+		return name in [ x.owner_name for x in self.cache.itervalues() ]
+
+	def discover(self, owners = None):
+		if not owners:
+			owners = self.bus.get_owners(self.name_match)
+			self.discovery_done = True
+		for o in owners:
+			if self.owner_name_in_cache(o.name):
+				continue
+			self.cache.update(o.discover(self.intf_match))
+
+	@dbus.service.method(IFACE_NAME, 's', 'a{ss}')
+	def GetObjs(self, path):
+		return { x: y.owner_name for x,y in self.cache.iteritems() if path in x }
+
+	@dbus.service.method(IFACE_NAME, 'as', 'a{ss}')
+	def GetOwners(self, objs):
+		return { x: self.cache[x].owner_name \
+				for x in objs if x in self.cache.iterkeys() }
+
+	@dbus.service.method(IFACE_NAME, 'as', 'a{ss}')
+	def GetOwnersRecurse(self, objs):
+		objs = [ self.GetObjs(x) for x in objs ]
+		objs = [ x for y in objs for x in y ] # flatten nested lists
+		return self.GetOwners(objs)
+
+class IntrospectionParser:
+	def __init__(self, data):
+		self.data = data
+		self.cache = {}
+
+	def get_interfaces(self, match):
+		if 'interfaces' not in self.cache.keys():
+			self.cache['interfaces'] = [ x.attrib['name' ] \
+					for x in self.data.findall('interface') \
+					if match in x.attrib['name'] ]
+		return self.cache['interfaces']
+
+	def get_kids(self):
+		if 'kids' not in self.cache.keys():
+			self.cache['kids'] = [ x.attrib['name' ] \
+					for x in self.data.findall('node') ]
+		return self.cache['kids']
+
+	def recursive_binding(self):
+		return any('/' in s for s in self.get_kids())
+
+class Owner:
+	def __init__(self, name, bus):
+		self.name = name
+		self.bus = bus
+
+	def introspect(self, path):
+		try:
+			obj = self.bus.dbus.get_object(self.name, path)
+            		iface = dbus.Interface(obj, 'org.freedesktop.DBus.Introspectable')
+			data = iface.Introspect()
+		except dbus.DBusException:
+			return None
+
+		return IntrospectionParser(ElementTree.fromstring(data))
+
+	def discover(self, match, path = '/'):
+		objs = {}
+           	parser = self.introspect(path)
+
+		if not parser:
+			return objs
+	
+		interfaces = parser.get_interfaces(match)
+		if interfaces:
+			objs[path] = CacheItems(self.name, interfaces)
+		
+		kids = parser.get_kids()
+		
+		if path != '/':
+			path += '/'
+
+		recursive = parser.recursive_binding()
+		for k in parser.get_kids():
+			if recursive:
+           			parser = self.introspect(path + k)
+				interfaces = parser.get_interfaces(match)
+				if interfaces:
+					objs[path + k] = CacheItems(self.name, interfaces)
+			else:
+				objs.update(self.discover(match, path + k))
+
+		return objs
+
+if __name__ == '__main__':
+	dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
+	bus = dbus.SystemBus()
+	s = dbus.service.BusName(SERVICE_NAME, bus)
+	o = ObjectManager(BusWrapper(bus), OBJ_PATH)
+	loop = gobject.MainLoop()
+
+	loop.run()
-- 
2.6.0
