Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rNLpy4DjmzDqGL
 for <openbmc@lists.ozlabs.org>; Mon,  6 Jun 2016 14:11:06 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465186261502796.0773732219052;
 Sun, 5 Jun 2016 21:11:01 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH skeleton 1/3] Don't make pointless sensor update method calls
Date: Sun,  5 Jun 2016 23:10:57 -0500
Message-Id: <20160606041059.18824-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20160606041059.18824-1-openbmc-patches@stwcx.xyz>
References: <20160606041059.18824-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 06 Jun 2016 04:11:07 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

Cut down on dbus traffic by keeping a little cache of hwmon sensor
attributes.  Only call the sensor manager if the value has actually
changed.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 bin/hwmon.py | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/bin/hwmon.py b/bin/hwmon.py
index 08c6f06..1209d46 100755
--- a/bin/hwmon.py
+++ b/bin/hwmon.py
@@ -44,6 +44,7 @@ class Hwmons():
 		self.hwmon_root = { }
 		self.scanDirectory()
 		gobject.timeout_add(DIR_POLL_INTERVAL, self.scanDirectory)   
+		self.cache = {}
 
 	def readAttribute(self,filename):
 		val = ""
@@ -56,17 +57,29 @@ class Hwmons():
 		with open(filename, 'w') as f:
 			f.write(str(value)+'\n')
 
+	def should_update(attribute, value):
+		if attribute not in self.cache:
+			self.cache[attribute] = value
+			return True
+
+		update = (value != self.cache[attribute])
+		self.cache[attribute] = value
+
+		return update
 
 	def poll(self,objpath,attribute):
 		try:
 			raw_value = int(self.readAttribute(attribute))
-			obj = bus.get_object(SENSOR_BUS,objpath,introspect=False)
-			intf = dbus.Interface(obj,HwmonSensor.IFACE_NAME)
-			rtn = intf.setByPoll(raw_value)
-			if (rtn[0] == True):
-				self.writeAttribute(attribute,rtn[1])
+			if self.should_update(attribute, raw_value):
+				obj = bus.get_object(SENSOR_BUS,objpath,introspect=False)
+				intf = dbus.Interface(obj,HwmonSensor.IFACE_NAME)
+				rtn = intf.setByPoll(raw_value)
+				if (rtn[0] == True):
+					self.writeAttribute(attribute,rtn[1])
 		except:
 			print "HWMON: Attibute no longer exists: "+attribute
+			if attribute in self.cache:
+				del self.cache[attribute]
 			return False
 
 
-- 
2.8.3
