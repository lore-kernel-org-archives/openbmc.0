Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B0F41A0965
 for <openbmc@lists.ozlabs.org>; Fri, 23 Oct 2015 08:31:37 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1445549494653457.22806064810266;
 Thu, 22 Oct 2015 14:31:34 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v2] Add get sel time cmd
Date: Thu, 22 Oct 2015 16:31:31 -0500
Message-Id: <1445549491-2899-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445549491-2899-1-git-send-email-patches@stwcx.xyz>
References: <1445549491-2899-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 22 Oct 2015 21:31:37 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

Add support for IPMI function Get SEL Time
---
 storagehandler.C | 72 +++++++++++++++++++++++++++++++++++++-------------------
 storagehandler.h |  5 ++--
 2 files changed, 51 insertions(+), 26 deletions(-)

diff --git a/storagehandler.C b/storagehandler.C
index 659fff5..276dd70 100644
--- a/storagehandler.C
+++ b/storagehandler.C
@@ -3,6 +3,7 @@
 #include <stdio.h>
 #include <string.h>
 #include <stdint.h>
+#include <time.h>
 
 void register_netfn_storage_functions() __attribute__((constructor));
 
@@ -10,8 +11,8 @@ void register_netfn_storage_functions() __attribute__((constructor));
 unsigned int   g_sel_time    = 0xFFFFFFFF;
 unsigned short g_sel_reserve = 0x1;
 
