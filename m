Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3E4D01A0CFA
 for <openbmc@lists.ozlabs.org>; Fri,  6 Nov 2015 00:22:59 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446729721103241.84102258353994;
 Thu, 5 Nov 2015 05:22:01 -0800 (PST)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH phosphor-objmgr v2 05/10] Defer mapper name registration to
 post discovery
Date: Thu,  5 Nov 2015 07:21:45 -0600
Message-Id: <1446729710-27220-6-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 05 Nov 2015 13:22:59 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

When systemd units that depend on objectmapper name registration
currently get started, they block while objectmapper does all
its initial discovery.  This change ensures that the mapper is
ready to receive requests before registering the service name on
dbus.
---
 phosphor-mapper | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/phosphor-mapper b/phosphor-mapper
index 1415e24..5bdcd8d 100644
--- a/phosphor-mapper
+++ b/phosphor-mapper
@@ -34,8 +34,7 @@ class ObjectMapper(dbus.service.Object):
 		self.name_match = name_match
 		self.intf_match = intf_match
 		self.tag_match = OpenBMCMapper.ListMatch(['children', 'interface'])
-
-		self.discovery_done = False
+		self.service = None
 
 		gobject.idle_add(self.discover)
 		self.bus.dbus.add_signal_receiver(self.bus_handler,
@@ -50,13 +49,20 @@ class ObjectMapper(dbus.service.Object):
 			signal_name = 'InterfacesRemoved',
 			sender_keyword = 'sender')
 
+	def discovery_pending(self):
+		return not bool(self.service)
+
 	def interfaces_added_handler(self, path, iprops, **kw):
+		if self.discovery_pending():
+			return
 		matches = [ x for x in iprops.iterkeys() if self.intf_match(x) ]
 		d = self.cache.setdefault(path, {})
 		d[path].setdefault(kw['sender'], []).extend(matches)
 		self.cache[path] = d
 
 	def interfaces_removed_handler(self, path, interfaces, **kw):
+		if self.discovery_pending():
+			return
 		item = self.cache[path]
 		name = kw['sender']
 		for x in interfaces:
@@ -94,7 +100,7 @@ class ObjectMapper(dbus.service.Object):
 				del self.cache[x]
 
 	def bus_handler(self, service, old, new):
-		if not self.discovery_done or \
+		if self.discovery_pending() or \
 				not self.name_match(service):
 			return
 
@@ -113,17 +119,17 @@ class ObjectMapper(dbus.service.Object):
 			self.add_interfaces(x, owner, y['interfaces'])
 
 	def discover(self, owners = None):
-		discovery = not self.discovery_done
 		if not owners:
 			owners = [ IntrospectionParser(x, self.bus.dbus,
 				self.tag_match, self.intf_match) \
 						for x in self.bus.get_owner_names(self.name_match) ]
-			self.discovery_done = True
 		for o in owners:
 			self.add_items(o.name, o.introspect())
 
-		if discovery:
+		if self.discovery_pending():
 			print "ObjectMapper discovery complete..."
+			self.service = dbus.service.BusName(
+					OpenBMCMapper.MAPPER_NAME, self.bus.dbus)
 
 	@dbus.service.method(OpenBMCMapper.MAPPER_IFACE, 's', 'a{sas}')
 	def GetObject(self, path):
@@ -154,7 +160,6 @@ class BusWrapper:
 if __name__ == '__main__':
 	dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
 	bus = dbus.SystemBus()
-	s = dbus.service.BusName(OpenBMCMapper.MAPPER_NAME, bus)
 	o = ObjectMapper(BusWrapper(bus), OpenBMCMapper.MAPPER_PATH)
 	loop = gobject.MainLoop()
 
-- 
2.6.0
