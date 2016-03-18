Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qRXM83V2XzDqyC
 for <openbmc@lists.ozlabs.org>; Sat, 19 Mar 2016 04:31:16 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1458322271250375.17478788638084;
 Fri, 18 Mar 2016 10:31:11 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH phosphor-objmgr 2/6] Use pyobmc package
Date: Fri, 18 Mar 2016 12:30:49 -0500
Message-Id: <1458322253-31653-3-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1458322253-31653-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1458322253-31653-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Fri, 18 Mar 2016 17:31:17 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

No functional changes here.  Just module/package namespace updates
to use the pyobmc library.  Removed code duplicated by pyobmc.
---
 OpenBMCMapper.py | 364 -------------------------------------------------------
 phosphor-mapper  |  28 +++--
 setup.py         |   3 +-
 3 files changed, 16 insertions(+), 379 deletions(-)
 delete mode 100644 OpenBMCMapper.py

diff --git a/OpenBMCMapper.py b/OpenBMCMapper.py
deleted file mode 100644
index 518e703..0000000
--- a/OpenBMCMapper.py
+++ /dev/null
@@ -1,364 +0,0 @@
-#!/usr/bin/env python
-
-# Contributors Listed Below - COPYRIGHT 2015
-# [+] International Business Machines Corp.
-#
-#
-# Licensed under the Apache License, Version 2.0 (the "License");
-# you may not use this file except in compliance with the License.
-# You may obtain a copy of the License at
-#
-#     http://www.apache.org/licenses/LICENSE-2.0
-#
-# Unless required by applicable law or agreed to in writing, software
-# distributed under the License is distributed on an "AS IS" BASIS,
-# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
-# implied. See the License for the specific language governing
-# permissions and limitations under the License.
-
-from xml.etree import ElementTree
-import dbus
-
-MAPPER_NAME = 'org.openbmc.objectmapper'
-MAPPER_IFACE = MAPPER_NAME + '.ObjectMapper'
-MAPPER_PATH = '/org/openbmc/objectmapper/objectmapper'
-ENUMERATE_IFACE = 'org.openbmc.Object.Enumerate'
-MAPPER_NOT_FOUND = 'org.openbmc.objectmapper.Error.NotFound'
-
-
-class Path:
-    def __init__(self, path):
-        self.parts = filter(bool, path.split('/'))
-
-    def rel(self, first=None, last=None):
-        # relative
-        return self.get('', first, last)
-
-    def fq(self, first=None, last=None):
-        # fully qualified
-        return self.get('/', first, last)
-
-    def depth(self):
-        return len(self.parts)
-
-    def get(self, prefix='/', first=None, last=None):
-        if not first:
-            first = 0
-        if not last:
-            last = self.depth()
-        return prefix + '/'.join(self.parts[first:last])
-
-
-def org_dot_openbmc_match(name):
-    return 'org.openbmc' in name
-
-
-class ListMatch(object):
-    def __init__(self, l):
-        self.l = l
-
-    def __call__(self, match):
-        return match in self.l
-
-
-class IntrospectionNodeParser:
-    def __init__(self, data, tag_match=bool, intf_match=bool):
-        self.data = data
-        self.cache = {}
-        self.tag_match = tag_match
-        self.intf_match = intf_match
-
-    def parse_args(self):
-        return [x.attrib for x in self.data.findall('arg')]
-
-    def parse_children(self):
-        return [x.attrib['name'] for x in self.data.findall('node')]
-
-    def parse_method_or_signal(self):
-        name = self.data.attrib['name']
-        return name, self.parse_args()
-
-    def parse_interface(self):
-        iface = {}
-        iface['method'] = {}
-        iface['signal'] = {}
-
-        for node in self.data:
-            if node.tag not in ['method', 'signal']:
-                continue
-            if not self.tag_match(node.tag):
-                continue
-            p = IntrospectionNodeParser(
-                node, self.tag_match, self.intf_match)
-            n, element = p.parse_method_or_signal()
-            iface[node.tag][n] = element
-
-        return iface
-
-    def parse_node(self):
-        if self.cache:
-            return self.cache
-
-        self.cache['interfaces'] = {}
-        self.cache['children'] = []
-
-        for node in self.data:
-            if node.tag == 'interface':
-                p = IntrospectionNodeParser(
-                    node, self.tag_match, self.intf_match)
-                name = p.data.attrib['name']
-                if not self.intf_match(name):
-                    continue
-                self.cache['interfaces'][name] = p.parse_interface()
-            elif node.tag == 'node':
-                self.cache['children'] = self.parse_children()
-
-        return self.cache
-
-    def get_interfaces(self):
-        return self.parse_node()['interfaces']
-
-    def get_children(self):
-        return self.parse_node()['children']
-
-    def recursive_binding(self):
-        return any('/' in s for s in self.get_children())
-
-
-class IntrospectionParser:
-    def __init__(self, name, bus, tag_match=bool, intf_match=bool):
-        self.name = name
-        self.bus = bus
-        self.tag_match = tag_match
-        self.intf_match = intf_match
-
-    def _introspect(self, path):
-        try:
-            obj = self.bus.get_object(self.name, path, introspect=False)
-            iface = dbus.Interface(obj, dbus.INTROSPECTABLE_IFACE)
-            data = iface.Introspect()
-        except dbus.DBusException:
-            return None
-
-        return IntrospectionNodeParser(
-            ElementTree.fromstring(data),
-            self.tag_match,
-            self.intf_match)
-
-    def _discover_flat(self, path, parser):
-        items = {}
-        interfaces = parser.get_interfaces().keys()
-        if interfaces:
-            items[path] = {}
-            items[path]['interfaces'] = interfaces
-
-        return items
-
-    def introspect(self, path='/', parser=None):
-        items = {}
-        if not parser:
-            parser = self._introspect(path)
-        if not parser:
-            return {}
-        items.update(self._discover_flat(path, parser))
-
-        if path != '/':
-            path += '/'
-
-        if parser.recursive_binding():
-            callback = self._discover_flat
-        else:
-            callback = self.introspect
-
-        for k in parser.get_children():
-            parser = self._introspect(path + k)
-            if not parser:
-                continue
-            items.update(callback(path + k, parser))
-
-        return items
-
-
-class PathTreeItemIterator(object):
-    def __init__(self, path_tree, subtree, depth):
-        self.path_tree = path_tree
-        self.path = []
-        self.itlist = []
-        self.subtree = ['/'] + filter(bool, subtree.split('/'))
-        self.depth = depth
-        d = path_tree.root
-        for k in self.subtree:
-            try:
-                d = d[k]['children']
-            except KeyError:
-                raise KeyError(subtree)
-        self.it = d.iteritems()
-
-    def __iter__(self):
-        return self
-
-    def __next__(self):
-        return super(PathTreeItemIterator, self).next()
-
-    def next(self):
-        key, value = self._next()
-        path = self.subtree[0] + '/'.join(self.subtree[1:] + self.path)
-        return path, value.get('data')
-
-    def _next(self):
-        try:
-            while True:
-                x = self.it.next()
-                depth_exceeded = len(self.path) + 1 > self.depth
-                if self.depth and depth_exceeded:
-                    continue
-                self.itlist.append(self.it)
-                self.path.append(x[0])
-                self.it = x[1]['children'].iteritems()
-                break
-
-        except StopIteration:
-            if not self.itlist:
-                raise StopIteration
-
-            self.it = self.itlist.pop()
-            self.path.pop()
-            x = self._next()
-
-        return x
-
-
-class PathTreeKeyIterator(PathTreeItemIterator):
-    def __init__(self, path_tree, subtree, depth):
-        super(PathTreeKeyIterator, self).__init__(path_tree, subtree, depth)
-
-    def next(self):
-        return super(PathTreeKeyIterator, self).next()[0]
-
-
-class PathTree:
-    def __init__(self):
-        self.root = {}
-
-    def _try_delete_parent(self, elements):
-        if len(elements) == 1:
-            return False
-
-        kids = 'children'
-        elements.pop()
-        d = self.root
-        for k in elements[:-1]:
-            d = d[k][kids]
-
-        if 'data' not in d[elements[-1]] and not d[elements[-1]][kids]:
-            del d[elements[-1]]
-            self._try_delete_parent(elements)
-
-    def _get_node(self, key):
-        kids = 'children'
-        elements = ['/'] + filter(bool, key.split('/'))
-        d = self.root
-        for k in elements[:-1]:
-            try:
-                d = d[k][kids]
-            except KeyError:
-                raise KeyError(key)
-
-        return d[elements[-1]]
-
-    def __iter__(self):
-        return self
-
-    def __missing__(self, key):
-        for x in self.iterkeys():
-            if key == x:
-                return False
-        return True
-
-    def __delitem__(self, key):
-        kids = 'children'
-        elements = ['/'] + filter(bool, key.split('/'))
-        d = self.root
-        for k in elements[:-1]:
-            try:
-                d = d[k][kids]
-            except KeyError:
-                raise KeyError(key)
-
-        del d[elements[-1]]
-        self._try_delete_parent(elements)
-
-    def __setitem__(self, key, value):
-        kids = 'children'
-        elements = ['/'] + filter(bool, key.split('/'))
-        d = self.root
-        for k in elements[:-1]:
-            d = d.setdefault(k, {kids: {}})[kids]
-
-        children = d.setdefault(elements[-1], {kids: {}})[kids]
-        d[elements[-1]].update({kids: children, 'data': value})
-
-    def __getitem__(self, key):
-        return self._get_node(key).get('data')
-
-    def setdefault(self, key, default):
-        if not self.get(key):
-            self.__setitem__(key, default)
-
-        return self.__getitem__(key)
-
-    def get(self, key, default=None):
-        try:
-            x = self.__getitem__(key)
-        except KeyError:
-            x = default
-
-        return x
-
-    def get_children(self, key):
-        return [x for x in self._get_node(key)['children'].iterkeys()]
-
-    def demote(self, key):
-        n = self._get_node(key)
-        if 'data' in n:
-            del n['data']
-
-    def keys(self, subtree='/', depth=None):
-        return [x for x in self.iterkeys(subtree, depth)]
-
-    def values(self, subtree='/', depth=None):
-        return [x[1] for x in self.iteritems(subtree, depth)]
-
-    def items(self, subtree='/', depth=None):
-        return [x for x in self.iteritems(subtree, depth)]
-
-    def dataitems(self, subtree='/', depth=None):
-        return [x for x in self.iteritems(subtree, depth)
-                if x[1] is not None]
-
-    def iterkeys(self, subtree='/', depth=None):
-        if not self.root:
-            return {}.iterkeys()
-        return PathTreeKeyIterator(self, subtree, depth)
-
-    def iteritems(self, subtree='/', depth=None):
-        if not self.root:
-            return {}.iteritems()
-        return PathTreeItemIterator(self, subtree, depth)
-
-
-class Mapper:
-    def __init__(self, bus):
-        self.bus = bus
-        obj = bus.get_object(MAPPER_NAME, MAPPER_PATH, introspect=False)
-        self.iface = dbus.Interface(
-            obj, dbus_interface=MAPPER_IFACE)
-
-    def get_object(self, path):
-        return self.iface.GetObject(path)
-
-    def get_subtree_paths(self, path='/', depth=0):
-        return self.iface.GetSubTreePaths(path, depth)
-
-    def get_subtree(self, path='/', depth=0):
-        return self.iface.GetSubTree(path, depth)
diff --git a/phosphor-mapper b/phosphor-mapper
index 255897f..d81fbf6 100644
--- a/phosphor-mapper
+++ b/phosphor-mapper
@@ -21,12 +21,14 @@ import dbus.service
 import dbus.exceptions
 import dbus.mainloop.glib
 import gobject
