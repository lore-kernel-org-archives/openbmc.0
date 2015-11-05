Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 5ED171A0D64
 for <openbmc@lists.ozlabs.org>; Fri,  6 Nov 2015 00:22:55 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446729719638760.2466441692895;
 Thu, 5 Nov 2015 05:21:59 -0800 (PST)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH phosphor-objmgr v2 04/10] Use PathTree as internal storage
 structure
Date: Thu,  5 Nov 2015 07:21:44 -0600
Message-Id: <1446729710-27220-5-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 05 Nov 2015 13:22:55 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

PathTree enables more efficient and more idiomatic iterating.
Also tweaked the org.openbmc.objectmanager interface methods:
removed 'fuzzy' match type and added 'GetObject'.
---
 phosphor-mapper | 218 ++++++++++++--------------------------------------------
 1 file changed, 47 insertions(+), 171 deletions(-)

diff --git a/phosphor-mapper b/phosphor-mapper
index 1a63317..1415e24 100644
--- a/phosphor-mapper
+++ b/phosphor-mapper
@@ -21,156 +21,15 @@ import dbus
 import dbus.service
 import dbus.mainloop.glib
 import gobject
-from OpenBMCMapper import Path, IntrospectionParser
+from OpenBMCMapper import Path, IntrospectionParser, PathTree
 import OpenBMCMapper
 
-class DictionaryCache:
-	def __init__(self):
-		self.items = {'/': {} }
-
-	def _merge_item(self, item):
-		path, bus, iface = item
-		if bus in self.items[path]:
-			self.items[path][bus].append(iface)
-		else:
-			self.items[path][bus] = [ iface ]
-
-	def add_item(self, item):
-		path, bus, iface = item
-		if path != '/':
-			parent = Path(path).fq(last = -1)
-			if parent not in self.items:
-				self.add_item((parent, None, None))
-
-		items = self.items.get(path, None)
-		if bus and items:
-			self._merge_item(item)
-		elif items:
-			pass
-		elif bus:
-			self.items[path] = { bus: [ iface ] }
-		else:
-			self.items[path] = {}
-
-	def add_items(self, items):
-		for i in items:
-			self.add_item(i)
-
-	def _has_children(self, path):
-		return len(self.get_subtree_paths(path, 1, 'fuzzy')) != 1
-
-	def _try_remove_path(self, path):
-		if path == '/':
-			return None
-
-		if not self._has_children(path):
-			del self.items[path]
-
-			# try and remove the parent
-			parent = Path(path).fq(last = -1)
-			if not self.items[parent]:
-				self._try_remove_path(parent)
-
-	def _remove_bus(self, path, bus):
-		del self.items[path][bus]
-		if not self.items[path]:
-			self._try_remove_path(path)
-
-	def _remove_iface(self, path, bus, iface):
-		self.items[path][bus].remove(iface)
-		if not self.items[path][bus]:
-			self._remove_bus(path, bus)
-
-	def remove_item(self, item):
-		self._remove_iface(*item)
-
-	def remove_items(self, items):
-		for x in items:
-			self.remove_item(x)
-
-	def remove_bus(self, name):
-		for path,x in self.items.items():
-			for bus,ifaces in x.items():
-				if name != bus:
-					continue
-				self.remove_items([ (path, bus, iface) \
-						for iface in ifaces ])
-
-	def remove_busses(self, names):
-		for x in names:
-			self.remove_bus(name)
-
-	def _get_busses(self):
-		busses = [ y.iterkeys() for y in [ x for x in self.items.itervalues() ] ]
-		return set( x for y in busses for x in y ) # flatten nested lists
-
-	def has_bus(self, bus):
-		return any(bus in b for b in self._get_busses())
-
-	def get_subtree_paths(self, root, depth, match_type):
-		return filter(PathMatch(root, depth, match_type),
-				self.items.iterkeys())
-
-	def get_subtree(self, root, depth, match_type):
-		return dict(filter(ObjectMatch(root, depth, match_type),
-				self.items.iteritems()))
-
-	@staticmethod
-	def _iface__str__(ifaces):
-		return '\n'.join(["    %s" %(x) for x in ifaces ])
-
-	@staticmethod
-	def _bus__str__(busses):
-		return '\n'.join([ "%s\n%s" %(x, DictionaryCache._iface__str__(y)) \
-				for x,y in busses.iteritems() ])
-
-	def __str__(self):
-		return '\n'.join([ "%s\n%s" %(x, DictionaryCache._bus__str__(y)) \
-				for x,y in self.items.iteritems() ])
-
-class PathMatch(object):
-	def __init__(self, path, depth, match_type):
-		p = Path(path)
-		self.path = p.fq()
-		self.depth = p.depth()
-		self.match_type = match_type
-		self.match_depth = None
-		if depth != -1:
-			self.match_depth = p.depth() + depth
-
-	def __call__(self, path):
-		p = Path(path)
-		depth = p.depth()
-
-		# 'is not None' is really needed because
-		# the match depth can be zero
-		if self.match_depth is not None and depth > self.match_depth:
-			return False
-
-		fuzzy_match = p.fq(last = self.depth) == self.path or \
-				not self.depth
-		depth_match = self.match_depth == depth
-
-		if self.match_type == 'fuzzy':
-			return fuzzy_match
-
-		return fuzzy_match and depth_match
-
-class ObjectMatch(PathMatch):
-	def __init__(self, path, depth, match_type):
-		super(ObjectMatch, self).__init__(path, depth, match_type)
-
-	def __call__(self, tup):
-		if not super(ObjectMatch, self).__call__(tup[0]):
-			return False
-		return tup[1]
-
 class ObjectMapper(dbus.service.Object):
 	def __init__(self, bus, path,
 			name_match = OpenBMCMapper.org_dot_openbmc_match,
 			intf_match = OpenBMCMapper.org_dot_openbmc_match):
 		super(ObjectMapper, self).__init__(bus.dbus, path)
