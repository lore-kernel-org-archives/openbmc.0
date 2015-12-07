Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 6A15F1A0F5B
 for <openbmc@lists.ozlabs.org>; Tue,  8 Dec 2015 01:58:39 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 144949503260182.26053419569382;
 Mon, 7 Dec 2015 05:30:32 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: shgoupf <shgoupf@cn.ibm.com>
Subject: [PATCH phosphor-host-ipmid 3/4] Redo: Add get/set ipmid boot option
 command support with correct DBUS property handling.
Date: Mon,  7 Dec 2015 08:30:25 -0500
Message-Id: <1449495026-1692-4-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 07 Dec 2015 14:58:39 -0000

From: shgoupf <shgoupf@cn.ibm.com>

---
 chassishandler.C | 228 ++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 chassishandler.h |   8 ++
 2 files changed, 232 insertions(+), 4 deletions(-)

diff --git a/chassishandler.C b/chassishandler.C
index 1389db9..e69e6c3 100644
--- a/chassishandler.C
+++ b/chassishandler.C
@@ -8,6 +8,146 @@
 const char  *chassis_bus_name      =  "org.openbmc.control.Chassis";
 const char  *chassis_object_name   =  "/org/openbmc/control/chassis0";
 const char  *chassis_intf_name     =  "org.openbmc.control.Chassis";
+char* uint8_to_char(uint8_t *a, size_t size)
+{
+    char* buffer;
+    int i;
+
+    buffer = (char*)malloc(size * 2 + 1);
+    if (!buffer)
+        return NULL;
+
+    buffer[size * 2] = 0;
+    for (i = 0; i < size; i++) {
+        uint8_t msb = (a[i] >> 4) & 0xF;
+        uint8_t lsb = a[i] & 0xF;
+        buffer[2*i] = msb > 9 ? msb + 'A' - 10 : msb + '0';
+        buffer[2*i + 1] = lsb > 9 ? lsb + 'A' - 10 : lsb + '0';
+    }
+
+    return buffer;
+}
+
+uint8_t* char_to_uint8(char *a, size_t size)
+{
+    uint8_t* buffer;
+    int i;
+
+    buffer = (uint8_t*)malloc(size);
+    if (!buffer)
+        return NULL;
+
+    for (i = 0; i < size; i++) {
+        uint8_t msb = (uint8_t)(a[2*i] > '9' ? a[2*i] - 'A' + 10 : a[2*i] - '0');
+        uint8_t lsb = (uint8_t)(a[2*i+1] > '9' ? a[2*i+1] - 'A' + 10 : a[2*i+1] - '0');
+        buffer[i] = ((msb << 4) | (lsb & 0xF)) & 0xFF;
+    }
+
+    return buffer;
+}
+
+// TODO: object mapper should be used instead of hard-coding.
+int dbus_get_property(char* buf)
+{
+    sd_bus_error error = SD_BUS_ERROR_NULL;
+    sd_bus_message *m = NULL;
+    sd_bus *bus = NULL;
+    char* temp_buf = NULL;
+    uint8_t* get_value = NULL;
+    int r, i;
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
+            "org.openbmc.settings.Host",                /* service to contact */
+            "/org/openbmc/settings/host0",              /* object path */
+            "org.freedesktop.DBus.Properties",          /* interface name */
+            "Get",                                      /* method name */
+            &error,                                     /* object to return error in */
+            &m,                                         /* return message on success */
+            "ss",                                       /* input signature */
+            "org.freedesktop.DBus.Properties",          /* first argument */
+            "boot_flags");                              /* second argument */
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
+
+    return r;
+}
+
+// TODO: object mapper should be used instead of hard-coding.
+int dbus_set_property(const char* buf)
+{
+    sd_bus_error error = SD_BUS_ERROR_NULL;
+    sd_bus_message *m = NULL;
+    sd_bus *bus = NULL;
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
+            "org.openbmc.settings.Host",                /* service to contact */
+            "/org/openbmc/settings/host0",              /* object path */
+            "org.freedesktop.DBus.Properties",          /* interface name */
+            "Set",                                      /* method name */
+            &error,                                     /* object to return error in */
+            &m,                                         /* return message on success */
+            "ssv",                                      /* input signature */
+            "org.freedesktop.DBus.Properties",          /* first argument */
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
+
+    return r;
+}
 
 void register_netfn_chassis_functions() __attribute__((constructor));
 
@@ -17,6 +157,15 @@ struct get_sys_boot_options_t {
     uint8_t block;
 }  __attribute__ ((packed));
 
+struct set_sys_boot_options_t {
+    uint8_t parameter;
+    uint8_t data1;
+    uint8_t data2;
+    uint8_t data3;
+    uint8_t data4;
+    uint8_t data5;
+}  __attribute__ ((packed));
+
 ipmi_ret_t ipmi_chassis_wildcard(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
                               ipmi_request_t request, ipmi_response_t response, 
                               ipmi_data_len_t data_len, ipmi_context_t context)
