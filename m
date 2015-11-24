Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 29AC91A0340
 for <openbmc@lists.ozlabs.org>; Wed, 25 Nov 2015 04:50:33 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1448387426841121.38689844471537;
 Tue, 24 Nov 2015 09:50:26 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v3] IPMI soft power off
Date: Tue, 24 Nov 2015 12:50:25 -0500
Message-Id: <1448387425-19786-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1448387425-19786-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1448387425-19786-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 24 Nov 2015 17:50:34 -0000

From: vishwa <vishwanath@in.ibm.com>

---
 Makefile         |   5 +--
 apphandler.C     |  67 +++++++++++++++++++++++++++++--
 apphandler.h     |  33 ++++++++++++++-
 chassishandler.C |  85 ++++++++++++++++++++++++++++++++++++++-
 chassishandler.h |  15 +++++++
 host-services.c  | 119 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 host-services.h  |   3 ++
 ipmid-api.h      |   2 +-
 ipmid.C          |   6 ++-
 ipmid.H          |   1 +
 10 files changed, 324 insertions(+), 12 deletions(-)
 create mode 100644 host-services.c
 create mode 100644 host-services.h

diff --git a/Makefile b/Makefile
index 1a37c0f..1851c9f 100644
--- a/Makefile
+++ b/Makefile
@@ -5,8 +5,7 @@ TESTER = testit
 TESTADDSEL = testaddsel
 
 DAEMON = ipmid
-DAEMON_OBJ  = $(DAEMON).o
-
+DAEMON_OBJ  = ipmid.o host-services.o
 
 LIB_APP_OBJ = apphandler.o     \
               sensorhandler.o  \
@@ -28,7 +27,7 @@ LIB_APP     = libapphandler.so
 INSTALLED_LIBS += $(LIB_APP)
 INSTALLED_HEADERS = ipmid-api.h
 
-INC_FLAG += $(shell pkg-config --cflags --libs libsystemd) -I. -O2 
+INC_FLAG += $(shell pkg-config --cflags --libs libsystemd) -I. -O2
 LIB_FLAG += $(shell pkg-config  --libs libsystemd) -rdynamic
 IPMID_PATH ?= -DHOST_IPMI_LIB_PATH=\"/usr/lib/host-ipmid/\"
 
diff --git a/apphandler.C b/apphandler.C
index 6467397..d3df330 100644
--- a/apphandler.C
+++ b/apphandler.C
@@ -10,19 +10,75 @@ extern sd_bus *bus;
 
 void register_netfn_app_functions() __attribute__((constructor));
 
+//---------------------------------------------------------------------
+// Called by Host on seeing a SMS_ATN bit set. Return a hardcoded 
+// value of 0x2 indicating we need Host read some data.
+//-------------------------------------------------------------------
+ipmi_ret_t ipmi_app_get_msg_flags(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
+                             ipmi_request_t request, ipmi_response_t response,
+                             ipmi_data_len_t data_len, ipmi_context_t context)
+{
+	// Generic return from IPMI commands.
+    ipmi_ret_t rc = IPMI_CC_OK;
+
+    printf("IPMI APP GET MSG FLAGS returning with [bit:2] set\n");
+
+	// From IPMI spec V2.0 for Get Message Flags Command :
+	// bit:[1] from LSB : 1b = Event Message Buffer Full. 
+	// Return as 0 if Event Message Buffer is not supported, 
+	// or when the Event Message buffer is disabled.
+	// TODO. For now. assume its not disabled and send "0x2" anyway:
+
+	uint8_t set_event_msg_buffer_full = 0x2;
+    *data_len = sizeof(set_event_msg_buffer_full);
+
+    // Pack the actual response
+    memcpy(response, &set_event_msg_buffer_full, *data_len);
+
+    return rc;
+}
 
