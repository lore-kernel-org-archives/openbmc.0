Return-Path: <maxims@google.com>
Received: from mail-pg0-x236.google.com (mail-pg0-x236.google.com
 [IPv6:2607:f8b0:400e:c05::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vkhcy6FcqzDqYY
 for <openbmc@lists.ozlabs.org>; Fri, 17 Mar 2017 08:36:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="BnXJ1gHU"; 
 dkim-atps=neutral
Received: by mail-pg0-x236.google.com with SMTP id n190so31128637pga.0
 for <openbmc@lists.ozlabs.org>; Thu, 16 Mar 2017 14:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=rf83BWyRzixPiMr3+ZWHHcrZg6pBezRzh8NIMiV3PhY=;
 b=BnXJ1gHUeh4a51f49cJe6YPMN9SEkSVNOOR0t6Wi72oyqcO3vaO2PNOgH0kVcBIApz
 JCp6BiJ0LB+9D09ztd9q0SELQ9mcqnV8gn6rZdpE2cQfHHnG6iO93zaCdKBn3wr69VB+
 iy6ETj/zZraz2I/2p+ajRPf6C1YZnt+/AzUDH0Z+37UUTRL8t8S6CxUs5/SexSHoBIRe
 t4Cd3dfWHfTFV6lvgl0P31ZGCt3uaAZhufFrZBXu0s3Y8N8db+s2yxeYltwK7ZfioUbq
 HfVOaxV31UU/wlrvDvbgJK3X+aNjMKnWUSjOxBeJOhuOh9b2X15LZsgX/kkZ2mE/auEr
 2XRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=rf83BWyRzixPiMr3+ZWHHcrZg6pBezRzh8NIMiV3PhY=;
 b=fbeaSxqS/hmByX5+5xkK9dNxnbZs2qmvPhMmyOQSnV012Osfgs2/cQChUDgdf/ONSv
 faYcd2ecBi6m+ZdCGKLtOSWLyoYL4qt27rDWShounegDGnC2xaIWZGQHZ4/orl2M70R1
 Neupiw+f8zUscxJc7XK11MptEzaj2dBFDHo58tEnPvLq2+A1B/l/+Y0AVGXGINi0TSYK
 exS4RzM+eCke1K1fAvg+T+JXzZdXItljoauVrQ/VDGehlIVySkEyjkCGziUyaCtJ0Hrt
 PIGuM2Yp/7qZw2emUv/BfGxs+1Z5ZxLf2Lk197PDLnniiBAnxwCv4e4+d1k3IRqIU6gA
 tmKA==
X-Gm-Message-State: AFeK/H18kegjXwpfWv3CthrqdwGG7oyYSaGt3tJQLR3QvmI5xmokbkcNpgEFHmP+Bz9Lr6oz
X-Received: by 10.84.211.97 with SMTP id b88mr15296250pli.113.1489700208675;
 Thu, 16 Mar 2017 14:36:48 -0700 (PDT)
Received: from mxsl.svl.corp.google.com ([100.123.242.80])
 by smtp.gmail.com with ESMTPSA id v17sm2191375pgc.20.2017.03.16.14.36.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 16 Mar 2017 14:36:48 -0700 (PDT)
From: Maxim Sloyko <maxims@google.com>
To: u-boot@lists.denx.de,
	Simon Glass <sjg@chromium.org>
Cc: openbmc@lists.ozlabs.org, Maxim Sloyko <maxims@google.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>
Subject: [PATCH 13/17] aspeed: Add support for Clocks needed by MACs
Date: Thu, 16 Mar 2017 14:36:20 -0700
Message-Id: <20170316213624.140344-14-maxims@google.com>
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

Add support for clocks needed by MACs to ast2500 clock driver.
The clocks are D2-PLL, which is used by both MACs and PCLK_MAC1 and
PCLK_MAC2 for MAC1 and MAC2 respectively.

The rate of D2-PLL is hardcoded to 250MHz -- the value used in Aspeed
SDK. It is not entirely clear from the datasheet how this clock is used
by MACs, so not clear if the rate would ever need to be different. So,
for now, hardcoding it is probably safer.

The rate of PCLK_MAC{1,2} is chosen based on MAC speed selected through
hardware strapping.

So, the network driver would only need to enable these clocks, no need
to configure the rate.

Signed-off-by: Maxim Sloyko <maxims@google.com>
---

 arch/arm/dts/ast2500-u-boot.dtsi               |   8 +
 arch/arm/include/asm/arch-aspeed/scu_ast2500.h |  62 +++++-
 drivers/clk/aspeed/clk_ast2500.c               | 265 ++++++++++++++++++++++---
 include/dt-bindings/clock/ast2500-scu.h        |   2 +
 4 files changed, 304 insertions(+), 33 deletions(-)

diff --git a/arch/arm/dts/ast2500-u-boot.dtsi b/arch/arm/dts/ast2500-u-boot.dtsi
index faeeec1be4..f826646095 100644
--- a/arch/arm/dts/ast2500-u-boot.dtsi
+++ b/arch/arm/dts/ast2500-u-boot.dtsi
@@ -61,3 +61,11 @@
 		};
 	};
 };
