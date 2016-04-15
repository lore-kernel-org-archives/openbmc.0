Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qmcpn4GBJzDqCD
 for <openbmc@lists.ozlabs.org>; Fri, 15 Apr 2016 22:50:57 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1460724650304180.1829936677908;
 Fri, 15 Apr 2016 05:50:50 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <radsquirrel@gmail.com>
Subject: [PATCH pyphosphor 1/4] Introducing pyobmc
Date: Fri, 15 Apr 2016 07:50:44 -0500
Message-Id: <1460724647-4184-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1460724647-4184-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1460724647-4184-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 15 Apr 2016 12:50:58 -0000

From: Brad Bishop <radsquirrel@gmail.com>

We have openbmc python utilities scattered all over the place.  To
facilitate reuse, bring them together in a single python package.

None of this is new code, it was all simply ported and re-arranged
from other projects.

Ran everything through pep8.
---
 .gitignore                    |  87 ++++++++++++++++++++
 obmc/__init__.py              |   0
 obmc/dbuslib/__init__.py      |   0
 obmc/dbuslib/bindings.py      | 172 +++++++++++++++++++++++++++++++++++++++
 obmc/dbuslib/enums.py         |  29 +++++++
 obmc/dbuslib/introspection.py | 136 +++++++++++++++++++++++++++++++
 obmc/enums.py                 |  17 ++++
 obmc/mapper.py                |  43 ++++++++++
 obmc/utils/__init__.py        |   0
 obmc/utils/misc.py            |  63 +++++++++++++++
 obmc/utils/pathtree.py        | 183 ++++++++++++++++++++++++++++++++++++++++++
 setup.py                      |   5 ++
 12 files changed, 735 insertions(+)
 create mode 100644 .gitignore
 create mode 100644 obmc/__init__.py
 create mode 100644 obmc/dbuslib/__init__.py
 create mode 100644 obmc/dbuslib/bindings.py
 create mode 100644 obmc/dbuslib/enums.py
 create mode 100644 obmc/dbuslib/introspection.py
 create mode 100644 obmc/enums.py
 create mode 100644 obmc/mapper.py
 create mode 100644 obmc/utils/__init__.py
 create mode 100644 obmc/utils/misc.py
 create mode 100644 obmc/utils/pathtree.py
 create mode 100644 setup.py

