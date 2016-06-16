Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rVhKJ1xf1zDq5d
 for <openbmc@lists.ozlabs.org>; Thu, 16 Jun 2016 21:40:51 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466077244186822.0631734583303;
 Thu, 16 Jun 2016 04:40:44 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: tomjose <tomjoseph@in.ibm.com>
Subject: [PATCH phosphor-host-ipmid v4] Whitelist IPMI commands based on
 Restricted mode
Date: Thu, 16 Jun 2016 06:40:41 -0500
Message-Id: <20160616114041.11908-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.4
In-Reply-To: <20160616114041.11908-1-openbmc-patches@stwcx.xyz>
References: <20160616114041.11908-1-openbmc-patches@stwcx.xyz>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Jun 2016 11:40:53 -0000

From: tomjose <tomjoseph@in.ibm.com>

Whitelisting of IPMI commands is done to ensure that
in restricted mode only whitelisted commands are
executed. Commands that are not whitelisted is
restricted and insufficient privilege is returned
as the completion code.

When the server is deployed it would be set to restricted
mode. In this scenario certain IPMI commands need to
be restricted which would not be addded to the whitelist
---
 Makefile    |   3 +-
 ipmid-api.h |   1 +
 ipmid.C     | 118 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 120 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 7a3b6af..fdae66c 100644
--- a/Makefile
+++ b/Makefile
@@ -38,6 +38,7 @@ CFLAGS += -Wall -Wno-unused-result
 INC_FLAG += $(shell pkg-config --cflags --libs libsystemd) -I. -O2
 LIB_FLAG += $(shell pkg-config  --libs libsystemd) -rdynamic
 IPMID_PATH ?= -DHOST_IPMI_LIB_PATH=\"/usr/lib/host-ipmid/\"
+WHITELIST_PATH?= -DIPMI_WHITELIST_CONF=\"/usr/share/host-ipmid/whitelist.conf\"
 
 DESTDIR ?= /
 SBINDIR ?= /usr/sbin
@@ -47,7 +48,7 @@ LIBDIR ?= /usr/lib
 all: $(DAEMON) $(LIB_APP) $(LIB_HOST_SRV) $(TESTER)
 
 %.o: %.C
-	$(CXX) -std=c++14 -fpic -c $< $(CXXFLAGS) $(INC_FLAG) $(IPMID_PATH) -o $@
+	$(CXX) -std=c++14 -fpic -c $< $(CXXFLAGS) $(INC_FLAG) $(IPMID_PATH) $(WHITELIST_PATH) -o $@
 
 $(LIB_APP): $(LIB_APP_OBJ)
 	$(CXX) $^ -shared $(LDFLAGS) $(LIB_FLAG) -o $@
diff --git a/ipmid-api.h b/ipmid-api.h
index cf3eaab..0c92069 100644
--- a/ipmid-api.h
+++ b/ipmid-api.h
@@ -97,6 +97,7 @@ enum ipmi_return_codes
     IPMI_CC_PARM_OUT_OF_RANGE = 0xC9,
     IPMI_CC_SENSOR_INVALID = 0xCB,
     IPMI_CC_RESPONSE_ERROR = 0xCE,
+    IPMI_CC_INSUFFICIENT_PRIVILEGE = 0xD4,
     IPMI_CC_UNSPECIFIED_ERROR = 0xFF,
 };
 
diff --git a/ipmid.C b/ipmid.C
index 7354958..f382778 100644
--- a/ipmid.C
+++ b/ipmid.C
@@ -12,10 +12,15 @@
 #include <sys/time.h>
 #include <errno.h>
 #include "sensorhandler.h"
+#include <fstream>
+#include <set>
 
 sd_bus *bus = NULL;
 sd_bus_slot *ipmid_slot = NULL;
 
