Return-Path: <patches@stwcx.xyz>
Received: from sender-p126.zohomail.com (sender-p126.zohomail.com
 [74.201.154.126])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 392E61A0A9E
 for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2015 13:06:19 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1446084374902843.7501769797751;
 Wed, 28 Oct 2015 19:06:14 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH phosphor-objmgr 1/2] Generalize introspection parser
Date: Wed, 28 Oct 2015 21:06:11 -0500
Message-Id: <1446084372-26724-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1446084372-26724-1-git-send-email-patches@stwcx.xyz>
References: <1446084372-26724-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 29 Oct 2015 02:06:19 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

Doing this in prep for sharing with with rest-dbus.
---
 phosphor-mapper | 130 +++++++++++++++++++++++++++++++++++++++-----------------
 1 file changed, 92 insertions(+), 38 deletions(-)

diff --git a/phosphor-mapper b/phosphor-mapper
index 28d2600..890e546 100644
--- a/phosphor-mapper
+++ b/phosphor-mapper
@@ -201,7 +201,7 @@ class ObjectMapper(dbus.service.Object):
 
 	def process_new_owner(self, name):
 		# unique name
-		return self.discover([ Owner(name, self.bus) ])
+		return self.discover([ IntrospectionParser(name, self.bus.dbus) ])
 
 	def process_old_owner(self, name):
 		# unique name
@@ -217,6 +217,17 @@ class ObjectMapper(dbus.service.Object):
 		if old:
 			self.process_old_owner(old)
 
+	def add_match_interfaces(self, owner, path, interfaces):
+		for x in interfaces:
+			if self.intf_match not in x:
+				continue
+
+			self.cache.add_item((path, owner, x))
+
+	def add_match_items(self, owner, bus_items):
+		for x,y in bus_items.iteritems():
+			self.add_match_interfaces(owner, x, y['interfaces'])
+
 	def discover(self, owners = None):
 		discovery = not self.discovery_done
 		if not owners:
@@ -229,7 +240,7 @@ class ObjectMapper(dbus.service.Object):
 			if self.cache.has_bus(o.name):
 				continue
 
-			self.cache.add_items(o.discover(self.intf_match))
+			self.add_match_items(o.name, o.introspect())
 
 		if discovery:
 			print "ObjectMapper discovery complete..."
@@ -249,64 +260,107 @@ class ObjectMapper(dbus.service.Object):
 			values.update(self.GetTree(x, depth, match_type))
 		return values
 
-class IntrospectionParser:
+class IntrospectionNodeParser:
 	def __init__(self, data):
 		self.data = data
 		self.cache = {}
 
-	def get_interfaces(self, match):
-		if 'interfaces' not in self.cache.keys():
-			self.cache['interfaces'] = [ x.attrib['name' ] \
-					for x in self.data.findall('interface') \
-					if match in x.attrib['name'] ]
-		return self.cache['interfaces']
+	def parse_args(self):
+		return [ x.attrib for x in self.data.findall('arg') ]
+
+	def parse_children(self):
+		return [ x.attrib['name'] for x in self.data.findall('node') ]
+
+	def parse_method_or_signal(self):
+		name = self.data.attrib['name']
+		return name, self.parse_args()
+
+	def parse_interface(self):
+		iface = {}
+		iface['method'] = {}
+		iface['signal'] = {}
+		name = self.data.attrib['name']
+
+		for node in self.data:
+			p = IntrospectionNodeParser(node)
+			if node.tag not in ['method', 'signal']:
+				continue
+			n, element = p.parse_method_or_signal()
+			iface[node.tag][n] = element
+
+		return name, iface
+
+	def parse_node(self):
+		if self.cache:
+			return self.cache
 
-	def get_kids(self):
-		if 'kids' not in self.cache.keys():
-			self.cache['kids'] = [ x.attrib['name' ] \
-					for x in self.data.findall('node') ]
-		return self.cache['kids']
+		self.cache['interfaces'] = {}
+		self.cache['children'] = []
+
+		for node in self.data:
+			p = IntrospectionNodeParser(node)
+			if node.tag == 'interface':
+				name, ifaces = p.parse_interface()
+				self.cache['interfaces'][name] = ifaces
+			elif node.tag == 'node':
+				self.cache['children'] = self.parse_children()
+
+		return self.cache
+
+	def get_interfaces(self):
+		return self.parse_node()['interfaces']
+
+	def get_children(self):
+		return self.parse_node()['children']
 
 	def recursive_binding(self):
-		return any('/' in s for s in self.get_kids())
+		return any('/' in s for s in self.get_children())
 
-class Owner:
+class IntrospectionParser:
 	def __init__(self, name, bus):
 		self.name = name
 		self.bus = bus
 
-	def introspect(self, path):
+	def _introspect(self, path):
 		try:
-			obj = self.bus.dbus.get_object(self.name, path)
-			iface = dbus.Interface(obj, 'org.freedesktop.DBus.Introspectable')
+			obj = self.bus.get_object(self.name, path)
+			iface = dbus.Interface(obj, dbus.BUS_DAEMON_IFACE + '.Introspectable')
 			data = iface.Introspect()
 		except dbus.DBusException:
 			return None
 
-		return IntrospectionParser(ElementTree.fromstring(data))
+		return IntrospectionNodeParser(ElementTree.fromstring(data))
 
-	def discover(self, match, path = '/'):
-		parser = self.introspect(path)
-		if not parser:
-			return []
+	def _discover_flat(self, path, parser):
+		items = {}
+		interfaces = parser.get_interfaces().keys()
+		if interfaces:
+			items[path] = {}
+			items[path]['interfaces'] = interfaces
 
-		items = []
-		for x in parser.get_interfaces(match):
-			items.append((path, self.name, x))
+		return items
+
+	def introspect(self, path = '/', parser = None):
+		items = {}
+		if not parser:
+			parser = self._introspect(path)
+		if not parser:
+			return {}
+		items.update(self._discover_flat(path, parser))
 
 		if path != '/':
 			path += '/'
 
-		recursive = parser.recursive_binding()
-		for k in parser.get_kids():
-			if recursive:
-				parser = self.introspect(path + k)
-				if not parser:
-					return []
-				for x in parser.get_interfaces(match):
-					items.append((path + k, self.name, x))
-			else:
-				items.extend(self.discover(match, path + k))
+		if parser.recursive_binding():
+			callback = self._discover_flat
+		else:
+			callback = self.introspect
+
+		for k in parser.get_children():
+			parser = self._introspect(path + k)
+			if not parser:
+				continue
+			items.update(callback(path + k, parser))
 
 		return items
 
@@ -325,7 +379,7 @@ class BusWrapper:
 				for x in self.get_service_names(match) ] ) )
 
 	def get_owners(self, match):
-		return [ Owner(x, self) \
+		return [ IntrospectionParser(x, self.dbus) \
 				for x in self.get_owner_names(match) ]
 
 if __name__ == '__main__':
-- 
2.6.0
