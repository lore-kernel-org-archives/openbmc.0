Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id ADCAC1A045E
 for <openbmc@lists.ozlabs.org>; Fri,  4 Mar 2016 02:01:01 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1457017250119457.8993062545486;
 Thu, 3 Mar 2016 07:00:50 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: tomjose <tomjoseph@in.ibm.com>
Subject: [PATCH phosphor-host-ipmid] Refactoring of IPMI Transport Handler
Date: Thu,  3 Mar 2016 09:00:47 -0600
Message-Id: <1457017247-24213-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1457017247-24213-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1457017247-24213-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 03 Mar 2016 15:01:04 -0000

From: tomjose <tomjoseph@in.ibm.com>

---
 transporthandler.C | 359 ++++++++++++++++++++++++++---------------------------
 1 file changed, 179 insertions(+), 180 deletions(-)

diff --git a/transporthandler.C b/transporthandler.C
index d43f1f9..c1fcd71 100644
--- a/transporthandler.C
+++ b/transporthandler.C
@@ -2,6 +2,7 @@
 #include <string.h>
 #include <stdint.h>
 #include <arpa/inet.h>
+#include <string>
 
 #include "ipmid-api.h"
 #include "ipmid.H"
@@ -18,19 +19,109 @@ const char  *app   =  "org.openbmc.NetworkManager";
 const char  *obj   =  "/org/openbmc/NetworkManager/Interface";
 const char  *ifc   =  "org.openbmc.NetworkManager";
 
+const char *nwinterface = "eth0";
+
 const int SIZE_MAC = 18; //xx:xx:xx:xx:xx:xx
-const int SIZE_LAN_PARM = 16; //xxx.xxx.xxx.xxx
 
-char cur_ipaddr  [16] = "";
-char cur_netmask [16] = "";
-char cur_gateway [16] = "";
+char new_ipaddr  [INET_ADDRSTRLEN] = "";
+char new_netmask [INET_ADDRSTRLEN] = "";
+char new_gateway [INET_ADDRSTRLEN] = "";
+
+const uint8_t SET_COMPLETE = 0;
+const uint8_t SET_IN_PROGRESS = 1;
+const uint8_t SET_COMMIT_WRITE = 2; //Optional
+const uint8_t SET_IN_PROGRESS_RESERVED = 3; //Reserved
+
+// Status of Set-In-Progress Parameter (# 0)
+uint8_t lan_set_in_progress = SET_COMPLETE;
+
 
-char new_ipaddr  [16] = "";
-char new_netmask [16] = "";
-char new_gateway [16] = "";
 
 void register_netfn_transport_functions() __attribute__((constructor));
 
