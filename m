Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 854871A0D36
 for <openbmc@lists.ozlabs.org>; Fri,  6 Nov 2015 16:21:52 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1446787309287692.242580789074;
 Thu, 5 Nov 2015 21:21:49 -0800 (PST)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid] Get UUID from dbus property instead of
 method
Date: Thu,  5 Nov 2015 23:21:46 -0600
Message-Id: <1446787306-16828-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1446787306-16828-1-git-send-email-patches@stwcx.xyz>
References: <1446787306-16828-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 06 Nov 2015 05:21:53 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

On the dbus side, the UUID was moved to being a property, and
the GetID method was removed. So need to update the IPMI side
to read the property value instead of calling the GetID method.
---
 apphandler.C | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/apphandler.C b/apphandler.C
index 5d81fb4..6467397 100644
--- a/apphandler.C
+++ b/apphandler.C
@@ -61,7 +61,8 @@ ipmi_ret_t ipmi_app_get_device_guid(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 {
     const char  *busname = "org.openbmc.control.Chassis";
     const char  *objname = "/org/openbmc/control/chassis0";
-    const char  *iface = "org.openbmc.control.Chassis";
+    const char  *iface = "org.freedesktop.DBus.Properties";
+    const char  *chassis_iface = "org.openbmc.control.Chassis";
     sd_bus_message *reply = NULL, *m = NULL;
     sd_bus_error error = SD_BUS_ERROR_NULL;
     int r = 0;
@@ -73,17 +74,23 @@ ipmi_ret_t ipmi_app_get_device_guid(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 
     printf("IPMI GET DEVICE GUID\n");
 
-    r = sd_bus_message_new_method_call(bus,&m,busname,objname,iface,"getID");
+    // Call Get properties method with the interface and property name
+    r = sd_bus_message_new_method_call(bus,&m,busname,objname,iface,"Get");
     if (r < 0) {
-        fprintf(stderr, "Failed to add the start method object: %s\n", strerror(-r));
+        fprintf(stderr, "Failed to add the Get method object: %s\n", strerror(-r));
         return IPMI_CC_UNSPECIFIED_ERROR;
     }
+    r = sd_bus_message_append(m, "ss", chassis_iface, "uuid");
+    if (r < 0) {
+        fprintf(stderr, "Failed to append arguments: %s\n", strerror(-r));
+        return -1;
+    }
     r = sd_bus_call(bus, m, 0, &error, &reply);
     if (r < 0) {
-        fprintf(stderr, "Failed to call the start method: %s\n", strerror(-r));
+        fprintf(stderr, "Failed to call the Get method: %s\n", strerror(-r));
         return IPMI_CC_UNSPECIFIED_ERROR;
     }
-    r = sd_bus_message_read(reply, "s", &uuid);
+    r = sd_bus_message_read(reply, "v", "s", &uuid);
     if (r < 0) {
         fprintf(stderr, "Failed to get a response: %s", strerror(-r));
         return IPMI_CC_RESPONSE_ERROR;
-- 
2.6.0
