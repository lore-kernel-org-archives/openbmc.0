Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qzSQb09b1zDqCD
 for <openbmc@lists.ozlabs.org>; Tue,  3 May 2016 14:11:02 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 146224865778272.29980730052728;
 Mon, 2 May 2016 21:10:57 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH skeleton] Wait for init done before claiming bus name
Date: Mon,  2 May 2016 23:10:56 -0500
Message-Id: <1462248656-23504-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1462248656-23504-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1462248656-23504-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 03 May 2016 04:11:03 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

Wait for initialization to complete before claiming a well known
bus name.  This allows other applications to use a NameOwnerChanged
signal as an indication that service initialization has completed.
---
 bin/inventory_items.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bin/inventory_items.py b/bin/inventory_items.py
index 0a90569..e0351a8 100755
--- a/bin/inventory_items.py
+++ b/bin/inventory_items.py
@@ -79,7 +79,6 @@ def getVersion():
 if __name__ == '__main__':
     dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
     bus = Openbmc.getDBus()
-    name = dbus.service.BusName(DBUS_NAME,bus)
     mainloop = gobject.MainLoop()
     obj_parent = Inventory(bus, '/org/openbmc/inventory')
 
@@ -94,6 +93,7 @@ if __name__ == '__main__':
 		version = getVersion()
 		obj.update({'version': version})
 
+    name = dbus.service.BusName(DBUS_NAME,bus)
     print "Running Inventory Manager"
     mainloop.run()
 
-- 
2.8.1
