Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r7rQv71MZzDq68
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2016 05:40:22 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1463427616984126.61344952379079;
 Mon, 16 May 2016 12:40:16 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH ipmi-fru-parser v2] Replace uint8_t buffer length variable
 with size_t
Date: Mon, 16 May 2016 14:40:14 -0500
Message-Id: <1463427614-11252-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1463427614-11252-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1463427614-11252-1-git-send-email-openbmc-patches@stwcx.xyz>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 16 May 2016 19:40:24 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

The latest Barreleye vpd contains additional custom fields in one
of the board sections, pushing the size of the buffer over 0x100.

The current variable that stores the buffer size is set to be
size_t, but the function using it crops it to uint8_t  which
doesn't fit the extended size. Changing the function to use size_t.

Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
---
 frup.c | 2 +-
 frup.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/frup.c b/frup.c
index 7bdf35f..49718ba 100644
--- a/frup.c
+++ b/frup.c
@@ -948,7 +948,7 @@ parse_fru (const void* msgbuf, sd_bus_message* vpdtbl)
   return (rv);
 }
 
-int parse_fru_area (const uint8_t area, const void* msgbuf, const uint8_t len, sd_bus_message* vpdtbl)
+int parse_fru_area (const uint8_t area, const void* msgbuf, const size_t len, sd_bus_message* vpdtbl)
 {
   int ret = 0;
   int rv = -1;
diff --git a/frup.h b/frup.h
index 8400951..64a0562 100644
--- a/frup.h
+++ b/frup.h
@@ -10,7 +10,7 @@ extern "C"
 
 /* Parse an IPMI write fru data message into a dictionary containing name value pair of VPD entries.*/
 int parse_fru (const void* msgbuf, sd_bus_message* vpdtbl);
-int parse_fru_area (const uint8_t area, const void* msgbuf, const uint8_t len, sd_bus_message* vpdtbl);
+int parse_fru_area (const uint8_t area, const void* msgbuf, const size_t len, sd_bus_message* vpdtbl);
 
 #ifdef __cplusplus
 }
-- 
2.8.2
