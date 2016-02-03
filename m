Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 38DC71A0CB5
 for <openbmc@lists.ozlabs.org>; Thu,  4 Feb 2016 10:40:33 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1454542829661303.418139585767;
 Wed, 3 Feb 2016 15:40:29 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid] Add Set MAC address
Date: Wed,  3 Feb 2016 17:40:28 -0600
Message-Id: <1454542828-19634-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1454542828-19634-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1454542828-19634-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Wed, 03 Feb 2016 23:40:33 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

Add Set MAC address parameter command
---
 transporthandler.C | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/transporthandler.C b/transporthandler.C
index dac8fe8..c38adea 100644
--- a/transporthandler.C
+++ b/transporthandler.C
@@ -14,6 +14,7 @@
 #endif
 
 // OpenBMC System Manager dbus framework
+extern sd_bus *bus;
 const char  *app   =  "org.openbmc.NetworkManager";
 const char  *obj   =  "/org/openbmc/NetworkManager/Interface";
 const char  *ifc   =  "org.openbmc.NetworkManager";
@@ -64,6 +65,37 @@ ipmi_ret_t ipmi_transport_set_lan(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     {
         sprintf(new_ipaddr, "%d.%d.%d.%d", reqptr->data[0], reqptr->data[1], reqptr->data[2], reqptr->data[3]);
     }
+    else if (reqptr->parameter == 5) // MAC
+    {
+        char                mac[18];
+        sd_bus_message *reply = NULL, *m = NULL;
+        sd_bus_error error = SD_BUS_ERROR_NULL;
+        int r = 0;
+
+        sprintf(mac, "%x:%x:%x:%x:%x:%x",
+                reqptr->data[0],
+                reqptr->data[1],
+                reqptr->data[2],
+                reqptr->data[3],
+                reqptr->data[4],
+                reqptr->data[5]);
+
+        r = sd_bus_message_new_method_call(bus,&m,app,obj,ifc,"SetHwAddress");
+        if (r < 0) {
+            fprintf(stderr, "Failed to add method object: %s\n", strerror(-r));
+            return -1;
+        }
+        r = sd_bus_message_append(m, "s", mac);
+        if (r < 0) {
+            fprintf(stderr, "Failed to append message data: %s\n", strerror(-r));
+            return -1;
+        }
+        r = sd_bus_call(bus, m, 0, &error, &reply);
+        if (r < 0) {
+            fprintf(stderr, "Failed to call method: %s\n", strerror(-r));
+            return -1;
+        }
+    }
     else if (reqptr->parameter == 6) // Subnet
     {
         sprintf(new_netmask, "%d.%d.%d.%d", reqptr->data[0], reqptr->data[1], reqptr->data[2], reqptr->data[3]);
-- 
2.6.4