diff --git a/.gitignore b/.gitignore
new file mode 100644
index 0000000..7c0d83f
--- /dev/null
+++ b/.gitignore
@@ -0,0 +1,87 @@
+# Copyright (c) 2016 GitHub, Inc.
+#
+# Permission is hereby granted,  free of charge,  to any person obtaining a
+# copy of this software and associated documentation files (the "Software"),
+# to deal in the Software without restriction, including without limitation
+# the rights to  use, copy, modify, merge, publish, distribute, sublicense,
+# and/or sell copies of the Software, and to permit persons to whom the
+# Software is furnished to do so, subject to the following conditions:
+#
+# The above copyright notice and this permission notice shall be included in
+# all copies or substantial portions of the Software.
+#
+# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+# DEALINGS IN THE SOFTWARE.
+
+# source: https://github.com/github/gitignore/blob/master/Python.gitignore
+
+# Byte-compiled / optimized / DLL files
+__pycache__/
+*.py[cod]
+*$py.class
+
+# C extensions
+*.so
+
+# Distribution / packaging
+.Python
+env/
+build/
+develop-eggs/
+dist/
+downloads/
+eggs/
+.eggs/
+lib/
+lib64/
+parts/
+sdist/
+var/
+*.egg-info/
+.installed.cfg
+*.egg
+
+# PyInstaller
+#  Usually these files are written by a python script from a template
+#  before PyInstaller builds the exe, so as to inject date/other infos into it.
+*.manifest
+*.spec
+
+# Installer logs
+pip-log.txt
+pip-delete-this-directory.txt
+
+# Unit test / coverage reports
+htmlcov/
+.tox/
+.coverage
+.coverage.*
+.cache
+nosetests.xml
+coverage.xml
+*,cover
+.hypothesis/
+
+# Translations
+*.mo
+*.pot
+
+# Django stuff:
+*.log
+
+# Sphinx documentation
+docs/_build/
+
+# PyBuilder
+target/
+
+#Ipython Notebook
+.ipynb_checkpoints
+
+*.swo
+*.swp
diff --git a/obmc/__init__.py b/obmc/__init__.py
new file mode 100644
index 0000000..e69de29
diff --git a/obmc/dbuslib/__init__.py b/obmc/dbuslib/__init__.py
new file mode 100644
index 0000000..e69de29
diff --git a/obmc/dbuslib/bindings.py b/obmc/dbuslib/bindings.py
new file mode 100644
index 0000000..51b9e59
--- /dev/null
+++ b/obmc/dbuslib/bindings.py
@@ -0,0 +1,172 @@
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
+import dbus
+
+BUS_PREFIX = 'org.openbmc'
+OBJ_PREFIX = "/org/openbmc"
+BUS = "system"
+
+
+def is_unique(connection):
+    return connection[0] == ':'
+
+
+def get_system_name():
+    #use filename as system name, strip off path and ext
+    parts = __file__.replace('.pyc', '').replace('.py', '').split('/')
+    return parts[len(parts)-1]
+
+
+def get_dbus():
+    bus = None
+    if (BUS == "session"):
+        bus = dbus.SessionBus()
+    else:
+        bus = dbus.SystemBus()
+    return bus
+
+
+class DbusProperties(dbus.service.Object):
+    def __init__(self):
+        dbus.service.Object.__init__(self)
+        self.properties = {}
+        self.object_path = ""
+
+    @dbus.service.method(
+        dbus.PROPERTIES_IFACE,
+        in_signature='ss', out_signature='v')
+    def Get(self, interface_name, property_name):
+        d = self.GetAll(interface_name)
+        try:
+            v = d[property_name]
+            return v
+        except:
+            raise dbus.exceptions.DBusException(
+                "org.freedesktop.UnknownProperty: "+property_name)
+
+    @dbus.service.method(
+        dbus.PROPERTIES_IFACE,
+        in_signature='s', out_signature='a{sv}')
+    def GetAll(self, interface_name):
+        try:
+            d = self.properties[interface_name]
+            return d
+        except:
+            raise dbus.exceptions.DBusException(
+                "org.freedesktop.UnknownInterface: "+interface_name)
+
+    @dbus.service.method(
+        dbus.PROPERTIES_IFACE,
+        in_signature='ssv')
+    def Set(self, interface_name, property_name, new_value):
+        if (interface_name not in self.properties):
+            self.properties[interface_name] = {}
+        try:
+            old_value = self.properties[interface_name][property_name]
+            if (old_value != new_value):
+                self.properties[interface_name][property_name] = new_value
+                self.PropertiesChanged(
+                    interface_name, {property_name: new_value}, [])
+
+        except:
+            self.properties[interface_name][property_name] = new_value
+            self.PropertiesChanged(
+                interface_name, {property_name: new_value}, [])
+
+    @dbus.service.method(
+        "org.openbmc.Object.Properties", in_signature='sa{sv}')
+    def SetMultiple(self, interface_name, prop_dict):
+        if (interface_name in self.properties):
+            self.properties[interface_name] = {}
+
+        value_changed = False
+        for property_name in prop_dict:
+            new_value = prop_dict[property_name]
+            try:
+                old_value = self.properties[interface_name][property_name]
+                if (old_value != new_value):
+                    self.properties[interface_name][property_name] = new_value
+                    value_changed = True
+
+            except:
+                self.properties[interface_name][property_name] = new_value
+                value_changed = True
+        if (value_changed is True):
+            self.PropertiesChanged(interface_name, prop_dict, [])
+
+    @dbus.service.signal(
+        dbus.PROPERTIES_IFACE, signature='sa{sv}as')
+    def PropertiesChanged(
+            self, interface_name, changed_properties, invalidated_properties):
+        pass
+
+
+class DbusObjectManager(dbus.service.Object):
+    def __init__(self):
+        dbus.service.Object.__init__(self)
+        self.objects = {}
+
+    def add(self, object_path, obj):
+        self.objects[object_path] = obj
+        self.InterfacesAdded(object_path, obj.properties)
+
+    def remove(self, object_path):
+        obj = self.objects.pop(object_path, None)
+        obj.remove_from_connection()
+        self.InterfacesRemoved(object_path, obj.properties.keys())
+
+    def get(self, object_path, default=None):
+        return self.objects.get(object_path, default)
+
+    @dbus.service.method(
+        "org.freedesktop.DBus.ObjectManager",
+        in_signature='', out_signature='a{oa{sa{sv}}}')
+    def GetManagedObjects(self):
+        data = {}
+        for objpath in self.objects.keys():
+            data[objpath] = self.objects[objpath].properties
+        return data
+
+    @dbus.service.signal(
+        "org.freedesktop.DBus.ObjectManager", signature='oa{sa{sv}}')
+    def InterfacesAdded(self, object_path, properties):
+        self.ObjectAdded(object_path, "")
+
+    @dbus.service.signal(
+        "org.freedesktop.DBus.ObjectManager", signature='oas')
+    def InterfacesRemoved(self, object_path, interfaces):
+        pass
+
+    ## Legacy support, need to eventually refactor out
+    @dbus.service.signal(
+        "org.openbmc.Object.ObjectMapper", signature='ss')
+    def ObjectAdded(self, object_path, interface_name):
+        pass
+
+    ## flattens interfaces
+    @dbus.service.method(
+        'org.openbmc.Object.Enumerate', in_signature='',
+        out_signature='a{sa{sv}}')
+    def enumerate(self):
+        data = {}
+        for objpath in self.objects.keys():
+            props = self.objects[objpath].properties
+            data[objpath] = {}
+            for iface in props.keys():
+                data[objpath].update(props[iface])
+
+        return data
diff --git a/obmc/dbuslib/enums.py b/obmc/dbuslib/enums.py
new file mode 100644
index 0000000..910594a
--- /dev/null
+++ b/obmc/dbuslib/enums.py
@@ -0,0 +1,29 @@
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
+import dbus
+
+DBUS_OBJMGR_IFACE = dbus.BUS_DAEMON_IFACE + '.ObjectManager'
+DBUS_UNKNOWN_INTERFACE = 'org.freedesktop.UnknownInterface'
+DBUS_UNKNOWN_PROPERTY = 'org.freedesktop.DBus.Error.UnknownProperty'
+DBUS_UNKNOWN_METHOD = 'org.freedesktop.DBus.Error.UnknownMethod'
+DBUS_INVALID_ARGS = 'org.freedesktop.DBus.Error.InvalidArgs'
+DBUS_TYPE_ERROR = 'org.freedesktop.DBus.Python.TypeError'
+OBMC_ASSOCIATIONS_IFACE = 'org.openbmc.Associations'
+OBMC_ASSOC_IFACE = 'org.openbmc.Association'
+OBMC_DELETE_IFACE = 'org.openbmc.Object.Delete'
+OBMC_PROPERTIES_IFACE = "org.openbmc.Object.Properties"
+OBMC_ENUMERATE_IFACE = "org.openbmc.Object.Enumerate"
diff --git a/obmc/dbuslib/introspection.py b/obmc/dbuslib/introspection.py
new file mode 100644
index 0000000..db83c6e
--- /dev/null
+++ b/obmc/dbuslib/introspection.py
@@ -0,0 +1,136 @@
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
+from xml.etree import ElementTree
+import dbus
+
+
+class IntrospectionNodeParser:
+    def __init__(self, data, tag_match=bool, intf_match=bool):
+        self.data = data
+        self.cache = {}
+        self.tag_match = tag_match
+        self.intf_match = intf_match
+
+    def parse_args(self):
+        return [x.attrib for x in self.data.findall('arg')]
+
+    def parse_children(self):
+        return [x.attrib['name'] for x in self.data.findall('node')]
+
+    def parse_method_or_signal(self):
+        name = self.data.attrib['name']
+        return name, self.parse_args()
+
+    def parse_interface(self):
+        iface = {}
+        iface['method'] = {}
+        iface['signal'] = {}
+
+        for node in self.data:
+            if node.tag not in ['method', 'signal']:
+                continue
+            if not self.tag_match(node.tag):
+                continue
+            p = IntrospectionNodeParser(
+                node, self.tag_match, self.intf_match)
+            n, element = p.parse_method_or_signal()
+            iface[node.tag][n] = element
+
+        return iface
+
+    def parse_node(self):
+        if self.cache:
+            return self.cache
+
+        self.cache['interfaces'] = {}
+        self.cache['children'] = []
+
+        for node in self.data:
+            if node.tag == 'interface':
+                p = IntrospectionNodeParser(
+                    node, self.tag_match, self.intf_match)
+                name = p.data.attrib['name']
+                if not self.intf_match(name):
+                    continue
+                self.cache['interfaces'][name] = p.parse_interface()
+            elif node.tag == 'node':
+                self.cache['children'] = self.parse_children()
+
+        return self.cache
+
+    def get_interfaces(self):
+        return self.parse_node()['interfaces']
+
+    def get_children(self):
+        return self.parse_node()['children']
+
+    def recursive_binding(self):
+        return any('/' in s for s in self.get_children())
+
+
+class IntrospectionParser:
+    def __init__(self, name, bus, tag_match=bool, intf_match=bool):
+        self.name = name
+        self.bus = bus
+        self.tag_match = tag_match
+        self.intf_match = intf_match
+
+    def _introspect(self, path):
+        try:
+            obj = self.bus.get_object(self.name, path, introspect=False)
+            iface = dbus.Interface(obj, dbus.INTROSPECTABLE_IFACE)
+            data = iface.Introspect()
+        except dbus.DBusException:
+            return None
+
+        return IntrospectionNodeParser(
+            ElementTree.fromstring(data),
+            self.tag_match,
+            self.intf_match)
+
+    def _discover_flat(self, path, parser):
+        items = {}
+        interfaces = parser.get_interfaces().keys()
+        if interfaces:
+            items[path] = {}
+            items[path]['interfaces'] = interfaces
+
+        return items
+
+    def introspect(self, path='/', parser=None):
+        items = {}
+        if not parser:
+            parser = self._introspect(path)
+        if not parser:
+            return {}
+        items.update(self._discover_flat(path, parser))
+
+        if path != '/':
+            path += '/'
+
+        if parser.recursive_binding():
+            callback = self._discover_flat
+        else:
+            callback = self.introspect
+
+        for k in parser.get_children():
+            parser = self._introspect(path + k)
+            if not parser:
+                continue
+            items.update(callback(path + k, parser))
+
+        return items
diff --git a/obmc/enums.py b/obmc/enums.py
new file mode 100644
index 0000000..a10b2d1
--- /dev/null
+++ b/obmc/enums.py
@@ -0,0 +1,17 @@
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
+GPIO_DEV = '/sys/class/gpio'
diff --git a/obmc/mapper.py b/obmc/mapper.py
new file mode 100644
index 0000000..3f9df5d
--- /dev/null
+++ b/obmc/mapper.py
@@ -0,0 +1,43 @@
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
+import dbus
+
+MAPPER_NAME = 'org.openbmc.objectmapper'
+MAPPER_IFACE = MAPPER_NAME + '.ObjectMapper'
+MAPPER_PATH = '/org/openbmc/objectmapper/objectmapper'
+ENUMERATE_IFACE = 'org.openbmc.Object.Enumerate'
+MAPPER_NOT_FOUND = 'org.openbmc.objectmapper.Error.NotFound'
+
+
+class Mapper:
+    def __init__(self, bus):
+        self.bus = bus
+        obj = bus.get_object(MAPPER_NAME, MAPPER_PATH, introspect=False)
+        self.iface = dbus.Interface(
+            obj, dbus_interface=MAPPER_IFACE)
+
+    def get_object(self, path):
+        return self.iface.GetObject(path)
+
+    def get_subtree_paths(self, path='/', depth=0):
+        return self.iface.GetSubTreePaths(path, depth)
+
+    def get_subtree(self, path='/', depth=0):
+        return self.iface.GetSubTree(path, depth)
+
+    def get_ancestors(self, path):
+        return self.iface.GetAncestors(path)
diff --git a/obmc/utils/__init__.py b/obmc/utils/__init__.py
new file mode 100644
index 0000000..e69de29
diff --git a/obmc/utils/misc.py b/obmc/utils/misc.py
new file mode 100644
index 0000000..cfde266
--- /dev/null
+++ b/obmc/utils/misc.py
@@ -0,0 +1,63 @@
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
+
+class Path:
+    def __init__(self, path):
+        self.parts = filter(bool, path.split('/'))
+
+    def rel(self, first=None, last=None):
+        # relative
+        return self.get('', first, last)
+
+    def fq(self, first=None, last=None):
+        # fully qualified
+        return self.get('/', first, last)
+
+    def depth(self):
+        return len(self.parts)
+
+    def get(self, prefix='/', first=None, last=None):
+        if not first:
+            first = 0
+        if not last:
+            last = self.depth()
+        return prefix + '/'.join(self.parts[first:last])
+
+
+def org_dot_openbmc_match(name):
+    return 'org.openbmc' in name
+
+
+class ListMatch(object):
+    def __init__(self, l):
+        self.l = l
+
+    def __call__(self, match):
+        return match in self.l
+
+
+def find_case_insensitive(value, lst):
+    return next((x for x in lst if x.lower() == value.lower()), None)
+
+
+def makelist(data):
+    if isinstance(data, list):
+            return data
+    elif data:
+            return [data]
+    else:
+            return []
diff --git a/obmc/utils/pathtree.py b/obmc/utils/pathtree.py
new file mode 100644
index 0000000..221495e
--- /dev/null
+++ b/obmc/utils/pathtree.py
@@ -0,0 +1,183 @@
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
+
+class PathTreeItemIterator(object):
+    def __init__(self, path_tree, subtree, depth):
+        self.path_tree = path_tree
+        self.path = []
+        self.itlist = []
+        self.subtree = ['/'] + filter(bool, subtree.split('/'))
+        self.depth = depth
+        d = path_tree.root
+        for k in self.subtree:
+            try:
+                d = d[k]['children']
+            except KeyError:
+                raise KeyError(subtree)
+        self.it = d.iteritems()
+
+    def __iter__(self):
+        return self
+
+    def __next__(self):
+        return super(PathTreeItemIterator, self).next()
+
+    def next(self):
+        key, value = self._next()
+        path = self.subtree[0] + '/'.join(self.subtree[1:] + self.path)
+        return path, value.get('data')
+
+    def _next(self):
+        try:
+            while True:
+                x = self.it.next()
+                depth_exceeded = len(self.path) + 1 > self.depth
+                if self.depth and depth_exceeded:
+                    continue
+                self.itlist.append(self.it)
+                self.path.append(x[0])
+                self.it = x[1]['children'].iteritems()
+                break
+
+        except StopIteration:
+            if not self.itlist:
+                raise StopIteration
+
+            self.it = self.itlist.pop()
+            self.path.pop()
+            x = self._next()
+
+        return x
+
+
+class PathTreeKeyIterator(PathTreeItemIterator):
+    def __init__(self, path_tree, subtree, depth):
+        super(PathTreeKeyIterator, self).__init__(path_tree, subtree, depth)
+
+    def next(self):
+        return super(PathTreeKeyIterator, self).next()[0]
+
+
+class PathTree:
+    def __init__(self):
+        self.root = {}
+
+    def _try_delete_parent(self, elements):
+        if len(elements) == 1:
+            return False
+
+        kids = 'children'
+        elements.pop()
+        d = self.root
+        for k in elements[:-1]:
+            d = d[k][kids]
+
+        if 'data' not in d[elements[-1]] and not d[elements[-1]][kids]:
+            del d[elements[-1]]
+            self._try_delete_parent(elements)
+
+    def _get_node(self, key):
+        kids = 'children'
+        elements = ['/'] + filter(bool, key.split('/'))
+        d = self.root
+        for k in elements[:-1]:
+            try:
+                d = d[k][kids]
+            except KeyError:
+                raise KeyError(key)
+
+        return d[elements[-1]]
+
+    def __iter__(self):
+        return self
+
+    def __missing__(self, key):
+        for x in self.iterkeys():
+            if key == x:
+                return False
+        return True
+
+    def __delitem__(self, key):
+        kids = 'children'
+        elements = ['/'] + filter(bool, key.split('/'))
+        d = self.root
+        for k in elements[:-1]:
+            try:
+                d = d[k][kids]
+            except KeyError:
+                raise KeyError(key)
+
+        del d[elements[-1]]
+        self._try_delete_parent(elements)
+
+    def __setitem__(self, key, value):
+        kids = 'children'
+        elements = ['/'] + filter(bool, key.split('/'))
+        d = self.root
+        for k in elements[:-1]:
+            d = d.setdefault(k, {kids: {}})[kids]
+
+        children = d.setdefault(elements[-1], {kids: {}})[kids]
+        d[elements[-1]].update({kids: children, 'data': value})
+
+    def __getitem__(self, key):
+        return self._get_node(key).get('data')
+
+    def setdefault(self, key, default):
+        if not self.get(key):
+            self.__setitem__(key, default)
+
+        return self.__getitem__(key)
+
+    def get(self, key, default=None):
+        try:
+            x = self.__getitem__(key)
+        except KeyError:
+            x = default
+
+        return x
+
+    def get_children(self, key):
+        return [x for x in self._get_node(key)['children'].iterkeys()]
+
+    def demote(self, key):
+        n = self._get_node(key)
+        if 'data' in n:
+            del n['data']
+
+    def keys(self, subtree='/', depth=None):
+        return [x for x in self.iterkeys(subtree, depth)]
+
+    def values(self, subtree='/', depth=None):
+        return [x[1] for x in self.iteritems(subtree, depth)]
+
+    def items(self, subtree='/', depth=None):
+        return [x for x in self.iteritems(subtree, depth)]
+
+    def dataitems(self, subtree='/', depth=None):
+        return [x for x in self.iteritems(subtree, depth)
+                if x[1] is not None]
+
+    def iterkeys(self, subtree='/', depth=None):
+        if not self.root:
+            return {}.iterkeys()
+        return PathTreeKeyIterator(self, subtree, depth)
+
+    def iteritems(self, subtree='/', depth=None):
+        if not self.root:
+            return {}.iteritems()
+        return PathTreeItemIterator(self, subtree, depth)
diff --git a/setup.py b/setup.py
new file mode 100644
index 0000000..39aa301
--- /dev/null
+++ b/setup.py
@@ -0,0 +1,5 @@
+from distutils.core import setup
+setup(name='pyobmc',
+      version='1.0',
+      packages=['obmc', 'obmc.dbuslib', 'obmc.utils'],
+      )
-- 
2.7.1
