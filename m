Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 782B71A1A1B
 for <openbmc@lists.ozlabs.org>; Fri, 18 Dec 2015 13:50:33 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1450407026451827.3659425870646;
 Thu, 17 Dec 2015 18:50:26 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: shgoupf <shgoupf@cn.ibm.com>
Subject: [PATCH phosphor-host-ipmid v2] Add get/set ipmid command support with
 correct DBUS property handling.
Date: Thu, 17 Dec 2015 20:50:24 -0600
Message-Id: <1450407024-32509-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1450407024-32509-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1450407024-32509-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 18 Dec 2015 02:50:34 -0000

From: shgoupf <shgoupf@cn.ibm.com>

1) Two methods to handle the dbus property set and get:
    a) dbus_set_property()
    b) dbus_get_property()
2) The property is stored as a 10 character strings which representsd 5-byte information.
3) ipmid set method is registered and implemented since petitboot will use it to clear the boot options.
4) Get service name via object mapper
    a) The connection name is got via objectmapper.
    b) The method used to get the connection name is object_mapper_get_connection().
    c) dbus_get_property/dbus_set_property will get the connection name via the above method instead of hard coding.
5) Error code are properly handled.
6) Use sprinf/sscanf for int/string conversion.
    a) Instead of reinventing the wheel by defining methods converting int to string, use sprintf/sscanf should be a more clean and robust way.
---
 chassishandler.C | 302 ++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 chassishandler.h |  17 ++++
 2 files changed, 315 insertions(+), 4 deletions(-)

diff --git a/chassishandler.C b/chassishandler.C
index 1389db9..828b2bc 100644
--- a/chassishandler.C
+++ b/chassishandler.C
@@ -9,6 +9,205 @@ const char  *chassis_bus_name      =  "org.openbmc.control.Chassis";
 const char  *chassis_object_name   =  "/org/openbmc/control/chassis0";
 const char  *chassis_intf_name     =  "org.openbmc.control.Chassis";
 
