Return-Path: <maxims@google.com>
Received: from mail-pg0-x22c.google.com (mail-pg0-x22c.google.com
 [IPv6:2607:f8b0:400e:c05::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vkhcz2VtFzDqYf
 for <openbmc@lists.ozlabs.org>; Fri, 17 Mar 2017 08:36:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="tBFp1m/8"; 
 dkim-atps=neutral
Received: by mail-pg0-x22c.google.com with SMTP id 141so31060006pgd.1
 for <openbmc@lists.ozlabs.org>; Thu, 16 Mar 2017 14:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=gWmK54AhHgdf9h3tHZgWy2HPSpQV8DfvF8tO7CeXGI0=;
 b=tBFp1m/8kMj3XMNuY5wBsiYDOg7GaKioD2Bjv+1YtA2Xh4tj23kdmKD3yDPt0sORHM
 rfsSRkf3FSjFijeOuqnTZhmghGeo7bGVXbQP2hzOMC9FuWzaOsq9iWIBZDkM4ZJ1Cx/v
 l3BiyXk3CFHv1U4UxMEgRvFc97S1gz42F+8PObYRdkxHwtAGwntWpvB+G645kzONWD3K
 YRuxXG0bBZYsIYlraK1VfVm3gLUftmCcVwRMEe76ptVRfLsgfa5TNHgA64pBWn6KGIU7
 LENO9U3uzTYXrTUOqvMu/v71WuK9d/f8mGj3UlAW/9L7LgyeYDGaLhgw/RzikOJ6cTMD
 raFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=gWmK54AhHgdf9h3tHZgWy2HPSpQV8DfvF8tO7CeXGI0=;
 b=YOP2WXX1Ysg3Mjy36hm8n7Z5BP1ZtagbhfHX6qF3vKwPAoYqFRexW4pS16cops+Grz
 hZas7GpWzUgpjO4NU6pX02hhli8Qps6eaRnTPYhuo97Xa2oLAUzbxMwScDcKeBtLCE9X
 YlOYn938jVlGeSgJO/rcaQspbDWd5MiQxNeplHibPSutoTgcQKkbaWwiUXwyyog85DA2
 N3rj6V7hdQFHSHwQ8AYxKa7gTHgajU128ArHDnfqyisQAgMiLkldcPGK2gQt2f6/W9B9
 eT23N45NGX7CcjmG0bWbrayIKGQgTP1j2jNyQMgQywewzDPaq8X56QQ+dy8xO1pTCOvD
 q6ag==
X-Gm-Message-State: AFeK/H1pD3Us9KMPJWheTCvBVFzfnULHzD9Doc7AHP710sz0Oyxnir3oe9cWdkMyXydrG+6l
X-Received: by 10.84.199.170 with SMTP id r39mr15005228pld.144.1489700209571; 
 Thu, 16 Mar 2017 14:36:49 -0700 (PDT)
Received: from mxsl.svl.corp.google.com ([100.123.242.80])
 by smtp.gmail.com with ESMTPSA id v17sm2191375pgc.20.2017.03.16.14.36.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 16 Mar 2017 14:36:49 -0700 (PDT)
From: Maxim Sloyko <maxims@google.com>
To: u-boot@lists.denx.de,
	Simon Glass <sjg@chromium.org>
Cc: openbmc@lists.ozlabs.org, Maxim Sloyko <maxims@google.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>
Subject: [PATCH 14/17] aspeed: Refactor SCU to use consistent mask & shift
Date: Thu, 16 Mar 2017 14:36:21 -0700
Message-Id: <20170316213624.140344-15-maxims@google.com>
X-Mailer: git-send-email 2.12.0.367.g23dc2f6d3c-goog
In-Reply-To: <20170316213624.140344-1-maxims@google.com>
References: <20170316213624.140344-1-maxims@google.com>
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
X-List-Received-Date: Thu, 16 Mar 2017 21:36:51 -0000

Refactor SCU header to use consistent Mask & Shift values.
Now, consistently, to read value from SCU register, mask needs
to be applied before shift.

Signed-off-by: Maxim Sloyko <maxims@google.com>
---

 arch/arm/include/asm/arch-aspeed/scu_ast2500.h | 12 ++++----
 arch/arm/mach-aspeed/ast2500/sdram_ast2500.c   |  5 ++--
 drivers/clk/aspeed/clk_ast2500.c               | 39 +++++++++++++-------------
 3 files changed, 27 insertions(+), 29 deletions(-)

diff --git a/arch/arm/include/asm/arch-aspeed/scu_ast2500.h b/arch/arm/include/asm/arch-aspeed/scu_ast2500.h
index fe877b5430..590aed2f6c 100644
--- a/arch/arm/include/asm/arch-aspeed/scu_ast2500.h
+++ b/arch/arm/include/asm/arch-aspeed/scu_ast2500.h
@@ -8,8 +8,8 @@
 
 #define SCU_UNLOCK_VALUE		0x1688a8a8
 
-#define SCU_HWSTRAP_VGAMEM_MASK		3
 #define SCU_HWSTRAP_VGAMEM_SHIFT	2
+#define SCU_HWSTRAP_VGAMEM_MASK		(3 << SCU_HWSTRAP_VGAMEM_SHIFT)
 #define SCU_HWSTRAP_MAC1_RGMII		(1 << 6)
 #define SCU_HWSTRAP_MAC2_RGMII		(1 << 7)
 #define SCU_HWSTRAP_DDR4		(1 << 24)
@@ -18,17 +18,17 @@
 #define SCU_MPLL_DENUM_SHIFT		0
 #define SCU_MPLL_DENUM_MASK		0x1f
 #define SCU_MPLL_NUM_SHIFT		5
-#define SCU_MPLL_NUM_MASK		0xff
+#define SCU_MPLL_NUM_MASK		(0xff << SCU_MPLL_NUM_SHIFT)
 #define SCU_MPLL_POST_SHIFT		13
-#define SCU_MPLL_POST_MASK		0x3f
+#define SCU_MPLL_POST_MASK		(0x3f << SCU_MPLL_POST_SHIFT)
 #define SCU_PCLK_DIV_SHIFT		23
-#define SCU_PCLK_DIV_MASK		7
+#define SCU_PCLK_DIV_MASK		(7 << SCU_PCLK_DIV_SHIFT)
 #define SCU_HPLL_DENUM_SHIFT		0
 #define SCU_HPLL_DENUM_MASK		0x1f
 #define SCU_HPLL_NUM_SHIFT		5
-#define SCU_HPLL_NUM_MASK		0xff
+#define SCU_HPLL_NUM_MASK		(0xff << SCU_HPLL_NUM_SHIFT)
 #define SCU_HPLL_POST_SHIFT		13
-#define SCU_HPLL_POST_MASK		0x3f
+#define SCU_HPLL_POST_MASK		(0x3f << SCU_HPLL_POST_SHIFT)
 
 #define SCU_MACCLK_SHIFT		16
 #define SCU_MACCLK_MASK			(7 << SCU_MACCLK_SHIFT)
diff --git a/arch/arm/mach-aspeed/ast2500/sdram_ast2500.c b/arch/arm/mach-aspeed/ast2500/sdram_ast2500.c
index efcf452b17..6383f727f2 100644
--- a/arch/arm/mach-aspeed/ast2500/sdram_ast2500.c
+++ b/arch/arm/mach-aspeed/ast2500/sdram_ast2500.c
@@ -183,9 +183,8 @@ static int ast2500_sdrammc_ddr4_calibrate_vref(struct dram_info *info)
 static size_t ast2500_sdrammc_get_vga_mem_size(struct dram_info *info)
 {
 	size_t vga_mem_size_base = 8 * 1024 * 1024;
-	u32 vga_hwconf = (readl(&info->scu->hwstrap)
-			  >> SCU_HWSTRAP_VGAMEM_SHIFT)
-			& SCU_HWSTRAP_VGAMEM_MASK;
+	u32 vga_hwconf = (readl(&info->scu->hwstrap) & SCU_HWSTRAP_VGAMEM_MASK)
+	    >> SCU_HWSTRAP_VGAMEM_SHIFT;
 
 	return vga_mem_size_base << vga_hwconf;
 }
diff --git a/drivers/clk/aspeed/clk_ast2500.c b/drivers/clk/aspeed/clk_ast2500.c
index 7b4b5c64ac..ccf47a1da1 100644
--- a/drivers/clk/aspeed/clk_ast2500.c
+++ b/drivers/clk/aspeed/clk_ast2500.c
@@ -52,11 +52,11 @@ struct ast2500_div_config {
  */
 static ulong ast2500_get_mpll_rate(ulong clkin, u32 mpll_reg)
 {
-	const ulong num = (mpll_reg >> SCU_MPLL_NUM_SHIFT) & SCU_MPLL_NUM_MASK;
-	const ulong denum = (mpll_reg >> SCU_MPLL_DENUM_SHIFT)
-			& SCU_MPLL_DENUM_MASK;
-	const ulong post_div = (mpll_reg >> SCU_MPLL_POST_SHIFT)
-			& SCU_MPLL_POST_MASK;
+	const ulong num = (mpll_reg & SCU_MPLL_NUM_MASK) >> SCU_MPLL_NUM_SHIFT;
+	const ulong denum = (mpll_reg & SCU_MPLL_DENUM_MASK)
+			>> SCU_MPLL_DENUM_SHIFT;
+	const ulong post_div = (mpll_reg & SCU_MPLL_POST_MASK)
+			>> SCU_MPLL_POST_SHIFT;
 
 	return (clkin * ((num + 1) / (denum + 1))) / (post_div + 1);
 }
@@ -67,11 +67,11 @@ static ulong ast2500_get_mpll_rate(ulong clkin, u32 mpll_reg)
  */
 static ulong ast2500_get_hpll_rate(ulong clkin, u32 hpll_reg)
 {
-	const ulong num = (hpll_reg >> SCU_HPLL_NUM_SHIFT) & SCU_HPLL_NUM_MASK;
-	const ulong denum = (hpll_reg >> SCU_HPLL_DENUM_SHIFT)
-			& SCU_HPLL_DENUM_MASK;
-	const ulong post_div = (hpll_reg >> SCU_HPLL_POST_SHIFT)
-			& SCU_HPLL_POST_MASK;
+	const ulong num = (hpll_reg & SCU_HPLL_NUM_MASK) >> SCU_HPLL_NUM_SHIFT;
+	const ulong denum = (hpll_reg & SCU_HPLL_DENUM_MASK)
+			>> SCU_HPLL_DENUM_SHIFT;
+	const ulong post_div = (hpll_reg & SCU_HPLL_POST_MASK)
+			>> SCU_HPLL_POST_SHIFT;
 
 	return (clkin * ((num + 1) / (denum + 1))) / (post_div + 1);
 }
@@ -136,11 +136,11 @@ static ulong ast2500_clk_get_rate(struct clk *clk)
 	case BCLK_PCLK:
 		{
 			ulong apb_div = 4 + 4 * ((readl(&priv->scu->clk_sel1)
-						  >> SCU_PCLK_DIV_SHIFT) &
-						 SCU_PCLK_DIV_MASK);
+						  & SCU_PCLK_DIV_MASK)
+						 >> SCU_PCLK_DIV_SHIFT);
 			rate = ast2500_get_hpll_rate(clkin,
-						     readl(&priv->scu->
-							   h_pll_param));
+						     readl(&priv->
+							   scu->h_pll_param));
 			rate = rate / apb_div;
 		}
 		break;
