Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 55A7D1A0C57
 for <openbmc@lists.ozlabs.org>; Sat, 14 Nov 2015 08:00:30 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447448425284293.4155325764093;
 Fri, 13 Nov 2015 13:00:25 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid] ipmid taking too many dbus connections
Date: Fri, 13 Nov 2015 16:00:23 -0500
Message-Id: <1447448423-12662-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447448423-12662-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1447448423-12662-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 13 Nov 2015 21:00:30 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 ipmid-api.h     |  2 ++
 ipmid.C         | 11 ++++++++---
 storageaddsel.C | 11 +----------
 3 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/ipmid-api.h b/ipmid-api.h
index b3117d5..34d3bbe 100644
--- a/ipmid-api.h
+++ b/ipmid-api.h
@@ -1,6 +1,7 @@
 #ifndef __HOST_IPMID_IPMI_COMMON_H__
 #define __HOST_IPMID_IPMI_COMMON_H__
 #include <stdlib.h>
+#include <systemd/sd-bus.h>
 
 // length of Completion Code and its ALWAYS _1_
 #define IPMI_CC_LEN 1
@@ -93,4 +94,5 @@ enum ipmi_return_codes
     IPMI_CC_UNSPECIFIED_ERROR = 0xFF,
 };
 
+sd_bus *ipmid_get_sd_bus_connection(void);
 #endif
diff --git a/ipmid.C b/ipmid.C
index 0c7be7b..6b1eacc 100644
--- a/ipmid.C
+++ b/ipmid.C
@@ -15,6 +15,7 @@
 
 
 sd_bus *bus = NULL;
+
 FILE *ipmiio, *ipmidbus, *ipmicmddetails;
 
 void print_usage(void) {
@@ -367,6 +368,10 @@ void ipmi_register_callback_handlers(const char* ipmi_lib_path)
     return;
 }
 
+sd_bus *ipmid_get_sd_bus_connection(void) {
+    return bus;
+}
+
 int main(int argc, char *argv[])
 {
     sd_bus_slot *slot = NULL;
@@ -402,9 +407,6 @@ int main(int argc, char *argv[])
         }
 
 
-    // Register all the handlers that provider implementation to IPMI commands.
-    ipmi_register_callback_handlers(HOST_IPMI_LIB_PATH);
-
     /* Connect to system bus */
     r = sd_bus_open_system(&bus);
     if (r < 0) {
@@ -413,6 +415,9 @@ int main(int argc, char *argv[])
         goto finish;
     }
 
+    // Register all the handlers that provider implementation to IPMI commands.
+    ipmi_register_callback_handlers(HOST_IPMI_LIB_PATH);
+
     r = sd_bus_add_match(bus, &slot, FILTER, handle_ipmi_command, NULL);
     if (r < 0) {
         fprintf(stderr, "Failed: sd_bus_add_match: %s : %s\n", strerror(-r), FILTER);
diff --git a/storageaddsel.C b/storageaddsel.C
index 94e037c..64b0e6a 100644
--- a/storageaddsel.C
+++ b/storageaddsel.C
@@ -159,15 +159,8 @@ int send_esel_to_dbus(const char *desc, const char *sev, const char *details, ui
     uint16_t *pty;
     int r;
 
+    mbus = ipmid_get_sd_bus_connection();
 
-
-    /* Connect to system bus */
-    r = sd_bus_open_system(&mbus);
-    if (r < 0) {
-        fprintf(stderr, "Failed to connect to system bus: %s\n",
-                strerror(-r));
-        goto finish;
-    }
     r = sd_bus_message_new_method_call(mbus,&m,
     									"org.openbmc.records.events",
     									"/org/openbmc/records/events",
@@ -208,10 +201,8 @@ finish:
     sd_bus_error_free(&error);
     sd_bus_message_unref(m);
     sd_bus_message_unref(reply);
-    sd_bus_unref(mbus);
 
     return r;
-
 }
 
 
-- 
2.6.3
