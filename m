Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4457C1A0909
 for <openbmc@lists.ozlabs.org>; Sat, 14 Nov 2015 01:30:31 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 144742502426068.03542152458704;
 Fri, 13 Nov 2015 06:30:24 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH openbmc 4/5] Refactor bottle recipe
Date: Fri, 13 Nov 2015 09:30:19 -0500
Message-Id: <1447425020-2483-5-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447425020-2483-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1447425020-2483-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 13 Nov 2015 14:30:32 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

Adopting some typical conventions:
 -use python_site_packages variable
 -python recipe naming conventions
---
 .../common/recipes-devtools/python/bottle.inc      | 18 -------------
 .../common/recipes-devtools/python/bottle/LICENSE  | 19 -------------
 .../python/bottle/json-format.patch                | 31 ----------------------
 .../recipes-devtools/python/bottle_0.12.9.bb       |  4 ---
 .../recipes-devtools/python/python-bottle.inc      | 26 ++++++++++++++++++
 .../recipes-devtools/python/python-bottle/LICENSE  | 19 +++++++++++++
 .../python/python-bottle/json-format.patch         | 31 ++++++++++++++++++++++
 .../python/python-bottle_0.12.9.bb                 |  5 ++++
 8 files changed, 81 insertions(+), 72 deletions(-)
 delete mode 100644 meta-phosphor/common/recipes-devtools/python/bottle.inc
 delete mode 100644 meta-phosphor/common/recipes-devtools/python/bottle/LICENSE
 delete mode 100644 meta-phosphor/common/recipes-devtools/python/bottle/json-format.patch
 delete mode 100644 meta-phosphor/common/recipes-devtools/python/bottle_0.12.9.bb
 create mode 100644 meta-phosphor/common/recipes-devtools/python/python-bottle.inc
 create mode 100644 meta-phosphor/common/recipes-devtools/python/python-bottle/LICENSE
 create mode 100644 meta-phosphor/common/recipes-devtools/python/python-bottle/json-format.patch
 create mode 100644 meta-phosphor/common/recipes-devtools/python/python-bottle_0.12.9.bb

