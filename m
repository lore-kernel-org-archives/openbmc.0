Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id C55EE1A090E
 for <openbmc@lists.ozlabs.org>; Sat, 17 Oct 2015 07:29:51 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1445027388465739.6690432235565;
 Fri, 16 Oct 2015 13:29:48 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openpower-host-ipmi-oem v3 3/7] Fixes from Joel review
Date: Fri, 16 Oct 2015 15:29:37 -0500
Message-Id: <1445027381-30153-4-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445027381-30153-1-git-send-email-patches@stwcx.xyz>
References: <1445027381-30153-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 16 Oct 2015 20:29:52 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 Makefile     |  8 +++----
 ipmid-api.h  |  4 ++--
 oemhandler.C | 34 ++++++++++++++---------------
 testit.C     | 70 ++++++++++++++++++++++++------------------------------------
 4 files changed, 51 insertions(+), 65 deletions(-)

diff --git a/Makefile b/Makefile
index e2c405b..e2ed670 100644
--- a/Makefile
+++ b/Makefile
@@ -6,14 +6,14 @@ TESTER_OBJ  = testit.o oemhandler.o
 LIB_OEM_OBJ = oemhandler.o
 LIB_OEM     = liboemhandler.so
 
-INC_FLAG += -I. -O2 --std=gnu++11
-LIB_FLAG += -rdynamic
+LDFLAGS += -rdynamic
+CXXFLAGS += -fpic -Wall
 
 
 all:  $(TESTER) $(LIB_OEM)
 
 %.o: %.C
-	$(CXX) -fpic -c $< $(CXXFLAGS) $(INC_FLAG) $(IPMID_PATH) -o $@
+	$(CXX) -fpic -c $< $(CXXFLAGS) -o $@
 	
 
 $(LIB_OEM): $(LIB_OEM_OBJ)
@@ -24,4 +24,4 @@ $(TESTER): $(TESTER_OBJ)
 	$(CXX) $^ $(LDFLAGS) $(LIB_FLAG) -o $@ -ldl
 
 clean:
-	rm -f $(TESTER) *.o *.so
+	$(RM) $(LIB_OEM_OBJ) $(LIB_OEM) $(TESTER_OBJ) $(TESTER)
diff --git a/ipmid-api.h b/ipmid-api.h
index ef2be38..68090f3 100644
--- a/ipmid-api.h
+++ b/ipmid-api.h
@@ -1,5 +1,5 @@
-#ifndef __HOST_IPMID_IPMI_COMMON_H__
-#define __HOST_IPMID_IPMI_COMMON_H__
+#ifndef __HOST_IPMID_API_COMMON_H__
+#define __HOST_IPMID_API_COMMON_H__
 #include <stdlib.h>
 
 // length of Completion Code and its ALWAYS _1_
diff --git a/oemhandler.C b/oemhandler.C
index c4eae21..fa1b9a2 100644
--- a/oemhandler.C
+++ b/oemhandler.C
@@ -5,8 +5,6 @@
 
 void register_netfn_oem_partial_esel() __attribute__((constructor));
 
-
-
 const char *g_esel_path = "/tmp/";
 uint16_t g_record_id = 0x0100;
 