+// Initialise restricted mode to true
+bool restricted_mode = true;
+
 FILE *ipmiio, *ipmidbus, *ipmicmddetails;
 
 void print_usage(void) {
@@ -26,10 +31,15 @@ void print_usage(void) {
   fprintf(stderr, "    mask : 0xFF - Print all trace\n");
 }
 
+// Host settings in DBUS
+const char *settings_host_bus = "org.openbmc.settings.Host";
+const char *settings_host_object = "/org/openbmc/settings/host0";
+const char *settings_host_intf = "org.freedesktop.DBus.Properties";
+
 const char * DBUS_INTF = "org.openbmc.HostIpmi";
 
 const char * FILTER = "type='signal',interface='org.openbmc.HostIpmi',member='ReceivedMessage'";
-
+const char * RESTRICTED_MODE_FILTER = "type='signal',interface='org.freedesktop.DBus.Properties',path='/org/openbmc/settings/host0'";
 
 typedef std::pair<ipmi_netfn_t, ipmi_cmd_t> ipmi_fn_cmd_t;
 typedef std::pair<ipmid_callback_t, ipmi_context_t> ipmi_fn_context_t;
@@ -37,6 +47,10 @@ typedef std::pair<ipmid_callback_t, ipmi_context_t> ipmi_fn_context_t;
 // Global data structure that contains the IPMI command handler's registrations.
 std::map<ipmi_fn_cmd_t, ipmi_fn_context_t> g_ipmid_router_map;
 
+// Global data structure that contains the list of IPMI commands that are whitelisted.
+std::set<ipmi_fn_cmd_t> g_ipmi_whitelist;
+
+
 // IPMI Spec, shared Reservation ID.
 unsigned short g_sel_reserve = 0xFFFF;
 
@@ -157,6 +171,21 @@ ipmi_ret_t ipmi_netfn_router(ipmi_netfn_t netfn, ipmi_cmd_t cmd, ipmi_request_t
     // Extract the map data onto appropriate containers
     auto handler_and_context = iter->second;
 
+    // If restricted mode is true and command is not whitelisted, don't
+    // execute the command
+    if(restricted_mode)
+    {
+        auto iter = g_ipmi_whitelist.find(std::make_pair(netfn, cmd));
+        if(iter == g_ipmi_whitelist.end())
+        {
+            printf("Net function:[0x%X], Command:[0x%X] is not whitelisted\n", netfn, cmd);
+            rc = IPMI_CC_INSUFFICIENT_PRIVILEGE;
+            memcpy(response, &rc, IPMI_CC_LEN);
+            *data_len = IPMI_CC_LEN;
+            return rc;
+        }
+    }
+
     // Creating a pointer type casted to char* to make sure we advance 1 byte
     // when we advance pointer to next's address. advancing void * would not
     // make sense.
@@ -236,6 +265,81 @@ final:
     return r < 0 ? EXIT_FAILURE : EXIT_SUCCESS;
 }
 
+void cache_restricted_mode()
+{
+    sd_bus *bus = ipmid_get_sd_bus_connection();
+    sd_bus_message *reply = NULL;
+    sd_bus_error error = SD_BUS_ERROR_NULL;
+    int rc = 0;
+
+    rc = sd_bus_call_method(bus,
+                            settings_host_bus,
+                            settings_host_object,
+                            settings_host_intf,
+                            "Get",
+                            &error,
+                            &reply,
+                            "ss",
+                            settings_host_bus,
+                            "restricted_mode");
+    if(rc < 0)
+    {
+        fprintf(stderr, "Failed sd_bus_call_method method for "
+                        "restricted_mode: %s\n", strerror(-rc));
+        goto cleanup;
+    }
+
+    rc = sd_bus_message_read(reply, "v", "b", &restricted_mode);
+    if(rc < 0)
+    {
+        fprintf(stderr, "Failed to parse response message for"
+                " restricted_mode: %s\n", strerror(-rc));
+        // Fail-safe to restricted mode
+        restricted_mode = true;
+    }
+
+cleanup:
+    sd_bus_error_free(&error);
+    reply = sd_bus_message_unref(reply);
+}
+
+static int handle_restricted_mode_change(sd_bus_message *m, void *user_data,
+                                                    sd_bus_error *ret_error)
+{
+    cache_restricted_mode();
+    return 0;
+}
+
+void ipmi_populate_whitelist()
+{
+    std::ifstream file(IPMI_WHITELIST_CONF);
+    std::string str;
+    std::string str_netfn;
+    std::string str_cmd;
+    ipmi_netfn_t netfn;
+    ipmi_cmd_t cmd;
+    size_t pos = std::string::npos;
+
+    // Read the whitelist.conf file and insert the NetFn and Command pair.
+    // Each entry in the conf file looks like this 0x01:0x02
+    // ':' character is the separator between NetFn and Command.
+    while(std::getline(file, str))
+    {
+        pos = str.find(':');
+        if(pos != std::string::npos)
+        {
+            str_netfn.assign(str.substr(pos-2,pos-1));
+            str_cmd.assign(str.substr(pos+3,pos+4));
+
+            netfn = strtoul(str_netfn.c_str(), NULL, 16);
+            cmd = strtoul(str_cmd.c_str(), NULL, 16);
+
+            g_ipmi_whitelist.emplace(std::make_pair(netfn, cmd));
+        }
+    }
+}
+
+
 static int handle_ipmi_command(sd_bus_message *m, void *user_data, sd_bus_error
                          *ret_error) {
     int r = 0;
@@ -437,6 +541,18 @@ int main(int argc, char *argv[])
         goto finish;
     }
 
+    // Wait for changes on Restricted mode
+    r = sd_bus_add_match(bus, &ipmid_slot, RESTRICTED_MODE_FILTER, handle_restricted_mode_change, NULL);
+    if (r < 0) {
+        fprintf(stderr, "Failed: sd_bus_add_match: %s : %s\n", strerror(-r), RESTRICTED_MODE_FILTER);
+        goto finish;
+    }
+
+    // Initialise restricted mode
+    cache_restricted_mode();
+
+    // Populate the IPMI whitelisted commands from conf file
+    ipmi_populate_whitelist();
 
     for (;;) {
         /* Process requests */
-- 
2.8.4
