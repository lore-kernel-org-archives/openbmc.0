Return-Path: <bradleyb@fuzziesquirrel.com>
X-Greylist: delayed 403 seconds by postgrey-1.35 at bilbo;
 Sat, 19 Mar 2016 06:23:53 AEDT
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.b=vnKnwtS+; dkim-atps=neutral
Received: from mail.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qRZs50YptzDq5s
 for <openbmc@lists.ozlabs.org>; Sat, 19 Mar 2016 06:23:53 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.fuzziesquirrel.com D423520896
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fuzziesquirrel.com;
 s=mail; t=1458328627;
 bh=tHXfdcMFdUxvyHWgITLF3QitWqQdNkXNTQiVXKVhObk=;
 h=From:Subject:Date:To:From;
 b=vnKnwtS+GdHXhTXY1p11jEdsG5Kz/1hVd1N8qt6vxDyPyh9SvBXK+8NBEZ3MM2kEZ
 BCzMgWzvbc4PYvmfAo/ytJmnEPt6OHOaNV0zaYslK37QqC6u2zHipCvJZ242yIrP99
 0tQQpNaAs8xR/5QdPErUVgwwsZ7otsxTCdcqcvrI=
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Subject: [PATCH] Introducing pyobmc
Message-Id: <0CAB8702-6ADC-4331-8388-C78225ABB4F6@fuzziesquirrel.com>
Date: Fri, 18 Mar 2016 15:18:14 -0400
To: OpenBMC Patches <openbmc@lists.ozlabs.org>
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
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
X-List-Received-Date: Fri, 18 Mar 2016 19:23:54 -0000

=46rom eb5d105ea815f7402640f684281f72e73b0a22fb Mon Sep 17 00:00:00 2001
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
Date: Thu, 11 Feb 2016 16:15:40 -0500
Subject: [PATCH] Introducing pyobmc

We have openbmc python utilities scattered all over the place.  To
facilitate reuse, bring them together in a single python package.

None of this is new code, it was all simply ported and re-arranged
from other projects.

Ran everything through pep8.
---
 .gitignore                    |  87 ++++++++++++++++++
 LICENSE                       | 201 =
++++++++++++++++++++++++++++++++++++++++++
 obmc/__init__.py              |   0
 obmc/dbuslib/__init__.py      |   0
 obmc/dbuslib/bindings.py      | 172 =
++++++++++++++++++++++++++++++++++++
 obmc/dbuslib/enums.py         |  29 ++++++
 obmc/dbuslib/introspection.py | 136 ++++++++++++++++++++++++++++
 obmc/enums.py                 |  17 ++++
 obmc/mapper.py                |  43 +++++++++
 obmc/utils/__init__.py        |   0
 obmc/utils/misc.py            |  63 +++++++++++++
 obmc/utils/pathtree.py        | 183 =
