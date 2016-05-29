Return-Path: <clg@kaod.org>
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rHt2Y4Qy9zDqPF
 for <openbmc@lists.ozlabs.org>; Mon, 30 May 2016 07:20:36 +1000 (AEST)
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <clg@kaod.org>;
 Sun, 29 May 2016 22:20:32 +0100
Received: from d06dlp01.portsmouth.uk.ibm.com (9.149.20.13)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Sun, 29 May 2016 22:20:30 +0100
X-IBM-Helo: d06dlp01.portsmouth.uk.ibm.com
X-IBM-MailFrom: clg@kaod.org
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by d06dlp01.portsmouth.uk.ibm.com (Postfix) with ESMTP id 30AB817D805D
 for <openbmc@lists.ozlabs.org>; Sun, 29 May 2016 22:21:36 +0100 (BST)
Received: from d06av10.portsmouth.uk.ibm.com (d06av10.portsmouth.uk.ibm.com
 [9.149.37.251])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u4TLKUwN8323416
 for <openbmc@lists.ozlabs.org>; Sun, 29 May 2016 21:20:30 GMT
Received: from d06av10.portsmouth.uk.ibm.com (localhost [127.0.0.1])
 by d06av10.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u4TKKWVi018637
 for <openbmc@lists.ozlabs.org>; Sun, 29 May 2016 14:20:32 -0600
Received: from smtp.lab.toulouse-stg.fr.ibm.com
 (srv01.lab.toulouse-stg.fr.ibm.com [9.101.4.1])
 by d06av10.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u4TKKWth018631; Sun, 29 May 2016 14:20:32 -0600
Received: from hermes.ibm.com (icon-9-167-232-192.megacenter.de.ibm.com
 [9.167.232.192])
 by smtp.lab.toulouse-stg.fr.ibm.com (Postfix) with ESMTP id 16AAA220164;
 Sun, 29 May 2016 23:20:29 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH qemu 02/12] ast2400: add SPI flash slave object
Date: Sun, 29 May 2016 23:19:55 +0200
Message-Id: <1464556805-4340-3-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1464556805-4340-1-git-send-email-clg@kaod.org>
References: <1464556805-4340-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16052921-0021-0000-0000-00001C20FF89
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

Each SPI flash slave can operate in two modes: Command and User. When
in User mode, accesses to the memory segment of the slaves are
translated in SPI transfers. When in Command mode, the HW generates
the SPI commands automatically and the memory segment is accessed as
if doing a MMIO. Other SPI controllers call that mode linear
addressing mode.

The patch below provides an initial model for a SPI flash module,
gathering SPI slave properties and a MemoryRegion to handle the memory
accesses. Only the User mode is supported for now but the patch
prepares ground for the Command mode.

Using a sysbus object for this abstraction might be a bit complex for
the need. We could probably survive with a simple struct under
AspeedSMCState or we could extend the m25p80 object providing a model
for the SPI flash modules. To be discussed.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ssi/aspeed_smc.c         | 110 ++++++++++++++++++++++++++++++++++++++++++++
 include/hw/ssi/aspeed_smc.h |  15 ++++++
 2 files changed, 125 insertions(+)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 780fcbbc9e55..43743628ba0c 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -258,3 +258,113 @@ static void aspeed_smc_register_types(void)
 }
 
 type_init(aspeed_smc_register_types)
+
+static inline bool aspeed_smc_is_usermode(AspeedSMCState *s, int cs)
+{
+    return (((s->regs[s->r_ctrl0 + cs] & CTRL_USERMODE) == CTRL_USERMODE) &&
+            !aspeed_smc_is_ce_stop_active(s, cs));
+}
+
+static inline bool aspeed_smc_is_writable(AspeedSMCState *s, int cs)
+{
+    return s->regs[s->r_conf] & (1 << (s->conf_enable_w0 + cs));
+}
+
+static uint64_t aspeed_smc_flash_read(void *opaque, hwaddr addr, unsigned size)
+{
+    AspeedSMCFlashState *fl = ASPEED_SMC_FLASH(opaque);
+    AspeedSMCState *s = fl->controller;
+    uint64_t ret = 0;
+    int i;
+
+    if (aspeed_smc_is_usermode(s, fl->id)) {
+        for (i = 0; i < size; i++) {
+            ret = (ret << 8) | ssi_transfer(s->spi, 0x0);
+        }
+    } else {
+        error_report("%s: flash not in usermode", __func__);
+        ret = -1;
+    }
+
+    return ret;
+}
+
+static void aspeed_smc_flash_write(void *opaque, hwaddr addr, uint64_t data,
+                           unsigned size)
+{
+    AspeedSMCFlashState *fl = ASPEED_SMC_FLASH(opaque);
+    AspeedSMCState *s = fl->controller;
+    int i;
+
+    if (!aspeed_smc_is_writable(s, fl->id)) {
+        error_report("%s: flash not in writable", __func__);
+        return;
+    }
+
+    if (!aspeed_smc_is_usermode(s, fl->id)) {
+        error_report("%s: flash not in usermode", __func__);
+        return;
+    }
+
+    for (i = 0; i < size; i++) {
+        ssi_transfer(s->spi, (data >> 8 * (size - 1 - i)) & 0xff);
+    }
+}
+
+static const MemoryRegionOps aspeed_smc_flash_ops = {
+    .read = aspeed_smc_flash_read,
+    .write = aspeed_smc_flash_write,
+    .endianness = DEVICE_BIG_ENDIAN,
+    .valid = {
+        .min_access_size = 1,
+        .max_access_size = 4,
+    },
+};
+
+static void aspeed_smc_flash_reset(DeviceState *d)
+{
+    ;
+}
+
+static int aspeed_smc_flash_init(SysBusDevice *sbd)
+{
+    return 0;
+}
+
+static const VMStateDescription vmstate_aspeed_smc_flash = {
+    .name = "aspeed.smc_flash",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static Property aspeed_smc_flash_properties[] = {
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void aspeed_smc_flash_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
+
+    k->init = aspeed_smc_flash_init;
+    dc->reset = aspeed_smc_flash_reset;
+    dc->props = aspeed_smc_flash_properties;
+    dc->vmsd = &vmstate_aspeed_smc_flash;
+}
+
+static const TypeInfo aspeed_smc_flash_info = {
+    .name           = TYPE_ASPEED_SMC_FLASH,
+    .parent         = TYPE_SYS_BUS_DEVICE,
+    .instance_size  = sizeof(AspeedSMCState),
+    .class_init     = aspeed_smc_flash_class_init,
+};
+
+static void aspeed_smc_flash_register_types(void)
+{
+    type_register_static(&aspeed_smc_flash_info);
+}
+
+type_init(aspeed_smc_flash_register_types)
diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index 9b95fcee5da7..6cea1313eabd 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -27,6 +27,21 @@
 
 #include "hw/ssi/ssi.h"
 
+#define TYPE_ASPEED_SMC_FLASH "aspeed.smc_flash"
+#define ASPEED_SMC_FLASH(obj) \
+    OBJECT_CHECK(AspeedSMCFlashState, (obj), TYPE_ASPEED_SMC_FLASH)
+
+struct AspeedSMCState;
+
+typedef struct AspeedSMCFlashState {
+    SysBusDevice parent_obj;
+
+    MemoryRegion mmio;
+    int id;
+    struct AspeedSMCState *controller;
+    DeviceState *flash;
+} AspeedSMCFlashState;
+
 enum AspeedSMCType {
     AspeedSMCLegacy,
     AspeedSMCFMC,
-- 
2.1.4
