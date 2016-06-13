Return-Path: <clg@kaod.org>
Received: from 7.mo173.mail-out.ovh.net (7.mo173.mail-out.ovh.net
 [46.105.44.159])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rT03b2xRRzDqc6
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jun 2016 03:23:07 +1000 (AEST)
Received: from player711.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id 0D82CFF9D16
 for <openbmc@lists.ozlabs.org>; Mon, 13 Jun 2016 19:17:13 +0200 (CEST)
Received: from hermes.ibm.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player711.ha.ovh.net (Postfix) with ESMTPSA id B8E6638006E;
 Mon, 13 Jun 2016 19:17:08 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH qemu v2 05/10] m25p80: add a m25p80_create_rom() routine
Date: Mon, 13 Jun 2016 19:16:31 +0200
Message-Id: <1465838196-31131-6-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1465838196-31131-1-git-send-email-clg@kaod.org>
References: <1465838196-31131-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 16904542679080012546
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

Some SPI controllers, such as the Aspeed AST2400, have a mode in which
accesses to the flash content are no different than doing MMIOs. The
controller generates all the necessary commands to load (or store)
data in memory.

To emulate such a behavior, we need to have access to the underlying
storage of the flash object. The purpose of the routine is to create a
SPI flash object with a preinitialized storage which can be used by
the object itself but also by a SPI controller to handled the MMIOs.

This seems sufficient to support read only accesses for the
moment. For writes, we would need to externalize flash_write8()
routine certainly.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/block/m25p80.c        | 24 +++++++++++++++++++++++-
 include/hw/block/flash.h |  3 +++
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 7c25a6de6544..3a500ed03c1b 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -29,6 +29,7 @@
 #include "qemu/bitops.h"
 #include "qemu/log.h"
 #include "qapi/error.h"
+#include "hw/block/flash.h"
 
 #ifndef M25P80_ERR_DEBUG
 #define M25P80_ERR_DEBUG 0
@@ -908,7 +909,10 @@ static void m25p80_realize(DeviceState *dev, Error **errp)
         s->blk = blk_by_legacy_dinfo(dinfo);
         blk_attach_dev_nofail(s->blk, s);
 
-        s->storage = blk_blockalign(s->blk, s->size);
+        /* using an external storage. see m25p80_create_rom() */
+        if (!s->storage) {
+            s->storage = blk_blockalign(s->blk, s->size);
+        }
 
         if (blk_pread(s->blk, 0, s->storage, s->size)) {
             error_setg(errp, "failed to read the initial flash content");
@@ -1005,3 +1009,21 @@ static void m25p80_register_types(void)
 }
 
 type_init(m25p80_register_types)
+
+DeviceState *m25p80_create_rom(SSIBus *bus, const char *type,
+                               MemoryRegion *rom, Error **errp)
+{
+    Error *err = NULL;
+    DeviceState *dev = ssi_create_slave_no_init(bus, type);
+    Flash *s = M25P80(dev);
+
+    s->storage = memory_region_get_ram_ptr(rom);
+
+    object_property_set_bool(OBJECT(dev), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return NULL;
+    }
+
+    return dev;
+}
diff --git a/include/hw/block/flash.h b/include/hw/block/flash.h
index 50ccbbcf1352..ac143846a77e 100644
--- a/include/hw/block/flash.h
+++ b/include/hw/block/flash.h
@@ -61,4 +61,7 @@ uint8_t ecc_digest(ECCState *s, uint8_t sample);
 void ecc_reset(ECCState *s);
 extern VMStateDescription vmstate_ecc_state;
 
+DeviceState *m25p80_create_rom(SSIBus *bus, const char *type,
+                               MemoryRegion *rom, Error **errp);
+
 #endif
-- 
2.1.4