+// Helper Function to get IP Address/NetMask/Gateway from Network Manager or Cache
+// based on Set-In-Progress State
+ipmi_ret_t getNetworkData(uint8_t lan_param, uint8_t * data)
+{
+    sd_bus *bus = ipmid_get_sd_bus_connection();
+    sd_bus_message *reply = NULL;
+    sd_bus_error error = SD_BUS_ERROR_NULL;
+    int family;
+    unsigned char prefixlen;
+    char* ipaddr = NULL;
+    unsigned long mask = 0xFFFFFFFF;
+    char* gateway = NULL;
+    int r = 0;
+    ipmi_ret_t rc = IPMI_CC_OK;
+
+    r = sd_bus_call_method(bus, app, obj, ifc, "GetAddress4", &error,
+                            &reply, "s", nwinterface);
+    if(r < 0)
+    {
+        fprintf(stderr, "Failed to call Get Method: %s\n", strerror(-r));
+        rc = IPMI_CC_UNSPECIFIED_ERROR;
+        goto cleanup;
+    }
+
+    r = sd_bus_message_read(reply, "iyss", &family, &prefixlen, &ipaddr, &gateway);
+    if(r < 0)
+    {
+        fprintf(stderr, "Failed to get a response: %s\n", strerror(-rc));
+        rc = IPMI_CC_RESPONSE_ERROR;
+        goto cleanup;
+    }
+
+    printf("N/W data from HW %s:%d:%s:%s\n", family==AF_INET?"IPv4":"IPv6", prefixlen, ipaddr,gateway);
+    printf("N/W data from Cache: %s:%s:%s\n", new_ipaddr, new_netmask, new_gateway);
+
+    if(lan_param == LAN_PARM_IP)
+    {
+        if(lan_set_in_progress == SET_COMPLETE)
+        {
+            std::string ipaddrstr(ipaddr);
+            inet_pton(AF_INET, ipaddrstr.c_str(),(void *)data);
+        }
+        else if(lan_set_in_progress == SET_IN_PROGRESS)
+        {
+            inet_pton(AF_INET, new_ipaddr, (void *)data);
+        }
+    }
+    else if(lan_param == LAN_PARM_SUBNET)
+    {
+        if(lan_set_in_progress == SET_COMPLETE)
+         {
+            mask = htonl(mask<<(32-prefixlen));
+            memcpy(data, &mask, 4);
+         }
+         else if(lan_set_in_progress == SET_IN_PROGRESS)
+         {
+             inet_pton(AF_INET, new_netmask, (void *)data);
+         }
+    }
+    else if(lan_param == LAN_PARM_GATEWAY)
+    {
+        if(lan_set_in_progress == SET_COMPLETE)
+         {
+            std::string gatewaystr(gateway);
+            inet_pton(AF_INET, gatewaystr.c_str(), (void *)data);
+         }
+         else if(lan_set_in_progress == SET_IN_PROGRESS)
+         {
+             inet_pton(AF_INET, new_gateway,(void *)data);
+         }
+    }
+    else
+    {
+        rc = IPMI_CC_PARM_OUT_OF_RANGE;
+    }
+
+cleanup:
+    sd_bus_error_free(&error);
+    reply = sd_bus_message_unref(reply);
+
+    return rc;
+}
+
 ipmi_ret_t ipmi_transport_wildcard(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
                               ipmi_request_t request, ipmi_response_t response,
                               ipmi_data_len_t data_len, ipmi_context_t context)
