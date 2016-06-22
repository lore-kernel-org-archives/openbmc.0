Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rZ8W24bC1zDqFb
 for <openbmc@lists.ozlabs.org>; Wed, 22 Jun 2016 13:01:18 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466564472308739.1363995802534;
 Tue, 21 Jun 2016 20:01:12 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH skeleton 2/4] obmcutil: Use freedesktop ObjectManager
Date: Tue, 21 Jun 2016 22:01:07 -0500
Message-Id: <20160622030109.17283-3-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160622030109.17283-1-openbmc-patches@stwcx.xyz>
References: <20160622030109.17283-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 22 Jun 2016 03:01:19 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

The org.openbmc.Object.Enumerate interface is deprecated in favor
of the freedesktop ObjectManager.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 pytools/obmcutil | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/pytools/obmcutil b/pytools/obmcutil
index 02c2c2c..6db589e 100644
--- a/pytools/obmcutil
+++ b/pytools/obmcutil
@@ -18,7 +18,17 @@ def fix_byte(it,key,parent):
                 parent[key] = int(it)  
     else:                              
         pass                           
-                     
+
+
+def merge_interfaces(objs):
+    for op in objs:
+        merged = {}
+        for interface, properties in objs[op].items():
+            merged.update(properties)
+
+        del objs[op]
+        objs[op] = merged
+
 
 def printDict(name,data):
     	if (isinstance(data, dict)):   
@@ -114,14 +124,16 @@ dbus_objects = {
 	'getinventory' : {
 		'bus_name' : 'org.openbmc.Inventory',
 		'object_name' : '/org/openbmc/inventory',
-		'interface_name' : 'org.openbmc.Object.Enumerate',
-		'method' : 'enumerate'
+		'interface_name' : 'org.freedesktop.DBus.ObjectManager',
+		'method' : 'GetManagedObjects',
+		'transform' : merge_interfaces
 	},
 	'getsensors' : {
 		'bus_name' : 'org.openbmc.Sensors',
 		'object_name' : '/org/openbmc/sensors',
-		'interface_name' : 'org.openbmc.Object.Enumerate',
-		'method' : 'enumerate'
+		'interface_name' : 'org.freedesktop.DBus.ObjectManager',
+		'method' : 'GetManagedObjects',
+		'transform' : merge_interfaces
 	},
 	'host' : {
 		'bus_name' : 'org.openbmc.control.Host',
@@ -179,6 +191,8 @@ if (method_name != ""):
 		data = methd(*sys.argv)
 		fix_byte(data,None,None)	
 		pydata = json.loads(json.dumps(data))
+		if 'transform' in objinfo:
+			objinfo['transform'](pydata)
 		printDict("",pydata)
 	except Exception as e:
 		print e
-- 
2.9.0
