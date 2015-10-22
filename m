Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id D16BA1A0965
 for <openbmc@lists.ozlabs.org>; Fri, 23 Oct 2015 08:30:57 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1445549455078291.808459285618;
 Thu, 22 Oct 2015 14:30:55 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH ipmi-fru-parser v5 4/7] Format string change in
 sd_bus_message_append.
Date: Thu, 22 Oct 2015 16:30:44 -0500
Message-Id: <1445549447-2577-5-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445549447-2577-1-git-send-email-patches@stwcx.xyz>
References: <1445549447-2577-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 22 Oct 2015 21:30:58 -0000

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
