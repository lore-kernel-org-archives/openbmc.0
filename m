Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 2F65A1A0A9A
 for <openbmc@lists.ozlabs.org>; Thu, 22 Oct 2015 13:52:29 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445482346283195.26290530682218;
 Wed, 21 Oct 2015 19:52:26 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openpower-host-ipmi-oem 8/8] Allow ipmi headers from SDK
Date: Wed, 21 Oct 2015 21:52:13 -0500
Message-Id: <1445482333-2053-9-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 22 Oct 2015 02:52:29 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 Makefile     |  2 +-
 ipmid-api.h  | 83 ------------------------------------------------------------
 ipmid.H      | 15 -----------
 oemhandler.C |  6 ++---
 oemhandler.h |  3 ++-
 testit.C     |  2 +-
 6 files changed, 7 insertions(+), 104 deletions(-)
 delete mode 100644 ipmid-api.h
 delete mode 100644 ipmid.H

diff --git a/Makefile b/Makefile
index 2dbcc46..f554aa4 100644
--- a/Makefile
+++ b/Makefile
@@ -7,7 +7,7 @@ LIB_OEM_OBJ = oemhandler.o
 LIB_OEM     = liboemhandler.so
 
 LDFLAGS += -rdynamic -ldl
-CXXFLAGS += -fpic -Wall
+CXXFLAGS += -fPIC -Wall
 
 
 all:  $(TESTER) $(LIB_OEM)
diff --git a/ipmid-api.h b/ipmid-api.h
deleted file mode 100644
index 68090f3..0000000
--- a/ipmid-api.h
+++ /dev/null
@@ -1,83 +0,0 @@
-#ifndef __HOST_IPMID_API_COMMON_H__
-#define __HOST_IPMID_API_COMMON_H__
-#include <stdlib.h>
-
-// length of Completion Code and its ALWAYS _1_
-#define IPMI_CC_LEN 1
-
-// IPMI Net Function number as specified by IPMI V2.0 spec.
-// Example : 
-// NETFUN_APP      =   (0x06 << 2),
-typedef unsigned char   ipmi_netfn_t;
-
-// IPMI Command for a Net Function number as specified by IPMI V2.0 spec.
-typedef unsigned char   ipmi_cmd_t;
-
-// Buffer containing data from sender of netfn and command as part of request
-typedef void*           ipmi_request_t;
-
-// This is the response buffer that the provider of [netfn,cmd] will send back
-// to the caller. Provider will allocate the memory inside the handler and then
-// will do a memcpy to this response buffer and also will set the data size
-// parameter to the size of the buffer.
-// EXAMPLE :
-// unsigned char str[] = {0x00, 0x01, 0xFE, 0xFF, 0x0A, 0x01};
-// *data_len = 6;
-// memcpy(response, &str, *data_len);
-typedef void*           ipmi_response_t;
-
-// This buffer contains any *user specific* data that is of interest only to the
-// plugin. For a ipmi function router, this data is opaque. At the time of
-// registering the plugin handlers, plugin may optionally allocate a memory and
-// fill in whatever needed that will be of help during the actual handling of
-// command. IPMID will just pass the netfn, cmd and also this data to plugins
-// during the command handler invocation.
-typedef void*           ipmi_context_t;
-
-// Length of request / response buffer depending on whether the data is a
-// request or a response from a plugin handler.
-typedef size_t*   ipmi_data_len_t;
-
-// Plugin function return the status code
-typedef unsigned char ipmi_ret_t;
-
-// This is the callback handler that the plugin registers with IPMID. IPMI
-// function router will then make a call to this callback handler with the
-// necessary arguments of netfn, cmd, request, response, size and context.
-typedef ipmi_ret_t (*ipmid_callback_t)(ipmi_netfn_t, ipmi_cmd_t, ipmi_request_t,
-                                       ipmi_response_t, ipmi_data_len_t, ipmi_context_t);
-
-// This is the constructor function that is called into by each plugin handlers.
-// When ipmi sets up the callback handlers, a call is made to this with
-// information of netfn, cmd, callback handler pointer and context data.
-// Making this a extern "C" so that plugin libraries written in C can also use
-// it.
-extern "C" void ipmi_register_callback(ipmi_netfn_t, ipmi_cmd_t, 
-                                       ipmi_context_t, ipmid_callback_t);
-
-// These are the command network functions, the response
-// network functions are the function + 1. So to determine
-// the proper network function which issued the command
-// associated with a response, subtract 1.
-// Note: these are also shifted left to make room for the LUN.
-enum ipmi_net_fns
-{
-    NETFUN_OEM_IBM  =   (0x32 << 2)
-};
-
-// IPMI commands for net functions. Since this is to be used both by the ipmi
-// function router and also the callback handler registration function, its put
-// in this .H file.
-enum ipmi_netfn_wild_card_cmd
-{
-    IPMI_CMD_WILDCARD       = 0xFF,
-};
-
-// Return codes from a IPMI operation as needed by IPMI V2.0 spec.
-enum ipmi_return_codes
-{
-    IPMI_CC_OK = 0x00,
-    IPMI_CC_INVALID = 0xC1
-};
-
-#endif
diff --git a/ipmid.H b/ipmid.H
deleted file mode 100644
index ab8b030..0000000
--- a/ipmid.H
+++ /dev/null
@@ -1,15 +0,0 @@
-#ifndef __HOST_IPMID_IPMI_H__
-#define __HOST_IPMID_IPMI_H__
-#include "ipmid-api.h"
-
-// When the requester sends in a netfn and a command along with data, this
-// function will look for registered handlers that will handle that [netfn,cmd]
-// and will make a call to that plugin implementation and send back the response.
-ipmi_ret_t ipmi_netfn_router(const ipmi_netfn_t, const ipmi_cmd_t, ipmi_request_t,
-                             ipmi_response_t, unsigned int *data_len);
-
-// Plugin libraries need to _end_ with .so
-#define IPMI_PLUGIN_EXTN ".so"
-#define MAX_IPMI_BUFFER 64
-
-#endif
diff --git a/oemhandler.C b/oemhandler.C
index 0cc7099..ffff6c6 100644
--- a/oemhandler.C
+++ b/oemhandler.C
@@ -1,5 +1,5 @@
 #include "oemhandler.h"
