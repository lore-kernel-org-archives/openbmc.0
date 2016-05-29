Return-Path: <clg@kaod.org>
Received: from e06smtp14.uk.ibm.com (e06smtp14.uk.ibm.com [195.75.94.110])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rHt2Z6BJ5zDqPC
 for <openbmc@lists.ozlabs.org>; Mon, 30 May 2016 07:20:38 +1000 (AEST)
Received: from localhost
 by e06smtp14.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <clg@kaod.org>;
 Sun, 29 May 2016 22:20:35 +0100
Received: from d06dlp02.portsmouth.uk.ibm.com (9.149.20.14)
 by e06smtp14.uk.ibm.com (192.168.101.144) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Sun, 29 May 2016 22:20:33 +0100
X-IBM-Helo: d06dlp02.portsmouth.uk.ibm.com
X-IBM-MailFrom: clg@kaod.org
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by d06dlp02.portsmouth.uk.ibm.com (Postfix) with ESMTP id BFEF4219004D
 for <openbmc@lists.ozlabs.org>; Sun, 29 May 2016 22:20:06 +0100 (BST)
Received: from d06av05.portsmouth.uk.ibm.com (d06av05.portsmouth.uk.ibm.com
 [9.149.37.229])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u4TLKX2f9896298
 for <openbmc@lists.ozlabs.org>; Sun, 29 May 2016 21:20:33 GMT
Received: from d06av05.portsmouth.uk.ibm.com (localhost [127.0.0.1])
 by d06av05.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u4TLKWGb009322
 for <openbmc@lists.ozlabs.org>; Sun, 29 May 2016 15:20:33 -0600
Received: from smtp.lab.toulouse-stg.fr.ibm.com
 (srv01.lab.toulouse-stg.fr.ibm.com [9.101.4.1])
 by d06av05.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u4TLKWCi009319; Sun, 29 May 2016 15:20:32 -0600
Received: from hermes.ibm.com (icon-9-167-232-192.megacenter.de.ibm.com
 [9.167.232.192])
 by smtp.lab.toulouse-stg.fr.ibm.com (Postfix) with ESMTP id 184B522051C;
 Sun, 29 May 2016 23:20:32 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH qemu 07/12] m25p80: add RDCR instruction for Macronix chip
Date: Sun, 29 May 2016 23:20:00 +0200
Message-Id: <1464556805-4340-8-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1464556805-4340-1-git-send-email-clg@kaod.org>
References: <1464556805-4340-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16052921-0017-0000-0000-000021B4C476
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
X-List-Received-Date: Sun, 29 May 2016 21:20:39 -0000

Some Macronix chips, such as the MX25L25635F (0xc22019) used on
OpenPower boxes, have a Read Configuration Register (RDCR)
instruction. This patch adds this new command to the m25p80 object and
exposes the 4BYTE mode.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/block/m25p80.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index c4aee22eae88..02f77012c21b 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -252,6 +252,7 @@ typedef enum {
     WRDI = 0x4,
     RDSR = 0x5,
     WREN = 0x6,
+    RDCR = 0x15,
     JEDEC_READ = 0x9f,
     BULK_ERASE = 0xc7,
     READ_FSR = 0x70,
@@ -708,6 +709,13 @@ static void decode_new_cmd(Flash *s, uint32_t value)
         s->state = STATE_READING_DATA;
         break;
 
+    case RDCR:
+        s->data[0] = (!!s->four_bytes_address_mode) << 5;
+        s->pos = 0;
+        s->len = 1;
+        s->state = STATE_READING_DATA;
+        break;
+
     case READ_FSR:
         s->data[0] = FSR_FLASH_READY;
         if (s->four_bytes_address_mode) {
-- 
2.1.4
