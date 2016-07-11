Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rnsMn3Q36zDqwr
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jul 2016 14:20:37 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1468210833419162.8474188197273;
 Sun, 10 Jul 2016 21:20:33 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openbmc 1/2] Remove second bus from pydbus example
Date: Sun, 10 Jul 2016 23:20:30 -0500
Message-Id: <20160711042031.5026-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160711042031.5026-1-openbmc-patches@stwcx.xyz>
References: <20160711042031.5026-1-openbmc-patches@stwcx.xyz>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Jul 2016 04:20:38 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

There probably aren't any use cases for this and it is
harder to support.
Remove to make things slightly less confusing.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 .../files/obmc-phosphor-example-pydbus.py                         | 3 +--
 ...ythonService0.conf => org.openbmc.examples.PythonService.conf} | 4 ++--
 ...-pydbus.service => org.openbmc.examples.PythonService.service} | 0
 .../files/org.openbmc.examples.PythonService1.conf                | 8 --------
 .../obmc-phosphor-example-pydbus/files/pyclient-sample.py         | 4 ++--
 .../obmc-phosphor-example-pydbus/obmc-phosphor-example-pydbus.bb  | 3 +--
 6 files changed, 6 insertions(+), 16 deletions(-)
 rename meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-pydbus/files/{org.openbmc.examples.PythonService0.conf => org.openbmc.examples.PythonService.conf} (62%)
 rename meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-pydbus/files/{obmc-phosphor-example-pydbus.service => org.openbmc.examples.PythonService.service} (100%)
 delete mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-pydbus/files/org.openbmc.examples.PythonService1.conf

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-pydbus/files/obmc-phosphor-example-pydbus.py b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-pydbus/files/obmc-phosphor-example-pydbus.py
index 2b59b58..1f4ce90 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-pydbus/files/obmc-phosphor-example-pydbus.py
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-pydbus/files/obmc-phosphor-example-pydbus.py
@@ -86,8 +86,7 @@ if __name__ == '__main__':
 	bus = dbus.SystemBus()
 
 	services = []
-	services.append(dbus.service.BusName(SERVICE_PREFIX + '.PythonService0', bus))
-	services.append(dbus.service.BusName(SERVICE_PREFIX + '.PythonService1', bus))
+	services.append(dbus.service.BusName(SERVICE_PREFIX + '.PythonService', bus))
 
 	objs = []
 	objs.append(SampleObjectOne(bus, BASE_OBJ_PATH + 'path0/PythonObj'))
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-pydbus/files/org.openbmc.examples.PythonService0.conf b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-pydbus/files/org.openbmc.examples.PythonService.conf
similarity index 62%
rename from meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-pydbus/files/org.openbmc.examples.PythonService0.conf
rename to meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-pydbus/files/org.openbmc.examples.PythonService.conf
index fad0b81..6c4a713 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-pydbus/files/org.openbmc.examples.PythonService0.conf
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-pydbus/files/org.openbmc.examples.PythonService.conf
@@ -2,7 +2,7 @@
  "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
 <busconfig>
   <policy user="root">
-    <allow own="org.openbmc.examples.PythonService0"/>
-    <allow send_destination="org.openbmc.examples.PythonService0"/>
+    <allow own="org.openbmc.examples.PythonService"/>
+    <allow send_destination="org.openbmc.examples.PythonService"/>
   </policy>
 </busconfig>
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-pydbus/files/obmc-phosphor-example-pydbus.service b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-pydbus/files/org.openbmc.examples.PythonService.service
similarity index 100%
rename from meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-pydbus/files/obmc-phosphor-example-pydbus.service
rename to meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-pydbus/files/org.openbmc.examples.PythonService.service
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-pydbus/files/org.openbmc.examples.PythonService1.conf b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-pydbus/files/org.openbmc.examples.PythonService1.conf
deleted file mode 100644
index 0f7114e..0000000
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-pydbus/files/org.openbmc.examples.PythonService1.conf
+++ /dev/null
@@ -1,8 +0,0 @@
-<!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-BUS Bus Configuration 1.0//EN"
- "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
-<busconfig>
-  <policy user="root">
-    <allow own="org.openbmc.examples.PythonService1"/>
-    <allow send_destination="org.openbmc.examples.PythonService1"/>
-  </policy>
-</busconfig>
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-pydbus/files/pyclient-sample.py b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-pydbus/files/pyclient-sample.py
index e1010a5..138865d 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-pydbus/files/pyclient-sample.py
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-pydbus/files/pyclient-sample.py
@@ -36,9 +36,9 @@ if __name__ == '__main__':
 
 	bus = dbus.SystemBus()
 
-	obj0 = bus.get_object(SERVICE_PREFIX + '.PythonService0',
+	obj0 = bus.get_object(SERVICE_PREFIX + '.PythonService',
 		                      BASE_OBJ_PATH + 'path0/PythonObj')
-	obj1 = bus.get_object(SERVICE_PREFIX + '.PythonService1',
+	obj1 = bus.get_object(SERVICE_PREFIX + '.PythonService',
 		                      BASE_OBJ_PATH + 'path1/PythonObj')
 	echo0= dbus.Interface(obj0,
 		    dbus_interface=IFACE_PREFIX + '.Echo')
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-pydbus/obmc-phosphor-example-pydbus.bb b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-pydbus/obmc-phosphor-example-pydbus.bb
index 1446a73..57e27cf 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-pydbus/obmc-phosphor-example-pydbus.bb
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-pydbus/obmc-phosphor-example-pydbus.bb
@@ -3,8 +3,7 @@ DESCRIPTION = "Phosphor OpenBMC QEMU BSP example implementation."
 PR = "r1"
 
 DBUS_SERVICES = " \
-        org.openbmc.examples.PythonService0 \
-        org.openbmc.examples.PythonService1 \
+        org.openbmc.examples.PythonService \
         "
 
 inherit obmc-phosphor-pydbus-service
-- 
2.9.0
