Return-Path: <maxims@google.com>
Received: from mail-pf0-x22c.google.com (mail-pf0-x22c.google.com
 [IPv6:2607:f8b0:400e:c00::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3slSNV5HG2zDvHQ
 for <openbmc@lists.ozlabs.org>; Fri, 30 Sep 2016 07:28:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=iplxKoV3; 
 dkim-atps=neutral
Received: by mail-pf0-x22c.google.com with SMTP id 21so32808970pfy.0
 for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2016 14:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=4NI3kSRI1PqipMQOo0kx6KDvcIkFwap/Ru56EkM+dD0=;
 b=iplxKoV3Pkj3mqr+i4TXDbxix1KDh2N35/gRW3G3zjfAlbeVs+oT2t4J55Psd4eDnf
 CqG1fnwyDCKkfE/PKesFWUg6u0UtYEyQSY++2m060hTMw6deoVmWHMTNPWSlRYqRU00a
 +CAzZ0DdbH3kcL+3+BFkadtbyRJaYuw8lYI9shbG1TWCFlqhb5NCzrJqpSZZxYdDB2I7
 HzfnqyZu3RcAPsE2k/Gg8qqxNlIIXnJMOnjlvP5mjly2pQzxURzx+8qmNrt9w25ZDyjp
 HtHexqHZegvvwDIsJKLG4hLwXkKxRY9HAhMtGQGm+Ey7w27tuF4hfMNxGYc/TsWPa36d
 Cbsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=4NI3kSRI1PqipMQOo0kx6KDvcIkFwap/Ru56EkM+dD0=;
 b=kwt47iOz3wkygqjVD9JsvDsy1DiyBI4IvtNpPPhYDr8DitBfQOgfYmv0sYjQfqblKW
 HMmS9pne6SipotZgRSGcFi8IhZGUdCBC5HaGJbcI3dlXVTjnxOjG+z2dGbhge1p2s0t/
 EQaPhqJ6X0ly1SPxKjkVyhs+fQwrZED3IhP8A5ShhJHvSq6U0lBa6ANi+jDCEnrBch5/
 0aN5YjoGJvwsWRPrTp6pZ0e/X+KEL1lqHo2a8x5X1YzJj7KWQ0bjYEMqz5K4GtO0DJXg
 6LHMaFGjMNFzi5BySWbLEXAlv3eFqh535Qxs7JU0zWSArOCXCL+kFCug73NCQSAgTPY3
 pfDw==
X-Gm-Message-State: AA6/9RmLOEkx6GltHb9+p+RHvEZbc1IBCvbdNDAn6zZFgXGtzIR80O4jAQAT3dK8hSCVW+Fv
X-Received: by 10.98.202.17 with SMTP id n17mr5852290pfg.173.1475184488588;
 Thu, 29 Sep 2016 14:28:08 -0700 (PDT)
Received: from mxsl.svl.corp.google.com ([100.123.242.80])
 by smtp.gmail.com with ESMTPSA id p128sm22436351pfg.38.2016.09.29.14.28.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 29 Sep 2016 14:28:08 -0700 (PDT)
From: maxims@google.com
To: openbmc@lists.ozlabs.org
Subject: [PATCH 3/3] aspeed: SCU helper functions for I2C.
Date: Thu, 29 Sep 2016 14:27:07 -0700
Message-Id: <1475184427-144121-3-git-send-email-maxims@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1475184427-144121-1-git-send-email-maxims@google.com>
References: <1474998214-12720-2-git-send-email-maxims@google.com>
 <1475184427-144121-1-git-send-email-maxims@google.com>
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
X-List-Received-Date: Thu, 29 Sep 2016 21:28:11 -0000

From: Maxim Sloyko <maxims@google.com>

SCU helper functions for configuring I2C pins and accessing APB clock.
---
 arch/arm/include/asm/arch-aspeed/ast_scu.h  |  6 +++++
 arch/arm/include/asm/arch-aspeed/regs-scu.h |  8 +++++++
 arch/arm/mach-aspeed/ast-scu.c              | 36 +++++++++++++++++++++++++++++
 3 files changed, 50 insertions(+)

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
index 280c421..5595873 100644
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
 
@@ -496,3 +507,28 @@ void ast_scu_get_who_init_dram(void)
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