@@ -223,17 +223,16 @@ static ulong ast2500_configure_ddr(struct ast2500_scu *scu, ulong rate)
 	ulong clkin = ast2500_get_clkin(scu);
 	u32 mpll_reg;
 	struct ast2500_div_config div_cfg = {
-		.num = SCU_MPLL_NUM_MASK,
-		.denum = SCU_MPLL_DENUM_MASK,
-		.post_div = SCU_MPLL_POST_MASK
+		.num = (SCU_MPLL_NUM_MASK >> SCU_MPLL_NUM_SHIFT),
+		.denum = (SCU_MPLL_DENUM_MASK >> SCU_MPLL_DENUM_SHIFT),
+		.post_div = (SCU_MPLL_POST_MASK >> SCU_MPLL_POST_SHIFT),
 	};
 
 	ast2500_calc_clock_config(clkin, rate, &div_cfg);
 
 	mpll_reg = readl(&scu->m_pll_param);
-	mpll_reg &= ~((SCU_MPLL_POST_MASK << SCU_MPLL_POST_SHIFT)
-		      | (SCU_MPLL_NUM_MASK << SCU_MPLL_NUM_SHIFT)
-		      | (SCU_MPLL_DENUM_MASK << SCU_MPLL_DENUM_SHIFT));
+	mpll_reg &= ~(SCU_MPLL_POST_MASK | SCU_MPLL_NUM_MASK
+		      | SCU_MPLL_DENUM_MASK);
 	mpll_reg |= (div_cfg.post_div << SCU_MPLL_POST_SHIFT)
 	    | (div_cfg.num << SCU_MPLL_NUM_SHIFT)
 	    | (div_cfg.denum << SCU_MPLL_DENUM_SHIFT);
-- 
2.12.0.367.g23dc2f6d3c-goog
