Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rTFXn6TTczDq5d
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jun 2016 13:30:48 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465875042924836.1635565659841;
 Mon, 13 Jun 2016 20:30:42 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid] host-ipmid: remove leading and trailing
 space and tab when setting boot options
Date: Mon, 13 Jun 2016 22:30:40 -0500
Message-Id: <20160614033040.9938-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.4
In-Reply-To: <20160614033040.9938-1-openbmc-patches@stwcx.xyz>
References: <20160614033040.9938-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 14 Jun 2016 03:30:50 -0000

From: Yi Li <adamliyi@msn.com>

This patch fixes issue: https://github.com/openbmc/skeleton/issues/56

In ipmi get bootparam handler, remove leading and trailing space and tab
before querying for boot flags.

There are several places we can check the user-set boot options:
* rest server
* phosphor-settingsd
* host-ipmid

Here the boot option is checked in host-ipmid, since currently
the host-ipmid knows whether a boot option is valid or not.

Signed-off-by: Yi Li <adamliyi@msn.com>
---
 chassishandler.C | 66 ++++++++++++++++++++++++++++++++++++++++----------------
 1 file changed, 47 insertions(+), 19 deletions(-)

diff --git a/chassishandler.C b/chassishandler.C
index d5b3404..8bd03ba 100644
--- a/chassishandler.C
+++ b/chassishandler.C
@@ -3,13 +3,13 @@
 #include <stdio.h>
 #include <string.h>
 #include <stdint.h>
-
+#include <ctype.h>
 
 //Defines
 #define SET_PARM_VERSION 1
 #define SET_PARM_BOOT_FLAGS_PERMANENT 0x40 //boot flags data1 7th bit on
 #define SET_PARM_BOOT_FLAGS_VALID_ONE_TIME   0x80 //boot flags data1 8th bit on
-#define SET_PARM_BOOT_FLAGS_VALID_PERMANENT  0xC0 //boot flags data1 7 & 8 bit on 
+#define SET_PARM_BOOT_FLAGS_VALID_PERMANENT  0xC0 //boot flags data1 7 & 8 bit on
 
 
 
@@ -241,8 +241,8 @@ struct set_sys_boot_options_t {
     uint8_t data[8];
 }  __attribute__ ((packed));
 
-ipmi_ret_t ipmi_chassis_wildcard(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
-                              ipmi_request_t request, ipmi_response_t response, 
+ipmi_ret_t ipmi_chassis_wildcard(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
+                              ipmi_request_t request, ipmi_response_t response,
                               ipmi_data_len_t data_len, ipmi_context_t context)
 {
     printf("Handling CHASSIS WILDCARD Netfn:[0x%X], Cmd:[0x%X]\n",netfn, cmd);
@@ -272,7 +272,7 @@ int ipmi_chassis_power_control(const char *method)
 
 	rc = sd_bus_call_method(bus_type,        		 // On the System Bus
 							chassis_bus_name,        // Service to contact
-							chassis_object_name,     // Object path 
+							chassis_object_name,     // Object path
 							chassis_intf_name,       // Interface name
 							method,      		 // Method to be called
 							&bus_error,      		 // object to return error
@@ -297,8 +297,8 @@ int ipmi_chassis_power_control(const char *method)
 //----------------------------------------------------------------------
 // Chassis Control commands
 //----------------------------------------------------------------------
-ipmi_ret_t ipmi_chassis_control(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
-                        ipmi_request_t request, ipmi_response_t response, 
+ipmi_ret_t ipmi_chassis_control(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
+                        ipmi_request_t request, ipmi_response_t response,
                         ipmi_data_len_t data_len, ipmi_context_t context)
 {
 	// Error from power off.
@@ -347,19 +347,47 @@ bootOptionTypeMap_t g_bootOptionTypeMap_t[] = {
     {0xFF, INVALID_STRING}
 };
 
+/* trim leading and trailing space or tab, return a new string */
+char* trim_str(char *s)
+{
+    int l;
+
+    if (!s)
+        return NULL;
+    l = strlen(s);
+
+    while(l > 0 && isspace(s[l - 1]))
+        --l;
+    while(l > 0 && *s && isblank(*s)) {
+        ++s;
+        --l;
+    }
+
+    if (l <= 0)
+        return NULL;
+
+    return strndup(s, l);
+}
+
 uint8_t get_ipmi_boot_option(char *p) {
 
     bootOptionTypeMap_t *s = g_bootOptionTypeMap_t;
+    /* remove leading and trailing space or tab */
+    char *str = trim_str(p);
+
+    if (!str)
+        return 0xFF;
 
     while (s->ipmibootflag != 0xFF) {
-        if (!strcmp(s->dbusname,p))
+        if (!strcmp(s->dbusname,str))
             break;
         s++;
     }
 
-    if (!s->ipmibootflag)
-        printf("Failed to find Sensor Type %s\n", p);
+    if (s->ipmibootflag == 0xFF)
+        fprintf(stderr, "Failed to find Sensor Type %s\n", p);
 
+    free(str);
     return s->ipmibootflag;
 }
 
@@ -376,14 +404,14 @@ char* get_boot_option_by_ipmi(uint8_t p) {
     }
 
 
-    if (!s->ipmibootflag)
-        printf("Failed to find Sensor Type 0x%x\n", p);
+    if (s->ipmibootflag == 0xFF)
+        fprintf(stderr, "Failed to find Sensor Type 0x%x\n", p);
 
     return s->dbusname;
 }
 
-ipmi_ret_t ipmi_chassis_get_sys_boot_options(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
-                              ipmi_request_t request, ipmi_response_t response, 
+ipmi_ret_t ipmi_chassis_get_sys_boot_options(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
+                              ipmi_request_t request, ipmi_response_t response,
                               ipmi_data_len_t data_len, ipmi_context_t context)
 {
     ipmi_ret_t rc = IPMI_CC_PARM_NOT_SUPPORTED;
@@ -437,8 +465,8 @@ ipmi_ret_t ipmi_chassis_get_sys_boot_options(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 
         } else {
 
-            printf("BootPolicy is[%s]", p); 
-            resp->data[0] = (strncmp(p,"ONETIME",strlen("ONETIME"))==0) ? 
+            printf("BootPolicy is[%s]", p);
+            resp->data[0] = (strncmp(p,"ONETIME",strlen("ONETIME"))==0) ?
                             SET_PARM_BOOT_FLAGS_VALID_ONE_TIME:
                             SET_PARM_BOOT_FLAGS_VALID_PERMANENT;
             rc = IPMI_CC_OK;
@@ -494,12 +522,12 @@ ipmi_ret_t ipmi_chassis_set_sys_boot_options(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
                 rc = IPMI_CC_UNSPECIFIED_ERROR;
             }
         }
-      
+
         /* setting the boot policy */
-        s = (char *)(((reqptr->data[0] & SET_PARM_BOOT_FLAGS_PERMANENT) == 
+        s = (char *)(((reqptr->data[0] & SET_PARM_BOOT_FLAGS_PERMANENT) ==
                        SET_PARM_BOOT_FLAGS_PERMANENT) ?"PERMANENT":"ONETIME");
 
-        printf ( "\nBoot Policy is %s",s); 
+        printf ( "\nBoot Policy is %s",s);
         int r = dbus_set_property("boot_policy",s);
 
         if (r < 0) {
-- 
2.8.4
