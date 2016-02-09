Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3CA901A0190
 for <openbmc@lists.ozlabs.org>; Wed, 10 Feb 2016 09:30:41 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1455057036856568.0479540605488;
 Tue, 9 Feb 2016 14:30:36 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v2 1/2] Get MAC address
Date: Tue,  9 Feb 2016 16:30:34 -0600
Message-Id: <1455057035-29247-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1455057035-29247-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1455057035-29247-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 09 Feb 2016 22:30:41 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

Support for Get MAC address command.
Fix parsing logic to get correct data.
---
 transporthandler.C | 70 ++++++++++++++++++++++++++++++++----------------------
 1 file changed, 41 insertions(+), 29 deletions(-)

diff --git a/transporthandler.C b/transporthandler.C
index c38adea..2df5ebf 100644
--- a/transporthandler.C
+++ b/transporthandler.C
@@ -199,7 +199,9 @@ ipmi_ret_t ipmi_transport_get_lan(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 {
     ipmi_ret_t rc = IPMI_CC_OK;
     *data_len = 0;
-    sd_bus_error err    = SD_BUS_ERROR_NULL; /* fixme */
+    sd_bus_message *reply = NULL, *m = NULL;
+    sd_bus_error error = SD_BUS_ERROR_NULL;
+    int r = 0;
     const uint8_t current_revision = 0x11; // Current rev per IPMI Spec 2.0
 
     int                 family;
@@ -209,6 +211,7 @@ ipmi_ret_t ipmi_transport_get_lan(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     char                saddr [128];
     char                gateway [128];
     uint8_t             buf[11];
+    int                 i = 0;
 
     printf("IPMI GET_LAN\n");
 
@@ -311,44 +314,53 @@ ipmi_ret_t ipmi_transport_get_lan(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
         //string to parse: link/ether xx:xx:xx:xx:xx:xx
 
         const char*         device             = "eth0";
-        char                eaddr [12];
         uint8_t             buf[7];
+        char *eaddr1 = NULL;
 
-        sd_bus_message *res = NULL;
-        sd_bus *bus         = NULL;
-        sd_bus_error err    = SD_BUS_ERROR_NULL;
-
-        rc = sd_bus_open_system(&bus);
-        if(rc < 0)
-        {
-            fprintf(stderr,"ERROR: Getting a SYSTEM bus hook\n");
+        r = sd_bus_message_new_method_call(bus,&m,app,obj,ifc,"GetHwAddress");
+        if (r < 0) {
+            fprintf(stderr, "Failed to add method object: %s\n", strerror(-r));
             return -1;
         }
-
-        rc = sd_bus_call_method(bus,            // On the System Bus
-                                app,            // Service to contact
-                                obj,            // Object path 
-                                ifc,            // Interface name
-                                "GetHwAddress",  // Method to be called
-                                &err,           // object to return error
-                                &res,           // Response message on success
-                                "s",         // input message (dev,ip,nm,gw)
-                                device);
-        if(rc < 0)
-        {
-            fprintf(stderr, "Failed to Get HW address of device : %s\n", device);
+        r = sd_bus_message_append(m, "s", device);
+        if (r < 0) {
+            fprintf(stderr, "Failed to append message data: %s\n", strerror(-r));
             return -1;
         }
-
-        rc = sd_bus_message_read (res, "s", &eaddr);
-        if(rc < 0)
-        {
-            fprintf(stderr, "Failed to parse gateway from response message:[%s]\n", strerror(-rc));
+        r = sd_bus_call(bus, m, 0, &error, &reply);
+        if (r < 0) {
+            fprintf(stderr, "Failed to call method: %s\n", strerror(-r));
             return -1;
         }
+        r = sd_bus_message_read(reply, "s", &eaddr1);
+        if (r < 0) {
+            fprintf(stderr, "Failed to get a response: %s", strerror(-r));
+            return IPMI_CC_RESPONSE_ERROR;
+        }
+        if (eaddr1 == NULL)
+        {
+            fprintf(stderr, "Failed to get a valid response: %s", strerror(-r));
+            return IPMI_CC_RESPONSE_ERROR;
+        }
 
         memcpy((void*)&buf[0], &current_revision, 1);
-        sscanf (eaddr, "%x:%x:%x:%x:%x:%x", &buf[1], &buf[2], &buf[3], &buf[4], &buf[5], &buf[6]);
+
+        char *tokptr = NULL;
+        char* digit = strtok_r(eaddr1, ":", &tokptr);
+        if (digit == NULL)
+        {
+            fprintf(stderr, "Unexpected MAC format: %s", eaddr1);
+            return IPMI_CC_RESPONSE_ERROR;
+        }
+
+        i=0;
+        while (digit != NULL)
+        {
+            int resp_byte = strtoul(digit, NULL, 16);
+            memcpy((void*)&buf[i+1], &resp_byte, 1);
+            i++;
+            digit = strtok_r(NULL, ":", &tokptr);
+        }
 
         *data_len = sizeof(buf);
         memcpy(response, &buf, *data_len);
-- 
2.7.1
