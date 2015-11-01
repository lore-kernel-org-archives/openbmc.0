Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 28AFB1A060B
 for <openbmc@lists.ozlabs.org>; Sun,  1 Nov 2015 12:13:30 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446340405115996.2944629149831;
 Sat, 31 Oct 2015 18:13:25 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH ipmi-fru-parser v8 04/11] Format string change in
 sd_bus_message_append.
Date: Sat, 31 Oct 2015 20:13:09 -0500
Message-Id: <1446340396-8562-5-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1446340396-8562-1-git-send-email-patches@stwcx.xyz>
References: <1446340396-8562-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Sun, 01 Nov 2015 01:13:31 -0000

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
