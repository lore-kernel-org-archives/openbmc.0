Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 9993F1A0331
 for <openbmc@lists.ozlabs.org>; Thu, 26 Nov 2015 00:50:35 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1448459428970969.2433843869803;
 Wed, 25 Nov 2015 05:50:28 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH phosphor-objmgr] Objectmananger signal handling fixes
Date: Wed, 25 Nov 2015 08:50:27 -0500
Message-Id: <1448459427-20168-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1448459427-20168-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1448459427-20168-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 25 Nov 2015 13:50:37 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

Fixed signal name typo.
Added get_owned_name helper.
Use well known and connection specific name where appropriate.
---
 phosphor-mapper | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/phosphor-mapper b/phosphor-mapper
index 011dc56..f5b1def 100644
--- a/phosphor-mapper
+++ b/phosphor-mapper
@@ -48,7 +48,7 @@ class ObjectMapper(dbus.service.Object):
 			signal_name = 'NameOwnerChanged')
 		self.bus.dbus.add_signal_receiver(self.interfaces_added_handler,
 			dbus_interface = dbus.BUS_DAEMON_IFACE + '.ObjectManager',
-			signal_name = 'InterfaceesAdded',
+			signal_name = 'InterfacesAdded',
 			sender_keyword = 'sender')
 		self.bus.dbus.add_signal_receiver(self.interfaces_removed_handler,
 			dbus_interface = dbus.BUS_DAEMON_IFACE + '.ObjectManager',
@@ -64,33 +64,40 @@ class ObjectMapper(dbus.service.Object):
 		return not bool(self.service)
 
 	def interfaces_added_handler(self, path, iprops, **kw):
+		name = self.bus.get_owned_name(self.bus_match, kw['sender'])
 		if self.discovery_pending() or \
-				not self.bus_match(kw['sender']):
+				not self.bus_match(name):
 			return
+
 		matches = [ x for x in iprops.iterkeys() if self.intf_match(x) ]
 		d = self.cache.setdefault(path, {})
-		d[path].setdefault(kw['sender'], []).extend(matches)
+		d.setdefault(kw['sender'], []).extend(matches)
 		self.cache[path] = d
 
 	def interfaces_removed_handler(self, path, interfaces, **kw):
+		name = self.bus.get_owned_name(self.bus_match, kw['sender'])
 		if self.discovery_pending() or \
-				not self.bus_match(kw['sender']):
+				not self.bus_match(name):
 			return
 		item = self.cache[path]
-		name = kw['sender']
+		sender = kw['sender']
 		for x in interfaces:
-			item[name].remove(x)
+			if self.intf_match(x):
+				try:
+					item[sender].remove(x)
+				except ValueError:
+					pass
 
 		# remove the owner if there aren't any interfaces left
-		if not item[name]:
-			del item[name]
+		if not item[sender]:
+			del item[sender]
 
 		# update if interfaces remain
 		if item:
 			self.cache[path] = item
 		# mark for removal if no interfaces remain
-		elif self.cache.get_children(item):
-			self.cache.demote(item)
+		elif self.cache.get_children(path):
+			self.cache.demote(path)
 		# delete the entire path if everything is gone
 		else:
 			del self.cache[path]
@@ -169,6 +176,11 @@ class BusWrapper:
 	def __init__(self, bus):
 		self.dbus = bus
 
+	def get_owned_name(self, match, bus):
+		for x in self.get_service_names(match):
+			if self.dbus.get_name_owner(x) == bus:
+				return x
+
 	def get_service_names(self, match):
 		# these are well known names
 		return [ x for x in self.dbus.list_names() \
-- 
2.6.3
