Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c00::244; helo=mail-pf0-x244.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="U1/byN1B"; 
 dkim-atps=neutral
Received: from mail-pf0-x244.google.com (mail-pf0-x244.google.com
 [IPv6:2607:f8b0:400e:c00::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41BCFv0dDwzF0mQ
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jun 2018 16:58:10 +1000 (AEST)
Received: by mail-pf0-x244.google.com with SMTP id z24-v6so1041796pfe.7
 for <openbmc@lists.ozlabs.org>; Wed, 20 Jun 2018 23:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=MHiSETwzuPTdordPKGbxY7eJko/dok9Cb1tDdoZJrMs=;
 b=U1/byN1BpW6FFZhfdbXjJwFGg+ruPbI+9SL7S5/FO7heNF4BQhmWFFwstCgeBwTLfS
 n4kj7Qdwg9/Pt90pHThnHz4CPw/d8QAe4MUJmy3sAuCjbao5bCTQt9EQu9IjSOcz6Ch0
 v5UgS74AQiG7eyFkzpxqxnfqvRPKHquP+ch2pYup3MeNygNI234f76r4g4/z9LYXOzv7
 luq+f1jXf03b1bVQZfcnc2Lkbphl6lUKUtJhlpn/p1k3KLTzneeb03KJWnXUNN730ufw
 2p1TnKkGWqPyguTLWbf4YBJPRuYazIBxc0io1/6zx+lbDe9fmkCILLkJdM61BL4C/H/a
 Wi0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=MHiSETwzuPTdordPKGbxY7eJko/dok9Cb1tDdoZJrMs=;
 b=P0sS374cDDrP2UYBdP0XTtVlR1XE4Jezz9q2kSVYf59wHtGebJwJfy9MphKcTz7urq
 Rd0cszOUeJOvKAvMIgrra/NuabLG/mPDz/2+0BFGpQ99IfLDWReMg6xlT7Zbpq+y1mTQ
 UWyh7hfg5zjWZFdiPbNG3uuLDPlbYDD7M2e7Rb2/LhC6LYo41Ro6rBKNvQUEWdKPuPtd
 2fzGGCJjrr+PPo8YuZfv98MjZlZayHlnkm5t0+EtT/YcEX6z0bihvTqjsQfU50e+cBdA
 iAVofv6imBhQeztR/q4dq9AHo1I5TPpFnlLXS9Qe2H6XRpYRCBxv7jABHRcwHlCONmXm
 6IKA==
X-Gm-Message-State: APt69E3mpqSkg6zAo1mJ0R1VtdKJU0Bq04fonCLSYMMaAdYoiznGX5+m
 8RZTUUA2Sw/YKZfJPHJRDpcJfNnH
X-Google-Smtp-Source: ADUXVKIjTkTmwixUX5K5f+oyuL/jHz95fFe0t4x4mbraK5RGxmMHFSXhmYamqzkGrIaxLDoV6+kX3A==
X-Received: by 2002:a63:9d8e:: with SMTP id
 i136-v6mr572890pgd.395.1529564287493; 
 Wed, 20 Jun 2018 23:58:07 -0700 (PDT)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id b74-v6sm8782025pfl.138.2018.06.20.23.58.04
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 20 Jun 2018 23:58:06 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Thu, 21 Jun 2018 16:28:01 +0930
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Cc: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-4.17] clk: aspeed: Support HPLL strapping on ast2400
Date: Thu, 21 Jun 2018 16:27:59 +0930
Message-Id: <20180621065759.21109-1-joel@jms.id.au>
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
X-List-Received-Date: Thu, 21 Jun 2018 06:58:11 -0000

The HPLL can be configured through a register (SCU24), however most
some platforms chose to configure it through the strapping settings and
do not use the register. This was not noticed as the logic for bit 18 in
SCU24 was confused: set means programmed, but the driver read it as set
means strapped.

This gives us the correct HPLL value on Palmetto systems, from which
most of the peripheral clocks are generated.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/clk/clk-aspeed.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
index c17032bc853a..c4770cbb6f32 100644
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
+		/* hpll is configured by the strap register */
+		aspeed_clk_data->hws[ASPEED_CLK_HPLL] = aspeed_ast2400_calc_pll("hpll", val);
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
