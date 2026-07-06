Return-Path: <openbmc+bounces-2221-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF4EC43458
	for <openbmc@archiver.kernel.org>; Mon,  6 Jul 2026 14:49:28 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gv6gN2hfQz3brv;
	Tue, 07 Jul 2026 00:48:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::435"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1783349328;
	cv=none; b=W2gX/B2p9Zh/SNUFQygRTp0B5V+RwGWzECGNGlXqsG+97+CqE0DBxjQWw1+S9UyA8w54Kt0I7MuINU5u+tX6uMoXhziOca+WI41B0WiE5p33nJZ9GGs5+yaVJ7QiC7zXx3Wae18d2753JsjXTh3uysfQoon2yaYCuKOCtIz7dadue7Nb+OB+o72AKp24xml2BjGz/u9cJBKNwTCxkV4boePWAuSSP7TedieiJ291XK9ypQokvTGI6GUNWGKStrCVH94shnFUpqBIGPp/GwcSrhtsIMsj1+Dc81EL7w5A4kfBuci15oFNqe9ljng2WL3TKwotc1+9VQORXkyEWhKT/w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1783349328; c=relaxed/relaxed;
	bh=nuDU45OA6ggrf4VYV6YQ5pMRzsYDccU2hT9CMU+OAX0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HvprRRllEPaEvTF7dNc9q3jOpl5cNdohSAp7/lRHGPMAYAavYRM/xgcrf+gP1EPnrmEYg3JKO5Kd3eXk69+qQprV5hPLFenk0p4zQcKTaK/erhr1pKlGWOl4JszxMa8gD0DPKEM2AzQX/9CWCUZ7FvA5b39hrejIFDkUkCS9T+tMPYqk2ktV/6RCVaIC/AUC+20LVhC0l0ZVvtnBocmHNQa4Z9US3kI9AzNyQi6qIxYZIyww+1Cap4oxyMnlSyHWy32FQ9olkQdSByYpQAllvQbOUldP4+Nv5wEIt+86V19asofH1YIqM2+KH4pEEeRPiMfdOXbr7wmMLS3vEp31Tg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DuX9rOQ1; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DuX9rOQ1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gv6gL3NQ8z2yfS
	for <openbmc@lists.ozlabs.org>; Tue, 07 Jul 2026 00:48:46 +1000 (AEST)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-474bf35cccdso818827f8f.1
        for <openbmc@lists.ozlabs.org>; Mon, 06 Jul 2026 07:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783349323; x=1783954123; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nuDU45OA6ggrf4VYV6YQ5pMRzsYDccU2hT9CMU+OAX0=;
        b=DuX9rOQ1gvrKfsFIl4fDylzNpdBesdYIK65Wd/wJbpaRa4d9lNhJT0GoT11AfKLzSj
         pqodgZJCZS61Jg74R6yoTFQ257UecNDIAqtPumxJFvOoLh8SsH0I5k1z7AgD9D6nS1vN
         9VLi6kbX3GTydWEYsbinxVQfIxk1Djh2J5AXqK8ETTOSM2DoqpkRpCgLplrynd3S84NC
         5L1QvlqAjN8ITnCYZdPYEcFslRO9KjNt+sk4SLDM6WTIqQ6oOGUpby8MtBIaKxpW5Mjz
         Gm4NwWAenjXWAsjAWwXTQx1NJBorbloZLdn9RQeuarjbeIwg1R9idLV6p1U31Ni9Hs2V
         D+yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783349323; x=1783954123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nuDU45OA6ggrf4VYV6YQ5pMRzsYDccU2hT9CMU+OAX0=;
        b=pYgk8lrYxvnV3hxMjJkD4sie1zbbl5Mbzm0b5AeylqBiLnDAeeUJEWvKy1y7SByWMV
         PFXlf6O1SfMVcQbjnVDgyyVhssxNji6UGLW2hKEOOHN8q/woAIbFn36Kaavo40fVkbtO
         avgYUnh78anll/oO0He36YhKiH7zzVldOrDWf4lHmAm3vJXzJGIIWAMKHlcpOzkv+yrh
         ro1RX2N3+Zwge8DL2SEosR2svZCH02r2FncIC/4KI5c+FdfhYaB1ljZAQADZ3gofPdHm
         WrYb1Z/hXFeJSl8ZJ2zpuAThz53iOuIg9hF8VIJPQdhseuxsdeZXXtXjq3/U6QkSeLWu
         IQ4A==
