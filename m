Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 21D751A1854
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jan 2016 00:22:45 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1453296029843859.6967651999281;
 Wed, 20 Jan 2016 05:20:29 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid] Using systemd dbus API to set get LAN
 parameters.
Date: Wed, 20 Jan 2016 07:20:28 -0600
Message-Id: <1453296028-21095-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1453296028-21095-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1453296028-21095-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 20 Jan 2016 13:22:46 -0000

From: Hariharasubramanian R <hramasub@in.ibm.com>

---
 transporthandler.C | 233 +++++++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 191 insertions(+), 42 deletions(-)

diff --git a/transporthandler.C b/transporthandler.C
index 0f7a730..dac8fe8 100644
--- a/transporthandler.C
+++ b/transporthandler.C
@@ -1,11 +1,31 @@
 #include <stdio.h>
 #include <string.h>
 #include <stdint.h>
+#include <arpa/inet.h>
 
 #include "ipmid-api.h"
 #include "ipmid.H"
 #include "transporthandler.h"
 
+#define SYSTEMD_NETWORKD_DBUS 1
+
+#ifdef SYSTEMD_NETWORKD_DBUS
+#include <systemd/sd-bus.h>
+#endif
+
+// OpenBMC System Manager dbus framework
+const char  *app   =  "org.openbmc.NetworkManager";
+const char  *obj   =  "/org/openbmc/NetworkManager/Interface";
+const char  *ifc   =  "org.openbmc.NetworkManager";
+
+char cur_ipaddr  [16] = "";
+char cur_netmask [16] = "";
+char cur_gateway [16] = "";
+
+char new_ipaddr  [16] = "";
+char new_netmask [16] = "";
+char new_gateway [16] = "";
+
 void register_netfn_transport_functions() __attribute__((constructor));
 
 ipmi_ret_t ipmi_transport_wildcard(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
@@ -31,7 +51,6 @@ ipmi_ret_t ipmi_transport_set_lan(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 {
     ipmi_ret_t rc = IPMI_CC_OK;
     *data_len = 0;
-    char syscmd[128];
 
     printf("IPMI SET_LAN\n");
 
@@ -43,18 +62,88 @@ ipmi_ret_t ipmi_transport_set_lan(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 
     if (reqptr->parameter == 3) // IP
     {
-        sprintf(syscmd, "ifconfig eth0 %d.%d.%d.%d", reqptr->data[0], reqptr->data[1], reqptr->data[2], reqptr->data[3]);
-        system(syscmd);
+        sprintf(new_ipaddr, "%d.%d.%d.%d", reqptr->data[0], reqptr->data[1], reqptr->data[2], reqptr->data[3]);
     }
     else if (reqptr->parameter == 6) // Subnet
     {
-        sprintf(syscmd, "ifconfig eth0 netmask %d.%d.%d.%d", reqptr->data[0], reqptr->data[1], reqptr->data[2], reqptr->data[3]);
-        system(syscmd);
+        sprintf(new_netmask, "%d.%d.%d.%d", reqptr->data[0], reqptr->data[1], reqptr->data[2], reqptr->data[3]);
     }
     else if (reqptr->parameter == 12) // Gateway
     {
-        sprintf(syscmd, "route add default gw %d.%d.%d.%d", reqptr->data[0], reqptr->data[1], reqptr->data[2], reqptr->data[3]);
-        system(syscmd);
+        sprintf(new_gateway, "%d.%d.%d.%d", reqptr->data[0], reqptr->data[1], reqptr->data[2], reqptr->data[3]);
+    }
+    else if (reqptr->parameter == 0) // Apply config
+    {
+        int rc = 0;
+        sd_bus_message *req = NULL;
+        sd_bus_message *res = NULL;
+        sd_bus *bus         = NULL;
+        sd_bus_error err    = SD_BUS_ERROR_NULL;
+        
+        if (!strcmp(new_ipaddr, "") || !strcmp (new_netmask, "") || !strcmp (new_gateway, ""))
+        {
+            fprintf(stderr,"ERROR: Incomplete LAN Parameters\n");
+            return -1;
+        }
+            
+        rc = sd_bus_open_system(&bus);
+        if(rc < 0)
+        {
+            fprintf(stderr,"ERROR: Getting a SYSTEM bus hook\n");
+            return -1;
+        }
+
+        if (strcmp(cur_ipaddr, ""))
+        {
+            sd_bus_error_free(&err);
+            sd_bus_message_unref(req);
+            sd_bus_message_unref(res);
+
+            rc = sd_bus_call_method(bus,            // On the System Bus
+                                    app,            // Service to contact
+                                    obj,            // Object path 
+                                    ifc,            // Interface name
+                                    "DelAddress4",  // Method to be called
+                                    &err,           // object to return error
+                                    &res,           // Response message on success
+                                    "ssss",         // input message (dev,ip,nm,gw)
+                                    "eth0",
+                                    cur_ipaddr,
+                                    cur_netmask,
+                                    cur_gateway);
+        }
+
+        if(rc < 0)
+        {
+            fprintf(stderr, "Failed to remove existing IP %s: %s\n", cur_ipaddr, err.message);
+            return -1;
+        }
+
+        sd_bus_error_free(&err);
+        sd_bus_message_unref(req);
+        sd_bus_message_unref(res);
+
+        rc = sd_bus_call_method(bus,            // On the System Bus
+                                app,            // Service to contact
+                                obj,            // Object path 
+                                ifc,            // Interface name
+                                "AddAddress4",  // Method to be called
+                                &err,           // object to return error
+                                &res,           // Response message on success
+                                "ssss",         // input message (dev,ip,nm,gw)
+                                "eth0",
+                                new_ipaddr,
+                                new_netmask,
+                                new_gateway);
+        if(rc < 0)
+        {
+            fprintf(stderr, "Failed to set IP %s: %s\n", new_ipaddr, err.message);
+            return -1;
+        }
+
+        strcpy (cur_ipaddr, new_ipaddr);
+        strcpy (cur_netmask, new_netmask);
+        strcpy (cur_gateway, new_gateway);
     }
     else
     {
@@ -78,10 +167,16 @@ ipmi_ret_t ipmi_transport_get_lan(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 {
     ipmi_ret_t rc = IPMI_CC_OK;
     *data_len = 0;
-
+    sd_bus_error err    = SD_BUS_ERROR_NULL; /* fixme */
     const uint8_t current_revision = 0x11; // Current rev per IPMI Spec 2.0
-    char syscmd[128];
-    int i = 0;
+
+    int                 family;
+    unsigned char       prefixlen;
+    unsigned char       scope;
+    unsigned int        flags;
+    char                saddr [128];
+    char                gateway [128];
+    uint8_t             buf[11];
 
     printf("IPMI GET_LAN\n");
 
@@ -121,56 +216,111 @@ ipmi_ret_t ipmi_transport_get_lan(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     }
     else if (reqptr->parameter == 3) // IP
     {
-        //string to parse: inet xx.xx.xxx.xxx/xx
+        const char*         device             = "eth0";
 
-        uint8_t buf[5];
-        memcpy((void*)&buf[0], &current_revision, 1);
+        sd_bus_message *res = NULL;
+        sd_bus *bus         = NULL;
+        sd_bus_error err    = SD_BUS_ERROR_NULL;
+
+        rc = sd_bus_open_system(&bus);
+        if(rc < 0)
+        {
+            fprintf(stderr,"ERROR: Getting a SYSTEM bus hook\n");
+            return -1;
+        }
 
-        for (i=0; i<4; i++)
+        rc = sd_bus_call_method(bus,            // On the System Bus
+                                app,            // Service to contact
+                                obj,            // Object path 
+                                ifc,            // Interface name
+                                "GetAddress4",  // Method to be called
+                                &err,           // object to return error
+                                &res,           // Response message on success
+                                "s",         // input message (dev,ip,nm,gw)
+                                "eth0");
+        if(rc < 0)
         {
-            char ip[5];
-
-            sprintf(syscmd, "ip address show dev eth0|grep inet|cut -d'/' -f1|cut -d' ' -f 6|cut -d'.' -f%d|head -n1", i+1);
-            FILE *fp = popen(syscmd, "r");
-
-            memset(ip,0,sizeof(ip));
-            while (fgets(ip, sizeof(ip), fp) != 0)
-            {
-                int tmpip = strtoul(ip, NULL, 10);
-                memcpy((void*)&buf[i+1], &tmpip, 1);
-            }
-            pclose(fp);
+            fprintf(stderr, "Failed to Get IP on interface : %s\n", device);
+            return -1;
+        }
+
+        /* rc = sd_bus_message_read(res, "a(iyyus)s", ...); */
+        rc = sd_bus_message_enter_container (res, 'a', "(iyyus)");
+        if(rc < 0)
+        {
+            fprintf(stderr, "Failed to parse response message:[%s]\n", strerror(-rc));
+            return -1;
+        }
+
+        while ((rc = sd_bus_message_read(res, "(iyyus)", &family, &prefixlen, &scope, &flags, &saddr)) > 0) {
+                printf("%s:%d:%d:%d:%s\n", family==AF_INET?"IPv4":"IPv6", prefixlen, scope, flags, saddr);
         }
 
+        rc = sd_bus_message_read (res, "s", &gateway);
+        if(rc < 0)
+        {
+            fprintf(stderr, "Failed to parse gateway from response message:[%s]\n", strerror(-rc));
+            return -1;
+        }
+
+        memcpy((void*)&buf[0], &current_revision, 1);
+        sscanf (saddr, "%c.%c.%c.%c", &buf[1], &buf[2], &buf[3], &buf[4]);
+        buf[5] = family;
+        buf[6] = prefixlen;
+        sscanf (gateway, "%c.%c.%c.%c", &buf[7], &buf[8], &buf[9], &buf[10]);
+
         *data_len = sizeof(buf);
         memcpy(response, &buf, *data_len);
+
         return IPMI_CC_OK;
     }
     else if (reqptr->parameter == 5) // MAC
     {
         //string to parse: link/ether xx:xx:xx:xx:xx:xx
 
-        uint8_t buf[7];
-        memcpy((void*)&buf[0], &current_revision, 1);
+        const char*         device             = "eth0";
+        char                eaddr [12];
+        uint8_t             buf[7];
+
+        sd_bus_message *res = NULL;
+        sd_bus *bus         = NULL;
+        sd_bus_error err    = SD_BUS_ERROR_NULL;
+
+        rc = sd_bus_open_system(&bus);
+        if(rc < 0)
+        {
+            fprintf(stderr,"ERROR: Getting a SYSTEM bus hook\n");
+            return -1;
+        }
+
+        rc = sd_bus_call_method(bus,            // On the System Bus
+                                app,            // Service to contact
+                                obj,            // Object path 
+                                ifc,            // Interface name
+                                "GetHwAddress",  // Method to be called
+                                &err,           // object to return error
+                                &res,           // Response message on success
+                                "s",         // input message (dev,ip,nm,gw)
+                                device);
+        if(rc < 0)
+        {
+            fprintf(stderr, "Failed to Get HW address of device : %s\n", device);
+            return -1;
+        }
 
-        for (i=0; i<6; i++)
+        rc = sd_bus_message_read (res, "s", &eaddr);
+        if(rc < 0)
         {
-            char mac[4];
-
-            sprintf(syscmd, "ip address show dev eth0|grep link|cut -d' ' -f 6|cut -d':' -f%d", i+1);
-            FILE *fp = popen(syscmd, "r");
-
-            memset(mac,0,sizeof(mac));
-            while (fgets(mac, sizeof(mac), fp) != 0)
-            {
-                int tmpmac = strtoul(mac, NULL, 16);
-                memcpy((void*)&buf[i+1], &tmpmac, 1);
-            }
-            pclose(fp);
+            fprintf(stderr, "Failed to parse gateway from response message:[%s]\n", strerror(-rc));
+            return -1;
         }
 
+        memcpy((void*)&buf[0], &current_revision, 1);
+        sscanf (eaddr, "%x:%x:%x:%x:%x:%x", &buf[1], &buf[2], &buf[3], &buf[4], &buf[5], &buf[6]);
+
         *data_len = sizeof(buf);
         memcpy(response, &buf, *data_len);
+
         return IPMI_CC_OK;
     }
     else
@@ -195,4 +345,3 @@ void register_netfn_transport_functions()
 
     return;
 }
-
-- 
2.6.4
