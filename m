Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id A189D1A03F8
 for <openbmc@lists.ozlabs.org>; Sun,  8 Nov 2015 14:59:23 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1446955156477911.1463904888893;
 Sat, 7 Nov 2015 19:59:16 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH ipmi-fru-parser 11/11] Include sdbus header in frup.c
Date: Sat,  7 Nov 2015 22:59:08 -0500
Message-Id: <1446955148-30303-12-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1446955148-30303-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1446955148-30303-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sun, 08 Nov 2015 03:59:24 -0000

From: Hariharasubramanian R <hramasub@in.ibm.com>

---
 frup.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/frup.c b/frup.c
index 2d8cc3b..96fd2ae 100644
--- a/frup.c
+++ b/frup.c
@@ -44,6 +44,7 @@
 #include <string.h>
 #include <time.h>
 #include <ctype.h>
+#include <systemd/sd-bus.h>
 
 #define uint8_t unsigned char
 #define uint32_t unsigned int
@@ -80,13 +81,6 @@ return -1; \
 #define OPENBMC_VPD_KEY_LEN                            64
 #define OPENBMC_VPD_VAL_LEN                            512
 
-
-extern "C"
-{
-int sd_bus_message_append (void*, const char*, ...);
-typedef struct sd_bus_message sd_bus_message;
-};
-
 struct ipmi_fru_field
 {
   uint8_t type_length_field[IPMI_FRU_AREA_TYPE_LENGTH_FIELD_MAX];
-- 
2.6.3
