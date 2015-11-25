Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 698A91A034F
 for <openbmc@lists.ozlabs.org>; Wed, 25 Nov 2015 18:20:30 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1448436025781858.7394610919856;
 Tue, 24 Nov 2015 23:20:25 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid 1/3] ipmid: Use updated dbus HostIpmi
 interface
Date: Wed, 25 Nov 2015 02:20:22 -0500
Message-Id: <1448436024-9396-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1448436024-9396-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1448436024-9396-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 25 Nov 2015 07:20:31 -0000

From: Jeremy Kerr <jk@ozlabs.org>

With the updated HostIpmi dbus interface, netfns are not packed with
LUNs, and the CC is separate from the data.  This means we no longer
have to define NETFN_* as arbitrarily shifted, and we have the added
bonus of replying to messages where lun != 0.

We may want to separate the CC returned from the handlers in future too.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 ipmid-api.h | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/ipmid-api.h b/ipmid-api.h
index 2d58961..f9c03dd 100644
--- a/ipmid-api.h
+++ b/ipmid-api.h
@@ -63,16 +63,16 @@ extern "C" void ipmi_register_callback(ipmi_netfn_t, ipmi_cmd_t,
 // Note: these are also shifted left to make room for the LUN.
 enum ipmi_net_fns
 {
-    NETFUN_CHASSIS   =   0x00,
-    NETFUN_BRIDGE    =   0x02,
-    NETFUN_SENSOR    =   0x04,
-    NETFUN_APP       =   0x06,
-    NETFUN_FIRMWARE  =   0x08,
-    NETFUN_STORAGE   =   0x0a,
-    NETFUN_TRANSPORT =   0x0c,
-    NETFUN_GRPEXT    =   0x2c,
-    NETFUN_NONE      =   0x30,
-    NETFUN_OEM       =   0x32
+    NETFUN_CHASSIS  =   0x00,
+    NETFUN_BRIDGE   =   0x02,
+    NETFUN_SENSOR   =   0x04,
+    NETFUN_APP      =   0x06,
+    NETFUN_FIRMWARE =   0x08,
+    NETFUN_STORAGE  =   0x0a,
+    NETFUN_TRANPORT =   0x0c,
+    NETFUN_GRPEXT   =   0x2c,
+    NETFUN_NONE     =   0x30,
+    NETFUN_OEM      =   0x32
 };
 
 // IPMI commands for net functions. Since this is to be used both by the ipmi
-- 
2.6.3
