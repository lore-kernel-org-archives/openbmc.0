Return-Path: <patches@stwcx.xyz>
X-Greylist: delayed 2548 seconds by postgrey-1.35 at bilbo;
 Wed, 28 Oct 2015 09:51:19 AEDT
Received: from sender-p126.zohomail.com (sender-p126.zohomail.com
 [74.201.154.126])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3318A1A0479
 for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2015 09:51:18 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 14459795645971006.8966594810622;
 Tue, 27 Oct 2015 13:59:24 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH phosphor-objmgr v3] ObjectManager work in progress
Date: Tue, 27 Oct 2015 15:59:20 -0500
Message-Id: <1445979560-20342-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445979560-20342-1-git-send-email-patches@stwcx.xyz>
References: <1445979560-20342-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 27 Oct 2015 22:51:21 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

Supports:
 initial discovery
 service name ownership changes
 interfaces added and removed signals
 gettreepaths, gettree, gettrees methods
---
 OpenBMCMapper.py |  27 +++++
 phosphor-mapper  | 338 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 setup.cfg        |   2 +
 setup.py         |   6 +
 4 files changed, 373 insertions(+)
 create mode 100644 OpenBMCMapper.py
 create mode 100644 phosphor-mapper
 create mode 100644 setup.cfg
 create mode 100644 setup.py

