Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E112F606A330
	for <openbmc@archiver.kernel.org>; Wed, 18 Nov 2026 22:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=2BTeSE9z
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jVGgk1fKhz3bQm;
	Thu, 19 Nov 2026 09:37:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1795009102;
	cv=none; b=BWOQGTvgKdENFgKoYT04tifFHeFd6DwMILv4w+E7rQ4KxovyNTL2/8Ye7hBTywi+Agsw1wPbXE/v+xygScDAKkDU+bsMay6XR1embpXjJLhNSZFLtOi9WtjRsIHENxMdc/uDZvP8o3jObjT8Zx0DITH1tKp1K89dCFzx2HD74skSvMMSb0vM/SuFt6kk2SWEiRwERJFo+YIGx7UH0V8YqZweAYs1aZYd/AXCwTe+sSWkMnnbY2qB6GfL7mLYp/o/CQjLV01mv7/fN6VbKdNderOPwXpawljVy9n8IG66HWX07HbYxnKrnOR80BYbgc0XkZTsevOYD2wHwqdK4Ct/KA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1795009102; c=relaxed/relaxed;
	bh=5d40pelDz1y7QtJWt7O/gaUwObkgrkM/NMpACCUfxCQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m0opiJp1d51f5OsKljZegJFF/4I73P8Bgp8i3NVGuipX+QxNqlJ5hsSrjYlIcVj3+uyqx+N4LJ9a7i5xdlscPcKdfQcYuTjtMP54vv8sQCeZD7QFF5IIkYmO3IKv/RM8Heerfmz14EBzaiGmcrVOtZj/Wza7NRy4d1oMT8pKjwraIyfDEnf5wzYNzZ8209blU4hyFGBs5lPzs0/e4/EI+FGdhTqNBctBO2T1k5PuKI1M+xnfN5o2C+Nc/AvQegfVrDXMiDJgHuIhw3hcudAr3r+Hc/MW7u+QeJ13NEXLzaYXgj8/XejXCXxdPOIaZEW4z39FC4gaglffDjQr8OqbQQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=2BTeSE9z; dkim-atps=neutral; spf=pass (client-ip=185.246.85.4; helo=smtpout-03.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=2BTeSE9z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.246.85.4; helo=smtpout-03.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jV2jm2Y9Nz2xL4
	for <openbmc@lists.ozlabs.org>; Thu, 19 Nov 2026 00:38:20 +1100 (AEDT)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id ECDBA4E41627;
	Wed, 18 Nov 2026 13:38:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BADBE5FE9B;
	Wed, 18 Nov 2026 13:38:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5116F11BC2075;
	Wed, 18 Nov 2026 14:38:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795009095; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5d40pelDz1y7QtJWt7O/gaUwObkgrkM/NMpACCUfxCQ=;
	b=2BTeSE9zLvDJmDegoUxQDxreFr6+iol4YOdpmaJExZ250fUHPdvSgIeA6xLIjh4gh/xuAQ
	G6TqTAMWaVpLR3g+xdNfN0BCTuKutupFqEu9YJ0HdYrf70luuYhQ5WVv536WdX9SAI2WHp
	bnwuu/6xZeE22V1FSvvZ6oYE+JAi2O8TGGHqqmWpyx5zQjcwiX/AXSp2AR0tkhfj6hgBsr
	35ULM+tL2qz3XS2L/sjPIs8MIY0N4NzFX2Kd/6VNyWsO9O/rdhBtPFTC8KzNxAAgClNJs8
	rbeazvn09+J8l/p0g2F/4cOceSnOMyL/Pm0R5D3HgKnqQr1pcsw6Rt/D3il0Hw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 18 Nov 2026 14:37:12 +0100
Subject: [PATCH v11 05/10] clk: nuvoton: ma35d1: Reparent the gates
 correctly
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
Precedence: list
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-perso-ma35d1-upstream-clk-v11-5-bd1d1e060926@bootlin.com>
References: <20261118-perso-ma35d1-upstream-clk-v11-0-bd1d1e060926@bootlin.com>
In-Reply-To: <20261118-perso-ma35d1-upstream-clk-v11-0-bd1d1e060926@bootlin.com>
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Miquel Raynal <miquel.raynal@bootlin.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The clock tree is still incorrect. There are four main clocks in this
system:
- HXT: external high-speed crystal oscillator
- LXT: external low-speed crystal oscillator
- HIRC: internal high-speed RC oscillator
- LIRC: internal low-speed RC oscillator
Each clock has a 'gate' control to disable it. While in the TRM the
'gate' appears aside, in the CCF topology, the gates should be
below. This is because if we gate one of those clocks, none of the
children clocks continue ticking.

Reparent hxt_gate under hxt, and all hxt children under hxt_gate.
Do the same for the three other clock sources listed above.

After this change, the frequencies are identical, but the clock tree
looks much closer to the reality.

Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
Cc: stable@vger.kernel.org
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/clk/nuvoton/clk-ma35d1.c | 78 +++++++++++++++++++++++-----------------
 1 file changed, 45 insertions(+), 33 deletions(-)

diff --git a/drivers/clk/nuvoton/clk-ma35d1.c b/drivers/clk/nuvoton/clk-ma35d1.c
index 33b397d7b7c5..65a2691002a7 100644
--- a/drivers/clk/nuvoton/clk-ma35d1.c
+++ b/drivers/clk/nuvoton/clk-ma35d1.c
@@ -74,34 +74,46 @@ static const struct clk_parent_data lxtg_parent_data[] = {
 };
 
 /* Mux parent selection, by index into the controller's clock table */
-static const int ca35clk_parent_idx[] = { HXT, CAPLL, DDRPLL };
+static const int ca35clk_parent_idx[] = { HXT_GATE, CAPLL, DDRPLL };
 static const int sysclk0_parent_idx[] = { EPLL_DIV2, SYSPLL };
-static const int sysclk1_parent_idx[] = { HXT, SYSPLL };
+static const int sysclk1_parent_idx[] = { HXT_GATE, SYSPLL };
 static const int axiclk_parent_idx[] = { AXICLK_DIV2, AXICLK_DIV4 };
-static const int ccap_parent_idx[] = { HXT, VPLL, APLL, SYSPLL };
+static const int ccap_parent_idx[] = { HXT_GATE, VPLL, APLL, SYSPLL };
 static const int sdh_parent_idx[] = { SYSPLL, APLL };
 static const int dcu_parent_idx[] = { EPLL_DIV2, SYSPLL };
 static const int gfx_parent_idx[] = { EPLL, SYSPLL };
-static const int dbg_parent_idx[] = { HIRC, SYSPLL };
-static const int timer0_parent_idx[] = { HXT, LXT, PCLK0, -1, -1, LIRC, -1, HIRC };
-static const int timer1_parent_idx[] = { HXT, LXT, PCLK0, -1, -1, LIRC, -1, HIRC };
-static const int timer2_parent_idx[] = { HXT, LXT, PCLK1, -1, -1, LIRC, -1, HIRC };
-static const int timer3_parent_idx[] = { HXT, LXT, PCLK1, -1, -1, LIRC, -1, HIRC };
-static const int timer4_parent_idx[] = { HXT, LXT, PCLK2, -1, -1, LIRC, -1, HIRC };
-static const int timer5_parent_idx[] = { HXT, LXT, PCLK2, -1, -1, LIRC, -1, HIRC };
-static const int timer6_parent_idx[] = { HXT, LXT, PCLK0, -1, -1, LIRC, -1, HIRC };
-static const int timer7_parent_idx[] = { HXT, LXT, PCLK0, -1, -1, LIRC, -1, HIRC };
-static const int timer8_parent_idx[] = { HXT, LXT, PCLK1, -1, -1, LIRC, -1, HIRC };
-static const int timer9_parent_idx[] = { HXT, LXT, PCLK1, -1, -1, LIRC, -1, HIRC };
-static const int timer10_parent_idx[] = { HXT, LXT, PCLK2, -1, -1, LIRC, -1, HIRC };
-static const int timer11_parent_idx[] = { HXT, LXT, PCLK2, -1, -1, LIRC, -1, HIRC };
-static const int uart_parent_idx[] = { HXT, SYSCLK1_DIV2 };
-static const int wdt0_parent_idx[] = { -1, LXT, PCLK3_DIV4096, LIRC };
-static const int wdt1_parent_idx[] = { -1, LXT, PCLK3_DIV4096, LIRC };
-static const int wdt2_parent_idx[] = { -1, LXT, PCLK4_DIV4096, LIRC };
-static const int wwdt0_parent_idx[] = { -1, -1, PCLK3_DIV4096, LIRC };
-static const int wwdt1_parent_idx[] = { -1, -1, PCLK3_DIV4096, LIRC };
-static const int wwdt2_parent_idx[] = { -1, -1, PCLK4_DIV4096, LIRC };
+static const int dbg_parent_idx[] = { HIRC_GATE, SYSPLL };
+static const int timer0_parent_idx[] = { HXT_GATE, LXT_GATE, PCLK0, -1, -1,
+					 LIRC_GATE, -1, HIRC_GATE };
+static const int timer1_parent_idx[] = { HXT_GATE, LXT_GATE, PCLK0, -1, -1,
+					 LIRC_GATE, -1, HIRC_GATE };
+static const int timer2_parent_idx[] = { HXT_GATE, LXT_GATE, PCLK1, -1, -1,
+					 LIRC_GATE, -1, HIRC_GATE };
+static const int timer3_parent_idx[] = { HXT_GATE, LXT_GATE, PCLK1, -1, -1,
+					 LIRC_GATE, -1, HIRC_GATE };
+static const int timer4_parent_idx[] = { HXT_GATE, LXT_GATE, PCLK2, -1, -1,
+					 LIRC_GATE, -1, HIRC_GATE };
+static const int timer5_parent_idx[] = { HXT_GATE, LXT_GATE, PCLK2, -1, -1,
+					 LIRC_GATE, -1, HIRC_GATE };
+static const int timer6_parent_idx[] = { HXT_GATE, LXT_GATE, PCLK0, -1, -1,
+					 LIRC_GATE, -1, HIRC_GATE };
+static const int timer7_parent_idx[] = { HXT_GATE, LXT_GATE, PCLK0, -1, -1,
+					 LIRC_GATE, -1, HIRC_GATE };
+static const int timer8_parent_idx[] = { HXT_GATE, LXT_GATE, PCLK1, -1, -1,
+					 LIRC_GATE, -1, HIRC_GATE };
+static const int timer9_parent_idx[] = { HXT_GATE, LXT_GATE, PCLK1, -1, -1,
+					 LIRC_GATE, -1, HIRC_GATE };
+static const int timer10_parent_idx[] = { HXT_GATE, LXT_GATE, PCLK2, -1, -1,
+					  LIRC_GATE, -1, HIRC_GATE };
+static const int timer11_parent_idx[] = { HXT_GATE, LXT_GATE, PCLK2, -1, -1,
+					  LIRC_GATE, -1, HIRC_GATE };
+static const int uart_parent_idx[] = { HXT_GATE, SYSCLK1_DIV2 };
+static const int wdt0_parent_idx[] = { -1, LXT_GATE, PCLK3_DIV4096, LIRC_GATE };
+static const int wdt1_parent_idx[] = { -1, LXT_GATE, PCLK3_DIV4096, LIRC_GATE };
+static const int wdt2_parent_idx[] = { -1, LXT_GATE, PCLK4_DIV4096, LIRC_GATE };
+static const int wwdt0_parent_idx[] = { -1, -1, PCLK3_DIV4096, LIRC_GATE };
+static const int wwdt1_parent_idx[] = { -1, -1, PCLK3_DIV4096, LIRC_GATE };
+static const int wwdt2_parent_idx[] = { -1, -1, PCLK4_DIV4096, LIRC_GATE };
 static const int spi0_parent_idx[] = { PCLK1, APLL };
 static const int spi1_parent_idx[] = { PCLK2, APLL };
 static const int spi2_parent_idx[] = { PCLK1, APLL };
@@ -109,11 +121,11 @@ static const int spi3_parent_idx[] = { PCLK2, APLL };
 static const int qspi_parent_idx[] = { PCLK0, APLL };
 static const int i2s_parent_idx[] = { APLL, SYSCLK1_DIV2 };
 static const int can_parent_idx[] = { APLL, VPLL };
-static const int cko_parent_idx[] = { HXT, LXT, HIRC, LIRC,
+static const int cko_parent_idx[] = { HXT_GATE, LXT_GATE, HIRC_GATE, LIRC_GATE,
 				      AXICLK_DIV4, SYSPLL, DDRPLL,
 				      EPLL_DIV2, APLL, VPLL };
-static const int smc_parent_idx[] = { HXT, PCLK4 };
-static const int kpi_parent_idx[] = { HXT, LXT };
+static const int smc_parent_idx[] = { HXT_GATE, PCLK4 };
+static const int kpi_parent_idx[] = { HXT_GATE, LXT_GATE };
 
 static const struct clk_div_table ip_div_table[] = {
 	{0, 2}, {1, 4}, {2, 6}, {3, 8}, {4, 10},
@@ -284,16 +296,16 @@ static int ma35d1_clocks_probe(struct platform_device *pdev)
 					 clk_base + REG_CLK_PWRCTL, 3);
 
 	hws[CAPLL] = ma35d1_reg_clk_pll(dev, CAPLL, pllmode[0], "capll",
-					hws[HXT], clk_base + REG_CLK_PLL0CTL0);
+					hws[HXT_GATE], clk_base + REG_CLK_PLL0CTL0);
 	hws[SYSPLL] = ma35d1_clk_fixed("syspll", 180000000);
 	hws[DDRPLL] = ma35d1_reg_clk_pll(dev, DDRPLL, pllmode[1], "ddrpll",
-					hws[HXT], clk_base + REG_CLK_PLL2CTL0);
+					hws[HXT_GATE], clk_base + REG_CLK_PLL2CTL0);
 	hws[APLL] = ma35d1_reg_clk_pll(dev, APLL, pllmode[2], "apll",
-				       hws[HXT], clk_base + REG_CLK_PLL3CTL0);
+				       hws[HXT_GATE], clk_base + REG_CLK_PLL3CTL0);
 	hws[EPLL] = ma35d1_reg_clk_pll(dev, EPLL, pllmode[3], "epll",
-				       hws[HXT], clk_base + REG_CLK_PLL4CTL0);
+				       hws[HXT_GATE], clk_base + REG_CLK_PLL4CTL0);
 	hws[VPLL] = ma35d1_reg_clk_pll(dev, VPLL, pllmode[4], "vpll",
-				       hws[HXT], clk_base + REG_CLK_PLL5CTL0);
+				       hws[HXT_GATE], clk_base + REG_CLK_PLL5CTL0);
 
 	hws[EPLL_DIV2] = ma35d1_clk_fixed_factor(dev, "epll_div2", "epll", 1, 2);
 	hws[EPLL_DIV4] = ma35d1_clk_fixed_factor(dev, "epll_div4", "epll", 1, 4);
