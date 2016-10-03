Return-Path: <maxims@google.com>
Received: from mail-lf0-x236.google.com (mail-lf0-x236.google.com
 [IPv6:2a00:1450:4010:c07::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3snrqb3m5dzDrL1
 for <openbmc@lists.ozlabs.org>; Tue,  4 Oct 2016 05:56:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=LvqtQshc; 
 dkim-atps=neutral
Received: by mail-lf0-x236.google.com with SMTP id l131so165015609lfl.2
 for <openbmc@lists.ozlabs.org>; Mon, 03 Oct 2016 11:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=lDfUOQpYWsobOxBiVjp6nxTS/pScYKP0u7PzE6qUuw8=;
 b=LvqtQshcC2t25LdWiCwPIfnW6YB48kNwifOnKrN3S9y/ssbTARU4xZ1Qe07Js0/xHs
 b/9CtwVa8FEXYoL5Fr6vR2p2p+yeAZLXecfHfeHHuNWkrZVzK2C+Xdq6sb0Il+JkK8y7
 n2IJxwNQ1y7kQGzOSHFVpEizpCbumxtTlWm2xCYta9L54x87VWfmE9p5L7rmePhcmL72
 40iukWfkTzS67Ad9TquZgVyboc39UrlbvU/ClhjWYNBvKV78K7+0MKYDk/0pkd8Ih26T
 kj/zHRJND34ZwVv7WBJVkosY/7G1xCul5tnvUIrp5xcmCYvEBLLOwnB8yMgrkUe/ytoW
 c2ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=lDfUOQpYWsobOxBiVjp6nxTS/pScYKP0u7PzE6qUuw8=;
 b=m3h7WYrLt8xNpuN1nXYFZEdmQE0/51WVta/vOYVLA5+b7Qb3gUIkZnpjiIlbgqGV34
 gMFC5IwbjG/iqbYYca7wTonhG+gHuteTOcm6/dFfDIn5thgGs2/kF/K8CWox3Pjyfxrk
 NiWOZt04ifc4XjtOkdQEWN8jJR8pBSVnGb3tIFDpE5ZqfQEmSogT84WM2FHrv9TnRx9d
 6nmrpkIoID3sGI3+BFTIWiE+9PYsrmd1i9eS2RRDtvOqY4YN24SWV5Z7n734rKuFBAeG
 Ppo5d9887nnMMnwAtTyrc8LqaL9kws4kPS8ABSXT1wmJMpPEd4kUggpgQ0+JuKHCB49z
 fIIA==
X-Gm-Message-State: AA6/9Rl47/Rv5CmRlYbLWAW8QGp0fgHQGss8Ra+vqw4WLSVrCDl0G8ztQVOrTmi8OX3s4p1G
X-Received: by 10.25.11.216 with SMTP id 207mr8237538lfl.171.1475520981111;
 Mon, 03 Oct 2016 11:56:21 -0700 (PDT)
Received: from mxsl.svl.corp.google.com ([100.123.242.80])
 by smtp.gmail.com with ESMTPSA id g77sm2941992ljg.13.2016.10.03.11.56.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 03 Oct 2016 11:56:19 -0700 (PDT)
From: maxims@google.com
To: openbmc@lists.ozlabs.org
Subject: [PATCH] aspeed: SCU helper functions for I2C.
Date: Mon,  3 Oct 2016 11:55:57 -0700
Message-Id: <1475520957-78581-1-git-send-email-maxims@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1475184427-144121-3-git-send-email-maxims@google.com>
References: <1475184427-144121-3-git-send-email-maxims@google.com>
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
X-List-Received-Date: Mon, 03 Oct 2016 18:56:28 -0000

From: Maxim Sloyko <maxims@google.com>

SCU helper functions for configuring I2C pins and accessing APB clock.
---
 arch/arm/include/asm/arch-aspeed/ast_scu.h  |  6 +++++
 arch/arm/include/asm/arch-aspeed/regs-scu.h |  8 ++++++
 arch/arm/mach-aspeed/ast-scu.c              | 38 +++++++++++++++++++++++++++++
 3 files changed, 52 insertions(+)

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
index aab032a..4c869c1 100644
--- a/arch/arm/include/asm/arch-aspeed/regs-scu.h
+++ b/arch/arm/include/asm/arch-aspeed/regs-scu.h
@@ -915,6 +915,11 @@
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
@@ -950,4 +955,7 @@
 /* AST_SCU_BMC_CLASS			0x19C - BMC device class code and revision ID */
 /* AST_SCU_BMC_DEV_ID			0x1A4 - BMC device ID */
 
+#define SCU_I2C_MIN_BUS_NUM			(1)
+#define SCU_I2C_MAX_BUS_NUM			(14)
+
 #endif
diff --git a/arch/arm/mach-aspeed/ast-scu.c b/arch/arm/mach-aspeed/ast-scu.c
index 280c421..1dbd667 100644
--- a/arch/arm/mach-aspeed/ast-scu.c
+++ b/arch/arm/mach-aspeed/ast-scu.c
@@ -318,6 +318,17 @@ u32 ast_get_ahbclk(void)
 
 #endif /* AST_SOC_G5 */
 
+u32 ast_get_apbclk(void)
+{
+	u32 h_pll = ast_get_h_pll_clk();
+	/* The formula for converting the bit pattern to divisor is
+	 * (4 + 4 * DIV), according to datasheet
+	 */
+	u32 apb_div = 4 + 4 * SCU_GET_PCLK_DIV(ast_scu_read(AST_SCU_CLK_SEL));
+	return h_pll / apb_div;
+}
+
+
 void ast_scu_show_system_info(void)
 {
 
@@ -496,3 +507,30 @@ void ast_scu_get_who_init_dram(void)
 		break;
 	}
 }
+
+void ast_scu_enable_i2c(u8 bus_num)
+{
+	if (bus_num < SCU_I2C_MIN_BUS_NUM || bus_num > SCU_I2C_MAX_BUS_NUM) {
+		debug("%s: bus_num is out of range, must be [%d - %d]\n", __func__,
+			  SCU_I2C_MIN_BUS_NUM, SCU_I2C_MAX_BUS_NUM);
+		return;
+	}
+
+	/* Enable I2C Controllers */
+	clrbits_le32(AST_SCU_BASE + AST_SCU_RESET, SCU_RESET_I2C);
+
+	if (bus_num >= 3) {
+		setbits_le32(AST_SCU_BASE + AST_SCU_FUN_PIN_CTRL5,
+					 SCU_FUN_PIN_I2C(bus_num));
+#ifdef AST_SOC_G5
+	/* In AST2400 aka AST_SOC_G4 SDA{1,2}/SCL{1,2} are fixed function pins,
+	 * so no need to change their function. */
+	} else if (bus_num == 1) {
+		setbits_le32(AST_SCU_BASE + AST_SCU_FUN_PIN_CTRL8,
+					 SCU_FUN_PIN_SDA1 | SCU_FUN_PIN_SCL1);
+	} else if (bus_num == 2) {
+		setbits_le32(AST_SCU_BASE + AST_SCU_FUN_PIN_CTRL8,
+					 SCU_FUN_PIN_SDA2 | SCU_FUN_PIN_SCL2);
+#endif
+	}
+}
-- 
2.8.0.rc3.226.g39d4020
