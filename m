Return-Path: <clg@kaod.org>
X-Greylist: delayed 363 seconds by postgrey-1.35 at bilbo;
 Tue, 14 Jun 2016 03:23:03 AEST
Received: from 8.mo173.mail-out.ovh.net (8.mo173.mail-out.ovh.net
 [46.105.46.122])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rT03W0SSFzDqZn
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jun 2016 03:23:02 +1000 (AEST)
Received: from player711.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id 46F91FF9DF1
 for <openbmc@lists.ozlabs.org>; Mon, 13 Jun 2016 19:17:30 +0200 (CEST)
Received: from hermes.ibm.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player711.ha.ovh.net (Postfix) with ESMTPSA id 0B2A1380083;
 Mon, 13 Jun 2016 19:17:26 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH qemu v2 09/10] m25p80: add mx25l25635f chip
Date: Mon, 13 Jun 2016 19:16:35 +0200
Message-Id: <1465838196-31131-10-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1465838196-31131-1-git-send-email-clg@kaod.org>
References: <1465838196-31131-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 16909327753373125378
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
X-List-Received-Date: Mon, 13 Jun 2016 17:23:03 -0000

The Macronix chip mx25l25635f used on some OpenPower boxes is very
similar to the mx25l25635e. They share the same JEDEC identifier but
the WRSR instruction requires 2 bytes in the mx25l25635f case.

To prevent some warnings on guests, let's introduce a new chip
identifying JEDEC 0xc22019 as a MX25L25635F chip.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/block/m25p80.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 74989ad93612..924b25e84e95 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -159,6 +159,7 @@ static const FlashPartInfo known_devices[] = {
     { INFO("mx25l12805d", 0xc22018,      0,  64 << 10, 256, 0) },
     { INFO("mx25l12855e", 0xc22618,      0,  64 << 10, 256, 0) },
     { INFO("mx25l25635e", 0xc22019,      0,  64 << 10, 512, 0) },
+    { INFO("mx25l25635f", 0xc22019,      0,  64 << 10, 512, 0) },
     { INFO("mx25l25655e", 0xc22619,      0,  64 << 10, 512, 0) },
 
     /* Micron */
@@ -687,6 +688,9 @@ static void decode_new_cmd(Flash *s, uint32_t value)
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
