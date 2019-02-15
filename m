Return-Path: <dthompson@mellanox.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mellanox.com
 (client-ip=193.47.165.129; helo=mellanox.co.il;
 envelope-from=dthompson@mellanox.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=mellanox.com
X-Greylist: delayed 397 seconds by postgrey-1.36 at bilbo;
 Sat, 16 Feb 2019 07:26:13 AEDT
Received: from mellanox.co.il (mail-il-dmz.mellanox.com [193.47.165.129])
 by lists.ozlabs.org (Postfix) with ESMTP id 441Psx5rVBzDqGc
 for <openbmc@lists.ozlabs.org>; Sat, 16 Feb 2019 07:26:12 +1100 (AEDT)
Received: from Internal Mail-Server by MTLPINE1 (envelope-from
 dthompson@mellanox.com)
 with ESMTPS (AES256-SHA encrypted); 15 Feb 2019 22:19:26 +0200
Received: from farm-1.mtbu.labs.mlnx (farm-1.mtbu.labs.mlnx [10.15.2.31])
 by mtbu-labmailer.labs.mlnx (8.14.4/8.14.4) with ESMTP id x1FKJOj8000498;
 Fri, 15 Feb 2019 15:19:24 -0500
Received: (from dthompson@localhost)
 by farm-1.mtbu.labs.mlnx (8.14.7/8.13.8/Submit) id x1FKJOP8029404;
 Fri, 15 Feb 2019 15:19:24 -0500
From: David Thompson <dthompson@mellanox.com>
To: joel@jms.id.au
Cc: openbmc@lists.ozlabs.org, David Thompson <dthompson@mellanox.com>
Subject: [PATCH U-Boot v1] aspeed/ast-scu.c: add ast_get_m_pll_clk() support
Date: Fri, 15 Feb 2019 15:19:13 -0500
Message-Id: <b0566f5d7195c4f2dba0343e02ca96635c36a7c2.1550259966.git.dthompson@mellanox.com>
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
X-List-Received-Date: Fri, 15 Feb 2019 20:26:15 -0000

The source code for ast_get_m_pll_clk() is adapted from
the file "arch/arm/mach-aspeed/ast-bmc-scu.c" contained
in the bootloader portion of the ASPEED AST2500 SDK.

The values for "A2" silicon revision IDs are from the
document "AST2500/AST2520 Integrated Remote Management
Processor A2 Datasheet", version 1.6, pages 373-374.

Signed-off-by: David Thompson <dthompson@mellanox.com>
Reviewed-by: Shravan Ramani <sramani@mellanox.com>
---
 arch/arm/include/asm/arch-aspeed/ast_scu.h |  1 +
 arch/arm/mach-aspeed/ast-scu.c             | 30 ++++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

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
index 0cc0d67..6184ff4 100644
--- a/arch/arm/mach-aspeed/ast-scu.c
+++ b/arch/arm/mach-aspeed/ast-scu.c
@@ -100,6 +100,10 @@ static struct soc_id soc_map_table[] = {
 	SOC_ID("AST2510-A1", 0x04010103),
 	SOC_ID("AST2520-A1", 0x04010203),
 	SOC_ID("AST2530-A1", 0x04010403),
+	SOC_ID("AST2500-A2", 0x04030303),
+	SOC_ID("AST2510-A2", 0x04030103),
+	SOC_ID("AST2520-A2", 0x04030203),
+	SOC_ID("AST2530-A2", 0x04030403),
 };
 
 void ast_scu_init_eth(u8 num)
@@ -235,6 +239,32 @@ u32 ast_get_h_pll_clk(void)
 	return clk;
 }
 
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
