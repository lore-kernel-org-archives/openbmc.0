Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qtPTK0xsgzDqBY
 for <openbmc@lists.ozlabs.org>; Mon, 25 Apr 2016 08:40:52 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1461537647335549.3816209084112;
 Sun, 24 Apr 2016 15:40:47 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH phosphor-rest-server v2 3/3] Remove redundant makelist and
 search functions
Date: Sun, 24 Apr 2016 17:40:42 -0500
Message-Id: <1461537642-10215-4-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1461537642-10215-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1461537642-10215-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sun, 24 Apr 2016 22:40:53 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

Use the functions in the new pyphosphor library.
---
 obmc-rest | 21 ++++-----------------
 1 file changed, 4 insertions(+), 17 deletions(-)

diff --git a/obmc-rest b/obmc-rest
index 226b1b7..e7dbbba 100644
--- a/obmc-rest
+++ b/obmc-rest
@@ -69,27 +69,14 @@ class UserInGroup:
             abort(403, 'Insufficient access')
 
 
-def find_case_insensitive(value, lst):
-    return next((x for x in lst if x.lower() == value.lower()), None)
-
-
-def makelist(data):
-    if isinstance(data, list):
-        return data
-    elif data:
-        return [data]
-    else:
-        return []
-
-
 class RouteHandler(object):
-    _require_auth = makelist(valid_user)
+    _require_auth = obmc.utils.misc.makelist(valid_user)
 
     def __init__(self, app, bus, verbs, rules):
         self.app = app
         self.bus = bus
         self.mapper = obmc.mapper.Mapper(bus)
-        self._verbs = makelist(verbs)
+        self._verbs = obmc.utils.misc.makelist(verbs)
         self._rules = rules
         self.intf_match = obmc.utils.misc.org_dot_openbmc_match
 
@@ -240,7 +227,7 @@ class MethodHandler(RouteHandler):
         if methods is None:
             return None
 
-        method = find_case_insensitive(method, methods.keys())
+        method = obmc.utils.misc.find_case_insensitive(method, methods.keys())
         if method is not None:
             iface = dbus.Interface(obj, interface)
             return iface.get_dbus_method(method)
@@ -318,7 +305,7 @@ class PropertyHandler(RouteHandler):
             properties = self.try_properties_interface(iface.GetAll, i)
             if properties is None:
                 continue
-            prop = find_case_insensitive(prop, properties.keys())
+            prop = obmc.utils.misc.find_case_insensitive(prop, properties.keys())
             if prop is None:
                 continue
             return prop, i
-- 
2.8.1
