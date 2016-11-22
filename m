Return-Path: <maxims@google.com>
Received: from mail-pg0-x236.google.com (mail-pg0-x236.google.com
 [IPv6:2607:f8b0:400e:c05::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tNj722CJ5zDvxY
 for <openbmc@lists.ozlabs.org>; Wed, 23 Nov 2016 10:56:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="nXGyIP6g"; 
 dkim-atps=neutral
Received: by mail-pg0-x236.google.com with SMTP id 3so12618618pgd.0
 for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2016 15:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=gBcBKeUsLceUMsWSpEo0T9UgRheYEJnem8NjvkhIVDc=;
 b=nXGyIP6g6ipuf1xFq/iwWE40bwLmZHmtfFJcpbhiXZZOwCRwUW3Rhp1VNZLLZfIM3N
 /S6H5F7u0p5M0qri0E+EeHpQLyB948YU5//uYzQKwbLi6MswnT3GrU5dTb+TS3shtTGy
 lwBfP+NXOquVm0JcdwcKR0ByOqvx6FK/xRxM4mWn9oZHfawfRKJwBTMJbO4NleJKnnK0
 MHdQYlKQYphZVcQm24AdaxYKBhMhTmIKsi+P1kbvat17Q54iszGFh8oIazUF9TSkajaX
 u+0qfRwRikati8O5MKLE6UfsXLVtiArjmKds/JeLpS8/9Of1Iw1JjyY5iuvLwl1p0OxW
 eHLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=gBcBKeUsLceUMsWSpEo0T9UgRheYEJnem8NjvkhIVDc=;
 b=ARFVFaAi8ynhPyR6jed9XMDBv0yStUx32XShAT3/6/+VEedGKsCvuVW+kjBdHrXobM
 q1RwzZjxPL+TTJfAqMyluw/OJWVJL8vo9wd7XaBD3zdg8ZUTa05WtPlCjm6Vgcikj7X9
 rPJPssTIaIfar4kL1T0kUdcETQL7pzzSXFTdC8ahNp2wRQsH8pOyIUtcPROP2a7eVxxv
 yAT8T0sUdREK9GgWQ8fXntn8L97n6Oxkr1IAx3WGTRcfCvLDbYPF+W0GootuXcsJEQmZ
 1dLuOp2CrSKoc1nDT66UTDO0oXkLhmx/iW93+zOSLcnd+Mlt8Y8tKg3cMIiSc3rAFLjr
 ZVWQ==
X-Gm-Message-State: AKaTC01kc4c6u8hXjOz1LKU9oigSnBrgh1QQcAwSvY3l482gDzSDZjYI3Nc+OkPw//zmBwmf
X-Received: by 10.98.222.194 with SMTP id h185mr248787pfg.130.1479859004334;
 Tue, 22 Nov 2016 15:56:44 -0800 (PST)
Received: from mxsl.svl.corp.google.com ([100.123.242.80])
 by smtp.gmail.com with ESMTPSA id s2sm47626060pfi.10.2016.11.22.15.56.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 22 Nov 2016 15:56:43 -0800 (PST)
From: maxims@google.com
To: sjg@google.com
Cc: u-boot@lists.denx.de, openbmc@lists.ozlabs.org,
 Maxim Sloyko <maxims@google.com>
Subject: [PATCH u-boot 2/5] aspeed: Fixed incosistency in some SCU registers
 naming.
Date: Tue, 22 Nov 2016 15:56:13 -0800
Message-Id: <1479858976-139210-3-git-send-email-maxims@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1479858976-139210-1-git-send-email-maxims@google.com>
References: <1479858976-139210-1-git-send-email-maxims@google.com>
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
X-List-Received-Date: Tue, 22 Nov 2016 23:56:47 -0000

From: Maxim Sloyko <maxims@google.com>

Basically fixed FUC/FUN typo that went out of hand.

Signed-off-by: Maxim Sloyko <maxims@google.com>
---
 arch/arm/include/asm/arch-aspeed/regs-scu.h | 73 ++++++++++++++++-------------
 arch/arm/mach-aspeed/ast-scu.c              |  2 +-
 2 files changed, 42 insertions(+), 33 deletions(-)

diff --git a/arch/arm/include/asm/arch-aspeed/regs-scu.h b/arch/arm/include/asm/arch-aspeed/regs-scu.h
index b714fa9..6cb4d0d 100644
--- a/arch/arm/include/asm/arch-aspeed/regs-scu.h
+++ b/arch/arm/include/asm/arch-aspeed/regs-scu.h
@@ -830,49 +830,53 @@
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
+#define SCU_I2C_MIN_BUS_NUM			(1)
+#define SCU_I2C_MAX_BUS_NUM			(14)
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
@@ -914,6 +918,11 @@
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
index 0cc0d67..280c421 100644
--- a/arch/arm/mach-aspeed/ast-scu.c
+++ b/arch/arm/mach-aspeed/ast-scu.c
@@ -394,7 +394,7 @@ void ast_scu_multi_func_eth(u8 num)
 			      AST_SCU_FUN_PIN_CTRL1);
 
 		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) |
-			      SCU_FUC_PIN_MAC1_MDIO,
+			      SCU_FUN_PIN_MAC1_MDIO,
 			      AST_SCU_FUN_PIN_CTRL5);
 
 		break;
-- 
2.8.0.rc3.226.g39d4020
