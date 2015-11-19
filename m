Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 750431A0BED
 for <openbmc@lists.ozlabs.org>; Fri, 20 Nov 2015 10:00:32 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447974028091486.75359332978167;
 Thu, 19 Nov 2015 15:00:28 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid] fix set sel time
Date: Thu, 19 Nov 2015 18:00:26 -0500
Message-Id: <1447974026-2256-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447974026-2256-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1447974026-2256-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 19 Nov 2015 23:00:33 -0000

From: Norman James <njames@us.ibm.com>

---
 storagehandler.C | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/storagehandler.C b/storagehandler.C
index 1459f94..71ed29c 100644
--- a/storagehandler.C
+++ b/storagehandler.C
@@ -2,6 +2,7 @@
 #include <string.h>
 #include <stdint.h>
 #include <time.h>
+#include <sys/time.h>
 #include <arpa/inet.h>
 
 #include "storagehandler.h"
@@ -57,9 +58,20 @@ ipmi_ret_t ipmi_storage_set_sel_time(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     printf("Handling Set-SEL-Time:[0x%X], Cmd:[0x%X]\n",netfn, cmd);
     printf("Data: 0x%X]\n",*bufftype);
 
-    g_sel_time = *bufftype;
-
+    struct timeval sel_time;
+    sel_time.tv_sec = *bufftype;
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
