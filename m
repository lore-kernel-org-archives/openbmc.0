Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rV72h3mbXzDqfV
 for <openbmc@lists.ozlabs.org>; Wed, 15 Jun 2016 23:41:15 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 146599806388085.93007367786493;
 Wed, 15 Jun 2016 06:41:03 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH skeleton] Fix syntax error introduced with 6956bbd
Date: Wed, 15 Jun 2016 08:40:55 -0500
Message-Id: <20160615134055.26914-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.4
In-Reply-To: <20160615134055.26914-1-openbmc-patches@stwcx.xyz>
References: <20160615134055.26914-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 15 Jun 2016 13:41:17 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 pyhwmon/hwmon.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/pyhwmon/hwmon.py b/pyhwmon/hwmon.py
index d662213..e7821f4 100644
--- a/pyhwmon/hwmon.py
+++ b/pyhwmon/hwmon.py
@@ -44,11 +44,11 @@ class Hwmons():
 	def readAttribute(self,filename):
 		val = "-1"
 		try:
-		with open(filename, 'r') as f:
-			for line in f:
-				val = line.rstrip('\n')
+			with open(filename, 'r') as f:
+				for line in f:
+					val = line.rstrip('\n')
 		except (OSError, IOError):
-		print "Cannot read attributes:", filename
+			print "Cannot read attributes:", filename
 		return val
 
 	def writeAttribute(self,filename,value):
-- 
2.8.4
