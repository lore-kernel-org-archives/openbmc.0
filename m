Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rZ8Vm58pgzDqFb
 for <openbmc@lists.ozlabs.org>; Wed, 22 Jun 2016 13:01:04 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 146656445712269.62311070096393;
 Tue, 21 Jun 2016 20:00:57 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH pyphosphor] Remove org.openbmc.Object.Enumerate interface
Date: Tue, 21 Jun 2016 22:00:54 -0500
Message-Id: <20160622030054.17203-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160622030054.17203-1-openbmc-patches@stwcx.xyz>
References: <20160622030054.17203-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 22 Jun 2016 03:01:05 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

Everyone should be using the freedesktop ObjectManager for this.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 obmc/dbuslib/bindings.py | 22 +---------------------
 1 file changed, 1 insertion(+), 21 deletions(-)

diff --git a/obmc/dbuslib/bindings.py b/obmc/dbuslib/bindings.py
index c7da8b8..3dec5af 100644
--- a/obmc/dbuslib/bindings.py
+++ b/obmc/dbuslib/bindings.py
@@ -144,29 +144,9 @@ class DbusObjectManager(dbus.service.Object):
     @dbus.service.signal(
         "org.freedesktop.DBus.ObjectManager", signature='oa{sa{sv}}')
     def InterfacesAdded(self, object_path, properties):
-        self.ObjectAdded(object_path, "")
+        pass
 
     @dbus.service.signal(
         "org.freedesktop.DBus.ObjectManager", signature='oas')
     def InterfacesRemoved(self, object_path, interfaces):
         pass
-
-    ## Legacy support, need to eventually refactor out
-    @dbus.service.signal(
-        "org.openbmc.Object.ObjectMapper", signature='ss')
-    def ObjectAdded(self, object_path, interface_name):
-        pass
-
-    ## flattens interfaces
-    @dbus.service.method(
-        'org.openbmc.Object.Enumerate', in_signature='',
-        out_signature='a{sa{sv}}')
-    def enumerate(self):
-        data = {}
-        for objpath in self.objects.keys():
-            props = self.objects[objpath].properties
-            data[objpath] = {}
-            for iface in props.keys():
-                data[objpath].update(props[iface])
-
-        return data
-- 
2.9.0
