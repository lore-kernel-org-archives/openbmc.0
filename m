Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id DAABE1A09E7
 for <openbmc@lists.ozlabs.org>; Sat, 17 Oct 2015 07:29:57 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1445027395390750.1322617421805;
 Fri, 16 Oct 2015 13:29:55 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openpower-host-ipmi-oem v3 7/7] Fixed string pointer usage
Date: Fri, 16 Oct 2015 15:29:41 -0500
Message-Id: <1445027381-30153-8-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 16 Oct 2015 20:29:58 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 oemhandler.C | 7 ++-----
 testit.C     | 8 +++-----
 2 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/oemhandler.C b/oemhandler.C
index 427831c..0cc7099 100644
--- a/oemhandler.C
+++ b/oemhandler.C
@@ -11,9 +11,6 @@ uint16_t g_record_id = 0x0100;
 
 #define LSMSSWAP(x,y) ((y)<<8|(x))
 
-const char *fio_wb = "wb";
-const char *fio_rb = "rb+";
-
 
 ///////////////////////////////////////////////////////////////////////////////
 // For the First partial add eSEL the SEL Record ID and offset 
@@ -61,9 +58,9 @@ ipmi_ret_t ipmi_ibm_oem_partial_esel(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     // to indicate this is a new record rather then an ofset in
     // my next commit TODO
     if (offset == 0) {
-        pio = fio_wb;
+        pio = "wb";
     } else {
-        pio = fio_rb;
+        pio = "rb+";
     }
 
     if ((fp = fopen(string, pio)) != NULL) {
diff --git a/testit.C b/testit.C
index 25e069c..2b0005e 100644
--- a/testit.C
+++ b/testit.C
@@ -1,12 +1,10 @@
-#include <iostream>
 #include <cstdlib>
-#include "ipmid-api.h"
-#include "oemhandler.h"
 #include <cstring>
-
-#include <iostream>
 #include <fstream>
+#include <iostream>
 #include <vector>
+#include "ipmid-api.h"
+#include "oemhandler.h"
 
 using namespace std;
 
-- 
2.6.0
