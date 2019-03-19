Return-Path: <dthompson@mellanox.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mellanox.com
 (client-ip=193.47.165.129; helo=mellanox.co.il;
 envelope-from=dthompson@mellanox.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=mellanox.com
Received: from mellanox.co.il (mail-il-dmz.mellanox.com [193.47.165.129])
 by lists.ozlabs.org (Postfix) with ESMTP id 44P1Qk0f8GzDqHq
 for <openbmc@lists.ozlabs.org>; Wed, 20 Mar 2019 05:13:55 +1100 (AEDT)
Received: from Internal Mail-Server by MTLPINE1 (envelope-from
 dthompson@mellanox.com)
 with ESMTPS (AES256-SHA encrypted); 19 Mar 2019 20:13:50 +0200
Received: from farm-1.mtbu.labs.mlnx (farm-1.mtbu.labs.mlnx [10.15.2.31])
 by mtbu-labmailer.labs.mlnx (8.14.4/8.14.4) with ESMTP id x2JIDmAo009063;
 Tue, 19 Mar 2019 14:13:48 -0400
Received: (from dthompson@localhost)
 by farm-1.mtbu.labs.mlnx (8.14.7/8.13.8/Submit) id x2JIDmtQ029173;
 Tue, 19 Mar 2019 14:13:48 -0400
From: David Thompson <dthompson@mellanox.com>
To: andrew@aj.id.au.joel@jms.id.au.dthompson@mellanox.com
Cc: openbmc@lists.ozlabs.org, David Thompson <dthompson@mellanox.com>
Subject: [Patch U-Boot v2] aspeed/ast-scu.c: add ast_get_m_pll_clk() for
 AST_SOC_G5
Date: Tue, 19 Mar 2019 14:13:42 -0400
Message-Id: <e78f778a53ac5a2bf13d463e12de0d6fd08f4138.1553018953.git.dthompson@mellanox.com>
X-Mailer: git-send-email 2.1.2
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Mar 2019 18:14:07 -0000

This code change adds the AST_SOC_G5 version of ast_get_m_pll_clk(),
which is relevant to AST1520, AST2500, and AST3200 devices.

This change properly enables the AST_SOC_G5 logic in print_cpuinfo(),
which can be turned on by defining CONFIG_DISPLAY_CPUINFO.

Signed-off-by: David Thompson <dthompson@mellanox.com>
Reviewed-by: Shravan Ramani <sramani@mellanox.com>
---
v2: Move info in commit msg to code comments, re-word commit msg
---
 arch/arm/include/asm/arch-aspeed/ast_scu.h |  1 +
 arch/arm/mach-aspeed/ast-scu.c             | 42 ++++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/arch/arm/include/asm/arch-aspeed/ast_scu.h b/arch/arm/include/asm/arch-aspeed/ast_scu.h
index d248416..dcbc673 100644
--- a/arch/arm/include/asm/arch-aspeed/ast_scu.h
+++ b/arch/arm/include/asm/arch-aspeed/ast_scu.h
@@ -37,6 +37,7 @@ extern void ast_scu_get_who_init_dram(void);
 
 extern u32 ast_get_clk_source(void);
 extern u32 ast_get_h_pll_clk(void);
+extern u32 ast_get_m_pll_clk(void);
 extern u32 ast_get_ahbclk(void);
 
 extern u32 ast_scu_get_vga_memsize(void);
diff --git a/arch/arm/mach-aspeed/ast-scu.c b/arch/arm/mach-aspeed/ast-scu.c
index 0cc0d67..12de9b8 100644
--- a/arch/arm/mach-aspeed/ast-scu.c
+++ b/arch/arm/mach-aspeed/ast-scu.c
@@ -72,6 +72,12 @@ struct soc_id {
 
 #define SOC_ID(str, rev) { .name = str, .rev_id = rev, }
 
+/*
+ * The values for the silicon revision IDs shown below are from
+ * the ASPEED Technology document "AST2500/AST2520 Integrated
+ * Remote Management Processor A2 Datasheet", v1.6, pp 373-374.
+ */
+
 static struct soc_id soc_map_table[] = {
 	SOC_ID("AST1100/AST2050-A0", 0x00000200),
 	SOC_ID("AST1100/AST2050-A1", 0x00000201),
@@ -100,6 +106,10 @@ static struct soc_id soc_map_table[] = {
 	SOC_ID("AST2510-A1", 0x04010103),
 	SOC_ID("AST2520-A1", 0x04010203),
 	SOC_ID("AST2530-A1", 0x04010403),
+	SOC_ID("AST2500-A2", 0x04030303),
+	SOC_ID("AST2510-A2", 0x04030103),
+	SOC_ID("AST2520-A2", 0x04030203),
+	SOC_ID("AST2530-A2", 0x04030403),
 };
 
 void ast_scu_init_eth(u8 num)
@@ -235,6 +245,38 @@ u32 ast_get_h_pll_clk(void)
 	return clk;
 }
 
+/*
+ * The source code for ast_get_m_pll_clk() is adapted from
+ * the file "arch/arm/mach-aspeed/ast-bmc-scu.c" contained
+ * in the bootloader portion of the ASPEED AST2500 SDK, v4.05
+ */
+
+u32 ast_get_m_pll_clk(void)
+{
+	u32 clk = 0;
+	u32 m_pll_set = ast_scu_read(AST_SCU_M_PLL);
+
+	if (m_pll_set & SCU_M_PLL_OFF)
+		return 0;
+
+	/* Programming */
+	clk = ast_get_clk_source();
+	if (m_pll_set & SCU_M_PLL_BYPASS) {
+		return clk;
+	} else {
+		/* P = SCU20[13:18]
+		 * M = SCU20[5:12]
+		 * N = SCU20[0:4]
+		 * mpll = 24MHz * [(M+1) /(N+1)] / (P+1)
+		 */
+		clk = ((clk * (SCU_M_PLL_GET_MNUM(m_pll_set) + 1)) /
+			   (SCU_M_PLL_GET_NNUM(m_pll_set) + 1)) /
+			(SCU_M_PLL_GET_PDNUM(m_pll_set) + 1);
+	}
+	debug("m_pll = %d\n", clk);
+	return clk;
+}
+
 u32 ast_get_ahbclk(void)
 {
 	unsigned int axi_div, ahb_div, hpll;
-- 
2.1.2
