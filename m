Return-Path: <patches@stwcx.xyz>
Received: from sender-p126.zohomail.com (sender-p126.zohomail.com
 [74.201.154.126])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id E372B1A0BED
 for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2015 13:06:20 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1446084376455725.9722417229591;
 Wed, 28 Oct 2015 19:06:16 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH phosphor-objmgr 2/2] Move introspection parser to OpenBMCMapper
Date: Wed, 28 Oct 2015 21:06:12 -0500
Message-Id: <1446084372-26724-3-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 29 Oct 2015 02:06:21 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

Doing this so rest-dbus can use it.
---
 OpenBMCMapper.py | 107 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 phosphor-mapper  | 107 +------------------------------------------------------
 2 files changed, 108 insertions(+), 106 deletions(-)

diff --git a/OpenBMCMapper.py b/OpenBMCMapper.py
index 1862a46..30a93fb 100644
--- a/OpenBMCMapper.py
+++ b/OpenBMCMapper.py
@@ -16,6 +16,9 @@
 # implied. See the License for the specific language governing
 # permissions and limitations under the License.
 
+from xml.etree import ElementTree
+import dbus
+
 MAPPER_NAME = 'org.openbmc.objectmapper'
 MAPPER_IFACE = MAPPER_NAME + '.ObjectMapper'
 MAPPER_PATH = '/org/openbmc/objectmapper/objectmapper'
@@ -41,3 +44,107 @@ class Path:
 		if not last:
 			last = self.depth()
 		return prefix + '/'.join(self.parts[first:last])
+
+class IntrospectionNodeParser:
+	def __init__(self, data):
+		self.data = data
+		self.cache = {}
+
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
+
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
+
+	def recursive_binding(self):
+		return any('/' in s for s in self.get_children())
+
+class IntrospectionParser:
+	def __init__(self, name, bus):
+		self.name = name
+		self.bus = bus
+
+	def _introspect(self, path):
+		try:
+			obj = self.bus.get_object(self.name, path)
+			iface = dbus.Interface(obj, dbus.BUS_DAEMON_IFACE + '.Introspectable')
+			data = iface.Introspect()
+		except dbus.DBusException:
+			return None
+
+		return IntrospectionNodeParser(ElementTree.fromstring(data))
+
+	def _discover_flat(self, path, parser):
+		items = {}
+		interfaces = parser.get_interfaces().keys()
+		if interfaces:
+			items[path] = {}
+			items[path]['interfaces'] = interfaces
+
+		return items
+
+	def introspect(self, path = '/', parser = None):
+		items = {}
+		if not parser:
+			parser = self._introspect(path)
+		if not parser:
+			return {}
+		items.update(self._discover_flat(path, parser))
+
+		if path != '/':
+			path += '/'
+
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
+
+		return items
diff --git a/phosphor-mapper b/phosphor-mapper
index 890e546..313baa2 100644
--- a/phosphor-mapper
+++ b/phosphor-mapper
@@ -21,8 +21,7 @@ import dbus
 import dbus.service
 import dbus.mainloop.glib
 import gobject
-from xml.etree import ElementTree
-from OpenBMCMapper import Path
+from OpenBMCMapper import Path, IntrospectionParser
 import OpenBMCMapper
 
 class DictionaryCache:
@@ -260,110 +259,6 @@ class ObjectMapper(dbus.service.Object):
 			values.update(self.GetTree(x, depth, match_type))
 		return values
 
-class IntrospectionNodeParser:
-	def __init__(self, data):
-		self.data = data
-		self.cache = {}
-
-	def parse_args(self):
-		return [ x.attrib for x in self.data.findall('arg') ]
-
-	def parse_children(self):
-		return [ x.attrib['name'] for x in self.data.findall('node') ]
-
-	def parse_method_or_signal(self):
-		name = self.data.attrib['name']
-		return name, self.parse_args()
-
-	def parse_interface(self):
-		iface = {}
-		iface['method'] = {}
-		iface['signal'] = {}
-		name = self.data.attrib['name']
-
-		for node in self.data:
-			p = IntrospectionNodeParser(node)
-			if node.tag not in ['method', 'signal']:
-				continue
-			n, element = p.parse_method_or_signal()
-			iface[node.tag][n] = element
-
-		return name, iface
-
-	def parse_node(self):
-		if self.cache:
-			return self.cache
-
-		self.cache['interfaces'] = {}
-		self.cache['children'] = []
-
-		for node in self.data:
-			p = IntrospectionNodeParser(node)
-			if node.tag == 'interface':
-				name, ifaces = p.parse_interface()
-				self.cache['interfaces'][name] = ifaces
-			elif node.tag == 'node':
-				self.cache['children'] = self.parse_children()
-
-		return self.cache
-
-	def get_interfaces(self):
-		return self.parse_node()['interfaces']
-
-	def get_children(self):
-		return self.parse_node()['children']
-
-	def recursive_binding(self):
-		return any('/' in s for s in self.get_children())
-
-class IntrospectionParser:
-	def __init__(self, name, bus):
-		self.name = name
-		self.bus = bus
-
-	def _introspect(self, path):
-		try:
-			obj = self.bus.get_object(self.name, path)
-			iface = dbus.Interface(obj, dbus.BUS_DAEMON_IFACE + '.Introspectable')
-			data = iface.Introspect()
-		except dbus.DBusException:
-			return None
-
-		return IntrospectionNodeParser(ElementTree.fromstring(data))
-
-	def _discover_flat(self, path, parser):
-		items = {}
-		interfaces = parser.get_interfaces().keys()
-		if interfaces:
-			items[path] = {}
-			items[path]['interfaces'] = interfaces
-
-		return items
-
-	def introspect(self, path = '/', parser = None):
-		items = {}
-		if not parser:
-			parser = self._introspect(path)
-		if not parser:
-			return {}
-		items.update(self._discover_flat(path, parser))
-
-		if path != '/':
-			path += '/'
-
-		if parser.recursive_binding():
-			callback = self._discover_flat
-		else:
-			callback = self.introspect
-
-		for k in parser.get_children():
-			parser = self._introspect(path + k)
-			if not parser:
-				continue
-			items.update(callback(path + k, parser))
-
-		return items
-
 class BusWrapper:
 	def __init__(self, bus):
 		self.dbus = bus
-- 
2.6.0
