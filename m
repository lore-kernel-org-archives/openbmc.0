Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 383531A0908
 for <openbmc@lists.ozlabs.org>; Sat, 14 Nov 2015 01:30:31 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447425023383221.89603159723674;
 Fri, 13 Nov 2015 06:30:23 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH openbmc 3/5] Add python-rocket recipe
Date: Fri, 13 Nov 2015 09:30:18 -0500
Message-Id: <1447425020-2483-4-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447425020-2483-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1447425020-2483-1-git-send-email-openbmc-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Rocket is an minimal wsgi http server.
---
 .../recipes-devtools/python/python-rocket.inc      | 23 ++++++++++++++++++++++
 .../recipes-devtools/python/python-rocket/LICENSE  | 21 ++++++++++++++++++++
 .../python/python-rocket/setup.patch               | 13 ++++++++++++
 .../recipes-devtools/python/python-rocket_1.2.4.bb |  5 +++++
 4 files changed, 62 insertions(+)
 create mode 100644 meta-phosphor/common/recipes-devtools/python/python-rocket.inc
 create mode 100644 meta-phosphor/common/recipes-devtools/python/python-rocket/LICENSE
 create mode 100644 meta-phosphor/common/recipes-devtools/python/python-rocket/setup.patch
 create mode 100644 meta-phosphor/common/recipes-devtools/python/python-rocket_1.2.4.bb

diff --git a/meta-phosphor/common/recipes-devtools/python/python-rocket.inc b/meta-phosphor/common/recipes-devtools/python/python-rocket.inc
new file mode 100644
index 0000000..b2e6d31
--- /dev/null
+++ b/meta-phosphor/common/recipes-devtools/python/python-rocket.inc
@@ -0,0 +1,23 @@
+SUMMARY = "Modern, multi-threaded and extensible web server."
+DESCRIPTION = "The Rocket web server is a server designed to handle the increased \
+needs of modern web applications implemented in pure Python. It can serve WSGI \
+applications and static files. Rocket has the ability to be extended to handle \
+different types of networked request-response jobs. Rocket runs on cPython 2.5- 3.x \
+and Jython 2.5 (without the need to run through the 2to3 translation tool). Rocket \
+is similar in purpose to Cherrypy’s Wsgiserver but with added flexibility and concurrency."
+HOMEPAGE = "http://launchpad.net/rocket"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE;md5=b364bdf3116b1cbc1e30a6aff3224019"
+
+inherit allarch
+inherit setuptools
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+RDEPENDS_${PN} += "\
+        python-wsgiref-standalone-util \
+        python-wsgiref-standalone-headers \
+        python-email-utils-standalone \
+	"
+
+BBCLASSEXTEND = "nativesdk"
diff --git a/meta-phosphor/common/recipes-devtools/python/python-rocket/LICENSE b/meta-phosphor/common/recipes-devtools/python/python-rocket/LICENSE
new file mode 100644
index 0000000..29b8ae9
--- /dev/null
+++ b/meta-phosphor/common/recipes-devtools/python/python-rocket/LICENSE
@@ -0,0 +1,21 @@
+The MIT License
+
+Copyright (c) 2011 Timothy Farrell
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
diff --git a/meta-phosphor/common/recipes-devtools/python/python-rocket/setup.patch b/meta-phosphor/common/recipes-devtools/python/python-rocket/setup.patch
new file mode 100644
index 0000000..7affb2f
--- /dev/null
+++ b/meta-phosphor/common/recipes-devtools/python/python-rocket/setup.patch
@@ -0,0 +1,13 @@
+Index: Rocket-1.2.4/setup.py
+===================================================================
+--- Rocket-1.2.4.orig/setup.py
++++ Rocket-1.2.4/setup.py
+@@ -4,8 +4,6 @@
+ # This file is part of the Rocket Web Server
+ # Copyright (c) 2009 Timothy Farrell
+ 
+-from distribute_setup import use_setuptools
+-use_setuptools()
+ from setuptools import setup, find_packages
+ 
+ import os
diff --git a/meta-phosphor/common/recipes-devtools/python/python-rocket_1.2.4.bb b/meta-phosphor/common/recipes-devtools/python/python-rocket_1.2.4.bb
new file mode 100644
index 0000000..8d8008a
--- /dev/null
+++ b/meta-phosphor/common/recipes-devtools/python/python-rocket_1.2.4.bb
@@ -0,0 +1,5 @@
+SRCNAME = "Rocket"
+SRC_URI = "https://pypi.python.org/packages/source/r/rocket/${SRCNAME}-${PV}.zip;name=tarball file://LICENSE file://setup.patch"
+SRC_URI[tarball.sha256sum] = "7b7a3df4d9257e369d85bcc2013351704ffe364ff45d4710e6a30b2efc63a731"
+SRC_URI[tarball.md5sum] = "fa611955154b486bb91e632a43e90f4b"
+require python-rocket.inc
-- 
2.6.3
