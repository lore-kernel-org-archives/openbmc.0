Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 50AB91A113F
 for <openbmc@lists.ozlabs.org>; Wed, 16 Dec 2015 09:21:09 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1450218061543166.68482738665284;
 Tue, 15 Dec 2015 14:21:01 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: shgoupf <shgoupf@cn.ibm.com>
Subject: [PATCH phosphor-host-ipmid v2 5/5] Get service name via object mapper
Date: Tue, 15 Dec 2015 16:20:57 -0600
Message-Id: <1450218057-12167-6-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1450218057-12167-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1450218057-12167-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 15 Dec 2015 22:21:09 -0000

From: shgoupf <shgoupf@cn.ibm.com>

---
 chassishandler.C | 71 +++++++++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 68 insertions(+), 3 deletions(-)

diff --git a/chassishandler.C b/chassishandler.C
index 8aba43b..35b5086 100644
--- a/chassishandler.C
+++ b/chassishandler.C
@@ -10,10 +10,15 @@ const char  *chassis_object_name   =  "/org/openbmc/control/chassis0";
 const char  *chassis_intf_name     =  "org.openbmc.control.Chassis";
 
 // Host settings in dbus
-const char  *settings_service_name =  "org.openbmc.settings.Host";
+// Service name should be referenced by connection name got via object mapper
+// const char  *settings_service_name =  "org.openbmc.settings.Host";
 const char  *settings_object_name  =  "/org/openbmc/settings/host0";
 const char  *settings_intf_name    =  "org.freedesktop.DBus.Properties";
 
+const char  *objmapper_service_name =  "org.openbmc.objectmapper";
+const char  *objmapper_object_name  =  "/org/openbmc/objectmapper/objectmapper";
+const char  *objmapper_intf_name    =  "org.openbmc.objectmapper.ObjectMapper";
+
 char* uint8_to_char(uint8_t *a, size_t size)
 {
     char* buffer;
@@ -52,6 +57,57 @@ uint8_t* char_to_uint8(char *a, size_t size)
     return buffer;
 }
 
+int object_mapper_get_connection(char** buf, const char* obj_path)
+{
+    sd_bus_error error = SD_BUS_ERROR_NULL;
+    sd_bus_message *m = NULL;
+    sd_bus *bus = NULL;
+    char* temp_buf = NULL;
+    size_t buf_size = 0;
+    int r;
+
+    // Open the system bus where most system services are provided. 
+    r = sd_bus_open_system(&bus);
+    if (r < 0) {
+        fprintf(stderr, "Failed to connect to system bus: %s\n", strerror(-r));
+        goto finish;
+    }
+
+    // Bus, service, object path, interface and method are provided to call
+    // the method. 
+    // Signatures and input arguments are provided by the arguments at the
+    // end.
+    r = sd_bus_call_method(bus,
+            objmapper_service_name,                      /* service to contact */
+            objmapper_object_name,                       /* object path */
+            objmapper_intf_name,                         /* interface name */
+            "GetObject",                                 /* method name */
+            &error,                                      /* object to return error in */
+            &m,                                          /* return message on success */
+            "s",                                         /* input signature */
+            obj_path                                     /* first argument */
+            );
+
+    if (r < 0) {
+        fprintf(stderr, "Failed to issue method call: %s\n", error.message);
+        goto finish;
+    }
+
+    // Get the key, aka, the connection name
+    r = sd_bus_message_read(m, "a{sas}", 1, &temp_buf);
+    buf_size = strlen(temp_buf) + 1;
+    printf("IPMID connection name: %s\n", temp_buf);
+    *buf = (char*)malloc(buf_size);
+    memcpy(*buf, temp_buf, buf_size);
+
+finish:
+    sd_bus_error_free(&error);
+    sd_bus_message_unref(m);
+    sd_bus_unref(bus);
+
+    return r;
+}
+
 // TODO: object mapper should be used instead of hard-coding.
 int dbus_get_property(char* buf)
 {
@@ -60,6 +116,7 @@ int dbus_get_property(char* buf)
     sd_bus *bus = NULL;
     char* temp_buf = NULL;
     uint8_t* get_value = NULL;
+    char* connection = NULL;
     int r, i;
 
     // Open the system bus where most system services are provided. 
@@ -69,12 +126,14 @@ int dbus_get_property(char* buf)
         goto finish;
     }
 
+    object_mapper_get_connection(&connection, settings_object_name);
+    printf("connection: %s\n", connection);
     // Bus, service, object path, interface and method are provided to call
     // the method. 
     // Signatures and input arguments are provided by the arguments at the
     // end.
     r = sd_bus_call_method(bus,
-            settings_service_name,                      /* service to contact */
+            connection,                                 /* service to contact */
             settings_object_name,                       /* object path */
             settings_intf_name,                         /* interface name */
             "Get",                                      /* method name */
@@ -83,6 +142,7 @@ int dbus_get_property(char* buf)
             "ss",                                       /* input signature */
             settings_intf_name,                         /* first argument */
             "boot_flags");                              /* second argument */
+
     if (r < 0) {
         fprintf(stderr, "Failed to issue method call: %s\n", error.message);
         goto finish;
@@ -104,6 +164,7 @@ finish:
     sd_bus_error_free(&error);
     sd_bus_message_unref(m);
     sd_bus_unref(bus);
+    free(connection);
 
     return r;
 }
@@ -114,6 +175,7 @@ int dbus_set_property(const char* buf)
     sd_bus_error error = SD_BUS_ERROR_NULL;
     sd_bus_message *m = NULL;
     sd_bus *bus = NULL;
+    char* connection = NULL;
     int r;
 
     // Open the system bus where most system services are provided. 
@@ -123,12 +185,14 @@ int dbus_set_property(const char* buf)
         goto finish;
     }
 
+    object_mapper_get_connection(&connection, settings_object_name);
+    printf("connection: %s\n", connection);
     // Bus, service, object path, interface and method are provided to call
     // the method. 
     // Signatures and input arguments are provided by the arguments at the
     // end.
     r = sd_bus_call_method(bus,
-            settings_service_name,                      /* service to contact */
+            connection,                                 /* service to contact */
             settings_object_name,                       /* object path */
             settings_intf_name,                         /* interface name */
             "Set",                                      /* method name */
@@ -151,6 +215,7 @@ finish:
     sd_bus_error_free(&error);
     sd_bus_message_unref(m);
     sd_bus_unref(bus);
+    free(connection);
 
     return r;
 }
-- 
2.6.3