+
+&mac0 {
+	clocks = <&scu PCLK_MAC1>, <&scu PLL_D2PLL>;
+};
+
+&mac1 {
+	clocks = <&scu PCLK_MAC2>, <&scu PLL_D2PLL>;
+};
diff --git a/arch/arm/include/asm/arch-aspeed/scu_ast2500.h b/arch/arm/include/asm/arch-aspeed/scu_ast2500.h
index 319d75e05c..fe877b5430 100644
--- a/arch/arm/include/asm/arch-aspeed/scu_ast2500.h
+++ b/arch/arm/include/asm/arch-aspeed/scu_ast2500.h
@@ -30,9 +30,36 @@
 #define SCU_HPLL_POST_SHIFT		13
 #define SCU_HPLL_POST_MASK		0x3f
 
+#define SCU_MACCLK_SHIFT		16
+#define SCU_MACCLK_MASK			(7 << SCU_MACCLK_SHIFT)
+
+#define SCU_MISC2_RGMII_HPLL		(1 << 23)
+#define SCU_MISC2_RGMII_CLKDIV_SHIFT	20
+#define SCU_MISC2_RGMII_CLKDIV_MASK	(3 << SCU_MISC2_RGMII_CLKDIV_SHIFT)
+#define SCU_MISC2_RMII_MPLL		(1 << 19)
+#define SCU_MISC2_RMII_CLKDIV_SHIFT	16
+#define SCU_MISC2_RMII_CLKDIV_MASK	(3 << SCU_MISC2_RMII_CLKDIV_SHIFT)
 #define SCU_MISC2_UARTCLK_SHIFT		24
 
+#define SCU_MISC_D2PLL_OFF		(1 << 4)
 #define SCU_MISC_UARTCLK_DIV13		(1 << 12)
+#define SCU_MISC_GCRT_USB20CLK		(1 << 21)
+
+#define SCU_MICDS_MAC1RGMII_TXDLY_SHIFT	0
+#define SCU_MICDS_MAC1RGMII_TXDLY_MASK	(0x3f\
+					 << SCU_MICDS_MAC1RGMII_TXDLY_SHIFT)
+#define SCU_MICDS_MAC2RGMII_TXDLY_SHIFT	6
+#define SCU_MICDS_MAC2RGMII_TXDLY_MASK	(0x3f\
+					 << SCU_MICDS_MAC2RGMII_TXDLY_SHIFT)
+#define SCU_MICDS_MAC1RMII_RDLY_SHIFT	12
+#define SCU_MICDS_MAC1RMII_RDLY_MASK	(0x3f << SCU_MICDS_MAC1RMII_RDLY_SHIFT)
+#define SCU_MICDS_MAC2RMII_RDLY_SHIFT	18
+#define SCU_MICDS_MAC2RMII_RDLY_MASK	(0x3f << SCU_MICDS_MAC2RMII_RDLY_SHIFT)
+#define SCU_MICDS_MAC1RMII_TXFALL	(1 << 24)
+#define SCU_MICDS_MAC2RMII_TXFALL	(1 << 25)
+#define SCU_MICDS_RMII1_RCLKEN		(1 << 29)
+#define SCU_MICDS_RMII2_RCLKEN		(1 << 30)
+#define SCU_MICDS_RGMIIPLL		(1 << 31)
 
 /*
  * SYSRESET is actually more like a Power register,
@@ -71,14 +98,45 @@
  */
 #define SCU_PIN_FUN_MAC1_MDC		(1 << 30)
 #define SCU_PIN_FUN_MAC1_MDIO		(1 << 31)
