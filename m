Return-Path: <maxims@google.com>
Received: from mail-pg0-x22f.google.com (mail-pg0-x22f.google.com
 [IPv6:2607:f8b0:400e:c05::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w6HfY14K6zDq9H
 for <openbmc@lists.ozlabs.org>; Tue, 18 Apr 2017 05:01:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Y81MD95K"; 
 dkim-atps=neutral
Received: by mail-pg0-x22f.google.com with SMTP id 63so15917870pgh.0
 for <openbmc@lists.ozlabs.org>; Mon, 17 Apr 2017 12:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=iUDFyZsiZnrqFbqLh4cC68sgmabHX8yiSkPRtxrJnY8=;
 b=Y81MD95KMoPtZJ8DVfDGDq6mU6lE/ujwGlyUJkZ5J8AGzMTGcOUkM+7H7y7LG4VLW7
 rGZioO1MZ9cXHDt5J27cmuJs1VEqLET2k4AyZYCovRBYGCjsLfAj2dRC5gOtcvFjsKGj
 +xJRLY3iEme1avj1hgO45wBGqL1DHa5coJKX4ekL4fgbrlle/KB+BFNYR0wkOd/Ggv0G
 hhwbcsCwMCR28ITYLvgY+NzrcQLx9w8flZVemGVpCykMH+EKjvUjyZVrF6v1SToK+2P9
 6tQSMPdGNmKoAN8JMHOSdf6aZKXWCMiLHE+ZpAEDf5mvrzvJiMy+YMKl9jbLt64aFLvD
 yN6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=iUDFyZsiZnrqFbqLh4cC68sgmabHX8yiSkPRtxrJnY8=;
 b=H/HuWnEqtoxbMHCecUIUIIAivkUJPbghLHXVqR0fxQ5d+ZpX4jrWXUYbnqd0UMnN0k
 1sMer8Q+ZVkV/JJdv5aIxX09njqLtEsOrYnJ0HFvcG16IXQgyMB7V68dFYwr1g7E+shq
 tzo8EPB8nl79i14oj0bPaszyuzabsWr77WNa4KuZtOUN2VXH2lajHtdXuPHP3hjoF3ux
 hd0KEYi7qefl/fBw8xr769ub9/ogdJEdEZhPmjX7fQ39KNoXZ0Y08CfMEx6IWrmKbNfD
 rRuKCmZkyJKP4opiCjIo7yMseeRaF0wyL9ye8RR7MxOFIgvGpW96ji6B149il1cnZnK9
 dQ3Q==
X-Gm-Message-State: AN3rC/6WYtPq21C7TcCfTrP+eoglY/+wJq11gYIQ7PUz4lzjzok6NfHr
 G8Zv9IUiQ2DavSRChknXug==
X-Received: by 10.98.184.18 with SMTP id p18mr12959898pfe.45.1492455667090;
 Mon, 17 Apr 2017 12:01:07 -0700 (PDT)
Received: from mxsl.svl.corp.google.com ([100.123.242.80])
 by smtp.gmail.com with ESMTPSA id p80sm19526121pfk.50.2017.04.17.12.01.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 17 Apr 2017 12:01:06 -0700 (PDT)
From: Maxim Sloyko <maxims@google.com>
To: u-boot@lists.denx.de,
	Simon Glass <sjg@chromium.org>
Cc: openbmc@lists.ozlabs.org, Maxim Sloyko <maxims@google.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>
Subject: [PATCH v1 14/15] aspeed: Refactor SCU to use consistent mask & shift
Date: Mon, 17 Apr 2017 12:00:33 -0700
Message-Id: <20170417190034.71945-15-maxims@google.com>
X-Mailer: git-send-email 2.12.2.762.g0e3151a226-goog
In-Reply-To: <20170417190034.71945-1-maxims@google.com>
References: <20170417190034.71945-1-maxims@google.com>
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
X-List-Received-Date: Mon, 17 Apr 2017 19:01:09 -0000

Refactor SCU header to use consistent Mask & Shift values.
Now, consistently, to read value from SCU register, mask needs
to be applied before shift.

Signed-off-by: Maxim Sloyko <maxims@google.com>
---

Changes in v1: None

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
2.12.2.762.g0e3151a226-goog