-#include "ipmid-api.h"
+#include <host-ipmid/ipmid-api.h>
 #include <stdio.h>
 #include <string.h>
 
@@ -85,7 +85,7 @@ ipmi_ret_t ipmi_ibm_oem_partial_esel(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 
 void register_netfn_oem_partial_esel()
 {
-    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_OEM_IBM, IPMI_CMD_PESEL);
-    ipmi_register_callback(NETFUN_OEM_IBM, IPMI_CMD_PESEL, NULL, ipmi_ibm_oem_partial_esel);
+    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_OEM, IPMI_CMD_PESEL);
+    ipmi_register_callback(NETFUN_OEM, IPMI_CMD_PESEL, NULL, ipmi_ibm_oem_partial_esel);
     return;
 }
diff --git a/oemhandler.h b/oemhandler.h
index c176fd6..59c2a42 100644
--- a/oemhandler.h
+++ b/oemhandler.h
@@ -2,7 +2,8 @@
 #define __HOST_IPMI_OPENPOWEROEM_HANDLER_H__
 
 #include <stdint.h>
-#include "ipmid-api.h"
+#include <host-ipmid/ipmid-api.h>
+
 
 // IPMI commands for net functions.
 enum ipmi_netfn_oem_cmds
diff --git a/testit.C b/testit.C
index 2b0005e..f42d4a8 100644
--- a/testit.C
+++ b/testit.C
@@ -3,7 +3,7 @@
 #include <fstream>
 #include <iostream>
 #include <vector>
-#include "ipmid-api.h"
+#include <host-ipmid/ipmid-api.h>
 #include "oemhandler.h"
 
 using namespace std;
-- 
2.6.0
