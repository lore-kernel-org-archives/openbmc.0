Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qpYKR24cyzDq9q
 for <openbmc@lists.ozlabs.org>; Tue, 19 Apr 2016 02:20:43 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1460996437795417.42266095066896;
 Mon, 18 Apr 2016 09:20:37 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <radsquirrel@gmail.com>
Subject: [PATCH openpower-inventory-upload] Introducing inventory upload
Date: Mon, 18 Apr 2016 11:20:35 -0500
Message-Id: <1460996435-29671-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1460996435-29671-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1460996435-29671-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 18 Apr 2016 16:20:44 -0000

From: Brad Bishop <radsquirrel@gmail.com>

This script collects the BMC inventory, encodes it in DTB format
and writes it to BIOS flash for consumption by the host firmware.
---
 .gitignore          | 62 +++++++++++++++++++++++++++++++++++++++
 inventory_upload.py | 84 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 setup.cfg           |  2 ++
 setup.py            |  6 ++++
 4 files changed, 154 insertions(+)
 create mode 100644 .gitignore
 create mode 100644 inventory_upload.py
 create mode 100644 setup.cfg
 create mode 100644 setup.py

diff --git a/.gitignore b/.gitignore
new file mode 100644
index 0000000..1dbc687
--- /dev/null
+++ b/.gitignore
@@ -0,0 +1,62 @@
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
diff --git a/inventory_upload.py b/inventory_upload.py
new file mode 100644
index 0000000..c5b89be
--- /dev/null
+++ b/inventory_upload.py
@@ -0,0 +1,84 @@
+#!/usr/bin/env python
+
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
+import obmc.mapper
+import obmc.utils.dtree
+import obmc.utils.pathtree
+import dbus
+import os
+import subprocess
+import tempfile
+
+
+def transform(path, o):
+    if not o:
+        # discard empty path elements
+        # and empty objects
+        return None
+
+    for name, value in o.items():
+        # discard empty properties
+        if value == "":
+            del o[name]
+
+    path_elements = filter(bool, path.split('/'))
+    path = "/%s" % '/'.join(path_elements[4:-1])
+    # inject the location property
+    o['location'] = "Physical:%s" % path
+
+    # flatten the tree into a single 'bmc' node
+    path = "/%s" % '/'.join(['bmc', path_elements[-1]])
+    return path, o
+
+
+if __name__ == '__main__':
+    bus = dbus.SystemBus()
+    objs = obmc.utils.pathtree.PathTree()
+
+    mapper = obmc.mapper.Mapper(bus)
+    for path, props in \
+            mapper.enumerate_subtree(
+                path='/org/openbmc/inventory/system').iteritems():
+        item = transform(path, props)
+        if item:
+            objs[item[0]] = item[1]
+
+    rpipe, wpipe = os.pipe()
+    rpipe = os.fdopen(rpipe, 'r')
+    wpipe = os.fdopen(wpipe, 'a')
+
+    wpipe.write('/dts-v1/;')
+    obmc.utils.dtree.dts_encode(objs.dumpd(), wpipe)
+    wpipe.close()
+    h, tmpfile = tempfile.mkstemp()
+    try:
+        wfile = os.fdopen(h, 'w')
+        subprocess.call(
+            ['dtc', '-O', 'dtb'],
+            stdin=rpipe,
+            stdout=wfile)
+        rpipe.close()
+        wfile.close()
+
+        print "Uploading inventory to PNOR in dtb format..."
+        subprocess.call(['pflash', '-f', '-e', '-p', tmpfile, '-P', 'BMC_INV'])
+    except:
+        os.remove(tmpfile)
+        raise
+
+    os.remove(tmpfile)
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
index 0000000..43bfb0b
--- /dev/null
+++ b/setup.py
@@ -0,0 +1,6 @@
+from distutils.core import setup
+
+setup(name='inventory_upload',
+      version='1.0',
+      scripts=['inventory_upload.py'],
+      )
-- 
2.7.1
