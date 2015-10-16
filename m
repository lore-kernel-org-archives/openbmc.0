Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 6CD621A09E6
 for <openbmc@lists.ozlabs.org>; Sat, 17 Oct 2015 07:29:52 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1445027390116265.3726809190065;
 Fri, 16 Oct 2015 13:29:50 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openpower-host-ipmi-oem v3 4/7] fixed #define issue with byte
 swapping
Date: Fri, 16 Oct 2015 15:29:38 -0500
Message-Id: <1445027381-30153-5-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 16 Oct 2015 20:29:53 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 oemhandler.C | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/oemhandler.C b/oemhandler.C
index fa1b9a2..f05a0f3 100644
--- a/oemhandler.C
+++ b/oemhandler.C
@@ -9,7 +9,10 @@ const char *g_esel_path = "/tmp/";
 uint16_t g_record_id = 0x0100;
 
 
-#define LSMSSWAP(x,y) (y<<8|x)
+#define LSMSSWAP(x,y) ((y)<<8|(x))
+
+const char *fio_wb[] = "wb";
+const char *fio_rb[] = "rb+";
 
 
 ///////////////////////////////////////////////////////////////////////////////
@@ -33,7 +36,6 @@ ipmi_ret_t ipmi_ibm_oem_partial_esel(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     short offset = 0;
     uint8_t rlen;
     ipmi_ret_t rc = IPMI_CC_OK;
-    char iocmd[][4] = { { "wb" },  {"rb+"} };
     char string[64];
     char *pio;
 
@@ -59,9 +61,9 @@ ipmi_ret_t ipmi_ibm_oem_partial_esel(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     // to indicate this is a new record rather then an ofset in
     // my next commit TODO
     if (offset == 0) {
-        pio = iocmd[0];
+        pio = fio_wb;
     } else {
-        pio = iocmd[1];
+        pio = fio_rb;
     }
 
     if ((fp = fopen(string, pio)) != NULL) {
-- 
2.6.0
