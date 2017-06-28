Return-Path: <joel.stan@gmail.com>
Received: from mail-pg0-x244.google.com (mail-pg0-x244.google.com
 [IPv6:2607:f8b0:400e:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wy9WS0nwyzDr3R
 for <openbmc@lists.ozlabs.org>; Wed, 28 Jun 2017 14:57:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="tFwPozA2"; 
 dkim-atps=neutral
Received: by mail-pg0-x244.google.com with SMTP id u62so6775068pgb.0
 for <openbmc@lists.ozlabs.org>; Tue, 27 Jun 2017 21:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=Hq0+4Y/ZVlpgse2qvXDl+FKoGz+psPzb0ayr2dEsYTY=;
 b=tFwPozA29tHAi9NehI8zXTyDtWTtC8S0+YQhqZTNnPBDPBzPMNboSgCSKA3IYdox2L
 ESnfwdCbZyV8372o5yI+fw3aC+J7wBtCqO/pjTxpxzsg0NDgRqTHnhNOu++ZNmQ9rB2a
 o6Rg45VovSGXN67U65yJHyNaX1gQJCxmFLuJ2WGjyz0Gesxecqgigd+JK9JFW8L54COr
 OLee4PwMxS+Pbq19foND+uW0Q5Hnfco0iTYS5y4/iZGuZEWZNQO3qlhmLDlvK84PYP9O
 fTGq+t4JTkbLim/bPPA7c8Ny1m9lM8bWCLmvukCt7vNSVj0AiaCfbfkuD+RM643KWidC
 hhlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=Hq0+4Y/ZVlpgse2qvXDl+FKoGz+psPzb0ayr2dEsYTY=;
 b=hRDPwO4mbIJAIMCp2VlKOrD/Kfr50cHVJ52F4kSSTHZHiZVhy7Leml7jdVUr7uEthv
 elvSjThZvxsH7xOV/EUt3p+s2KlGW4cSHFgveH4BO9CgsbbvsJvjne9a3VlBWjXGIN6k
 mRvn5DLqxglWWPZq0A1Gb1XN6HUyW1fQ4anfVuqV9OfyVyWIRoyAQX4XuvH630xpMWA6
 42xJyRC11JcgW+zgey6s3qQz/WcdlC4mXVWFPga6VsQwXkDJFPHHCDgSjlSE6eJ4pQhP
 AkMN0bNm1J53wbl65XttL+Nw69ZuNuTRtuXMNvdRc25YP/fkB4Q0LqTuaNUneOyKxrBh
 i/BQ==
X-Gm-Message-State: AKS2vOzfw02HSG77zztt+VUFu8Dxm3oJ7VVrYjzSX/giA4PPMl9nZNKg
 U9oQkA46x5DoJrWWOMc=
X-Received: by 10.84.218.140 with SMTP id r12mr9497295pli.288.1498625825976;
 Tue, 27 Jun 2017 21:57:05 -0700 (PDT)
Received: from aurora.jms.id.au (region97.lnk.telstra.net. [110.143.27.102])
 by smtp.gmail.com with ESMTPSA id r81sm1609107pfa.103.2017.06.27.21.57.02
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Tue, 27 Jun 2017 21:57:05 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Wed, 28 Jun 2017 14:26:59 +0930
From: Joel Stanley <joel@jms.id.au>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Cc: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH qemu v2] aspeed: Register all watchdogs
Date: Wed, 28 Jun 2017 14:26:55 +0930
Message-Id: <20170628045655.10965-1-joel@jms.id.au>
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
X-List-Received-Date: Wed, 28 Jun 2017 04:57:08 -0000

The ast2400 contains two and the ast2500 contains three watchdogs.
Add this information to the AspeedSoCInfo and realise the correct number
of watchdogs for that each SoC type.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v2:
 - Add number of watchdogs to AspeedSoCInfo so we can register the
 correcet number of devices on each platform
 - Drop debugging printf
 - Fix long line and remove tabs
 - Update commit message

 hw/arm/aspeed_soc.c         | 29 +++++++++++++++++++----------
 include/hw/arm/aspeed_soc.h |  4 +++-
 2 files changed, 22 insertions(+), 11 deletions(-)

diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 77b95e8e8092..d1c57e1fd6a4 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -65,6 +65,7 @@ static const AspeedSoCInfo aspeed_socs[] = {
         .spi_bases    = aspeed_soc_ast2400_spi_bases,
         .fmc_typename = "aspeed.smc.fmc",
         .spi_typename = aspeed_soc_ast2400_typenames,
+        .wdts_num     = 2,
     }, {
         .name         = "ast2400-a1",
         .cpu_model    = "arm926",
@@ -75,6 +76,7 @@ static const AspeedSoCInfo aspeed_socs[] = {
         .spi_bases    = aspeed_soc_ast2400_spi_bases,
         .fmc_typename = "aspeed.smc.fmc",
         .spi_typename = aspeed_soc_ast2400_typenames,
+        .wdts_num     = 2,
     }, {
         .name         = "ast2400",
         .cpu_model    = "arm926",
@@ -85,6 +87,7 @@ static const AspeedSoCInfo aspeed_socs[] = {
         .spi_bases    = aspeed_soc_ast2400_spi_bases,
         .fmc_typename = "aspeed.smc.fmc",
         .spi_typename = aspeed_soc_ast2400_typenames,
+        .wdts_num     = 2,
     }, {
         .name         = "ast2500-a1",
         .cpu_model    = "arm1176",
@@ -95,6 +98,7 @@ static const AspeedSoCInfo aspeed_socs[] = {
         .spi_bases    = aspeed_soc_ast2500_spi_bases,
         .fmc_typename = "aspeed.smc.ast2500-fmc",
         .spi_typename = aspeed_soc_ast2500_typenames,
+        .wdts_num     = 3,
     },
 };
 
@@ -178,11 +182,13 @@ static void aspeed_soc_init(Object *obj)
     object_property_add_alias(obj, "ram-size", OBJECT(&s->sdmc),
                               "ram-size", &error_abort);
 
-    object_initialize(&s->wdt, sizeof(s->wdt), TYPE_ASPEED_WDT);
-    object_property_add_child(obj, "wdt", OBJECT(&s->wdt), NULL);
-    qdev_set_parent_bus(DEVICE(&s->wdt), sysbus_get_default());
-    object_property_add_const_link(OBJECT(&s->wdt), "scu", OBJECT(&s->scu),
-                                   NULL);
+    for (i = 0; i < sc->info->wdts_num; i++) {
+        object_initialize(&s->wdt[i], sizeof(s->wdt[i]), TYPE_ASPEED_WDT);
+        object_property_add_child(obj, "wdt", OBJECT(&s->wdt[i]), NULL);
+        qdev_set_parent_bus(DEVICE(&s->wdt[i]), sysbus_get_default());
+        object_property_add_const_link(OBJECT(&s->wdt[i]), "scu",
+                                       OBJECT(&s->scu), NULL);
+    }
 
     object_initialize(&s->ftgmac100, sizeof(s->ftgmac100), TYPE_FTGMAC100);
     object_property_add_child(obj, "ftgmac100", OBJECT(&s->ftgmac100), NULL);
@@ -340,12 +346,15 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->sdmc), 0, ASPEED_SOC_SDMC_BASE);
 
     /* Watch dog */
-    object_property_set_bool(OBJECT(&s->wdt), true, "realized", &err);
-    if (err) {
-        error_propagate(errp, err);
-        return;
+    for (i = 0; i < ARRAY_SIZE(s->wdt); i++) {
+        object_property_set_bool(OBJECT(&s->wdt[i]), true, "realized", &err);
+        if (err) {
+            error_propagate(errp, err);
+            return;
+        }
+        sysbus_mmio_map(SYS_BUS_DEVICE(&s->wdt[i]), 0,
+                        ASPEED_SOC_WDT_BASE + i * 0x20);
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->wdt), 0, ASPEED_SOC_WDT_BASE);
 
     /* Net */
     qdev_set_nic_properties(DEVICE(&s->ftgmac100), &nd_table[0]);
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index d16205c66b5f..fedb7b51a002 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -24,6 +24,7 @@
 #include "hw/misc/aspeed_ibt.h"
 
 #define ASPEED_SPIS_NUM  2
+#define ASPEED_WDTS_NUM  3
 
 typedef struct AspeedSoCState {
     /*< private >*/
@@ -40,7 +41,7 @@ typedef struct AspeedSoCState {
     AspeedSMCState fmc;
     AspeedSMCState spi[ASPEED_SPIS_NUM];
     AspeedSDMCState sdmc;
-    AspeedWDTState wdt;
+    AspeedWDTState wdt[ASPEED_WDTS_NUM];
     FTGMAC100State ftgmac100;
     AspeedIBTState ibt;
 } AspeedSoCState;
@@ -58,6 +59,7 @@ typedef struct AspeedSoCInfo {
     const hwaddr *spi_bases;
     const char *fmc_typename;
     const char **spi_typename;
+    int wdts_num;
 } AspeedSoCInfo;
 
 typedef struct AspeedSoCClass {
-- 
2.13.1
