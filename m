Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 0BA0E1A0393
 for <openbmc@lists.ozlabs.org>; Wed, 10 Feb 2016 09:30:42 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1455057037751629.9307766534231;
 Tue, 9 Feb 2016 14:30:37 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v2 2/2] Address review comments for IPMI
 transport functions
Date: Tue,  9 Feb 2016 16:30:35 -0600
Message-Id: <1455057035-29247-3-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 09 Feb 2016 22:30:43 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

Call get bus interface instead of using extern.
Define the IPMI request parameters.
Use snprintf.
Initialize dbus variables at the beginning of the function.
---
 transporthandler.C | 59 ++++++++++++++++++++++++++++++------------------------
 transporthandler.h |  9 +++++++++
 2 files changed, 42 insertions(+), 26 deletions(-)

diff --git a/transporthandler.C b/transporthandler.C
index 2df5ebf..df2986a 100644
--- a/transporthandler.C
+++ b/transporthandler.C
@@ -14,11 +14,13 @@
 #endif
 
 // OpenBMC System Manager dbus framework
-extern sd_bus *bus;
 const char  *app   =  "org.openbmc.NetworkManager";
 const char  *obj   =  "/org/openbmc/NetworkManager/Interface";
 const char  *ifc   =  "org.openbmc.NetworkManager";
 
+const int SIZE_MAC = 18; //xx:xx:xx:xx:xx:xx
+const int SIZE_LAN_PARM = 16; //xxx.xxx.xxx.xxx
+
 char cur_ipaddr  [16] = "";
 char cur_netmask [16] = "";
 char cur_gateway [16] = "";
