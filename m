Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rVkKC0YfSzDqrs
 for <openbmc@lists.ozlabs.org>; Thu, 16 Jun 2016 23:10:54 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466082642722253.68508088812007;
 Thu, 16 Jun 2016 06:10:42 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: ratagupt <ratagupt@in.ibm.com>
Subject: [PATCH phosphor-host-ipmid v4] Resolves openbmc/openbmc#267'
 Implement Network Override
Date: Thu, 16 Jun 2016 08:10:40 -0500
Message-Id: <20160616131040.14894-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.4
In-Reply-To: <20160616131040.14894-1-openbmc-patches@stwcx.xyz>
References: <20160616131040.14894-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 16 Jun 2016 13:10:56 -0000

From: ratagupt <ratagupt@in.ibm.com>

---
 chassishandler.C | 212 +++++++++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 200 insertions(+), 12 deletions(-)

diff --git a/chassishandler.C b/chassishandler.C
index d5b3404..2cc0895 100644
--- a/chassishandler.C
+++ b/chassishandler.C
@@ -1,17 +1,25 @@
 #include "chassishandler.h"
 #include "ipmid-api.h"
 #include <stdio.h>
+#include <stdlib.h>
 #include <string.h>
 #include <stdint.h>
-
-
+#include <arpa/inet.h>
+#include <netinet/in.h>
+#include <string>
+#include <sstream>
+#include <array>
+using namespace std;
 //Defines
-#define SET_PARM_VERSION 1
-#define SET_PARM_BOOT_FLAGS_PERMANENT 0x40 //boot flags data1 7th bit on
+#define SET_PARM_VERSION                     0x01
+#define SET_PARM_BOOT_FLAGS_PERMANENT        0x40 //boot flags data1 7th bit on
 #define SET_PARM_BOOT_FLAGS_VALID_ONE_TIME   0x80 //boot flags data1 8th bit on
 #define SET_PARM_BOOT_FLAGS_VALID_PERMANENT  0xC0 //boot flags data1 7 & 8 bit on 
 
-
+#define SIZE_MAC                             18
+#define SIZE_HOST_NETWORK_DATA               26
+#define SIZE_BOOT_OPTION                     SIZE_HOST_NETWORK_DATA
+#define SIZE_PREFIX                          7
 
 // OpenBMC Chassis Manager dbus framework
 const char  *chassis_bus_name      =  "org.openbmc.control.Chassis";
