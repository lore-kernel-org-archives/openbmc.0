Return-Path: <openbmc+bounces-2780-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E7A2CC6B38
	for <openbmc@archiver.kernel.org>; Fri, 16 Oct 2026 04:32:27 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4j5X6Z4wlGz30Wg;
	Fri, 16 Oct 2026 15:30:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1792066791;
	cv=none; b=Q5vWxglWA2nmB6jxkrdMwhrRHP8+L2E1/8GCf8pkaxlbgiERnCVFwVCWk7ppoGaPpNpo2vP9YeqdUbxHp9KD/wREvZ+BTKsFmymanDfFQXazRpsQiTPkiOtIhT1o9KkmuBzJfTucO/TDMrrlkMhsYlNTU2N1qu6Vj3bB3AnBQw2BQaWD7lGch2l9eNZyO3nAbJ0SKz7OJn1NO5iWY4Y4ZrhVRsPgbPhzyDpgIUMoX9DEOiHjJTnsVnjRHw9KeOOl4Ka1kqB0g+Ed/ixaVuRlHUOBwknGqK41fO7vQPYTLcIu33YtsKvnmtSsqbiXM4V8HKoWyvlIsuoGjv60Pi664g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1792066791; c=relaxed/relaxed;
	bh=cAsfqIY4xysP+5WQyv/gdBmoGAYKfxxvAXv3mSfmZtg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jEy77Qbj6Ezv7oCzbu7zQXoUI8bWzRolvw2jQG1vao8YYSSL2Hv2cq/A1qOK8pNElqz32pSKKOOnPHO//P0uffvfiC7M0Af1LWjDGQi2AEjzVg5T6ZiXPezaSK2jbdImXnEJjxthpNU5nkp3zRbMZ41Db98LwVbcpASnhchWrk3efSUJ1p8o+DQMnFIxVb+ivjKJ65SlPeoRrusQ8BGxi5CLD7CrQ6LHw1ZDayUpiSzKkE5W/SKP2JgHjuW5WYdEuTrHxhN3eIz38rOY+1s/DK+Y8RT1V/TY0buG/Hn6oV86qi0/JmUvPpsoU3tzJ1oVj6m4rwq2ARk/jTPyQIs3Fg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=dzzF0JFt; dkim-atps=neutral; spf=pass (client-ip=185.246.85.4; helo=smtpout-03.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=dzzF0JFt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.246.85.4; helo=smtpout-03.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4j56Zt3nRjz2xLg
	for <openbmc@lists.ozlabs.org>; Thu, 15 Oct 2026 23:19:50 +1100 (AEDT)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8C1884E41246;
	Thu, 15 Oct 2026 12:19:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 600C860360;
	Thu, 15 Oct 2026 12:19:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 295FB10328BAF;
	Thu, 15 Oct 2026 14:19:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792066783; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cAsfqIY4xysP+5WQyv/gdBmoGAYKfxxvAXv3mSfmZtg=;
	b=dzzF0JFt/2sok+tbijanyssaOqEfpyuXYXFHltESIN42r4MCBoxFsSIEWFsdnJ+qUMeK0d
	nKkKnPR29iFbphSNbmpe6sXtztzU6MuHlxSKgp1T/lLhFOQB2WyR7Ksk7mB0nxPQ1GoeS+
	Pqw7QvZ2wABRcRih2szizFekNx8KjjzK5RnK4TF9q3jrKst7wZf6R8PoooSv64pkHdtvbR
	XZNNu3z/lHoCF55X48byGow4ZAkg8lKwSsp9rQawfByojVkSOU29fHFSOtpwZi4KDNWB45
	S7EcIsk9U3IgIWdkcBLGxCS23SY2RgA0RHuAKHwaeddE86DvjSYiWjLPLDnuHQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 15 Oct 2026 14:19:01 +0200
Subject: [PATCH v9 05/10] clk: nuvoton: ma35d1: Use device managed helpers
 for fixed rate clocks
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-perso-ma35d1-upstream-clk-v9-5-1f548fa2002e@bootlin.com>
References: <20261015-perso-ma35d1-upstream-clk-v9-0-1f548fa2002e@bootlin.com>
In-Reply-To: <20261015-perso-ma35d1-upstream-clk-v9-0-1f548fa2002e@bootlin.com>
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
 openbmc@lists.ozlabs.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Most of the clocks are already registered with device managed helpers,
