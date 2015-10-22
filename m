Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 964061A0C0D
 for <openbmc@lists.ozlabs.org>; Fri, 23 Oct 2015 05:41:19 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1445539275923549.5913487528195;
 Thu, 22 Oct 2015 11:41:15 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid] Reduce prints to journald from ipmi but
 keep ability to trace
Date: Thu, 22 Oct 2015 13:41:13 -0500
Message-Id: <1445539273-23571-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445539273-23571-1-git-send-email-patches@stwcx.xyz>
References: <1445539273-23571-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 22 Oct 2015 18:41:20 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 ipmid.C | 91 ++++++++++++++++++++++++++++++++++++++---------------------------
 ipmid.H |  3 +++
 2 files changed, 56 insertions(+), 38 deletions(-)

diff --git a/ipmid.C b/ipmid.C
index 4f0831e..34d29aa 100644
--- a/ipmid.C
+++ b/ipmid.C
@@ -15,6 +15,16 @@
 
 sd_bus *bus = NULL;
 
+void print_usage(void) {
+  fprintf(stderr, "Options:  [-c mask]\n");
+  fprintf(stderr, "    mask : 0x01 - Print ipmi packets\n");
+  fprintf(stderr, "    mask : 0x02 - Print DBUS operations\n");
+  fprintf(stderr, "    mask : 0x04 - Print ipmi command details\n");
+  fprintf(stderr, "    mask : 0xFF - Print all trace\n");
+}
+
+
+
 // Channel that is used for OpenBMC Barreleye
 const char * DBUS_NAME = "org.openbmc.HostIpmi";
 const char * OBJ_NAME = "/org/openbmc/HostIpmi/1";
@@ -34,7 +44,7 @@ std::map<ipmi_fn_cmd_t, ipmi_fn_context_t> g_ipmid_router_map;
 #define HEXDUMP_COLS 16
 #endif
 
-void hexdump(void *mem, size_t len)
+void hexdump(FILE *s, void *mem, size_t len)
 {
         unsigned int i, j;
 
@@ -43,17 +53,17 @@ void hexdump(void *mem, size_t len)
                 /* print offset */
                 if(i % HEXDUMP_COLS == 0)
                 {
-                        printf("0x%06x: ", i);
+                        fprintf(s,"0x%06x: ", i);
                 }
 
                 /* print hex data */
                 if(i < len)
                 {
-                        printf("%02x ", 0xFF & ((char*)mem)[i]);
+                        fprintf(s,"%02x ", 0xFF & ((char*)mem)[i]);
                 }
                 else /* end of block, just aligning for ASCII dump */
                 {
-                        printf("   ");
+                        fprintf(s,"   ");
                 }
 
                 /* print ASCII dump */
@@ -63,18 +73,18 @@ void hexdump(void *mem, size_t len)
                         {
                                 if(j >= len) /* end of block, not really printing */
                                 {
-                                        putchar(' ');
+                                        fputc(' ', s);
                                 }
                                 else if(isprint(((char*)mem)[j])) /* printable char */
                                 {
-                                        putchar(0xFF & ((char*)mem)[j]);
+                                        fputc(0xFF & ((char*)mem)[j], s);
                                 }
                                 else /* other char */
                                 {
-                                        putchar('.');
+                                        fputc('.',s);
                                 }
                         }
-                        putchar('\n');
+                        fputc('\n',s);
                 }
         }
 }
