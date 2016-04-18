Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qpYKk4RHFzDqBy
 for <openbmc@lists.ozlabs.org>; Tue, 19 Apr 2016 02:20:58 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 14609964538631016.5108351989849;
 Mon, 18 Apr 2016 09:20:53 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH phosphor-rest-server 2/3] Handle differing dbus exception
 implementations
Date: Mon, 18 Apr 2016 11:20:47 -0500
Message-Id: <1460996448-29773-3-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1460996448-29773-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1460996448-29773-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 18 Apr 2016 16:20:59 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

sdbus and python-dbus don't report the unknown interface
exception the same way, so add a workaround.
---
 obmc-rest | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/obmc-rest b/obmc-rest
index 3a36406..226b1b7 100644
--- a/obmc-rest
+++ b/obmc-rest
@@ -34,6 +34,7 @@ import grp
 import crypt
 
 DBUS_UNKNOWN_INTERFACE = 'org.freedesktop.UnknownInterface'
+DBUS_UNKNOWN_INTERFACE_ERROR = 'org.freedesktop.DBus.Error.UnknownInterface'
 DBUS_UNKNOWN_METHOD = 'org.freedesktop.DBus.Error.UnknownMethod'
 DBUS_INVALID_ARGS = 'org.freedesktop.DBus.Error.InvalidArgs'
 DBUS_TYPE_ERROR = 'org.freedesktop.DBus.Python.TypeError'
@@ -130,6 +131,9 @@ class RouteHandler(object):
             if DBUS_UNKNOWN_INTERFACE in e.get_dbus_message():
                 # interface doesn't have any properties
                 return None
+            if DBUS_UNKNOWN_INTERFACE_ERROR in e.get_dbus_name():
+                # interface doesn't have any properties
+                return None
             if DBUS_UNKNOWN_METHOD == e.get_dbus_name():
                 # properties interface not implemented at all
                 return None
-- 
2.7.1