diff --git a/meta-phosphor/common/recipes-devtools/python/bottle.inc b/meta-phosphor/common/recipes-devtools/python/bottle.inc
deleted file mode 100644
index bfd5a48..0000000
--- a/meta-phosphor/common/recipes-devtools/python/bottle.inc
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = "Fast and simple WSGI-framework for small web-applications."
-DESCRIPTION = "Bottle is a fast and simple micro-framework for small web \
-applications. It offers request dispatching (Routes) with url parameter \
-support, templates, a built-in HTTP Server and adapters for many third \
-party WSGI/HTTP-server and template engines - all in a single file and \
-with no dependencies other than the Python Standard Library."
-HOMEPAGE = "http://bottlepy.org/"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE;md5=94b9b2cc7e46ccea87e00af8970826b5"
-
-inherit allarch
-inherit setuptools
-
-# bottle doesn't send email...it uses a utility in here to parse rfc1123 and rfc850 timestamps.
-RDEPENDS_${PN} += "python-email"
-
-BBCLASSEXTEND = "nativesdk"
diff --git a/meta-phosphor/common/recipes-devtools/python/bottle/LICENSE b/meta-phosphor/common/recipes-devtools/python/bottle/LICENSE
deleted file mode 100644
index 5f3e8de..0000000
--- a/meta-phosphor/common/recipes-devtools/python/bottle/LICENSE
+++ /dev/null
@@ -1,19 +0,0 @@
-Copyright (c) 2014, Marcel Hellkamp.
-
-Permission is hereby granted, free of charge, to any person obtaining a copy
-of this software and associated documentation files (the "Software"), to deal
-in the Software without restriction, including without limitation the rights
-to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-copies of the Software, and to permit persons to whom the Software is
-furnished to do so, subject to the following conditions:
-
-The above copyright notice and this permission notice shall be included in
-all copies or substantial portions of the Software.
-
-THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-THE SOFTWARE.
diff --git a/meta-phosphor/common/recipes-devtools/python/bottle/json-format.patch b/meta-phosphor/common/recipes-devtools/python/bottle/json-format.patch
deleted file mode 100644
index 9e754a9..0000000
--- a/meta-phosphor/common/recipes-devtools/python/bottle/json-format.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-Index: bottle-0.12.9/bottle.py
-===================================================================
---- bottle-0.12.9.orig/bottle.py
-+++ bottle-0.12.9/bottle.py
-@@ -1721,8 +1721,10 @@ class JSONPlugin(object):
-     name = 'json'
-     api  = 2
- 
--    def __init__(self, json_dumps=json_dumps):
-+    def __init__(self, json_dumps=json_dumps, **kw):
-         self.json_dumps = json_dumps
-+        self.json_kw = { x:y for x,y in kw.iteritems() \
-+                     if x in ['indent','sort_keys'] }
- 
-     def apply(self, callback, route):
-         dumps = self.json_dumps
-@@ -1735,12 +1737,12 @@ class JSONPlugin(object):
- 
-             if isinstance(rv, dict):
-                 #Attempt to serialize, raises exception on failure
--                json_response = dumps(rv)
-+                json_response = dumps(rv, **self.json_kw)
-                 #Set content type only if serialization succesful
-                 response.content_type = 'application/json'
-                 return json_response
-             elif isinstance(rv, HTTPResponse) and isinstance(rv.body, dict):
--                rv.body = dumps(rv.body)
-+                rv.body = dumps(rv.body, **self.json_kw)
-                 rv.content_type = 'application/json'
-             return rv
- 
diff --git a/meta-phosphor/common/recipes-devtools/python/bottle_0.12.9.bb b/meta-phosphor/common/recipes-devtools/python/bottle_0.12.9.bb
deleted file mode 100644
index 72925e7..0000000
--- a/meta-phosphor/common/recipes-devtools/python/bottle_0.12.9.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require bottle.inc
-SRC_URI = "https://pypi.python.org/packages/source/b/${BPN}/${BP}.tar.gz;name=tarball file://LICENSE file://json-format.patch"
-SRC_URI[tarball.sha256sum] = "fe0a24b59385596d02df7ae7845fe7d7135eea73799d03348aeb9f3771500051"
-SRC_URI[tarball.md5sum] = "f5850258a86224a791171e8ecbb66d99"
diff --git a/meta-phosphor/common/recipes-devtools/python/python-bottle.inc b/meta-phosphor/common/recipes-devtools/python/python-bottle.inc
new file mode 100644
index 0000000..d578c8b
--- /dev/null
+++ b/meta-phosphor/common/recipes-devtools/python/python-bottle.inc
@@ -0,0 +1,26 @@
+SUMMARY = "Fast and simple WSGI-framework for small web-applications."
+DESCRIPTION = "Bottle is a fast and simple micro-framework for small web \
+applications. It offers request dispatching (Routes) with url parameter \
+support, templates, a built-in HTTP Server and adapters for many third \
+party WSGI/HTTP-server and template engines - all in a single file and \
+with no dependencies other than the Python Standard Library."
+HOMEPAGE = "http://bottlepy.org/"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE;md5=94b9b2cc7e46ccea87e00af8970826b5"
+
+inherit allarch
+inherit setuptools
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+# bottle doesn't send email...it uses a utility in here to parse rfc1123 and rfc850 timestamps.
+RDEPENDS_${PN} += "python-email-utils-standalone"
+
+PROVIDES += "${PN}-app"
+PACKAGES += "${PN}-app"
+
+SUMMARY_${PN}-app = "${SRCNAME} app"
+RDEPENDS_${PN}-app = "${PN}"
+FILES_${PN}-app = "${bindir}/bottle.py"
+
+BBCLASSEXTEND = "nativesdk"
diff --git a/meta-phosphor/common/recipes-devtools/python/python-bottle/LICENSE b/meta-phosphor/common/recipes-devtools/python/python-bottle/LICENSE
new file mode 100644
index 0000000..5f3e8de
--- /dev/null
+++ b/meta-phosphor/common/recipes-devtools/python/python-bottle/LICENSE
@@ -0,0 +1,19 @@
+Copyright (c) 2014, Marcel Hellkamp.
+
+Permission is hereby granted, free of charge, to any person obtaining a copy
+of this software and associated documentation files (the "Software"), to deal
+in the Software without restriction, including without limitation the rights
+to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+copies of the Software, and to permit persons to whom the Software is
+furnished to do so, subject to the following conditions:
+
+The above copyright notice and this permission notice shall be included in
+all copies or substantial portions of the Software.
+
+THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+THE SOFTWARE.
diff --git a/meta-phosphor/common/recipes-devtools/python/python-bottle/json-format.patch b/meta-phosphor/common/recipes-devtools/python/python-bottle/json-format.patch
new file mode 100644
index 0000000..9e754a9
--- /dev/null
+++ b/meta-phosphor/common/recipes-devtools/python/python-bottle/json-format.patch
@@ -0,0 +1,31 @@
+Index: bottle-0.12.9/bottle.py
+===================================================================
+--- bottle-0.12.9.orig/bottle.py
++++ bottle-0.12.9/bottle.py
+@@ -1721,8 +1721,10 @@ class JSONPlugin(object):
+     name = 'json'
+     api  = 2
+ 
+-    def __init__(self, json_dumps=json_dumps):
++    def __init__(self, json_dumps=json_dumps, **kw):
+         self.json_dumps = json_dumps
++        self.json_kw = { x:y for x,y in kw.iteritems() \
++                     if x in ['indent','sort_keys'] }
+ 
+     def apply(self, callback, route):
+         dumps = self.json_dumps
+@@ -1735,12 +1737,12 @@ class JSONPlugin(object):
+ 
+             if isinstance(rv, dict):
+                 #Attempt to serialize, raises exception on failure
+-                json_response = dumps(rv)
++                json_response = dumps(rv, **self.json_kw)
+                 #Set content type only if serialization succesful
+                 response.content_type = 'application/json'
+                 return json_response
+             elif isinstance(rv, HTTPResponse) and isinstance(rv.body, dict):
+-                rv.body = dumps(rv.body)
++                rv.body = dumps(rv.body, **self.json_kw)
+                 rv.content_type = 'application/json'
+             return rv
+ 
diff --git a/meta-phosphor/common/recipes-devtools/python/python-bottle_0.12.9.bb b/meta-phosphor/common/recipes-devtools/python/python-bottle_0.12.9.bb
new file mode 100644
index 0000000..4c62045
--- /dev/null
+++ b/meta-phosphor/common/recipes-devtools/python/python-bottle_0.12.9.bb
@@ -0,0 +1,5 @@
+SRCNAME = "bottle"
+SRC_URI = "https://pypi.python.org/packages/source/b/${SRCNAME}/${SRCNAME}-${PV}.tar.gz;name=tarball file://LICENSE file://json-format.patch"
+SRC_URI[tarball.sha256sum] = "fe0a24b59385596d02df7ae7845fe7d7135eea73799d03348aeb9f3771500051"
+SRC_URI[tarball.md5sum] = "f5850258a86224a791171e8ecbb66d99"
+require python-bottle.inc
-- 
2.6.3