diff --git a/OpenBMCMapper.py b/OpenBMCMapper.py
new file mode 100644
index 0000000..fe74daa
--- /dev/null
+++ b/OpenBMCMapper.py
@@ -0,0 +1,27 @@
+#!/usr/bin/env python
+
+MAPPER_NAME = 'org.openbmc.objectmapper'
+MAPPER_IFACE = MAPPER_NAME + '.ObjectMapper'
+MAPPER_PATH = '/org/openbmc/objectmapper/objectmapper'
+
+class Path:
+	def __init__(self, path):
+		self.parts = filter(bool, path.split('/'))
+
+	def rel(self, first = None, last = None):
+		# relative
+		return self.get('', first, last)
+
+	def fq(self, first = None, last = None):
+		# fully qualified
+		return self.get('/', first, last)
+
+	def depth(self):
+		return len(self.parts)
+
+	def get(self, prefix = '/', first = None, last = None):
+		if not first:
+			first = 0
+		if not last:
+			last = self.depth()
+		return prefix + '/'.join(self.parts[first:last])
diff --git a/phosphor-mapper b/phosphor-mapper
new file mode 100644
index 0000000..28d2600
--- /dev/null
+++ b/phosphor-mapper
@@ -0,0 +1,338 @@
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
+from OpenBMCMapper import Path
+import OpenBMCMapper
+
+class DictionaryCache:
+	def __init__(self):
+		self.items = {'/': {} }
+
+	def _merge_item(self, item):
+		path, bus, iface = item
+		if bus in self.items[path]:
+			self.items[path][bus].append(iface)
+		else:
+			self.items[path][bus] = [ iface ]
+
+	def add_item(self, item):
+		path, bus, iface = item
+		if path != '/':
+			parent = Path(path).fq(last = -1)
+			if parent not in self.items:
+				self.add_item((parent, None, None))
+
+		items = self.items.get(path, None)
+		if bus and items:
+			self._merge_item(item)
+		elif items:
+			pass
+		elif bus:
+			self.items[path] = { bus: [ iface ] }
+		else:
+			self.items[path] = {}
+
+	def add_items(self, items):
+		for i in items:
+			self.add_item(i)
+
+	def _has_children(self, path):
+		return len(self.get_subtree_paths(path, 1, 'fuzzy')) != 1
+
+	def _try_remove_path(self, path):
+		if path == '/':
+			return None
+
+		if not self._has_children(path):
+			del self.items[path]
+
+			# try and remove the parent
+			parent = Path(path).fq(last = -1)
+			if not self.items[parent]:
+				self._try_remove_path(parent)
+
+	def _remove_bus(self, path, bus):
+		del self.items[path][bus]
+		if not self.items[path]:
+			self._try_remove_path(path)
+
+	def _remove_iface(self, path, bus, iface):
+		self.items[path][bus].remove(iface)
+		if not self.items[path][bus]:
+			self._remove_bus(path, bus)
+
+	def remove_item(self, item):
+		self._remove_iface(*item)
+
+	def remove_items(self, items):
+		for x in items:
+			self.remove_item(x)
+
+	def remove_bus(self, name):
+		for path,x in self.items.items():
+			for bus,ifaces in x.items():
+				if name != bus:
+					continue
+				self.remove_items([ (path, bus, iface) \
+						for iface in ifaces ])
+
+	def remove_busses(self, names):
+		for x in names:
+			self.remove_bus(name)
+
+	def _get_busses(self):
+		busses = [ y.iterkeys() for y in [ x for x in self.items.itervalues() ] ]
+		return set( x for y in busses for x in y ) # flatten nested lists
+
+	def has_bus(self, bus):
+		return any(bus in b for b in self._get_busses())
+
+	def get_subtree_paths(self, root, depth, match_type):
+		return filter(PathMatch(root, depth, match_type),
+				self.items.iterkeys())
+
+	def get_subtree(self, root, depth, match_type):
+		return dict(filter(ObjectMatch(root, depth, match_type),
+				self.items.iteritems()))
+
+	@staticmethod
+	def _iface__str__(ifaces):
+		return '\n'.join(["    %s" %(x) for x in ifaces ])
+
+	@staticmethod
+	def _bus__str__(busses):
+		return '\n'.join([ "%s\n%s" %(x, DictionaryCache._iface__str__(y)) \
+				for x,y in busses.iteritems() ])
+
+	def __str__(self):
+		return '\n'.join([ "%s\n%s" %(x, DictionaryCache._bus__str__(y)) \
+				for x,y in self.items.iteritems() ])
+
+class PathMatch(object):
+	def __init__(self, path, depth, match_type):
+		p = Path(path)
+		self.path = p.fq()
+		self.depth = p.depth()
+		self.match_type = match_type
+		self.match_depth = None
+		if depth != -1:
+			self.match_depth = p.depth() + depth
+
+	def __call__(self, path):
+		p = Path(path)
+		depth = p.depth()
+
+		# 'is not None' is really needed because
+		# the match depth can be zero
+		if self.match_depth is not None and depth > self.match_depth:
+			return False
+
+		fuzzy_match = p.fq(last = self.depth) == self.path or \
+				not self.depth
+		depth_match = self.match_depth == depth
+
+		if self.match_type == 'fuzzy':
+			return fuzzy_match
+
+		return fuzzy_match and depth_match
+
+class ObjectMatch(PathMatch):
+	def __init__(self, path, depth, match_type):
+		super(ObjectMatch, self).__init__(path, depth, match_type)
+
+	def __call__(self, tup):
+		if not super(ObjectMatch, self).__call__(tup[0]):
+			return False
+		return tup[1]
+
+class ObjectMapper(dbus.service.Object):
+	def __init__(self, bus, path,
+			name_match = 'org.openbmc',
+			intf_match = 'org.openbmc'):
+		super(ObjectMapper, self).__init__(bus.dbus, path)
+		self.cache = DictionaryCache()
+		self.bus = bus
+		self.name_match = name_match
+		self.intf_match = intf_match
+		self.discovery_done = False
+
+		gobject.idle_add(self.discover)
+		self.bus.dbus.add_signal_receiver(self.bus_handler,
+			dbus_interface = dbus.BUS_DAEMON_IFACE,
+			signal_name = 'NameOwnerChanged')
+		self.bus.dbus.add_signal_receiver(self.interfaces_added_handler,
+			dbus_interface = dbus.BUS_DAEMON_IFACE + '.ObjectManager',
+			signal_name = 'InterfaceesAdded',
+			sender_keyword = 'sender')
+		self.bus.dbus.add_signal_receiver(self.interfaces_removed_handler,
+			dbus_interface = dbus.BUS_DAEMON_IFACE + '.ObjectManager',
+			signal_name = 'InterfacesRemoved',
+			sender_keyword = 'sender')
+
+	def interfaces_added_handler(self, path, iprops, **kw):
+		for x in iprops.iterkeys():
+			if self.intf_match in x:
+				self.cache.add_item((path, kw['sender'], x))
+
+	def interfaces_removed_handler(self, path, interfaces, **kw):
+		for x in interfaces:
+			self.cache.remove_item((path, kw['sender'], x))
+
+	def process_new_owner(self, name):
+		# unique name
+		return self.discover([ Owner(name, self.bus) ])
+
+	def process_old_owner(self, name):
+		# unique name
+		self.cache.remove_bus(name)
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
+	def discover(self, owners = None):
+		discovery = not self.discovery_done
+		if not owners:
+			owners = self.bus.get_owners(self.name_match)
+			self.discovery_done = True
+		for o in owners:
+
+			# this only happens when an app
+			# grabs more than one well known name
+			if self.cache.has_bus(o.name):
+				continue
+
+			self.cache.add_items(o.discover(self.intf_match))
+
+		if discovery:
+			print "ObjectMapper discovery complete..."
+
+	@dbus.service.method(OpenBMCMapper.MAPPER_IFACE, 'sis', 'as')
+	def GetTreePaths(self, path, depth, match_type):
+		return self.cache.get_subtree_paths(path, depth, match_type)
+
+	@dbus.service.method(OpenBMCMapper.MAPPER_IFACE, 'sis', 'a{sa{sas}}')
+	def GetTree(self, path, depth, match_type):
+		return self.cache.get_subtree(path, depth, match_type)
+
+	@dbus.service.method(OpenBMCMapper.MAPPER_IFACE, 'asis', 'a{sa{sas}}')
+	def GetTrees(self, paths, depth, match_type):
+		values = {}
+		for x in paths:
+			values.update(self.GetTree(x, depth, match_type))
+		return values
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
+			iface = dbus.Interface(obj, 'org.freedesktop.DBus.Introspectable')
+			data = iface.Introspect()
+		except dbus.DBusException:
+			return None
+
+		return IntrospectionParser(ElementTree.fromstring(data))
+
+	def discover(self, match, path = '/'):
+		parser = self.introspect(path)
+		if not parser:
+			return []
+
+		items = []
+		for x in parser.get_interfaces(match):
+			items.append((path, self.name, x))
+
+		if path != '/':
+			path += '/'
+
+		recursive = parser.recursive_binding()
+		for k in parser.get_kids():
+			if recursive:
+				parser = self.introspect(path + k)
+				if not parser:
+					return []
+				for x in parser.get_interfaces(match):
+					items.append((path + k, self.name, x))
+			else:
+				items.extend(self.discover(match, path + k))
+
+		return items
+
+class BusWrapper:
+	def __init__(self, bus):
+		self.dbus = bus
+
+	def get_service_names(self, match):
+		# these are well known names
+		return [ x for x in self.dbus.list_names() \
+				if match in x and x != OpenBMCMapper.MAPPER_NAME ]
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
+if __name__ == '__main__':
+	dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
+	bus = dbus.SystemBus()
+	s = dbus.service.BusName(OpenBMCMapper.MAPPER_NAME, bus)
+	o = ObjectMapper(BusWrapper(bus), OpenBMCMapper.MAPPER_PATH)
+	loop = gobject.MainLoop()
+
+	loop.run()
diff --git a/setup.cfg b/setup.cfg
new file mode 100644
index 0000000..ed3bf6e
--- /dev/null
+++ b/setup.cfg
@@ -0,0 +1,2 @@
+[install]
+install_scripts=/usr/sbin
diff --git a/setup.py b/setup.py
new file mode 100644
index 0000000..bfbf3fc
--- /dev/null
+++ b/setup.py
@@ -0,0 +1,6 @@
+from distutils.core import setup
+setup(name='OpenBMCMapper',
+      version='1.0',
+      py_modules=['OpenBMCMapper'],
+      scripts=['phosphor-mapper']
+      )
-- 
2.6.0
