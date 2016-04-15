Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qmVNM0YdxzDq64
 for <openbmc@lists.ozlabs.org>; Fri, 15 Apr 2016 18:01:06 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 146070726317221.562714490107737;
 Fri, 15 Apr 2016 01:01:03 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton] skeleton: add a new dbus method
 System::getFRUArea(fru_id)
Date: Fri, 15 Apr 2016 03:00:59 -0500
Message-Id: <1460707259-26459-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1460707259-26459-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1460707259-26459-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 15 Apr 2016 08:01:07 -0000

From: Yi Li <adamliyi@msn.com>

This method will be used by ipmi-fru-parser to get fru area names defined
in ID_LOOKUP table. The ID_LOOKUP table defines FRUs that should be
present in the system.

Signed-off-by: Yi Li <adamliyi@msn.com>
---
 bin/system_manager.py | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/bin/system_manager.py b/bin/system_manager.py
index 004d978..05671e7 100755
--- a/bin/system_manager.py
+++ b/bin/system_manager.py
@@ -139,7 +139,23 @@ class SystemManager(Openbmc.DbusProperties,Openbmc.DbusObjectManager):
 	def getObjectFromByteId(self,category,key):
 		byte = int(key)
 		return self.doObjectLookup(category,byte)
-	
+
+	# Get the FRU area names defined in ID_LOOKUP table given a fru_id.
+	# If serval areas are defined for a fru_id, the areas are returned
+	# together as a string with each area name seperated with ','.
+	# If no fru area defined in ID_LOOKUP, an empty string will be returned.
+	@dbus.service.method(DBUS_NAME,
+		in_signature='y', out_signature='s')
+	def getFRUArea(self,fru_id):
+		ret_str = ''
+		fru_id = '_' + str(fru_id)
+		area_list = [area for area in System.ID_LOOKUP['FRU_STR'].keys() \
+				if area.endswith(fru_id)]
+		for area in area_list:
+			ret_str = area + ',' + ret_str
+		# remove the last ','
+		return ret_str[:-1]
+
 	def start_process(self,name):
 		if (System.APPS[name]['start_process'] == True):
 			app = System.APPS[name]
-- 
2.7.1
