Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id CCEA81A0965
 for <openbmc@lists.ozlabs.org>; Sun,  1 Nov 2015 23:22:05 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446380521787868.772241193254;
 Sun, 1 Nov 2015 04:22:01 -0800 (PST)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH ipmi-fru-parser] keeping fru files forever
Date: Sun,  1 Nov 2015 06:21:58 -0600
Message-Id: <1446380518-18602-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1446380518-18602-1-git-send-email-patches@stwcx.xyz>
References: <1446380518-18602-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Sun, 01 Nov 2015 12:22:06 -0000

From: Chris Austen <austenc@us.ibm.com>

added correct ipmi response buffer
cleaned up a incorrect rc
---
 frup.h         |  7 ++++++-
 writefrudata.C | 45 ++++++++++++++++++++-------------------------
 2 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/frup.h b/frup.h
index 3286260..ef473a8 100644
--- a/frup.h
+++ b/frup.h
@@ -5,7 +5,12 @@
 
 /* Parse an IPMI write fru data message into a dictionary containing name value pair of VPD entries.*/
 int parse_fru (const void* msgbuf, sd_bus_message* vpdtbl);
-int parse_fru_area (const uint8_t area, const void* msgbuf, const uint8_t len, sd_bus_message* vpdtbl);
+
+extern "C" {
+    int parse_fru_area (const uint8_t area, const void* msgbuf, const uint8_t len, sd_bus_message* vpdtbl);
+};
+
+
 
 enum ipmi_fru_area_type
 {
diff --git a/writefrudata.C b/writefrudata.C
index 30ba39a..69bbb47 100644
--- a/writefrudata.C
+++ b/writefrudata.C
@@ -1,4 +1,4 @@
-#include <ipmid-api.h>
+#include <host-ipmid/ipmid-api.h>
 #include <vector>
 #include <stdlib.h>
 #include <dlfcn.h>
@@ -7,6 +7,8 @@
 #include "frup.h"
 #include "writefrudata.H"
 #include <systemd/sd-bus.h>
+#include <unistd.h>
+
 
 void register_netfn_storage_write_fru() __attribute__((constructor));
 
@@ -481,15 +483,11 @@ ipmi_ret_t ipmi_storage_write_fru_data(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     uint8_t offset = 0;
     uint16_t len = 0;
     ipmi_ret_t rc = IPMI_CC_INVALID;
-    int validate_rc = 0;
     const char *mode = NULL;
 
     // From the payload, extract the header that has fruid and the offsets
     write_fru_data_t *reqptr = (write_fru_data_t*)request;
 
-    // There is no response data for this command.
-    *data_len = 0;
-
     // Maintaining a temporary file to pump the data
     sprintf(fru_file_name, "%s%02x", "/tmp/ipmifru", reqptr->frunum);
 
@@ -500,25 +498,23 @@ ipmi_ret_t ipmi_storage_write_fru_data(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     // the data (so didn't need to worry about word/byte boundaries)
     // hence the -1...
     len = ((uint16_t)*data_len) - (sizeof(write_fru_data_t)-1);
+
+    // On error there is no response data for this command.
+    *data_len = 0;
     
 #ifdef __IPMI__DEBUG__
     printf("IPMI WRITE-FRU-DATA for [%s]  Offset = [%d] Length = [%d]\n",
             fru_file_name, offset, len);
 #endif
 
-    // offset would be zero if the cmd payload is targeting a new fru
-    if (offset == 0)
-    {
+
+    if( access( fru_file_name, F_OK ) == -1 ) {
         mode = "wb";
-    } 
-    else 
-    {
-        // offset would be non-zero if the cmd payload is continued for prev
-        // fru
+    } else {
         mode = "rb+";
     }
 
-    if ((fp = fopen(fru_file_name, mode)) != NULL) 
+    if ((fp = fopen(fru_file_name, mode)) != NULL)
     {
         if(fseek(fp, offset, SEEK_SET))
         {
@@ -541,18 +537,17 @@ ipmi_ret_t ipmi_storage_write_fru_data(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
         fprintf(stderr, "Error trying to write to fru file %s\n",fru_file_name);
         return rc;
     }
-    
-    // We received some bytes. It may be full or partial. Run a validator.
-    validate_rc = ipmi_validate_fru_area(reqptr->frunum, fru_file_name);
-    if(validate_rc != -1)
-    {
-        // Success validating _and_ updating the Inventory. We no longer need
-        // this file.
-        remove(fru_file_name);
-    }
 
-    // convert the rc per ipmi spec   
-    rc = (validate_rc != -1) ? IPMI_CC_OK : IPMI_CC_INVALID;
+
+    // If we got here then set the resonse byte
+    // to the number of bytes written
+    memcpy(response, &len, 1);
+    *data_len = 1;
+    rc = IPMI_CC_OK;
+
+    // We received some bytes. It may be full or partial. Send a valid
+    // FRU file to the inventory controller on DBus for the correct number
+    ipmi_validate_fru_area(reqptr->frunum, fru_file_name);
 
     return rc;
 }
-- 
2.6.0
