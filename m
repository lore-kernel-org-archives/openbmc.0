Return-Path: <clg@kaod.org>
Received: from 8.mo7.mail-out.ovh.net (8.mo7.mail-out.ovh.net [46.105.77.114])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tL0mJ6x9bzDvwV
 for <openbmc@lists.ozlabs.org>; Sat, 19 Nov 2016 01:31:12 +1100 (AEDT)
Received: from player697.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id A707F207B4
 for <openbmc@lists.ozlabs.org>; Fri, 18 Nov 2016 15:25:49 +0100 (CET)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player697.ha.ovh.net (Postfix) with ESMTPSA id 77A9E480079;
 Fri, 18 Nov 2016 15:25:46 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH qemu 18/38] aspeed/smc: add a 'sdram_base' property
Date: Fri, 18 Nov 2016 15:21:58 +0100
Message-Id: <1479478938-13267-19-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1479478938-13267-1-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 1111544684853955330
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
X-List-Received-Date: Fri, 18 Nov 2016 14:31:13 -0000

The setting of the DRAM address of the DMA transaction depends on the
DRAM base address of the SoC, so we add a property to give this
information to the model.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed_soc.c         | 7 +++++++
 hw/ssi/aspeed_smc.c         | 1 +
 include/hw/ssi/aspeed_smc.h | 3 +++
 3 files changed, 11 insertions(+)

diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index fcf029f8c1c2..24354f700115 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -276,6 +276,13 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
     }
 
     object_property_set_int(OBJECT(&s->fmc), fmc_num_cs, "num-cs", &err);
+    object_property_set_int(OBJECT(&s->fmc), sc->info->sdram_base, "sdram-base",
+                            &local_err);
+    error_propagate(&err, local_err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
     object_property_set_bool(OBJECT(&s->fmc), true, "realized", &local_err);
     error_propagate(&err, local_err);
     if (err) {
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 8e7e3bd9e335..24c78aa57537 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -819,6 +819,7 @@ static const VMStateDescription vmstate_aspeed_smc = {
 };
 
 static Property aspeed_smc_properties[] = {
+    DEFINE_PROP_UINT64("sdram-base", AspeedSMCState, sdram_base, 0),
     DEFINE_PROP_UINT32("num-cs", AspeedSMCState, num_cs, 1),
     DEFINE_PROP_END_OF_LIST(),
 };
diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index 39ee601940e8..88a904849801 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -96,6 +96,9 @@ typedef struct AspeedSMCState {
     uint8_t r_timings;
     uint8_t conf_enable_w0;
 
+    /* for DMA support */
+    uint64_t sdram_base;
+
     AspeedSMCFlash *flashes;
 } AspeedSMCState;
 
-- 
2.7.4
