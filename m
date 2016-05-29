Return-Path: <clg@kaod.org>
Received: from e06smtp14.uk.ibm.com (e06smtp14.uk.ibm.com [195.75.94.110])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rHt2b69W3zDqP9
 for <openbmc@lists.ozlabs.org>; Mon, 30 May 2016 07:20:39 +1000 (AEST)
Received: from localhost
 by e06smtp14.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <clg@kaod.org>;
 Sun, 29 May 2016 22:20:36 +0100
Received: from d06dlp02.portsmouth.uk.ibm.com (9.149.20.14)
 by e06smtp14.uk.ibm.com (192.168.101.144) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Sun, 29 May 2016 22:20:34 +0100
X-IBM-Helo: d06dlp02.portsmouth.uk.ibm.com
X-IBM-MailFrom: clg@kaod.org
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by d06dlp02.portsmouth.uk.ibm.com (Postfix) with ESMTP id 6E06B2190046
 for <openbmc@lists.ozlabs.org>; Sun, 29 May 2016 22:20:07 +0100 (BST)
Received: from d06av11.portsmouth.uk.ibm.com (d06av11.portsmouth.uk.ibm.com
 [9.149.37.252])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u4TLKXNL9896214
 for <openbmc@lists.ozlabs.org>; Sun, 29 May 2016 21:20:33 GMT
Received: from d06av11.portsmouth.uk.ibm.com (localhost [127.0.0.1])
 by d06av11.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u4TLKXIQ001585
 for <openbmc@lists.ozlabs.org>; Sun, 29 May 2016 15:20:33 -0600
Received: from smtp.lab.toulouse-stg.fr.ibm.com
 (srv01.lab.toulouse-stg.fr.ibm.com [9.101.4.1])
 by d06av11.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u4TLKXF2001582; Sun, 29 May 2016 15:20:33 -0600
Received: from hermes.ibm.com (icon-9-167-232-192.megacenter.de.ibm.com
 [9.167.232.192])
 by smtp.lab.toulouse-stg.fr.ibm.com (Postfix) with ESMTP id 9B946220164;
 Sun, 29 May 2016 23:20:32 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH qemu 08/12] m25p80: add mx25l25635f chip
Date: Sun, 29 May 2016 23:20:01 +0200
Message-Id: <1464556805-4340-9-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1464556805-4340-1-git-send-email-clg@kaod.org>
References: <1464556805-4340-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16052921-0017-0000-0000-000021B4C477
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
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
X-List-Received-Date: Sun, 29 May 2016 21:20:40 -0000

The Macronix chip mx25l25635f used on some OpenPower boxes is very
similar to the mx25l25635e. They share the same JEDEC identifier but
the WRSR instruction requires 2 bytes in the mx25l25635f case.

This patch introduce a new chip to prevent some warnings on guests
identifying JEDEC 0xc22019 as a MX25L25635F chip. OpenBMC is one them.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---

 This is may not be the best way to distinguish these chips. Adding a
 flag in the FlashPartInfo would be better ?

 hw/block/m25p80.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 02f77012c21b..58607786c11c 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -157,6 +157,7 @@ static const FlashPartInfo known_devices[] = {
     { INFO("mx25l12805d", 0xc22018,      0,  64 << 10, 256, 0) },
     { INFO("mx25l12855e", 0xc22618,      0,  64 << 10, 256, 0) },
     { INFO("mx25l25635e", 0xc22019,      0,  64 << 10, 512, 0) },
+    { INFO("mx25l25635f", 0xc22019,      0,  64 << 10, 512, 0) },
     { INFO("mx25l25655e", 0xc22619,      0,  64 << 10, 512, 0) },
 
     /* Micron */
@@ -692,6 +693,9 @@ static void decode_new_cmd(Flash *s, uint32_t value)
             s->pos = 0;
             s->len = 0;
             s->state = STATE_COLLECTING_DATA;
+            if (!strcmp(s->pi->part_name, "mx25l25635f")) {
+                s->needed_bytes = 2;
+            }
         }
         break;
 
-- 
2.1.4
