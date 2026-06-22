Return-Path: <openbmc+bounces-2120-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A8ACDB46B
	for <openbmc@archiver.kernel.org>; Mon, 22 Jun 2026 08:31:47 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gkLyJ0rzHz2yb9;
	Mon, 22 Jun 2026 18:31:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1782117079;
	cv=none; b=CZSU1ZPilao9F+xjCsF0eVU+AEPWuqRnwHdLx61+Kj8yabBfuBX+CZ0D37oH8Fwe2NROpbfC2xFIjHCNWHPr+lV9dK70bUm3dim6Zzvg3E/Pg9wdwDD36tvO1v0LxpelE+6MXXo4zoeuam2bOf2f9oNThw///RI3kjUZIod6gegSwf1US8XGXwICpwH5wwynSRh29JKIrn5COzQWLun6SoGWouafIjArKXl2IGGAuyrTfiNOgL5kht+txwPFfBycW3ClenJbrf+DpRH7SgCNsqohzpsVob5t1I8/xFEQL+C03c2FD89m+GT7XBEA1nwW95oUz48HocGOo/KjoI7Mrg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1782117079; c=relaxed/relaxed;
	bh=nlFNf2Othj0z2P5LY3YeTXkAwB9klNXkicCVKLXvmGo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g8bn1LgdYJJzDYKhKTtat2nqvfkyK9wR0zyCGIPrA6tPU+Gbo2/PDYJ+n3zAt/CoADMr2Hkq4HdMgrNT2j2lDbqQUWC0Wahsrj1y19R5+3LBXQ6PBEvqfjpKhOc3AV3MW3dgaFqzYB0U1PJr/fgZwwHkAQ0dF+M8XG1IilxoXX+c1odG1mY14kpkASxfK05ROQ2UYgiHmWdx5k1YxHGFvSZqh3WyX3My1pLdFTzGxMOMqKvtLyPvxV2xQhh0oCB0YbFJ6d48AAzHoqbk93punhfHbP3ZcmYr5M8A/xUm5jZfsYM5ek9k8o5PD/oUWT+i+VbQaNtG9ZtYnOvDcisbhg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=O/OOmIOG; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=O/OOmIOG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gkLyG2nRMz2xPL
	for <openbmc@lists.ozlabs.org>; Mon, 22 Jun 2026 18:31:18 +1000 (AEST)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4923fb1f095so28237665e9.1
        for <openbmc@lists.ozlabs.org>; Mon, 22 Jun 2026 01:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782117075; x=1782721875; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nlFNf2Othj0z2P5LY3YeTXkAwB9klNXkicCVKLXvmGo=;
        b=O/OOmIOGVqP1bPPvoNCk+ZfabL/kPX4kbYfIjd2z2IAkxy8HOulCZ+Xk2uWNcM5cJo
         QqwZzME+v7KWKmMbEahswmY1U1OOC/dpZ35Qf3qL08Z0iDPzwUifhBLM/TlPQdij5kTo
         4efhYvpJmHRXNbAqlsTyxoYqsfg7TC0nAuZHN8F4zFX7sCAlsdjCirMdXeE5m462ztf0
         iRz18z0+ul+100Iy7h1QN1gZxG0Dp8STqRqfCXoego6nBzddROrg8x2U0RWdVyhCA0SW
         bZMHfHCRUlK5FNzo9ph6TZbnyv22EnKNpKMykSnUk8ZhlUIQKzBa5jIvFU6Zn4z3xmUw
         31LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782117075; x=1782721875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nlFNf2Othj0z2P5LY3YeTXkAwB9klNXkicCVKLXvmGo=;
        b=Ab0c+F1iVtX0GpKg3Qtu3wpx4TsGwYuvc/084XhO4n2KPygqzEVQlIh34hmpeGj2cp
         fQkcT1QgLTk7DJcvAdlZPT1bGonEzH/C0LKSqqTbquVPPfWoCBiaRSNFzOH3yyiTAGXW
         OGXEa+ofX3xROETJuJdBmllbXGfLyrPa1fACDowNGqJxzoVpBLKPnCwE/OJ/HXvQg3J7
         ekxD3DJhLDZsOs+9vLjQyTd91kDpSES/oelQZnGkRaM8GZIcftyQEReXOqKOMyCN0Mwk
         ggLdHoTrn1wsx6CMe1jAjUCF1TnwGH17lpEnCSaPQxj0rapV5qJbOXJ2O0FT7fYwdao2
         /CUA==
X-Gm-Message-State: AOJu0YzHWicmGDKWKHmlaJwIeBbMQBwlMD2tWgsudn38Noguld418pOv
	av1y3YokOLrzV7jDSQBWfmai2CaXwVW/bAKvl7+u6cNASPtgIIqwyYYA