@@ -32,39 +30,41 @@ ipmi_ret_t ipmi_ibm_oem_partial_esel(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 {
     esel_request_t *reqptr = (esel_request_t*) request;
     FILE *fp;
-    char string[32];
-    short offset = 0, record=0;
-    unsigned short rlen;
+    short offset = 0;
+    uint8_t rlen;
     ipmi_ret_t rc = IPMI_CC_OK;
-    char iocmd[4];
+    char iocmd[][4] = { { "wb" },  {"rb+"} };
+    char string[64];
+    char *pio;
 
-    strcpy(string, g_esel_path);
     
     offset = LSMSSWAP(reqptr->offsetls, reqptr->offsetms);
 
-    sprintf(string, "%s%s%02x%02x", string, "esel", reqptr->selrecordms, reqptr->selrecordls);
+    snprintf(string, sizeof(string), "%s%s%02x%02x", g_esel_path, "esel", reqptr->selrecordms, reqptr->selrecordls);
 
 
     // Length is the number of request bytes minus the header itself.
     // The header contains an extra byte to indicate the start of
     // the data (so didn't need to worry about word/byte boundaries)
     // hence the -1...
-    rlen = ((unsigned short)*data_len) - (sizeof(esel_request_t));
+    rlen = (*data_len) - (uint8_t) (sizeof(esel_request_t));
 
 
     printf("IPMI PARTIAL ESEL for %s  Offset = %d Length = %d\n", 
         string, offset, rlen);
 
+
+    // Rules state for a Partial eSel that the first write of a
+    // new esel will be the sensor data record.  We will use that
+    // to indicate this is a new record rather then an ofset in
+    // my next commit TODO
     if (offset == 0) {
-        strcpy(iocmd, "wb");
+        pio = iocmd[0];
     } else {
-        // I was thinking "ab+" but it appears it doesn't
-        // do what fseek asks.  Modify to rb+ and fseek 
-        // works great...
-        strcpy(iocmd, "rb+");
+        pio = iocmd[1];
     }
 
-    if ((fp = fopen(string, iocmd)) != NULL) {
+    if ((fp = fopen(string, pio)) != NULL) {
         fseek(fp, offset, SEEK_SET);
         fwrite(reqptr+1,rlen,1,fp);
         fclose(fp);
@@ -75,8 +75,8 @@ ipmi_ret_t ipmi_ibm_oem_partial_esel(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 
 
     } else {
-        fprintf(stderr, "Error trying to perform %s for esel%s\n",iocmd, string);
-        ipmi_ret_t rc = IPMI_CC_INVALID;   
+        fprintf(stderr, "Error trying to perform %s for esel%s\n",pio, string);
+        rc = IPMI_CC_INVALID;
         *data_len     = 0;
     }
     
diff --git a/testit.C b/testit.C
index b563257..25e069c 100644
--- a/testit.C
+++ b/testit.C
@@ -4,6 +4,12 @@
 #include "oemhandler.h"
 #include <cstring>
 
+#include <iostream>
+#include <fstream>
+#include <vector>
+
+using namespace std;
+
 const char* g_filepath = "/tmp/";
 
 const char * getFilePath(void) { 	return g_filepath; }
@@ -12,56 +18,36 @@ const char * getFilePath(void) { 	return g_filepath; }
 #define MAXRESPONSE 2
 
 
-// Returns the length of the file
-size_t checkFileSize(const char *fn) {
 
-	FILE *fp;
-	size_t len = -1;
-
-    if ((fp = fopen(fn, "rb")) != NULL) {
-        fseek(fp, 0, SEEK_END);
-        len = ftell(fp);
-        fclose(fp);	
-    }
-
-    return len;
+// Returns the length of the file
+std::ifstream::pos_type filesize(const char* filename)
+{
+    std::ifstream in(filename, std::ifstream::ate | std::ifstream::binary);
+    return in.tellg(); 
 }
 
+
 // Compares a string to the data in a file.
 // Returns 0 if complete match
-int compareData(const char *fn, const char *string, size_t len) {
+int compareData(const char *filename, const char *string, size_t len) 
+{
 
-	int rc = 0;
-	FILE *fp;
-	char fbyte;
-	int i=0;
+	std::ifstream in(filename, std::ifstream::ate | std::ifstream::binary);
+	std::streamsize size =  in.tellg();
 
-    if ((fp = fopen(fn, "rb")) != NULL) {
+	std::vector<char>      buffer(size);
+
+	in.read(buffer.data(), size);
+
+	if (!std::memcmp(string, buffer.data(), len)) 
+		return -1;
 	
-		while(fread(&fbyte, 1,1,fp) == 1) {
-    		if (*(string+i) != fbyte) {
-    			rc = -2;
-    			break;
-    		}
-    		i++;
-    	}
-    	fclose(fp);
-
-    	if (len != i) { 
-    		rc = -3; 
-    	}
-    
-    } else { 
-    	rc = -1; 
-    }
-    
-
-
-    return rc;
+
+    return 0;
 }
 
 
-void test_multiwrite(int segment, const char *pString) {
+void test_multiwrite(unsigned int segment, const char *pString) {
 
 	uint8_t	request[1024];
 	uint8_t	response[MAXRESPONSE];
@@ -87,7 +73,7 @@ void test_multiwrite(int segment, const char *pString) {
 
 	rc = ipmi_ibm_oem_partial_esel(0x3E, 0xF0, pRequest, pResponse, pLen, NULL);
 	if (rc  != IPMI_CC_OK) { printf("Error completion code returned %d\n", rc);}
-	if (len != 2)          { printf("Error data buffer length failed len=%lu\n", len);}
+	if (len != 2)          { printf("Error data buffer length failed len\n");}
 
 	pReqHdr->selrecordls = response[0];
 	pReqHdr->selrecordms = response[1];
@@ -114,7 +100,7 @@ void test_multiwrite(int segment, const char *pString) {
 		rc = ipmi_ibm_oem_partial_esel(0x3E, 0xF0, pRequest, pResponse, pLen, NULL);
 
 		if (rc  != IPMI_CC_OK) { printf("Error completion code returned %d\n", rc);}
-		if (len != 2)          { printf("Error data buffer length failed len=%lu\n", len);}
+		if (len != 2)          { printf("Error data buffer length failed\n");}
 
 		pReqHdr->selrecordls = response[0];
 		pReqHdr->selrecordms = response[1];
@@ -123,7 +109,7 @@ void test_multiwrite(int segment, const char *pString) {
 	}
 		
 
-	if (checkFileSize("/tmp/esel0100") != strlen(pString)) { printf("Error fileszie mismatch\n");}
+	if (filesize("/tmp/esel0100") !=  (unsigned int) strlen(pString)) { printf("Error fileszie mismatch\n");}
 
 	// /tmp/esel000 should be identical to the incoming string
 	rc = compareData("/tmp/esel0100",pString,strlen(pString));
-- 
2.6.0