+//-------------------------------------------------------------------
+// Called by Host post response from Get_Message_Flags
+//-------------------------------------------------------------------
 ipmi_ret_t ipmi_app_read_event(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
                              ipmi_request_t request, ipmi_response_t response,
                              ipmi_data_len_t data_len, ipmi_context_t context)
 {
     ipmi_ret_t rc = IPMI_CC_OK;
-    *data_len = 0;
+    printf("IPMI APP READ EVENT command received\n");
 
-    printf("IPMI APP READ EVENT Ignoring for now\n");
-    return rc;
+	// TODO : For now, this is catering only to the Soft Power Off via OEM SEL
+	//        mechanism. If we need to make this generically used for some
+	//        other conditions, then we can take advantage of context pointer.
 
-}
+	struct oem_sel_timestamped soft_off = {0};
+    *data_len = sizeof(struct oem_sel_timestamped);
+
+	// either id[0] -or- id[1] can be filled in. We will use id[0]
+	soft_off.id[0]	 = SEL_OEM_ID_0;
+	soft_off.id[1]	 = SEL_OEM_ID_0;
+	soft_off.type	 = SEL_RECORD_TYPE_OEM;
+
+	// Following 3 bytes are from IANA Manufactre_Id field. See below
+	soft_off.manuf_id[0]= 0x41;
+	soft_off.manuf_id[1]= 0xA7;
+	soft_off.manuf_id[2]= 0x00;
+
+	// per IPMI spec NetFuntion for OEM
+	soft_off.netfun	 = 0x3A;
 
+	// Mechanism to kick start soft shutdown.
+	soft_off.cmd	 = CMD_POWER;
+	soft_off.data[0] = SOFT_OFF;
+
+	// All '0xFF' since unused.
+	memset(&soft_off.data[1], 0xFF, 3);
+
+    // Pack the actual response
+    memcpy(response, &soft_off, *data_len);
+    return rc;
+}
 
 ipmi_ret_t ipmi_app_set_acpi_power_state(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
                              ipmi_request_t request, ipmi_response_t response,
@@ -359,6 +415,9 @@ void register_netfn_app_functions()
     ipmi_register_callback(NETFUN_APP, IPMI_CMD_SET_BMC_GLOBAL_ENABLES, NULL,
                                             ipmi_app_set_bmc_global_enables);
 
+    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_APP, IPMI_CMD_GET_MSG_FLAGS);
+    ipmi_register_callback(NETFUN_APP, IPMI_CMD_GET_MSG_FLAGS, NULL, ipmi_app_get_msg_flags);
+
     return;
 }
 
diff --git a/apphandler.h b/apphandler.h
index 35a2b20..aa2a55d 100644
--- a/apphandler.h
+++ b/apphandler.h
@@ -1,6 +1,19 @@
 #ifndef __HOST_IPMI_APP_HANDLER_H__
 #define __HOST_IPMI_APP_HANDLER_H__
 
+#include <stdint.h>
+
+// These are per skiboot ipmi-sel code
+
+// OEM_SEL type with Timestamp
+#define SEL_OEM_ID_0		0x55
+// SEL type is OEM and -not- general SEL
+#define SEL_RECORD_TYPE_OEM	0xC0
+// Minor command for soft shurdown
+#define SOFT_OFF			0x00
+// Major command for Any kind of power ops
+#define CMD_POWER			0x04
+
 // IPMI commands for App net functions.
 enum ipmi_netfn_app_cmds
 {
@@ -11,9 +24,27 @@ enum ipmi_netfn_app_cmds
     IPMI_CMD_RESET_WD               = 0x22,
     IPMI_CMD_SET_WD                 = 0x24,
     IPMI_CMD_SET_BMC_GLOBAL_ENABLES = 0x2E,
+    IPMI_CMD_GET_MSG_FLAGS          = 0x31,
     IPMI_CMD_READ_EVENT             = 0x35,
     IPMI_CMD_GET_CAP_BIT            = 0x36,
-
 };
 
+// A Mechanism to tell host to shtudown hosts by sending this PEM SEL. Really
+// the only used fields by skiboot are:
+// id[0] / id[1] for ID_0 , ID_1
+// type : SEL_RECORD_TYPE_OEM as standard SELs are ignored by skiboot
+// cmd : CMD_POWER for power functions
+// data[0], specific commands.  example Soft power off. power cycle, etc.
+struct oem_sel_timestamped
+{
+	/* SEL header */
+	uint8_t id[2];
+	uint8_t type;
+	uint8_t manuf_id[3];
+	uint8_t timestamp[4];
+	/* OEM SEL data (6 bytes) follows */
+	uint8_t netfun;
+	uint8_t cmd;
+	uint8_t data[4];
+};
 #endif
diff --git a/chassishandler.C b/chassishandler.C
index d00a124..56b8375 100644
--- a/chassishandler.C
+++ b/chassishandler.C
@@ -4,6 +4,11 @@
 #include <string.h>
 #include <stdint.h>
 
