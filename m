Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 9A6291A0944
 for <openbmc@lists.ozlabs.org>; Sun, 21 Feb 2016 02:20:31 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 145598162701970.9410612583248;
 Sat, 20 Feb 2016 07:20:27 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openpower-host-ipmi-oem 1/2] Reduce esel footprint in /tmp
Date: Sat, 20 Feb 2016 09:20:24 -0600
Message-Id: <1455981625-30456-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1455981625-30456-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1455981625-30456-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sat, 20 Feb 2016 15:20:32 -0000

From: Chris Austen <austenc@us.ibm.com>

Now that event logs are stored as part of persistant storage
there is no longer a need to keep tmp full of these logs.  I
am converting back to using a single file as the temp space
for esels
---
 Makefile     |  11 +----
 oemhandler.C |  11 ++---
 testit.C     | 141 -----------------------------------------------------------
 3 files changed, 6 insertions(+), 157 deletions(-)
 delete mode 100644 testit.C

diff --git a/Makefile b/Makefile
index 61e97b0..eaa7324 100644
--- a/Makefile
+++ b/Makefile
@@ -1,8 +1,5 @@
 CXX ?= $(CROSS_COMPILE)g++
 
-TESTER      = testit
-TESTER_OBJ  = testit.o oemhandler.o
-
 LIB_OEM_OBJ = oemhandler.o
 LIB_OEM     = liboemhandler.so
 
@@ -10,17 +7,13 @@ LDFLAGS += -rdynamic -ldl
 CXXFLAGS += -fPIC -Wall
 
 
-all:  $(TESTER) $(LIB_OEM)
+all:  $(LIB_OEM)
 
 %.o: %.C
 	$(CXX) -c $< $(CXXFLAGS) -o $@
 
-
 $(LIB_OEM): $(LIB_OEM_OBJ)
 	$(CXX) $^ -shared $(LDFLAGS) -o $@
 
-$(TESTER): $(TESTER_OBJ)
-	$(CXX) $^ $(LDFLAGS) $(LIB_FLAG) -o $@ -ldl
-
 clean:
-	$(RM) $(LIB_OEM_OBJ) $(LIB_OEM) $(TESTER_OBJ) $(TESTER)
+	$(RM) $(LIB_OEM_OBJ) $(LIB_OEM)
diff --git a/oemhandler.C b/oemhandler.C
index ae3f506..6046816 100644
--- a/oemhandler.C
+++ b/oemhandler.C
@@ -5,7 +5,7 @@
 
 void register_netfn_oem_partial_esel() __attribute__((constructor));
 
-const char *g_esel_path = "/tmp/";
+const char *g_esel_path = "/tmp/esel";
 uint16_t g_record_id = 0x0001;
 
 
