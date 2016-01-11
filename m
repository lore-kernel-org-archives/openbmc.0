Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id C60B91A0AC3
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2016 03:20:58 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1452529253568761.238271878944;
 Mon, 11 Jan 2016 08:20:53 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton] support for W25Q256BV
Date: Mon, 11 Jan 2016 10:20:51 -0600
Message-Id: <1452529251-12764-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1452529251-12764-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1452529251-12764-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Mon, 11 Jan 2016 16:20:59 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 objects/pflash/libflash/libflash.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/objects/pflash/libflash/libflash.c b/objects/pflash/libflash/libflash.c
index 01eee97..762d9e7 100644
--- a/objects/pflash/libflash/libflash.c
+++ b/objects/pflash/libflash/libflash.c
@@ -9,6 +9,7 @@ static const struct flash_info flash_info[] = {
 	{ 0xc22019, 0x02000000, FL_ERASE_ALL | FL_CAN_4B, "Macronix MXxxL25635F"},
 	{ 0xc2201a, 0x04000000, FL_ERASE_ALL | FL_CAN_4B, "Macronix MXxxL51235F"},
 	{ 0xef4018, 0x01000000, FL_ERASE_ALL,             "Winbond W25Q128BV"   },
+	{ 0xef4019, 0x02000000, FL_ERASE_ALL | FL_CAN_4B | FL_ERASE_64K|FL_ERASE_BULK,    "Winbond W25Q256BV"},
 	{ 0x20ba20, 0x04000000, FL_ERASE_4K  | FL_ERASE_64K | FL_CAN_4B |
                                 FL_ERASE_BULK | FL_MICRON_BUGS,
                                                           "Micron N25Qx512Ax"   },
-- 
2.6.4
