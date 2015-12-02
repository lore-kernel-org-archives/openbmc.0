Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 7F4E81A0C4B
 for <openbmc@lists.ozlabs.org>; Thu,  3 Dec 2015 03:20:39 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1449073234324445.20604579296673;
 Wed, 2 Dec 2015 08:20:34 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH phosphor-rest-server] Handle type errors for method call
 parameters
Date: Wed,  2 Dec 2015 11:20:32 -0500
Message-Id: <1449073232-6738-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1449073232-6738-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1449073232-6738-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 02 Dec 2015 16:20:40 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

Raise a 400 rather than internal server error for type errors.
---
 obmc-rest | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/obmc-rest b/obmc-rest
index c5ba8dc..74b5926 100644
--- a/obmc-rest
+++ b/obmc-rest
@@ -15,6 +15,7 @@ from OpenBMCMapper import Mapper, PathTree, IntrospectionNodeParser, ListMatch
 DBUS_UNKNOWN_INTERFACE = 'org.freedesktop.UnknownInterface'
 DBUS_UNKNOWN_METHOD = 'org.freedesktop.DBus.Error.UnknownMethod'
 DBUS_INVALID_ARGS = 'org.freedesktop.DBus.Error.InvalidArgs'
+DBUS_TYPE_ERROR = 'org.freedesktop.DBus.Python.TypeError'
 DELETE_IFACE = 'org.openbmc.Object.Delete'
 
 _4034_msg = "The specified %s cannot be %s: '%s'"
@@ -216,6 +217,8 @@ class MethodHandler(RouteHandler):
 		except dbus.exceptions.DBusException, e:
 			if e.get_dbus_name() == DBUS_INVALID_ARGS:
 				abort(400, str(e))
+			if e.get_dbus_name() == DBUS_TYPE_ERROR:
+				abort(400, str(e))
 			raise
 
 	@staticmethod
-- 
2.6.3
