Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 9C8EE1A0F62
 for <openbmc@lists.ozlabs.org>; Tue,  8 Dec 2015 01:58:39 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1449495035432149.19130101461712;
 Mon, 7 Dec 2015 05:30:35 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: shgoupf <shgoupf@cn.ibm.com>
Subject: [PATCH phosphor-host-ipmid 4/4] Cleanup codes for ipmid boot option
 changes.
Date: Mon,  7 Dec 2015 08:30:26 -0500
Message-Id: <1449495026-1692-5-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1449495026-1692-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1449495026-1692-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 07 Dec 2015 14:58:40 -0000

From: shgoupf <shgoupf@cn.ibm.com>

---
 chassishandler.C | 42 ++++++++++++++----------------------------
 1 file changed, 14 insertions(+), 28 deletions(-)

diff --git a/chassishandler.C b/chassishandler.C
index e69e6c3..8aba43b 100644
--- a/chassishandler.C
+++ b/chassishandler.C
@@ -8,6 +8,12 @@
 const char  *chassis_bus_name      =  "org.openbmc.control.Chassis";
 const char  *chassis_object_name   =  "/org/openbmc/control/chassis0";
 const char  *chassis_intf_name     =  "org.openbmc.control.Chassis";
+
+// Host settings in dbus
+const char  *settings_service_name =  "org.openbmc.settings.Host";
+const char  *settings_object_name  =  "/org/openbmc/settings/host0";
+const char  *settings_intf_name    =  "org.freedesktop.DBus.Properties";
+
 char* uint8_to_char(uint8_t *a, size_t size)
 {
     char* buffer;
@@ -68,14 +74,14 @@ int dbus_get_property(char* buf)
     // Signatures and input arguments are provided by the arguments at the
     // end.
     r = sd_bus_call_method(bus,
-            "org.openbmc.settings.Host",                /* service to contact */
-            "/org/openbmc/settings/host0",              /* object path */
-            "org.freedesktop.DBus.Properties",          /* interface name */
+            settings_service_name,                      /* service to contact */
+            settings_object_name,                       /* object path */
+            settings_intf_name,                         /* interface name */
             "Get",                                      /* method name */
             &error,                                     /* object to return error in */
             &m,                                         /* return message on success */
             "ss",                                       /* input signature */
-            "org.freedesktop.DBus.Properties",          /* first argument */
+            settings_intf_name,                         /* first argument */
             "boot_flags");                              /* second argument */
     if (r < 0) {
         fprintf(stderr, "Failed to issue method call: %s\n", error.message);
@@ -122,14 +128,14 @@ int dbus_set_property(const char* buf)
     // Signatures and input arguments are provided by the arguments at the
     // end.
     r = sd_bus_call_method(bus,
-            "org.openbmc.settings.Host",                /* service to contact */
-            "/org/openbmc/settings/host0",              /* object path */
-            "org.freedesktop.DBus.Properties",          /* interface name */
+            settings_service_name,                      /* service to contact */
+            settings_object_name,                       /* object path */
+            settings_intf_name,                         /* interface name */
             "Set",                                      /* method name */
             &error,                                     /* object to return error in */
             &m,                                         /* return message on success */
             "ssv",                                      /* input signature */
-            "org.freedesktop.DBus.Properties",          /* first argument */
+            settings_intf_name,                         /* first argument */
             "boot_flags",                               /* second argument */
             "s",                                        /* third argument */
             buf);                                       /* fourth argument */
@@ -343,24 +349,4 @@ void register_netfn_chassis_functions()
 
     printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_CHASSIS, IPMI_CMD_CHASSIS_CONTROL);
     ipmi_register_callback(NETFUN_CHASSIS, IPMI_CMD_CHASSIS_CONTROL, NULL, ipmi_chassis_control);
-
-    // TODO: Testing for dbus property set/get and related methods.
-    printf("----> Start of chassis handler testing.\n");
-    set_sys_boot_options_t req = {0x80, 0x10, 0xA2, 0x3B, 0x45, 0x57}; 
-    char* set_value = uint8_to_char((uint8_t*)(&(req.data1)), 5);
-    dbus_set_property(set_value);
-    char* buf = (char*)malloc(NUM_RETURN_BYTES_OF_GET_USED * 2 + 1);
-    dbus_get_property(buf);
-    uint8_t* get_value = char_to_uint8(buf, NUM_RETURN_BYTES_OF_GET_USED);
-    int i;
-    printf("buf: %s\n", (char*)buf);
-    printf("0x");
-    for (i = 0; i < 5; i++) {
-        printf("%2x", get_value[i]);
-    }
-    printf("\n");
-    printf("----> End of chassis handler testing.\n");
-    free(buf);
-    free(set_value);
-    free(get_value);
 }
-- 
2.6.3
