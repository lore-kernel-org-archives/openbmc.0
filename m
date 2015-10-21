Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 1A55F1A04D4
 for <openbmc@lists.ozlabs.org>; Wed, 21 Oct 2015 23:48:47 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445431724910190.16661144270506;
 Wed, 21 Oct 2015 05:48:44 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v2 12/20] Watchdog support
Date: Wed, 21 Oct 2015 07:48:13 -0500
Message-Id: <1445431701-8681-13-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445431701-8681-1-git-send-email-patches@stwcx.xyz>
References: <1445431701-8681-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 21 Oct 2015 12:48:48 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

---
 apphandler.C | 110 ++++++++++++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 86 insertions(+), 24 deletions(-)

diff --git a/apphandler.C b/apphandler.C
index 596ec9c..9d53552 100755
--- a/apphandler.C
+++ b/apphandler.C
@@ -4,12 +4,15 @@
 #include <stdio.h>
 #include <string.h>
 #include <stdint.h>
+#include <systemd/sd-bus.h>
+
+extern sd_bus *bus;
 
 void register_netfn_app_functions() __attribute__((constructor));
 
 
-ipmi_ret_t ipmi_app_read_event(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
-                             ipmi_request_t request, ipmi_response_t response, 
+ipmi_ret_t ipmi_app_read_event(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
+                             ipmi_request_t request, ipmi_response_t response,
                              ipmi_data_len_t data_len, ipmi_context_t context)
 {
     ipmi_ret_t rc = IPMI_CC_OK;
@@ -21,8 +24,8 @@ ipmi_ret_t ipmi_app_read_event(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 }
 
 
-ipmi_ret_t ipmi_app_set_acpi_power_state(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
-                             ipmi_request_t request, ipmi_response_t response, 
+ipmi_ret_t ipmi_app_set_acpi_power_state(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
+                             ipmi_request_t request, ipmi_response_t response,
                              ipmi_data_len_t data_len, ipmi_context_t context)
 {
     ipmi_ret_t rc = IPMI_CC_OK;
@@ -32,18 +35,18 @@ ipmi_ret_t ipmi_app_set_acpi_power_state(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     return rc;
 }
 
-ipmi_ret_t ipmi_app_get_device_id(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
-                             ipmi_request_t request, ipmi_response_t response, 
+ipmi_ret_t ipmi_app_get_device_id(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
+                             ipmi_request_t request, ipmi_response_t response,
                              ipmi_data_len_t data_len, ipmi_context_t context)
 {
     ipmi_ret_t rc = IPMI_CC_OK;
 
-    // TODO GET REAL VALUES HERE....  I made these ones up because 
+    // TODO GET REAL VALUES HERE....  I made these ones up because
     // we are in bringup mode.  Version Major and Minor can be what we
-    // want like v1.03  but the IANA really should be something that 
-    // we own.  I would suggest getting the IANA from Hostboot as 
-    // long as IBM owns it then no problem.  If some other company 
-    // gave us the IANA to use then use the one we have from the 
+    // want like v1.03  but the IANA really should be something that
+    // we own.  I would suggest getting the IANA from Hostboot as
+    // long as IBM owns it then no problem.  If some other company
+    // gave us the IANA to use then use the one we have from the
     // FSP ipmi code.
     uint8_t str[] = {0x00, 0, 1, 1,2, 0xD, 0x41, 0xA7, 0x00, 0x43, 0x40};
 
@@ -56,8 +59,8 @@ ipmi_ret_t ipmi_app_get_device_id(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 }
 
 
-ipmi_ret_t ipmi_app_get_bt_capabilities(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
-                             ipmi_request_t request, ipmi_response_t response, 
+ipmi_ret_t ipmi_app_get_bt_capabilities(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
+                             ipmi_request_t request, ipmi_response_t response,
                              ipmi_data_len_t data_len, ipmi_context_t context)
 {
     printf("Handling Netfn:[0x%X], Cmd:[0x%X]\n",netfn,cmd);
@@ -88,41 +91,100 @@ struct set_wd_data_t {
 
 
 
-ipmi_ret_t ipmi_app_set_watchdog(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
-                             ipmi_request_t request, ipmi_response_t response, 
+ipmi_ret_t ipmi_app_set_watchdog(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
+                             ipmi_request_t request, ipmi_response_t response,
                              ipmi_data_len_t data_len, ipmi_context_t context)
 {
+    const char  *busname = "org.openbmc.watchdog.Host";
+    const char  *objname = "/org/openbmc/watchdog/HostWatchdog_0";
+    const char  *iface = "org.openbmc.Watchdog";
+    sd_bus_message *reply = NULL, *m = NULL;
+    sd_bus_error error = SD_BUS_ERROR_NULL;
+    int r = 0;
 
     set_wd_data_t *reqptr = (set_wd_data_t*) request;
     uint16_t timer = 0;
+    uint32_t timer_ms = 0;
     // Status code.
     ipmi_ret_t rc = IPMI_CC_OK;
 
     *data_len = 0;
 
+    // Get number of 100ms intervals
     timer = (((uint16_t)reqptr->ms) << 8) + reqptr->ls;
+    // Get timer value in ms
+    timer_ms = timer * 100;
 
     printf("WATCHDOG SET Timer:[0x%X] 100ms intervals\n",timer);
 
-    // TODO: Right here is where we would call some dbus method as a timer.
-    // If the timer expires it would iniate a reboot of the host.
+    // Set watchdog timer
+    r = sd_bus_message_new_method_call(bus,&m,busname,objname,iface,"set");
+    if (r < 0) {
+        fprintf(stderr, "Failed to add the set method object: %s\n", strerror(-r));
+        return -1;
+    }
+    r = sd_bus_message_append(m, "i", timer_ms);
+    if (r < 0) {
+        fprintf(stderr, "Failed to add timer value: %s\n", strerror(-r));
+        return -1;
+    }
+    r = sd_bus_call(bus, m, 0, &error, &reply);
+    if (r < 0) {
+        fprintf(stderr, "Failed to call the set method: %s\n", strerror(-r));
+        return -1;
+    }
+
+    // Start watchdog
+    r = sd_bus_message_new_method_call(bus,&m,busname,objname,iface,"start");
+    if (r < 0) {
+        fprintf(stderr, "Failed to add the start method object: %s\n", strerror(-r));
+        return -1;
+    }
+    r = sd_bus_call(bus, m, 0, &error, &reply);
+    if (r < 0) {
+        fprintf(stderr, "Failed to call the start method: %s\n", strerror(-r));
+        return -1;
+    }
+
+    sd_bus_error_free(&error);
+    sd_bus_message_unref(m);
 
     return rc;
 }
 
 
-ipmi_ret_t ipmi_app_reset_watchdog(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
-                             ipmi_request_t request, ipmi_response_t response, 
+ipmi_ret_t ipmi_app_reset_watchdog(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
+                             ipmi_request_t request, ipmi_response_t response,
                              ipmi_data_len_t data_len, ipmi_context_t context)
 {
+    const char  *busname = "org.openbmc.watchdog.Host";
+    const char  *objname = "/org/openbmc/watchdog/HostWatchdog_0";
+    const char  *iface = "org.openbmc.Watchdog";
+    sd_bus_message *reply = NULL, *m = NULL;
+    sd_bus_error error = SD_BUS_ERROR_NULL;
+    int r = 0;
+
     // Status code.
     ipmi_ret_t rc = IPMI_CC_OK;
     *data_len = 0;
 
     printf("WATCHDOG RESET\n");
-    // TODO Right here is where we would call some sdbus timer.
-    // If your are experiencing dejavu you are right.  the
-    // set and the reset do similar things
+
+    // Refresh watchdog
+    r = sd_bus_message_new_method_call(bus,&m,busname,objname,iface,"poke");
+    if (r < 0) {
+        fprintf(stderr, "Failed to add the method object: %s\n", strerror(-r));
+        return -1;
+    }
+    r = sd_bus_call(bus, m, 0, &error, &reply);
+    if (r < 0) {
+        fprintf(stderr, "Failed to call the method: %s\n", strerror(-r));
+        return -1;
+    }
+
+    sd_bus_error_free(&error);
+    sd_bus_message_unref(m);
+
     return rc;
 }
 
@@ -130,8 +192,8 @@ ipmi_ret_t ipmi_app_reset_watchdog(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 
 
 
-ipmi_ret_t ipmi_app_wildcard_handler(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
-                              ipmi_request_t request, ipmi_response_t response, 
+ipmi_ret_t ipmi_app_wildcard_handler(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
+                              ipmi_request_t request, ipmi_response_t response,
                               ipmi_data_len_t data_len, ipmi_context_t context)
 {
     printf("Handling WILDCARD Netfn:[0x%X], Cmd:[0x%X]\n",netfn, cmd);
-- 
2.6.0
