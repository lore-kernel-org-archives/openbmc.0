Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id BF2B01A1A2B
 for <openbmc@lists.ozlabs.org>; Sat, 19 Dec 2015 10:40:47 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1450482042933870.8891743938802;
 Fri, 18 Dec 2015 15:40:42 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton 10/15] add new flash ids
Date: Fri, 18 Dec 2015 17:40:30 -0600
Message-Id: <1450482035-4530-11-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1450482035-4530-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1450482035-4530-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 18 Dec 2015 23:40:48 -0000

From: Norman James <njames@us.ibm.com>

---
 objects/pflash/libflash/libflash.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/objects/pflash/libflash/libflash.c b/objects/pflash/libflash/libflash.c
index 1482137..01eee97 100644
--- a/objects/pflash/libflash/libflash.c
+++ b/objects/pflash/libflash/libflash.c
@@ -12,6 +12,12 @@ static const struct flash_info flash_info[] = {
 	{ 0x20ba20, 0x04000000, FL_ERASE_4K  | FL_ERASE_64K | FL_CAN_4B |
                                 FL_ERASE_BULK | FL_MICRON_BUGS,
                                                           "Micron N25Qx512Ax"   },
+	{ 0x20ba19, 0x02000000, FL_ERASE_4K  | FL_ERASE_64K | FL_CAN_4B |
+                                FL_ERASE_BULK | FL_MICRON_BUGS,
+                                                          "Micron N25Q256Ax"    },
+	{ 0x1940ef, 0x02000000, FL_ERASE_4K  | FL_ERASE_64K | FL_CAN_4B |
+                                FL_ERASE_BULK | FL_MICRON_BUGS,
+                                                          "Micron N25Qx256Ax"   },
 	{ 0x55aa55, 0x00100000, FL_ERASE_ALL | FL_CAN_4B, "TEST_FLASH" },
 
 };
-- 
2.6.3
