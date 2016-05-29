Return-Path: <clg@kaod.org>
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rHt2Y705DzDqPS
 for <openbmc@lists.ozlabs.org>; Mon, 30 May 2016 07:20:37 +1000 (AEST)
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <clg@kaod.org>;
 Sun, 29 May 2016 22:20:34 +0100
Received: from d06dlp02.portsmouth.uk.ibm.com (9.149.20.14)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Sun, 29 May 2016 22:20:32 +0100
X-IBM-Helo: d06dlp02.portsmouth.uk.ibm.com
X-IBM-MailFrom: clg@kaod.org
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by d06dlp02.portsmouth.uk.ibm.com (Postfix) with ESMTP id 58178219004D
 for <openbmc@lists.ozlabs.org>; Sun, 29 May 2016 22:20:05 +0100 (BST)
Received: from d06av06.portsmouth.uk.ibm.com (d06av06.portsmouth.uk.ibm.com
 [9.149.37.217])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u4TLKVwu63897674
 for <openbmc@lists.ozlabs.org>; Sun, 29 May 2016 21:20:31 GMT
Received: from d06av06.portsmouth.uk.ibm.com (localhost [127.0.0.1])
 by d06av06.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u4TLKVWE029076
 for <openbmc@lists.ozlabs.org>; Sun, 29 May 2016 17:20:31 -0400
Received: from smtp.lab.toulouse-stg.fr.ibm.com
 (srv01.lab.toulouse-stg.fr.ibm.com [9.101.4.1])
 by d06av06.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u4TLKUFm029070; Sun, 29 May 2016 17:20:30 -0400
Received: from hermes.ibm.com (icon-9-167-232-192.megacenter.de.ibm.com
 [9.167.232.192])
 by smtp.lab.toulouse-stg.fr.ibm.com (Postfix) with ESMTP id 4C373220164;
 Sun, 29 May 2016 23:20:30 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH qemu 04/12] m25p80: add a get storage routine
Date: Sun, 29 May 2016 23:19:57 +0200
Message-Id: <1464556805-4340-5-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1464556805-4340-1-git-send-email-clg@kaod.org>
References: <1464556805-4340-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16052921-0021-0000-0000-00001C20FF8A
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

Some SPI controllers, the Aspeed AST2400 for instance, have a mode in
which accessing the flash content is no different than doing an
MMIO. The controller generates all the necessary commands to load (or
store) data in memory.

To emulate such a behavior, we need to map the underlying storage of
the m25p80 flash model to a memory region. This is what this patch
proposes by adding a m25p80_get_storage() routine which can later be
used to handle IOs in a memory region.

It is sufficient to support read only accesses. Handling write
accesses would demand more changes to the m25p80 flash model.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/block/m25p80.c        | 9 +++++++++
 include/hw/block/flash.h | 2 ++
 2 files changed, 11 insertions(+)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 906b71257ecf..c4aee22eae88 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -27,6 +27,7 @@
 #include "sysemu/blockdev.h"
 #include "hw/ssi/ssi.h"
 #include "qemu/bitops.h"
+#include "hw/block/flash.h"
 
 #ifndef M25P80_ERR_DEBUG
 #define M25P80_ERR_DEBUG 0
@@ -1003,3 +1004,11 @@ static void m25p80_register_types(void)
 }
 
 type_init(m25p80_register_types)
+
+uint8_t *m25p80_get_storage(DeviceState *dev, uint32_t *size)
+{
+    Flash *s = M25P80(dev);
+
+    *size = s->size;
+    return s->storage;
+}
diff --git a/include/hw/block/flash.h b/include/hw/block/flash.h
index 50ccbbcf1352..845c4c9ac28f 100644
--- a/include/hw/block/flash.h
+++ b/include/hw/block/flash.h
@@ -61,4 +61,6 @@ uint8_t ecc_digest(ECCState *s, uint8_t sample);
 void ecc_reset(ECCState *s);
 extern VMStateDescription vmstate_ecc_state;
 
+extern uint8_t *m25p80_get_storage(DeviceState *dev, uint32_t *size);
+
 #endif
-- 
2.1.4