-#define SCU_PIN_FUN_MAC1_PHY_LINK		(1 << 0)
+#define SCU_PIN_FUN_MAC1_PHY_LINK	(1 << 0)
 #define SCU_PIN_FUN_MAC2_MDIO		(1 << 2)
-#define SCU_PIN_FUN_MAC2_PHY_LINK		(1 << 1)
+#define SCU_PIN_FUN_MAC2_PHY_LINK	(1 << 1)
 #define SCU_PIN_FUN_SCL1		(1 << 12)
 #define SCU_PIN_FUN_SCL2		(1 << 14)
 #define SCU_PIN_FUN_SDA1		(1 << 13)
 #define SCU_PIN_FUN_SDA2		(1 << 15)
 
+#define SCU_CLKSTOP_MAC1		(1 << 20)
+#define SCU_CLKSTOP_MAC2		(1 << 21)
+
+#define SCU_D2PLL_EXT1_OFF		(1 << 0)
+#define SCU_D2PLL_EXT1_BYPASS		(1 << 1)
+#define SCU_D2PLL_EXT1_RESET		(1 << 2)
+#define SCU_D2PLL_EXT1_MODE_SHIFT	3
+#define SCU_D2PLL_EXT1_MODE_MASK	(3 << SCU_D2PLL_EXT1_MODE_SHIFT)
+#define SCU_D2PLL_EXT1_PARAM_SHIFT	5
+#define SCU_D2PLL_EXT1_PARAM_MASK	(0x1ff << SCU_D2PLL_EXT1_PARAM_SHIFT)
+
+#define SCU_D2PLL_NUM_SHIFT		0
+#define SCU_D2PLL_NUM_MASK		(0xff << SCU_D2PLL_NUM_SHIFT)
+#define SCU_D2PLL_DENUM_SHIFT		8
+#define SCU_D2PLL_DENUM_MASK		(0x1f << SCU_D2PLL_DENUM_SHIFT)
+#define SCU_D2PLL_POST_SHIFT		13
+#define SCU_D2PLL_POST_MASK		(0x3f << SCU_D2PLL_POST_SHIFT)
+#define SCU_D2PLL_ODIV_SHIFT		19
+#define SCU_D2PLL_ODIV_MASK		(7 << SCU_D2PLL_ODIV_SHIFT)
+#define SCU_D2PLL_SIC_SHIFT		22
+#define SCU_D2PLL_SIC_MASK		(0x1f << SCU_D2PLL_SIC_SHIFT)
+#define SCU_D2PLL_SIP_SHIFT		27
+#define SCU_D2PLL_SIP_MASK		(0x1f << SCU_D2PLL_SIP_SHIFT)
+
+#define SCU_CLKDUTY_DCLK_SHIFT		0
+#define SCU_CLKDUTY_DCLK_MASK		(0x3f << SCU_CLKDUTY_DCLK_SHIFT)
+#define SCU_CLKDUTY_RGMII1TXCK_SHIFT	8
+#define SCU_CLKDUTY_RGMII1TXCK_MASK	(0x7f << SCU_CLKDUTY_RGMII1TXCK_SHIFT)
+#define SCU_CLKDUTY_RGMII2TXCK_SHIFT	16
+#define SCU_CLKDUTY_RGMII2TXCK_MASK	(0x7f << SCU_CLKDUTY_RGMII2TXCK_SHIFT)
+
 #ifndef __ASSEMBLY__
 
 struct ast2500_clk_priv {
diff --git a/drivers/clk/aspeed/clk_ast2500.c b/drivers/clk/aspeed/clk_ast2500.c
index 9e4c66ea85..7b4b5c64ac 100644
--- a/drivers/clk/aspeed/clk_ast2500.c
+++ b/drivers/clk/aspeed/clk_ast2500.c
@@ -12,16 +12,39 @@
 #include <dm/lists.h>
 #include <dt-bindings/clock/ast2500-scu.h>
 
+/*
+ * MAC Clock Delay settings, taken from Aspeed SDK
+ */
+#define RGMII_TXCLK_ODLY		8
+#define RMII_RXCLK_IDLY		2
+
+/*
+ * TGMII Clock Duty constants, taken from Aspeed SDK
+ */
+#define RGMII2_TXCK_DUTY	0x66
+#define RGMII1_TXCK_DUTY	0x64
+
+#define D2PLL_DEFAULT_RATE	(250 * 1000 * 1000)
+
 DECLARE_GLOBAL_DATA_PTR;
 
 /*
+ * Clock divider/multiplier configuration struct.
  * For H-PLL and M-PLL the formula is
  * (Output Frequency) = CLKIN * ((M + 1) / (N + 1)) / (P + 1)
  * M - Numerator
  * N - Denumerator
  * P - Post Divider
  * They have the same layout in their control register.
+ *
+ * D-PLL and D2-PLL have extra divider (OD + 1), which is not
+ * yet needed and ignored by clock configurations.
  */
+struct ast2500_div_config {
+	unsigned int num;
+	unsigned int denum;
+	unsigned int post_div;
+};
 
 /*
  * Get the rate of the M-PLL clock from input clock frequency and
@@ -143,30 +166,41 @@ static ulong ast2500_clk_get_rate(struct clk *clk)
 	return rate;
 }
 
-static ulong ast2500_configure_ddr(struct ast2500_scu *scu, ulong rate)
+/*
+ * @input_rate - the rate of input clock in Hz
+ * @requested_rate - desired output rate in Hz
+ * @div - this is an IN/OUT parameter, at input all fields of the config
+ * need to be set to their maximum allowed values.
+ * The result (the best config we could find), would also be returned
+ * in this structure.
+ *
+ * @return The clock rate, when the resulting div_config is used.
+ */
+static ulong ast2500_calc_clock_config(ulong input_rate, ulong requested_rate,
+				       struct ast2500_div_config *cfg)
 {
-	ulong clkin = ast2500_get_clkin(scu);
-	u32 mpll_reg;
-
 	/*
-	 * There are not that many combinations of numerator, denumerator
-	 * and post divider, so just brute force the best combination.
-	 * However, to avoid overflow when multiplying, use kHz.
+	 * The assumption is that kHz precision is good enough and
+	 * also enough to avoid overflow when multiplying.
 	 */
-	const ulong clkin_khz = clkin / 1000;
-	const ulong rate_khz = rate / 1000;
-	ulong best_num = 0;
-	ulong best_denum = 0;
-	ulong best_post = 0;
-	ulong delta = rate;
-	ulong num, denum, post;
-
-	for (denum = 0; denum <= SCU_MPLL_DENUM_MASK; ++denum) {
-		for (post = 0; post <= SCU_MPLL_POST_MASK; ++post) {
-			num = (rate_khz * (post + 1) / clkin_khz) * (denum + 1);
-			ulong new_rate_khz = (clkin_khz
-					      * ((num + 1) / (denum + 1)))
-					     / (post + 1);
+	const ulong input_rate_khz = input_rate / 1000;
+	const ulong rate_khz = requested_rate / 1000;
+	const struct ast2500_div_config max_vals = *cfg;
+	struct ast2500_div_config it = { 0, 0, 0 };
+	ulong delta = rate_khz;
+	ulong new_rate_khz = 0;
+
+	for (; it.denum <= max_vals.denum; ++it.denum) {
+		for (it.post_div = 0; it.post_div <= max_vals.post_div;
+		     ++it.post_div) {
+			it.num = (rate_khz * (it.post_div + 1) / input_rate_khz)
+			    * (it.denum + 1);
+			if (it.num > max_vals.num)
+				continue;
+
+			new_rate_khz = (input_rate_khz
+					* ((it.num + 1) / (it.denum + 1)))
+			    / (it.post_div + 1);
 
 			/* Keep the rate below requested one. */
 			if (new_rate_khz > rate_khz)
@@ -174,25 +208,35 @@ static ulong ast2500_configure_ddr(struct ast2500_scu *scu, ulong rate)
 
 			if (new_rate_khz - rate_khz < delta) {
 				delta = new_rate_khz - rate_khz;
-
-				best_num = num;
-				best_denum = denum;
-				best_post = post;
-
+				*cfg = it;
 				if (delta == 0)
-					goto rate_calc_done;
+					return new_rate_khz * 1000;
 			}
 		}
 	}
 
- rate_calc_done:
+	return new_rate_khz * 1000;
+}
+
+static ulong ast2500_configure_ddr(struct ast2500_scu *scu, ulong rate)
+{
+	ulong clkin = ast2500_get_clkin(scu);
+	u32 mpll_reg;
+	struct ast2500_div_config div_cfg = {
+		.num = SCU_MPLL_NUM_MASK,
+		.denum = SCU_MPLL_DENUM_MASK,
+		.post_div = SCU_MPLL_POST_MASK
+	};
+
+	ast2500_calc_clock_config(clkin, rate, &div_cfg);
+
 	mpll_reg = readl(&scu->m_pll_param);
 	mpll_reg &= ~((SCU_MPLL_POST_MASK << SCU_MPLL_POST_SHIFT)
 		      | (SCU_MPLL_NUM_MASK << SCU_MPLL_NUM_SHIFT)
 		      | (SCU_MPLL_DENUM_MASK << SCU_MPLL_DENUM_SHIFT));
-	mpll_reg |= (best_post << SCU_MPLL_POST_SHIFT)
-	    | (best_num << SCU_MPLL_NUM_SHIFT)
-	    | (best_denum << SCU_MPLL_DENUM_SHIFT);
+	mpll_reg |= (div_cfg.post_div << SCU_MPLL_POST_SHIFT)
+	    | (div_cfg.num << SCU_MPLL_NUM_SHIFT)
+	    | (div_cfg.denum << SCU_MPLL_DENUM_SHIFT);
 
 	ast_scu_unlock(scu);
 	writel(mpll_reg, &scu->m_pll_param);
@@ -201,6 +245,136 @@ static ulong ast2500_configure_ddr(struct ast2500_scu *scu, ulong rate)
 	return ast2500_get_mpll_rate(clkin, mpll_reg);
 }
 
+static ulong ast2500_configure_mac(struct ast2500_scu *scu, int index)
+{
+	ulong clkin = ast2500_get_clkin(scu);
+	ulong hpll_rate = ast2500_get_hpll_rate(clkin,
+						readl(&scu->h_pll_param));
+	ulong required_rate;
+	u32 hwstrap;
+	u32 divisor;
+	u32 reset_bit;
+	u32 clkstop_bit;
+
+	/*
+	 * According to data sheet, for 10/100 mode the MAC clock frequency
+	 * should be at least 25MHz and for 1000 mode at least 100MHz
+	 */
+	hwstrap = readl(&scu->hwstrap);
+	if (hwstrap & (SCU_HWSTRAP_MAC1_RGMII | SCU_HWSTRAP_MAC2_RGMII))
+		required_rate = 100 * 1000 * 1000;
+	else
+		required_rate = 25 * 1000 * 1000;
+
+	divisor = hpll_rate / required_rate;
+
+	if (divisor < 4) {
+		/* Clock can't run fast enough, but let's try anyway */
+		debug("MAC clock too slow\n");
+		divisor = 4;
+	} else if (divisor > 16) {
+		/* Can't slow down the clock enough, but let's try anyway */
+		debug("MAC clock too fast\n");
+		divisor = 16;
+	}
+
+	switch (index) {
+	case 1:
+		reset_bit = SCU_SYSRESET_MAC1;
+		clkstop_bit = SCU_CLKSTOP_MAC1;
+		break;
+	case 2:
+		reset_bit = SCU_SYSRESET_MAC2;
+		clkstop_bit = SCU_CLKSTOP_MAC2;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	ast_scu_unlock(scu);
+	clrsetbits_le32(&scu->clk_sel1, SCU_MACCLK_MASK,
+			((divisor - 2) / 2) << SCU_MACCLK_SHIFT);
+
+	/*
+	 * Disable MAC, start its clock and re-enable it.
+	 * The procedure and the delays (100us & 10ms) are
+	 * specified in the datasheet.
+	 */
+	setbits_le32(&scu->sysreset_ctrl1, reset_bit);
+	udelay(100);
+	clrbits_le32(&scu->clk_stop_ctrl1, clkstop_bit);
+	mdelay(10);
+	clrbits_le32(&scu->sysreset_ctrl1, reset_bit);
+
+	writel((RGMII2_TXCK_DUTY << SCU_CLKDUTY_RGMII2TXCK_SHIFT)
+	       | (RGMII1_TXCK_DUTY << SCU_CLKDUTY_RGMII1TXCK_SHIFT),
+	       &scu->clk_duty_sel);
+
+	ast_scu_lock(scu);
+
+	return required_rate;
+}
+
+static ulong ast2500_configure_d2pll(struct ast2500_scu *scu, ulong rate)
+{
+	/*
+	 * The values and the meaning of the next three
+	 * parameters are undocumented. Taken from Aspeed SDK.
+	 */
+	const u32 d2_pll_ext_param = 0x2c;
+	const u32 d2_pll_sip = 0x11;
+	const u32 d2_pll_sic = 0x18;
+	u32 clk_delay_settings =
+	    (RMII_RXCLK_IDLY << SCU_MICDS_MAC1RMII_RDLY_SHIFT)
+	    | (RMII_RXCLK_IDLY << SCU_MICDS_MAC2RMII_RDLY_SHIFT)
+	    | (RGMII_TXCLK_ODLY << SCU_MICDS_MAC1RGMII_TXDLY_SHIFT)
+	    | (RGMII_TXCLK_ODLY << SCU_MICDS_MAC2RGMII_TXDLY_SHIFT);
+	struct ast2500_div_config div_cfg = {
+		.num = SCU_D2PLL_NUM_MASK >> SCU_D2PLL_NUM_SHIFT,
+		.denum = SCU_D2PLL_DENUM_MASK >> SCU_D2PLL_DENUM_SHIFT,
+		.post_div = SCU_D2PLL_POST_MASK >> SCU_D2PLL_POST_SHIFT,
+	};
+	ulong clkin = ast2500_get_clkin(scu);
+	ulong new_rate;
+
+	ast_scu_unlock(scu);
+	writel((d2_pll_ext_param << SCU_D2PLL_EXT1_PARAM_SHIFT)
+	       | SCU_D2PLL_EXT1_OFF
+	       | SCU_D2PLL_EXT1_RESET, &scu->d2_pll_ext_param[0]);
+
+	/*
+	 * Select USB2.0 port1 PHY clock as a clock source for GCRT.
+	 * This would disconnect it from D2-PLL.
+	 */
+	clrsetbits_le32(&scu->misc_ctrl1, SCU_MISC_D2PLL_OFF,
+			SCU_MISC_GCRT_USB20CLK);
+
+	new_rate = ast2500_calc_clock_config(clkin, rate, &div_cfg);
+	writel((d2_pll_sip << SCU_D2PLL_SIP_SHIFT)
+	       | (d2_pll_sic << SCU_D2PLL_SIC_SHIFT)
+	       | (div_cfg.num << SCU_D2PLL_NUM_SHIFT)
+	       | (div_cfg.denum << SCU_D2PLL_DENUM_SHIFT)
+	       | (div_cfg.post_div << SCU_D2PLL_POST_SHIFT),
+	       &scu->d2_pll_param);
+
+	clrbits_le32(&scu->d2_pll_ext_param[0],
+		     SCU_D2PLL_EXT1_OFF | SCU_D2PLL_EXT1_RESET);
+
+	clrsetbits_le32(&scu->misc_ctrl2,
+			SCU_MISC2_RGMII_HPLL | SCU_MISC2_RMII_MPLL
+			| SCU_MISC2_RGMII_CLKDIV_MASK |
+			SCU_MISC2_RMII_CLKDIV_MASK,
+			(4 << SCU_MISC2_RMII_CLKDIV_SHIFT));
+
+	writel(clk_delay_settings | SCU_MICDS_RGMIIPLL, &scu->mac_clk_delay);
+	writel(clk_delay_settings, &scu->mac_clk_delay_100M);
+	writel(clk_delay_settings, &scu->mac_clk_delay_10M);
+
+	ast_scu_lock(scu);
+
+	return new_rate;
+}
+
 static ulong ast2500_clk_set_rate(struct clk *clk, ulong rate)
 {
 	struct ast2500_clk_priv *priv = dev_get_priv(clk->dev);
@@ -211,6 +385,9 @@ static ulong ast2500_clk_set_rate(struct clk *clk, ulong rate)
 	case MCLK_DDR:
 		new_rate = ast2500_configure_ddr(priv->scu, rate);
 		break;
+	case PLL_D2PLL:
+		new_rate = ast2500_configure_d2pll(priv->scu, rate);
+		break;
 	default:
 		return -ENOENT;
 	}
@@ -218,9 +395,35 @@ static ulong ast2500_clk_set_rate(struct clk *clk, ulong rate)
 	return new_rate;
 }
 
+static int ast2500_clk_enable(struct clk *clk)
+{
+	struct ast2500_clk_priv *priv = dev_get_priv(clk->dev);
+
+	switch (clk->id) {
+	/*
+	 * For MAC clocks the clock rate is
+	 * configured based on whether RGMII or RMII mode has been selected
+	 * through hardware strapping.
+	 */
+	case PCLK_MAC1:
+		ast2500_configure_mac(priv->scu, 1);
+		break;
+	case PCLK_MAC2:
+		ast2500_configure_mac(priv->scu, 2);
+		break;
+	case PLL_D2PLL:
+		ast2500_configure_d2pll(priv->scu, D2PLL_DEFAULT_RATE);
+	default:
+		return -ENOENT;
+	}
+
+	return 0;
+}
+
 struct clk_ops ast2500_clk_ops = {
 	.get_rate = ast2500_clk_get_rate,
 	.set_rate = ast2500_clk_set_rate,
+	.enable = ast2500_clk_enable,
 };
 
 static int ast2500_clk_probe(struct udevice *dev)
diff --git a/include/dt-bindings/clock/ast2500-scu.h b/include/dt-bindings/clock/ast2500-scu.h
index ca58b12943..e2d7aaf9fe 100644
--- a/include/dt-bindings/clock/ast2500-scu.h
+++ b/include/dt-bindings/clock/ast2500-scu.h
@@ -27,3 +27,5 @@
 #define PCLK_UART3	503
 #define PCLK_UART4	504
 #define PCLK_UART5	505
+#define PCLK_MAC1	506
+#define PCLK_MAC2	507
-- 
2.12.0.367.g23dc2f6d3c-goog
