Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id D50541A0D48
 for <openbmc@lists.ozlabs.org>; Fri,  6 Nov 2015 00:23:02 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446729726246830.377527313315;
 Thu, 5 Nov 2015 05:22:06 -0800 (PST)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH phosphor-objmgr v2 08/10] Add basic error handling to
 ObjectMapper
Date: Thu,  5 Nov 2015 07:21:48 -0600
Message-Id: <1446729710-27220-9-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1446729710-27220-1-git-send-email-patches@stwcx.xyz>
References: <1446729710-27220-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 05 Nov 2015 13:23:03 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

Raise MapperNotFound for invalid paths supplied to the
DBUS API.
---
 OpenBMCMapper.py |  4 ++++
 phosphor-mapper  | 15 ++++++++++++---
 2 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/OpenBMCMapper.py b/OpenBMCMapper.py
index 3e7a745..ef49637 100644
--- a/OpenBMCMapper.py
+++ b/OpenBMCMapper.py
@@ -24,6 +24,10 @@ MAPPER_IFACE = MAPPER_NAME + '.ObjectMapper'
 MAPPER_PATH = '/org/openbmc/objectmapper/objectmapper'
 ENUMERATE_IFACE = 'org.openbmc.Object.Enumerate'
 
+class MapperNotFoundException(Exception):
+	def __init__(self, msg):
+		super(MapperNotFoundException, self).__init__(msg)
+
 class Path:
 	def __init__(self, path):
 		self.parts = filter(bool, path.split('/'))
diff --git a/phosphor-mapper b/phosphor-mapper
index 5bdcd8d..e9aa6dc 100644
--- a/phosphor-mapper
+++ b/phosphor-mapper
@@ -133,15 +133,24 @@ class ObjectMapper(dbus.service.Object):
 
 	@dbus.service.method(OpenBMCMapper.MAPPER_IFACE, 's', 'a{sas}')
 	def GetObject(self, path):
-		return self.cache[path]
+		o = self.cache.get(path)
+		if not o:
+			raise MapperNotFoundException(path)
+		return o
 
 	@dbus.service.method(OpenBMCMapper.MAPPER_IFACE, 'si', 'as')
 	def GetSubTreePaths(self, path, depth):
-		return self.cache.iterkeys(path, depth)
+		try:
+			return self.cache.iterkeys(path, depth)
+		except KeyError:
+			raise MapperNotFoundException(path)
 
 	@dbus.service.method(OpenBMCMapper.MAPPER_IFACE, 'si', 'a{sa{sas}}')
 	def GetSubTree(self, path, depth):
-		return { x:y for x, y in self.cache.dataitems(path, depth) }
+		try:
+			return { x:y for x, y in self.cache.dataitems(path, depth) }
+		except KeyError:
+			raise MapperNotFoundException(path)
 
 class BusWrapper:
 	def __init__(self, bus):
-- 
2.6.0
