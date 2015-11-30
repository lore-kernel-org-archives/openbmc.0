Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 1D8BD1A0175
 for <openbmc@lists.ozlabs.org>; Tue,  1 Dec 2015 06:26:03 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1448905233314854.0451687905684;
 Mon, 30 Nov 2015 09:40:33 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v2] ipmid: Use updated dbus HostIpmi
 interface
Date: Mon, 30 Nov 2015 12:40:26 -0500
Message-Id: <1448905226-20144-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1448905226-20144-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1448905226-20144-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 30 Nov 2015 19:26:04 -0000

From: Jeremy Kerr <jk@ozlabs.org>

With the updated HostIpmi dbus interface, netfns are not packed with
LUNs, and the CC is separate from the data.  This means we no longer
have to define NETFN_* as arbitrarily shifted, and we have the added
bonus of replying to messages where lun != 0.

We may want to separate the CC returned from the handlers in future too.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>

ipmid: Remove assumptions about host IPMI sender objects

Currently, the IPMI daemon will only receive messages from a specific
(arbitrary) object path that the debug daemon used.

Instead, we should be listening to any signal that matches our interface
(org.openbmc.HostIpmi.ReceivedMessage). When replying to the message,
we should be using the signal sender info to properly address the
reply method.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>

fixing build break in my master
---
 ipmid-api.h | 18 +++++++++---------
 ipmid.C     |  3 ---
 2 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/ipmid-api.h b/ipmid-api.h
index 2d58961..e957ee6 100644
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
+    NETFUN_CHASSIS  =   0x00,
+    NETFUN_BRIDGE   =   0x02,
+    NETFUN_SENSOR   =   0x04,
+    NETFUN_APP      =   0x06,
+    NETFUN_FIRMWARE =   0x08,
+    NETFUN_STORAGE  =   0x0a,
     NETFUN_TRANSPORT =   0x0c,
-    NETFUN_GRPEXT    =   0x2c,
-    NETFUN_NONE      =   0x30,
-    NETFUN_OEM       =   0x32
+    NETFUN_GRPEXT   =   0x2c,
+    NETFUN_NONE     =   0x30,
+    NETFUN_OEM      =   0x32
 };
 
 // IPMI commands for net functions. Since this is to be used both by the ipmi
diff --git a/ipmid.C b/ipmid.C
index 440705c..fe989e0 100644
--- a/ipmid.C
+++ b/ipmid.C
@@ -26,10 +26,7 @@ void print_usage(void) {
   fprintf(stderr, "    mask : 0xFF - Print all trace\n");
 }
 
-
-
 const char * DBUS_INTF = "org.openbmc.HostIpmi";
-
 const char * FILTER = "type='signal',interface='org.openbmc.HostIpmi',member='ReceivedMessage'";
 
 
-- 
2.6.3
