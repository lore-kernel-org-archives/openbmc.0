Return-Path: <maxims@google.com>
Received: from mail-pg0-x231.google.com (mail-pg0-x231.google.com
 [IPv6:2607:f8b0:400e:c05::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tPKnD1pj0zDvnw
 for <openbmc@lists.ozlabs.org>; Thu, 24 Nov 2016 11:28:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="XqGLdz1n"; 
 dkim-atps=neutral
Received: by mail-pg0-x231.google.com with SMTP id p66so11533780pga.2
 for <openbmc@lists.ozlabs.org>; Wed, 23 Nov 2016 16:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=kstY6LZyj4bwxJ/7eUPDC1WUcSk0Ih85YnNx4t6O8C0=;
 b=XqGLdz1nkuLNMkhRsjGgatZecSFEb2zi1mQTkyByvKp6cDOIARgeUIItq3iw6P6Fgs
 +iN/Lg/ah1cB/vSkfdZB3cjikjQ92wen3XVC0O0FXq+rfD3Wbd2c9irWR3wQcv//mETU
 VQvJ2Bcj2Y8SbemGkBLqDysU4+AynsYkUE+qyngbCbVM8ZwPsmwFdmhL0XviMiykZnEM
 wdnNUe9yh5yNpUKGZArPWSqJ+AgEYWBq4Fu8kW4sD/0pekwxiSH1rXMiPxLyLhtV2Ucs
 5H+xJ3aw8QVGUrLHWO44sIjmVLsIeO1YK1pYhP7UAzPVUnSBY+Q2USWNmcphY8fsnhK9
 CK2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=kstY6LZyj4bwxJ/7eUPDC1WUcSk0Ih85YnNx4t6O8C0=;
 b=aQSQEtb6EPuteHBYDCA52G9qJaFmiXWxQK62AkcmZthSN5glYA4AIj9znrU6FsZx15
 u50IwdClOes2vW9MAlwAw93zrTRuKwx6OshonuAkqX35YMa2hzRIUkf3XNWbdC6yBwvV
 LP7BbvnGhSpTr5RICuDdLF6l7cKtzxuJL6MM2LNxEGmKfFaxtckr7SwspK6/nUuwRsH9
 JCdeJwMVamZ/tYNqnj3SDO5XhGPEvkj8zTRQlGd/3UTP0S0YCXLB0xJJCq+Sl+CjV+Hk
 dBFYepbwbCJR7r4PUSuevbtL6u/rzDGYnJ08nvXvrMQkMLrCQP9N+BwktnoMkoVgD6pL
 kUAA==
X-Gm-Message-State: AKaTC01D6M6Si1Lffik11KbKS03DPZ44iuOpE25pOix36Jg6uuR2br83WlTtcZYA6+TlsOt5
X-Received: by 10.84.216.26 with SMTP id m26mr12510794pli.22.1479947310302;
 Wed, 23 Nov 2016 16:28:30 -0800 (PST)
Received: from mxsl.svl.corp.google.com ([100.123.242.80])
 by smtp.gmail.com with ESMTPSA id d1sm55255435pfb.76.2016.11.23.16.28.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 23 Nov 2016 16:28:29 -0800 (PST)
From: Maxim Sloyko <maxims@google.com>
To: sjg@chromium.org
Cc: openbmc@lists.ozlabs.org,
	Maxim Sloyko <maxims@google.com>
Subject: [PATCH u-boot v2 2/6] aspeed: Fix FUC/FUN typo in SCU
Date: Wed, 23 Nov 2016 16:28:08 -0800
Message-Id: <1479947292-121635-2-git-send-email-maxims@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1479947292-121635-1-git-send-email-maxims@google.com>
References: <1479858976-139210-1-git-send-email-maxims@google.com>
 <1479947292-121635-1-git-send-email-maxims@google.com>
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
X-List-Received-Date: Thu, 24 Nov 2016 00:28:32 -0000

Change FUC to FUN in SCU registers naming, which was a typo that go out
of hand

Signed-off-by: Maxim Sloyko <maxims@google.com>
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
