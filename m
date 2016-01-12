Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id F142B1A0E54
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2016 14:00:38 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1452567633017954.3524512633883;
 Mon, 11 Jan 2016 19:00:33 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: shgoupf <shgoupf@cn.ibm.com>
Subject: [PATCH phosphor-host-ipmid v8] Add get/set boot option ipmid command
 support with correct DBUS property handling.
Date: Mon, 11 Jan 2016 21:00:31 -0600
Message-Id: <1452567631-31818-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1452567631-31818-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1452567631-31818-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 12 Jan 2016 03:00:39 -0000

From: shgoupf <shgoupf@cn.ibm.com>

1) Add support for IPMI get/set boot option command.
    a) boot options stored in dbus property.
    b) IPMI get boot option command get boot option from the dbus
    property.
    c) IPMI set boot option coomand set boot option to the dbus
    property.
2) Two methods to handle the dbus property set and get:
    a) dbus_set_property()
    b) dbus_get_property()
3) The property is stored as a 10 character strings which representsd 5-byte information.
4) ipmid set method is registered and implemented since petitboot will use it to clear the boot options.
5) Get service name via object mapper
    a) The connection name is got via objectmapper.
    b) The method used to get the connection name is object_mapper_get_connection().
    c) dbus_get_property/dbus_set_property will get the connection name via the above method instead of hard coding.
---
 chassishandler.C | 316 +++++++++++++++++++++++++++++++++++++++++++++++++++++--
 chassishandler.h |  18 ++++
 2 files changed, 326 insertions(+), 8 deletions(-)

diff --git a/chassishandler.C b/chassishandler.C
index 1389db9..cc200f6 100644
--- a/chassishandler.C
+++ b/chassishandler.C
@@ -11,12 +11,235 @@ const char  *chassis_intf_name     =  "org.openbmc.control.Chassis";
 
 void register_netfn_chassis_functions() __attribute__((constructor));
 
