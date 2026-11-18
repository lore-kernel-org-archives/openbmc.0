Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831B9606A32F
	for <openbmc@archiver.kernel.org>; Wed, 18 Nov 2026 22:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=WtQ6BEBh
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jVGgX5p2zz30Vr;
	Thu, 19 Nov 2026 09:37:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1795009114;
	cv=none; b=JCrEQ7p5b6CVhI4x6tGac3bKyGdSvyMXW728x5cNg5H/j8+6oGG1OQwu21jymW4cJ3FltNeifny5eskEyi3+eA56oYFOjCTJhCI9+6WrOCrV5vNk0KSC9jJGIf5IQAAC5lQToxhI+oepmcy8x9G5Wx8fqgLyuyILgmK8shZf+ax+oiurEpMYdghZWIWd7dnP4U4MzETTfv3uGrgvhzdbB2mE8b1Bk9S3sRx3ixeePWBMpFH0x1gLliSDr0oAsnEEFAjnkDhHx04yi4M1QKJbm0IvLDgRs1jIEQgVOGFpmfp0AJOmaXkpC4DrGHUowJ/vh1ByXyd7Es4NHVrVohafvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1795009114; c=relaxed/relaxed;
	bh=tRoiMPf7bc7glgn8sxiDt2fd8OqUIkdqotnoRF5JNCg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H3sdetp5L+zImOYOpSg+op4sXb5ppPNmFRn2E0+/M2cM2b6lrgalRRBBOclS82UhX1AvRjBXeq20Cxm8SkSdYdlYsgJTXDr+V8TURqGR48a2jH8kooaicjied7/CAUNkT/2NIDh1BIZ3VOiJ8zAE43VPlLrk2C6FRnqQ/9iJUNg0FrpWNHbKLDafwRprtTj1W0sYtZNx6D9AHyOLQ9WSU1S3i0Y0VTS6IrTI0BfO3SwmLBYMTL10mIlIH1Zos2UdJZdY6BkjEi+luCUiMwiLlj/VO7zIEDe/TZTpbc0Tlc18JshizL502dREKITDrm9ZECPVAiEikgBS7Qjtj2LXvA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=WtQ6BEBh; dkim-atps=neutral; spf=pass (client-ip=185.171.202.116; helo=smtpout-04.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=WtQ6BEBh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.171.202.116; helo=smtpout-04.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jV2k21LXDz2xL4
	for <openbmc@lists.ozlabs.org>; Thu, 19 Nov 2026 00:38:34 +1100 (AEDT)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4E8ABC4F77E;
	Wed, 18 Nov 2026 13:38:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 768B55FE9B;
	Wed, 18 Nov 2026 13:38:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 811BD11BC1FF3;
	Wed, 18 Nov 2026 14:38:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795009109; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=tRoiMPf7bc7glgn8sxiDt2fd8OqUIkdqotnoRF5JNCg=;
	b=WtQ6BEBhdGQ4Wt3gDfXBZLiEJKbVeKUy1I+YDYe9za9XuSECKqmAQiePKNvZWDALgAoSTN
	uqUeYs1PTi/Jn0HXbVipAPayC8QcwJTbpYd2AGwIbKAAa+z4V9MqtLY6OrBiEWZxKZgt+b
	c2v3WU+hl1c36CXmoc1e72uRyfGc2nNyK2GrOQZURFOH8lY0qoejkzC3zQ67MlkJPjfSgp
	XwMCyhhvvEDLXWZhWCRR1IpXtKWwbMMbS0oOHI2oKB4La6SnO9IysRokaldbCZD7s89mlt
	hv5XQIJkvEa2YOqIsgefHC7Vlfo9fdNK3CtguxPQCKZyM7tFiHjutEDWXAbkAg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 18 Nov 2026 14:37:15 +0100
Subject: [PATCH v11 08/10] clk: nuvoton: ma35d1: Reparent SYSPLL correctly
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
Message-Id: <20261118-perso-ma35d1-upstream-clk-v11-8-bd1d1e060926@bootlin.com>
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

The clock tree is still incorrect. SYSPLL is derived from HXT_GATE, very
much like CAPLL, DDRPLL, VPLL, APLL and EPLL. SYSPLL has a fixed
frequency, but if HXT gets gated, SYSPLL stops running.

Reparent SYSPLL under HXT_GATE to properly define the clock tree
topology. After this change, the frequencies are identical, but the
clock tree looks (again) much closer to the reality.

Since the TRM does not explicitly shows that HIRC and LIRC are
internally sourced from HXT and LXT, respectively, I haven't reparented
them (even though that was tempting). This can be done later anyway.

Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
Cc: stable@vger.kernel.org
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/clk/nuvoton/clk-ma35d1.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/nuvoton/clk-ma35d1.c b/drivers/clk/nuvoton/clk-ma35d1.c
index 8fab3c563316..3015c49ee852 100644
--- a/drivers/clk/nuvoton/clk-ma35d1.c
+++ b/drivers/clk/nuvoton/clk-ma35d1.c
@@ -139,6 +139,12 @@ static const struct clk_div_table eadc_div_table[] = {
 	{13, 28}, {14, 30}, {15, 32}, {0, 0},
 };
 
+static struct clk_hw *ma35d1_clk_fixed_parent_hw(struct device *dev, const char *name, int rate,
+						 const struct clk_hw *parent_hw)
+{
+	return devm_clk_hw_register_fixed_rate_parent_hw(dev, name, parent_hw, 0, rate);
+}
+
 static struct clk_hw *ma35d1_clk_fixed(struct device *dev, const char *name, int rate)
 {
 	return devm_clk_hw_register_fixed_rate(dev, name, NULL, 0, rate);
@@ -286,6 +292,9 @@ static int ma35d1_clocks_probe(struct platform_device *pdev)
 
 	hws[HXT_GATE] = ma35d1_clk_gate_parent_data(dev, "hxt_gate", hxtg_parent_data,
 						    clk_base + REG_CLK_PWRCTL, 0);
+	if (IS_ERR(hws[HXT_GATE]))
+		return PTR_ERR(hws[HXT_GATE]);
+
 	hws[LXT_GATE] = ma35d1_clk_gate_parent_data(dev, "lxt_gate", lxtg_parent_data,
 						    clk_base + REG_CLK_PWRCTL, 1);
 	hws[HIRC] = ma35d1_clk_fixed(dev, "hirc", 12000000);
@@ -297,7 +306,7 @@ static int ma35d1_clocks_probe(struct platform_device *pdev)
 
 	hws[CAPLL] = ma35d1_reg_clk_pll(dev, CAPLL, pllmode[0], "capll",
 					hws[HXT_GATE], clk_base + REG_CLK_PLL0CTL0);
-	hws[SYSPLL] = ma35d1_clk_fixed(dev, "syspll", 180000000);
+	hws[SYSPLL] = ma35d1_clk_fixed_parent_hw(dev, "syspll", 180000000, hws[HXT_GATE]);
 	hws[DDRPLL] = ma35d1_reg_clk_pll(dev, DDRPLL, pllmode[1], "ddrpll",
 					hws[HXT_GATE], clk_base + REG_CLK_PLL2CTL0);
 	hws[APLL] = ma35d1_reg_clk_pll(dev, APLL, pllmode[2], "apll",

-- 
2.56.0