@@ -52,6 +54,10 @@ ipmi_ret_t ipmi_transport_set_lan(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 {
     ipmi_ret_t rc = IPMI_CC_OK;
     *data_len = 0;
+    sd_bus *bus = ipmid_get_sd_bus_connection();
+    sd_bus_message *reply = NULL, *m = NULL;
+    sd_bus_error error = SD_BUS_ERROR_NULL;
+    int r = 0;
 
     printf("IPMI SET_LAN\n");
 
@@ -61,18 +67,16 @@ ipmi_ret_t ipmi_transport_set_lan(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     // TODO Add the rest of the parameters like setting auth type
     // TODO Add error handling
 
-    if (reqptr->parameter == 3) // IP
+    if (reqptr->parameter == LAN_PARM_IP)
     {
-        sprintf(new_ipaddr, "%d.%d.%d.%d", reqptr->data[0], reqptr->data[1], reqptr->data[2], reqptr->data[3]);
+        snprintf(new_ipaddr, SIZE_LAN_PARM, "%d.%d.%d.%d",
+            reqptr->data[0], reqptr->data[1], reqptr->data[2], reqptr->data[3]);
     }
-    else if (reqptr->parameter == 5) // MAC
+    else if (reqptr->parameter == LAN_PARM_MAC)
     {
-        char                mac[18];
-        sd_bus_message *reply = NULL, *m = NULL;
-        sd_bus_error error = SD_BUS_ERROR_NULL;
-        int r = 0;
+        char                mac[SIZE_MAC];
 
-        sprintf(mac, "%x:%x:%x:%x:%x:%x",
+        snprintf(mac, SIZE_MAC, "%02x:%02x:%02x:%02x:%02x:%02x",
                 reqptr->data[0],
                 reqptr->data[1],
                 reqptr->data[2],
@@ -96,20 +100,22 @@ ipmi_ret_t ipmi_transport_set_lan(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
             return -1;
         }
     }
-    else if (reqptr->parameter == 6) // Subnet
+    else if (reqptr->parameter == LAN_PARM_SUBNET)
     {
-        sprintf(new_netmask, "%d.%d.%d.%d", reqptr->data[0], reqptr->data[1], reqptr->data[2], reqptr->data[3]);
+        snprintf(new_netmask, SIZE_LAN_PARM, "%d.%d.%d.%d",
+            reqptr->data[0], reqptr->data[1], reqptr->data[2], reqptr->data[3]);
     }
-    else if (reqptr->parameter == 12) // Gateway
+    else if (reqptr->parameter == LAN_PARM_GATEWAY)
     {
-        sprintf(new_gateway, "%d.%d.%d.%d", reqptr->data[0], reqptr->data[1], reqptr->data[2], reqptr->data[3]);
+        snprintf(new_gateway, SIZE_LAN_PARM, "%d.%d.%d.%d",
+            reqptr->data[0], reqptr->data[1], reqptr->data[2], reqptr->data[3]);
     }
-    else if (reqptr->parameter == 0) // Apply config
+    else if (reqptr->parameter == LAN_PARM_INPROGRESS) // Apply config
     {
         int rc = 0;
         sd_bus_message *req = NULL;
         sd_bus_message *res = NULL;
-        sd_bus *bus         = NULL;
+        sd_bus *bus1        = NULL;
         sd_bus_error err    = SD_BUS_ERROR_NULL;
         
         if (!strcmp(new_ipaddr, "") || !strcmp (new_netmask, "") || !strcmp (new_gateway, ""))
@@ -118,7 +124,7 @@ ipmi_ret_t ipmi_transport_set_lan(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
             return -1;
         }
             
-        rc = sd_bus_open_system(&bus);
+        rc = sd_bus_open_system(&bus1);
         if(rc < 0)
         {
             fprintf(stderr,"ERROR: Getting a SYSTEM bus hook\n");
@@ -131,7 +137,7 @@ ipmi_ret_t ipmi_transport_set_lan(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
             sd_bus_message_unref(req);
             sd_bus_message_unref(res);
 
-            rc = sd_bus_call_method(bus,            // On the System Bus
+            rc = sd_bus_call_method(bus1,            // On the System Bus
                                     app,            // Service to contact
                                     obj,            // Object path 
                                     ifc,            // Interface name
@@ -155,7 +161,7 @@ ipmi_ret_t ipmi_transport_set_lan(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
         sd_bus_message_unref(req);
         sd_bus_message_unref(res);
 
-        rc = sd_bus_call_method(bus,            // On the System Bus
+        rc = sd_bus_call_method(bus1,            // On the System Bus
                                 app,            // Service to contact
                                 obj,            // Object path 
                                 ifc,            // Interface name
@@ -199,6 +205,7 @@ ipmi_ret_t ipmi_transport_get_lan(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 {
     ipmi_ret_t rc = IPMI_CC_OK;
     *data_len = 0;
+    sd_bus *bus = ipmid_get_sd_bus_connection();
     sd_bus_message *reply = NULL, *m = NULL;
     sd_bus_error error = SD_BUS_ERROR_NULL;
     int r = 0;
@@ -228,43 +235,43 @@ ipmi_ret_t ipmi_transport_get_lan(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     // TODO Use dbus interface once available. For now use ip cmd.
     // TODO Add the rest of the parameters, like gateway
 
-    if (reqptr->parameter == 0) // In progress
+    if (reqptr->parameter == LAN_PARM_INPROGRESS)
     {
         uint8_t buf[] = {current_revision,0};
         *data_len = sizeof(buf);
         memcpy(response, &buf, *data_len);
         return IPMI_CC_OK;
     }
-    else if (reqptr->parameter == 1) // Authentication support
+    else if (reqptr->parameter == LAN_PARM_AUTHSUPPORT)
     {
         uint8_t buf[] = {current_revision,0x04};
         *data_len = sizeof(buf);
         memcpy(response, &buf, *data_len);
         return IPMI_CC_OK;
     }
-    else if (reqptr->parameter == 2) // Authentication enables
+    else if (reqptr->parameter == LAN_PARM_AUTHENABLES)
     {
         uint8_t buf[] = {current_revision,0x04,0x04,0x04,0x04,0x04};
         *data_len = sizeof(buf);
         memcpy(response, &buf, *data_len);
         return IPMI_CC_OK;
     }
-    else if (reqptr->parameter == 3) // IP
+    else if (reqptr->parameter == LAN_PARM_IP)
     {
         const char*         device             = "eth0";
 
         sd_bus_message *res = NULL;
-        sd_bus *bus         = NULL;
+        sd_bus *bus1        = NULL;
         sd_bus_error err    = SD_BUS_ERROR_NULL;
 
-        rc = sd_bus_open_system(&bus);
+        rc = sd_bus_open_system(&bus1);
         if(rc < 0)
         {
             fprintf(stderr,"ERROR: Getting a SYSTEM bus hook\n");
             return -1;
         }
 
-        rc = sd_bus_call_method(bus,            // On the System Bus
+        rc = sd_bus_call_method(bus1,            // On the System Bus
                                 app,            // Service to contact
                                 obj,            // Object path 
                                 ifc,            // Interface name
@@ -309,7 +316,7 @@ ipmi_ret_t ipmi_transport_get_lan(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 
         return IPMI_CC_OK;
     }
-    else if (reqptr->parameter == 5) // MAC
+    else if (reqptr->parameter == LAN_PARM_MAC)
     {
         //string to parse: link/ether xx:xx:xx:xx:xx:xx
 
diff --git a/transporthandler.h b/transporthandler.h
index 49b1d95..ce7842b 100644
--- a/transporthandler.h
+++ b/transporthandler.h
@@ -15,4 +15,13 @@ enum ipmi_transport_return_codes
     IPMI_CC_PARM_NOT_SUPPORTED = 0x80,
 };
 
+// Parameters
+static const int LAN_PARM_INPROGRESS  = 0;
+static const int LAN_PARM_AUTHSUPPORT = 1;
+static const int LAN_PARM_AUTHENABLES = 2;
+static const int LAN_PARM_IP          = 3;
+static const int LAN_PARM_MAC         = 5;
+static const int LAN_PARM_SUBNET      = 6;
+static const int LAN_PARM_GATEWAY     = 12;
+
 #endif
-- 
2.7.1
