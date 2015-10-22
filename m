Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id C37661A0512
 for <openbmc@lists.ozlabs.org>; Thu, 22 Oct 2015 13:52:19 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445482337670371.5760808453073;
 Wed, 21 Oct 2015 19:52:17 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openpower-host-ipmi-oem 2/8] Add a test framework for the .so
Date: Wed, 21 Oct 2015 21:52:07 -0500
Message-Id: <1445482333-2053-3-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445482333-2053-1-git-send-email-patches@stwcx.xyz>
References: <1445482333-2053-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 22 Oct 2015 02:52:20 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 Makefile  |  10 +++-
 README.md |   1 +
 ipmid.H   |  15 ++++++
 testit.C  | 157 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 testit.h  |  14 ++++++
 5 files changed, 195 insertions(+), 2 deletions(-)
 create mode 100644 README.md
 create mode 100644 ipmid.H
 create mode 100644 testit.C
 create mode 100644 testit.h

diff --git a/Makefile b/Makefile
index f495d94..e2c405b 100644
--- a/Makefile
+++ b/Makefile
@@ -1,5 +1,8 @@
 CXX ?= $(CROSS_COMPILE)g++
 
+TESTER      = testit
+TESTER_OBJ  = testit.o oemhandler.o
+
 LIB_OEM_OBJ = oemhandler.o
 LIB_OEM     = liboemhandler.so
 
@@ -7,7 +10,7 @@ INC_FLAG += -I. -O2 --std=gnu++11
 LIB_FLAG += -rdynamic
 
 
-all: $(LIB_OEM)
+all:  $(TESTER) $(LIB_OEM)
 
 %.o: %.C
 	$(CXX) -fpic -c $< $(CXXFLAGS) $(INC_FLAG) $(IPMID_PATH) -o $@
@@ -17,5 +20,8 @@ $(LIB_OEM): $(LIB_OEM_OBJ)
 	$(CXX) $^ -shared $(LDFLAGS) $(LIB_FLAG) -o $@
 
 
+$(TESTER): $(TESTER_OBJ)
+	$(CXX) $^ $(LDFLAGS) $(LIB_FLAG) -o $@ -ldl
+
 clean:
-	rm -f *.o *.so
+	rm -f $(TESTER) *.o *.so
diff --git a/README.md b/README.md
new file mode 100644
index 0000000..410a857
--- /dev/null
+++ b/README.md
@@ -0,0 +1 @@
+This .so file and accompaning test program is designed to support the OpenPOWER's BIOS OEM command
\ No newline at end of file
diff --git a/ipmid.H b/ipmid.H
new file mode 100644
index 0000000..ab8b030
--- /dev/null
+++ b/ipmid.H
@@ -0,0 +1,15 @@
+#ifndef __HOST_IPMID_IPMI_H__
+#define __HOST_IPMID_IPMI_H__
+#include "ipmid-api.h"
+
+// When the requester sends in a netfn and a command along with data, this
+// function will look for registered handlers that will handle that [netfn,cmd]
+// and will make a call to that plugin implementation and send back the response.
+ipmi_ret_t ipmi_netfn_router(const ipmi_netfn_t, const ipmi_cmd_t, ipmi_request_t,
+                             ipmi_response_t, unsigned int *data_len);
+
+// Plugin libraries need to _end_ with .so
+#define IPMI_PLUGIN_EXTN ".so"
+#define MAX_IPMI_BUFFER 64
+
+#endif
diff --git a/testit.C b/testit.C
new file mode 100644
index 0000000..b563257
--- /dev/null
+++ b/testit.C
@@ -0,0 +1,157 @@
+#include <iostream>
+#include <cstdlib>
+#include "ipmid-api.h"
+#include "oemhandler.h"
+#include <cstring>
+
+const char* g_filepath = "/tmp/";
+
+const char * getFilePath(void) { 	return g_filepath; }
+
+// Number of bytes without the IPMI completion code
+#define MAXRESPONSE 2
+
+
+// Returns the length of the file
+size_t checkFileSize(const char *fn) {
+
+	FILE *fp;
+	size_t len = -1;
+
+    if ((fp = fopen(fn, "rb")) != NULL) {
+        fseek(fp, 0, SEEK_END);
+        len = ftell(fp);
+        fclose(fp);	
+    }
+
+    return len;
+}
+
+// Compares a string to the data in a file.
+// Returns 0 if complete match
+int compareData(const char *fn, const char *string, size_t len) {
+
+	int rc = 0;
+	FILE *fp;
+	char fbyte;
+	int i=0;
+
+    if ((fp = fopen(fn, "rb")) != NULL) {
+	
+		while(fread(&fbyte, 1,1,fp) == 1) {
+    		if (*(string+i) != fbyte) {
+    			rc = -2;
+    			break;
+    		}
+    		i++;
+    	}
+    	fclose(fp);
+
+    	if (len != i) { 
+    		rc = -3; 
+    	}
+    
+    } else { 
+    	rc = -1; 
+    }
+    
+
+
+    return rc;
+}
+
+
+void test_multiwrite(int segment, const char *pString) {
+
+	uint8_t	request[1024];
+	uint8_t	response[MAXRESPONSE];
+	size_t len, totalString;
+	ipmi_ret_t rc;
+	uint16_t i=0, j;
+	
+	esel_request_t  requestheader[]  = {0,0,0,0,0,0};
+	esel_request_t  *pReqHdr = requestheader;
+	uint8_t firstime[] = { 0x00, 0x00, 0xdf, 0x00, 0x00, 0x00, 0x00, 0x20, 
+		                   0x00, 0x04, 0x0c, 0x1e, 0x07, 0xaa, 0x00, 0x00};
+
+	ipmi_request_t  pRequest  = request;
+	ipmi_response_t pResponse = response;
+	ipmi_data_len_t pLen      = &len;
+
+	totalString = strlen(pString);
+
+	std::memcpy(pRequest, requestheader, sizeof(requestheader));
+	std::memcpy(&request[sizeof(requestheader)], firstime, sizeof(firstime)); 
+
+	*pLen = sizeof(requestheader) + sizeof(firstime);
+
+	rc = ipmi_ibm_oem_partial_esel(0x3E, 0xF0, pRequest, pResponse, pLen, NULL);
+	if (rc  != IPMI_CC_OK) { printf("Error completion code returned %d\n", rc);}
+	if (len != 2)          { printf("Error data buffer length failed len=%lu\n", len);}
+
+	pReqHdr->selrecordls = response[0];
+	pReqHdr->selrecordms = response[1];
+
+
+	for (i=0; i<totalString; i+=segment) {
+
+		pReqHdr->offsetls = (i&0x00FF);
+		pReqHdr->offsetms = ((i&0xFF00) >> 8);
+
+		// printf("Record id msls 0x%02x%02x\n", pReqHdr->selrecordms, pReqHdr->selrecordls);
+		// printf("Offset 0x%04x , msls = 0x%02x%02x\n", i, pReqHdr->offsetms , pReqHdr->offsetls);
+
+		if (i+segment > totalString) {
+			j = totalString-i;
+		} else {
+			j = segment;
+		}
+
+		std::memcpy(pRequest, requestheader, sizeof(requestheader));
+		std::memcpy(&request[sizeof(requestheader)], pString+i, j); 
+		len = sizeof(*requestheader) + j;
+
+		rc = ipmi_ibm_oem_partial_esel(0x3E, 0xF0, pRequest, pResponse, pLen, NULL);
+
+		if (rc  != IPMI_CC_OK) { printf("Error completion code returned %d\n", rc);}
+		if (len != 2)          { printf("Error data buffer length failed len=%lu\n", len);}
+
+		pReqHdr->selrecordls = response[0];
+		pReqHdr->selrecordms = response[1];
+
+
+	}
+		
+
+	if (checkFileSize("/tmp/esel0100") != strlen(pString)) { printf("Error fileszie mismatch\n");}
+
+	// /tmp/esel000 should be identical to the incoming string
+	rc = compareData("/tmp/esel0100",pString,strlen(pString));
+	if (rc != 0) {printf("Data miscompare %d\n",rc);}
+
+	return;
+}
+
+
+
+// Method that gets called by shared libraries to get their command handlers registered
+void ipmi_register_callback(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
+                       ipmi_context_t context, ipmid_callback_t handler)
+{
+}
+
+
+int main()
+{
+
+	const char* shortstring = "C";
+	const char* longstring  = "The President is very much a figurehead - he wields no real power whatsoever. He is apparently chosen by the government, but the qualities he is required to display are not those of leadership but those of finely judged outrage. For this reason the President is always a controversial choice, always an infuriating but fascinating character. His job is not to wield power but to draw attention away from it.";
+
+	test_multiwrite(1,  shortstring);
+
+	test_multiwrite(10, longstring);
+	test_multiwrite(1, longstring);
+	test_multiwrite(100, longstring);
+
+	return 0;
+}
diff --git a/testit.h b/testit.h
new file mode 100644
index 0000000..eaba238
--- /dev/null
+++ b/testit.h
@@ -0,0 +1,14 @@
+#include <iostream>
+#include <cstdlib>
+
+char* g_filepath = "/tmp/";
+
+char * getFilePath(void) { 	return g_filepath; }
+
+
+
+int main()
+{
+    if(const char* env_p = std::getenv("PATH"))
+        std::cout << "Your PATH is: " << env_p << '\n';
+}
-- 
2.6.0