@@ -116,16 +265,63 @@ ipmi_ret_t ipmi_chassis_get_sys_boot_options(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 
     get_sys_boot_options_t *reqptr = (get_sys_boot_options_t*) request;
 
-    // TODO Return default values to OPAL until dbus interface is available
+    char* buf = (char*)malloc(NUM_RETURN_BYTES_OF_GET);
+
+    if (reqptr->parameter == 5) // Parameter #5
+    {
+        dbus_get_property(buf);
+        uint8_t* return_value = char_to_uint8(buf, NUM_RETURN_BYTES_OF_GET_USED);
+        *data_len = NUM_RETURN_BYTES_OF_GET;
+        // TODO: last 3 bytes
+        // (NUM_RETURN_BYTES_OF_GET - NUM_RETURN_BYTES_OF_GET_USED) is meanlingless
+        memcpy(response, return_value, *data_len);
+        free(buf);
+        free(return_value);
+    }
+    else
+    {
+        *data_len = NUM_RETURN_BYTES_OF_GET;
+        // 0x80: parameter not supported
+        buf[0] = 0x80;
+        memcpy(response, buf, *data_len);
+        free(buf);
+        fprintf(stderr, "Unsupported parameter 0x%x\n", reqptr->parameter);
+        return IPMI_CC_PARM_NOT_SUPPORTED;        
+    }
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
+    printf("IPMID set command required return bytes: %i\n", *data_len);
+
+    set_sys_boot_options_t *reqptr = (set_sys_boot_options_t*) request;
+
+    char* output_buf = (char*)malloc(NUM_RETURN_BYTES_OF_SET);
 
     if (reqptr->parameter == 5) // Parameter #5
     {
-        uint8_t buf[] = {0x1,0x5,80,0,0,0,0};
-        *data_len = sizeof(buf);
-        memcpy(response, &buf, *data_len);
+        char* input_buf = uint8_to_char((uint8_t*)(&(reqptr->data1)), NUM_INPUT_BYTES_OF_SET);
+        dbus_set_property(input_buf);
+        *data_len = NUM_RETURN_BYTES_OF_SET;
+        // 0x0: return code OK.
+        output_buf[0] = 0x0;
+        memcpy(response, output_buf, *data_len);
+        free(output_buf);
+        free(input_buf);
     }
     else
     {
+        // 0x80: parameter not supported
+        output_buf[0] = 0x80;
+        memcpy(response, output_buf, *data_len);
+        free(output_buf);
         fprintf(stderr, "Unsupported parameter 0x%x\n", reqptr->parameter);
         return IPMI_CC_PARM_NOT_SUPPORTED;        
     }
@@ -133,6 +329,7 @@ ipmi_ret_t ipmi_chassis_get_sys_boot_options(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     return rc;
 }
 
+
 void register_netfn_chassis_functions()
 {
     printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_CHASSIS, IPMI_CMD_WILDCARD);
@@ -141,6 +338,29 @@ void register_netfn_chassis_functions()
     printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_CHASSIS, IPMI_CMD_GET_SYS_BOOT_OPTIONS);
     ipmi_register_callback(NETFUN_CHASSIS, IPMI_CMD_GET_SYS_BOOT_OPTIONS, NULL, ipmi_chassis_get_sys_boot_options);
 
+    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_CHASSIS, IPMI_CMD_SET_SYS_BOOT_OPTIONS);
+    ipmi_register_callback(NETFUN_CHASSIS, IPMI_CMD_SET_SYS_BOOT_OPTIONS, NULL, ipmi_chassis_set_sys_boot_options);
+
     printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_CHASSIS, IPMI_CMD_CHASSIS_CONTROL);
     ipmi_register_callback(NETFUN_CHASSIS, IPMI_CMD_CHASSIS_CONTROL, NULL, ipmi_chassis_control);
+
+    // TODO: Testing for dbus property set/get and related methods.
+    printf("----> Start of chassis handler testing.\n");
+    set_sys_boot_options_t req = {0x80, 0x10, 0xA2, 0x3B, 0x45, 0x57}; 
+    char* set_value = uint8_to_char((uint8_t*)(&(req.data1)), 5);
+    dbus_set_property(set_value);
+    char* buf = (char*)malloc(NUM_RETURN_BYTES_OF_GET_USED * 2 + 1);
+    dbus_get_property(buf);
+    uint8_t* get_value = char_to_uint8(buf, NUM_RETURN_BYTES_OF_GET_USED);
+    int i;
+    printf("buf: %s\n", (char*)buf);
+    printf("0x");
+    for (i = 0; i < 5; i++) {
+        printf("%2x", get_value[i]);
+    }
+    printf("\n");
+    printf("----> End of chassis handler testing.\n");
+    free(buf);
+    free(set_value);
+    free(get_value);
 }
diff --git a/chassishandler.h b/chassishandler.h
index 1a26411..0164ce1 100644
--- a/chassishandler.h
+++ b/chassishandler.h
@@ -3,12 +3,20 @@
 
 #include <stdint.h>
 
+// TODO: Petitboot requires 8 bytes of response
+// however only 5 of them are used.
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
 
-- 
2.6.3
