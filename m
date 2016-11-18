Return-Path: <clg@kaod.org>
Received: from 15.mo7.mail-out.ovh.net (15.mo7.mail-out.ovh.net [87.98.180.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tL0mC3ly6zDw0c
 for <openbmc@lists.ozlabs.org>; Sat, 19 Nov 2016 01:31:07 +1100 (AEDT)
Received: from player697.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id 0950920796
 for <openbmc@lists.ozlabs.org>; Fri, 18 Nov 2016 15:25:27 +0100 (CET)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player697.ha.ovh.net (Postfix) with ESMTPSA id C9C8C4800A1;
 Fri, 18 Nov 2016 15:25:23 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH qemu 11/38] aspeed/smc: get the number of flash modules from
 hw strapping
Date: Fri, 18 Nov 2016 15:21:51 +0100
Message-Id: <1479478938-13267-12-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1479478938-13267-1-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 1105070762497706754
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
X-List-Received-Date: Fri, 18 Nov 2016 14:31:07 -0000

If the second watchdog is activated, a second flash module is
available. It should be of the same model.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed_soc.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 503efe0f5f77..fcf029f8c1c2 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -170,12 +170,30 @@ static void aspeed_soc_init(Object *obj)
                               "ram-size", &error_abort);
 }
 
+static int aspeed_fmc_get_cs(AspeedSoCState *s, Error **errp)
+{
+    Error *err = NULL;
+    uint32_t hw_strap1;
+
+    hw_strap1 = object_property_get_int(OBJECT(&s->scu), "hw-strap1", errp);
+    if (err) {
+        error_propagate(errp, err);
+        return -1;
+    }
+
+    /*
+     * If the second watchdog is activated, then we have two chips.
+     */
+    return hw_strap1 & SCU_HW_STRAP_2ND_BOOT_WDT ? 2 : 1;
+}
+
 static void aspeed_soc_realize(DeviceState *dev, Error **errp)
 {
     int i;
     AspeedSoCState *s = ASPEED_SOC(dev);
     AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
     Error *err = NULL, *local_err = NULL;
+    int fmc_num_cs;
 
     /* IO space */
     memory_region_init_io(&s->iomem, NULL, &aspeed_soc_io_ops, NULL,
@@ -251,7 +269,13 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
                        qdev_get_gpio_in(DEVICE(&s->vic), 12));
 
     /* FMC */
-    object_property_set_int(OBJECT(&s->fmc), 1, "num-cs", &err);
+    fmc_num_cs = aspeed_fmc_get_cs(s, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    object_property_set_int(OBJECT(&s->fmc), fmc_num_cs, "num-cs", &err);
     object_property_set_bool(OBJECT(&s->fmc), true, "realized", &local_err);
     error_propagate(&err, local_err);
     if (err) {
-- 
2.7.4
