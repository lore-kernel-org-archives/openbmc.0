Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rPfVt6G0vzDqHY
 for <openbmc@lists.ozlabs.org>; Wed,  8 Jun 2016 17:01:41 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465369287679629.5778787596429;
 Wed, 8 Jun 2016 00:01:27 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Ken <ken.sk.lai@mail.foxconn.com>
Subject: [PATCH skeleton] Fix the sensor scandirectory recovery bug when poll
 or readattribute fail
Date: Wed,  8 Jun 2016 02:01:23 -0500
Message-Id: <20160608070123.28896-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20160608070123.28896-1-openbmc-patches@stwcx.xyz>
References: <20160608070123.28896-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 08 Jun 2016 07:01:43 -0000

From: Ken <ken.sk.lai@mail.foxconn.com>

---
 bin/hwmon.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/bin/hwmon.py b/bin/hwmon.py
index 1209d46..19a2309 100755
--- a/bin/hwmon.py
+++ b/bin/hwmon.py
@@ -47,10 +47,13 @@ class Hwmons():
 		self.cache = {}
 
 	def readAttribute(self,filename):
-		val = ""
+		val = "-1"
+		try:
 		with open(filename, 'r') as f:
 			for line in f:
 				val = line.rstrip('\n')
+		except (OSError, IOError):
+		print "Cannot read attributes:", filename
 		return val
 
 	def writeAttribute(self,filename,value):
@@ -78,6 +81,7 @@ class Hwmons():
 					self.writeAttribute(attribute,rtn[1])
 		except:
 			print "HWMON: Attibute no longer exists: "+attribute
+			self.sensors.pop(objpath,None)
 			if attribute in self.cache:
 				del self.cache[attribute]
 			return False
-- 
2.8.3
