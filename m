Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46F911A0216
 for <openbmc@lists.ozlabs.org>; Wed, 11 Nov 2015 17:50:26 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447224621130186.8439819072828;
 Tue, 10 Nov 2015 22:50:21 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openpower-host-ipmi-oem] Add rolling record ids for enhanced
 service
Date: Wed, 11 Nov 2015 01:50:19 -0500
Message-Id: <1447224619-20721-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447224619-20721-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1447224619-20721-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 11 Nov 2015 06:50:27 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 oemhandler.C | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/oemhandler.C b/oemhandler.C
index 61afac1..ae3f506 100644
--- a/oemhandler.C
+++ b/oemhandler.C
@@ -46,10 +46,6 @@ ipmi_ret_t ipmi_ibm_oem_partial_esel(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
         snprintf(string, sizeof(string), "%s%s%02x%02x", g_esel_path, "esel", reqptr->selrecordms, reqptr->selrecordls);
     }
 
-    // Length is the number of request bytes minus the header itself.
-    // The header contains an extra byte to indicate the start of
-    // the data (so didn't need to worry about word/byte boundaries)
-    // hence the -1...
     rlen = (*data_len) - (uint8_t) (sizeof(esel_request_t));
 
 
@@ -70,6 +66,14 @@ ipmi_ret_t ipmi_ibm_oem_partial_esel(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
         *data_len     = 0;
     }
 
+    // The first bit prepresents that this is the last partial packet
+    // coming down.  If that is the case advance the record id so we
+    // don't overlap logs.  This allows anyone to establish a log
+    // directory system.
+    if (reqptr->progress & 1 ) {
+        g_record_id++;
+    }
+
     return rc;
 }
 
-- 
2.6.3
