Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id C7BEF1A028C
 for <openbmc@lists.ozlabs.org>; Wed, 13 Jan 2016 19:00:38 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1452672031941270.5089468396603;
 Wed, 13 Jan 2016 00:00:31 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid] Re submitting plugin support for Host
 Services
Date: Wed, 13 Jan 2016 02:00:30 -0600
Message-Id: <1452672030-18329-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1452672030-18329-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1452672030-18329-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 13 Jan 2016 08:00:39 -0000

From: vishwa <vishwanath@in.ibm.com>

---
 Makefile        |  12 +++-
 host-services.c | 171 +++++++++++++++++++++++++++++++-------------------------
 ipmid-api.h     |   1 +
 ipmid.C         |  15 +++--
 4 files changed, 111 insertions(+), 88 deletions(-)

diff --git a/Makefile b/Makefile
index 57ad6fe..472bfaa 100644
--- a/Makefile
+++ b/Makefile
@@ -5,7 +5,7 @@ TESTER = testit
 TESTADDSEL = testaddsel
 
 DAEMON = ipmid
-DAEMON_OBJ  = ipmid.o host-services.o
+DAEMON_OBJ  = ipmid.o
 
 LIB_APP_OBJ = apphandler.o     \
               sensorhandler.o  \
@@ -16,6 +16,7 @@ LIB_APP_OBJ = apphandler.o     \
               storageaddsel.o  \
               transporthandler.o  \
 
+LIB_HOST_SRV_OBJ = host-services.o
 
 TESTADDSEL_OBJ = $(TESTADDSEL).o \
                  storageaddsel.o
@@ -24,7 +25,9 @@ TESTER_OBJ = ipmisensor.o 	   \
 	     testit.o
 
 LIB_APP     = libapphandler.so
-INSTALLED_LIBS += $(LIB_APP)
+LIB_HOST_SRV = libhostservice.so
+
+INSTALLED_LIBS += $(LIB_APP) $(LIB_HOST_SRV)
 INSTALLED_HEADERS = ipmid-api.h
 
 CXXFLAGS += -Wall -Wno-unused-result
@@ -39,7 +42,7 @@ SBINDIR ?= /usr/sbin
 INCLUDEDIR ?= /usr/include
 LIBDIR ?= /usr/lib
 
-all: $(DAEMON) $(LIB_APP) $(TESTER)
+all: $(DAEMON) $(LIB_APP) $(LIB_HOST_SRV) $(TESTER)
 
 %.o: %.C
 	$(CXX) -std=c++14 -fpic -c $< $(CXXFLAGS) $(INC_FLAG) $(IPMID_PATH) -o $@
@@ -47,6 +50,9 @@ all: $(DAEMON) $(LIB_APP) $(TESTER)
 $(LIB_APP): $(LIB_APP_OBJ)
 	$(CXX) $^ -shared $(LDFLAGS) $(LIB_FLAG) -o $@
 
+$(LIB_HOST_SRV): $(LIB_HOST_SRV_OBJ)
+	$(CXX) $^ -shared $(LDFLAGS) $(LIB_FLAG) -o $@
+
 $(DAEMON): $(DAEMON_OBJ)
 	$(CXX) $^ $(LDFLAGS) $(LIB_FLAG) -o $@ -ldl
 
diff --git a/host-services.c b/host-services.c
index ab9cfcc..23aa55e 100644
--- a/host-services.c
+++ b/host-services.c
@@ -5,6 +5,8 @@
 
 #include "ipmid-api.h"
 
+void register_host_services() __attribute__((constructor));
+
 // OpenBMC Host IPMI dbus framework
 const char  *bus_name      =  "org.openbmc.HostIpmi";
 const char  *object_name   =  "/org/openbmc/HostIpmi/1";
@@ -13,69 +15,69 @@ const char  *intf_name     =  "org.openbmc.HostIpmi";
 //-------------------------------------------------------------------
 // Gets called by PowerOff handler when a Soft Power off is requested
 //-------------------------------------------------------------------
