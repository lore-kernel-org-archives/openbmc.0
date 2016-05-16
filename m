Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r7rg46t1xzDq8G
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2016 05:50:56 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1463428250233732.9356334762109;
 Mon, 16 May 2016 12:50:50 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH pyphosphor] Add enum for Freedesktop unknown service error
Date: Mon, 16 May 2016 14:50:47 -0500
Message-Id: <1463428247-11943-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1463428247-11943-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1463428247-11943-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 16 May 2016 19:50:57 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

---
 obmc/dbuslib/enums.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/obmc/dbuslib/enums.py b/obmc/dbuslib/enums.py
index 910594a..e9c0e72 100644
--- a/obmc/dbuslib/enums.py
+++ b/obmc/dbuslib/enums.py
@@ -18,6 +18,7 @@ import dbus
 
 DBUS_OBJMGR_IFACE = dbus.BUS_DAEMON_IFACE + '.ObjectManager'
 DBUS_UNKNOWN_INTERFACE = 'org.freedesktop.UnknownInterface'
+DBUS_UNKNOWN_SERVICE = 'org.freedesktop.DBus.Error.ServiceUnknown'
 DBUS_UNKNOWN_PROPERTY = 'org.freedesktop.DBus.Error.UnknownProperty'
 DBUS_UNKNOWN_METHOD = 'org.freedesktop.DBus.Error.UnknownMethod'
 DBUS_INVALID_ARGS = 'org.freedesktop.DBus.Error.InvalidArgs'
-- 
2.8.2
