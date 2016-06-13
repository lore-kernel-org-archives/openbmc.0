Return-Path: <clg@kaod.org>
Received: from 3.mo173.mail-out.ovh.net (3.mo173.mail-out.ovh.net
 [46.105.34.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rT03b5TBFzDqcF
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jun 2016 03:23:07 +1000 (AEST)
Received: from player711.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id F38ECFF9E26
 for <openbmc@lists.ozlabs.org>; Mon, 13 Jun 2016 19:17:25 +0200 (CEST)
Received: from hermes.ibm.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player711.ha.ovh.net (Postfix) with ESMTPSA id B790C38006E;
 Mon, 13 Jun 2016 19:17:21 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH qemu v2 08/10] m25p80: add RDCR instruction for Macronix chip
Date: Mon, 13 Jun 2016 19:16:34 +0200
Message-Id: <1465838196-31131-9-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1465838196-31131-1-git-send-email-clg@kaod.org>
References: <1465838196-31131-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 16907920380262910722
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeekledrkedugddutdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Mon, 13 Jun 2016 17:23:08 -0000

Some Macronix chips, such as the MX25L25635F used on OpenPower boxes,
have a Read Configuration Register (RDCR) instruction.

Add this new instruction to the m25p80 object and expose the 4BYTE
mode.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/block/m25p80.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 3a500ed03c1b..74989ad93612 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -254,6 +254,7 @@ typedef enum {
     WRDI = 0x4,
     RDSR = 0x5,
     WREN = 0x6,
+    RDCR = 0x15,
     JEDEC_READ = 0x9f,
     BULK_ERASE = 0xc7,
     READ_FSR = 0x70,
@@ -703,6 +704,13 @@ static void decode_new_cmd(Flash *s, uint32_t value)
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
