Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 63ABB1A001D
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2015 04:40:03 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446140397685766.9616825766884;
 Thu, 29 Oct 2015 10:39:57 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH rest-dbus 2/3] Add setuptools install script
Date: Thu, 29 Oct 2015 12:39:36 -0500
Message-Id: <1446140377-7626-3-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1446140377-7626-1-git-send-email-patches@stwcx.xyz>
References: <1446140377-7626-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 29 Oct 2015 17:40:03 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

Tweaked resources path discovery.
---
 rest-dbus | 4 +++-
 setup.cfg | 2 ++
 setup.py  | 9 +++++++++
 3 files changed, 14 insertions(+), 1 deletion(-)
 mode change 100755 => 100644 rest-dbus
 create mode 100644 setup.cfg
 create mode 100644 setup.py

diff --git a/rest-dbus b/rest-dbus
old mode 100755
new mode 100644
index ffaa0ed..34fcb65
--- a/rest-dbus
+++ b/rest-dbus
@@ -5,6 +5,7 @@ import BaseHTTPServer
 import SocketServer
 import json
 import os
+import sys
 from xml.etree import ElementTree
 
 busses = {
@@ -39,7 +40,8 @@ class DBusRestResourceResponse(DBusRestResponse):
         'png': 'image/png',
         'gif': 'image/gif',
     }
-    resource_base = 'resources'
+    resource_base = os.path.join(sys.prefix, 'share',
+		    os.path.basename(__file__), 'resources')
 
     def __init__(self, name):
         (_, ext) = os.path.splitext(name)
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
index 0000000..33d8567
--- /dev/null
+++ b/setup.py
@@ -0,0 +1,9 @@
+from distutils.core import setup
+from os import listdir
+
+resources = [ 'resources/%s' %(x) for x in listdir('resources') ]
+setup(name='rest-dbus',
+      version='1.0',
+      scripts=['rest-dbus'],
+      data_files=[('rest-dbus/resources', resources)],
+      )
-- 
2.6.0
