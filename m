Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3E3811A08F7
 for <openbmc@lists.ozlabs.org>; Sat, 17 Oct 2015 07:29:47 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1445027385347278.34329103427353;
 Fri, 16 Oct 2015 13:29:45 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openpower-host-ipmi-oem v3 1/7] Support OpenPOWERs OEM
 commands on openbmc
Date: Fri, 16 Oct 2015 15:29:35 -0500
Message-Id: <1445027381-30153-2-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 16 Oct 2015 20:29:48 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 Makefile     | 21 ++++++++++++++
 ipmid-api.h  | 83 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 oemhandler.C | 92 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 oemhandler.h | 32 +++++++++++++++++++++
 4 files changed, 228 insertions(+)
 create mode 100644 Makefile
 create mode 100644 ipmid-api.h
 create mode 100644 oemhandler.C
 create mode 100644 oemhandler.h

diff --git a/Makefile b/Makefile
new file mode 100644
index 0000000..f495d94
--- /dev/null
+++ b/Makefile
@@ -0,0 +1,21 @@
+CXX ?= $(CROSS_COMPILE)g++
+
+LIB_OEM_OBJ = oemhandler.o
+LIB_OEM     = liboemhandler.so
+
+INC_FLAG += -I. -O2 --std=gnu++11
+LIB_FLAG += -rdynamic
+
+
+all: $(LIB_OEM)
+
+%.o: %.C
+	$(CXX) -fpic -c $< $(CXXFLAGS) $(INC_FLAG) $(IPMID_PATH) -o $@
+	
+
+$(LIB_OEM): $(LIB_OEM_OBJ)
+	$(CXX) $^ -shared $(LDFLAGS) $(LIB_FLAG) -o $@
+
+
+clean:
+	rm -f *.o *.so
diff --git a/ipmid-api.h b/ipmid-api.h
new file mode 100644
index 0000000..ef2be38
--- /dev/null
+++ b/ipmid-api.h
@@ -0,0 +1,83 @@
+#ifndef __HOST_IPMID_IPMI_COMMON_H__
+#define __HOST_IPMID_IPMI_COMMON_H__
+#include <stdlib.h>
+
+// length of Completion Code and its ALWAYS _1_
+#define IPMI_CC_LEN 1
+
+// IPMI Net Function number as specified by IPMI V2.0 spec.
+// Example : 
+// NETFUN_APP      =   (0x06 << 2),
+typedef unsigned char   ipmi_netfn_t;
+
+// IPMI Command for a Net Function number as specified by IPMI V2.0 spec.
+typedef unsigned char   ipmi_cmd_t;
+
+// Buffer containing data from sender of netfn and command as part of request
+typedef void*           ipmi_request_t;
+
+// This is the response buffer that the provider of [netfn,cmd] will send back
+// to the caller. Provider will allocate the memory inside the handler and then
+// will do a memcpy to this response buffer and also will set the data size
+// parameter to the size of the buffer.
+// EXAMPLE :
+// unsigned char str[] = {0x00, 0x01, 0xFE, 0xFF, 0x0A, 0x01};
+// *data_len = 6;
+// memcpy(response, &str, *data_len);
+typedef void*           ipmi_response_t;
+
+// This buffer contains any *user specific* data that is of interest only to the
+// plugin. For a ipmi function router, this data is opaque. At the time of
+// registering the plugin handlers, plugin may optionally allocate a memory and
+// fill in whatever needed that will be of help during the actual handling of
+// command. IPMID will just pass the netfn, cmd and also this data to plugins
+// during the command handler invocation.
+typedef void*           ipmi_context_t;
+
+// Length of request / response buffer depending on whether the data is a
+// request or a response from a plugin handler.
+typedef size_t*   ipmi_data_len_t;
+
+// Plugin function return the status code
+typedef unsigned char ipmi_ret_t;
+
+// This is the callback handler that the plugin registers with IPMID. IPMI
+// function router will then make a call to this callback handler with the
+// necessary arguments of netfn, cmd, request, response, size and context.
+typedef ipmi_ret_t (*ipmid_callback_t)(ipmi_netfn_t, ipmi_cmd_t, ipmi_request_t,
+                                       ipmi_response_t, ipmi_data_len_t, ipmi_context_t);
+
+// This is the constructor function that is called into by each plugin handlers.
+// When ipmi sets up the callback handlers, a call is made to this with
+// information of netfn, cmd, callback handler pointer and context data.
+// Making this a extern "C" so that plugin libraries written in C can also use
+// it.
+extern "C" void ipmi_register_callback(ipmi_netfn_t, ipmi_cmd_t, 
+                                       ipmi_context_t, ipmid_callback_t);
+
+// These are the command network functions, the response
+// network functions are the function + 1. So to determine
+// the proper network function which issued the command
+// associated with a response, subtract 1.
+// Note: these are also shifted left to make room for the LUN.
+enum ipmi_net_fns
+{
+    NETFUN_OEM_IBM  =   (0x32 << 2)
+};
+
+// IPMI commands for net functions. Since this is to be used both by the ipmi
+// function router and also the callback handler registration function, its put
+// in this .H file.
+enum ipmi_netfn_wild_card_cmd
+{
+    IPMI_CMD_WILDCARD       = 0xFF,
+};
+
+// Return codes from a IPMI operation as needed by IPMI V2.0 spec.
+enum ipmi_return_codes
+{
+    IPMI_CC_OK = 0x00,
+    IPMI_CC_INVALID = 0xC1
+};
+
+#endif
diff --git a/oemhandler.C b/oemhandler.C
new file mode 100644
index 0000000..c4eae21
--- /dev/null
+++ b/oemhandler.C
@@ -0,0 +1,92 @@
+#include "oemhandler.h"
+#include "ipmid-api.h"
+#include <stdio.h>
+#include <string.h>
+
+void register_netfn_oem_partial_esel() __attribute__((constructor));
+
+
+
+const char *g_esel_path = "/tmp/";
+uint16_t g_record_id = 0x0100;
+
+
+#define LSMSSWAP(x,y) (y<<8|x)
+
+
+///////////////////////////////////////////////////////////////////////////////
+// For the First partial add eSEL the SEL Record ID and offset 
+// value should be 0x0000. The extended data needs to be in 
+// the form of an IPMI SEL Event Record, with Event sensor type 
+// of 0xDF and Event Message format of 0x04. The returned 
+// Record ID should be used for all partial eSEL adds.
+//
+// This function creates a /tmp/esel# file to store the 
+// incoming partial esel.  It is the role of some other
+// function to commit the error log in to long term 
+// storage.  Likely via the ipmi add_sel command.  
+///////////////////////////////////////////////////////////////////////////////
+ipmi_ret_t ipmi_ibm_oem_partial_esel(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
+                              ipmi_request_t request, ipmi_response_t response, 
+                              ipmi_data_len_t data_len, ipmi_context_t context)
+{
+    esel_request_t *reqptr = (esel_request_t*) request;
+    FILE *fp;
+    char string[32];
+    short offset = 0, record=0;
+    unsigned short rlen;
+    ipmi_ret_t rc = IPMI_CC_OK;
+    char iocmd[4];
+
+    strcpy(string, g_esel_path);
+    
+    offset = LSMSSWAP(reqptr->offsetls, reqptr->offsetms);
+
+    sprintf(string, "%s%s%02x%02x", string, "esel", reqptr->selrecordms, reqptr->selrecordls);
+
+
+    // Length is the number of request bytes minus the header itself.
+    // The header contains an extra byte to indicate the start of
+    // the data (so didn't need to worry about word/byte boundaries)
+    // hence the -1...
+    rlen = ((unsigned short)*data_len) - (sizeof(esel_request_t));
+
+
+    printf("IPMI PARTIAL ESEL for %s  Offset = %d Length = %d\n", 
+        string, offset, rlen);
+
+    if (offset == 0) {
+        strcpy(iocmd, "wb");
+    } else {
+        // I was thinking "ab+" but it appears it doesn't
+        // do what fseek asks.  Modify to rb+ and fseek 
+        // works great...
+        strcpy(iocmd, "rb+");
+    }
+
+    if ((fp = fopen(string, iocmd)) != NULL) {
+        fseek(fp, offset, SEEK_SET);
+        fwrite(reqptr+1,rlen,1,fp);
+        fclose(fp);
+
+
+        *data_len = sizeof(g_record_id);
+        memcpy(response, &g_record_id, *data_len);
+
+
+    } else {
+        fprintf(stderr, "Error trying to perform %s for esel%s\n",iocmd, string);
+        ipmi_ret_t rc = IPMI_CC_INVALID;   
+        *data_len     = 0;
+    }
+    
+    return rc;
+}
+
+
+void register_netfn_oem_partial_esel()
+{
+    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_OEM_IBM, IPMI_CMD_PESEL);
+    ipmi_register_callback(NETFUN_OEM_IBM, IPMI_CMD_PESEL, NULL, ipmi_ibm_oem_partial_esel);
+    return;
+}
diff --git a/oemhandler.h b/oemhandler.h
new file mode 100644
index 0000000..c176fd6
--- /dev/null
+++ b/oemhandler.h
@@ -0,0 +1,32 @@
+#ifndef __HOST_IPMI_OPENPOWEROEM_HANDLER_H__
+#define __HOST_IPMI_OPENPOWEROEM_HANDLER_H__
+
+#include <stdint.h>
+#include "ipmid-api.h"
+
+// IPMI commands for net functions.
+enum ipmi_netfn_oem_cmds
+{
+    IPMI_CMD_PESEL = 0xF0,
+};
+
+
+
+ipmi_ret_t ipmi_ibm_oem_partial_esel(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
+                              ipmi_request_t request, ipmi_response_t response, 
+                              ipmi_data_len_t data_len, ipmi_context_t context);
+
+
+struct esel_request_t {
+    uint8_t  residls;
+    uint8_t  residms;
+    uint8_t  selrecordls;
+    uint8_t  selrecordms;
+    uint8_t  offsetls;
+    uint8_t  offsetms;
+    uint8_t  progress;
+}  __attribute__ ((packed)) ;
+
+
+
+#endif
-- 
2.6.0
