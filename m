Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r5MyD6pdTzDqGl
 for <openbmc@lists.ozlabs.org>; Fri, 13 May 2016 05:10:28 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1463080222581718.2739570357527;
 Thu, 12 May 2016 12:10:22 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH ipmi-fru-parser] Increase size of buffer length variable
Date: Thu, 12 May 2016 14:10:19 -0500
Message-Id: <1463080219-26647-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1463080219-26647-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1463080219-26647-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 12 May 2016 19:10:31 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

The latest Barreleye vpd contains additional custom fields in one
of the board sections, pushing the size of the buffer over 0x100.

The current variable that stores the buffer size is set to be
uint8_t which doesn't fit the extended size. Changing it to uint32_t.

Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
---
 fru-area.H | 4 ++--
 frup.c     | 2 +-
 frup.h     | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/fru-area.H b/fru-area.H
index 82206bb..058e438 100644
--- a/fru-area.H
+++ b/fru-area.H
@@ -26,7 +26,7 @@ class ipmi_fru
         std::string iv_name;
 
         // Length of a specific fru area.
-        size_t  iv_len;
+        uint32_t  iv_len;
 
         // Special bit for BMC readable eeprom only.
         bool iv_bmc_fru;
@@ -94,7 +94,7 @@ class ipmi_fru
         }
 
         // Returns the length.
-        size_t get_len() const
+        uint32_t get_len() const
         {
             return iv_len;
         }
diff --git a/frup.c b/frup.c
index 7bdf35f..4df7266 100644
--- a/frup.c
+++ b/frup.c
@@ -948,7 +948,7 @@ parse_fru (const void* msgbuf, sd_bus_message* vpdtbl)
   return (rv);
 }
 
-int parse_fru_area (const uint8_t area, const void* msgbuf, const uint8_t len, sd_bus_message* vpdtbl)
+int parse_fru_area (const uint8_t area, const void* msgbuf, const uint32_t len, sd_bus_message* vpdtbl)
 {
   int ret = 0;
   int rv = -1;
diff --git a/frup.h b/frup.h
index 8400951..094d223 100644
--- a/frup.h
+++ b/frup.h
@@ -10,7 +10,7 @@ extern "C"
 
 /* Parse an IPMI write fru data message into a dictionary containing name value pair of VPD entries.*/
 int parse_fru (const void* msgbuf, sd_bus_message* vpdtbl);
-int parse_fru_area (const uint8_t area, const void* msgbuf, const uint8_t len, sd_bus_message* vpdtbl);
+int parse_fru_area (const uint8_t area, const void* msgbuf, const uint32_t len, sd_bus_message* vpdtbl);
 
 #ifdef __cplusplus
 }
-- 
2.8.1
