Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id CD8F51A0E6B
 for <openbmc@lists.ozlabs.org>; Tue,  8 Dec 2015 01:51:23 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1449495028262989.3740371989225;
 Mon, 7 Dec 2015 05:30:28 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: shgoupf <shgoupf@cn.ibm.com>
Subject: [PATCH phosphor-host-ipmid 1/4] Add get/set ipmid command support
 with correct DBUS property handling.
Date: Mon,  7 Dec 2015 08:30:23 -0500
Message-Id: <1449495026-1692-2-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 07 Dec 2015 14:51:25 -0000

From: shgoupf <shgoupf@cn.ibm.com>

---
 apphandler.C       |  70 ++----------
 apphandler.h       |  33 +-----
 chassishandler.C   | 306 ++++++++++++++++++++++++++++++++++++++---------------
 chassishandler.h   |  20 ++--
 ipmid-api.h        |  13 +--
 ipmid.C            |  26 ++---
 ipmisensor.C       |  35 +-----
 sensorhandler.C    |  17 ++-
 storageaddsel.C    |  42 ++++++--
 storagehandler.C   |  20 +---
 transporthandler.C |   2 +
 11 files changed, 304 insertions(+), 280 deletions(-)

diff --git a/apphandler.C b/apphandler.C
index 2c9ce6b..6467397 100644
--- a/apphandler.C
+++ b/apphandler.C
@@ -10,76 +10,20 @@ extern sd_bus *bus;
 
 void register_netfn_app_functions() __attribute__((constructor));
 
-//---------------------------------------------------------------------
-// Called by Host on seeing a SMS_ATN bit set. Return a hardcoded 
-// value of 0x2 indicating we need Host read some data.
-//-------------------------------------------------------------------
-ipmi_ret_t ipmi_app_get_msg_flags(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
-                             ipmi_request_t request, ipmi_response_t response,
-                             ipmi_data_len_t data_len, ipmi_context_t context)
-{
-	// Generic return from IPMI commands.
-    ipmi_ret_t rc = IPMI_CC_OK;
-
-    printf("IPMI APP GET MSG FLAGS returning with [bit:2] set\n");
-
-	// From IPMI spec V2.0 for Get Message Flags Command :
-	// bit:[1] from LSB : 1b = Event Message Buffer Full. 
-	// Return as 0 if Event Message Buffer is not supported, 
-	// or when the Event Message buffer is disabled.
-	// TODO. For now. assume its not disabled and send "0x2" anyway:
-
-	uint8_t set_event_msg_buffer_full = 0x2;
-    *data_len = sizeof(set_event_msg_buffer_full);
-
-    // Pack the actual response
-    memcpy(response, &set_event_msg_buffer_full, *data_len);
-
-    return rc;
-}
 
-//-------------------------------------------------------------------
-// Called by Host post response from Get_Message_Flags
-//-------------------------------------------------------------------
 ipmi_ret_t ipmi_app_read_event(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
                              ipmi_request_t request, ipmi_response_t response,
                              ipmi_data_len_t data_len, ipmi_context_t context)
 {
     ipmi_ret_t rc = IPMI_CC_OK;
-    printf("IPMI APP READ EVENT command received\n");
-
-	// TODO : For now, this is catering only to the Soft Power Off via OEM SEL
-	//        mechanism. If we need to make this generically used for some
-	//        other conditions, then we can take advantage of context pointer.
-
-	struct oem_sel_timestamped soft_off = {0};
-    *data_len = sizeof(struct oem_sel_timestamped);
-
-	// either id[0] -or- id[1] can be filled in. We will use id[0]
-	soft_off.id[0]	 = SEL_OEM_ID_0;
-	soft_off.id[1]	 = SEL_OEM_ID_0;
-	soft_off.type	 = SEL_RECORD_TYPE_OEM;
-
-	// Following 3 bytes are from IANA Manufactre_Id field. See below
-	soft_off.manuf_id[0]= 0x41;
-	soft_off.manuf_id[1]= 0xA7;
-	soft_off.manuf_id[2]= 0x00;
-
-	// per IPMI spec NetFuntion for OEM
-	soft_off.netfun	 = 0x3A;
-
-	// Mechanism to kick start soft shutdown.
-	soft_off.cmd	 = CMD_POWER;
-	soft_off.data[0] = SOFT_OFF;
-
-	// All '0xFF' since unused.
-	memset(&soft_off.data[1], 0xFF, 3);
+    *data_len = 0;
 
-    // Pack the actual response
-    memcpy(response, &soft_off, *data_len);
+    printf("IPMI APP READ EVENT Ignoring for now\n");
     return rc;
+
 }
 