-		self.cache = DictionaryCache()
+		self.cache = PathTree()
 		self.bus = bus
 		self.name_match = name_match
 		self.intf_match = intf_match
@@ -192,13 +51,30 @@ class ObjectMapper(dbus.service.Object):
 			sender_keyword = 'sender')
 
 	def interfaces_added_handler(self, path, iprops, **kw):
-		for x in iprops.iterkeys():
-			if self.intf_match(x):
-				self.cache.add_item((path, kw['sender'], x))
+		matches = [ x for x in iprops.iterkeys() if self.intf_match(x) ]
+		d = self.cache.setdefault(path, {})
+		d[path].setdefault(kw['sender'], []).extend(matches)
+		self.cache[path] = d
 
 	def interfaces_removed_handler(self, path, interfaces, **kw):
+		item = self.cache[path]
+		name = kw['sender']
 		for x in interfaces:
-			self.cache.remove_item((path, kw['sender'], x))
+			item[name].remove(x)
+
+		# remove the owner if there aren't any interfaces left
+		if not item[name]:
+			del item[name]
+
+		# update if interfaces remain
+		if item:
+			self.cache[path] = item
+		# mark for removal if no interfaces remain
+		elif self.cache.get_children(item):
+			self.cache.demote(item)
+		# delete the entire path if everything is gone
+		else:
+			del self.cache[path]
 
 	def process_new_owner(self, name):
 		# unique name
@@ -206,8 +82,16 @@ class ObjectMapper(dbus.service.Object):
 			self.bus.dbus, self.tag_match, self.intf_match) ])
 
 	def process_old_owner(self, name):
-		# unique name
-		self.cache.remove_bus(name)
+		for x,y in self.cache.dataitems():
+			if name not in y:
+				continue
+			del y[name]
+			if y:
+				self.cache[x] = y
+			elif self.cache.get_children(x):
+				self.cache.demote(x)
+			else:
+				del self.cache[x]
 
 	def bus_handler(self, service, old, new):
 		if not self.discovery_done or \
@@ -219,13 +103,14 @@ class ObjectMapper(dbus.service.Object):
 		if old:
 			self.process_old_owner(old)
 
-	def add_interfaces(self, owner, path, interfaces):
-		for x in interfaces:
-			self.cache.add_item((path, owner, x))
+	def add_interfaces(self, path, owner, interfaces):
+		d = self.cache.setdefault(path, { })
+		d.setdefault(owner, []).extend(interfaces)
+		self.cache[path] = d
 
 	def add_items(self, owner, bus_items):
 		for x,y in bus_items.iteritems():
-			self.add_interfaces(owner, x, y['interfaces'])
+			self.add_interfaces(x, owner, y['interfaces'])
 
 	def discover(self, owners = None):
 		discovery = not self.discovery_done
@@ -235,31 +120,22 @@ class ObjectMapper(dbus.service.Object):
 						for x in self.bus.get_owner_names(self.name_match) ]
 			self.discovery_done = True
 		for o in owners:
-
-			# this only happens when an app
-			# grabs more than one well known name
-			if self.cache.has_bus(o.name):
-				continue
-
 			self.add_items(o.name, o.introspect())
 
 		if discovery:
 			print "ObjectMapper discovery complete..."
 
-	@dbus.service.method(OpenBMCMapper.MAPPER_IFACE, 'sis', 'as')
-	def GetTreePaths(self, path, depth, match_type):
-		return self.cache.get_subtree_paths(path, depth, match_type)
+	@dbus.service.method(OpenBMCMapper.MAPPER_IFACE, 's', 'a{sas}')
+	def GetObject(self, path):
+		return self.cache[path]
 
-	@dbus.service.method(OpenBMCMapper.MAPPER_IFACE, 'sis', 'a{sa{sas}}')
-	def GetTree(self, path, depth, match_type):
-		return self.cache.get_subtree(path, depth, match_type)
+	@dbus.service.method(OpenBMCMapper.MAPPER_IFACE, 'si', 'as')
+	def GetSubTreePaths(self, path, depth):
+		return self.cache.iterkeys(path, depth)
 
-	@dbus.service.method(OpenBMCMapper.MAPPER_IFACE, 'asis', 'a{sa{sas}}')
-	def GetTrees(self, paths, depth, match_type):
-		values = {}
-		for x in paths:
-			values.update(self.GetTree(x, depth, match_type))
-		return values
+	@dbus.service.method(OpenBMCMapper.MAPPER_IFACE, 'si', 'a{sa{sas}}')
+	def GetSubTree(self, path, depth):
+		return { x:y for x, y in self.cache.dataitems(path, depth) }
 
 class BusWrapper:
 	def __init__(self, bus):
-- 
2.6.0
