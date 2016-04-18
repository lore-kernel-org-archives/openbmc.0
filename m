Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qpQgV2DhPzDqBn
 for <openbmc@lists.ozlabs.org>; Mon, 18 Apr 2016 21:20:53 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 14609784432731020.7565207243778;
 Mon, 18 Apr 2016 04:20:43 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: ratagupt <ratagupt@in.ibm.com>
Subject: [PATCH phosphor-host-ipmid v2 2/2] Review Comment added for 146621
Date: Mon, 18 Apr 2016 06:20:39 -0500
Message-Id: <1460978439-16510-3-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1460978439-16510-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1460978439-16510-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 18 Apr 2016 11:20:54 -0000

From: ratagupt <ratagupt@in.ibm.com>

---
 chassishandler.C | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/chassishandler.C b/chassishandler.C
index 1a5508f..5144e15 100644
--- a/chassishandler.C
+++ b/chassishandler.C
@@ -92,7 +92,7 @@ finish:
     return r;
 }
 
-int dbus_get_property(const char *name,char **buf)
+int dbus_get_property(const char *name, char **buf)
 {
     sd_bus_error error = SD_BUS_ERROR_NULL;
     sd_bus_message *m = NULL;
@@ -161,7 +161,7 @@ finish:
     return r;
 }
 
-int dbus_set_property(const char * name,const char *value)
+int dbus_set_property(const char * name, const char *value)
 {
     sd_bus_error error = SD_BUS_ERROR_NULL;
     sd_bus_message *m = NULL;
@@ -198,7 +198,7 @@ int dbus_set_property(const char * name,const char *value)
                            host_intf_name,                             /* first argument */
                            name,                                       /* second argument */
                            "s",                                        /* third argument */
-                           value);                                       /* fourth argument */
+                           value);                                     /* fourth argument */
 
     if (r < 0) {
         fprintf(stderr, "Failed to issue method call: %s\n", error.message);
@@ -374,8 +374,9 @@ char* get_boot_option_by_ipmi(uint8_t p) {
 }
 
 #define SET_PARM_VERSION 1
-#define SET_PARM_BOOT_FLAGS_VALID_ONE_TIME   0x80
-#define SET_PARM_BOOT_FLAGS_VALID_PERMANENT  0xC0
+#define SET_PARM_BOOT_FLAGS_VALID_ONE_TIME   0x80 //boot flags data1 8th bit on
+#define SET_PARM_BOOT_FLAGS_VALID_PERMANENT  0xC0 //boot flags data1 7&8 bit on 
+#define SET_PARM_BOOT_FLAGS_ONETIME 0x40 //boot flags data1 7th bit on
 
 ipmi_ret_t ipmi_chassis_get_sys_boot_options(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
                               ipmi_request_t request, ipmi_response_t response, 
@@ -433,7 +434,9 @@ ipmi_ret_t ipmi_chassis_get_sys_boot_options(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
         } else {
 
             printf("BootPolicy is[%s]", p); 
-            resp->data[0] = (strcmp(p,"ONETIME")==0)?SET_PARM_BOOT_FLAGS_VALID_ONE_TIME:SET_PARM_BOOT_FLAGS_VALID_PERMANENT;
+            resp->data[0] = (strncmp(p,"ONETIME",strlen("ONETIME"))==0) ? 
+                            SET_PARM_BOOT_FLAGS_VALID_ONE_TIME:
+                            SET_PARM_BOOT_FLAGS_VALID_PERMANENT;
             rc = IPMI_CC_OK;
 
         }
@@ -489,7 +492,9 @@ ipmi_ret_t ipmi_chassis_set_sys_boot_options(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
         }
       
         /* setting the boot policy */
-        s= (char *)(((reqptr->data[0] & 0x40) == 0x40) ?"PERMANENT":"ONETIME");
+        s = (char *)(((reqptr->data[0] & SET_PARM_BOOT_FLAGS_ONETIME) == 
+                       SET_PARM_BOOT_FLAGS_ONETIME) ?"PERMANENT":"ONETIME");
+
         printf ( "\nBoot Policy is %s",s); 
         int r = dbus_set_property("boot_policy",s);
 
-- 
2.7.1
