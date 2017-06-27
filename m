Return-Path: <joel.stan@gmail.com>
Received: from mail-pf0-x244.google.com (mail-pf0-x244.google.com
 [IPv6:2607:f8b0:400e:c00::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wxkqN47BbzDr0g
 for <openbmc@lists.ozlabs.org>; Tue, 27 Jun 2017 21:54:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="iGEQeNfG"; 
 dkim-atps=neutral
Received: by mail-pf0-x244.google.com with SMTP id d5so4475114pfe.1
 for <openbmc@lists.ozlabs.org>; Tue, 27 Jun 2017 04:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=K0/V0RzjhvQadjUeZziQrdVKZ+7D9x6xoXRg9KOD7cI=;
 b=iGEQeNfGrpJsYhoffViX+3EMhA0Izi1lDG+6/7O3QCWCZIynnONkpdY5+FlrWJ4f8E
 +ZS01Fke265A5kFSINVfehhpq2syBFmSWVWE/fRFq1tpd8pVTmH56ZbXPa1YpYTTKmju
 VJLb+X1jNHDn7pgcx8S0ARn+m4AusOn/PCzzmV/e82CNa4lpVaytDDggN6SKOQd2VXx1
 GslGlUDSh2xUJxrXU7fuLAzCESSoNEkUsCRVWnH9uauvwAVP9UAhpwe1UWZq08V5XOQ7
 Zo35k6ee7ljhQdy/aK6LRI7/lVIBk1bDvwyZxHAQJyWpVpiVnQeqg67OePMryg3pK3Uj
 lESA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=K0/V0RzjhvQadjUeZziQrdVKZ+7D9x6xoXRg9KOD7cI=;
 b=HhDcjVErfe6NhGL0epvDPISZhXtdD+M/HqrS+afU+TUlkSaS6QOTrTujZJJIPLfxaM
 QDaqae6f64rdoQOoKj1tDtK2Hk1FtQdMoIh+QPs4yJAGS/FmMJdKqrLaZM0oCjeczixM
 XkXzgEZEXvoPTvC9mAQdwtiOpyo8mjxNEftGX2mcK5PZE0gALWJPGMLwxxjFqNEHoelq
 9RA7BQ5iWixWeF/CPBnSsgk0YhOcLP1dm3OREzn8b0jgYJnF0kK8962qngtW0rkHucSk
 s3eTTzzArmIBzyEzY2Kxq3dBV6ZJoQ6A1ai7v37Bs7hZmGiT+fQBoZL3mJniL+mRWr2Q
 AFBA==
X-Gm-Message-State: AKS2vOxUbLki5NoVsFcxqitpyDoojLbRBVwccaGR7i0EOBjtN2Z3yS3Z
 JF2TIrxAtpp0gU/RZqo=
X-Received: by 10.84.217.156 with SMTP id p28mr5353466pli.206.1498564461452;
 Tue, 27 Jun 2017 04:54:21 -0700 (PDT)
Received: from aurora.jms.id.au (region97.lnk.telstra.net. [110.143.27.102])
 by smtp.gmail.com with ESMTPSA id e63sm6362461pfb.18.2017.06.27.04.54.18
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Tue, 27 Jun 2017 04:54:20 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Tue, 27 Jun 2017 21:24:14 +0930
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH qemu] aspeed: Register all three watchdogs
Date: Tue, 27 Jun 2017 21:24:11 +0930
Message-Id: <20170627115411.19642-1-joel@jms.id.au>
X-Mailer: git-send-email 2.13.1
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
X-List-Received-Date: Tue, 27 Jun 2017 11:54:25 -0000

The ast2500 contains three watchdogs. Instatite the model three times to
the correct address.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
Tested with dev-4.10 with multiple watchdogs enabled in the device tree.

Note that the ast2400 only has two watchdogs, but I'm not sure how to account for that.

 hw/arm/aspeed_soc.c         | 25 +++++++++++++++----------
 include/hw/arm/aspeed_soc.h |  2 +-
 2 files changed, 16 insertions(+), 11 deletions(-)

diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 77b95e8e8092..522cdba3bf9d 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -178,11 +178,13 @@ static void aspeed_soc_init(Object *obj)
     object_property_add_alias(obj, "ram-size", OBJECT(&s->sdmc),
                               "ram-size", &error_abort);
 
-    object_initialize(&s->wdt, sizeof(s->wdt), TYPE_ASPEED_WDT);
-    object_property_add_child(obj, "wdt", OBJECT(&s->wdt), NULL);
-    qdev_set_parent_bus(DEVICE(&s->wdt), sysbus_get_default());
-    object_property_add_const_link(OBJECT(&s->wdt), "scu", OBJECT(&s->scu),
-                                   NULL);
+    for (i = 0; i < ARRAY_SIZE(s->wdt); i++) {
+	    object_initialize(&s->wdt[i], sizeof(s->wdt[i]), TYPE_ASPEED_WDT);
+	    object_property_add_child(obj, "wdt", OBJECT(&s->wdt[i]), NULL);
+	    qdev_set_parent_bus(DEVICE(&s->wdt[i]), sysbus_get_default());
+	    object_property_add_const_link(OBJECT(&s->wdt[i]), "scu",
+			    OBJECT(&s->scu), NULL);
+    }
 
     object_initialize(&s->ftgmac100, sizeof(s->ftgmac100), TYPE_FTGMAC100);
     object_property_add_child(obj, "ftgmac100", OBJECT(&s->ftgmac100), NULL);
@@ -340,12 +342,15 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->sdmc), 0, ASPEED_SOC_SDMC_BASE);
 
     /* Watch dog */
-    object_property_set_bool(OBJECT(&s->wdt), true, "realized", &err);
-    if (err) {
-        error_propagate(errp, err);
-        return;
+    for (i = 0; i < ARRAY_SIZE(s->wdt); i++) {
+	    fprintf(stderr, "regisering wdt %d at %08x\n", i, ASPEED_SOC_WDT_BASE + i * 0x20); 
+	    object_property_set_bool(OBJECT(&s->wdt[i]), true, "realized", &err);
+	    if (err) {
+		    error_propagate(errp, err);
+		    return;
+	    }
+	    sysbus_mmio_map(SYS_BUS_DEVICE(&s->wdt[i]), 0, ASPEED_SOC_WDT_BASE + i * 0x20);
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->wdt), 0, ASPEED_SOC_WDT_BASE);
 
     /* Net */
     qdev_set_nic_properties(DEVICE(&s->ftgmac100), &nd_table[0]);
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index d16205c66b5f..8a550dafd737 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -40,7 +40,7 @@ typedef struct AspeedSoCState {
     AspeedSMCState fmc;
     AspeedSMCState spi[ASPEED_SPIS_NUM];
     AspeedSDMCState sdmc;
-    AspeedWDTState wdt;
+    AspeedWDTState wdt[3];
     FTGMAC100State ftgmac100;
     AspeedIBTState ibt;
 } AspeedSoCState;
-- 
2.13.1