@@ -461,7 +473,7 @@ static int ma35d1_clocks_probe(struct platform_device *pdev)
 	hws[CKO_GATE] = ma35d1_clk_gate(dev, "cko_gate", "cko_div",
 					clk_base + REG_CLK_SYSCLK1, 13);
 
-	hws[GTMR_GATE] = ma35d1_clk_gate(dev, "gtmr_gate", "hirc",
+	hws[GTMR_GATE] = ma35d1_clk_gate(dev, "gtmr_gate", "hirc_gate",
 					 clk_base + REG_CLK_SYSCLK1, 14);
 
 	hws[GPA_GATE] = ma35d1_clk_gate(dev, "gpa_gate", "hclk0",
@@ -662,7 +674,7 @@ static int ma35d1_clocks_probe(struct platform_device *pdev)
 	hws[UART16_GATE] = ma35d1_clk_gate(dev, "uart16_gate", "uart16_div",
 					   clk_base + REG_CLK_APBCLK0, 28);
 
-	hws[RTC_GATE] = ma35d1_clk_gate(dev, "rtc_gate", "lxt",
+	hws[RTC_GATE] = ma35d1_clk_gate(dev, "rtc_gate", "lxt_gate",
 					clk_base + REG_CLK_APBCLK0, 29);
 	hws[DDR_GATE] = ma35d1_clk_gate(dev, "ddr_gate", "ddrpll",
 					clk_base + REG_CLK_APBCLK0, 30);

-- 
2.56.0


