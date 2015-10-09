Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 288701A03B0
 for <openbmc@lists.ozlabs.org>; Sat, 10 Oct 2015 00:11:18 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1444396274832637.6219500523999;
 Fri, 9 Oct 2015 06:11:14 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid] INITIAL CHANGE
Date: Fri,  9 Oct 2015 08:11:10 -0500
Message-Id: <1444396270-14585-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1444396270-14585-1-git-send-email-patches@stwcx.xyz>
References: <1444396270-14585-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 09 Oct 2015 13:11:19 -0000

From: vishwabmc <vishwanath@in.ibm.com>

---
 ipmid.C | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ipmid.C b/ipmid.C
index 8333710..37ac771 100644
--- a/ipmid.C
+++ b/ipmid.C
@@ -304,7 +304,7 @@ int main(int argc, char *argv[])
     loop = g_main_loop_new (NULL, FALSE);
 
     // Proxy to use GDbus for OpenBMC channel.
-    proxy = g_dbus_proxy_new_for_bus_sync (G_BUS_TYPE_SESSION,
+    proxy = g_dbus_proxy_new_for_bus_sync (G_BUS_TYPE_SYSTEM,
                                            G_DBUS_PROXY_FLAGS_NONE,
                                            NULL, /* GDBusInterfaceInfo */
                                            DBUS_NAME,
-- 
2.6.0