@@ -32,7 +32,6 @@ ipmi_ret_t ipmi_ibm_oem_partial_esel(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     short *offset =  (short*) &reqptr->offsetls;
     uint8_t rlen;
     ipmi_ret_t rc = IPMI_CC_OK;
-    char string[64];
     const char *pio;
 
 
@@ -40,20 +39,18 @@ ipmi_ret_t ipmi_ibm_oem_partial_esel(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
         // OpenPOWER Host Interface spec says if RecordID and Offset are
         // 0 then then this is a new request
         pio = "wb";
-        snprintf(string, sizeof(string), "%s%s%04x", g_esel_path, "esel", g_record_id);
     } else {
         pio = "rb+";
-        snprintf(string, sizeof(string), "%s%s%02x%02x", g_esel_path, "esel", reqptr->selrecordms, reqptr->selrecordls);
     }
 
     rlen = (*data_len) - (uint8_t) (sizeof(esel_request_t));
 
 
     printf("IPMI PARTIAL ESEL for %s  Offset = %d Length = %d\n",
-        string, *offset, rlen);
+        g_esel_path, *offset, rlen);
 
 
-    if ((fp = fopen(string, pio)) != NULL) {
+    if ((fp = fopen(g_esel_path, pio)) != NULL) {
         fseek(fp, *offset, SEEK_SET);
         fwrite(reqptr+1,rlen,1,fp);
         fclose(fp);
@@ -61,7 +58,7 @@ ipmi_ret_t ipmi_ibm_oem_partial_esel(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
         *data_len = sizeof(g_record_id);
         memcpy(response, &g_record_id, *data_len);
     } else {
-        fprintf(stderr, "Error trying to perform %s for esel%s\n",pio, string);
+        fprintf(stderr, "Error trying to perform %s for esel%s\n",pio, g_esel_path);
         rc = IPMI_CC_INVALID;
         *data_len     = 0;
     }
diff --git a/testit.C b/testit.C
deleted file mode 100644
index 79dfd6a..0000000
--- a/testit.C
+++ /dev/null
@@ -1,141 +0,0 @@
-#include <cstdlib>
-#include <cstring>
-#include <fstream>
-#include <iostream>
-#include <vector>
-#include <host-ipmid/ipmid-api.h>
-#include "oemhandler.h"
-
-using namespace std;
-
-const char* g_filepath = "/tmp/";
-
-const char * getFilePath(void) {    return g_filepath; }
-
-// Number of bytes without the IPMI completion code
-#define MAXRESPONSE 2
-
-
-
-// Returns the length of the file
-std::ifstream::pos_type filesize(const char* filename)
-{
-    std::ifstream in(filename, std::ifstream::ate | std::ifstream::binary);
-    return in.tellg();
-}
-
-
-// Compares a string to the data in a file.
-// Returns 0 if complete match
-int compareData(const char *filename, const char *string, size_t len)
-{
-
-    std::ifstream in(filename, std::ifstream::ate | std::ifstream::binary);
-    std::streamsize size =  in.tellg();
-
-    std::vector<char>      buffer(size);
-
-    in.read(buffer.data(), size);
-
-    if (!std::memcmp(string, buffer.data(), len))
-        return -1;
-
-
-    return 0;
-}
-
-
-void test_multiwrite(unsigned int segment, const char *pString) {
-
-    uint8_t request[1024];
-    uint8_t response[MAXRESPONSE];
-    size_t len, totalString;
-    ipmi_ret_t rc;
-    uint16_t i=0, j;
-
-    esel_request_t  requestheader[]  = {0,0,0,0,0,0};
-    esel_request_t  *pReqHdr = requestheader;
-    uint8_t firstime[] = { 0x00, 0x00, 0xdf, 0x00, 0x00, 0x00, 0x00, 0x20,
-                           0x00, 0x04, 0x0c, 0x1e, 0x07, 0xaa, 0x00, 0x00};
-
-    ipmi_request_t  pRequest  = request;
-    ipmi_response_t pResponse = response;
-    ipmi_data_len_t pLen      = &len;
-
-    totalString = strlen(pString);
-
-    std::memcpy(pRequest, requestheader, sizeof(requestheader));
-    std::memcpy(&request[sizeof(requestheader)], firstime, sizeof(firstime));
-
-    *pLen = sizeof(requestheader) + sizeof(firstime);
-
-    rc = ipmi_ibm_oem_partial_esel(0x3E, 0xF0, pRequest, pResponse, pLen, NULL);
-    if (rc  != IPMI_CC_OK) { printf("Error completion code returned %d\n", rc);}
-    if (len != 2)          { printf("Error data buffer length failed len\n");}
-
-    pReqHdr->selrecordls = response[0];
-    pReqHdr->selrecordms = response[1];
-
-
-    for (i=0; i<totalString; i+=segment) {
-
-        pReqHdr->offsetls = (i&0x00FF);
-        pReqHdr->offsetms = ((i&0xFF00) >> 8);
-
-        // printf("Record id msls 0x%02x%02x\n", pReqHdr->selrecordms, pReqHdr->selrecordls);
-        // printf("Offset 0x%04x , msls = 0x%02x%02x\n", i, pReqHdr->offsetms , pReqHdr->offsetls);
-
-        if (i+segment > totalString) {
-            j = totalString-i;
-        } else {
-            j = segment;
-        }
-
-        std::memcpy(pRequest, requestheader, sizeof(requestheader));
-        std::memcpy(&request[sizeof(requestheader)], pString+i, j);
-        len = sizeof(*requestheader) + j;
-
-        rc = ipmi_ibm_oem_partial_esel(0x3E, 0xF0, pRequest, pResponse, pLen, NULL);
-
-        if (rc  != IPMI_CC_OK) { printf("Error completion code returned %d\n", rc);}
-        if (len != 2)          { printf("Error data buffer length failed\n");}
-
-        pReqHdr->selrecordls = response[0];
-        pReqHdr->selrecordms = response[1];
-
-
-    }
-
-
-    if (filesize("/tmp/esel0100") !=  (unsigned int) strlen(pString)) { printf("Error fileszie mismatch\n");}
-
-    // /tmp/esel000 should be identical to the incoming string
-    rc = compareData("/tmp/esel0100",pString,strlen(pString));
-    if (rc != 0) {printf("Data miscompare %d\n",rc);}
-
-    return;
-}
-
-
-
-// Method that gets called by shared libraries to get their command handlers registered
-void ipmi_register_callback(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
-                       ipmi_context_t context, ipmid_callback_t handler)
-{
-}
-
-
-int main()
-{
-
-    const char* shortstring = "C";
-    const char* longstring  = "The President is very much a figurehead - he wields no real power whatsoever. He is apparently chosen by the government, but the qualities he is required to display are not those of leadership but those of finely judged outrage. For this reason the President is always a controversial choice, always an infuriating but fascinating character. His job is not to wield power but to draw attention away from it.";
-
-    test_multiwrite(1,  shortstring);
-
-    test_multiwrite(10, longstring);
-    test_multiwrite(1, longstring);
-    test_multiwrite(100, longstring);
-
-    return 0;
-}
-- 
2.7.1
