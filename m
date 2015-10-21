Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43F2C1A03CA
 for <openbmc@lists.ozlabs.org>; Wed, 21 Oct 2015 14:23:39 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445397815685753.5731680161485;
 Tue, 20 Oct 2015 20:23:35 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid 3/4] Add get sel time cmd
Date: Tue, 20 Oct 2015 22:23:28 -0500
Message-Id: <1445397809-31483-4-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445397809-31483-1-git-send-email-patches@stwcx.xyz>
References: <1445397809-31483-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 21 Oct 2015 03:23:39 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

---
 storagehandler.C | 2 +-
 storagehandler.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/storagehandler.C b/storagehandler.C
index 276dd70..d26fa56 100644
--- a/storagehandler.C
+++ b/storagehandler.C
@@ -34,7 +34,7 @@ ipmi_ret_t ipmi_storage_get_sel_time(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 
     printf("IPMI Handling GET-SEL-TIME\n");
 
-    // From the IPMI Spec 2.0, response should be a 32-bit value
+    // IPMI Spec 2.0: response should be a 32-bit value
     *data_len = sizeof(uint32_t);
 
     // Pack the actual response
diff --git a/storagehandler.h b/storagehandler.h
index 1b7f552..453b8a6 100644
--- a/storagehandler.h
+++ b/storagehandler.h
@@ -1,7 +1,7 @@
 #ifndef __HOST_IPMI_STORAGE_HANDLER_H__
 #define __HOST_IPMI_STORAGE_HANDLER_H__
 
-// IPMI commands for Storage net functions.
+// IPMI commands for Storage net functions
 enum ipmi_netfn_storage_cmds
 {
     // Get capability bits
-- 
2.6.0