-ipmi_ret_t ipmi_storage_wildcard(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
-                              ipmi_request_t request, ipmi_response_t response, 
+ipmi_ret_t ipmi_storage_wildcard(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
+                              ipmi_request_t request, ipmi_response_t response,
                               ipmi_data_len_t data_len, ipmi_context_t context)
 {
     printf("Handling STORAGE WILDCARD Netfn:[0x%X], Cmd:[0x%X]\n",netfn, cmd);
@@ -21,9 +22,29 @@ ipmi_ret_t ipmi_storage_wildcard(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     return rc;
 }
 
+ipmi_ret_t ipmi_storage_get_sel_time(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
+                              ipmi_request_t request, ipmi_response_t response,
+                              ipmi_data_len_t data_len, ipmi_context_t context)
+{
+    time_t currtime;
+    ipmi_ret_t rc = IPMI_CC_OK;
+
+    // Get current time in seconds since jan 1 1970
+    time(&currtime);
+
+    printf("IPMI Handling GET-SEL-TIME\n");
+
+    // From the IPMI Spec 2.0, response should be a 32-bit value
+    *data_len = sizeof(uint32_t);
+
+    // Pack the actual response
+    memcpy(response, &currtime, *data_len);
 
-ipmi_ret_t ipmi_storage_set_sel_time(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
-                              ipmi_request_t request, ipmi_response_t response, 
+    return rc;
+}
+
+ipmi_ret_t ipmi_storage_set_sel_time(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
+                              ipmi_request_t request, ipmi_response_t response,
                               ipmi_data_len_t data_len, ipmi_context_t context)
 {
     unsigned int *bufftype = (unsigned int *) request;
@@ -45,8 +66,8 @@ struct write_fru_data_t {
     uint8_t  data;
 } __attribute__ ((packed)) ;
 
-ipmi_ret_t ipmi_storage_write_fru_data(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
-                              ipmi_request_t request, ipmi_response_t response, 
+ipmi_ret_t ipmi_storage_write_fru_data(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
+                              ipmi_request_t request, ipmi_response_t response,
                               ipmi_data_len_t data_len, ipmi_context_t context)
 {
     write_fru_data_t *reqptr = (write_fru_data_t*) request;
@@ -67,14 +88,14 @@ ipmi_ret_t ipmi_storage_write_fru_data(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     // the data (so didn't need to worry about word/byte boundaries)
     // hence the -1...
     rlen = ((uint16_t)*data_len) - (sizeof(write_fru_data_t)-1);
-    
+
 
     printf("IPMI WRITE-FRU-DATA for %s  Offset = %d Length = %d\n",
         string, offset, rlen);
 
 
     // I was thinking "ab+" but it appears it doesn't
-    // do what fseek asks.  Modify to rb+ and fseek 
+    // do what fseek asks.  Modify to rb+ and fseek
     // works great...
     if (offset == 0) {
         strcpy(iocmd, "wb");
@@ -88,24 +109,24 @@ ipmi_ret_t ipmi_storage_write_fru_data(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
         fclose(fp);
     } else {
         fprintf(stderr, "Error trying to write to fru file %s\n",string);
-        ipmi_ret_t rc = IPMI_CC_INVALID;        
+        ipmi_ret_t rc = IPMI_CC_INVALID;
     }
-    
 
-    // TODO : Here is where some validation code could determine if the 
+
+    // TODO : Here is where some validation code could determine if the
     // fru data is a legitimate FRU record (not just a partial).  Once
     // the record is valid the code should call a parser routine to call
-    // the various methods updating interesting properties.  Perhaps 
+    // the various methods updating interesting properties.  Perhaps
     // thinigs like Model#, Serial#, DIMM Size, etc
-    
+
 
     *data_len = 0;
-    
+
     return rc;
 }
 
-ipmi_ret_t ipmi_storage_get_sel_info(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
-                              ipmi_request_t request, ipmi_response_t response, 
+ipmi_ret_t ipmi_storage_get_sel_info(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
+                              ipmi_request_t request, ipmi_response_t response,
                               ipmi_data_len_t data_len, ipmi_context_t context)
 {
 
@@ -129,8 +150,8 @@ ipmi_ret_t ipmi_storage_get_sel_info(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 
 
 
-ipmi_ret_t ipmi_storage_reserve_sel(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
-                              ipmi_request_t request, ipmi_response_t response, 
+ipmi_ret_t ipmi_storage_reserve_sel(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
+                              ipmi_request_t request, ipmi_response_t response,
                               ipmi_data_len_t data_len, ipmi_context_t context)
 {
 
@@ -147,8 +168,8 @@ ipmi_ret_t ipmi_storage_reserve_sel(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 }
 
 
-ipmi_ret_t ipmi_storage_add_sel(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
-                              ipmi_request_t request, ipmi_response_t response, 
+ipmi_ret_t ipmi_storage_add_sel(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
+                              ipmi_request_t request, ipmi_response_t response,
                               ipmi_data_len_t data_len, ipmi_context_t context)
 {
 
@@ -161,14 +182,14 @@ ipmi_ret_t ipmi_storage_add_sel(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     // Pack the actual response
     memcpy(response, &g_sel_reserve, *data_len);
 
-    // TODO This code should grab the completed partial esel located in 
-    // the /tmp/esel0100 file and commit it to the error log handler.  
+    // TODO This code should grab the completed partial esel located in
+    // the /tmp/esel0100 file and commit it to the error log handler.
 
 
     // TODO I advanced the sel reservation number so next time HB asks
-    // for a reservation they get a new number.  This tech may change 
+    // for a reservation they get a new number.  This tech may change
     // based on how the HB team currently uses sel reservations but
-    // for now provide the ability to get new reservations 
+    // for now provide the ability to get new reservations
     g_sel_reserve++;
 
     return rc;
@@ -181,6 +202,9 @@ void register_netfn_storage_functions()
     printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_STORAGE, IPMI_CMD_WILDCARD);
     ipmi_register_callback(NETFUN_STORAGE, IPMI_CMD_WILDCARD, NULL, ipmi_storage_wildcard);
 
+    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_STORAGE, IPMI_CMD_GET_SEL_TIME);
+    ipmi_register_callback(NETFUN_STORAGE, IPMI_CMD_GET_SEL_TIME, NULL, ipmi_storage_get_sel_time);
+
     printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_STORAGE, IPMI_CMD_SET_SEL_TIME);
     ipmi_register_callback(NETFUN_STORAGE, IPMI_CMD_SET_SEL_TIME, NULL, ipmi_storage_set_sel_time);
 
diff --git a/storagehandler.h b/storagehandler.h
index 56c1a8b..1b7f552 100644
--- a/storagehandler.h
+++ b/storagehandler.h
@@ -1,15 +1,16 @@
 #ifndef __HOST_IPMI_STORAGE_HANDLER_H__
 #define __HOST_IPMI_STORAGE_HANDLER_H__
 
-// IPMI commands for net functions.
+// IPMI commands for Storage net functions.
 enum ipmi_netfn_storage_cmds
 {
     // Get capability bits
-    IPMI_CMD_SET_SEL_TIME   = 0x49,
     IPMI_CMD_WRITE_FRU_DATA = 0x12,
     IPMI_CMD_GET_SEL_INFO   = 0x40,
     IPMI_CMD_RESERVE_SEL    = 0x42,
     IPMI_CMD_ADD_SEL        = 0x44,
+    IPMI_CMD_GET_SEL_TIME   = 0x48,
+    IPMI_CMD_SET_SEL_TIME   = 0x49,
 
 };
 
-- 
2.6.0
