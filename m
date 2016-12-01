Return-Path: <maxims@google.com>
Received: from mail-pg0-x231.google.com (mail-pg0-x231.google.com
 [IPv6:2607:f8b0:400e:c05::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tV9Bc3nHMzDvh7
 for <openbmc@lists.ozlabs.org>; Fri,  2 Dec 2016 08:18:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="VobsCl1S"; 
 dkim-atps=neutral
Received: by mail-pg0-x231.google.com with SMTP id f188so98615510pgc.3
 for <openbmc@lists.ozlabs.org>; Thu, 01 Dec 2016 13:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=SyuOPfUljRV5H1D5z4ew8qAbN7hj106LXyOynjNUomg=;
 b=VobsCl1SVcMx5qVAkGrZnLBfeD+8Rgl33TKCADBg6/a4ifucv4abQBnNWgsUsmBd5E
 AUGabzr1nekpVd12Yl7gsAdcRr3AHKD4e8dOS4aZh2bGAXX0jVQm89UusEuEFMG2vfNp
 EIUbNl+GxlQjDINclRHpG0irZjhKyd/KMJav5udragK4T+OiP4ZsZG3xiU8Wy+5yir5b
 GoOCNKcFYz6qPZJH9cVeiUWXgFL7UHiwF4OXnSrjHKFnMejG8Qo1UjRVHtxTvONcFDbO
 tqrdvQXhO1wKlQ5jyhM47oKuPBVQrqU1fV0xPp51DbjrzQU8vBWgH/bvpJ3DezfYIEZJ
 DY2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=SyuOPfUljRV5H1D5z4ew8qAbN7hj106LXyOynjNUomg=;
 b=BA2sjYm6vX1HbBvdTi7Ful8u49aSBPLoL8uboQ7HwFcnLQrzSt9awyoquASiavttFz
 1apgpJa/77JW7raornJc2VCkrlV7VDsVdT0VSz1VCB7wh8lROv8vSfnMh36Ahydili2z
 2WTg7WcejFZjytsHxkXYpA36WDVzLGu/gGVKnoy+XI8RGLWw3XhIckJRYIpm7B+klV1A
 eZ0kvJv3invD7NCL1UzAshSav58UuBoJ53OzQIXNUvyI6Pg+okzO8kfOxhLwrPQqDFZt
 eXe12RBmF7+ZEDMwVG+zcBewDix0KkjvS+ZUbshS01jTGQOwuxcEXsUZRkRTY2PLnQk9
 bffw==
X-Gm-Message-State: AKaTC03E2jCAmNUXhfEzPiRdADdQkL4N7biU2XgkdazhswblIwskQE9pGGdqpR2hxi2y2Qj5
X-Received: by 10.84.177.129 with SMTP id x1mr84023236plb.105.1480627125917;
 Thu, 01 Dec 2016 13:18:45 -0800 (PST)
Received: from mxsl.svl.corp.google.com ([100.123.242.80])
 by smtp.gmail.com with ESMTPSA id r21sm2264446pfd.44.2016.12.01.13.18.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 01 Dec 2016 13:18:45 -0800 (PST)
From: Maxim Sloyko <maxims@google.com>
To: openbmc@lists.ozlabs.org
Cc: sjg@chromium.org,
	Maxim Sloyko <maxims@google.com>
Subject: [PATCH u-boot v3 2/6] aspeed: Fix FUC/FUN typo in SCU
Date: Thu,  1 Dec 2016 13:18:31 -0800
Message-Id: <1480627115-5759-2-git-send-email-maxims@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1480627115-5759-1-git-send-email-maxims@google.com>
References: <1480627115-5759-1-git-send-email-maxims@google.com>
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
X-List-Received-Date: Thu, 01 Dec 2016 21:18:49 -0000

Change FUC to FUN in SCU registers naming, which was a typo that go out
of hand

Signed-off-by: Maxim Sloyko <maxims@google.com>
Reviewed-by: Simon Glass <sjg@chromium.org>
---
Changes for v1:
	Patch split into two parts with this part only fixing the FUC->FUN typo.
---
 arch/arm/include/asm/arch-aspeed/regs-scu.h | 64 ++++++++++++++---------------
 arch/arm/mach-aspeed/ast-scu.c              |  2 +-
 2 files changed, 33 insertions(+), 33 deletions(-)

diff --git a/arch/arm/include/asm/arch-aspeed/regs-scu.h b/arch/arm/include/asm/arch-aspeed/regs-scu.h
index b714fa9..5445023 100644
--- a/arch/arm/include/asm/arch-aspeed/regs-scu.h
+++ b/arch/arm/include/asm/arch-aspeed/regs-scu.h
@@ -830,49 +830,49 @@
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