+
 ipmi_ret_t ipmi_app_set_acpi_power_state(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
                              ipmi_request_t request, ipmi_response_t response,
                              ipmi_data_len_t data_len, ipmi_context_t context)
@@ -184,7 +128,8 @@ ipmi_ret_t ipmi_app_get_device_guid(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 
         for(i = 0; i < tmp_size; i++)
         {
-            char tmp_array[3] = {0}; // Holder of the 2 chars that will become a byte
+            char tmp_array[3]; // Holder of the 2 chars that will become a byte
+            tmp_array[3] = '\0';
             strncpy(tmp_array, id_octet, 2); // 2 chars at a time
 
             int resp_byte = strtoul(tmp_array, NULL, 16); // Convert to hex byte
@@ -414,9 +359,6 @@ void register_netfn_app_functions()
     ipmi_register_callback(NETFUN_APP, IPMI_CMD_SET_BMC_GLOBAL_ENABLES, NULL,
                                             ipmi_app_set_bmc_global_enables);
 
-    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_APP, IPMI_CMD_GET_MSG_FLAGS);
-    ipmi_register_callback(NETFUN_APP, IPMI_CMD_GET_MSG_FLAGS, NULL, ipmi_app_get_msg_flags);
-
     return;
 }
 
diff --git a/apphandler.h b/apphandler.h
index aa2a55d..35a2b20 100644
--- a/apphandler.h
+++ b/apphandler.h
@@ -1,19 +1,6 @@
 #ifndef __HOST_IPMI_APP_HANDLER_H__
 #define __HOST_IPMI_APP_HANDLER_H__
 
-#include <stdint.h>
-
-// These are per skiboot ipmi-sel code
-
-// OEM_SEL type with Timestamp
-#define SEL_OEM_ID_0		0x55
-// SEL type is OEM and -not- general SEL
-#define SEL_RECORD_TYPE_OEM	0xC0
-// Minor command for soft shurdown
-#define SOFT_OFF			0x00
-// Major command for Any kind of power ops
-#define CMD_POWER			0x04
-
 // IPMI commands for App net functions.
 enum ipmi_netfn_app_cmds
 {
@@ -24,27 +11,9 @@ enum ipmi_netfn_app_cmds
     IPMI_CMD_RESET_WD               = 0x22,
     IPMI_CMD_SET_WD                 = 0x24,
     IPMI_CMD_SET_BMC_GLOBAL_ENABLES = 0x2E,
-    IPMI_CMD_GET_MSG_FLAGS          = 0x31,
     IPMI_CMD_READ_EVENT             = 0x35,
     IPMI_CMD_GET_CAP_BIT            = 0x36,
-};
 
-// A Mechanism to tell host to shtudown hosts by sending this PEM SEL. Really
-// the only used fields by skiboot are:
-// id[0] / id[1] for ID_0 , ID_1
-// type : SEL_RECORD_TYPE_OEM as standard SELs are ignored by skiboot
-// cmd : CMD_POWER for power functions
-// data[0], specific commands.  example Soft power off. power cycle, etc.
-struct oem_sel_timestamped
-{
-	/* SEL header */
-	uint8_t id[2];
-	uint8_t type;
-	uint8_t manuf_id[3];
-	uint8_t timestamp[4];
-	/* OEM SEL data (6 bytes) follows */
-	uint8_t netfun;
-	uint8_t cmd;
-	uint8_t data[4];
 };
+
 #endif
diff --git a/chassishandler.C b/chassishandler.C
index 1389db9..7694bd5 100644
--- a/chassishandler.C
+++ b/chassishandler.C
@@ -4,10 +4,147 @@
 #include <string.h>
 #include <stdint.h>
 
-// OpenBMC Chassis Manager dbus framework
-const char  *chassis_bus_name      =  "org.openbmc.control.Chassis";
-const char  *chassis_object_name   =  "/org/openbmc/control/chassis0";
-const char  *chassis_intf_name     =  "org.openbmc.control.Chassis";
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
+
 
 void register_netfn_chassis_functions() __attribute__((constructor));
 
