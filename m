Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id E35C21A0CFE
 for <openbmc@lists.ozlabs.org>; Fri,  6 Nov 2015 00:22:48 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446729714587331.45176317152595;
 Thu, 5 Nov 2015 05:21:54 -0800 (PST)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH phosphor-objmgr v2 01/10] Add filter capability to
 introspection parser
Date: Thu,  5 Nov 2015 07:21:41 -0600
Message-Id: <1446729710-27220-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1446729710-27220-1-git-send-email-patches@stwcx.xyz>
References: <1446729710-27220-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 05 Nov 2015 13:22:49 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

Can filter on:
  XML node tags
  interface names

Using filters cuts down on parsing cycles.
---
 OpenBMCMapper.py | 43 ++++++++++++++++++++++++++++++++++---------
 phosphor-mapper  | 34 ++++++++++++++++------------------
 2 files changed, 50 insertions(+), 27 deletions(-)

diff --git a/OpenBMCMapper.py b/OpenBMCMapper.py
index 30a93fb..cefed52 100644
--- a/OpenBMCMapper.py
+++ b/OpenBMCMapper.py
@@ -45,10 +45,22 @@ class Path:
 			last = self.depth()
 		return prefix + '/'.join(self.parts[first:last])
 
+def org_dot_openbmc_match(name):
+	return 'org.openbmc' in name
+
+class TagListMatch(object):
+	def __init__(self, tag_list):
+		self.tag_list = tag_list
+
+	def __call__(self, tag):
+		return tag in self.tag_list
+
 class IntrospectionNodeParser:
-	def __init__(self, data):
+	def __init__(self, data, tag_match = bool, intf_match = bool):
 		self.data = data
 		self.cache = {}
+		self.tag_match = tag_match
+		self.intf_match = intf_match
 
 	def parse_args(self):
 		return [ x.attrib for x in self.data.findall('arg') ]
@@ -64,16 +76,18 @@ class IntrospectionNodeParser:
 		iface = {}
 		iface['method'] = {}
 		iface['signal'] = {}
-		name = self.data.attrib['name']
 
 		for node in self.data:
-			p = IntrospectionNodeParser(node)
 			if node.tag not in ['method', 'signal']:
 				continue
+			if not self.tag_match(node.tag):
+				continue
+			p = IntrospectionNodeParser(
+					node, self.tag_match, self.intf_match)
 			n, element = p.parse_method_or_signal()
 			iface[node.tag][n] = element
 
-		return name, iface
+		return iface
 
 	def parse_node(self):
 		if self.cache:
@@ -83,10 +97,13 @@ class IntrospectionNodeParser:
 		self.cache['children'] = []
 
 		for node in self.data:
-			p = IntrospectionNodeParser(node)
 			if node.tag == 'interface':
-				name, ifaces = p.parse_interface()
-				self.cache['interfaces'][name] = ifaces
+				p = IntrospectionNodeParser(
+						node, self.tag_match, self.intf_match)
+				name = p.data.attrib['name']
+				if not self.intf_match(name):
+					continue
+				self.cache['interfaces'][name] = p.parse_interface()
 			elif node.tag == 'node':
 				self.cache['children'] = self.parse_children()
 
@@ -102,9 +119,11 @@ class IntrospectionNodeParser:
 		return any('/' in s for s in self.get_children())
 
 class IntrospectionParser:
-	def __init__(self, name, bus):
+	def __init__(self, name, bus, tag_match = bool, intf_match = bool):
 		self.name = name
 		self.bus = bus
+		self.tag_match = tag_match
+		self.intf_match = intf_match
 
 	def _introspect(self, path):
 		try:
@@ -114,7 +133,10 @@ class IntrospectionParser:
 		except dbus.DBusException:
 			return None
 
-		return IntrospectionNodeParser(ElementTree.fromstring(data))
+		return IntrospectionNodeParser(
+				ElementTree.fromstring(data),
+				self.tag_match,
+				self.intf_match)
 
 	def _discover_flat(self, path, parser):
 		items = {}
@@ -147,4 +169,7 @@ class IntrospectionParser:
 				continue
 			items.update(callback(path + k, parser))
 
+		if path == '/':
+			print items
+
 		return items