@@ -117,7 +127,7 @@ ipmi_ret_t ipmi_netfn_router(ipmi_netfn_t netfn, ipmi_cmd_t cmd, ipmi_request_t
     auto iter = g_ipmid_router_map.find(std::make_pair(netfn, cmd));
     if(iter == g_ipmid_router_map.end())
     {
-        printf("No registered handlers for NetFn:[0x%X], Cmd:[0x%X]"
+        fprintf(stderr, "No registered handlers for NetFn:[0x%X], Cmd:[0x%X]"
                " trying Wilcard implementation \n",netfn, cmd);
 
         // Now that we did not find any specific [NetFn,Cmd], tuple, check for
@@ -125,7 +135,7 @@ ipmi_ret_t ipmi_netfn_router(ipmi_netfn_t netfn, ipmi_cmd_t cmd, ipmi_request_t
         iter = g_ipmid_router_map.find(std::make_pair(netfn, IPMI_CMD_WILDCARD));
         if(iter == g_ipmid_router_map.end())
         {
-            printf("No Registered handlers for NetFn:[0x%X],Cmd:[0x%X]\n",netfn, IPMI_CMD_WILDCARD);
+            fprintf(stderr, "No Registered handlers for NetFn:[0x%X],Cmd:[0x%X]\n",netfn, IPMI_CMD_WILDCARD);
 
             // Respond with a 0xC1
             memcpy(response, &rc, IPMI_CC_LEN);
@@ -208,24 +218,16 @@ static int send_ipmi_message(unsigned char seq, unsigned char netfn, unsigned ch
     }
 
     r = sd_bus_message_read(reply, "x", &pty);
-#ifdef __IPMI_DEBUG__
-    printf("RC from the ipmi dbus method :%d \n", pty);
-#endif
     if (r < 0) {
        fprintf(stderr, "Failed to get a rc from the method: %s\n", strerror(-r));
 
     }
 
-
     sd_bus_error_free(&error);
     sd_bus_message_unref(m);
 
 
-#ifdef __IPMI_DEBUG__
-    printf("%d : %s\n", __LINE__, __PRETTY_FUNCTION__ );
-#endif
     return r < 0 ? EXIT_FAILURE : EXIT_SUCCESS;
-
 }
 
 static int handle_ipmi_command(sd_bus_message *m, void *user_data, sd_bus_error
@@ -238,8 +240,6 @@ static int handle_ipmi_command(sd_bus_message *m, void *user_data, sd_bus_error
     size_t resplen =MAX_IPMI_BUFFER;
     unsigned char response[MAX_IPMI_BUFFER];
 
-    printf(" *** Received Signal: ");
-
     memset(response, 0, MAX_IPMI_BUFFER);
 
     r = sd_bus_message_read(m, "yyy",  &sequence, &netfn, &cmd);
@@ -254,9 +254,8 @@ static int handle_ipmi_command(sd_bus_message *m, void *user_data, sd_bus_error
         return -1;
     }
 
-
-    printf("Seq 0x%02x, NetFn 0x%02x, CMD: 0x%02x \n", sequence, netfn, cmd);
-    hexdump((void*)request, sz);
+    fprintf(ipmiio, "IPMI Incoming: Seq 0x%02x, NetFn 0x%02x, CMD: 0x%02x \n", sequence, netfn, cmd);
+    hexdump(ipmiio, (void*)request, sz);
 
     // Allow the length field to be used for both input and output of the
     // ipmi call
@@ -270,8 +269,8 @@ static int handle_ipmi_command(sd_bus_message *m, void *user_data, sd_bus_error
         fprintf(stderr,"ERROR:[0x%X] handling NetFn:[0x%X], Cmd:[0x%X]\n",r, netfn, cmd);
     }
 
-    printf("Response...\n");
-    hexdump((void*)response, resplen);
+    fprintf(ipmiio, "IPMI Response:\n");
+    hexdump(ipmiio,  (void*)response, resplen);
 
     // Send the response buffer from the ipmi command
     r = send_ipmi_message(sequence, netfn, cmd, response, resplen);
@@ -369,23 +368,39 @@ int main(int argc, char *argv[])
     sd_bus_slot *slot = NULL;
     int r;
     char *mode = NULL;
+    char *cvalue = NULL;
+    int c;
 
 
-    // Register all the handlers that provider implementation to IPMI commands.
-    ipmi_register_callback_handlers(HOST_IPMI_LIB_PATH);
 
-#ifdef __IPMI_DEBUG__
-    printf("Registered Function handlers:\n");
+    // This file and subsequient switch is for turning on levels
+    // of trace
+    ipmicmddetails = ipmiio = ipmidbus =  fopen("/dev/null", "w");
 
-    // Print the registered handlers and their arguments.
-    for(auto& iter : g_ipmid_router_map)
-    {
-        ipmi_fn_cmd_t fn_and_cmd = iter.first;
-        printf("NETFN:[0x%X], cmd[0x%X]\n", fn_and_cmd.first, fn_and_cmd.second);
-    }
-#endif
+    while ((c = getopt (argc, argv, "h:c:")) != -1)
+        switch (c) {
+            case 'c':
+                cvalue = optarg;
+                if (1&*cvalue) {
+                    ipmiio = stdout;
+                }
+                if (2&*cvalue) {
+                    ipmidbus = stdout;
+                }
+                if (4&*cvalue) {
+                    ipmicmddetails = stdout;
+                }
+                break;
+          case 'h':
+          case '?':
+                print_usage();
+                return 1;
+        }
 
 
+    // Register all the handlers that provider implementation to IPMI commands.
+    ipmi_register_callback_handlers(HOST_IPMI_LIB_PATH);
+
     /* Connect to system bus */
     r = sd_bus_open_system(&bus);
     if (r < 0) {
@@ -511,7 +526,7 @@ int set_sensor_dbus_state(uint8_t number, const char *method, const char *value)
     sd_bus_error error = SD_BUS_ERROR_NULL;
     sd_bus_message *reply = NULL, *m=NULL;
 
-    printf("Attempting to set a dbus Sensor 0x%02x via %s with a value of %s\n",
+    fprintf(ipmidbus, "Attempting to set a dbus Sensor 0x%02x via %s with a value of %s\n",
         number, method, value);
 
     r = find_openbmc_path("SENSOR", number, &a);
@@ -556,7 +571,7 @@ int set_sensor_dbus_state_v(uint8_t number, const char *method, char *value) {
     sd_bus_error error = SD_BUS_ERROR_NULL;
     sd_bus_message *reply = NULL, *m=NULL;
 
-    printf("Attempting to set a dbus Variant Sensor 0x%02x via %s with a value of %s\n",
+    fprintf(ipmidbus, "Attempting to set a dbus Variant Sensor 0x%02x via %s with a value of %s\n",
         number, method, value);
 
     r = find_openbmc_path("SENSOR", number, &a);
diff --git a/ipmid.H b/ipmid.H
index 1cfe4c3..c361c8c 100755
--- a/ipmid.H
+++ b/ipmid.H
@@ -1,6 +1,7 @@
 #ifndef __HOST_IPMID_IPMI_H__
 #define __HOST_IPMID_IPMI_H__
 #include "ipmid-api.h"
+#include <stdio.h>
 
 // When the requester sends in a netfn and a command along with data, this
 // function will look for registered handlers that will handle that [netfn,cmd]
@@ -16,4 +17,6 @@ ipmi_ret_t ipmi_netfn_router(const ipmi_netfn_t, const ipmi_cmd_t, ipmi_request_
 // needs 1 byte for the length field. 
 #define MAX_IPMI_BUFFER 63
 
+FILE *ipmiio, *ipmidbus, *ipmicmddetails;
+
 #endif
-- 
2.6.0