@@ -17,6 +154,15 @@ struct get_sys_boot_options_t {
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
@@ -28,104 +174,74 @@ ipmi_ret_t ipmi_chassis_wildcard(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     return rc;
 }
 
-//------------------------------------------------------------
-// Calls into Chassis Control Dbus object to do the power off
-//------------------------------------------------------------
-int ipmi_chassis_power_control(const char *method)
+ipmi_ret_t ipmi_chassis_get_sys_boot_options(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
+                              ipmi_request_t request, ipmi_response_t response, 
+                              ipmi_data_len_t data_len, ipmi_context_t context)
 {
-	// sd_bus error
-	int rc = 0;
-
-    // SD Bus error report mechanism.
-    sd_bus_error bus_error = SD_BUS_ERROR_NULL;
-
-	// Response from the call. Although there is no response for this call,
-	// obligated to mention this to make compiler happy.
-	sd_bus_message *response = NULL;
-
-	// Gets a hook onto either a SYSTEM or SESSION bus
-	sd_bus *bus_type = ipmid_get_sd_bus_connection();
-
-	rc = sd_bus_call_method(bus_type,        		 // On the System Bus
-							chassis_bus_name,        // Service to contact
-							chassis_object_name,     // Object path 
-							chassis_intf_name,       // Interface name
-							method,      		 // Method to be called
-							&bus_error,      		 // object to return error
-							&response,		 		 // Response buffer if any
-							NULL);			 		 // No input arguments
-	if(rc < 0)
-	{
-		fprintf(stderr,"ERROR initiating Power Off:[%s]\n",bus_error.message);
-	}
-	else
-	{
-		printf("Chassis Power Off initiated successfully\n");
-	}
-
-    sd_bus_error_free(&bus_error);
-    sd_bus_message_unref(response);
-
-	return rc;
-}
+    ipmi_ret_t rc = IPMI_CC_OK;
+    *data_len = 0;
+
+    printf("IPMI GET_SYS_BOOT_OPTIONS\n");
 
+    get_sys_boot_options_t *reqptr = (get_sys_boot_options_t*) request;
 
-//----------------------------------------------------------------------
-// Chassis Control commands
-//----------------------------------------------------------------------
-ipmi_ret_t ipmi_chassis_control(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
-                        ipmi_request_t request, ipmi_response_t response, 
-                        ipmi_data_len_t data_len, ipmi_context_t context)
-{
-	// Error from power off.
-	int rc = 0;
+    char* buf = (char*)malloc(NUM_RETURN_BYTES_OF_GET);
 
-	// No response for this command.
-    *data_len = 0;
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
 
-	// Catch the actual operaton by peeking into request buffer
-	uint8_t chassis_ctrl_cmd = *(uint8_t *)request;
-	printf("Chassis Control Command: Operation:[0x%X]\n",chassis_ctrl_cmd);
-
-	switch(chassis_ctrl_cmd)
-	{
-		case CMD_POWER_OFF:
-			rc = ipmi_chassis_power_control("powerOff");
-			break;
-		case CMD_HARD_RESET:
-			rc = ipmi_chassis_power_control("reboot");
-			break;
-		default:
-		{
-			fprintf(stderr, "Invalid Chassis Control command:[0x%X] received\n",chassis_ctrl_cmd);
-			rc = -1;
-		}
-	}
-
-	return ( (rc < 0) ? IPMI_CC_INVALID : IPMI_CC_OK);
+    return rc;
 }
 
-ipmi_ret_t ipmi_chassis_get_sys_boot_options(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
+ipmi_ret_t ipmi_chassis_set_sys_boot_options(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
                               ipmi_request_t request, ipmi_response_t response, 
                               ipmi_data_len_t data_len, ipmi_context_t context)
 {
     ipmi_ret_t rc = IPMI_CC_OK;
-    *data_len = 0;
 
-    printf("IPMI GET_SYS_BOOT_OPTIONS\n");
+    printf("IPMI SET_SYS_BOOT_OPTIONS\n");
+    printf("IPMID set command required return bytes: %i\n", *data_len);
 
-    get_sys_boot_options_t *reqptr = (get_sys_boot_options_t*) request;
+    set_sys_boot_options_t *reqptr = (set_sys_boot_options_t*) request;
 
-    // TODO Return default values to OPAL until dbus interface is available
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
@@ -141,6 +257,28 @@ void register_netfn_chassis_functions()
     printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_CHASSIS, IPMI_CMD_GET_SYS_BOOT_OPTIONS);
     ipmi_register_callback(NETFUN_CHASSIS, IPMI_CMD_GET_SYS_BOOT_OPTIONS, NULL, ipmi_chassis_get_sys_boot_options);
 
-    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_CHASSIS, IPMI_CMD_CHASSIS_CONTROL);
-    ipmi_register_callback(NETFUN_CHASSIS, IPMI_CMD_CHASSIS_CONTROL, NULL, ipmi_chassis_control);
+    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_CHASSIS, IPMI_CMD_SET_SYS_BOOT_OPTIONS);
+    ipmi_register_callback(NETFUN_CHASSIS, IPMI_CMD_SET_SYS_BOOT_OPTIONS, NULL, ipmi_chassis_set_sys_boot_options);
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
+
+
diff --git a/chassishandler.h b/chassishandler.h
index 1a26411..80e40a8 100644
--- a/chassishandler.h
+++ b/chassishandler.h
@@ -1,14 +1,18 @@
 #ifndef __HOST_IPMI_CHASSIS_HANDLER_H__
 #define __HOST_IPMI_CHASSIS_HANDLER_H__
 
