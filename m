Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 588901A0B97
 for <openbmc@lists.ozlabs.org>; Thu,  5 Nov 2015 03:45:08 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446655138403744.8190943309664;
 Wed, 4 Nov 2015 08:38:58 -0800 (PST)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH phosphor-objmgr 8/8] Add basic error handling to ObjectMapper
Date: Wed,  4 Nov 2015 10:33:34 -0600
Message-Id: <1446654814-4705-9-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1446654814-4705-1-git-send-email-patches@stwcx.xyz>
References: <1446654814-4705-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 04 Nov 2015 16:45:14 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

Raise MapperNotFound for invalid paths supplied to the
DBUS API.
---
 phosphor-mapper | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/phosphor-mapper b/phosphor-mapper
index 5bdcd8d..870d9a4 100644
--- a/phosphor-mapper
+++ b/phosphor-mapper
@@ -24,6 +24,10 @@ import gobject
 from OpenBMCMapper import Path, IntrospectionParser, PathTree
 import OpenBMCMapper
 
+class MapperNotFoundException(Exception):
+	def __init__(self, msg):
+		super(MapperNotFoundException, self).__init__(msg)
+
 class ObjectMapper(dbus.service.Object):
 	def __init__(self, bus, path,
 			name_match = OpenBMCMapper.org_dot_openbmc_match,
@@ -133,15 +137,24 @@ class ObjectMapper(dbus.service.Object):
 
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
