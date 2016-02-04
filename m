Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id A22C11A0226
 for <openbmc@lists.ozlabs.org>; Fri,  5 Feb 2016 07:50:38 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 145461903387696.89343949345005;
 Thu, 4 Feb 2016 12:50:33 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH phosphor-objmgr 1/2] Discard existing interfaces
Date: Thu,  4 Feb 2016 14:50:31 -0600
Message-Id: <1454619032-21755-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1454619032-21755-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1454619032-21755-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Thu, 04 Feb 2016 20:50:39 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

Avoid the need for syncronization between the mapper and services
emitting interfaces added signals by discarding interfaces that have
already been discovered.  This can happen when ia service emits the
interfaces added signal in quick sucession to the name owner changed
signal, and the mapper discovers the new interface while handling
the name owner changed signal.
---
 phosphor-mapper | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/phosphor-mapper b/phosphor-mapper
index f5b1def..da4ae63 100644
--- a/phosphor-mapper
+++ b/phosphor-mapper
@@ -70,9 +70,7 @@ class ObjectMapper(dbus.service.Object):
 			return
 
 		matches = [ x for x in iprops.iterkeys() if self.intf_match(x) ]
-		d = self.cache.setdefault(path, {})
-		d.setdefault(kw['sender'], []).extend(matches)
-		self.cache[path] = d
+		self.add_interfaces(path, kw['sender'], matches)
 
 	def interfaces_removed_handler(self, path, interfaces, **kw):
 		name = self.bus.get_owned_name(self.bus_match, kw['sender'])
@@ -130,9 +128,9 @@ class ObjectMapper(dbus.service.Object):
 			self.process_old_owner(old)
 
 	def add_interfaces(self, path, owner, interfaces):
-		d = self.cache.setdefault(path, { })
-		d.setdefault(owner, []).extend(interfaces)
-		self.cache[path] = d
+		d = self.cache.setdefault(path, {})
+		d = d.setdefault(owner, [])
+		self.cache[path][owner] = list(set(d + interfaces))
 
 	def add_items(self, owner, bus_items):
 		for x,y in bus_items.iteritems():
-- 
2.6.4