-#include <stdint.h>
+// TODO: Petitboot requires 8 bytes of response
+// however only 5 of them are used.
+#define NUM_RETURN_BYTES_OF_GET 8
+#define NUM_RETURN_BYTES_OF_GET_USED 5
+#define NUM_RETURN_BYTES_OF_SET 1
+#define NUM_INPUT_BYTES_OF_SET 5
 
 // IPMI commands for Chassis net functions.
 enum ipmi_netfn_app_cmds
 {
-	// Chassis Control
-	IPMI_CMD_CHASSIS_CONTROL	  = 0x02,
     // Get capability bits
+    IPMI_CMD_SET_SYS_BOOT_OPTIONS = 0x08,
     IPMI_CMD_GET_SYS_BOOT_OPTIONS = 0x09,
 };
 
@@ -18,15 +22,5 @@ enum ipmi_chassis_return_codes
     IPMI_CC_PARM_NOT_SUPPORTED = 0x80,
 };
 
-// Various Chassis operations under a single command.
-enum ipmi_chassis_control_cmds : uint8_t
-{
-	CMD_POWER_OFF 			   = 0x00,
-	CMD_POWER_ON 			   = 0x01,
-	CMD_POWER_CYCLE 		   = 0x02,
-	CMD_HARD_RESET 			   = 0x03,
-	CMD_PULSE_DIAGNOSTIC_INTR  = 0x04,
-	CMD_SOFT_OFF_VIA_OVER_TEMP = 0x05,
-};
 
 #endif
diff --git a/ipmid-api.h b/ipmid-api.h
index 4f4b9de..34d3bbe 100644
--- a/ipmid-api.h
+++ b/ipmid-api.h
@@ -3,10 +3,6 @@
 #include <stdlib.h>
 #include <systemd/sd-bus.h>
 
