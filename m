Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qq0dJ5SZ5zDqBC
 for <openbmc@lists.ozlabs.org>; Tue, 19 Apr 2016 19:51:00 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1461059448873778.1579647477664;
 Tue, 19 Apr 2016 02:50:48 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: ratagupt <ratagupt@in.ibm.com>
Subject: [PATCH phosphor-host-ipmid v3] Adding Boot Policy
Date: Tue, 19 Apr 2016 04:50:40 -0500
Message-Id: <1461059440-3200-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1461059440-3200-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1461059440-3200-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 19 Apr 2016 09:51:01 -0000

From: ratagupt <ratagupt@in.ibm.com>

Review Comment added for 146621
---
 chassishandler.C | 64 +++++++++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 52 insertions(+), 12 deletions(-)

diff --git a/chassishandler.C b/chassishandler.C
index fca3c79..5144e15 100644
--- a/chassishandler.C
+++ b/chassishandler.C
@@ -92,7 +92,7 @@ finish:
     return r;
 }
 
-int dbus_get_property(char **buf)
+int dbus_get_property(const char *name, char **buf)
 {
     sd_bus_error error = SD_BUS_ERROR_NULL;
     sd_bus_message *m = NULL;
@@ -128,7 +128,7 @@ int dbus_get_property(char **buf)
                            &m,                                         /* return message on success */
                            "ss",                                       /* input signature */
                            host_intf_name,                             /* first argument */
-                           "boot_flags");                              /* second argument */
+                           name);                                      /* second argument */
 
     if (r < 0) {
         fprintf(stderr, "Failed to issue method call: %s\n", error.message);
@@ -161,7 +161,7 @@ finish:
     return r;
 }
 
-int dbus_set_property(const char *buf)
+int dbus_set_property(const char * name, const char *value)
 {
     sd_bus_error error = SD_BUS_ERROR_NULL;
     sd_bus_message *m = NULL;
@@ -196,16 +196,16 @@ int dbus_set_property(const char *buf)
                            &m,                                         /* return message on success */
                            "ssv",                                      /* input signature */
                            host_intf_name,                             /* first argument */
-                           "boot_flags",                               /* second argument */
+                           name,                                       /* second argument */
                            "s",                                        /* third argument */
-                           buf);                                       /* fourth argument */
+                           value);                                     /* fourth argument */
 
     if (r < 0) {
         fprintf(stderr, "Failed to issue method call: %s\n", error.message);
         goto finish;
     }
 
-    printf("IPMID boot option property set: {%s}.\n", buf);
+    printf("IPMID boot option property set: {%s}.\n", value);
 
 finish:
     sd_bus_error_free(&error);
@@ -374,7 +374,9 @@ char* get_boot_option_by_ipmi(uint8_t p) {
 }
 
 #define SET_PARM_VERSION 1
-#define SET_PARM_BOOT_FLAGS_VALID   0x80
+#define SET_PARM_BOOT_FLAGS_VALID_ONE_TIME   0x80 //boot flags data1 8th bit on
+#define SET_PARM_BOOT_FLAGS_VALID_PERMANENT  0xC0 //boot flags data1 7&8 bit on 
+#define SET_PARM_BOOT_FLAGS_ONETIME 0x40 //boot flags data1 7th bit on
 
 ipmi_ret_t ipmi_chassis_get_sys_boot_options(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
                               ipmi_request_t request, ipmi_response_t response, 
@@ -391,7 +393,7 @@ ipmi_ret_t ipmi_chassis_get_sys_boot_options(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     memset(resp,0,sizeof(*resp));
     resp->version   = SET_PARM_VERSION;
     resp->parm      = 5;
-    resp->data[0]   = SET_PARM_BOOT_FLAGS_VALID;
+    resp->data[0]   = SET_PARM_BOOT_FLAGS_VALID_ONE_TIME;
 
     *data_len = sizeof(*resp);
 
@@ -401,10 +403,11 @@ ipmi_ret_t ipmi_chassis_get_sys_boot_options(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
      */
     if (reqptr->parameter == 5) {
 
-        int r = dbus_get_property(&p);
+        /* Get the boot device */
+        int r = dbus_get_property("boot_flags",&p);
 
         if (r < 0) {
-            fprintf(stderr, "Dbus get property failed for get_sys_boot_options.\n");
+            fprintf(stderr, "Dbus get property(boot_flags) failed for get_sys_boot_options.\n");
             rc = IPMI_CC_UNSPECIFIED_ERROR;
 
         } else {
@@ -412,8 +415,33 @@ ipmi_ret_t ipmi_chassis_get_sys_boot_options(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
             s = get_ipmi_boot_option(p);
             resp->data[1] = (s << 2);
             rc = IPMI_CC_OK;
+
+        }
+
+        if (p)
+        {
+          free(p);
+          p = NULL;
         }
 
+        /* Get the boot policy */
+        r = dbus_get_property("boot_policy",&p);
+
+        if (r < 0) {
+            fprintf(stderr, "Dbus get property(boot_policy) failed for get_sys_boot_options.\n");
+            rc = IPMI_CC_UNSPECIFIED_ERROR;
+
+        } else {
+
+            printf("BootPolicy is[%s]", p); 
+            resp->data[0] = (strncmp(p,"ONETIME",strlen("ONETIME"))==0) ? 
+                            SET_PARM_BOOT_FLAGS_VALID_ONE_TIME:
+                            SET_PARM_BOOT_FLAGS_VALID_PERMANENT;
+            rc = IPMI_CC_OK;
+
+        }
+
+
     } else {
         fprintf(stderr, "Unsupported parameter 0x%x\n", reqptr->parameter);
     }
@@ -455,13 +483,25 @@ ipmi_ret_t ipmi_chassis_set_sys_boot_options(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 
         } else {
 
-            int r = dbus_set_property(s);
+            int r = dbus_set_property("boot_flags",s);
 
             if (r < 0) {
-                fprintf(stderr, "Dbus set property failed for set_sys_boot_options.\n");
+                fprintf(stderr, "Dbus set property(boot_flags) failed for set_sys_boot_options.\n");
                 rc = IPMI_CC_UNSPECIFIED_ERROR;
             }
         }
+      
+        /* setting the boot policy */
+        s = (char *)(((reqptr->data[0] & SET_PARM_BOOT_FLAGS_ONETIME) == 
+                       SET_PARM_BOOT_FLAGS_ONETIME) ?"PERMANENT":"ONETIME");
+
+        printf ( "\nBoot Policy is %s",s); 
+        int r = dbus_set_property("boot_policy",s);
+
+        if (r < 0) {
+            fprintf(stderr, "Dbus set property(boot_policy) failed for set_sys_boot_options.\n");
+            rc = IPMI_CC_UNSPECIFIED_ERROR;
+            }
 
     } else {
         fprintf(stderr, "Unsupported parameter 0x%x\n", reqptr->parameter);
-- 
2.7.1
