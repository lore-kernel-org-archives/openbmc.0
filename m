Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id E37CB1A09AE
 for <openbmc@lists.ozlabs.org>; Thu, 22 Oct 2015 13:52:23 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445482342039642.3953939530145;
 Wed, 21 Oct 2015 19:52:22 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openpower-host-ipmi-oem 5/8] fix build break with array of
 pointers
Date: Wed, 21 Oct 2015 21:52:10 -0500
Message-Id: <1445482333-2053-6-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 22 Oct 2015 02:52:24 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 oemhandler.C | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/oemhandler.C b/oemhandler.C
index f05a0f3..427831c 100644
--- a/oemhandler.C
+++ b/oemhandler.C
@@ -11,8 +11,8 @@ uint16_t g_record_id = 0x0100;
 
 #define LSMSSWAP(x,y) ((y)<<8|(x))
 
-const char *fio_wb[] = "wb";
-const char *fio_rb[] = "rb+";
+const char *fio_wb = "wb";
+const char *fio_rb = "rb+";
 
 
 ///////////////////////////////////////////////////////////////////////////////
@@ -37,7 +37,7 @@ ipmi_ret_t ipmi_ibm_oem_partial_esel(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     uint8_t rlen;
     ipmi_ret_t rc = IPMI_CC_OK;
     char string[64];
-    char *pio;
+    const char *pio;
 
     
     offset = LSMSSWAP(reqptr->offsetls, reqptr->offsetms);
-- 
2.6.0
