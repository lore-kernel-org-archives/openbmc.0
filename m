Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 0753B1A032F
 for <openbmc@lists.ozlabs.org>; Thu, 26 Nov 2015 01:20:37 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1448461234213375.00576347038987;
 Wed, 25 Nov 2015 06:20:34 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH phosphor-rest-server] Fix lower case Delete interface element
Date: Wed, 25 Nov 2015 09:20:32 -0500
Message-Id: <1448461232-21100-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1448461232-21100-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1448461232-21100-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 25 Nov 2015 14:20:38 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

---
 obmc-rest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/obmc-rest b/obmc-rest
index 017a736..c5ba8dc 100644
--- a/obmc-rest
+++ b/obmc-rest
@@ -15,7 +15,7 @@ from OpenBMCMapper import Mapper, PathTree, IntrospectionNodeParser, ListMatch
 DBUS_UNKNOWN_INTERFACE = 'org.freedesktop.UnknownInterface'
 DBUS_UNKNOWN_METHOD = 'org.freedesktop.DBus.Error.UnknownMethod'
 DBUS_INVALID_ARGS = 'org.freedesktop.DBus.Error.InvalidArgs'
-DELETE_IFACE = 'org.openbmc.object.Delete'
+DELETE_IFACE = 'org.openbmc.Object.Delete'
 
 _4034_msg = "The specified %s cannot be %s: '%s'"
 
-- 
2.6.3