-from OpenBMCMapper import IntrospectionParser, PathTree
-import OpenBMCMapper
+from obmc.dbuslib.introspection import IntrospectionParser
+import obmc.utils.pathtree
+import obmc.utils.misc
+import obmc.mapper
 
 
 class MapperNotFoundException(dbus.exceptions.DBusException):
-    _dbus_error_name = OpenBMCMapper.MAPPER_NOT_FOUND
+    _dbus_error_name = obmc.mapper.MAPPER_NOT_FOUND
 
     def __init__(self, path):
         super(MapperNotFoundException, self).__init__(
@@ -35,14 +37,14 @@ class MapperNotFoundException(dbus.exceptions.DBusException):
 
 class ObjectMapper(dbus.service.Object):
     def __init__(self, bus, path,
-                 name_match=OpenBMCMapper.org_dot_openbmc_match,
-                 intf_match=OpenBMCMapper.org_dot_openbmc_match):
+                 name_match=obmc.utils.misc.org_dot_openbmc_match,
+                 intf_match=obmc.utils.misc.org_dot_openbmc_match):
         super(ObjectMapper, self).__init__(bus.dbus, path)
-        self.cache = PathTree()
+        self.cache = obmc.utils.pathtree.PathTree()
         self.bus = bus
         self.name_match = name_match
         self.intf_match = intf_match