X-Gm-Message-State: AOJu0Yzf86Eg9y6I5qXE2U8w8CZ5tydPomZk9CK5EJ+btA3rxDHuqw+B
	93sHP18svZCgixrLvksKelmELF3Ct7cshGS1/i0djyPdQE0vkvlWGEER
X-Gm-Gg: AfdE7cnROwK7fNjW5cZ+eTl79G/3aGLZ7eoDNeZNCTVT27Ybyo4B+CvazulLw4hkg8H
	vo9Vg0YP3hOhid+NVjLoVwW6SwLzVz44f+I/B7OZ89Z5hP8csgwukhnLOwlMUOOfDtELmZ7yLQG
	qtT815O1ow8RLAipbuqcIoqzYam1UjH9m1AUtxeEkkixKRn2l/Qo98pq5wo6+ExmPzTeehlbH8W
	1XHkyYDrk13treqXXjdz6myyz5CPEvSCFTNqgbj0HiVfr1QuCJtN2drrjZP1YxAovCyK3FPmVUm
	TeDpzG4rU04SnWLD0HwHBw8yv4KClp1R2E8aQV4VBqv9Z2QazKxDSESDO3r94MpxvMwYBs7RGxz
	41FhjIUqqrSSzGVtx5C1/dRbdV8kg0yIFEBJiB4gJS5cYSSFrsTiEiys40NzhU9g7S9AovobvAp
	kp+4xCof/Xs1/jnrPuF7M7xByYrgBMwkf1Ow==
X-Received: by 2002:a5d:5304:0:b0:475:f0d1:eb63 with SMTP id ffacd0b85a97d-47de6656ca9mr608554f8f.48.1783349323396;
        Mon, 06 Jul 2026 07:48:43 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960634sm26798473f8f.26.2026.07.06.07.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 07:48:42 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: andrew@codeconstruct.com.au,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: openbmc@lists.ozlabs.org,
	linux-watchdog@vger.kernel.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	joel@jms.id.au
Subject: [PATCH v4 3/3] watchdog: npcm: add bootstatus support
Date: Mon,  6 Jul 2026 17:48:28 +0300
Message-Id: <20260706144828.3517631-4-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260706144828.3517631-1-tmaimon77@gmail.com>
References: <20260706144828.3517631-1-tmaimon77@gmail.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NPCM750 uses RESSR and the NPCM845 uses INTCR2 to latch reset
indications. Read those bits during probe and map them into watchdog
bootstatus flags.

For NPCM845, cache the sampled INTCR2 state in SCRPAD10 after the reset
status bits are cleared so later probes can report the same boot-time
state. Also report WDIOF_CARDRESET for the watchdog instance whose reset
bit is latched, while leaving WPCM450 behavior unchanged.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/watchdog/npcm_wdt.c | 217 +++++++++++++++++++++++++++++++++++-
 1 file changed, 215 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/npcm_wdt.c b/drivers/watchdog/npcm_wdt.c
index e62ea054bc61..cecfd6e574d8 100644
--- a/drivers/watchdog/npcm_wdt.c
+++ b/drivers/watchdog/npcm_wdt.c
@@ -7,14 +7,52 @@
 #include <linux/delay.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of_irq.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/watchdog.h>
 
 #define NPCM_WTCR	0x1C
 
