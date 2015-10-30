Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id E11341A03BB
 for <openbmc@lists.ozlabs.org>; Sat, 31 Oct 2015 07:18:04 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446236279834405.0995759701393;
 Fri, 30 Oct 2015 13:17:59 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v2] IPMI support for get and set lan
Date: Fri, 30 Oct 2015 15:17:56 -0500
Message-Id: <1446236276-24173-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1446236276-24173-1-git-send-email-patches@stwcx.xyz>
References: <1446236276-24173-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 30 Oct 2015 20:18:05 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

Add enough support to query common network parameters
and be able to setup the network vi IPMI.
Use command line for now.
---
 Makefile           |   1 +
 ipmid-api.h        |  20 +++---
 transporthandler.C | 200 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 transporthandler.h |  18 +++++
 4 files changed, 229 insertions(+), 10 deletions(-)
 create mode 100644 transporthandler.C
 create mode 100644 transporthandler.h

diff --git a/Makefile b/Makefile
index a91328e..97c45e6 100644
--- a/Makefile
+++ b/Makefile
@@ -14,6 +14,7 @@ LIB_APP_OBJ = apphandler.o     \
               dcmihandler.o    \
               ipmisensor.o     \
               storageaddsel.o  \
+              transporthandler.o  \
 
 
 TESTADDSEL_OBJ = $(TESTADDSEL).o \