-#ifdef __cplusplus
-extern "C" {
-#endif
-
 // length of Completion Code and its ALWAYS _1_
 #define IPMI_CC_LEN 1
 
@@ -55,7 +51,9 @@ typedef ipmi_ret_t (*ipmid_callback_t)(ipmi_netfn_t, ipmi_cmd_t, ipmi_request_t,
 // This is the constructor function that is called into by each plugin handlers.
 // When ipmi sets up the callback handlers, a call is made to this with
 // information of netfn, cmd, callback handler pointer and context data.
-void ipmi_register_callback(ipmi_netfn_t, ipmi_cmd_t,
+// Making this a extern "C" so that plugin libraries written in C can also use
+// it.
+extern "C" void ipmi_register_callback(ipmi_netfn_t, ipmi_cmd_t, 
                                        ipmi_context_t, ipmid_callback_t);
 
 // These are the command network functions, the response
@@ -97,9 +95,4 @@ enum ipmi_return_codes
 };
 
 sd_bus *ipmid_get_sd_bus_connection(void);
-
-#ifdef __cplusplus
-}
-#endif
-
 #endif
diff --git a/ipmid.C b/ipmid.C
index 76e612d..64bc753 100644
--- a/ipmid.C
+++ b/ipmid.C
@@ -40,6 +40,7 @@ typedef std::pair<ipmid_callback_t, ipmi_context_t> ipmi_fn_context_t;
 std::map<ipmi_fn_cmd_t, ipmi_fn_context_t> g_ipmid_router_map;
 
 
+
 #ifndef HEXDUMP_COLS
 #define HEXDUMP_COLS 16
 #endif
@@ -199,13 +200,13 @@ static int send_ipmi_message(sd_bus_message *req, unsigned char seq, unsigned ch
     r = sd_bus_message_append(m, "yyyyy", seq, netfn, lun, cmd, cc);
     if (r < 0) {
         fprintf(stderr, "Failed add the netfn and others : %s\n", strerror(-r));
-        goto final;
+        return -1;
     }
 
     r = sd_bus_message_append_array(m, 'y', buf, len);
     if (r < 0) {
         fprintf(stderr, "Failed to add the string of response bytes: %s\n", strerror(-r));
-        goto final;
+        return -1;
     }
 
 
@@ -213,19 +214,18 @@ static int send_ipmi_message(sd_bus_message *req, unsigned char seq, unsigned ch
     // Call the IPMI responder on the bus so the message can be sent to the CEC
     r = sd_bus_call(bus, m, 0, &error, &reply);
     if (r < 0) {
-        fprintf(stderr, "Failed to call the method: %s\n", strerror(-r));
-        goto final;
+        fprintf(stderr, "Failed to call the method: %s", strerror(-r));
+        return -1;
     }
 
     r = sd_bus_message_read(reply, "x", &pty);
     if (r < 0) {
        fprintf(stderr, "Failed to get a rc from the method: %s\n", strerror(-r));
+
     }
 
-final:
     sd_bus_error_free(&error);
     sd_bus_message_unref(m);
-    sd_bus_message_unref(reply);
 
 
     return r < 0 ? EXIT_FAILURE : EXIT_SUCCESS;
@@ -234,6 +234,7 @@ final:
 static int handle_ipmi_command(sd_bus_message *m, void *user_data, sd_bus_error
                          *ret_error) {
     int r = 0;
+    const char *msg = NULL;
     unsigned char sequence, netfn, lun, cmd;
     const void *request;
     size_t sz;
@@ -375,11 +376,10 @@ int main(int argc, char *argv[])
 {
     sd_bus_slot *slot = NULL;
     int r;
+    char *mode = NULL;
     unsigned long tvalue;
     int c;
 
-
-
     // This file and subsequient switch is for turning on levels
     // of trace
     ipmicmddetails = ipmiio = ipmidbus =  fopen("/dev/null", "w");
@@ -416,19 +416,15 @@ int main(int argc, char *argv[])
     // Register all the handlers that provider implementation to IPMI commands.
     ipmi_register_callback_handlers(HOST_IPMI_LIB_PATH);
 
-	// Start the Host Services Dbus Objects
-	start_host_service(bus, slot);
-
-	// Watch for BT messages
     r = sd_bus_add_match(bus, &slot, FILTER, handle_ipmi_command, NULL);
     if (r < 0) {
         fprintf(stderr, "Failed: sd_bus_add_match: %s : %s\n", strerror(-r), FILTER);
         goto finish;
     }
 
-
     for (;;) {
         /* Process requests */
+
         r = sd_bus_process(bus, NULL);
         if (r < 0) {
             fprintf(stderr, "Failed to process bus: %s\n", strerror(-r));
@@ -457,7 +453,7 @@ finish:
 // step for mapping IPMI
 int find_interface_property_fru_type(dbus_interface_t *interface, const char *property_name, char *property_value) {
 
-    char  *str1;
+    char  *str1, *str2, *str3;
     sd_bus_error error = SD_BUS_ERROR_NULL;
     sd_bus_message *reply = NULL, *m=NULL;
 
@@ -603,7 +599,7 @@ int set_sensor_dbus_state_v(uint8_t number, const char *method, char *value) {
     dbus_interface_t a;
     int r;
     sd_bus_error error = SD_BUS_ERROR_NULL;
-    sd_bus_message *m=NULL;
+    sd_bus_message *reply = NULL, *m=NULL;
 
     fprintf(ipmidbus, "Attempting to set a dbus Variant Sensor 0x%02x via %s with a value of %s\n",
         number, method, value);
diff --git a/ipmisensor.C b/ipmisensor.C
index 1f60f64..6d3d3bd 100644
--- a/ipmisensor.C
+++ b/ipmisensor.C
@@ -129,8 +129,6 @@ int set_sensor_dbus_state_fwprogress(const sensorRES_t *pRec, const lookup_t *pT
 					break;
 		case 0x02 : snprintf(p, sizeof(valuestring), "FW Progress, %s", event_data_lookup(g_fwprogress02h, pRec->event_data2));
 					break;
-		default : snprintf(p, sizeof(valuestring), "Internal warning, fw_progres offset unknown (0x%02x)", pTable->offset);
-					break;
 	}
 
 	return set_sensor_dbus_state_v(pRec->sensor_number, pTable->method, p);
@@ -147,28 +145,6 @@ int set_sensor_dbus_state_osbootcount(const sensorRES_t *pRec, const lookup_t *p
 	return set_sensor_dbus_state_v(pRec->sensor_number, pTable->method, pStr);
 }
 
-int set_sensor_dbus_state_system_event(const sensorRES_t *pRec, const lookup_t *pTable, const char *value) {
-	char valuestring[128];
-	char* p = valuestring;
-
-	switch (pTable->offset) {
-
-		case 0x00 : snprintf(p, sizeof(valuestring), "System Reconfigured");
-					break;
-		case 0x01 : snprintf(p, sizeof(valuestring), "OEM Boot Event");
-					break;
-		case 0x02 : snprintf(p, sizeof(valuestring), "Undetermine System Hardware Failure");
-					break;
-		case 0x03 : snprintf(p, sizeof(valuestring), "System Failure see error log for more details (0x%02x)", pRec->event_data2);
-					break;
-		case 0x04 : snprintf(p, sizeof(valuestring), "System Failure see PEF error log for more details (0x%02x)", pRec->event_data2);
-					break;
-		default : snprintf(p, sizeof(valuestring), "Internal warning, system_event offset unknown (0x%02x)", pTable->offset);
-					break;
-	}
-
-	return set_sensor_dbus_state_v(pRec->sensor_number, pTable->method, p);
-}
 
 
 //  This table lists only senors we care about telling dbus about.
@@ -179,13 +155,13 @@ lookup_t g_ipmidbuslookup[] = {
 	{0xe9, 0x00, set_sensor_dbus_state_simple, "setValue", "Disabled", ""}, // OCC Inactive 0
 	{0xe9, 0x01, set_sensor_dbus_state_simple, "setValue", "Enabled", ""},   // OCC Active 1
 	{0x07, 0x07, set_sensor_dbus_state_simple, "setPresent", "True", "False"},
-	{0x07, 0x08, set_sensor_dbus_state_simple, "setFault",   "True", "False"},
+	{0x07, 0x08, set_sensor_dbus_state_simple, "setFault",   "True", ""},
 	{0x0C, 0x06, set_sensor_dbus_state_simple, "setPresent", "True", "False"},
-	{0x0C, 0x04, set_sensor_dbus_state_simple, "setFault",   "True", "False"},
+	{0x0C, 0x04, set_sensor_dbus_state_simple, "setFault",   "True", ""},
 	{0x0F, 0x02, set_sensor_dbus_state_fwprogress, "setValue", "True", "False"},
 	{0x0F, 0x01, set_sensor_dbus_state_fwprogress, "setValue", "True", "False"},
 	{0x0F, 0x00, set_sensor_dbus_state_fwprogress, "setValue", "True", "False"},
-	{0xC7, 0x01, set_sensor_dbus_state_simple, "setFault", "True", "False"},
+	{0xC7, 0x01, set_sensor_dbus_state_simple, "setFault", "True", ""},
 	{0xc3, 0x00, set_sensor_dbus_state_osbootcount, "setValue", "" ,""},
 	{0x1F, 0x00, set_sensor_dbus_state_simple, "setValue", "Boot completed (00)", ""},
 	{0x1F, 0x01, set_sensor_dbus_state_simple, "setValue", "Boot completed (01)", ""},
@@ -194,11 +170,6 @@ lookup_t g_ipmidbuslookup[] = {
 	{0x1F, 0x04, set_sensor_dbus_state_simple, "setValue", "CD-ROM boot completed", ""},
 	{0x1F, 0x05, set_sensor_dbus_state_simple, "setValue", "ROM boot completed", ""},
 	{0x1F, 0x06, set_sensor_dbus_state_simple, "setValue", "Boot completed (06)", ""},
-	{0x12, 0x00, set_sensor_dbus_state_system_event, "setValue", "", ""},
-	{0x12, 0x01, set_sensor_dbus_state_system_event, "setValue", "", ""},
-	{0x12, 0x02, set_sensor_dbus_state_system_event, "setValue", "", ""},
-	{0x12, 0x03, set_sensor_dbus_state_system_event, "setValue", "", ""},
-	{0x12, 0x04, set_sensor_dbus_state_system_event, "setValue", "", ""},
 
 	{0xFF, 0xFF, NULL, "", "", ""}
 };
diff --git a/sensorhandler.C b/sensorhandler.C
index c96b7a7..cd57dd4 100644
--- a/sensorhandler.C
+++ b/sensorhandler.C
@@ -29,13 +29,11 @@ sensorTypemap_t g_SensorTypeMap[] = {
     {0xe9, 0x09, "OccStatus"},  // E9 is an internal mapping to handle sensor type code os 0x09
     {0xC3, 0x6F, "BootCount"},
     {0x1F, 0x6F, "OperatingSystemStatus"},
-    {0x12, 0x6F, "SYSTEM_EVENT"},
-    {0xC7, 0x03, "SYSTEM"},
-    {0xC7, 0x03, "MAIN_PLANAR"},
     {0xFF, 0x00, ""},
 };
 
 
+
 struct sensor_data_t {
     uint8_t sennum;
 }  __attribute__ ((packed)) ;
@@ -121,7 +119,15 @@ ipmi_ret_t ipmi_sen_get_sensor_type(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 
     // HACK UNTIL Dbus gets updated or we find a better way
     if (buf[0] == 0) {
-        rc = IPMI_CC_SENSOR_INVALID;
+
+        switch(reqptr->sennum) {
+            case 0x35 : buf[0] = 0x12; buf[1] = 0x6F; break;
+            case 0x37 : buf[0] = 0xC7; buf[1] = 0x03; break;
+            case 0x38 : buf[0] = 0xC7; buf[1] = 0x03; break;
+            case 0x39 : buf[0] = 0xC7; buf[1] = 0x03; break;
+            case 0x3A : buf[0] = 0xC7; buf[1] = 0x03; break;
+            default: rc = IPMI_CC_SENSOR_INVALID;
+        }
     }
 
 
@@ -139,6 +145,9 @@ ipmi_ret_t ipmi_sen_set_sensor(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 {
     sensor_data_t *reqptr = (sensor_data_t*)request;
     ipmi_ret_t rc = IPMI_CC_OK;
+    unsigned short rlen;
+
+    rlen = (unsigned short) *data_len;
 
     printf("IPMI SET_SENSOR [0x%02x]\n",reqptr->sennum);
 
diff --git a/storageaddsel.C b/storageaddsel.C
index 3c24ec0..64b0e6a 100644
--- a/storageaddsel.C
+++ b/storageaddsel.C
@@ -136,6 +136,7 @@ int create_esel_description(const uint8_t *buffer, const char *sev, char **messa
 
 
 	ipmi_add_sel_request_t *p;
+	int r;
 	char *m;
 
 	p =  ( ipmi_add_sel_request_t *) buffer;
@@ -155,7 +156,7 @@ int send_esel_to_dbus(const char *desc, const char *sev, const char *details, ui
 	sd_bus *mbus = NULL;
     sd_bus_error error = SD_BUS_ERROR_NULL;
     sd_bus_message *reply = NULL, *m=NULL;
-    uint16_t x;
+    uint16_t *pty;
     int r;
 
     mbus = ipmid_get_sd_bus_connection();
@@ -167,67 +168,88 @@ int send_esel_to_dbus(const char *desc, const char *sev, const char *details, ui
     									"acceptHostMessage");
     if (r < 0) {
         fprintf(stderr, "Failed to add the method object: %s\n", strerror(-r));
-        goto finish;
+        return -1;
     }
 
     r = sd_bus_message_append(m, "sss", desc, sev, details);
     if (r < 0) {
         fprintf(stderr, "Failed add the message strings : %s\n", strerror(-r));
-        goto finish;
+        return -1;
     }
 
     r = sd_bus_message_append_array(m, 'y', debug, debuglen);
     if (r < 0) {
         fprintf(stderr, "Failed to add the raw array of bytes: %s\n", strerror(-r));
-        goto finish;
+        return -1;
     }
+
     // Call the IPMI responder on the bus so the message can be sent to the CEC
     r = sd_bus_call(mbus, m, 0, &error, &reply);
     if (r < 0) {
-        fprintf(stderr, "Failed to call the method: %s %s\n", __FUNCTION__, strerror(-r));
-        goto finish;
+        fprintf(stderr, "Failed to call the method: %s", strerror(-r));
+        return -1;
     }
-    r = sd_bus_message_read(reply, "q", &x);
+
+    r = sd_bus_message_read(reply, "q", &pty);
     if (r < 0) {
         fprintf(stderr, "Failed to get a rc from the method: %s\n", strerror(-r));
+    } else {
+        r = *pty;
     }
 
 finish:
     sd_bus_error_free(&error);
     sd_bus_message_unref(m);
     sd_bus_message_unref(reply);
+
     return r;
 }
 
 
 void send_esel(uint16_t recordid) {
-	char *desc, *assoc;
+	char *desc, *assoc, *ascii;
 	const char *sev;
 	uint8_t *buffer = NULL;
-	char *path;
+	char *path, *pathsent;
 	size_t sz;
+	int r;
 
 	uint8_t hack[] = {0x30, 0x32, 0x34};
+
 	asprintf(&path,"%s%04x", "/tmp/esel", recordid);
+
 	sz = getfilestream(path, &buffer);
+
 	if (sz == 0) {
 		printf("Error file does not exist %d\n",__LINE__);
 		free(path);
 		return;
 	}
 
+
 	sev = create_esel_severity(buffer);
+
 	create_esel_association(buffer, &assoc);
+
 	create_esel_description(buffer, sev, &desc);
 
+
 	// TODO until ISSUE https://github.com/openbmc/rest-dbus/issues/2
 	// I cant send extended ascii chars.  So 0,2,4 for now...
-	send_esel_to_dbus(desc, sev, assoc, hack, 3);
+	r = send_esel_to_dbus(desc, sev, assoc, hack, 3);
+
+	asprintf(&pathsent,"%s_%d", path, r);
+
+
+	rename(path, pathsent);
 
 	free(path);
+	free(pathsent);
 	free(assoc);
 	free(desc);
+
 	delete[] buffer;
 
+
 	return;
 }
diff --git a/storagehandler.C b/storagehandler.C
index f3e2532..1459f94 100644
--- a/storagehandler.C
+++ b/storagehandler.C
@@ -2,7 +2,6 @@
 #include <string.h>
 #include <stdint.h>
 #include <time.h>
-#include <sys/time.h>
 #include <arpa/inet.h>
 
 #include "storagehandler.h"
@@ -53,25 +52,14 @@ ipmi_ret_t ipmi_storage_set_sel_time(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
                               ipmi_request_t request, ipmi_response_t response,
                               ipmi_data_len_t data_len, ipmi_context_t context)
 {
-    uint32_t* secs = (uint32_t*)request;
+    unsigned int *bufftype = (unsigned int *) request;
 
     printf("Handling Set-SEL-Time:[0x%X], Cmd:[0x%X]\n",netfn, cmd);
-    printf("Data: 0x%X]\n",*secs);
+    printf("Data: 0x%X]\n",*bufftype);
+
+    g_sel_time = *bufftype;
 
-    struct timeval sel_time;
-    sel_time.tv_sec = le32toh(*secs);
     ipmi_ret_t rc = IPMI_CC_OK;
-    int rct = settimeofday(&sel_time, NULL);
-
-    if(rct == 0)
-    {
-	system("hwclock -w");
-    }
-    else
-    {
-        printf("settimeofday() failed\n");
-        rc = IPMI_CC_UNSPECIFIED_ERROR;
-    }
     *data_len = 0;
     return rc;
 }
diff --git a/transporthandler.C b/transporthandler.C
index 0f7a730..ca8522d 100644
--- a/transporthandler.C
+++ b/transporthandler.C
@@ -31,6 +31,8 @@ ipmi_ret_t ipmi_transport_set_lan(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 {
     ipmi_ret_t rc = IPMI_CC_OK;
     *data_len = 0;
+
+    int i = 0;
     char syscmd[128];
 
     printf("IPMI SET_LAN\n");
-- 
2.6.3
