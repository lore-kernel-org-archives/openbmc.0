Return-Path: <maxims@google.com>
Received: from mail-pf0-x230.google.com (mail-pf0-x230.google.com
 [IPv6:2607:f8b0:400e:c00::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sk7W222MNzDrVg
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 03:44:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=dSczp58w; 
 dkim-atps=neutral
Received: by mail-pf0-x230.google.com with SMTP id q2so8015594pfj.3
 for <openbmc@lists.ozlabs.org>; Tue, 27 Sep 2016 10:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=6FgyItKmpnYQkgY6NYIeCOwdtQsnuVTUjlUd84SDjW4=;
 b=dSczp58wnSztN5mwclVVxDQlOVgMCcgV05uGJZ6KM2GP87PwgLETIro3Z1dBiaEB4x
 9Prb12XAoLOyp3H3r7XbXdGAEUDDHZVOFGDn5ZBqBMtLFHoETvWYq4pHTKkLNrly89N1
 mLDkaXQtZZ/mxU1f91VEVoN3190rD11G+jPQL+Bw7OAn3MspfdmByDKCKoMg87gzjK5s
 yTEZgtqQ3gq9znmQsgHc2wTyaeTPwn9pDeOTV/PXxz7SEJwbbYDEzzTVSaVmxFWgxXo5
 ijBKILW3JoC22XXP+jvsyfzyKh2mgADg22N62/LovaBJ2tk+MjNL/UX5pKMweDbwyG7k
 8QxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=6FgyItKmpnYQkgY6NYIeCOwdtQsnuVTUjlUd84SDjW4=;
 b=cVYU/WwolywaVFtiQDGKIhI/gRY1e9oqhojbDDGZjdDHq0qe11gWXTugzeZG4LWhUy
 NCYknj9Ci0zM2Ib9EpCBmYreABCLTf4v1sfs5RLsSrNvxP7hPk1naqcF1VNOI1tbAdR3
 9EK42l+fOkI6yoAd5akswCpo13gDKUAhV7XChkXpj66KdyUPBpWyvVoklTMZCmPz3plJ
 zCJUKQpewZ82KbEvcXlvSLIZDgeSOQHITPOuQ2iCAlYf7HTtq59HT05HrH3hXfMZeTTk
 ytaS7PIluiZzQRQQ6TqtnWqyrEz90EBg6JyCC9GUaxRyJOBZwBMEjDS+iQ8Aitb9wL5i
 puDQ==
X-Gm-Message-State: AE9vXwPdMuVicm9+jsIe7Oh3rwkfX5a8vLqJOW1mJfEGxHa5obPzMPBbjzrirvXQmiUgccQ0
X-Received: by 10.98.79.27 with SMTP id d27mr50412936pfb.127.1474998252214;
 Tue, 27 Sep 2016 10:44:12 -0700 (PDT)
Received: from mxsl.svl.corp.google.com ([100.123.242.80])
 by smtp.gmail.com with ESMTPSA id af17sm1542129pac.14.2016.09.27.10.44.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 27 Sep 2016 10:44:11 -0700 (PDT)
From: maxims@google.com
To: openbmc@lists.ozlabs.org
Subject: [PATCH 2/3] aspeed/g5: helper SCU functions for configuring aspeed I2C
Date: Tue, 27 Sep 2016 10:43:33 -0700
Message-Id: <1474998214-12720-2-git-send-email-maxims@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1474998214-12720-1-git-send-email-maxims@google.com>
References: <1474306018-101166-1-git-send-email-maxims@google.com>
 <1474998214-12720-1-git-send-email-maxims@google.com>
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
X-List-Received-Date: Tue, 27 Sep 2016 17:44:14 -0000

From: Maxim Sloyko <maxims@google.com>

---
 arch/arm/include/asm/arch-aspeed/ast_scu.h  |  6 +++
 arch/arm/include/asm/arch-aspeed/regs-scu.h | 74 ++++++++++++++++-------------
 arch/arm/mach-aspeed/ast-scu.c              | 30 +++++++++++-
 3 files changed, 75 insertions(+), 35 deletions(-)

diff --git a/arch/arm/include/asm/arch-aspeed/ast_scu.h b/arch/arm/include/asm/arch-aspeed/ast_scu.h
index d248416..80ebd6f 100644
--- a/arch/arm/include/asm/arch-aspeed/ast_scu.h
+++ b/arch/arm/include/asm/arch-aspeed/ast_scu.h
@@ -38,6 +38,7 @@ extern void ast_scu_get_who_init_dram(void);
 extern u32 ast_get_clk_source(void);
 extern u32 ast_get_h_pll_clk(void);
 extern u32 ast_get_ahbclk(void);
+extern u32 ast_get_apbclk(void);
 
 extern u32 ast_scu_get_vga_memsize(void);
 
@@ -45,4 +46,9 @@ extern void ast_scu_init_eth(u8 num);
 extern void ast_scu_multi_func_eth(u8 num);
 extern void ast_scu_multi_func_romcs(u8 num);
 
+/* Enable I2C controller and pins for a particular device.
+ * Device numbering starts at 1
+ */
+extern void ast_scu_enable_i2c(u8 num);
+
 #endif
diff --git a/arch/arm/include/asm/arch-aspeed/regs-scu.h b/arch/arm/include/asm/arch-aspeed/regs-scu.h
index b89df82..92ce84a 100644
--- a/arch/arm/include/asm/arch-aspeed/regs-scu.h
+++ b/arch/arm/include/asm/arch-aspeed/regs-scu.h
@@ -10,8 +10,8 @@
  *    1. 2012/12/29 Ryan Chen Create
  *
 ********************************************************************************/
-#ifndef __AST_SCU_H
-#define __AST_SCU_H                     1
+#ifndef __AST_REGS_SCU_H
+#define __AST_REGS_SCU_H                     1
 
 #include <asm/arch/aspeed.h>
 
@@ -830,49 +830,50 @@
 /* AST_SCU_FUN_PIN_CTRL5		0x90 - Multi-function Pin Control#5 */
 #define SCU_FUN_PIN_SPICS1		(0x1 << 31)
 #define SCU_FUN_PIN_LPC_PLUS		(0x1 << 30)
-#define SCU_FUC_PIN_USB20_HOST		(0x1 << 29)
-#define SCU_FUC_PIN_USB11_PORT4		(0x1 << 28)
-#define SCU_FUC_PIN_I2C14		(0x1 << 27)
-#define SCU_FUC_PIN_I2C13		(0x1 << 26)
-#define SCU_FUC_PIN_I2C12		(0x1 << 25)
-#define SCU_FUC_PIN_I2C11		(0x1 << 24)
-#define SCU_FUC_PIN_I2C10		(0x1 << 23)
-#define SCU_FUC_PIN_I2C9		(0x1 << 22)
-#define SCU_FUC_PIN_I2C8		(0x1 << 21)
-#define SCU_FUC_PIN_I2C7		(0x1 << 20)
-#define SCU_FUC_PIN_I2C6		(0x1 << 19)
-#define SCU_FUC_PIN_I2C5		(0x1 << 18)
-#define SCU_FUC_PIN_I2C4		(0x1 << 17)
-#define SCU_FUC_PIN_I2C3		(0x1 << 16)
-#define SCU_FUC_PIN_MII2_RX_DWN_DIS	(0x1 << 15)
-#define SCU_FUC_PIN_MII2_TX_DWN_DIS	(0x1 << 14)
-#define SCU_FUC_PIN_MII1_RX_DWN_DIS	(0x1 << 13)
-#define SCU_FUC_PIN_MII1_TX_DWN_DIS	(0x1 << 12)
-
-#define SCU_FUC_PIN_MII2_TX_DRIV(x)	(x << 10)
-#define SCU_FUC_PIN_MII2_TX_DRIV_MASK	(0x3 << 10)
-#define SCU_FUC_PIN_MII1_TX_DRIV(x)	(x << 8)
-#define SCU_FUC_PIN_MII1_TX_DRIV_MASK	(0x3 << 8)
+#define SCU_FUN_PIN_USB20_HOST		(0x1 << 29)
+#define SCU_FUN_PIN_USB11_PORT4		(0x1 << 28)
+#define SCU_FUN_PIN_I2C14		(0x1 << 27)
+#define SCU_FUN_PIN_I2C13		(0x1 << 26)
+#define SCU_FUN_PIN_I2C12		(0x1 << 25)
+#define SCU_FUN_PIN_I2C11		(0x1 << 24)
+#define SCU_FUN_PIN_I2C10		(0x1 << 23)
+#define SCU_FUN_PIN_I2C9		(0x1 << 22)
+#define SCU_FUN_PIN_I2C8		(0x1 << 21)
+#define SCU_FUN_PIN_I2C7		(0x1 << 20)
+#define SCU_FUN_PIN_I2C6		(0x1 << 19)
+#define SCU_FUN_PIN_I2C5		(0x1 << 18)
+#define SCU_FUN_PIN_I2C4		(0x1 << 17)
+#define SCU_FUN_PIN_I2C3		(0x1 << 16)
+#define SCU_FUN_PIN_I2C(n)		(0x1 << (16 + (n) - 3))
+#define SCU_FUN_PIN_MII2_RX_DWN_DIS	(0x1 << 15)
+#define SCU_FUN_PIN_MII2_TX_DWN_DIS	(0x1 << 14)
+#define SCU_FUN_PIN_MII1_RX_DWN_DIS	(0x1 << 13)
+#define SCU_FUN_PIN_MII1_TX_DWN_DIS	(0x1 << 12)
+
+#define SCU_FUN_PIN_MII2_TX_DRIV(x)	(x << 10)
+#define SCU_FUN_PIN_MII2_TX_DRIV_MASK	(0x3 << 10)
+#define SCU_FUN_PIN_MII1_TX_DRIV(x)	(x << 8)
+#define SCU_FUN_PIN_MII1_TX_DRIV_MASK	(0x3 << 8)
 
 #define MII_NORMAL_DRIV			0x0
 #define MII_HIGH_DRIV			0x2
 
-#define SCU_FUC_PIN_UART6		(0x1 << 7)
-#define SCU_FUC_PIN_ROM_16BIT		(0x1 << 6)
-#define SCU_FUC_PIN_DIGI_V_OUT(x)	(x)
-#define SCU_FUC_PIN_DIGI_V_OUT_MASK	(0x3)
+#define SCU_FUN_PIN_UART6		(0x1 << 7)
+#define SCU_FUN_PIN_ROM_16BIT		(0x1 << 6)
+#define SCU_FUN_PIN_DIGI_V_OUT(x)	(x)
+#define SCU_FUN_PIN_DIGI_V_OUT_MASK	(0x3)
 
 #define VIDEO_DISABLE			0x0
 #define VIDEO_12BITS			0x1
 #define VIDEO_24BITS			0x2
 //#define VIDEO_DISABLE			0x3
 
-#define SCU_FUC_PIN_USB11_PORT2		(0x1 << 3)
-#define SCU_FUC_PIN_SD1_8BIT		(0x1 << 3)
+#define SCU_FUN_PIN_USB11_PORT2		(0x1 << 3)
+#define SCU_FUN_PIN_SD1_8BIT		(0x1 << 3)
 
-#define SCU_FUC_PIN_MAC1_MDIO		(0x1 << 2)
-#define SCU_FUC_PIN_SD2			(0x1 << 1)
-#define SCU_FUC_PIN_SD1			(0x1 << 0)
+#define SCU_FUN_PIN_MAC1_MDIO		(0x1 << 2)
+#define SCU_FUN_PIN_SD2			(0x1 << 1)
+#define SCU_FUN_PIN_SD1			(0x1 << 0)
 
 
 /* AST_SCU_FUN_PIN_CTRL6		0x94 - Multi-function Pin Control#6*/
@@ -914,6 +915,11 @@
 #define SCU_FUN_PIN_ROMA4		(0x1 << 18)
 #define SCU_FUN_PIN_ROMA3		(0x1 << 17)
 #define SCU_FUN_PIN_ROMA2		(0x1 << 16)
+/* AST2500 only */
+#define SCU_FUN_PIN_SDA2		(0x1 << 15)
+#define SCU_FUN_PIN_SCL2		(0x1 << 14)
+#define SCU_FUN_PIN_SDA1		(0x1 << 13)
+#define SCU_FUN_PIN_SCL1		(0x1 << 12)
 
 /* AST_SCU_FUN_PIN_CTRL9		0xA8 - Multi-function Pin Control#9 */
 #define SCU_FUN_PIN_ROMA21		(0x1 << 3)
diff --git a/arch/arm/mach-aspeed/ast-scu.c b/arch/arm/mach-aspeed/ast-scu.c
index 0cc0d67..1452b93 100644
--- a/arch/arm/mach-aspeed/ast-scu.c
+++ b/arch/arm/mach-aspeed/ast-scu.c
@@ -318,6 +318,14 @@ u32 ast_get_ahbclk(void)
 
 #endif /* AST_SOC_G5 */
 
+u32 ast_get_apbclk(void)
+{
+	u32 h_pll = ast_get_h_pll_clk();
+	u32 apb_div = SCU_GET_PCLK_DIV(ast_scu_read(AST_SCU_CLK_SEL));
+	return h_pll / apb_div;
+}
+
+
 void ast_scu_show_system_info(void)
 {
 
@@ -394,7 +402,7 @@ void ast_scu_multi_func_eth(u8 num)
 			      AST_SCU_FUN_PIN_CTRL1);
 
 		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) |
-			      SCU_FUC_PIN_MAC1_MDIO,
+			      SCU_FUN_PIN_MAC1_MDIO,
 			      AST_SCU_FUN_PIN_CTRL5);
 
 		break;
@@ -496,3 +504,23 @@ void ast_scu_get_who_init_dram(void)
 		break;
 	}
 }
+
+void ast_scu_enable_i2c(u8 num)
+{
+	/* Enable I2C Controllers */
+	clrbits_le32(AST_SCU_BASE + AST_SCU_RESET, SCU_RESET_I2C);
+
+	if (num < 3) {
+#ifdef AST_SOC_G5
+		if (num == 1) {
+			setbits_le32(AST_SCU_BASE + AST_SCU_FUN_PIN_CTRL8,
+						 SCU_FUN_PIN_SDA1 | SCU_FUN_PIN_SCL1);
+		} else {
+			setbits_le32(AST_SCU_BASE + AST_SCU_FUN_PIN_CTRL8,
+						 SCU_FUN_PIN_SDA2 | SCU_FUN_PIN_SCL2);
+		}
+#endif
+	} else {
+		setbits_le32(AST_SCU_BASE + AST_SCU_FUN_PIN_CTRL5, SCU_FUN_PIN_I2C(num));
+	}
+}
-- 
2.8.0.rc3.226.g39d4020