diff --git a/ipmid-api.h b/ipmid-api.h
index a78846c..b3117d5 100644
--- a/ipmid-api.h
+++ b/ipmid-api.h
@@ -62,16 +62,16 @@ extern "C" void ipmi_register_callback(ipmi_netfn_t, ipmi_cmd_t,
 // Note: these are also shifted left to make room for the LUN.
 enum ipmi_net_fns
 {
-    NETFUN_CHASSIS  =   0x00,
-    NETFUN_BRIDGE   =   0x02,
-    NETFUN_SENSOR   =   0x04,
-    NETFUN_APP      =   0x06,
-    NETFUN_FIRMWARE =   0x08,
-    NETFUN_STORAGE  =   0x0a,
-    NETFUN_TRANPORT =   0x0c,
-    NETFUN_GRPEXT   =   0x2c,
-    NETFUN_NONE     =   0x30,
-    NETFUN_OEM      =   0x32
+    NETFUN_CHASSIS   =   0x00,
+    NETFUN_BRIDGE    =   0x02,
+    NETFUN_SENSOR    =   0x04,
+    NETFUN_APP       =   0x06,
+    NETFUN_FIRMWARE  =   0x08,
+    NETFUN_STORAGE   =   0x0a,
+    NETFUN_TRANSPORT =   0x0c,
+    NETFUN_GRPEXT    =   0x2c,
+    NETFUN_NONE      =   0x30,
+    NETFUN_OEM       =   0x32
 };
 
 // IPMI commands for net functions. Since this is to be used both by the ipmi
diff --git a/transporthandler.C b/transporthandler.C
new file mode 100644
index 0000000..ca8522d
--- /dev/null
+++ b/transporthandler.C
@@ -0,0 +1,200 @@
+#include <stdio.h>
+#include <string.h>
+#include <stdint.h>
+
+#include "ipmid-api.h"
+#include "ipmid.H"
+#include "transporthandler.h"
+
+void register_netfn_transport_functions() __attribute__((constructor));
+
+ipmi_ret_t ipmi_transport_wildcard(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
+                              ipmi_request_t request, ipmi_response_t response,
+                              ipmi_data_len_t data_len, ipmi_context_t context)
+{
+    printf("Handling TRANSPORT WILDCARD Netfn:[0x%X], Cmd:[0x%X]\n",netfn, cmd);
+    // Status code.
+    ipmi_ret_t rc = IPMI_CC_OK;
+    *data_len = 0;
+    return rc;
+}
+
+struct set_lan_t {
+    uint8_t channel;
+    uint8_t parameter;
+    uint8_t data[8]; // Per IPMI spec, not expecting more than this size
+}  __attribute__ ((packed));
+
+ipmi_ret_t ipmi_transport_set_lan(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
+                              ipmi_request_t request, ipmi_response_t response,
+                              ipmi_data_len_t data_len, ipmi_context_t context)
+{
+    ipmi_ret_t rc = IPMI_CC_OK;
+    *data_len = 0;
+
+    int i = 0;
+    char syscmd[128];
+
+    printf("IPMI SET_LAN\n");
+
+    set_lan_t *reqptr = (set_lan_t*) request;
+
+    // TODO Use dbus interface once available. For now use cmd line.
+    // TODO Add the rest of the parameters like setting auth type
+    // TODO Add error handling
+
+    if (reqptr->parameter == 3) // IP
+    {
+        sprintf(syscmd, "ifconfig eth0 %d.%d.%d.%d", reqptr->data[0], reqptr->data[1], reqptr->data[2], reqptr->data[3]);
+        system(syscmd);
+    }
+    else if (reqptr->parameter == 6) // Subnet
+    {
+        sprintf(syscmd, "ifconfig eth0 netmask %d.%d.%d.%d", reqptr->data[0], reqptr->data[1], reqptr->data[2], reqptr->data[3]);
+        system(syscmd);
+    }
+    else if (reqptr->parameter == 12) // Gateway
+    {
+        sprintf(syscmd, "route add default gw %d.%d.%d.%d", reqptr->data[0], reqptr->data[1], reqptr->data[2], reqptr->data[3]);
+        system(syscmd);
+    }
+    else
+    {
+        fprintf(stderr, "Unsupported parameter 0x%x\n", reqptr->parameter);
+        return IPMI_CC_PARM_NOT_SUPPORTED;
+    }
+
+    return rc;
+}
+
+struct get_lan_t {
+    uint8_t rev_channel;
+    uint8_t parameter;
+    uint8_t parameter_set;
+    uint8_t parameter_block;
+}  __attribute__ ((packed));
+
+ipmi_ret_t ipmi_transport_get_lan(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
+                              ipmi_request_t request, ipmi_response_t response,
+                              ipmi_data_len_t data_len, ipmi_context_t context)
+{
+    ipmi_ret_t rc = IPMI_CC_OK;
+    *data_len = 0;
+
+    const uint8_t current_revision = 0x11; // Current rev per IPMI Spec 2.0
+    char syscmd[128];
+    int i = 0;
+
+    printf("IPMI GET_LAN\n");
+
+    get_lan_t *reqptr = (get_lan_t*) request;
+
+    if (reqptr->rev_channel & 0x80) // Revision is bit 7
+    {
+        // Only current revision was requested
+        *data_len = sizeof(current_revision);
+        memcpy(response, &current_revision, *data_len);
+        return IPMI_CC_OK;
+    }
+
+    // TODO Use dbus interface once available. For now use ip cmd.
+    // TODO Add the rest of the parameters, like gateway
+
+    if (reqptr->parameter == 0) // In progress
+    {
+        uint8_t buf[] = {current_revision,0};
+        *data_len = sizeof(buf);
+        memcpy(response, &buf, *data_len);
+        return IPMI_CC_OK;
+    }
+    else if (reqptr->parameter == 1) // Authentication support
+    {
+        uint8_t buf[] = {current_revision,0x04};
+        *data_len = sizeof(buf);
+        memcpy(response, &buf, *data_len);
+        return IPMI_CC_OK;
+    }
+    else if (reqptr->parameter == 2) // Authentication enables
+    {
+        uint8_t buf[] = {current_revision,0x04,0x04,0x04,0x04,0x04};
+        *data_len = sizeof(buf);
+        memcpy(response, &buf, *data_len);
+        return IPMI_CC_OK;
+    }
+    else if (reqptr->parameter == 3) // IP
+    {
+        //string to parse: inet xx.xx.xxx.xxx/xx
+
+        uint8_t buf[5];
+        memcpy((void*)&buf[0], &current_revision, 1);
+
+        for (i=0; i<4; i++)
+        {
+            char ip[5];
+
+            sprintf(syscmd, "ip address show dev eth0|grep inet|cut -d'/' -f1|cut -d' ' -f 6|cut -d'.' -f%d|head -n1", i+1);
+            FILE *fp = popen(syscmd, "r");
+
+            memset(ip,0,sizeof(ip));
+            while (fgets(ip, sizeof(ip), fp) != 0)
+            {
+                int tmpip = strtoul(ip, NULL, 10);
+                memcpy((void*)&buf[i+1], &tmpip, 1);
+            }
+            pclose(fp);
+        }
+
+        *data_len = sizeof(buf);
+        memcpy(response, &buf, *data_len);
+        return IPMI_CC_OK;
+    }
+    else if (reqptr->parameter == 5) // MAC
+    {
+        //string to parse: link/ether xx:xx:xx:xx:xx:xx
+
+        uint8_t buf[7];
+        memcpy((void*)&buf[0], &current_revision, 1);
+
+        for (i=0; i<6; i++)
+        {
+            char mac[4];
+
+            sprintf(syscmd, "ip address show dev eth0|grep link|cut -d' ' -f 6|cut -d':' -f%d", i+1);
+            FILE *fp = popen(syscmd, "r");
+
+            memset(mac,0,sizeof(mac));
+            while (fgets(mac, sizeof(mac), fp) != 0)
+            {
+                int tmpmac = strtoul(mac, NULL, 16);
+                memcpy((void*)&buf[i+1], &tmpmac, 1);
+            }
+            pclose(fp);
+        }
+
+        *data_len = sizeof(buf);
+        memcpy(response, &buf, *data_len);
+        return IPMI_CC_OK;
+    }
+    else
+    {
+        fprintf(stderr, "Unsupported parameter 0x%x\n", reqptr->parameter);
+        return IPMI_CC_PARM_NOT_SUPPORTED;
+    }
+
+    return rc;
+}
+
+void register_netfn_transport_functions()
+{
+    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_TRANSPORT, IPMI_CMD_WILDCARD);
+    ipmi_register_callback(NETFUN_TRANSPORT, IPMI_CMD_WILDCARD, NULL, ipmi_transport_wildcard);
+
+    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_TRANSPORT, IPMI_CMD_SET_LAN);
+    ipmi_register_callback(NETFUN_TRANSPORT, IPMI_CMD_SET_LAN, NULL, ipmi_transport_set_lan);
+
+    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_TRANSPORT, IPMI_CMD_GET_LAN);
+    ipmi_register_callback(NETFUN_TRANSPORT, IPMI_CMD_GET_LAN, NULL, ipmi_transport_get_lan);
+
+    return;
+}
+
diff --git a/transporthandler.h b/transporthandler.h
new file mode 100644
index 0000000..49b1d95
--- /dev/null
+++ b/transporthandler.h
@@ -0,0 +1,18 @@
+#ifndef __HOST_IPMI_TRANSPORT_HANDLER_H__
+#define __HOST_IPMI_TRANSPORT_HANDLER_H__
+
+// IPMI commands for Transport net functions.
+enum ipmi_netfn_storage_cmds
+{
+    // Get capability bits
+    IPMI_CMD_SET_LAN = 0x01,
+    IPMI_CMD_GET_LAN = 0x02,
+};
+
+// Command specific completion codes
+enum ipmi_transport_return_codes
+{
+    IPMI_CC_PARM_NOT_SUPPORTED = 0x80,
+};
+
+#endif
-- 
2.6.0