+// Host settings in dbus
+// Service name should be referenced by connection name got via object mapper
+// const char  *settings_service_name =  "org.openbmc.settings.Host";
+const char  *settings_object_name  =  "/org/openbmc/settings/host0";
+const char  *settings_intf_name    =  "org.freedesktop.DBus.Properties";
+
+const char  *objmapper_service_name =  "org.openbmc.objectmapper";
+const char  *objmapper_object_name  =  "/org/openbmc/objectmapper/objectmapper";
+const char  *objmapper_intf_name    =  "org.openbmc.objectmapper.ObjectMapper";
+
+int object_mapper_get_connection(char** buf, const char* obj_path)
+{
+    sd_bus_error error = SD_BUS_ERROR_NULL;
+    sd_bus_message *m = NULL;
+    sd_bus *bus = NULL;
+    char *temp_buf = NULL, *intf = NULL;
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
+    sd_bus_message_read(m, "a{sas}", 1, &temp_buf, 1, &intf);
+    // TODO: check the return code. Currently for no reason the message
+    // parsing of object mapper is always complaining about
+    // "Device or resource busy", but the result seems OK for now. Need
+    // further checks.
+    //r = sd_bus_message_read(m, "a{sas}", 1, &temp_buf, 1, &intf);
+    //if (r < 0) {
+    //    fprintf(stderr, "Failed to parse response message: %s\n", strerror(-r));
+    //    goto finish;
+    //}
+
+    buf_size = strlen(temp_buf) + 1;
+    printf("IPMID connection name: %s\n", temp_buf);
+    *buf = (char*)malloc(buf_size);
+
+    if (*buf == NULL) {
+        fprintf(stderr, "Malloc failed for get_sys_boot_options");
+        r = -1;        
+        goto finish;
+    }
+
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
+int dbus_get_property(char* buf)
+{
+    sd_bus_error error = SD_BUS_ERROR_NULL;
+    sd_bus_message *m = NULL;
+    sd_bus *bus = NULL;
+    char* temp_buf = NULL;
+    uint8_t* get_value = NULL;
+    char* connection = NULL;
+    int r, i;
+
+    r = object_mapper_get_connection(&connection, settings_object_name);
+    if (r < 0) {
+        fprintf(stderr, "Failed to get connection, return value: %d.\n", r);
+        goto finish;
+    }
+
+    printf("connection: %s\n", connection);
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
+            connection,                                 /* service to contact */
+            settings_object_name,                       /* object path */
+            settings_intf_name,                         /* interface name */
+            "Get",                                      /* method name */
+            &error,                                     /* object to return error in */
+            &m,                                         /* return message on success */
+            "ss",                                       /* input signature */
+            settings_intf_name,                         /* first argument */
+            "boot_flags");                              /* second argument */
+
+    if (r < 0) {
+        fprintf(stderr, "Failed to issue method call: %s\n", error.message);
+        goto finish;
+    }
+
+    // The output should be parsed exactly the same as the output formatting
+    // specified.
+    r = sd_bus_message_read(m, "v", "s", &temp_buf);
+    if (r < 0) {
+        fprintf(stderr, "Failed to parse response message: %s\n", strerror(-r));
+        goto finish;
+    }
+
+    printf("IPMID boot option property get: {%s}.\n", (char*) temp_buf);
+
+    memcpy(buf, temp_buf, 2*NUM_RETURN_BYTES_OF_GET_USED + 1);
+
+finish:
+    sd_bus_error_free(&error);
+    sd_bus_message_unref(m);
+    sd_bus_unref(bus);
+    free(connection);
+
+    return r;
+}
+
+int dbus_set_property(const char* buf)
+{
+    sd_bus_error error = SD_BUS_ERROR_NULL;
+    sd_bus_message *m = NULL;
+    sd_bus *bus = NULL;
+    char* connection = NULL;
+    int r;
+
+    r = object_mapper_get_connection(&connection, settings_object_name);
+    if (r < 0) {
+        fprintf(stderr, "Failed to get connection, return value: %d.\n", r);
+        goto finish;
+    }
+    printf("connection: %s\n", connection);
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
+            connection,                                 /* service to contact */
+            settings_object_name,                       /* object path */
+            settings_intf_name,                         /* interface name */
+            "Set",                                      /* method name */
+            &error,                                     /* object to return error in */
+            &m,                                         /* return message on success */
+            "ssv",                                      /* input signature */
+            settings_intf_name,                         /* first argument */
+            "boot_flags",                               /* second argument */
+            "s",                                        /* third argument */
+            buf);                                       /* fourth argument */
+
+    if (r < 0) {
+        fprintf(stderr, "Failed to issue method call: %s\n", error.message);
+        goto finish;
+    }
+
+    printf("IPMID boot option property set: {%s}.\n", buf);
+
+finish:
+    sd_bus_error_free(&error);
+    sd_bus_message_unref(m);
+    sd_bus_unref(bus);
+    free(connection);
+
+    return r;
+}
+
 void register_netfn_chassis_functions() __attribute__((constructor));
 
 struct get_sys_boot_options_t {
@@ -17,6 +216,23 @@ struct get_sys_boot_options_t {
     uint8_t block;
 }  __attribute__ ((packed));
 
+struct set_sys_boot_options_t {
+    uint8_t parameter;
+    union {
+        struct {
+            uint8_t d1;
+            uint8_t d2;
+            uint8_t d3;
+            uint8_t d4;
+            uint8_t d5;
+            uint8_t d6;
+            uint8_t d7;
+            uint8_t d8;
+        } data8;
+        uint64_t data64;
+    } data;
+}  __attribute__ ((packed));
+
 ipmi_ret_t ipmi_chassis_wildcard(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
                               ipmi_request_t request, ipmi_response_t response, 
                               ipmi_data_len_t data_len, ipmi_context_t context)
@@ -116,16 +332,41 @@ ipmi_ret_t ipmi_chassis_get_sys_boot_options(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 
     get_sys_boot_options_t *reqptr = (get_sys_boot_options_t*) request;
 
-    // TODO Return default values to OPAL until dbus interface is available
+    char* buf = (char*)malloc(NUM_RETURN_BYTES_OF_GET*2 + 1);
+
+    if (buf == NULL) {
+        fprintf(stderr, "Malloc failed for get_sys_boot_options.\n");
+        return IPMI_OUT_OF_SPACE;        
+    }
+
+    // Init the buffer to all zero.
+    memset(buf, 0, NUM_RETURN_BYTES_OF_GET*2 + 1);
 
     if (reqptr->parameter == 5) // Parameter #5
     {
-        uint8_t buf[] = {0x1,0x5,80,0,0,0,0};
-        *data_len = sizeof(buf);
-        memcpy(response, &buf, *data_len);
+        int r = dbus_get_property(buf);
+
+        if (r < 0) {
+            fprintf(stderr, "Dbus get property failed for get_sys_boot_options.\n");
+            return IPMI_OUT_OF_SPACE;        
+        }
+
+        uint64_t return_value;
+        sscanf(buf, "%llX", &return_value);
+
+        *data_len = NUM_RETURN_BYTES_OF_GET;
+        // TODO: last 3 bytes
+        // (NUM_RETURN_BYTES_OF_GET - NUM_RETURN_BYTES_OF_GET_USED) is meanlingless
+        memcpy(response, (uint8_t*)(&return_value), *data_len);
+        free(buf);
     }
     else
     {
+        *data_len = NUM_RETURN_BYTES_OF_GET;
+        // 0x80: parameter not supported
+        buf[0] = 0x80;
+        memcpy(response, buf, *data_len);
+        free(buf);
         fprintf(stderr, "Unsupported parameter 0x%x\n", reqptr->parameter);
         return IPMI_CC_PARM_NOT_SUPPORTED;        
     }
@@ -133,6 +374,56 @@ ipmi_ret_t ipmi_chassis_get_sys_boot_options(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     return rc;
 }
 
+ipmi_ret_t ipmi_chassis_set_sys_boot_options(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
+                              ipmi_request_t request, ipmi_response_t response, 
+                              ipmi_data_len_t data_len, ipmi_context_t context)
+{
+    ipmi_ret_t rc = IPMI_CC_OK;
+
+    printf("IPMI SET_SYS_BOOT_OPTIONS\n");
+    printf("IPMID set command required return bytes: %i\n", *data_len);
+
+    set_sys_boot_options_t *reqptr = (set_sys_boot_options_t*) request;
+
+    char* output_buf = (char*)malloc(NUM_RETURN_BYTES_OF_SET);
+
+    if (output_buf == NULL) {
+        fprintf(stderr, "Malloc failed for set_sys_boot_options.\n");
+        return IPMI_OUT_OF_SPACE;        
+    }
+
+    if (reqptr->parameter == 5) // Parameter #5
+    {
+        char input_buf[NUM_INPUT_BYTES_OF_SET*2 + 1];
+        sprintf(input_buf, "%llX", reqptr->data.data64);
+
+        int r = dbus_set_property(input_buf);
+
+        if (r < 0) {
+            fprintf(stderr, "Dbus set property failed for set_sys_boot_options.\n");
+            return IPMI_OUT_OF_SPACE;        
+        }
+
+        *data_len = NUM_RETURN_BYTES_OF_SET;
+        // 0x0: return code OK.
+        output_buf[0] = 0x0;
+        memcpy(response, output_buf, *data_len);
+        free(output_buf);
+    }
+    else
+    {
+        // 0x80: parameter not supported
+        output_buf[0] = 0x80;
+        memcpy(response, output_buf, *data_len);
+        free(output_buf);
+        fprintf(stderr, "Unsupported parameter 0x%x\n", reqptr->parameter);
+        return IPMI_CC_PARM_NOT_SUPPORTED;        
+    }
+
+    return rc;
+}
+
+
 void register_netfn_chassis_functions()
 {
     printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_CHASSIS, IPMI_CMD_WILDCARD);
@@ -141,6 +432,9 @@ void register_netfn_chassis_functions()
     printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_CHASSIS, IPMI_CMD_GET_SYS_BOOT_OPTIONS);
     ipmi_register_callback(NETFUN_CHASSIS, IPMI_CMD_GET_SYS_BOOT_OPTIONS, NULL, ipmi_chassis_get_sys_boot_options);
 
+    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_CHASSIS, IPMI_CMD_SET_SYS_BOOT_OPTIONS);
+    ipmi_register_callback(NETFUN_CHASSIS, IPMI_CMD_SET_SYS_BOOT_OPTIONS, NULL, ipmi_chassis_set_sys_boot_options);
+
     printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_CHASSIS, IPMI_CMD_CHASSIS_CONTROL);
     ipmi_register_callback(NETFUN_CHASSIS, IPMI_CMD_CHASSIS_CONTROL, NULL, ipmi_chassis_control);
 }
