Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rNgSM6n05zDq5f
 for <openbmc@lists.ozlabs.org>; Tue,  7 Jun 2016 02:41:07 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465231260289222.346777134248;
 Mon, 6 Jun 2016 09:41:00 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH skeleton v4 2/3] Deprecate PropertyCacher.py
Date: Mon,  6 Jun 2016 11:40:53 -0500
Message-Id: <20160606164054.12650-3-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20160606164054.12650-1-openbmc-patches@stwcx.xyz>
References: <20160606164054.12650-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 06 Jun 2016 16:41:08 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

The pyphosphor package provides equivalent function
so use that and drop the duplicated code.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 bin/PropertyCacher.py  | 49 -------------------------------------------------
 bin/inventory_items.py |  3 +--
 bin/system_manager.py  |  2 +-
 3 files changed, 2 insertions(+), 52 deletions(-)
 delete mode 100644 bin/PropertyCacher.py

diff --git a/bin/PropertyCacher.py b/bin/PropertyCacher.py
deleted file mode 100644
index dfbb0b9..0000000
--- a/bin/PropertyCacher.py
+++ /dev/null
@@ -1,49 +0,0 @@
-import os
-import cPickle
-import json
-
-CACHE_PATH = '/var/cache/obmc/'
-
-def getCacheFilename(obj_path, iface_name):
-	name = obj_path.replace('/','.')
-	filename = CACHE_PATH+name[1:]+"@"+iface_name+".props"
-	return filename
-
-def save(obj_path, iface_name, properties):
-	print "Caching: "+obj_path
-	try:
-		
-		filename = getCacheFilename(obj_path, iface_name)
-		output = open(filename, 'wb')
-		try:
-			## use json module to convert dbus datatypes
-			props = json.dumps(properties[iface_name])
-			prop_obj = json.loads(props)
-			cPickle.dump(prop_obj,output)
-		except Exception as e:
-			print "ERROR: "+str(e)
-		finally:
-			output.close()
-	except:
-		print "ERROR opening cache file: "+filename
-
-
-def load(obj_path, iface_name, properties):
-	## overlay with pickled data
-	filename=getCacheFilename(obj_path, iface_name)
-	if (os.path.isfile(filename)):
-		if (properties.has_key(iface_name) == False):
-			properties[iface_name] = {}
-		print "Loading from cache: "+filename
-		try:			
-			p = open(filename, 'rb')
-			data = cPickle.load(p)
-			for prop in data.keys():
-				properties[iface_name][prop] = data[prop]
-						
-		except Exception as e:
-			print "ERROR: Loading cache file: " +str(e)
-		finally:
-			p.close()
-
-
diff --git a/bin/inventory_items.py b/bin/inventory_items.py
index bf7f414..1b0fa39 100755
--- a/bin/inventory_items.py
+++ b/bin/inventory_items.py
@@ -8,7 +8,7 @@ import dbus.service
 import dbus.mainloop.glib
 import cPickle
 import json
-import PropertyCacher
+from obmc.dbuslib.propertycacher import PropertyCacher
 from obmc.dbuslib.bindings import get_dbus, DbusProperties, DbusObjectManager
 
 if (len(sys.argv) < 2):
@@ -37,7 +37,6 @@ class InventoryItem(DbusProperties):
 		self.name = name
 		
 		## this will load properties from cache
-		# PropertyCacher.load(name,INTF_NAME,self.properties)
 		if (data.has_key('present') == False):
 			data['present'] = 'False'
 		if (data.has_key('fault') == False):
diff --git a/bin/system_manager.py b/bin/system_manager.py
index 633fd25..0cfcd0e 100755
--- a/bin/system_manager.py
+++ b/bin/system_manager.py
@@ -8,7 +8,7 @@ import dbus.service
 import dbus.mainloop.glib
 import os
 import time
-import PropertyCacher
+from obmc.dbuslib.propertycacher import PropertyCacher
 from obmc.dbuslib.bindings import DbusProperties, DbusObjectManager, get_dbus
 import obmc.enums
 
-- 
2.8.3
