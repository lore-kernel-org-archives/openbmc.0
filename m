Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rbnwz2czczDqlP
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jun 2016 05:10:59 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466795452277667.2692244036813;
 Fri, 24 Jun 2016 12:10:52 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH phosphor-objmgr 1/2] Pep8 fixes
Date: Fri, 24 Jun 2016 14:10:48 -0500
Message-Id: <20160624191049.26382-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160624191049.26382-1-openbmc-patches@stwcx.xyz>
References: <20160624191049.26382-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 24 Jun 2016 19:11:00 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

A few of these slipped by.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 phosphor-mapper | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/phosphor-mapper b/phosphor-mapper
index ea30f1b..a2d007c 100644
--- a/phosphor-mapper
+++ b/phosphor-mapper
@@ -174,13 +174,11 @@ class ObjectMapper(dbus.service.Object):
         gobject.idle_add(self.discover)
         self.bus.add_signal_receiver(
             self.bus_handler,
-            dbus_interface=
-            dbus.BUS_DAEMON_IFACE,
+            dbus_interface=dbus.BUS_DAEMON_IFACE,
             signal_name='NameOwnerChanged')
         self.bus.add_signal_receiver(
             self.interfaces_added_handler,
-            dbus_interface=
-            dbus.BUS_DAEMON_IFACE + '.ObjectManager',
+            dbus_interface=dbus.BUS_DAEMON_IFACE + '.ObjectManager',
             signal_name='InterfacesAdded',
             sender_keyword='sender',
             path_keyword='sender_path')
@@ -319,8 +317,8 @@ class ObjectMapper(dbus.service.Object):
             return iface == dbus.BUS_DAEMON_IFACE + '.ObjectManager' or \
                 self.intf_match(iface)
         if not owners:
-            owned_names = [x for x in self.bus.list_names()
-                if self.bus_match(x)]
+            owned_names = [
+                x for x in self.bus.list_names() if self.bus_match(x)]
             owners = [self.bus.get_name_owner(x) for x in owned_names]
             owners = zip(owned_names, owners)
         for owned_name, o in owners:
-- 
2.9.0