-static int soft_power_off(sd_bus_message *m, void *userdata, sd_bus_error *ret_error) 
+static int soft_power_off(sd_bus_message *m, void *userdata, sd_bus_error *ret_error)
 {
-	int64_t bt_resp = -1;
-	int rc = 0;
-
-	// Steps to be taken when we get this.
-	// 	1: Send a SMS_ATN to the Host
-	// 	2: Host receives it and sends a GetMsgFlags IPMI command
-	// 	3: IPMID app handler will respond to that with a MSgFlag with bit:0x2
-	// 	   set indicating we have a message for Host
-	// 	4: Host sends a GetMsgBuffer command and app handler will respond to
-	// 	   that with a OEM-SEL with certain fields packed indicating to the 
-	// 	   host	that it do a shutdown of the partitions.   
-	// 	5: Host does the partition shutdown and calls Chassis Power off command
-	// 	6: App handler handles the command by making a call to ChassisManager
-	// 	   Dbus
-	
-	// Now the job is to send the SMS_ATTN.
-	
+    int64_t bt_resp = -1;
+    int rc = 0;
+
+    // Steps to be taken when we get this.
+    //  1: Send a SMS_ATN to the Host
+    //  2: Host receives it and sends a GetMsgFlags IPMI command
+    //  3: IPMID app handler will respond to that with a MSgFlag with bit:0x2
+    //     set indicating we have a message for Host
+    //  4: Host sends a GetMsgBuffer command and app handler will respond to
+    //     that with a OEM-SEL with certain fields packed indicating to the
+    //     host that it do a shutdown of the partitions.
+    //  5: Host does the partition shutdown and calls Chassis Power off command
+    //  6: App handler handles the command by making a call to ChassisManager
+    //     Dbus
+
+    // Now the job is to send the SMS_ATTN.
+
     // Req message contains the specifics about which method etc that we want to
     // access on which bus, object
     sd_bus_message *response = NULL;
 
-	// Error return mechanism
+    // Error return mechanism
     sd_bus_error bus_error = SD_BUS_ERROR_NULL;
 
-	// Gets a hook onto either a SYSTEM or SESSION bus
-	sd_bus *bus = ipmid_get_sd_bus_connection();
-
-	rc = sd_bus_call_method(bus,        // On the System Bus
-							bus_name,        // Service to contact
-							object_name,     // Object path 
-							intf_name,       // Interface name
-							"setAttention",  // Method to be called
-							&bus_error,      // object to return error
-							&response,		 // Response buffer if any
-							NULL);			 // No input arguments
-	if(rc < 0)
-	{
-		fprintf(stderr,"ERROR initiating Power Off:[%s]\n",bus_error.message);
-		goto finish;
-	}
-
-	// See if we were able to successfully raise SMS_ATN
+    // Gets a hook onto either a SYSTEM or SESSION bus
+    sd_bus *bus = ipmid_get_sd_bus_connection();
+
+    rc = sd_bus_call_method(bus,             // In the System Bus
+                            bus_name,        // Service to contact
+                            object_name,     // Object path
+                            intf_name,       // Interface name
+                            "setAttention",  // Method to be called
+                            &bus_error,      // object to return error
+                            &response,       // Response buffer if any
+                            NULL);           // No input arguments
+    if(rc < 0)
+    {
+        fprintf(stderr,"ERROR initiating Power Off:[%s]\n",bus_error.message);
+        goto finish;
+    }
+
+    // See if we were able to successfully raise SMS_ATN
     rc = sd_bus_message_read(response, "x", &bt_resp);
-    if (rc < 0) 
-	{
-		fprintf(stderr, "Failed to get a rc from BT for SMS_ATN: %s\n", strerror(-rc));
-		goto finish;
+    if (rc < 0)
+    {
+        fprintf(stderr, "Failed to get a rc from BT for SMS_ATN: %s\n", strerror(-rc));
+        goto finish;
     }
 
 finish:
     sd_bus_error_free(&bus_error);
     sd_bus_message_unref(response);
 
-	if(rc < 0)
-	{
-		return sd_bus_reply_method_return(m, "x", rc);
-	}
-	else
-	{
-		return sd_bus_reply_method_return(m, "x", bt_resp);
-	}
+    if(rc < 0)
+    {
+        return sd_bus_reply_method_return(m, "x", rc);
+    }
+    else
+    {
+        return sd_bus_reply_method_return(m, "x", bt_resp);
+    }
 }
 
 //-------------------------------------------
@@ -83,10 +85,10 @@ finish:
 //-------------------------------------------
 static const sd_bus_vtable host_services_vtable[] =
 {
-	SD_BUS_VTABLE_START(0),
-	// Takes No("") arguments -but- returns a value of type 64 bit integer("x")
-	SD_BUS_METHOD("SoftPowerOff", "", "x", &soft_power_off, SD_BUS_VTABLE_UNPRIVILEGED),
-	SD_BUS_VTABLE_END,
+    SD_BUS_VTABLE_START(0),
+    // Takes No("") arguments -but- returns a value of type 64 bit integer("x")
+    SD_BUS_METHOD("SoftPowerOff", "", "x", &soft_power_off, SD_BUS_VTABLE_UNPRIVILEGED),
+    SD_BUS_VTABLE_END,
 };
 
 //------------------------------------------------------
@@ -94,28 +96,43 @@ static const sd_bus_vtable host_services_vtable[] =
 // -----------------------------------------------------
 int start_host_service(sd_bus *bus, sd_bus_slot *slot)
 {
-	int rc = 0;
-
-	/* Install the object */
-	rc = sd_bus_add_object_vtable(bus,
-								 &slot,
-								"/org/openbmc/HostServices",  /* object path */
-								"org.openbmc.HostServices",   /* interface name */
-								host_services_vtable,
-								NULL);
-	if (rc < 0) 
-	{
-		fprintf(stderr, "Failed to issue method call: %s\n", strerror(-rc));
-	}
-	else
-	{
-		/* Take one in OpenBmc */
-		rc = sd_bus_request_name(bus, "org.openbmc.HostServices", 0);
-		if (rc < 0) 
-		{
-			fprintf(stderr, "Failed to acquire service name: %s\n", strerror(-rc));
-		}
-	}
-
-	return rc < 0 ? EXIT_FAILURE : EXIT_SUCCESS;
+    int rc = 0;
+
+    /* Install the object */
+    rc = sd_bus_add_object_vtable(bus,
+                                 &slot,
+                                "/org/openbmc/HostServices",  /* object path */
+                                "org.openbmc.HostServices",   /* interface name */
+                                host_services_vtable,
+                                NULL);
+    if (rc < 0)
+    {
+        fprintf(stderr, "Failed to issue method call: %s\n", strerror(-rc));
+    }
+    else
+    {
+        /* Take one in OpenBmc */
+        rc = sd_bus_request_name(bus, "org.openbmc.HostServices", 0);
+        if (rc < 0)
+        {
+            fprintf(stderr, "Failed to acquire service name: %s\n", strerror(-rc));
+        }
+    }
+
+    return rc < 0 ? EXIT_FAILURE : EXIT_SUCCESS;
+}
+
+//------------------------------------------------------
+// Callback register function
+// -----------------------------------------------------
+void register_host_services()
+{
+    // Gets a hook onto SYSTEM bus used by host-ipmid
+    sd_bus *bus = ipmid_get_sd_bus_connection();
+
+    // Gets a hook onto SYSTEM bus slot used by host-ipmid
+    sd_bus_slot *ipmid_slot = ipmid_get_sd_bus_slot();
+
+    //start_host_service(bus, ipmid_slot);
+    start_host_service(bus, ipmid_slot);
 }
diff --git a/ipmid-api.h b/ipmid-api.h
index 4f4b9de..4f00798 100644
--- a/ipmid-api.h
+++ b/ipmid-api.h
@@ -97,6 +97,7 @@ enum ipmi_return_codes
 };
 
 sd_bus *ipmid_get_sd_bus_connection(void);
