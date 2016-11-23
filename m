Return-Path: <maxims@google.com>
Received: from mail-pf0-x231.google.com (mail-pf0-x231.google.com
 [IPv6:2607:f8b0:400e:c00::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tPCcP3xpgzDw31
 for <openbmc@lists.ozlabs.org>; Thu, 24 Nov 2016 06:50:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="GGAHskt7"; 
 dkim-atps=neutral
Received: by mail-pf0-x231.google.com with SMTP id 189so4977565pfz.3
 for <openbmc@lists.ozlabs.org>; Wed, 23 Nov 2016 11:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=35x0NGyYj+gpFe2XxxgZeHjPBb4BHBXEa3s/aCXZuUU=;
 b=GGAHskt7+EpNMItzJaKsUAt+pOKukhFJIaY/sgGVThf76VGcIG8V3smB3o/Dk2BgbI
 VKEAjf04Q8+IXEDPfLlD08XJSOp3iNv2XjG2+zdAEnm4yMvx++nRkihd+U5uk947kXH0
 EmI4Hmv4iUMddiAOlKlBVlHN3oHljC2KSY9w3At3+jz0l3ifqGblvoIfhZIsNwl1FVk7
 xS4KvqBsP/cUgiLi+jV25WKIugBaEbHTmCk+XDAjWKtos019sTCN/F8MtCg8EMbucPxV
 zB6fqLhMqBWs/FBnjJP2SPxJODA8XXU7UtYFIoLVBy+IMM3lfwMGu0OOON+2W5uyksMg
 8qtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=35x0NGyYj+gpFe2XxxgZeHjPBb4BHBXEa3s/aCXZuUU=;
 b=QztkekfUfjJC2KraFclXMYi5bZsiX7DQb3CcsT6McLIDplf0UQKm3z+w99/R4I4ypX
 2wx/GzdA5Mqd2zKRkRuQPlO/CV7RuUGvg7lF3i86q8Hz+Rn1N1jKJ38kNfHoAr6hAKWJ
 vLiMhFnjgMtYiJ3RSTFOyc39p3yVln73rXGbDrBiI7bj+52NbE2u8mHuda3h9yxp4CAH
 +JNSBcIU/O7JbrhWeam2In4lv5x9+Bvrk1o0uP51WqmbP/QTIhUqu1RbV9UxvnYN/+Qw
 s8fmczoscCV9sLL5IIA2D9uton+sA9M4cOpNYg43xDdly1uChGKKWC2TJABExffxFuTb
 5VOw==
X-Gm-Message-State: AKaTC00oWwUy903NexyLWHjrFPsf7svQz5oG99NdacoUU0blynrR+VssDdN06T9afj7wRURi
X-Received: by 10.98.213.7 with SMTP id d7mr4394453pfg.3.1479930627799;
 Wed, 23 Nov 2016 11:50:27 -0800 (PST)
Received: from mxsl.svl.corp.google.com ([100.123.242.80])
 by smtp.gmail.com with ESMTPSA id b12sm52335523pfb.78.2016.11.23.11.50.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 23 Nov 2016 11:50:27 -0800 (PST)
From: Maxim Sloyko <maxims@google.com>
To: sjg@chromium.org
Cc: openbmc@lists.ozlabs.org,
	Maxim Sloyko <maxims@google.com>
Subject: [PATCH u-boot v1 5/6] aspeed: Add function to configure pins for I2C
 devices
Date: Wed, 23 Nov 2016 11:50:01 -0800
Message-Id: <1479930602-91012-5-git-send-email-maxims@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1479930602-91012-1-git-send-email-maxims@google.com>
References: <1479858976-139210-1-git-send-email-maxims@google.com>
 <1479930602-91012-1-git-send-email-maxims@google.com>
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
X-List-Received-Date: Wed, 23 Nov 2016 19:50:30 -0000

In the absence of pinmux driver, I2C driver will be
configuring pins directly.

Signed-off-by: Maxim Sloyko <maxims@google.com>
---
 arch/arm/include/asm/arch-aspeed/ast_scu.h |  6 ++++++
 arch/arm/mach-aspeed/ast-scu.c             | 28 ++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/arch/arm/include/asm/arch-aspeed/ast_scu.h b/arch/arm/include/asm/arch-aspeed/ast_scu.h
index 6f00e37..5ab28cc 100644
--- a/arch/arm/include/asm/arch-aspeed/ast_scu.h
+++ b/arch/arm/include/asm/arch-aspeed/ast_scu.h
@@ -49,4 +49,10 @@ extern void ast_scu_init_eth(u8 num);
 extern void ast_scu_multi_func_eth(u8 num);
 extern void ast_scu_multi_func_romcs(u8 num);
 
+/*
+ * Enable I2C controller and pins for a particular device.
+ * Device numbering starts at 1
+ */
+extern void ast_scu_enable_i2c(u8 num);
+
 #endif
diff --git a/arch/arm/mach-aspeed/ast-scu.c b/arch/arm/mach-aspeed/ast-scu.c
index 87236e2..8232d88 100644
--- a/arch/arm/mach-aspeed/ast-scu.c
+++ b/arch/arm/mach-aspeed/ast-scu.c
@@ -509,3 +509,31 @@ void ast_scu_get_who_init_dram(void)
 		break;
 	}
 }
+
+void ast_scu_enable_i2c(u8 bus_num)
+{
+	if (bus_num > SCU_I2C_MAX_BUS_NUM) {
+		debug("%s: bus_num is out of range, must be [%d - %d]\n",
+		      __func__, SCU_I2C_MIN_BUS_NUM, SCU_I2C_MAX_BUS_NUM);
+		return;
+	}
+
+	if (bus_num == 0) {
+		/* Enable I2C Controllers */
+		clrbits_le32(AST_SCU_BASE + AST_SCU_RESET, SCU_RESET_I2C);
+	} else if (bus_num >= 3) {
+		setbits_le32(AST_SCU_BASE + AST_SCU_FUN_PIN_CTRL5,
+			     SCU_FUN_PIN_I2C(bus_num));
+	/* In earlier versions of the SoC these pins are always assigned to
+	 * respective I2C buses and require no configuration.
+	 */
+#ifdef AST_SOC_G5
+	} else if (bus_num == 1) {
+		setbits_le32(AST_SCU_BASE + AST_SCU_FUN_PIN_CTRL8,
+			     SCU_FUN_PIN_SDA1 | SCU_FUN_PIN_SCL1);
+	} else if (bus_num == 2) {
+		setbits_le32(AST_SCU_BASE + AST_SCU_FUN_PIN_CTRL8,
+			     SCU_FUN_PIN_SDA2 | SCU_FUN_PIN_SCL2);
+#endif
+	}
+}
-- 
2.8.0.rc3.226.g39d4020