+// Host settings in dbus
+// Service name should be referenced by connection name got via object mapper
+const char *settings_object_name  =  "/org/openbmc/settings/host0";
+const char *settings_intf_name    =  "org.freedesktop.DBus.Properties";
+
+const char *objmapper_service_name =  "org.openbmc.objectmapper";
+const char *objmapper_object_name  =  "/org/openbmc/objectmapper/objectmapper";
+const char *objmapper_intf_name    =  "org.openbmc.objectmapper.ObjectMapper";
+
+int object_mapper_get_connection(char **buf, const char *obj_path)
+{
+    sd_bus_error error = SD_BUS_ERROR_NULL;
+    sd_bus_message *m = NULL;
+    sd_bus *bus = NULL;
+    char *temp_buf = NULL, *intf = NULL;
+    size_t buf_size = 0;
+    int r;
+
+    // Get the system bus where most system services are provided.
+    bus = ipmid_get_sd_bus_connection();
+
+    /*
+     * Bus, service, object path, interface and method are provided to call
+     * the method.
+     * Signatures and input arguments are provided by the arguments at the
+     * end.
+     */
+    r = sd_bus_call_method(bus,
+                           objmapper_service_name,                      /* service to contact */
+                           objmapper_object_name,                       /* object path */
+                           objmapper_intf_name,                         /* interface name */
+                           "GetObject",                                 /* method name */
+                           &error,                                      /* object to return error in */
+                           &m,                                          /* return message on success */
+                           "s",                                         /* input signature */
+                           obj_path                                     /* first argument */
+                          );
+
+    if (r < 0) {
+        fprintf(stderr, "Failed to issue method call: %s\n", error.message);
+        goto finish;
+    }
+
+    // Get the key, aka, the connection name
+    sd_bus_message_read(m, "a{sas}", 1, &temp_buf, 1, &intf);
+
+    /*
+     * TODO: check the return code. Currently for no reason the message
+     * parsing of object mapper is always complaining about
+     * "Device or resource busy", but the result seems OK for now. Need
+     * further checks.
+     * TODO: The following code is preserved in the comments so that it can be
+     * resumed after the problem aforementioned is resolved.
+     *r = sd_bus_message_read(m, "a{sas}", 1, &temp_buf, 1, &intf);
+     *if (r < 0) {
+     *    fprintf(stderr, "Failed to parse response message: %s\n", strerror(-r));
+     *    goto finish;
+     *}
+     */
+
+    buf_size = strlen(temp_buf) + 1;
+    printf("IPMID connection name: %s\n", temp_buf);
+    *buf = (char *)malloc(buf_size);
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
+
+    return r;
+}
+
+int dbus_get_property(char *buf)
+{
+    sd_bus_error error = SD_BUS_ERROR_NULL;
+    sd_bus_message *m = NULL;
+    sd_bus *bus = NULL;
+    char *temp_buf = NULL;
+    uint8_t *get_value = NULL;
+    char *connection = NULL;
+    int r, i;
+
+    r = object_mapper_get_connection(&connection, settings_object_name);
+
+    if (r < 0) {
+        fprintf(stderr, "Failed to get connection, return value: %d.\n", r);
+        goto finish;
+    }
+
+    printf("connection: %s\n", connection);
+
+    // Get the system bus where most system services are provided.
+    bus = ipmid_get_sd_bus_connection();
+
+    /*
+     * Bus, service, object path, interface and method are provided to call
+     * the method.
+     * Signatures and input arguments are provided by the arguments at the
+     * end.
+     */
+    r = sd_bus_call_method(bus,
+                           connection,                                 /* service to contact */
+                           settings_object_name,                       /* object path */
+                           settings_intf_name,                         /* interface name */
+                           "Get",                                      /* method name */
+                           &error,                                     /* object to return error in */
+                           &m,                                         /* return message on success */
+                           "ss",                                       /* input signature */
+                           settings_intf_name,                         /* first argument */
+                           "boot_flags");                              /* second argument */
+
+    if (r < 0) {
+        fprintf(stderr, "Failed to issue method call: %s\n", error.message);
+        goto finish;
+    }
+
+    /*
+     * The output should be parsed exactly the same as the output formatting
+     * specified.
+     */
+    r = sd_bus_message_read(m, "v", "s", &temp_buf);
+
+    if (r < 0) {
+        fprintf(stderr, "Failed to parse response message: %s\n", strerror(-r));
+        goto finish;
+    }
+
+    printf("IPMID boot option property get: {%s}.\n", (char *) temp_buf);
+
+    /*
+     * To represent a hex in string, e.g., "A0A0", which represents two bytes
+     * in the hex, but requires 5 bytes to store it as string, i.e., 4
+     * characters to store the "A0A0" and 1 additional space for "\0".
+     * Thereby we have 2 * <number of bytes> + 1 for the string buffer.
+     */
+    memcpy(buf, temp_buf, 2 * NUM_RETURN_BYTES_OF_GET_USED + 1);
+
+finish:
+    sd_bus_error_free(&error);
+    sd_bus_message_unref(m);
+    free(connection);
+
+    return r;
+}
+
+int dbus_set_property(const char *buf)
+{
+    sd_bus_error error = SD_BUS_ERROR_NULL;
+    sd_bus_message *m = NULL;
+    sd_bus *bus = NULL;
+    char *connection = NULL;
+    int r;
+
+    r = object_mapper_get_connection(&connection, settings_object_name);
+
+    if (r < 0) {
+        fprintf(stderr, "Failed to get connection, return value: %d.\n", r);
+        goto finish;
+    }
+
+    printf("connection: %s\n", connection);
+
+    // Get the system bus where most system services are provided.
+    bus = ipmid_get_sd_bus_connection();
+
+    /*
+     * Bus, service, object path, interface and method are provided to call
+     * the method.
+     * Signatures and input arguments are provided by the arguments at the
+     * end.
+     */
+    r = sd_bus_call_method(bus,
+                           connection,                                 /* service to contact */
+                           settings_object_name,                       /* object path */
+                           settings_intf_name,                         /* interface name */
+                           "Set",                                      /* method name */
+                           &error,                                     /* object to return error in */
+                           &m,                                         /* return message on success */
+                           "ssv",                                      /* input signature */
+                           settings_intf_name,                         /* first argument */
+                           "boot_flags",                               /* second argument */
+                           "s",                                        /* third argument */
+                           buf);                                       /* fourth argument */
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
+    free(connection);
+
+    return r;
+}
+
 struct get_sys_boot_options_t {
     uint8_t parameter;
     uint8_t set;
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
@@ -116,16 +339,89 @@ ipmi_ret_t ipmi_chassis_get_sys_boot_options(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 
     get_sys_boot_options_t *reqptr = (get_sys_boot_options_t*) request;
 
-    // TODO Return default values to OPAL until dbus interface is available
+    /*
+     * To represent a hex in string, e.g., "A0A0", which represents two bytes
+     * in the hex, but requires 5 bytes to store it as string, i.e., 4
+     * characters to store the "A0A0" and 1 additional space for "\0".
+     * Thereby we have 2 * <number of bytes> + 1 for the string buffer.
+     */
+    char buf[NUM_RETURN_BYTES_OF_GET * 2 + 1] = {0};
+
+    /*
+     * Parameter #5 means boot flags. Please refer to 28.13 of ipmi doc.
+     * This is the only parameter used by petitboot.
+     */
+    if (reqptr->parameter == 5) {
+        int r = dbus_get_property(buf);
+
+        if (r < 0) {
+            fprintf(stderr, "Dbus get property failed for get_sys_boot_options.\n");
+            return IPMI_OUT_OF_SPACE;
+        }
 
-    if (reqptr->parameter == 5) // Parameter #5
-    {
-        uint8_t buf[] = {0x1,0x5,80,0,0,0,0};
-        *data_len = sizeof(buf);
-        memcpy(response, &buf, *data_len);
+        uint64_t return_value;
+        sscanf(buf, "%" PRIx64, &return_value);
+
+        *data_len = NUM_RETURN_BYTES_OF_GET;
+        /*
+         * TODO: last 3 bytes
+         *(NUM_RETURN_BYTES_OF_GET - NUM_RETURN_BYTES_OF_GET_USED) is meanlingless
+         */
+        memcpy(response, (uint8_t *)(&return_value), *data_len);
+    } else {
+        *data_len = NUM_RETURN_BYTES_OF_GET;
+        // Parameter not supported
+        buf[0] = IPMI_CC_PARM_NOT_SUPPORTED;
+        memcpy(response, buf, *data_len);
+        fprintf(stderr, "Unsupported parameter 0x%x\n", reqptr->parameter);
+        return IPMI_CC_PARM_NOT_SUPPORTED;
     }
-    else
-    {
+
+    return rc;
+}
+
+ipmi_ret_t ipmi_chassis_set_sys_boot_options(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
+                              ipmi_request_t request, ipmi_response_t response,
+                              ipmi_data_len_t data_len, ipmi_context_t context)
+{
+    ipmi_ret_t rc = IPMI_CC_OK;
+
+    printf("IPMI SET_SYS_BOOT_OPTIONS\n");
+
+    set_sys_boot_options_t *reqptr = (set_sys_boot_options_t *) request;
+
+    char output_buf[NUM_RETURN_BYTES_OF_SET] = {0};
+
+    /*
+     * Parameter #5 means boot flags. Please refer to 28.13 of ipmi doc.
+     * This is the only parameter used by petitboot.
+     */
+    if (reqptr->parameter == 5) {
+        /*
+         * To represent a hex in string, e.g., "A0A0", which represents two bytes
+         * in the hex, but requires 5 bytes to store it as string, i.e., 4
+         * characters to store the "A0A0" and 1 additional space for "\0".
+         * Thereby we have 2 * <number of bytes> + 1 for the string buffer.
+         */
+        int buf_size = NUM_INPUT_BYTES_OF_SET * 2 + 1;
+        char input_buf[buf_size];
+        snprintf(input_buf, buf_size, "%" PRIx64, reqptr->data.data64);
+
+        int r = dbus_set_property(input_buf);
+
+        if (r < 0) {
+            fprintf(stderr, "Dbus set property failed for set_sys_boot_options.\n");
+            return IPMI_OUT_OF_SPACE;
+        }
+
+        *data_len = NUM_RETURN_BYTES_OF_SET;
+        // Return code OK.
+        output_buf[0] = IPMI_OK;
+        memcpy(response, output_buf, *data_len);
+    } else {
+        // Parameter not supported
+        output_buf[0] = IPMI_CC_PARM_NOT_SUPPORTED;
+        memcpy(response, output_buf, *data_len);
         fprintf(stderr, "Unsupported parameter 0x%x\n", reqptr->parameter);
         return IPMI_CC_PARM_NOT_SUPPORTED;        
     }
@@ -143,4 +439,8 @@ void register_netfn_chassis_functions()
 
     printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_CHASSIS, IPMI_CMD_CHASSIS_CONTROL);
     ipmi_register_callback(NETFUN_CHASSIS, IPMI_CMD_CHASSIS_CONTROL, NULL, ipmi_chassis_control);
+
+    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n", NETFUN_CHASSIS, IPMI_CMD_SET_SYS_BOOT_OPTIONS);
+    ipmi_register_callback(NETFUN_CHASSIS, IPMI_CMD_SET_SYS_BOOT_OPTIONS, NULL, ipmi_chassis_set_sys_boot_options);
 }
+
diff --git a/chassishandler.h b/chassishandler.h
index 1a26411..a310741 100644
--- a/chassishandler.h
+++ b/chassishandler.h
@@ -3,21 +3,39 @@
 
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
 
 // Command specific completion codes
 enum ipmi_chassis_return_codes
 {
+    IPMI_OK = 0x0,
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
2.6.4