+sd_bus_slot *ipmid_get_sd_bus_slot(void);
 
 #ifdef __cplusplus
 }
diff --git a/ipmid.C b/ipmid.C
index 6071cb3..0126779 100644
--- a/ipmid.C
+++ b/ipmid.C
@@ -13,9 +13,8 @@
 #include <errno.h>
 #include "sensorhandler.h"
 
-
-
 sd_bus *bus = NULL;
+sd_bus_slot *ipmid_slot = NULL;
 
 FILE *ipmiio, *ipmidbus, *ipmicmddetails;
 
@@ -373,9 +372,12 @@ sd_bus *ipmid_get_sd_bus_connection(void) {
     return bus;
 }
 
+sd_bus_slot *ipmid_get_sd_bus_slot(void) {
+    return ipmid_slot;
+}
+
 int main(int argc, char *argv[])
 {
-    sd_bus_slot *slot = NULL;
     int r;
     unsigned long tvalue;
     int c;
@@ -418,11 +420,8 @@ int main(int argc, char *argv[])
     // Register all the handlers that provider implementation to IPMI commands.
     ipmi_register_callback_handlers(HOST_IPMI_LIB_PATH);
 
-	// Start the Host Services Dbus Objects
-	start_host_service(bus, slot);
-
 	// Watch for BT messages
-    r = sd_bus_add_match(bus, &slot, FILTER, handle_ipmi_command, NULL);
+    r = sd_bus_add_match(bus, &ipmid_slot, FILTER, handle_ipmi_command, NULL);
     if (r < 0) {
         fprintf(stderr, "Failed: sd_bus_add_match: %s : %s\n", strerror(-r), FILTER);
         goto finish;
@@ -448,7 +447,7 @@ int main(int argc, char *argv[])
     }
 
 finish:
-    sd_bus_slot_unref(slot);
+    sd_bus_slot_unref(ipmid_slot);
     sd_bus_unref(bus);
     return r < 0 ? EXIT_FAILURE : EXIT_SUCCESS;
 
-- 
2.6.4
