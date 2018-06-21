Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c00::244; helo=mail-pf0-x244.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="D7+wIBgc"; 
 dkim-atps=neutral
Received: from mail-pf0-x244.google.com (mail-pf0-x244.google.com
 [IPv6:2607:f8b0:400e:c00::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41BCsc6YSyzDrcd
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jun 2018 17:25:40 +1000 (AEST)
Received: by mail-pf0-x244.google.com with SMTP id r11-v6so1079595pfl.6
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jun 2018 00:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=0D5+Rm3+Jy5KqG1wHvvkKg3Qqv+Pa74p8ZjZ7cM1F9k=;
 b=D7+wIBgcANtDSj/oigtXXc6gJTznFG9hOSIlm4YqoDPxOJ7PH0Lmp64Amat9Sicx6J
 FeJ7mOU7jJyjjKH46CINqWJe0iqbCrGPHYehOO1nEIOoQBPR1yFKeuBSQBA8Lp/d7Ccw
 Mo+KMBVGDYRYsjfVwRc5y0+Fp55dIlB9GrVIyJfTkL2bDoZ/2PLxebDMCHxhAB3ewETm
 3g4ric/bwBC36BsqXDg/SwM6bJaWbxHG6CNddUnBkKn2XSSPFt0w+ribshNCy5jQWg5K
 Qwhg2j3DZrWPkxXffV1y4do0g2UfjDS2DE9Al3x1a6KjYDozt2QmcWdpSfgn20HKg2EH
 o2YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=0D5+Rm3+Jy5KqG1wHvvkKg3Qqv+Pa74p8ZjZ7cM1F9k=;
 b=SL+Y6LNx2JVVfzyP3s2fUTurWTrHh7wVKNz1Usf6m08pF/FroaC5ritc2rDQ5TIXmF
 WySyXdIhD1yW96JPuGwUrFsHlqBLbPB263yXkAfjWAgvfyPM0RtB9DInbkHNpetcV/Si
 tioednMfw211hhnyfWq2Nw3pYgDwBYJT9e7LAmkuYBwd6ztSeBHt9L8WVf51Hu/S6M9D
 TUN+6e11yjUfpViapaVVRItqwF5CLYpIiM9WesY+u8YudMJj9YKh/y6PKklOc74RA+sX
 5HcsPtCzzqPvQQ5UqhOeDfR+LYGpUQ3SP/1vI0g567Y+3zs6Y0Yg5Ukd4+Qn7iA7yu63
 3ksw==
X-Gm-Message-State: APt69E0KsbZcaUlTpA6wHvPjDc2yemCpRnV927HcuJD+qkIM3mRg9w4D
 ieW3PD+WSdAF0JTw71uLeaX7g2cH
X-Google-Smtp-Source: ADUXVKKCiV0ryvKaxrHpmABFBdDg/fV7/GjsX4MiR/D9vYXyNfl+R4filSrs5iIlYcGCctnK96WS8w==
X-Received: by 2002:a65:4e09:: with SMTP id
 r9-v6mr6117909pgt.369.1529565938128; 
 Thu, 21 Jun 2018 00:25:38 -0700 (PDT)
Received: from aurora.jms.id.au (pa49-178-2-130.pa.nsw.optusnet.com.au.
 [49.178.2.130])
 by smtp.gmail.com with ESMTPSA id p3-v6sm5311807pga.72.2018.06.21.00.25.34
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 21 Jun 2018 00:25:37 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Thu, 21 Jun 2018 16:55:30 +0930
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Cc: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-4.17 v2] clk: aspeed: Support HPLL strapping on
 ast2400
Date: Thu, 21 Jun 2018 16:55:25 +0930
Message-Id: <20180621072525.23832-1-joel@jms.id.au>
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
X-List-Received-Date: Thu, 21 Jun 2018 07:25:41 -0000

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
---
 drivers/clk/clk-aspeed.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
index c17032bc853a..7d8cc412959d 100644
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
@@ -586,8 +586,24 @@ static void __init aspeed_ast2400_cc(struct regmap *map)
 	 * and we assume that it is enabled
 	 */
 	regmap_read(map, ASPEED_HPLL_PARAM, &val);
-	WARN(val & AST2400_HPLL_STRAPPED, "hpll is strapped not configured");
-	aspeed_clk_data->hws[ASPEED_CLK_HPLL] = aspeed_ast2400_calc_pll("hpll", val);
+	if (val & AST2400_HPLL_PROGRAMMED) {
+		aspeed_clk_data->hws[ASPEED_CLK_HPLL] =
+			aspeed_ast2400_calc_pll("hpll", val);
+	} else {
+		/* hpll is configured by the strap register */
+		regmap_read(map, ASPEED_STRAP, &val);
+		val = (val >> 8) & 0x3;
+		if (val == 0x00)
+			freq = 384000000;
+		else if (val == 0x01)
+			freq = 360000000;
+		else if (val == 0x02)
+			freq = 336000000;
+		else if (val == 0x03)
+			freq = 408000000;
+		aspeed_clk_data->hws[ASPEED_CLK_HPLL] =
+			clk_hw_register_fixed_rate(NULL, "hpll", "clkin", 0, freq);
+	}
 
 	/*
 	 * Strap bits 11:10 define the CPU/AHB clock frequency ratio (aka HCLK)
-- 
2.17.1
