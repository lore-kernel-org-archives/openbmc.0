Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qk46t751nzDq9q
 for <openbmc@lists.ozlabs.org>; Mon, 11 Apr 2016 19:11:00 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1460365856273831.8843911772739;
 Mon, 11 Apr 2016 02:10:56 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton] skeleton: Add new API SystemManager::getFRUObject()
Date: Mon, 11 Apr 2016 04:10:53 -0500
Message-Id: <1460365853-18421-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1460365853-18421-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1460365853-18421-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 11 Apr 2016 09:11:03 -0000

From: Yi Li <adamliyi@msn.com>

ipmi-fru-parser uses getObjectFromId('FRU_STR', fru_area_name) to
ask for the dbus object path of the 'fru_area_name'. The returned
value is also used to check the 'present' status of FRU. Sometimes
the 'fru_area_name' does not defined in Skeleton's ID_LOOKUP table.
system_manager will report a "ERROR: lookup not found" error message.

This patch added an API similiar with getObjectFromId().
It does not report error when the 'fru_area_name' is not defined.
It can be used by ipmi-fru-parser to replace getObjectFromId().

Also the orignal "ERROR" message is changed to "WARNING".

Signed-off-by: Yi Li <adamliyi@msn.com>
---
 bin/system_manager.py | 40 +++++++++++++++++++++++++++-------------
 1 file changed, 27 insertions(+), 13 deletions(-)

diff --git a/bin/system_manager.py b/bin/system_manager.py
index 004d978..c19075f 100755
--- a/bin/system_manager.py
+++ b/bin/system_manager.py
@@ -115,30 +115,44 @@ class SystemManager(Openbmc.DbusProperties,Openbmc.DbusObjectManager):
 		return self.Get(DBUS_NAME,"current_state")
 
 	def doObjectLookup(self,category,key):
-		bus_name = ""
-		obj_path = ""
 		intf_name = INTF_ITEM
-		try:
-			obj_path = System.ID_LOOKUP[category][key]
-			bus_name = self.bus_name_lookup[obj_path]
-			parts = obj_path.split('/')
-			if (parts[3] == 'sensors'):
-				intf_name = INTF_SENSOR
-		except Exception as e:
-			print "ERROR SystemManager: "+str(e)+" not found in lookup"
-
+		obj_path = System.ID_LOOKUP[category][key]
+		bus_name = self.bus_name_lookup[obj_path]
+		parts = obj_path.split('/')
+		if (parts[3] == 'sensors'):
+			intf_name = INTF_SENSOR
 		return [bus_name,obj_path,intf_name]
 
 	@dbus.service.method(DBUS_NAME,
 		in_signature='ss', out_signature='(sss)')
 	def getObjectFromId(self,category,key):
-		return self.doObjectLookup(category,key)
+		try:
+			return self.doObjectLookup(category,key)
+		except Exception as e:
+			print "WARNING SystemManager:"+\
+				"Object not found for:[%s][%s]" %(category,key)
+			return ["", "", ""]
 
 	@dbus.service.method(DBUS_NAME,
 		in_signature='sy', out_signature='(sss)')
 	def getObjectFromByteId(self,category,key):
 		byte = int(key)
-		return self.doObjectLookup(category,byte)
+		try:
+			return self.doObjectLookup(category,byte)
+		except Exception as e:
+			print "WARNING SystemManager:"+\
+				"Object not found for:[%s][%s]" %(category,key)
+			return ["", "", ""]
+
+	# this method is used by ipmi-fru-parser to get the path of a fru_area
+	# do not report 'not found' message since it is expected
+	@dbus.service.method(DBUS_NAME,
+		in_signature='s', out_signature='(sss)')
+	def getFRUObject(self,key):
+		try:
+			return self.doObjectLookup("FRU_STR",key)
+		except Exception as e:
+			return ["", "", ""]
 	
 	def start_process(self,name):
 		if (System.APPS[name]['start_process'] == True):
-- 
2.7.1
