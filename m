Return-Path: <clg@kaod.org>
Received: from 1.mo173.mail-out.ovh.net (1.mo173.mail-out.ovh.net
 [178.33.111.180])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rSzwb6QqhzDqZf
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jun 2016 03:17:03 +1000 (AEST)
Received: from player711.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id E536AFF9BEB
 for <openbmc@lists.ozlabs.org>; Mon, 13 Jun 2016 19:16:59 +0200 (CEST)
Received: from hermes.ibm.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player711.ha.ovh.net (Postfix) with ESMTPSA id 9D837380083;
 Mon, 13 Jun 2016 19:16:55 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH qemu v2 02/10] ast2400: add SPI flash slave object
Date: Mon, 13 Jun 2016 19:16:28 +0200
Message-Id: <1465838196-31131-3-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1465838196-31131-1-git-send-email-clg@kaod.org>
References: <1465838196-31131-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 16900602026827483906
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
X-List-Received-Date: Mon, 13 Jun 2016 17:17:04 -0000

Each SPI flash slave can operate in two modes: Command and User. When
in User mode, accesses to the memory segment of the slaves are
translated in SPI transfers. When in Command mode, the HW generates
the SPI commands automatically and the memory segment is accessed as
if doing a MMIO. Other SPI controllers call that mode linear
addressing mode.

This object is a model proposal for a SPI flash module, gathering SPI
slave properties and a MemoryRegion handling the memory accesses.
Only the User mode is supported for now but we are preparing ground
for the Command mode.

The framework below is sufficient to support Linux which only uses
User Mode.

Is that the right approach or should we just use simple structs under
AspeedSMCState and attach the memory region to the Aspeed SMC
controller SysBus object ? Please advise.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ssi/aspeed_smc.c         | 97 +++++++++++++++++++++++++++++++++++++++++++++
 include/hw/ssi/aspeed_smc.h | 16 ++++++++
 2 files changed, 113 insertions(+)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 7937a9030903..000a7b45c7cf 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -112,6 +112,21 @@ static bool aspeed_smc_is_ce_stop_active(AspeedSMCState *s, int cs)
     return s->regs[s->r_ctrl0 + cs] & CTRL_CE_STOP_ACTIVE;
 }
 
+static inline int aspeed_smc_flash_mode(AspeedSMCState *s, int cs)
+{
+    return s->regs[s->r_ctrl0 + cs] & CTRL_CMD_MODE_MASK;
+}
+
+static inline bool aspeed_smc_is_usermode(AspeedSMCState *s, int cs)
+{
+    return (aspeed_smc_flash_mode(s, cs) == CTRL_USERMODE);
+}
+
+static inline bool aspeed_smc_is_writable(AspeedSMCState *s, int cs)
+{
+    return s->regs[s->r_conf] & (1 << (s->conf_enable_w0 + cs));
+}
+
 static void aspeed_smc_update_cs(AspeedSMCState *s)
 {
     int i;
@@ -298,3 +313,85 @@ static void aspeed_smc_register_types(void)
 }
 
 type_init(aspeed_smc_register_types)
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
+        error_report("%s: flash is not writable", __func__);
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
+static const VMStateDescription vmstate_aspeed_smc_flash = {
+    .name = "aspeed.smc_flash",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT8(id, AspeedSMCFlashState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void aspeed_smc_flash_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
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
index 2d3e9f6b46d5..abd0005b01c2 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -27,6 +27,22 @@
 
 #include "hw/ssi/ssi.h"
 
+struct AspeedSMCState;
+
+typedef struct AspeedSMCFlashState {
+    SysBusDevice parent_obj;
+
+    MemoryRegion mmio;
+    uint8_t id;
+    size_t size;
+    struct AspeedSMCState *controller;
+    DeviceState *flash;
+} AspeedSMCFlashState;
+
+#define TYPE_ASPEED_SMC_FLASH "aspeed.smc.flash"
+#define ASPEED_SMC_FLASH(obj) \
+    OBJECT_CHECK(AspeedSMCFlashState, (obj), TYPE_ASPEED_SMC_FLASH)
+
 typedef struct AspeedSMCController {
     const char *name;
     uint8_t r_conf;
-- 
2.1.4