@@ -233,14 +241,174 @@ struct get_sys_boot_options_t {
 struct get_sys_boot_options_response_t {
     uint8_t version;
     uint8_t parm;
-    uint8_t data[5];
+    uint8_t data[SIZE_BOOT_OPTION];
 }  __attribute__ ((packed));
 
 struct set_sys_boot_options_t {
     uint8_t parameter;
-    uint8_t data[8];
+    uint8_t data[SIZE_BOOT_OPTION];
 }  __attribute__ ((packed));
 
+struct host_network_config_t {
+     string ipaddress;
+     string prefix;
+     string gateway;
+     string macaddress;
+     string isDHCP;
+
+     host_network_config_t():ipaddress(),prefix(),gateway(),macaddress() {}
+};
+
+uint8_t getHostNetworkData(get_sys_boot_options_response_t *respptr)
+{
+    char *prop = NULL;
+
+    std::array<uint8_t, SIZE_BOOT_OPTION> respData{0x80,0x21, 0x70 ,0x62 ,0x21,0x00 ,0x01 ,0x06 ,0x04};
+
+    int rc = dbus_get_property("network_config",&prop);
+
+    if (rc < 0) {
+        fprintf(stderr, "Dbus get property(boot_flags) failed for get_sys_boot_options.\n");
+        return rc;
+    }
+
+    /* network_config property Value would be in the form of 
+     * ipaddress=1.1.1.1,prefix=16,gateway=2.2.2.2,mac=11:22:33:44:55:66,dhcp=0
+     */
+
+    /* Parsing the string and fill the hostconfig structure with the 
+     * values */
+
+    host_network_config_t host_config;
+    string delimiter = ",";
+
+    size_t pos = 0;
+    string token,name,value;
+    string conf_str(prop);
+    
+    printf ("Configuration String[%s]\n ",conf_str.c_str());
+
+    while ( conf_str.length() > 0) {
+
+        pos = conf_str.find(delimiter);
+
+        //This condition is to extract the last 
+        //Substring as we will not be having the delimeter 
+        //at end. std::string::npos is -1
+        
+        if ( pos == std::string::npos )
+        { 
+           pos = conf_str.length();
+        }
+        token = conf_str.substr(0, pos);
+        int pos1 = token.find("=");
+
+        name = token.substr(0,pos1);
+        value = token.substr(pos1+1,pos);
+
+        if ( name == "ipaddress" )
+            host_config.ipaddress = value;
+        else if ( name == "prefix")
+            host_config.prefix = value; 
+        else if ( name == "gateway" )
+            host_config.gateway = value;
+        else if ( name == "mac" )
+            host_config.macaddress = value;
+        else if ( name == "dhcp" )
+            host_config.isDHCP = value;
+        
+        conf_str.erase(0, pos + delimiter.length());
+    }
+
+    //Starting from index 9 as 9 bytes are prefilled.
+
+    pos = 0; 
+    delimiter = ":";
+    uint8_t resp_byte = 0;
+    uint8_t index = 9;
+    
+    while ((pos = host_config.macaddress.find(delimiter)) != std::string::npos) {
+
+        token = host_config.macaddress.substr(0, pos);
+        resp_byte = strtoul(token.c_str(), NULL, 16);
+        memcpy((void*)&respData[index], &resp_byte, 1);
+        host_config.macaddress.erase(0, pos + delimiter.length());
+        index++;
+    }
+
+    resp_byte = strtoul(host_config.macaddress.c_str(), NULL, 16);
+    memcpy((void*)&respData[index++], &resp_byte, 1);
+
+    //Conevrt the dhcp,ipaddress,mask and gateway as hex number
+    respData[index++]=0x00;
+    sscanf(host_config.isDHCP.c_str(),"%02X",&respData[index++]);
+
+    inet_pton(AF_INET,host_config.ipaddress.c_str(),(void *)&respData[index]);
+    index+=4;
+
+    sscanf(host_config.prefix.c_str(),"%02d",&respData[index++]);
+    inet_pton(AF_INET,host_config.gateway.c_str(),(void *)&respData[index]);
+    index+=4; 
+    
+    printf ("\n===Printing the IPMI Formatted Data========\n");
+
+    for (int j = 0;j<index;j++)
+        printf("%02x ", respData[j]);
+
+    memcpy(respptr->data,respData.data(),SIZE_BOOT_OPTION);
+    return 0;
+}
+
+uint8_t setHostNetworkData(set_sys_boot_options_t * reqptr)
+{
+    string host_network_config;
+    char mac[SIZE_MAC] = {0};
+    char ipAddress[INET_ADDRSTRLEN] = {0};
+    char gateway[INET_ADDRSTRLEN] = {0};
+    char dhcp[SIZE_PREFIX] = {0};
+    char prefix[SIZE_PREFIX] = {0};
+    uint32_t cookie = 0;
+
+    memcpy(&cookie,(char *)&(reqptr->data[1]),sizeof(cookie));
+    
+    uint8_t index = 9;  
+
+    if ( cookie) {
+     
+            snprintf(mac, SIZE_MAC, "%02x:%02x:%02x:%02x:%02x:%02x",
+            reqptr->data[index],
+            reqptr->data[index+1],
+            reqptr->data[index+2],
+            reqptr->data[index+3],
+            reqptr->data[index+4],
+            reqptr->data[index+5]);
+    
+        snprintf(dhcp,SIZE_PREFIX, "%d", reqptr->data[index+7]);
+
+        snprintf(ipAddress, INET_ADDRSTRLEN, "%d.%d.%d.%d",
+            reqptr->data[index+8], reqptr->data[index+9], reqptr->data[index+10], reqptr->data[index+11]);
+
+        snprintf(prefix,SIZE_PREFIX,"%d", reqptr->data[index+12]);
+
+        snprintf(gateway, INET_ADDRSTRLEN, "%d.%d.%d.%d",
+            reqptr->data[index+13], reqptr->data[index+14], reqptr->data[index+15], reqptr->data[index+16]);
+    }
+
+    host_network_config += "ipaddress="+string(ipAddress)+",prefix="+ \
+                       string(prefix)+",gateway="+string(gateway)+\
+                       ",mac="+string(mac)+",dhcp="+string(dhcp);
+
+    printf ("Network configuration changed: %s\n",host_network_config.c_str());
+
+    int r = dbus_set_property("network_config",host_network_config.c_str());
+
+    if (r < 0) {
+        fprintf(stderr, "Dbus set property(network_config) failed for set_sys_boot_options.\n");
+        r = IPMI_CC_UNSPECIFIED_ERROR;
+    }
+    return r;
+}
+
 ipmi_ret_t ipmi_chassis_wildcard(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
                               ipmi_request_t request, ipmi_response_t response, 
                               ipmi_data_len_t data_len, ipmi_context_t context)
@@ -446,7 +614,18 @@ ipmi_ret_t ipmi_chassis_get_sys_boot_options(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
         }
 
 
-    } else {
+    } else if ( reqptr->parameter == 0x61 ) {
+       resp->parm      = 0x61;
+       int ret = getHostNetworkData(resp);
+       if (ret < 0) {
+           fprintf(stderr, "getHostNetworkData failed for get_sys_boot_options.\n");
+           rc = IPMI_CC_UNSPECIFIED_ERROR;
+
+       }else
+          rc = IPMI_CC_OK;
+    }
+
+    else {
         fprintf(stderr, "Unsupported parameter 0x%x\n", reqptr->parameter);
     }
 