except the fixed clocks. Harmonize the driver by using the already
available managed helper for that.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/clk/nuvoton/clk-ma35d1.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/nuvoton/clk-ma35d1.c b/drivers/clk/nuvoton/clk-ma35d1.c
index 75b7e2a84bfd..4a745b169778 100644
--- a/drivers/clk/nuvoton/clk-ma35d1.c
+++ b/drivers/clk/nuvoton/clk-ma35d1.c
@@ -139,9 +139,9 @@ static const struct clk_div_table eadc_div_table[] = {
 	{13, 28}, {14, 30}, {15, 32}, {0, 0},
 };
 
-static struct clk_hw *ma35d1_clk_fixed(const char *name, int rate)
+static struct clk_hw *ma35d1_clk_fixed(struct device *dev, const char *name, int rate)
 {
-	return clk_hw_register_fixed_rate(NULL, name, NULL, 0, rate);
+	return devm_clk_hw_register_fixed_rate(dev, name, NULL, 0, rate);
 }
 
 static struct clk_hw *ma35d1_clk_mux(struct device *dev, const char *name,
@@ -280,24 +280,24 @@ static int ma35d1_clocks_probe(struct platform_device *pdev)
 	 * purposes.
 	 */
 	if (num_clks == 1) {
-		hws[HXT] = ma35d1_clk_fixed("hxt", 24000000);
-		hws[LXT] = ma35d1_clk_fixed("lxt", 32768);
+		hws[HXT] = ma35d1_clk_fixed(dev, "hxt", 24000000);
+		hws[LXT] = ma35d1_clk_fixed(dev, "lxt", 32768);
 	}
 
 	hws[HXT_GATE] = ma35d1_clk_gate_parent_data(dev, "hxt_gate", hxtg_parent_data,
 						    clk_base + REG_CLK_PWRCTL, 0);
 	hws[LXT_GATE] = ma35d1_clk_gate_parent_data(dev, "lxt_gate", lxtg_parent_data,
 						    clk_base + REG_CLK_PWRCTL, 1);
-	hws[HIRC] = ma35d1_clk_fixed("hirc", 12000000);
+	hws[HIRC] = ma35d1_clk_fixed(dev, "hirc", 12000000);
 	hws[HIRC_GATE] = ma35d1_clk_gate(dev, "hirc_gate", "hirc",
 					 clk_base + REG_CLK_PWRCTL, 2);
-	hws[LIRC] = ma35d1_clk_fixed("lirc", 32000);
+	hws[LIRC] = ma35d1_clk_fixed(dev, "lirc", 32000);
 	hws[LIRC_GATE] = ma35d1_clk_gate(dev, "lirc_gate", "lirc",
 					 clk_base + REG_CLK_PWRCTL, 3);
 
 	hws[CAPLL] = ma35d1_reg_clk_pll(dev, CAPLL, pllmode[0], "capll",
 					hws[HXT_GATE], clk_base + REG_CLK_PLL0CTL0);
-	hws[SYSPLL] = ma35d1_clk_fixed("syspll", 180000000);
+	hws[SYSPLL] = ma35d1_clk_fixed(dev, "syspll", 180000000);
 	hws[DDRPLL] = ma35d1_reg_clk_pll(dev, DDRPLL, pllmode[1], "ddrpll",
 					hws[HXT_GATE], clk_base + REG_CLK_PLL2CTL0);
 	hws[APLL] = ma35d1_reg_clk_pll(dev, APLL, pllmode[2], "apll",
@@ -338,8 +338,8 @@ static int ma35d1_clocks_probe(struct platform_device *pdev)
 	hws[PCLK3_DIV4096] = ma35d1_clk_fixed_factor(dev, "pclk3_div4096", "pclk3", 1, 4096);
 	hws[PCLK4_DIV4096] = ma35d1_clk_fixed_factor(dev, "pclk4_div4096", "pclk4", 1, 4096);
 
-	hws[USBPHY0] = ma35d1_clk_fixed("usbphy0", 480000000);
-	hws[USBPHY1] = ma35d1_clk_fixed("usbphy1", 480000000);
+	hws[USBPHY0] = ma35d1_clk_fixed(dev, "usbphy0", 480000000);
+	hws[USBPHY1] = ma35d1_clk_fixed(dev, "usbphy1", 480000000);
 
 	/* DDR */
 	hws[DDR0_GATE] = ma35d1_clk_gate(dev, "ddr0_gate", "ddrpll",

-- 
2.55.0


