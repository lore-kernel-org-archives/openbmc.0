Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3EBEB1A0B62
 for <openbmc@lists.ozlabs.org>; Fri,  6 Nov 2015 00:33:54 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446729727802880.268926077145;
 Thu, 5 Nov 2015 05:22:07 -0800 (PST)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH phosphor-objmgr v2 09/10] Mapper performance improvements
Date: Thu,  5 Nov 2015 07:21:49 -0600
Message-Id: <1446729710-27220-10-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 05 Nov 2015 13:33:54 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

Don't introspect when calling get_object.
Check for bus name match in signal handlers.
---
 OpenBMCMapper.py |  4 ++--
 phosphor-mapper  | 17 ++++++++++++-----
 2 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/OpenBMCMapper.py b/OpenBMCMapper.py
index ef49637..2bdb110 100644
--- a/OpenBMCMapper.py
+++ b/OpenBMCMapper.py
@@ -132,7 +132,7 @@ class IntrospectionParser:
 
 	def _introspect(self, path):
 		try:
-			obj = self.bus.get_object(self.name, path)
+			obj = self.bus.get_object(self.name, path, introspect = False)
 			iface = dbus.Interface(obj, dbus.BUS_DAEMON_IFACE + '.Introspectable')
 			data = iface.Introspect()
 		except dbus.DBusException:
@@ -344,7 +344,7 @@ class PathTree:
 class Mapper:
 	def __init__(self, bus):
 		self.bus = bus
-		obj = bus.get_object(MAPPER_NAME, MAPPER_PATH)
+		obj = bus.get_object(MAPPER_NAME, MAPPER_PATH, introspect = False)
 		self.iface = dbus.Interface(
 				obj, dbus_interface = MAPPER_IFACE)
 
diff --git a/phosphor-mapper b/phosphor-mapper
index e9aa6dc..36bf09b 100644
--- a/phosphor-mapper
+++ b/phosphor-mapper
@@ -49,11 +49,17 @@ class ObjectMapper(dbus.service.Object):
 			signal_name = 'InterfacesRemoved',
 			sender_keyword = 'sender')
 
+	def bus_match(self, name):
+		if name == OpenBMCMapper.MAPPER_NAME:
+			return False
+		return self.name_match(name)
+
 	def discovery_pending(self):
 		return not bool(self.service)
 
 	def interfaces_added_handler(self, path, iprops, **kw):
-		if self.discovery_pending():
+		if self.discovery_pending() or \
+				not self.bus_match(kw['sender']):
 			return
 		matches = [ x for x in iprops.iterkeys() if self.intf_match(x) ]
 		d = self.cache.setdefault(path, {})
@@ -61,7 +67,8 @@ class ObjectMapper(dbus.service.Object):
 		self.cache[path] = d
 
 	def interfaces_removed_handler(self, path, interfaces, **kw):
-		if self.discovery_pending():
+		if self.discovery_pending() or \
+				not self.bus_match(kw['sender']):
 			return
 		item = self.cache[path]
 		name = kw['sender']
@@ -101,7 +108,7 @@ class ObjectMapper(dbus.service.Object):
 
 	def bus_handler(self, service, old, new):
 		if self.discovery_pending() or \
-				not self.name_match(service):
+				not self.bus_match(service):
 			return
 
 		if new:
@@ -122,7 +129,7 @@ class ObjectMapper(dbus.service.Object):
 		if not owners:
 			owners = [ IntrospectionParser(x, self.bus.dbus,
 				self.tag_match, self.intf_match) \
-						for x in self.bus.get_owner_names(self.name_match) ]
+						for x in self.bus.get_owner_names(self.bus_match) ]
 		for o in owners:
 			self.add_items(o.name, o.introspect())
 
@@ -159,7 +166,7 @@ class BusWrapper:
 	def get_service_names(self, match):
 		# these are well known names
 		return [ x for x in self.dbus.list_names() \
-				if match(x) and x != OpenBMCMapper.MAPPER_NAME ]
+				if match(x) ]
 
 	def get_owner_names(self, match):
 		# these are unique connection names
-- 
2.6.0
