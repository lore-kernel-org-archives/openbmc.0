Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 910761A03B0
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2016 08:40:36 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1455140432405268.1969459201646;
 Wed, 10 Feb 2016 13:40:32 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v2] IPMI Get IP Support
Date: Wed, 10 Feb 2016 15:40:30 -0600
Message-Id: <1455140430-32605-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1455140430-32605-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1455140430-32605-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 10 Feb 2016 21:40:37 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

Fix parsing of Get IP address.
Dbus method returns additional information such as family and
gateway, but this IPMI option just requires the IP to be returned.
---
 transporthandler.C | 75 ++++++++++++++++++++++++++----------------------------
 1 file changed, 36 insertions(+), 39 deletions(-)

diff --git a/transporthandler.C b/transporthandler.C
index df2986a..d43f1f9 100644
--- a/transporthandler.C
+++ b/transporthandler.C
@@ -215,9 +215,7 @@ ipmi_ret_t ipmi_transport_get_lan(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     unsigned char       prefixlen;
     unsigned char       scope;
     unsigned int        flags;
-    char                saddr [128];
-    char                gateway [128];
-    uint8_t             buf[11];
+    char               *saddr = NULL;
     int                 i = 0;
 
     printf("IPMI GET_LAN\n");
@@ -259,57 +257,56 @@ ipmi_ret_t ipmi_transport_get_lan(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     else if (reqptr->parameter == LAN_PARM_IP)
     {
         const char*         device             = "eth0";
+        uint8_t buf[5]; // Size of expected IPMI response msg
 
-        sd_bus_message *res = NULL;
-        sd_bus *bus1        = NULL;
-        sd_bus_error err    = SD_BUS_ERROR_NULL;
-
-        rc = sd_bus_open_system(&bus1);
-        if(rc < 0)
-        {
-            fprintf(stderr,"ERROR: Getting a SYSTEM bus hook\n");
+        r = sd_bus_message_new_method_call(bus,&m,app,obj,ifc,"GetAddress4");
+        if (r < 0) {
+            fprintf(stderr, "Failed to add method object: %s\n", strerror(-r));
             return -1;
         }
-
-        rc = sd_bus_call_method(bus1,            // On the System Bus
-                                app,            // Service to contact
-                                obj,            // Object path 
-                                ifc,            // Interface name
-                                "GetAddress4",  // Method to be called
-                                &err,           // object to return error
-                                &res,           // Response message on success
-                                "s",         // input message (dev,ip,nm,gw)
-                                "eth0");
-        if(rc < 0)
-        {
-            fprintf(stderr, "Failed to Get IP on interface : %s\n", device);
+        r = sd_bus_message_append(m, "s", device);
+        if (r < 0) {
+            fprintf(stderr, "Failed to append message data: %s\n", strerror(-r));
             return -1;
         }
-
-        /* rc = sd_bus_message_read(res, "a(iyyus)s", ...); */
-        rc = sd_bus_message_enter_container (res, 'a', "(iyyus)");
+        r = sd_bus_call(bus, m, 0, &error, &reply);
+        if (r < 0) {
+            fprintf(stderr, "Failed to call method: %s\n", strerror(-r));
+            return -1;
+        }
+        rc = sd_bus_message_enter_container (reply, 'a', "(iyyus)");
         if(rc < 0)
         {
             fprintf(stderr, "Failed to parse response message:[%s]\n", strerror(-rc));
             return -1;
         }
-
-        while ((rc = sd_bus_message_read(res, "(iyyus)", &family, &prefixlen, &scope, &flags, &saddr)) > 0) {
-                printf("%s:%d:%d:%d:%s\n", family==AF_INET?"IPv4":"IPv6", prefixlen, scope, flags, saddr);
-        }
-
-        rc = sd_bus_message_read (res, "s", &gateway);
-        if(rc < 0)
+        rc = sd_bus_message_read(reply, "(iyyus)", &family, &prefixlen, &scope, &flags, &saddr);
+        if (rc < 0)
         {
-            fprintf(stderr, "Failed to parse gateway from response message:[%s]\n", strerror(-rc));
+            fprintf(stderr, "Failed to receive response: %s\n", strerror(-r));
             return -1;
         }
 
+        printf("%s:%d:%d:%d:%s\n", family==AF_INET?"IPv4":"IPv6", prefixlen, scope, flags, saddr);
+
         memcpy((void*)&buf[0], &current_revision, 1);
-        sscanf (saddr, "%c.%c.%c.%c", &buf[1], &buf[2], &buf[3], &buf[4]);
-        buf[5] = family;
-        buf[6] = prefixlen;
-        sscanf (gateway, "%c.%c.%c.%c", &buf[7], &buf[8], &buf[9], &buf[10]);
+
+        // Parse IP address
+        char *tokptr = NULL;
+        char* digit = strtok_r(saddr, ".", &tokptr);
+        if (digit == NULL)
+        {
+            fprintf(stderr, "Unexpected IP format: %s", saddr);
+            return IPMI_CC_RESPONSE_ERROR;
+        }
+        i = 0;
+        while (digit != NULL)
+        {
+            int resp_byte = strtoul(digit, NULL, 10);
+            memcpy((void*)&buf[i+1], &resp_byte, 1);
+            i++;
+            digit = strtok_r(NULL, ".", &tokptr);
+        }
 
         *data_len = sizeof(buf);
         memcpy(response, &buf, *data_len);
-- 
2.7.1