-        self.tag_match = OpenBMCMapper.ListMatch(['children', 'interface'])
+        self.tag_match = obmc.utils.misc.ListMatch(['children', 'interface'])
         self.service = None
 
         gobject.idle_add(self.discover)
@@ -64,7 +66,7 @@ class ObjectMapper(dbus.service.Object):
             sender_keyword='sender')
 
     def bus_match(self, name):
-        if name == OpenBMCMapper.MAPPER_NAME:
+        if name == obmc.mapper.MAPPER_NAME:
             return False
         return self.name_match(name)
 
@@ -158,23 +160,23 @@ class ObjectMapper(dbus.service.Object):
         if self.discovery_pending():
             print "ObjectMapper discovery complete..."
             self.service = dbus.service.BusName(
-                OpenBMCMapper.MAPPER_NAME, self.bus.dbus)
+                obmc.mapper.MAPPER_NAME, self.bus.dbus)
 
-    @dbus.service.method(OpenBMCMapper.MAPPER_IFACE, 's', 'a{sas}')
+    @dbus.service.method(obmc.mapper.MAPPER_IFACE, 's', 'a{sas}')
     def GetObject(self, path):
         o = self.cache.get(path)
         if not o:
             raise MapperNotFoundException(path)
         return o
 
-    @dbus.service.method(OpenBMCMapper.MAPPER_IFACE, 'si', 'as')
+    @dbus.service.method(obmc.mapper.MAPPER_IFACE, 'si', 'as')
     def GetSubTreePaths(self, path, depth):
         try:
             return self.cache.iterkeys(path, depth)
         except KeyError:
             raise MapperNotFoundException(path)
 
-    @dbus.service.method(OpenBMCMapper.MAPPER_IFACE, 'si', 'a{sa{sas}}')
+    @dbus.service.method(obmc.mapper.MAPPER_IFACE, 'si', 'a{sa{sas}}')
     def GetSubTree(self, path, depth):
         try:
             return {x: y for x, y in self.cache.dataitems(path, depth)}
@@ -205,7 +207,7 @@ class BusWrapper:
 if __name__ == '__main__':
     dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
     bus = dbus.SystemBus()
-    o = ObjectMapper(BusWrapper(bus), OpenBMCMapper.MAPPER_PATH)
+    o = ObjectMapper(BusWrapper(bus), obmc.mapper.MAPPER_PATH)
     loop = gobject.MainLoop()
 
     loop.run()
diff --git a/setup.py b/setup.py
index bfbf3fc..7185072 100644
--- a/setup.py
+++ b/setup.py
@@ -1,6 +1,5 @@
 from distutils.core import setup
-setup(name='OpenBMCMapper',
+setup(name='phosphor-mapper',
       version='1.0',
-      py_modules=['OpenBMCMapper'],
       scripts=['phosphor-mapper']
       )
-- 
2.7.1