+// OpenBMC Chassis Manager dbus framework
+const char  *chassis_bus_name      =  "org.openbmc.control.Chassis";
+const char  *chassis_object_name   =  "/org/openbmc/control/chassis0";
+const char  *chassis_intf_name     =  "org.openbmc.control.Chassis";
+
 void register_netfn_chassis_functions() __attribute__((constructor));
 
 struct get_sys_boot_options_t {
@@ -23,6 +28,82 @@ ipmi_ret_t ipmi_chassis_wildcard(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     return rc;
 }
 
+//------------------------------------------------------------
+// Calls into Chassis Control Dbus object to do the power off
+//------------------------------------------------------------
+int ipmi_chassis_power_off()
+{
+	// sd_bus error
+	int rc = 0;
+
+    // SD Bus error report mechanism.
+    sd_bus_error bus_error = SD_BUS_ERROR_NULL;
+
+	// Response from the call. Although there is no response for this call,
+	// obligated to mention this to make compiler happy.
+	sd_bus_message *response = NULL;
+
+	// Gets a hook onto either a SYSTEM or SESSION bus
+	sd_bus *bus_type = ipmid_get_sd_bus_connection();
+
+	rc = sd_bus_call_method(bus_type,        		 // On the System Bus
+							chassis_bus_name,        // Service to contact
+							chassis_object_name,     // Object path 
+							chassis_intf_name,       // Interface name
+							"powerOff",      		 // Method to be called
+							&bus_error,      		 // object to return error
+							&response,		 		 // Response buffer if any
+							NULL);			 		 // No input arguments
+	if(rc < 0)
+	{
+		fprintf(stderr,"ERROR initiating Power Off:[%s]\n",bus_error.message);
+	}
+	else
+	{
+		printf("Chassis Power Off initiated successfully\n");
+	}
+
+    sd_bus_error_free(&bus_error);
+    sd_bus_message_unref(response);
+
+	return rc;
+}
+
+//----------------------------------------------------------------------
+// Chassis Control commands
+//----------------------------------------------------------------------
+ipmi_ret_t ipmi_chassis_control(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
+                        ipmi_request_t request, ipmi_response_t response, 
+                        ipmi_data_len_t data_len, ipmi_context_t context)
+{
+	// Error from power off.
+	int rc = 0;
+
+	// No response for this command.
+    *data_len = 0;
+
+	// Catch the actual operaton by peeking into request buffer
+	uint8_t chassis_ctrl_cmd = *(uint8_t *)request;
+	printf("Chassis Control Command: Operation:[0x%X]\n",chassis_ctrl_cmd);
+
+	switch(chassis_ctrl_cmd)
+	{
+		case CMD_POWER_OFF:
+		case CMD_HARD_RESET:
+		{
+			rc = ipmi_chassis_power_off();
+			break;
+		}
+		default:
+		{
+			fprintf(stderr, "Invalid Chassis Control command:[0x%X] received\n",chassis_ctrl_cmd);
+			rc = -1;
+		}
+	}
+
+	return ( (rc < 0) ? IPMI_CC_INVALID : IPMI_CC_OK);
+}
+
 ipmi_ret_t ipmi_chassis_get_sys_boot_options(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
                               ipmi_request_t request, ipmi_response_t response, 
                               ipmi_data_len_t data_len, ipmi_context_t context)
@@ -58,5 +139,7 @@ void register_netfn_chassis_functions()
 
     printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_CHASSIS, IPMI_CMD_GET_SYS_BOOT_OPTIONS);
     ipmi_register_callback(NETFUN_CHASSIS, IPMI_CMD_GET_SYS_BOOT_OPTIONS, NULL, ipmi_chassis_get_sys_boot_options);
-}
 
+    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_CHASSIS, IPMI_CMD_CHASSIS_CONTROL);
+    ipmi_register_callback(NETFUN_CHASSIS, IPMI_CMD_CHASSIS_CONTROL, NULL, ipmi_chassis_control);
+}
diff --git a/chassishandler.h b/chassishandler.h
index 99ed366..1a26411 100644
--- a/chassishandler.h
+++ b/chassishandler.h
@@ -1,9 +1,13 @@
 #ifndef __HOST_IPMI_CHASSIS_HANDLER_H__
 #define __HOST_IPMI_CHASSIS_HANDLER_H__
 