diff --git a/chassishandler.h b/chassishandler.h
index 1a26411..4676667 100644
--- a/chassishandler.h
+++ b/chassishandler.h
@@ -3,12 +3,22 @@
 
 #include <stdint.h>
 
+// TODO: Petitboot requires 8 bytes of response
+// however only 5 of them are used. The remaining
+// 3 bytes are not used in petitboot and the value
+// of them are all zero.
+#define NUM_RETURN_BYTES_OF_GET 8
+#define NUM_RETURN_BYTES_OF_GET_USED 5
+#define NUM_RETURN_BYTES_OF_SET 1
+#define NUM_INPUT_BYTES_OF_SET 5
+
 // IPMI commands for Chassis net functions.
 enum ipmi_netfn_app_cmds
 {
 	// Chassis Control
 	IPMI_CMD_CHASSIS_CONTROL	  = 0x02,
     // Get capability bits
+    IPMI_CMD_SET_SYS_BOOT_OPTIONS = 0x08,
     IPMI_CMD_GET_SYS_BOOT_OPTIONS = 0x09,
 };
 
@@ -18,6 +28,13 @@ enum ipmi_chassis_return_codes
     IPMI_CC_PARM_NOT_SUPPORTED = 0x80,
 };
 
+// Generic completion codes,
+// see IPMI doc section 5.2
+enum ipmi_generic_return_codes
+{
+    IPMI_OUT_OF_SPACE = 0xC4,
+};
+
 // Various Chassis operations under a single command.
 enum ipmi_chassis_control_cmds : uint8_t
 {
-- 
2.6.3
