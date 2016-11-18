Return-Path: <clg@kaod.org>
Received: from 4.mo7.mail-out.ovh.net (4.mo7.mail-out.ovh.net [178.32.122.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tL0d95pFszDvvs
 for <openbmc@lists.ozlabs.org>; Sat, 19 Nov 2016 01:25:01 +1100 (AEDT)
Received: from player697.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id ED80A20752
 for <openbmc@lists.ozlabs.org>; Fri, 18 Nov 2016 15:24:57 +0100 (CET)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player697.ha.ovh.net (Postfix) with ESMTPSA id B6F564800A3;
 Fri, 18 Nov 2016 15:24:54 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH qemu 02/38] aspeed: QOMify the CPU object and attach it to the
 SoC
Date: Fri, 18 Nov 2016 15:21:42 +0100
Message-Id: <1479478938-13267-3-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1479478938-13267-1-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 1096907985492806402
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrudekgdeivdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Nov 2016 14:25:02 -0000

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed_soc.c         | 17 ++++++++++++++---
 include/hw/arm/aspeed_soc.h |  2 +-
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index e14f5c217eab..db145e201451 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -87,9 +87,13 @@ static void aspeed_soc_init(Object *obj)
 {
     AspeedSoCState *s = ASPEED_SOC(obj);
     AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
+    char *cpu_typename;
     int i;
 
-    s->cpu = cpu_arm_init(sc->info->cpu_model);
+    cpu_typename = g_strdup_printf("%s-" TYPE_ARM_CPU, sc->info->cpu_model);
+    object_initialize(&s->cpu, sizeof(s->cpu), cpu_typename);
+    object_property_add_child(obj, "cpu", OBJECT(&s->cpu), NULL);
+    g_free(cpu_typename);
 
     object_initialize(&s->vic, sizeof(s->vic), TYPE_ASPEED_VIC);
     object_property_add_child(obj, "vic", OBJECT(&s->vic), NULL);
@@ -146,6 +150,13 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
     memory_region_add_subregion_overlap(get_system_memory(),
                                         ASPEED_SOC_IOMEM_BASE, &s->iomem, -1);
 
+    /* CPU */
+    object_property_set_bool(OBJECT(&s->cpu), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
     /* VIC */
     object_property_set_bool(OBJECT(&s->vic), true, "realized", &err);
     if (err) {
@@ -154,9 +165,9 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
     }
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->vic), 0, ASPEED_SOC_VIC_BASE);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->vic), 0,
-                       qdev_get_gpio_in(DEVICE(s->cpu), ARM_CPU_IRQ));
+                       qdev_get_gpio_in(DEVICE(&s->cpu), ARM_CPU_IRQ));
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->vic), 1,
-                       qdev_get_gpio_in(DEVICE(s->cpu), ARM_CPU_FIQ));
+                       qdev_get_gpio_in(DEVICE(&s->cpu), ARM_CPU_FIQ));
 
     /* Timer */
     object_property_set_bool(OBJECT(&s->timerctrl), true, "realized", &err);
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 5406b498d7ef..6f1b679c97b1 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -27,7 +27,7 @@ typedef struct AspeedSoCState {
     DeviceState parent;
 
     /*< public >*/
-    ARMCPU *cpu;
+    ARMCPU cpu;
     MemoryRegion iomem;
     AspeedVICState vic;
     AspeedTimerCtrlState timerctrl;
-- 
2.7.4
