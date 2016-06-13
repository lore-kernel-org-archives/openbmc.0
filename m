Return-Path: <clg@kaod.org>
X-Greylist: delayed 351 seconds by postgrey-1.35 at bilbo;
 Tue, 14 Jun 2016 03:23:03 AEST
Received: from 3.mo173.mail-out.ovh.net (3.mo173.mail-out.ovh.net
 [46.105.34.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rT03W2F3MzDqZq
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jun 2016 03:23:03 +1000 (AEST)
Received: from player711.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id ABD48FF9C2B
 for <openbmc@lists.ozlabs.org>; Mon, 13 Jun 2016 19:17:08 +0200 (CEST)
Received: from hermes.ibm.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player711.ha.ovh.net (Postfix) with ESMTPSA id 63B8738006E;
 Mon, 13 Jun 2016 19:17:04 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH qemu v2 04/10] m25p80: provide a realize to support late inits.
Date: Mon, 13 Jun 2016 19:16:30 +0200
Message-Id: <1465838196-31131-5-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1465838196-31131-1-git-send-email-clg@kaod.org>
References: <1465838196-31131-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 16903135304308329218
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

We also need to realize() the SSISlave part of the object. This is why
the previous realize() ops is stored in M25P80Class and called in the
object realize() ops.

This is fully compatible with the existing users of m25p80 and it
provides a way to handle errors on the drive backend.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/block/m25p80.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 4c856f5278c3..7c25a6de6544 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -28,6 +28,7 @@
 #include "hw/ssi/ssi.h"
 #include "qemu/bitops.h"
 #include "qemu/log.h"
+#include "qapi/error.h"
 
 #ifndef M25P80_ERR_DEBUG
 #define M25P80_ERR_DEBUG 0
@@ -339,6 +340,7 @@ typedef struct Flash {
 
 typedef struct M25P80Class {
     SSISlaveClass parent_class;
+    DeviceRealize parent_dc_realize;
     FlashPartInfo *pi;
 } M25P80Class;
 
@@ -880,7 +882,6 @@ static uint32_t m25p80_transfer8(SSISlave *ss, uint32_t tx)
 
 static int m25p80_init(SSISlave *ss)
 {
-    DriveInfo *dinfo;
     Flash *s = M25P80(ss);
     M25P80Class *mc = M25P80_GET_CLASS(s);
 
@@ -888,8 +889,18 @@ static int m25p80_init(SSISlave *ss)
 
     s->size = s->pi->sector_size * s->pi->n_sectors;
     s->dirty_page = -1;
+    return 0;
+}
+
+static void m25p80_realize(DeviceState *dev, Error **errp)
+{
+    Flash *s = M25P80(dev);
+    M25P80Class *mc = M25P80_GET_CLASS(s);
+    DriveInfo *dinfo;
+
+    /* initialize the SSISlave part */
+    mc->parent_dc_realize(dev, errp);
 
-    /* FIXME use a qdev drive property instead of drive_get_next() */
     dinfo = drive_get_next(IF_MTD);
 
     if (dinfo) {
@@ -899,18 +910,15 @@ static int m25p80_init(SSISlave *ss)
 
         s->storage = blk_blockalign(s->blk, s->size);
 
-        /* FIXME: Move to late init */
         if (blk_pread(s->blk, 0, s->storage, s->size)) {
-            fprintf(stderr, "Failed to initialize SPI flash!\n");
-            return 1;
+            error_setg(errp, "failed to read the initial flash content");
+            return;
         }
     } else {
         DB_PRINT_L(0, "No BDRV - binding to RAM\n");
         s->storage = blk_blockalign(NULL, s->size);
         memset(s->storage, 0xFF, s->size);
     }
-
-    return 0;
 }
 
 static void m25p80_reset(DeviceState *d)
@@ -967,6 +975,8 @@ static void m25p80_class_init(ObjectClass *klass, void *data)
     dc->vmsd = &vmstate_m25p80;
     dc->props = m25p80_properties;
     dc->reset = m25p80_reset;
+    mc->parent_dc_realize = dc->realize;
+    dc->realize = m25p80_realize;
     mc->pi = data;
 }
 
-- 
2.1.4