diff --git a/phosphor-mapper b/phosphor-mapper
index 313baa2..fda70c7 100644
--- a/phosphor-mapper
+++ b/phosphor-mapper
@@ -167,13 +167,15 @@ class ObjectMatch(PathMatch):
 
 class ObjectMapper(dbus.service.Object):
 	def __init__(self, bus, path,
-			name_match = 'org.openbmc',
-			intf_match = 'org.openbmc'):
+			name_match = OpenBMCMapper.org_dot_openbmc_match,
+			intf_match = OpenBMCMapper.org_dot_openbmc_match):
 		super(ObjectMapper, self).__init__(bus.dbus, path)
 		self.cache = DictionaryCache()
 		self.bus = bus
 		self.name_match = name_match
 		self.intf_match = intf_match
+		self.tag_match = OpenBMCMapper.TagListMatch(['children', 'interface'])
+
 		self.discovery_done = False
 
 		gobject.idle_add(self.discover)
@@ -191,7 +193,7 @@ class ObjectMapper(dbus.service.Object):
 
 	def interfaces_added_handler(self, path, iprops, **kw):
 		for x in iprops.iterkeys():
-			if self.intf_match in x:
+			if self.intf_match(x):
 				self.cache.add_item((path, kw['sender'], x))
 
 	def interfaces_removed_handler(self, path, interfaces, **kw):
@@ -200,7 +202,8 @@ class ObjectMapper(dbus.service.Object):
 
 	def process_new_owner(self, name):
 		# unique name
-		return self.discover([ IntrospectionParser(name, self.bus.dbus) ])
+		return self.discover([ IntrospectionParser(name,
+			self.bus.dbus, self.tag_match, self.intf_match) ])
 
 	def process_old_owner(self, name):
 		# unique name
@@ -208,7 +211,7 @@ class ObjectMapper(dbus.service.Object):
 
 	def bus_handler(self, service, old, new):
 		if not self.discovery_done or \
-				self.name_match not in service:
+				not self.name_match(service):
 			return
 
 		if new:
@@ -216,21 +219,20 @@ class ObjectMapper(dbus.service.Object):
 		if old:
 			self.process_old_owner(old)
 
-	def add_match_interfaces(self, owner, path, interfaces):
+	def add_interfaces(self, owner, path, interfaces):
 		for x in interfaces:
-			if self.intf_match not in x:
-				continue
-
 			self.cache.add_item((path, owner, x))
 
-	def add_match_items(self, owner, bus_items):
+	def add_items(self, owner, bus_items):
 		for x,y in bus_items.iteritems():
-			self.add_match_interfaces(owner, x, y['interfaces'])
+			self.add_interfaces(owner, x, y['interfaces'])
 
 	def discover(self, owners = None):
 		discovery = not self.discovery_done
 		if not owners:
-			owners = self.bus.get_owners(self.name_match)
+			owners = [ IntrospectionParser(x, self.bus.dbus,
+				self.tag_match, self.intf_match) \
+						for x in self.bus.get_owner_names(self.name_match) ]
 			self.discovery_done = True
 		for o in owners:
 
@@ -239,7 +241,7 @@ class ObjectMapper(dbus.service.Object):
 			if self.cache.has_bus(o.name):
 				continue
 
-			self.add_match_items(o.name, o.introspect())
+			self.add_items(o.name, o.introspect())
 
 		if discovery:
 			print "ObjectMapper discovery complete..."
@@ -266,17 +268,13 @@ class BusWrapper:
 	def get_service_names(self, match):
 		# these are well known names
 		return [ x for x in self.dbus.list_names() \
-				if match in x and x != OpenBMCMapper.MAPPER_NAME ]
+				if match(x) and x != OpenBMCMapper.MAPPER_NAME ]
 
 	def get_owner_names(self, match):
 		# these are unique connection names
 		return list( set( [ self.dbus.get_name_owner(x) \
 				for x in self.get_service_names(match) ] ) )
 
-	def get_owners(self, match):
-		return [ IntrospectionParser(x, self.dbus) \
-				for x in self.get_owner_names(match) ]
-
 if __name__ == '__main__':
 	dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
 	bus = dbus.SystemBus()
-- 
2.6.0