++++++++++++++++++++++++++++++++++++++
 setup.py                      |   5 ++
 13 files changed, 936 insertions(+)
 create mode 100644 .gitignore
 create mode 100644 LICENSE
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
+# Permission is hereby granted,  free of charge,  to any person =
obtaining a
+# copy of this software and associated documentation files (the =
"Software"),
+# to deal in the Software without restriction, including without =
limitation
+# the rights to  use, copy, modify, merge, publish, distribute, =
sublicense,
+# and/or sell copies of the Software, and to permit persons to whom the
+# Software is furnished to do so, subject to the following conditions:
+#
+# The above copyright notice and this permission notice shall be =
included in
+# all copies or substantial portions of the Software.
+#
+# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, =
EXPRESS OR
+# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF =
MERCHANTABILITY,
+# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT =
SHALL THE
+# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
+# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, =
ARISING
+# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+# DEALINGS IN THE SOFTWARE.
+
+# source: =
https://github.com/github/gitignore/blob/master/Python.gitignore
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
+#  before PyInstaller builds the exe, so as to inject date/other infos =
into it.
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
diff --git a/LICENSE b/LICENSE
new file mode 100644
index 0000000..8dada3e
--- /dev/null
+++ b/LICENSE
@@ -0,0 +1,201 @@
+                                 Apache License
+                           Version 2.0, January 2004
+                        http://www.apache.org/licenses/
+
+   TERMS AND CONDITIONS FOR USE, REPRODUCTION, AND DISTRIBUTION
+
+   1. Definitions.
+
+      "License" shall mean the terms and conditions for use, =
reproduction,
+      and distribution as defined by Sections 1 through 9 of this =
document.
+
+      "Licensor" shall mean the copyright owner or entity authorized by
+      the copyright owner that is granting the License.
+
+      "Legal Entity" shall mean the union of the acting entity and all
+      other entities that control, are controlled by, or are under =
common
+      control with that entity. For the purposes of this definition,
+      "control" means (i) the power, direct or indirect, to cause the
+      direction or management of such entity, whether by contract or
+      otherwise, or (ii) ownership of fifty percent (50%) or more of =
the
+      outstanding shares, or (iii) beneficial ownership of such entity.
+
+      "You" (or "Your") shall mean an individual or Legal Entity
+      exercising permissions granted by this License.
+
+      "Source" form shall mean the preferred form for making =
modifications,
+      including but not limited to software source code, documentation
+      source, and configuration files.
+
+      "Object" form shall mean any form resulting from mechanical
+      transformation or translation of a Source form, including but
+      not limited to compiled object code, generated documentation,
+      and conversions to other media types.
+
+      "Work" shall mean the work of authorship, whether in Source or
+      Object form, made available under the License, as indicated by a
+      copyright notice that is included in or attached to the work
+      (an example is provided in the Appendix below).
+
+      "Derivative Works" shall mean any work, whether in Source or =
Object
+      form, that is based on (or derived from) the Work and for which =
the
+      editorial revisions, annotations, elaborations, or other =
modifications
+      represent, as a whole, an original work of authorship. For the =
purposes
+      of this License, Derivative Works shall not include works that =
remain
+      separable from, or merely link (or bind by name) to the =
interfaces of,
+      the Work and Derivative Works thereof.
+
+      "Contribution" shall mean any work of authorship, including
+      the original version of the Work and any modifications or =
additions
+      to that Work or Derivative Works thereof, that is intentionally
+      submitted to Licensor for inclusion in the Work by the copyright =
owner
+      or by an individual or Legal Entity authorized to submit on =
behalf of
+      the copyright owner. For the purposes of this definition, =
"submitted"
+      means any form of electronic, verbal, or written communication =
sent
+      to the Licensor or its representatives, including but not limited =
to
+      communication on electronic mailing lists, source code control =
systems,
+      and issue tracking systems that are managed by, or on behalf of, =
the
+      Licensor for the purpose of discussing and improving the Work, =
but
+      excluding communication that is conspicuously marked or otherwise
+      designated in writing by the copyright owner as "Not a =
Contribution."
+
+      "Contributor" shall mean Licensor and any individual or Legal =
Entity
+      on behalf of whom a Contribution has been received by Licensor =
and
+      subsequently incorporated within the Work.
+
+   2. Grant of Copyright License. Subject to the terms and conditions =
of
+      this License, each Contributor hereby grants to You a perpetual,
+      worldwide, non-exclusive, no-charge, royalty-free, irrevocable
+      copyright license to reproduce, prepare Derivative Works of,
+      publicly display, publicly perform, sublicense, and distribute =
the
+      Work and such Derivative Works in Source or Object form.
+
+   3. Grant of Patent License. Subject to the terms and conditions of
+      this License, each Contributor hereby grants to You a perpetual,
+      worldwide, non-exclusive, no-charge, royalty-free, irrevocable
+      (except as stated in this section) patent license to make, have =
made,
+      use, offer to sell, sell, import, and otherwise transfer the =
Work,
+      where such license applies only to those patent claims licensable
+      by such Contributor that are necessarily infringed by their
+      Contribution(s) alone or by combination of their Contribution(s)
+      with the Work to which such Contribution(s) was submitted. If You
+      institute patent litigation against any entity (including a
+      cross-claim or counterclaim in a lawsuit) alleging that the Work
+      or a Contribution incorporated within the Work constitutes direct
+      or contributory patent infringement, then any patent licenses
+      granted to You under this License for that Work shall terminate
+      as of the date such litigation is filed.
+
+   4. Redistribution. You may reproduce and distribute copies of the
+      Work or Derivative Works thereof in any medium, with or without
+      modifications, and in Source or Object form, provided that You
+      meet the following conditions:
+
+      (a) You must give any other recipients of the Work or
+          Derivative Works a copy of this License; and
+
+      (b) You must cause any modified files to carry prominent notices
+          stating that You changed the files; and
+
+      (c) You must retain, in the Source form of any Derivative Works
+          that You distribute, all copyright, patent, trademark, and
+          attribution notices from the Source form of the Work,
+          excluding those notices that do not pertain to any part of
+          the Derivative Works; and
+
+      (d) If the Work includes a "NOTICE" text file as part of its
+          distribution, then any Derivative Works that You distribute =
must
+          include a readable copy of the attribution notices contained
+          within such NOTICE file, excluding those notices that do not
+          pertain to any part of the Derivative Works, in at least one
+          of the following places: within a NOTICE text file =
distributed
+          as part of the Derivative Works; within the Source form or
+          documentation, if provided along with the Derivative Works; =
or,
+          within a display generated by the Derivative Works, if and
+          wherever such third-party notices normally appear. The =
contents
+          of the NOTICE file are for informational purposes only and
+          do not modify the License. You may add Your own attribution
+          notices within Derivative Works that You distribute, =
alongside
+          or as an addendum to the NOTICE text from the Work, provided
+          that such additional attribution notices cannot be construed
+          as modifying the License.
+
+      You may add Your own copyright statement to Your modifications =
and
+      may provide additional or different license terms and conditions
+      for use, reproduction, or distribution of Your modifications, or
+      for any such Derivative Works as a whole, provided Your use,
+      reproduction, and distribution of the Work otherwise complies =
with
+      the conditions stated in this License.
+
+   5. Submission of Contributions. Unless You explicitly state =
otherwise,
+      any Contribution intentionally submitted for inclusion in the =
Work
+      by You to the Licensor shall be under the terms and conditions of
+      this License, without any additional terms or conditions.
+      Notwithstanding the above, nothing herein shall supersede or =
modify
+      the terms of any separate license agreement you may have executed
+      with Licensor regarding such Contributions.
+
+   6. Trademarks. This License does not grant permission to use the =
trade
+      names, trademarks, service marks, or product names of the =
Licensor,
+      except as required for reasonable and customary use in describing =
the
+      origin of the Work and reproducing the content of the NOTICE =
file.
+
+   7. Disclaimer of Warranty. Unless required by applicable law or
+      agreed to in writing, Licensor provides the Work (and each
+      Contributor provides its Contributions) on an "AS IS" BASIS,
+      WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
+      implied, including, without limitation, any warranties or =
conditions
+      of TITLE, NON-INFRINGEMENT, MERCHANTABILITY, or FITNESS FOR A
+      PARTICULAR PURPOSE. You are solely responsible for determining =
the
+      appropriateness of using or redistributing the Work and assume =
any
+      risks associated with Your exercise of permissions under this =
License.
+
+   8. Limitation of Liability. In no event and under no legal theory,
+      whether in tort (including negligence), contract, or otherwise,
+      unless required by applicable law (such as deliberate and grossly
+      negligent acts) or agreed to in writing, shall any Contributor be
+      liable to You for damages, including any direct, indirect, =
special,
+      incidental, or consequential damages of any character arising as =
a
+      result of this License or out of the use or inability to use the
+      Work (including but not limited to damages for loss of goodwill,
+      work stoppage, computer failure or malfunction, or any and all
+      other commercial damages or losses), even if such Contributor
+      has been advised of the possibility of such damages.
+
+   9. Accepting Warranty or Additional Liability. While redistributing
+      the Work or Derivative Works thereof, You may choose to offer,
+      and charge a fee for, acceptance of support, warranty, indemnity,
+      or other liability obligations and/or rights consistent with this
+      License. However, in accepting such obligations, You may act only
+      on Your own behalf and on Your sole responsibility, not on behalf
+      of any other Contributor, and only if You agree to indemnify,
+      defend, and hold each Contributor harmless for any liability
+      incurred by, or claims asserted against, such Contributor by =
reason
+      of your accepting any such warranty or additional liability.
+
+   END OF TERMS AND CONDITIONS
+
+   APPENDIX: How to apply the Apache License to your work.
+
+      To apply the Apache License to your work, attach the following
+      boilerplate notice, with the fields enclosed by brackets "{}"
+      replaced with your own identifying information. (Don't include
+      the brackets!)  The text should be enclosed in the appropriate
+      comment syntax for the file format. We also recommend that a
+      file or class name and description of purpose be included on the
+      same "printed page" as the copyright notice for easier
+      identification within third-party archives.
+
+   Copyright {yyyy} {name of copyright owner}
+
+   Licensed under the Apache License, Version 2.0 (the "License");
+   you may not use this file except in compliance with the License.
+   You may obtain a copy of the License at
+
+       http://www.apache.org/licenses/LICENSE-2.0
+
+   Unless required by applicable law or agreed to in writing, software
+   distributed under the License is distributed on an "AS IS" BASIS,
+   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or =
implied.
+   See the License for the specific language governing permissions and
+   limitations under the License.
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
+BUS_PREFIX =3D 'org.openbmc'
+OBJ_PREFIX =3D "/org/openbmc"
+BUS =3D "system"
+
+
+def is_unique(connection):
+    return connection[0] =3D=3D ':'
+
+
+def get_system_name():
+    #use filename as system name, strip off path and ext
+    parts =3D __file__.replace('.pyc', '').replace('.py', =
'').split('/')
+    return parts[len(parts)-1]
+
+
+def get_dbus():
+    bus =3D None
+    if (BUS =3D=3D "session"):
+        bus =3D dbus.SessionBus()
+    else:
+        bus =3D dbus.SystemBus()
+    return bus
+
+
+class DbusProperties(dbus.service.Object):
+    def __init__(self):
+        dbus.service.Object.__init__(self)
+        self.properties =3D {}
+        self.object_path =3D ""
+
+    @dbus.service.method(
+        dbus.PROPERTIES_IFACE,
+        in_signature=3D'ss', out_signature=3D'v')
+    def Get(self, interface_name, property_name):
+        d =3D self.GetAll(interface_name)
+        try:
+            v =3D d[property_name]
+            return v
+        except:
+            raise dbus.exceptions.DBusException(
+                "org.freedesktop.UnknownProperty: "+property_name)
+
+    @dbus.service.method(
+        dbus.PROPERTIES_IFACE,
+        in_signature=3D's', out_signature=3D'a{sv}')
+    def GetAll(self, interface_name):
+        try:
+            d =3D self.properties[interface_name]
+            return d
+        except:
+            raise dbus.exceptions.DBusException(
+                "org.freedesktop.UnknownInterface: "+interface_name)
+
+    @dbus.service.method(
+        dbus.PROPERTIES_IFACE,
+        in_signature=3D'ssv')
+    def Set(self, interface_name, property_name, new_value):
+        if (interface_name not in self.properties):
+            self.properties[interface_name] =3D {}
+        try:
+            old_value =3D =
self.properties[interface_name][property_name]
+            if (old_value !=3D new_value):
+                self.properties[interface_name][property_name] =3D =
new_value
+                self.PropertiesChanged(
+                    interface_name, {property_name: new_value}, [])
+
+        except:
+            self.properties[interface_name][property_name] =3D =
new_value
+            self.PropertiesChanged(
+                interface_name, {property_name: new_value}, [])
+
+    @dbus.service.method(
+        "org.openbmc.Object.Properties", in_signature=3D'sa{sv}')
+    def SetMultiple(self, interface_name, prop_dict):
+        if (interface_name in self.properties):
+            self.properties[interface_name] =3D {}
+
+        value_changed =3D False
+        for property_name in prop_dict:
+            new_value =3D prop_dict[property_name]
+            try:
+                old_value =3D =
self.properties[interface_name][property_name]
+                if (old_value !=3D new_value):
+                    self.properties[interface_name][property_name] =3D =
new_value
+                    value_changed =3D True
+
+            except:
+                self.properties[interface_name][property_name] =3D =
new_value
+                value_changed =3D True
+        if (value_changed is True):
+            self.PropertiesChanged(interface_name, prop_dict, [])
+
+    @dbus.service.signal(
+        dbus.PROPERTIES_IFACE, signature=3D'sa{sv}as')
+    def PropertiesChanged(
+            self, interface_name, changed_properties, =
invalidated_properties):
+        pass
+
+
+class DbusObjectManager(dbus.service.Object):
+    def __init__(self):
+        dbus.service.Object.__init__(self)
+        self.objects =3D {}
+
+    def add(self, object_path, obj):
+        self.objects[object_path] =3D obj
+        self.InterfacesAdded(object_path, obj.properties)
+
+    def remove(self, object_path):
+        obj =3D self.objects.pop(object_path, None)
+        obj.remove_from_connection()
+        self.InterfacesRemoved(object_path, obj.properties.keys())
+
+    def get(self, object_path, default=3DNone):
+        return self.objects.get(object_path, default)
+
+    @dbus.service.method(
+        "org.freedesktop.DBus.ObjectManager",
+        in_signature=3D'', out_signature=3D'a{oa{sa{sv}}}')
+    def GetManagedObjects(self):
+        data =3D {}
+        for objpath in self.objects.keys():
+            data[objpath] =3D self.objects[objpath].properties
+        return data
+
+    @dbus.service.signal(
+        "org.freedesktop.DBus.ObjectManager", signature=3D'oa{sa{sv}}')
+    def InterfacesAdded(self, object_path, properties):
+        self.ObjectAdded(object_path, "")
+
+    @dbus.service.signal(
+        "org.freedesktop.DBus.ObjectManager", signature=3D'oas')
+    def InterfacesRemoved(self, object_path, interfaces):
+        pass
+
+    ## Legacy support, need to eventually refactor out
+    @dbus.service.signal(
+        "org.openbmc.Object.ObjectMapper", signature=3D'ss')
+    def ObjectAdded(self, object_path, interface_name):
+        pass
+
+    ## flattens interfaces
+    @dbus.service.method(
+        'org.openbmc.Object.Enumerate', in_signature=3D'',
+        out_signature=3D'a{sa{sv}}')
+    def enumerate(self):
+        data =3D {}
+        for objpath in self.objects.keys():
+            props =3D self.objects[objpath].properties
+            data[objpath] =3D {}
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
+DBUS_OBJMGR_IFACE =3D dbus.BUS_DAEMON_IFACE + '.ObjectManager'
+DBUS_UNKNOWN_INTERFACE =3D 'org.freedesktop.UnknownInterface'
+DBUS_UNKNOWN_PROPERTY =3D 'org.freedesktop.DBus.Error.UnknownProperty'
+DBUS_UNKNOWN_METHOD =3D 'org.freedesktop.DBus.Error.UnknownMethod'
+DBUS_INVALID_ARGS =3D 'org.freedesktop.DBus.Error.InvalidArgs'
+DBUS_TYPE_ERROR =3D 'org.freedesktop.DBus.Python.TypeError'
+OBMC_ASSOCIATIONS_IFACE =3D 'org.openbmc.Associations'
+OBMC_ASSOC_IFACE =3D 'org.openbmc.Association'
+OBMC_DELETE_IFACE =3D 'org.openbmc.Object.Delete'
+OBMC_PROPERTIES_IFACE =3D "org.openbmc.Object.Properties"
+OBMC_ENUMERATE_IFACE =3D "org.openbmc.Object.Enumerate"
diff --git a/obmc/dbuslib/introspection.py =
b/obmc/dbuslib/introspection.py
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
+    def __init__(self, data, tag_match=3Dbool, intf_match=3Dbool):
+        self.data =3D data
+        self.cache =3D {}
+        self.tag_match =3D tag_match
+        self.intf_match =3D intf_match
+
+    def parse_args(self):
+        return [x.attrib for x in self.data.findall('arg')]
+
+    def parse_children(self):
+        return [x.attrib['name'] for x in self.data.findall('node')]
+
+    def parse_method_or_signal(self):
+        name =3D self.data.attrib['name']
+        return name, self.parse_args()
+
+    def parse_interface(self):
+        iface =3D {}
+        iface['method'] =3D {}
+        iface['signal'] =3D {}
+
+        for node in self.data:
+            if node.tag not in ['method', 'signal']:
+                continue
+            if not self.tag_match(node.tag):
+                continue
+            p =3D IntrospectionNodeParser(
+                node, self.tag_match, self.intf_match)
+            n, element =3D p.parse_method_or_signal()
+            iface[node.tag][n] =3D element
+
+        return iface
+
+    def parse_node(self):
+        if self.cache:
+            return self.cache
+
+        self.cache['interfaces'] =3D {}
+        self.cache['children'] =3D []
+
+        for node in self.data:
+            if node.tag =3D=3D 'interface':
+                p =3D IntrospectionNodeParser(
+                    node, self.tag_match, self.intf_match)
+                name =3D p.data.attrib['name']
+                if not self.intf_match(name):
+                    continue
+                self.cache['interfaces'][name] =3D p.parse_interface()
+            elif node.tag =3D=3D 'node':
+                self.cache['children'] =3D self.parse_children()
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
+    def __init__(self, name, bus, tag_match=3Dbool, intf_match=3Dbool):
+        self.name =3D name
+        self.bus =3D bus
+        self.tag_match =3D tag_match
+        self.intf_match =3D intf_match
+
+    def _introspect(self, path):
+        try:
+            obj =3D self.bus.get_object(self.name, path, =
introspect=3DFalse)
+            iface =3D dbus.Interface(obj, dbus.INTROSPECTABLE_IFACE)
+            data =3D iface.Introspect()
+        except dbus.DBusException:
+            return None
+
+        return IntrospectionNodeParser(
+            ElementTree.fromstring(data),
+            self.tag_match,
+            self.intf_match)
+
+    def _discover_flat(self, path, parser):
+        items =3D {}
+        interfaces =3D parser.get_interfaces().keys()
+        if interfaces:
+            items[path] =3D {}
+            items[path]['interfaces'] =3D interfaces
+
+        return items
+
+    def introspect(self, path=3D'/', parser=3DNone):
+        items =3D {}
+        if not parser:
+            parser =3D self._introspect(path)
+        if not parser:
+            return {}
+        items.update(self._discover_flat(path, parser))
+
+        if path !=3D '/':
+            path +=3D '/'
+
+        if parser.recursive_binding():
+            callback =3D self._discover_flat
+        else:
+            callback =3D self.introspect
+
+        for k in parser.get_children():
+            parser =3D self._introspect(path + k)
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
+GPIO_DEV =3D '/sys/class/gpio'
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
+MAPPER_NAME =3D 'org.openbmc.objectmapper'
+MAPPER_IFACE =3D MAPPER_NAME + '.ObjectMapper'
+MAPPER_PATH =3D '/org/openbmc/objectmapper/objectmapper'
+ENUMERATE_IFACE =3D 'org.openbmc.Object.Enumerate'
+MAPPER_NOT_FOUND =3D 'org.openbmc.objectmapper.Error.NotFound'
+
+
+class Mapper:
+    def __init__(self, bus):
+        self.bus =3D bus
+        obj =3D bus.get_object(MAPPER_NAME, MAPPER_PATH, =
introspect=3DFalse)
+        self.iface =3D dbus.Interface(
+            obj, dbus_interface=3DMAPPER_IFACE)
+
+    def get_object(self, path):
+        return self.iface.GetObject(path)
+
+    def get_subtree_paths(self, path=3D'/', depth=3D0):
+        return self.iface.GetSubTreePaths(path, depth)
+
+    def get_subtree(self, path=3D'/', depth=3D0):
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
+        self.parts =3D filter(bool, path.split('/'))
+
+    def rel(self, first=3DNone, last=3DNone):
+        # relative
+        return self.get('', first, last)
+
+    def fq(self, first=3DNone, last=3DNone):
+        # fully qualified
+        return self.get('/', first, last)
+
+    def depth(self):
+        return len(self.parts)
+
+    def get(self, prefix=3D'/', first=3DNone, last=3DNone):
+        if not first:
+            first =3D 0
+        if not last:
+            last =3D self.depth()
+        return prefix + '/'.join(self.parts[first:last])
+
+
+def org_dot_openbmc_match(name):
+    return 'org.openbmc' in name
+
+
+class ListMatch(object):
+    def __init__(self, l):
+        self.l =3D l
+
+    def __call__(self, match):
+        return match in self.l
+
+
+def find_case_insensitive(value, lst):
+    return next((x for x in lst if x.lower() =3D=3D value.lower()), =
None)
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
+        self.path_tree =3D path_tree
+        self.path =3D []
+        self.itlist =3D []
+        self.subtree =3D ['/'] + filter(bool, subtree.split('/'))
+        self.depth =3D depth
+        d =3D path_tree.root
+        for k in self.subtree:
+            try:
+                d =3D d[k]['children']
+            except KeyError:
+                raise KeyError(subtree)
+        self.it =3D d.iteritems()
+
+    def __iter__(self):
+        return self
+
+    def __next__(self):
+        return super(PathTreeItemIterator, self).next()
+
+    def next(self):
+        key, value =3D self._next()
+        path =3D self.subtree[0] + '/'.join(self.subtree[1:] + =
self.path)
+        return path, value.get('data')
+
+    def _next(self):
+        try:
+            while True:
+                x =3D self.it.next()
+                depth_exceeded =3D len(self.path) + 1 > self.depth
+                if self.depth and depth_exceeded:
+                    continue
+                self.itlist.append(self.it)
+                self.path.append(x[0])
+                self.it =3D x[1]['children'].iteritems()
+                break
+
+        except StopIteration:
+            if not self.itlist:
+                raise StopIteration
+
+            self.it =3D self.itlist.pop()
+            self.path.pop()
+            x =3D self._next()
+
+        return x
+
+
+class PathTreeKeyIterator(PathTreeItemIterator):
+    def __init__(self, path_tree, subtree, depth):
+        super(PathTreeKeyIterator, self).__init__(path_tree, subtree, =
depth)
+
+    def next(self):
+        return super(PathTreeKeyIterator, self).next()[0]
+
+
+class PathTree:
+    def __init__(self):
+        self.root =3D {}
+
+    def _try_delete_parent(self, elements):
+        if len(elements) =3D=3D 1:
+            return False
+
+        kids =3D 'children'
+        elements.pop()
+        d =3D self.root
+        for k in elements[:-1]:
+            d =3D d[k][kids]
+
+        if 'data' not in d[elements[-1]] and not d[elements[-1]][kids]:
+            del d[elements[-1]]
+            self._try_delete_parent(elements)
+
+    def _get_node(self, key):
+        kids =3D 'children'
+        elements =3D ['/'] + filter(bool, key.split('/'))
+        d =3D self.root
+        for k in elements[:-1]:
+            try:
+                d =3D d[k][kids]
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
+            if key =3D=3D x:
+                return False
+        return True
+
+    def __delitem__(self, key):
+        kids =3D 'children'
+        elements =3D ['/'] + filter(bool, key.split('/'))
+        d =3D self.root
+        for k in elements[:-1]:
+            try:
+                d =3D d[k][kids]
+            except KeyError:
+                raise KeyError(key)
+
+        del d[elements[-1]]
+        self._try_delete_parent(elements)
+
+    def __setitem__(self, key, value):
+        kids =3D 'children'
+        elements =3D ['/'] + filter(bool, key.split('/'))
+        d =3D self.root
+        for k in elements[:-1]:
+            d =3D d.setdefault(k, {kids: {}})[kids]
+
+        children =3D d.setdefault(elements[-1], {kids: {}})[kids]
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
+    def get(self, key, default=3DNone):
+        try:
+            x =3D self.__getitem__(key)
+        except KeyError:
+            x =3D default
+
+        return x
+
+    def get_children(self, key):
+        return [x for x in self._get_node(key)['children'].iterkeys()]
+
+    def demote(self, key):
+        n =3D self._get_node(key)
+        if 'data' in n:
+            del n['data']
+
+    def keys(self, subtree=3D'/', depth=3DNone):
+        return [x for x in self.iterkeys(subtree, depth)]
+
+    def values(self, subtree=3D'/', depth=3DNone):
+        return [x[1] for x in self.iteritems(subtree, depth)]
+
+    def items(self, subtree=3D'/', depth=3DNone):
+        return [x for x in self.iteritems(subtree, depth)]
+
+    def dataitems(self, subtree=3D'/', depth=3DNone):
+        return [x for x in self.iteritems(subtree, depth)
+                if x[1] is not None]
+
+    def iterkeys(self, subtree=3D'/', depth=3DNone):
+        if not self.root:
+            return {}.iterkeys()
+        return PathTreeKeyIterator(self, subtree, depth)
+
+    def iteritems(self, subtree=3D'/', depth=3DNone):
+        if not self.root:
+            return {}.iteritems()
+        return PathTreeItemIterator(self, subtree, depth)
diff --git a/setup.py b/setup.py
new file mode 100644
index 0000000..43abbed
--- /dev/null
+++ b/setup.py
@@ -0,0 +1,5 @@
+from distutils.core import setup
+setup(name=3D'pyobmc',
+      version=3D'1.0',
+      packages=3D['obmc', 'obmc.dbus', 'obmc.util'],
+      )
--=20
2.5.4 (Apple Git-61)
