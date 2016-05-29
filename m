Return-Path: <clg@kaod.org>
Received: from e06smtp12.uk.ibm.com (e06smtp12.uk.ibm.com [195.75.94.108])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rHt2Y4NGyzDqPC
 for <openbmc@lists.ozlabs.org>; Mon, 30 May 2016 07:20:36 +1000 (AEST)
Received: from localhost
 by e06smtp12.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <clg@kaod.org>;
 Sun, 29 May 2016 22:20:33 +0100
Received: from d06dlp03.portsmouth.uk.ibm.com (9.149.20.15)
 by e06smtp12.uk.ibm.com (192.168.101.142) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Sun, 29 May 2016 22:20:32 +0100
X-IBM-Helo: d06dlp03.portsmouth.uk.ibm.com
X-IBM-MailFrom: clg@kaod.org
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by d06dlp03.portsmouth.uk.ibm.com (Postfix) with ESMTP id 8B1C71B08067
 for <openbmc@lists.ozlabs.org>; Sun, 29 May 2016 22:21:33 +0100 (BST)
Received: from d06av01.portsmouth.uk.ibm.com (d06av01.portsmouth.uk.ibm.com
 [9.149.37.212])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u4TLKWiv16384478
 for <openbmc@lists.ozlabs.org>; Sun, 29 May 2016 21:20:32 GMT
Received: from d06av01.portsmouth.uk.ibm.com (localhost [127.0.0.1])
 by d06av01.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u4TLKV2N013522
 for <openbmc@lists.ozlabs.org>; Sun, 29 May 2016 15:20:31 -0600
Received: from smtp.lab.toulouse-stg.fr.ibm.com
 (srv01.lab.toulouse-stg.fr.ibm.com [9.101.4.1])
 by d06av01.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u4TLKVwD013519; Sun, 29 May 2016 15:20:31 -0600
Received: from hermes.ibm.com (icon-9-167-232-192.megacenter.de.ibm.com
 [9.167.232.192])
 by smtp.lab.toulouse-stg.fr.ibm.com (Postfix) with ESMTP id D802922051C;
 Sun, 29 May 2016 23:20:30 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH qemu 05/12] ast2400: handle SPI flash Command mode (read only)
Date: Sun, 29 May 2016 23:19:58 +0200
Message-Id: <1464556805-4340-6-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1464556805-4340-1-git-send-email-clg@kaod.org>
References: <1464556805-4340-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16052921-0009-0000-0000-0000188278F6
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
X-List-Received-Date: Sun, 29 May 2016 21:20:38 -0000
X-List-Received-Date: Sun, 29 May 2016 21:20:38 -0000
X-List-Received-Date: Sun, 29 May 2016 21:20:38 -0000

We can now use directly the m25p80 flash storage to handle memory
accesses when the SPI flash slave is configured in Command mode. Only
read only accesses are handled. Command mode is only required by
U-Boot, Linux does not use it yet.

Handling write accesses would demand more changes to the m25p80 flash
model.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ssi/aspeed_smc.c         | 18 +++++++++++++++---
 include/hw/ssi/aspeed_smc.h |  2 ++
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 4175356141e7..159ab691051d 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -28,6 +28,7 @@
 #include "qemu/log.h"
 #include "include/qemu/error-report.h"
 #include "exec/address-spaces.h"
+#include "hw/block/flash.h"
 
 #include "hw/ssi/aspeed_smc.h"
 
@@ -284,8 +285,9 @@ static uint64_t aspeed_smc_flash_read(void *opaque, hwaddr addr, unsigned size)
             ret = (ret << 8) | ssi_transfer(s->spi, 0x0);
         }
     } else {
-        error_report("%s: flash not in usermode", __func__);
-        ret = -1;
+        for (i = 0; i < size; i++) {
+            ret = (ret << 8) | fl->storage[addr + i];
+        }
     }
 
     return ret;
@@ -330,6 +332,11 @@ static void aspeed_smc_flash_reset(DeviceState *d)
 
 static int aspeed_smc_flash_init(SysBusDevice *sbd)
 {
+    DeviceState *dev = DEVICE(sbd);
+    AspeedSMCFlashState *s = ASPEED_SMC_FLASH(dev);
+
+    s->size = 0;
+    s->storage = NULL;
     return 0;
 }
 
@@ -422,8 +429,13 @@ void aspeed_smc_init_flashes(AspeedSMCState *s, const char *flashtype)
         cs_line = qdev_get_gpio_in_named(fl->flash, SSI_GPIO_CS, 0);
         sysbus_connect_irq(SYS_BUS_DEVICE(s), i + 1, cs_line);
 
+        fl->storage = m25p80_get_storage(DEVICE(fl->flash), &fl->size);
+        if (fl->size > aspeed_segments[s->smc_type][i].size) {
+            fl->size = aspeed_segments[s->smc_type][i].size;
+        }
+
         memory_region_init_io(&fl->mmio, new, &aspeed_smc_flash_ops, fl, name,
-                              aspeed_segments[s->smc_type][i].size);
+                              fl->size);
         sysbus_init_mmio(SYS_BUS_DEVICE(new), &fl->mmio);
 
         sysbus_mmio_map(SYS_BUS_DEVICE(new), 0,
diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index 1625dfb76a63..2615ce9fa8aa 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -38,6 +38,8 @@ typedef struct AspeedSMCFlashState {
 
     MemoryRegion mmio;
     int id;
+    uint32_t size;
+    uint8_t *storage;
     struct AspeedSMCState *controller;
     DeviceState *flash;
 } AspeedSMCFlashState;
-- 
2.1.4
