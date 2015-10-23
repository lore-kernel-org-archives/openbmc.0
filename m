Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender1.zohomail.com [74.201.84.158])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 879641A0225
 for <openbmc@lists.ozlabs.org>; Sat, 24 Oct 2015 09:24:55 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1445639089531310.5090974311272;
 Fri, 23 Oct 2015 15:24:49 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH ipmi-fru-parser v6 4/8] Format string change in
 sd_bus_message_append.
Date: Fri, 23 Oct 2015 17:23:09 -0500
Message-Id: <1445638993-8170-5-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445638993-8170-1-git-send-email-patches@stwcx.xyz>
References: <1445638993-8170-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 23 Oct 2015 22:24:56 -0000

From: Hariharasubramanian R <hramasub@in.ibm.com>

---
 frup.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/frup.c b/frup.c
index 9711645..ab58426 100644
--- a/frup.c
+++ b/frup.c
@@ -803,13 +803,13 @@ parse_fru (const void* msgbuf, sd_bus_message* vpdtbl)
   {
     if (i==OPENBMC_VPD_KEY_CHASSIS_TYPE)
     {
-        sd_bus_message_append (vpdtbl, "sd", vpd_key_names[i], chassis_type);
+        sd_bus_message_append (vpdtbl, "sy", vpd_key_names[i], chassis_type);
         continue;
     }
 
     if (i==OPENBMC_VPD_KEY_BOARD_MFG_DATE)
     {
-        sd_bus_message_append (vpdtbl, "sd", vpd_key_names[i], mfg_date_time);
+        sd_bus_message_append (vpdtbl, "sa{y}", vpd_key_names[i], mfg_date_time);
         continue;
     }
     
-- 
2.6.0