+/* NPCM GCR module */
+#define NPCM_RESSR_OFFSET		0x6C
+#define NPCM_INTCR2_OFFSET		0x60
+#define NPCM7XX_SCRPAD2_OFFSET		0x84
+#define NPCM8XX_SCRPAD10_OFFSET		0xE28
+
+#define NPCM_PORST			BIT(31)
+#define NPCM_CORST			BIT(30)
+#define NPCM_WD0RST			BIT(29)
+#define NPCM_SWR1RST			BIT(28)
+#define NPCM_SWR2RST			BIT(27)
+#define NPCM_SWR3RST			BIT(26)
+#define NPCM_SWR4RST			BIT(25)
+#define NPCM_WD1RST			BIT(24)
+#define NPCM_WD2RST			BIT(23)
+#define NPCM_RST			GENMASK(31, 23)
+#define NPCM8XX_TIP_RESET		BIT(25) /* Replaces SWRST4 on NPCM8xx */
+
+/* Per-instance mapping of MMIO base address to its RESSR/INTCR2 reset bit. */
+struct npcm_wdt_rst_map {
+	phys_addr_t	base;
+	u32		rst_bit;
+};
+
+struct npcm_wdt_status_map {
+	u32	rst_bit;
+	u32	wdiof_flag;
+};
+
+struct npcm_wdt_data {
+	const struct npcm_wdt_rst_map		*rst_map;
+	unsigned int				rst_map_size;
+	const struct npcm_wdt_status_map	*status_map;
+	unsigned int				status_map_size;
+};
+
 #define NPCM_WTCLK	(BIT(10) | BIT(11))	/* Clock divider */
 #define NPCM_WTE	BIT(7)			/* Enable */
 #define NPCM_WTIE	BIT(6)			/* Enable irq */
@@ -47,6 +85,50 @@ struct npcm_wdt {
 	struct clk		*clk;
 };
 
+static const struct npcm_wdt_rst_map npcm750_rst_map[] = {
+	{ 0xf000801c, NPCM_WD0RST },
+	{ 0xf000901c, NPCM_WD1RST },
+	{ 0xf000a01c, NPCM_WD2RST },
+};
+
+static const struct npcm_wdt_status_map npcm750_status_map[] = {
+	{ NPCM_PORST, WDIOF_OVERHEAT },
+	{ NPCM_CORST, WDIOF_FANFAULT },
+	{ NPCM_SWR1RST, WDIOF_EXTERN1 },
+	{ NPCM_SWR2RST, WDIOF_EXTERN2 },
+	{ NPCM_SWR3RST, WDIOF_POWERUNDER },
+	{ NPCM_SWR4RST, WDIOF_POWEROVER },
+};
+
+static const struct npcm_wdt_data npcm750_data = {
+	.rst_map = npcm750_rst_map,
+	.rst_map_size = ARRAY_SIZE(npcm750_rst_map),
+	.status_map = npcm750_status_map,
+	.status_map_size = ARRAY_SIZE(npcm750_status_map),
+};
+
+static const struct npcm_wdt_rst_map npcm845_rst_map[] = {
+	{ 0xf000801c, NPCM_WD0RST },
+	{ 0xf000901c, NPCM_WD1RST },
+	{ 0xf000a01c, NPCM_WD2RST },
+};
+
+static const struct npcm_wdt_status_map npcm845_status_map[] = {
+	{ NPCM_PORST, WDIOF_OVERHEAT },
+	{ NPCM_CORST, WDIOF_FANFAULT },
+	{ NPCM_SWR1RST, WDIOF_EXTERN1 },
+	{ NPCM_SWR2RST, WDIOF_EXTERN2 },
+	{ NPCM_SWR3RST, WDIOF_POWERUNDER },
+	{ NPCM8XX_TIP_RESET, WDIOF_POWEROVER },
+};
+
+static const struct npcm_wdt_data npcm845_data = {
+	.rst_map = npcm845_rst_map,
+	.rst_map_size = ARRAY_SIZE(npcm845_rst_map),
+	.status_map = npcm845_status_map,
+	.status_map_size = ARRAY_SIZE(npcm845_status_map),
+};
+
 static inline struct npcm_wdt *to_npcm_wdt(struct watchdog_device *wdd)
 {
 	return container_of(wdd, struct npcm_wdt, wdd);
@@ -169,6 +251,111 @@ static bool npcm_is_running(struct watchdog_device *wdd)
 	return readl(wdt->reg) & NPCM_WTE;
 }
 
