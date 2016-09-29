Return-Path: <maxims@google.com>
Received: from mail-pa0-x22a.google.com (mail-pa0-x22a.google.com
 [IPv6:2607:f8b0:400e:c03::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3slSNJ3CzszDvHW
 for <openbmc@lists.ozlabs.org>; Fri, 30 Sep 2016 07:28:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=Tsr0I8Yp; 
 dkim-atps=neutral
Received: by mail-pa0-x22a.google.com with SMTP id oz2so31320930pac.2
 for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2016 14:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ONH49sa62LB07RPltOb8kSuCb85q75ueEO4uW8aumSE=;
 b=Tsr0I8Ypef21QD8c2OMX91mSHcmMDfBIrH7wSgrqBw2Z9Cmh7qHgr7nYZEV/YcNQH/
 yBIoweppWnHnT5ZmD7ZaJbZxRM4Br9SZz5NsyNKT21K4FUslp1KBexIMt8jX3cjyGNmQ
 H2fxgrRW4rI/MbsHU/PuPK0+wqf6xAZua7RKimYqTaRFnGS2XmY+SsjeTmu45T+Zd0dw
 TdXYNgHs0w9n+8Yj1k1BuqqLQWnpotvuqXHfYZF+3S5+ACRJrHIbakxZKr/0Y7XeY9xU
 c/7kAvm3vQCQ7dgfHoHX/nyopHC4xgV3GR0LXlvQdhqz1H/vAe0Ye1T5JwR0+8JSMkOF
 p+ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ONH49sa62LB07RPltOb8kSuCb85q75ueEO4uW8aumSE=;
 b=C2vmzZeftwT74uO8eGFP5UPNI3G3UTsn+BMhhd7kedQFrzeXaGYA+rSkAg1DfPdIDz
 WSg4vkURod7EKPfKf2acWpYoNwBnDEmHGVNXkJlqHzj+rJ+kougDcfXL1maJhyY3oTK1
 oWsxTVee+rGx9fYY52wsyBjfOMfNHL6oriMi5ygwZBIiblSe4NIrNhftaP109sSHLV1a
 HxvHnvc8uIXUnBbn90bamldM06RhF02ld0Q0Dt+QmFrICY9qTH3AyS/o+bxw/gFcKH4b
 DwYPY6u16VLL7w0pli6OYaQEtwuRsKTojEcesk9w2LWQd8C9sjBZig4Qjq9B7v+3hCSD
 6sXg==
X-Gm-Message-State: AA6/9RkB7xA8/AfnkBR2A3voDhtfCtUJunS/asO6i3RXlATINWVJzeGZCJ0z7HF546SRVHkB
X-Received: by 10.66.199.38 with SMTP id jh6mr5929269pac.160.1475184478781;
 Thu, 29 Sep 2016 14:27:58 -0700 (PDT)
Received: from mxsl.svl.corp.google.com ([100.123.242.80])
 by smtp.gmail.com with ESMTPSA id p128sm22436351pfg.38.2016.09.29.14.27.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 29 Sep 2016 14:27:58 -0700 (PDT)
From: maxims@google.com
To: openbmc@lists.ozlabs.org
Subject: [PATCH 2/3] aspeed: Fixed FUC -> FUN typo in SCU.
Date: Thu, 29 Sep 2016 14:27:06 -0700
Message-Id: <1475184427-144121-2-git-send-email-maxims@google.com>
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
X-List-Received-Date: Thu, 29 Sep 2016 21:28:01 -0000

From: Maxim Sloyko <maxims@google.com>

Fixed FUC -> FUN typo in SCU.
---
 arch/arm/include/asm/arch-aspeed/regs-scu.h | 65 +++++++++++++++--------------
 arch/arm/mach-aspeed/ast-scu.c              |  2 +-
 2 files changed, 34 insertions(+), 33 deletions(-)

diff --git a/arch/arm/include/asm/arch-aspeed/regs-scu.h b/arch/arm/include/asm/arch-aspeed/regs-scu.h
index b714fa9..aab032a 100644
--- a/arch/arm/include/asm/arch-aspeed/regs-scu.h
+++ b/arch/arm/include/asm/arch-aspeed/regs-scu.h
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
