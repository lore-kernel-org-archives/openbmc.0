Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rfJPW5LghzDqsx
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jun 2016 07:10:55 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1467148248842847.2707474612968;
 Tue, 28 Jun 2016 14:10:48 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH pyphosphor 1/5] Add alias for
 org.freedesktop.DBus.Error.NoReply
Date: Tue, 28 Jun 2016 16:10:42 -0500
Message-Id: <20160628211046.8564-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160628211046.8564-1-openbmc-patches@stwcx.xyz>
References: <20160628211046.8564-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 28 Jun 2016 21:10:56 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 obmc/dbuslib/enums.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/obmc/dbuslib/enums.py b/obmc/dbuslib/enums.py
index e9c0e72..4ddec42 100644
--- a/obmc/dbuslib/enums.py
+++ b/obmc/dbuslib/enums.py
@@ -22,6 +22,7 @@ DBUS_UNKNOWN_SERVICE = 'org.freedesktop.DBus.Error.ServiceUnknown'
 DBUS_UNKNOWN_PROPERTY = 'org.freedesktop.DBus.Error.UnknownProperty'
 DBUS_UNKNOWN_METHOD = 'org.freedesktop.DBus.Error.UnknownMethod'
 DBUS_INVALID_ARGS = 'org.freedesktop.DBus.Error.InvalidArgs'
+DBUS_NO_REPLY = 'org.freedesktop.DBus.Error.NoReply'
 DBUS_TYPE_ERROR = 'org.freedesktop.DBus.Python.TypeError'
 OBMC_ASSOCIATIONS_IFACE = 'org.openbmc.Associations'
 OBMC_ASSOC_IFACE = 'org.openbmc.Association'
-- 
2.9.0
