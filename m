Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 0FCFA1A0D0F
 for <openbmc@lists.ozlabs.org>; Fri,  6 Nov 2015 00:23:03 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446729729895648.669505666297;
 Thu, 5 Nov 2015 05:22:09 -0800 (PST)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH phosphor-objmgr v2 10/10] Use introspect interface enum
Date: Thu,  5 Nov 2015 07:21:50 -0600
Message-Id: <1446729710-27220-11-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1446729710-27220-1-git-send-email-patches@stwcx.xyz>
References: <1446729710-27220-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 05 Nov 2015 13:23:04 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

---
 OpenBMCMapper.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/OpenBMCMapper.py b/OpenBMCMapper.py
index 2bdb110..1233c70 100644
--- a/OpenBMCMapper.py
+++ b/OpenBMCMapper.py
@@ -133,7 +133,7 @@ class IntrospectionParser:
 	def _introspect(self, path):
 		try:
 			obj = self.bus.get_object(self.name, path, introspect = False)
-			iface = dbus.Interface(obj, dbus.BUS_DAEMON_IFACE + '.Introspectable')
+			iface = dbus.Interface(obj, dbus.INTROSPECTABLE_IFACE)
 			data = iface.Introspect()
 		except dbus.DBusException:
 			return None
-- 
2.6.0
