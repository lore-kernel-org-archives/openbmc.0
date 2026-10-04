Return-Path: <openbmc+bounces-2718-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A81CA5FF0
	for <openbmc@archiver.kernel.org>; Sun,  4 Oct 2026 22:50:15 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hyd4Q73RFz30Vm;
	Mon, 05 Oct 2026 09:49:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1791146784;
	cv=none; b=a8lIOYpdMXob6KaLiXHwNAo1+lYB33lrjCCq6GOuwErwpKBLVHFuepKCcwO/+FPmiBXHHF2YfnRhQFs+EUU0UuotY+xTwqMFmwszq5+UIbaT0tEpD2NbJpazZ8BW+Y7PqXgQ0RVdibfFbX5zZvda/hpL9I7tiigoPAas65hP247/sc8z8KzkvvxRIIGoOUgtO9L2o71ihNPGw2i5dVloiE9odomedXLTFpSItX10wfyhE17diu37In2/Wo6XQ1pjqwhoR35bZ538M8JaJlHd9N7DDguk7Wog++/GDCkKJ8tMqvh49Ke3H1xOyKvW7O3isHeDu/4724ETv5B6qR+hlw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1791146784; c=relaxed/relaxed;
	bh=+GKffwsO+c5ETKK/qbfp1JDLsWqkkHurmkQYgTKE+vk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W3L2b+L9NHCDMjXZ+kRMJJtIVaLdDCI6P6Fgqi6tBD36GjzLCP7bPgIxTqzwTc3ongcdZys6G8Er97U6/8kJOl1kenbW4VzxAxauEb86mg+x72dSYt6ijnrvDLcb+f2TwnnvysMthXGo5F1gti1dBPI5UtWdpHei87VKHKPUs5Rh0LWhHGWdZtqbsnqIvFQW0Lpz5WUgZuXSV3wjXvqSihHWYnfJT0U8VM2k26Ko+IBInviSAM/86+bqtT3fvrtxsWHvZ6fCFAu8j+LALF76NB0TbMH/++rq2f1VoeF8S40Ynjb9vIeFSBdCQ73jl+ap9SQu8c6TiUeUDzKnE+LuWw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=n42Yrdm4; dkim-atps=neutral; spf=pass (client-ip=185.246.85.4; helo=smtpout-03.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=n42Yrdm4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.246.85.4; helo=smtpout-03.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hyZLR4JHhz2xlw
	for <openbmc@lists.ozlabs.org>; Mon, 05 Oct 2026 07:46:23 +1100 (AEDT)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A1C1F4E41168;
	Sun,  4 Oct 2026 20:46:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 74907604FE;
	Sun,  4 Oct 2026 20:46:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4C80D1032820F;
	Sun,  4 Oct 2026 22:46:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791146778; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+GKffwsO+c5ETKK/qbfp1JDLsWqkkHurmkQYgTKE+vk=;
	b=n42Yrdm4XoSHSgtNKT979pusxmDhkqBBgskw5DF51yNdsx3pjpmbw/dJLlrk+Re9px8rBu
	9bnho7/TiB4bF87TnkZuF7dCVhVUTLKmRA6cdD/+rDiqb3X2QR3JUgbNtGBwk95SQWEBce
	o8Kimh1Qf9DKzqo2BCuJ52x2CG+gVHr5lzrLy0Bdjl7FmUOrP/vsDTmv94TMCYtct3Jiz3
	bqwCDRvobguMWnCXXnkjvfbvV2jOsta2K5Ej02WO9mINIdvCPA+I1wzZQUtGstcZ2T8fEz
	MrWq0objejd4z2UPvTdV7TVQqb3dLEsDEjQG1FuTlgwzrzyeqvwfVX/X28Q+Iw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Sun, 04 Oct 2026 22:45:27 +0200
Subject: [PATCH v8 3/7] clk: nuvoton: ma35d1: Retrieve HXT/LXT from DT when
 possible
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
Message-Id: <20261004-perso-ma35d1-upstream-clk-v8-3-e1a106a128c0@bootlin.com>
References: <20261004-perso-ma35d1-upstream-clk-v8-0-e1a106a128c0@bootlin.com>
In-Reply-To: <20261004-perso-ma35d1-upstream-clk-v8-0-e1a106a128c0@bootlin.com>
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

HXT and LXT are crystal oscillator inputs of the clock controller. As
such, they are external clock sources which should not be registered by
this driver.

HXT is already described in the DT, but is not named. In order to point
to this parent from its direct child which is HXT_GATE, we must provide
a fw_name (when it is named, new DTs) and a .name (for when it's not
named, but the fixed clock node name is used).

LXT is missing in old DTs, so we must create that clock and register it
for backward compatibility reasons. It should however be described and
pointed at in updated DTs.

describe LXT at all, we assume that HXT must be present, and fallback to
creating a fixed clock for LXT if it is not described (for backward
compatibility purposes).

Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
Cc: stable@vger.kernel.org
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/clk/nuvoton/clk-ma35d1.c | 37 ++++++++++++++++++++++++++++++-------
 1 file changed, 30 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/nuvoton/clk-ma35d1.c b/drivers/clk/nuvoton/clk-ma35d1.c
index ceebcbd8c18b..ed61a990870e 100644
--- a/drivers/clk/nuvoton/clk-ma35d1.c
+++ b/drivers/clk/nuvoton/clk-ma35d1.c
@@ -65,6 +65,14 @@ static DEFINE_SPINLOCK(ma35d1_lock);
 
 #define MA35D1_MUX_MAX_PARENTS	10
 
+static const struct clk_parent_data hxtg_parent_data[] = {
+	{ .fw_name = "hxt", .name = "clk_hxt" },
+};
+
+static const struct clk_parent_data lxtg_parent_data[] = {
+	{ .fw_name = "lxt", .name = "lxt" },
+};
+
 /* Mux parent selection, by index into the controller's clock table */
 static const int ca35clk_parent_idx[] = { HXT, CAPLL, DDRPLL };
 static const int sysclk0_parent_idx[] = { EPLL_DIV2, SYSPLL };
@@ -191,6 +199,15 @@ static struct clk_hw *ma35d1_clk_gate(struct device *dev, const char *name, cons
 				    reg, shift, 0, &ma35d1_lock);
 }
 
