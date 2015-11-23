Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 1A13B1A000B
 for <openbmc@lists.ozlabs.org>; Tue, 24 Nov 2015 08:40:30 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 14483148260470.7013422879516611;
 Mon, 23 Nov 2015 13:40:26 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v5] fix set sel time
Date: Mon, 23 Nov 2015 16:40:24 -0500
Message-Id: <1448314824-30293-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1448314824-30293-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1448314824-30293-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 23 Nov 2015 21:40:31 -0000

From: Norman James <njames@us.ibm.com>

---
 storagehandler.C | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/storagehandler.C b/storagehandler.C
index 1459f94..8ad9f80 100644
--- a/storagehandler.C
+++ b/storagehandler.C
@@ -2,7 +2,9 @@
 #include <string.h>
 #include <stdint.h>
 #include <time.h>
+#include <sys/time.h>
 #include <arpa/inet.h>
+#include <sys/endian.h>
 
 #include "storagehandler.h"
 #include "storageaddsel.h"
@@ -52,14 +54,25 @@ ipmi_ret_t ipmi_storage_set_sel_time(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
                               ipmi_request_t request, ipmi_response_t response,
                               ipmi_data_len_t data_len, ipmi_context_t context)
 {
-    unsigned int *bufftype = (unsigned int *) request;
+    uint32_t* secs = (uint32_t*)request;
 
     printf("Handling Set-SEL-Time:[0x%X], Cmd:[0x%X]\n",netfn, cmd);
-    printf("Data: 0x%X]\n",*bufftype);
-
-    g_sel_time = *bufftype;
+    printf("Data: 0x%X]\n",*secs);
 
+    struct timeval sel_time;
+    sel_time.tv_sec = letoh32(*secs);
     ipmi_ret_t rc = IPMI_CC_OK;
+    int rct = settimeofday(&sel_time, NULL);
+
+    if(rct == 0)
+    {
+	system("hwclock -w");
+    }
+    else
+    {
+        printf("settimeofday() failed\n");
+        rc = IPMI_CC_UNSPECIFIED_ERROR;
+    }
     *data_len = 0;
     return rc;
 }
-- 
2.6.3