+static void npcm_get_reset_status(struct npcm_wdt *wdt, struct device *dev,
+				  const struct npcm_wdt_data *data,
+				  resource_size_t start)
+{
+	struct regmap *gcr_regmap;
+	u32 rstval = 0;
+	unsigned int i;
+	int ret;
+
+	if (!data)
+		return;
+
+	gcr_regmap = syscon_regmap_lookup_by_phandle(dev->of_node,
+						     "nuvoton,sysgcr");
+	if (IS_ERR(gcr_regmap)) {
+		dev_warn(dev,
+			 "Failed to find nuvoton,sysgcr, WD reset status not supported\n");
+		return;
+	}
+
+	if (of_device_is_compatible(dev->of_node, "nuvoton,npcm845-wdt")) {
+		ret = regmap_read(gcr_regmap, NPCM_INTCR2_OFFSET, &rstval);
+		if (ret) {
+			dev_warn(dev, "Failed to read INTCR2 reset status: %d\n",
+				 ret);
+			return;
+		}
+
+		if (rstval & NPCM_RST) {
+			ret = regmap_write(gcr_regmap, NPCM_INTCR2_OFFSET,
+					   rstval & ~NPCM_RST);
+			if (ret) {
+				dev_warn(dev,
+					 "Failed to clear INTCR2 reset status: %d\n",
+					 ret);
+				return;
+			}
+
+			ret = regmap_write(gcr_regmap, NPCM8XX_SCRPAD10_OFFSET,
+					   rstval);
+			if (ret) {
+				dev_warn(dev,
+					 "Failed to cache reset status in SCRPAD10: %d\n",
+					 ret);
+				return;
+			}
+		} else {
+			ret = regmap_read(gcr_regmap, NPCM8XX_SCRPAD10_OFFSET,
+					  &rstval);
+			if (ret) {
+				dev_warn(dev,
+					 "Failed to read cached reset status from SCRPAD10: %d\n",
+					 ret);
+				return;
+			}
+		}
+	} else if (of_device_is_compatible(dev->of_node, "nuvoton,npcm750-wdt")) {
+		ret = regmap_read(gcr_regmap, NPCM_RESSR_OFFSET, &rstval);
+		if (ret) {
+			dev_warn(dev, "Failed to read RESSR reset status: %d\n",
+				 ret);
+			return;
+		}
+
+		if (rstval & NPCM_RST) {
+			ret = regmap_write(gcr_regmap, NPCM_RESSR_OFFSET, 
+					   rstval & ~NPCM_RST);
+			if (ret) {
+				dev_warn(dev, "Failed to clear RESSR reset status: %d\n", ret);
+				return;
+			}
+
+			ret = regmap_write(gcr_regmap, NPCM7XX_SCRPAD2_OFFSET,
+					   rstval);
+			if (ret) {
+				dev_warn(dev,
+					 "Failed to cache reset status in SCRPAD2: %d\n", ret);
+				return;
+			}
+		} else {
+			ret = regmap_read(gcr_regmap, NPCM7XX_SCRPAD2_OFFSET,
+					  &rstval);
+			if (ret) {
+				dev_warn(dev,
+					 "Failed to read cached reset status from SCRPAD2: %d\n",
+					 ret);
+				return;
+			}
+		}
+	}
+
+	for (i = 0; i < data->status_map_size; i++) {
+		if (rstval & data->status_map[i].rst_bit)
+			wdt->wdd.bootstatus |= data->status_map[i].wdiof_flag;
+	}
+
+	for (i = 0; i < data->rst_map_size; i++) {
+		if (data->rst_map[i].base == start &&
+		    rstval & data->rst_map[i].rst_bit) {
+			wdt->wdd.bootstatus |= WDIOF_CARDRESET;
+			break;
+		}
+	}
+}
+
 static const struct watchdog_info npcm_wdt_info = {
 	.identity	= KBUILD_MODNAME,
 	.options	= WDIOF_SETTIMEOUT
@@ -176,6 +363,20 @@ static const struct watchdog_info npcm_wdt_info = {
 			| WDIOF_MAGICCLOSE,
 };
 
+static const struct watchdog_info npcm_wdt_rst_info = {
+	.identity	= KBUILD_MODNAME,
+	.options	= WDIOF_SETTIMEOUT
+			| WDIOF_KEEPALIVEPING
+			| WDIOF_MAGICCLOSE
+			| WDIOF_CARDRESET
+			| WDIOF_OVERHEAT
+			| WDIOF_FANFAULT
+			| WDIOF_EXTERN1
+			| WDIOF_EXTERN2
+			| WDIOF_POWERUNDER
+			| WDIOF_POWEROVER,
+};
+
 static const struct watchdog_ops npcm_wdt_ops = {
 	.owner = THIS_MODULE,
 	.start = npcm_wdt_start,
@@ -188,7 +389,10 @@ static const struct watchdog_ops npcm_wdt_ops = {
 static int npcm_wdt_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	const struct npcm_wdt_data *data = device_get_match_data(dev);
+	struct resource *res;
 	struct npcm_wdt *wdt;
+	resource_size_t start;
 	int irq;
 	int ret;
 
@@ -196,10 +400,16 @@ static int npcm_wdt_probe(struct platform_device *pdev)
 	if (!wdt)
 		return -ENOMEM;
 
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -EINVAL;
+
 	wdt->reg = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(wdt->reg))
 		return PTR_ERR(wdt->reg);
 
+	start = res->start;
+
 	wdt->clk = devm_clk_get_optional(&pdev->dev, NULL);
 	if (IS_ERR(wdt->clk))
 		return PTR_ERR(wdt->clk);
@@ -208,7 +418,7 @@ static int npcm_wdt_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
-	wdt->wdd.info = &npcm_wdt_info;
+	wdt->wdd.info = data ? &npcm_wdt_rst_info : &npcm_wdt_info;
 	wdt->wdd.ops = &npcm_wdt_ops;
 	wdt->wdd.min_timeout = 1;
 	wdt->wdd.max_timeout = 2750;
@@ -220,6 +430,8 @@ static int npcm_wdt_probe(struct platform_device *pdev)
 	/* Ensure timeout is able to be represented by the hardware */
 	npcm_wdt_set_timeout(&wdt->wdd, wdt->wdd.timeout);
 
+	npcm_get_reset_status(wdt, dev, data, start);
+
 	if (npcm_is_running(&wdt->wdd)) {
 		/* Restart with the default or device-tree specified timeout */
 		npcm_wdt_start(&wdt->wdd);
@@ -243,7 +455,8 @@ static int npcm_wdt_probe(struct platform_device *pdev)
 #ifdef CONFIG_OF
 static const struct of_device_id npcm_wdt_match[] = {
 	{.compatible = "nuvoton,wpcm450-wdt"},
-	{.compatible = "nuvoton,npcm750-wdt"},
+	{.compatible = "nuvoton,npcm750-wdt", .data = &npcm750_data},
+	{.compatible = "nuvoton,npcm845-wdt", .data = &npcm845_data},
 	{},
 };
 MODULE_DEVICE_TABLE(of, npcm_wdt_match);
-- 
2.34.1