X-Gm-Gg: AfdE7cmRR8eifxfIoN2MB88uzyYkHWEksLuHR3ey0LN/K0TuJi8Qvv3DcImUn9zV8TX
	pj82+N+Xb4U6DVBo1G5pZuzFpfCDgG4haexaaTtRdhx2v/sZP5Btgp+n6qBjSrH6wdjg1cCNAbF
	L40WGFlze8s/h/bDwQgYYn3zOQVcAcfhogM9olbeWWEsSg32HMJK01qRuvT1KSRlp6hgWr//NJa
	S/2IbPUAqOAgXHko+2//AydjiZYx/Ge9XXmcwHnkRR2y9/AINZCPQZT+LloiUhL7g7A7P431SPR
	sfID93+oGA9C2lIq5mqDNWy96LBm403Mv6Qux0thzmKZZvQ/Ynwkz6GBNMHj25ike1pU6lVljUQ
	UOJ3oOUYs+EKvMVb9DO3dS+/e0EAqEtDURtVRtJZ7Lrkks6vDN15npZ2Js9FBmCUUQ+x6dyXXpu
	LsUxVbIQxA1h5RbipxmkIYB2g=
X-Received: by 2002:a05:600c:5290:b0:490:bcf6:469f with SMTP id 5b1f17b1804b1-49242189b1cmr199955115e9.0.1782117075258;
        Mon, 22 Jun 2026 01:31:15 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492494497ffsm200809105e9.11.2026.06.22.01.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 01:31:14 -0700 (PDT)
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
Subject: [PATCH v2 3/3] watchdog: npcm: add bootstatus support
Date: Mon, 22 Jun 2026 11:30:46 +0300
Message-Id: <20260622083046.3189603-4-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260622083046.3189603-1-tmaimon77@gmail.com>
References: <20260622083046.3189603-1-tmaimon77@gmail.com>
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
 drivers/watchdog/npcm_wdt.c | 197 +++++++++++++++++++++++++++++++++++-
 1 file changed, 195 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/npcm_wdt.c b/drivers/watchdog/npcm_wdt.c
index e62ea054bc61..98660419ec3f 100644
--- a/drivers/watchdog/npcm_wdt.c
+++ b/drivers/watchdog/npcm_wdt.c
@@ -7,14 +7,51 @@
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
+#define NPCM8XX_RST			(GENMASK(31, 23) | GENMASK(15, 12))
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
@@ -47,6 +84,50 @@ struct npcm_wdt {
 	struct clk		*clk;
 };
 
+static const struct npcm_wdt_rst_map npcm750_rst_map[] = {
+	{ 0xf000801c, NPCM_WD0RST },
+	{ 0xf000901c, NPCM_WD1RST },
+	{ 0xf000a01c, NPCM_WD2RST },
+};
+
+static const struct npcm_wdt_status_map npcm750_status_map[] = {
+	{ NPCM_PORST,	WDIOF_OVERHEAT },
+	{ NPCM_CORST,	WDIOF_FANFAULT },
+	{ NPCM_SWR1RST,	WDIOF_EXTERN1 },
+	{ NPCM_SWR2RST,	WDIOF_EXTERN2 },
+	{ NPCM_SWR3RST,	WDIOF_POWERUNDER },
+	{ NPCM_SWR4RST,	WDIOF_POWEROVER },
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
+	{ NPCM_PORST,		WDIOF_OVERHEAT },
+	{ NPCM_CORST,		WDIOF_FANFAULT },
+	{ NPCM_SWR1RST,		WDIOF_EXTERN1 },
+	{ NPCM_SWR2RST,		WDIOF_EXTERN2 },
+	{ NPCM_SWR3RST,		WDIOF_POWERUNDER },
+	{ NPCM8XX_TIP_RESET,	WDIOF_POWEROVER },
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
@@ -169,6 +250,92 @@ static bool npcm_is_running(struct watchdog_device *wdd)
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
+		if (rstval & NPCM8XX_RST) {
+			ret = regmap_write(gcr_regmap, NPCM_INTCR2_OFFSET,
+					   rstval & ~NPCM8XX_RST);
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
+		ret = regmap_write(gcr_regmap, NPCM_RESSR_OFFSET, rstval);
+		if (ret) {
+			dev_warn(dev, "Failed to clear RESSR reset status: %d\n",
+				 ret);
+			return;
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
@@ -176,6 +343,20 @@ static const struct watchdog_info npcm_wdt_info = {
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
@@ -188,7 +369,10 @@ static const struct watchdog_ops npcm_wdt_ops = {
 static int npcm_wdt_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	const struct npcm_wdt_data *data = device_get_match_data(dev);
+	struct resource *res;
 	struct npcm_wdt *wdt;
+	resource_size_t start;
 	int irq;
 	int ret;
 
@@ -196,10 +380,16 @@ static int npcm_wdt_probe(struct platform_device *pdev)
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
@@ -208,7 +398,7 @@ static int npcm_wdt_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
-	wdt->wdd.info = &npcm_wdt_info;
+	wdt->wdd.info = data ? &npcm_wdt_rst_info : &npcm_wdt_info;
 	wdt->wdd.ops = &npcm_wdt_ops;
 	wdt->wdd.min_timeout = 1;
 	wdt->wdd.max_timeout = 2750;
@@ -220,6 +410,8 @@ static int npcm_wdt_probe(struct platform_device *pdev)
 	/* Ensure timeout is able to be represented by the hardware */
 	npcm_wdt_set_timeout(&wdt->wdd, wdt->wdd.timeout);
 
+	npcm_get_reset_status(wdt, dev, data, start);
+
 	if (npcm_is_running(&wdt->wdd)) {
 		/* Restart with the default or device-tree specified timeout */
 		npcm_wdt_start(&wdt->wdd);
@@ -243,7 +435,8 @@ static int npcm_wdt_probe(struct platform_device *pdev)
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