+#include <stdint.h>
+
 // IPMI commands for Chassis net functions.
 enum ipmi_netfn_app_cmds
 {
+	// Chassis Control
+	IPMI_CMD_CHASSIS_CONTROL	  = 0x02,
     // Get capability bits
     IPMI_CMD_GET_SYS_BOOT_OPTIONS = 0x09,
 };
@@ -14,4 +18,15 @@ enum ipmi_chassis_return_codes
     IPMI_CC_PARM_NOT_SUPPORTED = 0x80,
 };
 
+// Various Chassis operations under a single command.
+enum ipmi_chassis_control_cmds : uint8_t
+{
+	CMD_POWER_OFF 			   = 0x00,
+	CMD_POWER_ON 			   = 0x01,
+	CMD_POWER_CYCLE 		   = 0x02,
+	CMD_HARD_RESET 			   = 0x03,
+	CMD_PULSE_DIAGNOSTIC_INTR  = 0x04,
+	CMD_SOFT_OFF_VIA_OVER_TEMP = 0x05,
+};
+
 #endif
diff --git a/host-services.c b/host-services.c
new file mode 100644
index 0000000..89f0b6c
--- /dev/null
+++ b/host-services.c
@@ -0,0 +1,119 @@
+#include <stdio.h>
+#include <stdlib.h>
+#include <errno.h>
+#include <systemd/sd-bus.h>
+
+// OpenBMC Host IPMI dbus framework
+const char  *bus_name      =  "org.openbmc.HostIpmi";
+const char  *object_name   =  "/org/openbmc/HostIpmi/1";
+const char  *intf_name     =  "org.openbmc.HostIpmi";
+
+//-------------------------------------------------------------------
+// Gets called by PowerOff handler when a Soft Power off is requested
+//-------------------------------------------------------------------
+static int soft_power_off(sd_bus_message *m, void *userdata, sd_bus_error *ret_error) 
+{
+	int64_t bt_resp = -1;
+	int rc = 0;
+
+	// Steps to be taken when we get this.
+	// 	1: Send a SMS_ATN to the Host
+	// 	2: Host receives it and sends a GetMsgFlags IPMI command
+	// 	3: IPMID app handler will respond to that with a MSgFlag with bit:0x2
+	// 	   set indicating we have a message for Host
+	// 	4: Host sends a GetMsgBuffer command and app handler will respond to
+	// 	   that with a OEM-SEL with certain fields packed indicating to the 
+	// 	   host	that it do a shutdown of the partitions.   
+	// 	5: Host does the partition shutdown and calls Chassis Power off command
+	// 	6: App handler handles the command by making a call to ChassisManager
+	// 	   Dbus
+	
+	// Now the job is to send the SMS_ATTN.
+	
+    // Req message contains the specifics about which method etc that we want to
+    // access on which bus, object
+    sd_bus_message *response = NULL;
+
+	// Error return mechanism
+    sd_bus_error bus_error = SD_BUS_ERROR_NULL;
+
+	// Gets a hook onto either a SYSTEM or SESSION bus
+	sd_bus *bus = (sd_bus *)ipmid_get_sd_bus_connection();
+
+	rc = sd_bus_call_method(bus,        // On the System Bus
+							bus_name,        // Service to contact
+							object_name,     // Object path 
+							intf_name,       // Interface name
+							"setAttention",  // Method to be called
+							&bus_error,      // object to return error
+							&response,		 // Response buffer if any
+							NULL);			 // No input arguments
+	if(rc < 0)
+	{
+		fprintf(stderr,"ERROR initiating Power Off:[%s]\n",bus_error.message);
+		goto finish;
+	}
+
+	// See if we were able to successfully raise SMS_ATN
+    rc = sd_bus_message_read(response, "x", &bt_resp);
+    if (rc < 0) 
+	{
+		fprintf(stderr, "Failed to get a rc from BT for SMS_ATN: %s\n", strerror(-rc));
+		goto finish;
+    }
+
+finish:
+    sd_bus_error_free(&bus_error);
+    sd_bus_message_unref(response);
+
+	if(rc < 0)
+	{
+		return sd_bus_reply_method_return(m, "x", rc);
+	}
+	else
+	{
+		return sd_bus_reply_method_return(m, "x", bt_resp);
+	}
+}
+
+//-------------------------------------------
+// Function pointer of APIs exposed via Dbus
+//-------------------------------------------
+static const sd_bus_vtable host_services_vtable[] =
+{
+	SD_BUS_VTABLE_START(0),
+	// Takes No("") arguments -but- returns a value of type 64 bit integer("x")
+	SD_BUS_METHOD("SoftPowerOff", "", "x", &soft_power_off, SD_BUS_VTABLE_UNPRIVILEGED),
+	SD_BUS_VTABLE_END,
+};
+
+//------------------------------------------------------
+// Called by IPMID as part of the start up
+// -----------------------------------------------------
+int start_host_service(sd_bus *bus, sd_bus_slot *slot)
+{
+	int rc = 0;
+
+	/* Install the object */
+	rc = sd_bus_add_object_vtable(bus,
+								 &slot,
+								"/org/openbmc/HostServices",  /* object path */
+								"org.openbmc.HostServices",   /* interface name */
+								host_services_vtable,
+								NULL);
+	if (rc < 0) 
+	{
+		fprintf(stderr, "Failed to issue method call: %s\n", strerror(-rc));
+	}
+	else
+	{
+		/* Take one in OpenBmc */
+		rc = sd_bus_request_name(bus, "org.openbmc.HostServices", 0);
+		if (rc < 0) 
+		{
+			fprintf(stderr, "Failed to acquire service name: %s\n", strerror(-rc));
+		}
+	}
+
+	return rc < 0 ? EXIT_FAILURE : EXIT_SUCCESS;
+}
diff --git a/host-services.h b/host-services.h
new file mode 100644
index 0000000..0d93480
--- /dev/null
+++ b/host-services.h
@@ -0,0 +1,3 @@
+#include <systemd/sd-bus.h>
+
+extern "C" int start_host_service(sd_bus *, sd_bus_slot *);
diff --git a/ipmid-api.h b/ipmid-api.h
index 5da7636..2d58961 100644
--- a/ipmid-api.h
+++ b/ipmid-api.h
@@ -53,7 +53,7 @@ typedef ipmi_ret_t (*ipmid_callback_t)(ipmi_netfn_t, ipmi_cmd_t, ipmi_request_t,
 // information of netfn, cmd, callback handler pointer and context data.
 // Making this a extern "C" so that plugin libraries written in C can also use
 // it.
-extern "C" void ipmi_register_callback(ipmi_netfn_t, ipmi_cmd_t, 
+extern "C" void ipmi_register_callback(ipmi_netfn_t, ipmi_cmd_t,
                                        ipmi_context_t, ipmid_callback_t);
 
 // These are the command network functions, the response
diff --git a/ipmid.C b/ipmid.C
index 6b1eacc..440705c 100644
--- a/ipmid.C
+++ b/ipmid.C
@@ -40,7 +40,6 @@ typedef std::pair<ipmid_callback_t, ipmi_context_t> ipmi_fn_context_t;
 std::map<ipmi_fn_cmd_t, ipmi_fn_context_t> g_ipmid_router_map;
 
 
-
 #ifndef HEXDUMP_COLS
 #define HEXDUMP_COLS 16
 #endif
@@ -418,6 +417,10 @@ int main(int argc, char *argv[])
     // Register all the handlers that provider implementation to IPMI commands.
     ipmi_register_callback_handlers(HOST_IPMI_LIB_PATH);
 
+	// Start the Host Services Dbus Objects
+	start_host_service(bus, slot);
+
+	// Watch for BT messages
     r = sd_bus_add_match(bus, &slot, FILTER, handle_ipmi_command, NULL);
     if (r < 0) {
         fprintf(stderr, "Failed: sd_bus_add_match: %s : %s\n", strerror(-r), FILTER);
@@ -427,7 +430,6 @@ int main(int argc, char *argv[])
 
     for (;;) {
         /* Process requests */
-
         r = sd_bus_process(bus, NULL);
         if (r < 0) {
             fprintf(stderr, "Failed to process bus: %s\n", strerror(-r));
diff --git a/ipmid.H b/ipmid.H
index 73b60e6..3de2c8c 100644
--- a/ipmid.H
+++ b/ipmid.H
@@ -2,6 +2,7 @@
 #define __HOST_IPMID_IPMI_H__
 #include "ipmid-api.h"
 #include <stdio.h>
+#include "host-services.h"
 
 // When the requester sends in a netfn and a command along with data, this
 // function will look for registered handlers that will handle that [netfn,cmd]
-- 
2.6.3
