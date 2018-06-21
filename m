Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c00::241; helo=mail-pf0-x241.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="HH7+1A3z"; 
 dkim-atps=neutral
Received: from mail-pf0-x241.google.com (mail-pf0-x241.google.com
 [IPv6:2607:f8b0:400e:c00::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41BFbH1SNBzF0wM
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jun 2018 18:43:22 +1000 (AEST)
Received: by mail-pf0-x241.google.com with SMTP id q1-v6so1174409pff.13
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jun 2018 01:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=DENu0OgPiCgW2f8h3wjN2zih8r/3OVgbv0N5NLca8NE=;
 b=HH7+1A3zf5OPNoCGZ1UFJtqqrCrvJ9t+Z4/28tCNOXXUvwKGXhEIfgWrhvesFQlucs
 LGAphXKnsjkmVWLei5J83UdQmFQYZ9O+BAydsob6TAsG2MvG59MASwjMg48wnV3SnbeM
 6NWfCYRsBlNwk5d5OWNENjV2rkJ2haJ978mq+rnPN9QHrZKGKT2hUYR6wAXQdelXAEx3
 IOfP8SCrkHMTM2PlgYuK6e3lvCwFAQXzMaLddGkZsVmwxtR88eTyaywz3SUDSwOXJgij
 0+bUEo8MSNeYAuB26XOI8kznIl4MVOsSC6no4RLDjF4Y+FtWmlFRcvPaXz+sJvISluew
 xf+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=DENu0OgPiCgW2f8h3wjN2zih8r/3OVgbv0N5NLca8NE=;
 b=XKgO8yz6Il3Thdq8uV+vw2fa3pY9AOIWsPqYTQP819vnh0IVXMBspcj5RezJwNx8wa
 ydRpXRG/NeFDaTNqcyqHvAdoDKDrpU0oW/cmPyhgrssYlwM2TcZVeZntDZMxB07naqPR
 nRjojh0AJII0g+W2Z945rNgmBa3X3SOpC02Q8fv3cwWYCy9J9OkUI8wiVNtRjYwb9irx
 znQ8eL/jjg+48UpRggk/NZ7YW64v6KEwwxFHp3vqmEBicsV4yfzFMFRpbRdMRCGN9xe4
 uxYheL+eR7tTxYk3sACS3Z10Tdr5LcOKRriSdJY6m5t2fLhpT8mcpL6z7kWelcFfF6rY
 V2+Q==
X-Gm-Message-State: APt69E2NAymP5mHRnQiNXSuP5bOQkPo1YNzc+ZJr2fx3S+itfQTMPA2b
 W7mISxQhIjostKoFEje/uV4Ds65X
X-Google-Smtp-Source: ADUXVKIgqnEc/akdaxfM/TYRdxTPxT1ekJ2h1eblPmlgM/AYTtbR0MCudFbB8WVjL2QrjNTNakwXwA==
X-Received: by 2002:a62:418b:: with SMTP id
 g11-v6mr26506284pfd.51.1529570599749; 
 Thu, 21 Jun 2018 01:43:19 -0700 (PDT)
Received: from aurora.jms.id.au (pa49-178-2-130.pa.nsw.optusnet.com.au.
 [49.178.2.130])
 by smtp.gmail.com with ESMTPSA id y2-v6sm7909219pfk.82.2018.06.21.01.43.16
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 21 Jun 2018 01:43:18 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Thu, 21 Jun 2018 18:13:13 +0930
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Cc: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-4.17 v3] clk: aspeed: Support HPLL strapping on
 ast2400
Date: Thu, 21 Jun 2018 18:13:10 +0930
Message-Id: <20180621084310.13688-1-joel@jms.id.au>
X-Mailer: git-send-email 2.17.1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Jun 2018 08:43:23 -0000

The HPLL can be configured through a register (SCU24), however some
platforms chose to configure it through the strapping settings and do
not use the register. This was not noticed as the logic for bit 18 in
SCU24 was confused: set means programmed, but the driver read it as set
means strapped.

This gives us the correct HPLL value on Palmetto systems, from which
most of the peripheral clocks are generated.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v2: Fix comment and commit message
v3: Support 25MHz clkin by changing the way the calculations
---
 drivers/clk/clk-aspeed.c | 45 +++++++++++++++++++++++++---------------
 1 file changed, 28 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
index c17032bc853a..5deb246c0184 100644
--- a/drivers/clk/clk-aspeed.c
+++ b/drivers/clk/clk-aspeed.c
@@ -24,7 +24,7 @@
 #define ASPEED_MPLL_PARAM	0x20
 #define ASPEED_HPLL_PARAM	0x24
 #define  AST2500_HPLL_BYPASS_EN	BIT(20)
-#define  AST2400_HPLL_STRAPPED	BIT(18)
+#define  AST2400_HPLL_PROGRAMMED BIT(18)
 #define  AST2400_HPLL_BYPASS_EN	BIT(17)
 #define ASPEED_MISC_CTRL	0x2c
 #define  UART_DIV13_EN		BIT(12)
@@ -565,29 +565,40 @@ builtin_platform_driver(aspeed_clk_driver);
 static void __init aspeed_ast2400_cc(struct regmap *map)
 {
 	struct clk_hw *hw;
-	u32 val, freq, div;
+	u32 val, reg, div, clkin, hpll;
+	const u16 hpll_rates[][4] = {
+		{384, 360, 336, 408},
+		{400, 375, 350, 425},
+	};
+	int rate;
 
 	/*
 	 * CLKIN is the crystal oscillator, 24, 48 or 25MHz selected by
 	 * strapping
 	 */
-	regmap_read(map, ASPEED_STRAP, &val);
-	if (val & CLKIN_25MHZ_EN)
-		freq = 25000000;
-	else if (val & AST2400_CLK_SOURCE_SEL)
-		freq = 48000000;
+	regmap_read(map, ASPEED_STRAP, &reg);
+	rate = (reg >> 8) & 3;
+	if (reg & CLKIN_25MHZ_EN) {
+		clkin = 25000000;
+		hpll = hpll_rates[1][rate];
+	} else if (reg & AST2400_CLK_SOURCE_SEL) {
+		clkin = 48000000;
+		hpll = hpll_rates[0][rate];
+	} else {
+		clkin = 24000000;
+		hpll = hpll_rates[0][rate];
+	}
+	hw = clk_hw_register_fixed_rate(NULL, "clkin", NULL, 0, clkin);
+	pr_debug("clkin @%u MHz\n", clkin / 1000000);
+
+	regmap_read(map, ASPEED_HPLL_PARAM, &reg);
+	if (reg & AST2400_HPLL_PROGRAMMED)
+		hw = aspeed_ast2400_calc_pll("hpll", val);
 	else
-		freq = 24000000;
-	hw = clk_hw_register_fixed_rate(NULL, "clkin", NULL, 0, freq);
-	pr_debug("clkin @%u MHz\n", freq / 1000000);
+		hw = clk_hw_register_fixed_rate(NULL, "hpll", "clkin", 0,
+				hpll * 1000000);
 
-	/*
-	 * High-speed PLL clock derived from the crystal. This the CPU clock,
-	 * and we assume that it is enabled
-	 */
-	regmap_read(map, ASPEED_HPLL_PARAM, &val);
-	WARN(val & AST2400_HPLL_STRAPPED, "hpll is strapped not configured");
-	aspeed_clk_data->hws[ASPEED_CLK_HPLL] = aspeed_ast2400_calc_pll("hpll", val);
+	aspeed_clk_data->hws[ASPEED_CLK_HPLL] = hw;
 
 	/*
 	 * Strap bits 11:10 define the CPU/AHB clock frequency ratio (aka HCLK)
-- 
2.17.1