+static struct clk_hw *ma35d1_clk_gate_parent_data(struct device *dev, const char *name,
+						  const struct clk_parent_data *parent_data,
+						  void __iomem *reg, u8 shift)
+{
+	return devm_clk_hw_register_gate_parent_data(dev, name, parent_data,
+						     CLK_SET_RATE_PARENT,
+						     reg, shift, 0, &ma35d1_lock);
+}
+
 static int ma35d1_get_pll_setting(struct device_node *clk_node, u32 *pllmode)
 {
 	const char *of_str;
@@ -219,7 +236,7 @@ static int ma35d1_clocks_probe(struct platform_device *pdev)
 	static struct clk_hw **hws;
 	static struct clk_hw_onecell_data *ma35d1_hw_data;
 	u32 pllmode[PLL_MAX_NUM];
-	int ret;
+	int ret, num_clks;
 
 	ma35d1_hw_data = devm_kzalloc(dev,
 				      struct_size(ma35d1_hw_data, hws, MA35D1_CLK_COUNT),
@@ -240,12 +257,18 @@ static int ma35d1_clocks_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	hws[HXT] = ma35d1_clk_fixed("hxt", 24000000);
-	hws[HXT_GATE] = ma35d1_clk_gate(dev, "hxt_gate", "hxt",
-					clk_base + REG_CLK_PWRCTL, 0);
-	hws[LXT] = ma35d1_clk_fixed("lxt", 32768);
-	hws[LXT_GATE] = ma35d1_clk_gate(dev, "lxt_gate", "lxt",
-					clk_base + REG_CLK_PWRCTL, 1);
+	num_clks = of_clk_get_parent_count(clk_node);
+	if (num_clks < 1 || num_clks > 2)
+		return -EINVAL;
+
+	/* Old DTs do not describe the low-speed crystal */
+	if (num_clks == 1)
+		hws[LXT] = ma35d1_clk_fixed("lxt", 32768);
+
+	hws[HXT_GATE] = ma35d1_clk_gate_parent_data(dev, "hxt_gate", hxtg_parent_data,
+						    clk_base + REG_CLK_PWRCTL, 0);
+	hws[LXT_GATE] = ma35d1_clk_gate_parent_data(dev, "lxt_gate", lxtg_parent_data,
+						    clk_base + REG_CLK_PWRCTL, 1);
 	hws[HIRC] = ma35d1_clk_fixed("hirc", 12000000);
 	hws[HIRC_GATE] = ma35d1_clk_gate(dev, "hirc_gate", "hirc",
 					 clk_base + REG_CLK_PWRCTL, 2);

-- 
2.55.0


