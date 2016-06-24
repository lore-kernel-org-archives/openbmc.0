Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rbnxM1B6GzDqlP
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jun 2016 05:11:18 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466795473029615.6553487114543;
 Fri, 24 Jun 2016 12:11:13 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH skeleton 2/3] Revert "Don't make pointless sensor update
 method calls"
Date: Fri, 24 Jun 2016 14:11:08 -0500
Message-Id: <20160624191109.26490-3-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160624191109.26490-1-openbmc-patches@stwcx.xyz>
References: <20160624191109.26490-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 24 Jun 2016 19:11:20 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

This reverts commit efc689707d21f36c0ed8f0b1af474d2087ef8f95.

This enhancement breaks the ability to set the sensor value
via user-interface.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 pyhwmon/hwmon.py | 24 +++++-------------------
 1 file changed, 5 insertions(+), 19 deletions(-)

diff --git a/pyhwmon/hwmon.py b/pyhwmon/hwmon.py
index d9c1353..e5dc19a 100644
--- a/pyhwmon/hwmon.py
+++ b/pyhwmon/hwmon.py
@@ -39,7 +39,6 @@ class Hwmons():
 		self.hwmon_root = { }
 		self.scanDirectory()
 		gobject.timeout_add(DIR_POLL_INTERVAL, self.scanDirectory)   
-		self.cache = {}
 
 	def readAttribute(self,filename):
 		val = "-1"
@@ -55,30 +54,17 @@ class Hwmons():
 		with open(filename, 'w') as f:
 			f.write(str(value)+'\n')
 
-	def should_update(attribute, value):
-		if attribute not in self.cache:
-			self.cache[attribute] = value
-			return True
-
-		update = (value != self.cache[attribute])
-		self.cache[attribute] = value
-
-		return update
 
 	def poll(self,objpath,attribute):
 		try:
 			raw_value = int(self.readAttribute(attribute))
-			if self.should_update(attribute, raw_value):
-				obj = bus.get_object(SENSOR_BUS,objpath,introspect=False)
-				intf = dbus.Interface(obj,HwmonSensor.IFACE_NAME)
-				rtn = intf.setByPoll(raw_value)
-				if (rtn[0] == True):
-					self.writeAttribute(attribute,rtn[1])
+			obj = bus.get_object(SENSOR_BUS,objpath,introspect=False)
+			intf = dbus.Interface(obj,HwmonSensor.IFACE_NAME)
+			rtn = intf.setByPoll(raw_value)
+			if (rtn[0] == True):
+				self.writeAttribute(attribute,rtn[1])
 		except:
 			print "HWMON: Attibute no longer exists: "+attribute
-			self.sensors.pop(objpath,None)
-			if attribute in self.cache:
-				del self.cache[attribute]
 			return False
 
 
-- 
2.9.0