@@ -464,11 +643,10 @@ ipmi_ret_t ipmi_chassis_set_sys_boot_options(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 {
     ipmi_ret_t rc = IPMI_CC_OK;
     char *s;
-
-    printf("IPMI SET_SYS_BOOT_OPTIONS\n");
-
     set_sys_boot_options_t *reqptr = (set_sys_boot_options_t *) request;
 
+    printf("IPMI SET_SYS_BOOT_OPTIONS reqptr->parameter =[%d]\n",reqptr->parameter);
+
     // This IPMI command does not have any resposne data
     *data_len = 0;
 
@@ -476,6 +654,7 @@ ipmi_ret_t ipmi_chassis_set_sys_boot_options(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
      * Parameter #5 means boot flags. Please refer to 28.13 of ipmi doc.
      * This is the only parameter used by petitboot.
      */
+
     if (reqptr->parameter == 5) {
 
         s = get_boot_option_by_ipmi(((reqptr->data[1] & 0x3C) >> 2));
@@ -507,7 +686,16 @@ ipmi_ret_t ipmi_chassis_set_sys_boot_options(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
             rc = IPMI_CC_UNSPECIFIED_ERROR;
         }
 
-    } else {
+    }
+    else if ( reqptr->parameter == 0x61 ) {
+       printf("IPMI SET_SYS_BOOT_OPTIONS reqptr->parameter =[%d]\n",reqptr->parameter);
+       int ret = setHostNetworkData(reqptr);
+       if (ret < 0) {
+           fprintf(stderr, "setHostNetworkData failed for set_sys_boot_options.\n");
+           rc = IPMI_CC_UNSPECIFIED_ERROR;
+       }
+    }      
+    else {
         fprintf(stderr, "Unsupported parameter 0x%x\n", reqptr->parameter);
         rc = IPMI_CC_PARM_NOT_SUPPORTED;
     }
-- 
2.8.4