@@ -55,7 +146,7 @@ ipmi_ret_t ipmi_transport_set_lan(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     ipmi_ret_t rc = IPMI_CC_OK;
     *data_len = 0;
     sd_bus *bus = ipmid_get_sd_bus_connection();
-    sd_bus_message *reply = NULL, *m = NULL;
+    sd_bus_message *reply = NULL;
     sd_bus_error error = SD_BUS_ERROR_NULL;
     int r = 0;
 
@@ -69,12 +160,12 @@ ipmi_ret_t ipmi_transport_set_lan(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 
     if (reqptr->parameter == LAN_PARM_IP)
     {
-        snprintf(new_ipaddr, SIZE_LAN_PARM, "%d.%d.%d.%d",
+        snprintf(new_ipaddr, INET_ADDRSTRLEN, "%d.%d.%d.%d",
             reqptr->data[0], reqptr->data[1], reqptr->data[2], reqptr->data[3]);
     }
     else if (reqptr->parameter == LAN_PARM_MAC)
     {
-        char                mac[SIZE_MAC];
+        char mac[SIZE_MAC];
 
         snprintf(mac, SIZE_MAC, "%02x:%02x:%02x:%02x:%02x:%02x",
                 reqptr->data[0],
@@ -84,111 +175,73 @@ ipmi_ret_t ipmi_transport_set_lan(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
                 reqptr->data[4],
                 reqptr->data[5]);
 
-        r = sd_bus_message_new_method_call(bus,&m,app,obj,ifc,"SetHwAddress");
-        if (r < 0) {
-            fprintf(stderr, "Failed to add method object: %s\n", strerror(-r));
-            return -1;
-        }
-        r = sd_bus_message_append(m, "s", mac);
-        if (r < 0) {
-            fprintf(stderr, "Failed to append message data: %s\n", strerror(-r));
-            return -1;
-        }
-        r = sd_bus_call(bus, m, 0, &error, &reply);
-        if (r < 0) {
-            fprintf(stderr, "Failed to call method: %s\n", strerror(-r));
-            return -1;
+        r = sd_bus_call_method(bus, app, obj, ifc, "SetHwAddress", &error,
+                                &reply, "ss", nwinterface, mac);
+        if(r < 0)
+        {
+            fprintf(stderr, "Failed to call the method: %s\n", strerror(-r));
+            rc = IPMI_CC_UNSPECIFIED_ERROR;
         }
     }
     else if (reqptr->parameter == LAN_PARM_SUBNET)
     {
-        snprintf(new_netmask, SIZE_LAN_PARM, "%d.%d.%d.%d",
+        snprintf(new_netmask, INET_ADDRSTRLEN, "%d.%d.%d.%d",
             reqptr->data[0], reqptr->data[1], reqptr->data[2], reqptr->data[3]);
     }
     else if (reqptr->parameter == LAN_PARM_GATEWAY)
     {
-        snprintf(new_gateway, SIZE_LAN_PARM, "%d.%d.%d.%d",
+        snprintf(new_gateway, INET_ADDRSTRLEN, "%d.%d.%d.%d",
             reqptr->data[0], reqptr->data[1], reqptr->data[2], reqptr->data[3]);
     }
-    else if (reqptr->parameter == LAN_PARM_INPROGRESS) // Apply config
+    else if (reqptr->parameter == LAN_PARM_INPROGRESS)
     {
-        int rc = 0;
-        sd_bus_message *req = NULL;
-        sd_bus_message *res = NULL;
-        sd_bus *bus1        = NULL;
-        sd_bus_error err    = SD_BUS_ERROR_NULL;
-        
-        if (!strcmp(new_ipaddr, "") || !strcmp (new_netmask, "") || !strcmp (new_gateway, ""))
+        if(reqptr->data[0] == SET_COMPLETE) // Set Complete
         {
-            fprintf(stderr,"ERROR: Incomplete LAN Parameters\n");
-            return -1;
+            lan_set_in_progress = SET_COMPLETE;
+            // Apply the IP settings once IP Address, Netmask and Gateway  is set
+            if (!strcmp(new_ipaddr, "") || !strcmp (new_netmask, "") || !strcmp (new_gateway, ""))
+            {
+                printf("ERROR: Incomplete LAN Parameters\n");
+            }
+            else
+            {
+
+                r = sd_bus_call_method(bus,            // On the System Bus
+                                        app,            // Service to contact
+                                        obj,            // Object path
+                                        ifc,            // Interface name
+                                        "SetAddress4",  // Method to be called
+                                        &error,         // object to return error
+                                        &reply,         // Response message on success
+                                        "ssss",         // input message (Interface, IP Address, Netmask, Gateway)
+                                        nwinterface,    // eth0
+                                        new_ipaddr,
+                                        new_netmask,
+                                        new_gateway);
+                if(r < 0)
+                {
+                    fprintf(stderr, "Failed to set network data %s:%s:%s %s\n", new_ipaddr, new_netmask, new_gateway, error.message);
+                    rc = IPMI_CC_UNSPECIFIED_ERROR;
+                }
+                memset(new_ipaddr, 0, INET_ADDRSTRLEN);
+                memset(new_netmask, 0, INET_ADDRSTRLEN);
+                memset(new_gateway, 0, INET_ADDRSTRLEN);
+            }
         }
-            
-        rc = sd_bus_open_system(&bus1);
-        if(rc < 0)
+        else if(reqptr->data[0] == SET_IN_PROGRESS) // Set In Progress
         {
-            fprintf(stderr,"ERROR: Getting a SYSTEM bus hook\n");
-            return -1;
+            lan_set_in_progress = SET_IN_PROGRESS;
         }
-
-        if (strcmp(cur_ipaddr, ""))
-        {
-            sd_bus_error_free(&err);
-            sd_bus_message_unref(req);
-            sd_bus_message_unref(res);
-
-            rc = sd_bus_call_method(bus1,            // On the System Bus
-                                    app,            // Service to contact
-                                    obj,            // Object path 
-                                    ifc,            // Interface name
-                                    "DelAddress4",  // Method to be called
-                                    &err,           // object to return error
-                                    &res,           // Response message on success
-                                    "ssss",         // input message (dev,ip,nm,gw)
-                                    "eth0",
-                                    cur_ipaddr,
-                                    cur_netmask,
-                                    cur_gateway);
-        }
-
-        if(rc < 0)
-        {
-            fprintf(stderr, "Failed to remove existing IP %s: %s\n", cur_ipaddr, err.message);
-            return -1;
-        }
-
-        sd_bus_error_free(&err);
-        sd_bus_message_unref(req);
-        sd_bus_message_unref(res);
-
-        rc = sd_bus_call_method(bus1,            // On the System Bus
-                                app,            // Service to contact
-                                obj,            // Object path 
-                                ifc,            // Interface name
-                                "AddAddress4",  // Method to be called
-                                &err,           // object to return error
-                                &res,           // Response message on success
-                                "ssss",         // input message (dev,ip,nm,gw)
-                                "eth0",
-                                new_ipaddr,
-                                new_netmask,
-                                new_gateway);
-        if(rc < 0)
-        {
-            fprintf(stderr, "Failed to set IP %s: %s\n", new_ipaddr, err.message);
-            return -1;
-        }
-
-        strcpy (cur_ipaddr, new_ipaddr);
-        strcpy (cur_netmask, new_netmask);
-        strcpy (cur_gateway, new_gateway);
     }
     else
     {
         fprintf(stderr, "Unsupported parameter 0x%x\n", reqptr->parameter);
-        return IPMI_CC_PARM_NOT_SUPPORTED;
+        rc = IPMI_CC_PARM_NOT_SUPPORTED;
     }
 
+    sd_bus_error_free(&error);
+    reply = sd_bus_message_unref(reply);
+
     return rc;
 }
 
@@ -206,17 +259,11 @@ ipmi_ret_t ipmi_transport_get_lan(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     ipmi_ret_t rc = IPMI_CC_OK;
     *data_len = 0;
     sd_bus *bus = ipmid_get_sd_bus_connection();
-    sd_bus_message *reply = NULL, *m = NULL;
+    sd_bus_message *reply = NULL;
     sd_bus_error error = SD_BUS_ERROR_NULL;
     int r = 0;
     const uint8_t current_revision = 0x11; // Current rev per IPMI Spec 2.0
-
-    int                 family;
-    unsigned char       prefixlen;
-    unsigned char       scope;
-    unsigned int        flags;
-    char               *saddr = NULL;
-    int                 i = 0;
+    int i = 0;
 
     printf("IPMI GET_LAN\n");
 
@@ -235,116 +282,65 @@ ipmi_ret_t ipmi_transport_get_lan(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 
     if (reqptr->parameter == LAN_PARM_INPROGRESS)
     {
-        uint8_t buf[] = {current_revision,0};
+        uint8_t buf[] = {current_revision, lan_set_in_progress};
         *data_len = sizeof(buf);
         memcpy(response, &buf, *data_len);
-        return IPMI_CC_OK;
     }
     else if (reqptr->parameter == LAN_PARM_AUTHSUPPORT)
     {
         uint8_t buf[] = {current_revision,0x04};
         *data_len = sizeof(buf);
         memcpy(response, &buf, *data_len);
-        return IPMI_CC_OK;
     }
     else if (reqptr->parameter == LAN_PARM_AUTHENABLES)
     {
         uint8_t buf[] = {current_revision,0x04,0x04,0x04,0x04,0x04};
         *data_len = sizeof(buf);
         memcpy(response, &buf, *data_len);
-        return IPMI_CC_OK;
     }
-    else if (reqptr->parameter == LAN_PARM_IP)
+    else if ((reqptr->parameter == LAN_PARM_IP) || (reqptr->parameter == LAN_PARM_SUBNET) || (reqptr->parameter == LAN_PARM_GATEWAY))
     {
-        const char*         device             = "eth0";
-        uint8_t buf[5]; // Size of expected IPMI response msg
+        uint8_t buf[5];
 
-        r = sd_bus_message_new_method_call(bus,&m,app,obj,ifc,"GetAddress4");
-        if (r < 0) {
-            fprintf(stderr, "Failed to add method object: %s\n", strerror(-r));
-            return -1;
-        }
-        r = sd_bus_message_append(m, "s", device);
-        if (r < 0) {
-            fprintf(stderr, "Failed to append message data: %s\n", strerror(-r));
-            return -1;
-        }
-        r = sd_bus_call(bus, m, 0, &error, &reply);
-        if (r < 0) {
-            fprintf(stderr, "Failed to call method: %s\n", strerror(-r));
-            return -1;
-        }
-        rc = sd_bus_message_enter_container (reply, 'a', "(iyyus)");
-        if(rc < 0)
-        {
-            fprintf(stderr, "Failed to parse response message:[%s]\n", strerror(-rc));
-            return -1;
-        }
-        rc = sd_bus_message_read(reply, "(iyyus)", &family, &prefixlen, &scope, &flags, &saddr);
-        if (rc < 0)
-        {
-            fprintf(stderr, "Failed to receive response: %s\n", strerror(-r));
-            return -1;
-        }
-
-        printf("%s:%d:%d:%d:%s\n", family==AF_INET?"IPv4":"IPv6", prefixlen, scope, flags, saddr);
-
-        memcpy((void*)&buf[0], &current_revision, 1);
+        *data_len = sizeof(current_revision);
+        memcpy(buf, &current_revision, *data_len);
 
-        // Parse IP address
-        char *tokptr = NULL;
-        char* digit = strtok_r(saddr, ".", &tokptr);
-        if (digit == NULL)
+        if(getNetworkData(reqptr->parameter, &buf[1]) == IPMI_CC_OK)
         {
-            fprintf(stderr, "Unexpected IP format: %s", saddr);
-            return IPMI_CC_RESPONSE_ERROR;
+            *data_len = sizeof(buf);
+            memcpy(response, &buf, *data_len);
         }
-        i = 0;
-        while (digit != NULL)
+        else
         {
-            int resp_byte = strtoul(digit, NULL, 10);
-            memcpy((void*)&buf[i+1], &resp_byte, 1);
-            i++;
-            digit = strtok_r(NULL, ".", &tokptr);
+            rc = IPMI_CC_UNSPECIFIED_ERROR;
         }
-
-        *data_len = sizeof(buf);
-        memcpy(response, &buf, *data_len);
-
-        return IPMI_CC_OK;
     }
     else if (reqptr->parameter == LAN_PARM_MAC)
     {
         //string to parse: link/ether xx:xx:xx:xx:xx:xx
-
-        const char*         device             = "eth0";
-        uint8_t             buf[7];
+        uint8_t buf[7];
         char *eaddr1 = NULL;
 
-        r = sd_bus_message_new_method_call(bus,&m,app,obj,ifc,"GetHwAddress");
-        if (r < 0) {
-            fprintf(stderr, "Failed to add method object: %s\n", strerror(-r));
-            return -1;
-        }
-        r = sd_bus_message_append(m, "s", device);
-        if (r < 0) {
-            fprintf(stderr, "Failed to append message data: %s\n", strerror(-r));
-            return -1;
-        }
-        r = sd_bus_call(bus, m, 0, &error, &reply);
-        if (r < 0) {
-            fprintf(stderr, "Failed to call method: %s\n", strerror(-r));
-            return -1;
+        r = sd_bus_call_method(bus, app, obj, ifc, "GetHwAddress", &error,
+                                &reply, "s", nwinterface);
+        if(r < 0)
+        {
+            fprintf(stderr, "Failed to call Get Method: %s\n", strerror(-r));
+            rc = IPMI_CC_UNSPECIFIED_ERROR;
+            goto cleanup;
         }
+
         r = sd_bus_message_read(reply, "s", &eaddr1);
         if (r < 0) {
             fprintf(stderr, "Failed to get a response: %s", strerror(-r));
-            return IPMI_CC_RESPONSE_ERROR;
+            rc = IPMI_CC_UNSPECIFIED_ERROR;
+            goto cleanup;
         }
         if (eaddr1 == NULL)
         {
             fprintf(stderr, "Failed to get a valid response: %s", strerror(-r));
-            return IPMI_CC_RESPONSE_ERROR;
+            rc = IPMI_CC_UNSPECIFIED_ERROR;
+            goto cleanup;
         }
 
         memcpy((void*)&buf[0], &current_revision, 1);
@@ -354,7 +350,8 @@ ipmi_ret_t ipmi_transport_get_lan(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
         if (digit == NULL)
         {
             fprintf(stderr, "Unexpected MAC format: %s", eaddr1);
-            return IPMI_CC_RESPONSE_ERROR;
+            rc = IPMI_CC_RESPONSE_ERROR;
+            goto cleanup;
         }
 
         i=0;
@@ -368,15 +365,17 @@ ipmi_ret_t ipmi_transport_get_lan(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 
         *data_len = sizeof(buf);
         memcpy(response, &buf, *data_len);
-
-        return IPMI_CC_OK;
     }
     else
     {
         fprintf(stderr, "Unsupported parameter 0x%x\n", reqptr->parameter);
-        return IPMI_CC_PARM_NOT_SUPPORTED;
+        rc = IPMI_CC_PARM_NOT_SUPPORTED;
     }
 
+cleanup:
+    sd_bus_error_free(&error);
+    reply = sd_bus_message_unref(reply);
+
     return rc;
 }
 
-- 
2.7.1
