Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id D2DFD1A08ED
 for <openbmc@lists.ozlabs.org>; Fri, 23 Oct 2015 05:43:55 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1445539433441551.0345205368287;
 Thu, 22 Oct 2015 11:43:53 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid] Support to stop the watchdog
Date: Thu, 22 Oct 2015 13:43:49 -0500
Message-Id: <1445539429-24258-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445539429-24258-1-git-send-email-patches@stwcx.xyz>
References: <1445539429-24258-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 22 Oct 2015 18:43:56 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

Check the request flags for the set watchdog command to determine
if the watchdog needs to be stopped or restarted.
---
 apphandler.C | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/apphandler.C b/apphandler.C
index 9d53552..45cec19 100755
--- a/apphandler.C
+++ b/apphandler.C
@@ -134,8 +134,8 @@ ipmi_ret_t ipmi_app_set_watchdog(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
         return -1;
     }
 
-    // Start watchdog
-    r = sd_bus_message_new_method_call(bus,&m,busname,objname,iface,"start");
+    // Stop the current watchdog if any
+    r = sd_bus_message_new_method_call(bus,&m,busname,objname,iface,"stop");
     if (r < 0) {
         fprintf(stderr, "Failed to add the start method object: %s\n", strerror(-r));
         return -1;
@@ -146,6 +146,21 @@ ipmi_ret_t ipmi_app_set_watchdog(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
         return -1;
     }
 
+    // Start the watchdog if requested
+    if (reqptr->t_use & 0x40)
+    {
+        r = sd_bus_message_new_method_call(bus,&m,busname,objname,iface,"start");
+        if (r < 0) {
+            fprintf(stderr, "Failed to add the start method object: %s\n", strerror(-r));
+            return -1;
+        }
+        r = sd_bus_call(bus, m, 0, &error, &reply);
+        if (r < 0) {
+            fprintf(stderr, "Failed to call the start method: %s\n", strerror(-r));
+            return -1;
+        }
+    }
+
     sd_bus_error_free(&error);
     sd_bus_message_unref(m);
 
-- 
2.6.0
