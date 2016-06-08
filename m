Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rPwvw1cCqzDqxM
 for <openbmc@lists.ozlabs.org>; Thu,  9 Jun 2016 03:50:51 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465408243005911.9164124683379;
 Wed, 8 Jun 2016 10:50:43 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: ratagupt <ratagupt@in.ibm.com>
Subject: [PATCH phosphor-host-ipmid v2] Implement Network Override
Date: Wed,  8 Jun 2016 12:50:40 -0500
Message-Id: <20160608175040.18764-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20160608175040.18764-1-openbmc-patches@stwcx.xyz>
References: <20160608175040.18764-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 08 Jun 2016 17:50:53 -0000

From: ratagupt <ratagupt@in.ibm.com>

---
 chassishandler.C | 223 ++++++++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 211 insertions(+), 12 deletions(-)

diff --git a/chassishandler.C b/chassishandler.C
index d5b3404..af213b0 100644
--- a/chassishandler.C
+++ b/chassishandler.C
@@ -3,15 +3,19 @@
 #include <stdio.h>
 #include <string.h>
 #include <stdint.h>
-
-
+#include <arpa/inet.h>
+#include <netinet/in.h>
+#include <string>
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
 
 // OpenBMC Chassis Manager dbus framework
 const char  *chassis_bus_name      =  "org.openbmc.control.Chassis";
@@ -233,14 +237,189 @@ struct get_sys_boot_options_t {
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
+     host_network_config_t()
+     {
+         ipaddress = "";
+         prefix = "";
+         gateway = "";
+         macaddress = "";
+         isDHCP = "";
+     }
+};
+
+uint8_t getHostNetworkData(get_sys_boot_options_response_t *respptr)
+{
+    char *prop = NULL;
+
+    uint8_t data[SIZE_BOOT_OPTION]={0x80,0x21, 0x70 ,0x62 ,0x21,0x00 ,0x01 ,0x06 ,0x04};
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
+    int pos = 0;
+    string token,name,value;
+    string conf_str(prop);
+    
+    printf ("Configuration String[%s]\n ",conf_str.c_str());
+
+    while ((pos = conf_str.find(delimiter)) != std::string::npos) {
+
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
+    //Converting the mac address as number//
+    //If there as an error in converting the mac as number we are not throwing
+    //error we would be sending 0's for the mac.
+    
+    char *tokptr = NULL;
+    char* digit = strtok_r((char *)host_config.macaddress.c_str(), ":", &tokptr);
+    if (digit == NULL)
+    {
+        fprintf(stderr, "Unexpected MAC format: %s", host_config.macaddress.c_str());
+    }
+    
+    //As 9 bytes are pre filled so staring from index 9.If there is a failure
+    //in the strtok_r then digit will be null then we don't need to do
+    //anything as data is prefilled with 0
+    
+    uint8_t index=9;
+    int resp_byte = 0;
+    while (digit != NULL)
+    {
+        resp_byte = strtoul(digit, NULL, 16);
+        memcpy((void*)&data[index], &resp_byte, 1);
+        index++;
+        digit = strtok_r(NULL, ":", &tokptr);
+    }
+
+    //Conevrt the dhcp,ipaddress,mask and gateway as hex number
+    data[index++]=0x00;
+    sscanf(host_config.isDHCP.c_str(),"%02X",&data[index++]);
+
+    inet_pton(AF_INET,host_config.ipaddress.c_str(),(void *)&data[index]);
+    index+=4;
+    sscanf(host_config.prefix.c_str(),"%02X",&data[index++]);
+    inet_pton(AF_INET,host_config.gateway.c_str(),(void *)&data[index]);
+    index+=4; 
+    
+    
+    printf ("\n===Printing the IPMI Formatted Data========\n");
+
+    for (int j = 0;j<index;j++)
+        printf("%02x ", data[j]);
+
+    memcpy(respptr->data,data,SIZE_BOOT_OPTION);
+    return 0;
+
+}
+
+uint8_t setHostNetworkData(set_sys_boot_options_t * reqptr)
+{
+    string host_network_config;
+    char mac[SIZE_MAC];
+    char ipAddress[INET_ADDRSTRLEN];
+    char gateway[INET_ADDRSTRLEN];
+    char prefix[1];
+    char dhcp[2];
+    uint32_t cookie = 0;
+
+
+    memset( mac ,0,SIZE_MAC );
+    memset(ipAddress,0,INET_ADDRSTRLEN);
+    memset(gateway,0,INET_ADDRSTRLEN);
+    memset(prefix,0,1);
+    memset(dhcp,0,2);
+
+    uint8_t index = 9;  
+    sscanf((char *)&(reqptr->data[1]),"%02X",&cookie);
+
+    if ( !cookie) {
+     
+         snprintf(mac, SIZE_MAC, "%02x:%02x:%02x:%02x:%02x:%02x",
+            reqptr->data[index],
+            reqptr->data[index+1],
+            reqptr->data[index+2],
+            reqptr->data[index+3],
+            reqptr->data[index+4],
+            reqptr->data[index+5]);
+
+
+        snprintf(dhcp,2, "%d", reqptr->data[index+6]);
+
+        snprintf(ipAddress, INET_ADDRSTRLEN, "%d.%d.%d.%d",
+            reqptr->data[index+8], reqptr->data[index+9], reqptr->data[index+10], reqptr->data[index+11]);
+
+        snprintf(prefix, INET_ADDRSTRLEN, "%d", reqptr->data[index+12]);
+
+
+        snprintf(gateway, INET_ADDRSTRLEN, "%d.%d.%d.%d",
+            reqptr->data[index+13], reqptr->data[index+14], reqptr->data[index+15], reqptr->data[index+16]);
+    }
+
+    host_network_config += "ipaddress="+string(ipAddress)+",prefix="+ \
+                       string(prefix)+",gateway="+string(gateway)+\
+                       ",mac="+string(mac)+",dhcp="+string(dhcp);
+
+
+    printf ("Network configuration changed: %s\n",host_network_config.c_str());
+
+    int r = dbus_set_property("network_config",host_network_config.c_str());
+
+    if (r < 0) {
+        fprintf(stderr, "Dbus set property(network_config) failed for set_sys_boot_options.\n");
+        r = IPMI_CC_UNSPECIFIED_ERROR;
+    }
+
+    return r;
+
+}
+
 ipmi_ret_t ipmi_chassis_wildcard(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
                               ipmi_request_t request, ipmi_response_t response, 
                               ipmi_data_len_t data_len, ipmi_context_t context)
@@ -446,7 +625,18 @@ ipmi_ret_t ipmi_chassis_get_sys_boot_options(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
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
 
@@ -464,11 +654,10 @@ ipmi_ret_t ipmi_chassis_set_sys_boot_options(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
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
 
@@ -476,6 +665,7 @@ ipmi_ret_t ipmi_chassis_set_sys_boot_options(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
      * Parameter #5 means boot flags. Please refer to 28.13 of ipmi doc.
      * This is the only parameter used by petitboot.
      */
+
     if (reqptr->parameter == 5) {
 
         s = get_boot_option_by_ipmi(((reqptr->data[1] & 0x3C) >> 2));
@@ -507,7 +697,16 @@ ipmi_ret_t ipmi_chassis_set_sys_boot_options(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
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
2.8.3
