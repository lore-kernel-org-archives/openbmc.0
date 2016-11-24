Return-Path: <maxims@google.com>
Received: from mail-pg0-x22f.google.com (mail-pg0-x22f.google.com
 [IPv6:2607:f8b0:400e:c05::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tPKnG4B2QzDvnw
 for <openbmc@lists.ozlabs.org>; Thu, 24 Nov 2016 11:28:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="o+DyuEn4"; 
 dkim-atps=neutral
Received: by mail-pg0-x22f.google.com with SMTP id f188so11436894pgc.3
 for <openbmc@lists.ozlabs.org>; Wed, 23 Nov 2016 16:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=35x0NGyYj+gpFe2XxxgZeHjPBb4BHBXEa3s/aCXZuUU=;
 b=o+DyuEn4puSLiNyHsZhvhfEKlr3NL2R1HJHCz1FLtGzL2oTbfpEYjQBT1v3sIO7AFI
 2KnxWE4UrAOoYrZW1AsFjfmzu9LwgxsKaAbmgjQuc449UogfJxv5qhmhZfkrUuTT4ggS
 5lP46OtpWHMsOWDT2ce6fb1ZReUm2B7zln1kxDPsp3Ly3ln2PBCEAoQSquJMNHopYm5Y
 l3nqA/C//rE82yok5BFim4YgCJxBZ81ZKf6kN53Ao09zHp+GTF59uncpq0BeizLbkJNW
 7jjUY8hWO3q+xqhMVAMU4hxE3BHQ3hLpdIxDgWp8KAnk8796fMGcEOToats0jc4LZfhe
 2F9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=35x0NGyYj+gpFe2XxxgZeHjPBb4BHBXEa3s/aCXZuUU=;
 b=b0bFEwCulUszczLdgOUbvs2zPidPHKaPFtLGiPQd1h83jkR6zEJElkVOLlMgZIyIN6
 hrIVmip2uuSzuu/+M+QB+cLGFGer0kBSB8j+uN7Extm3F24kTE5YMkKPMPEPzw57yQZ1
 aeIwKC7zj+/eT84eMnDcDxDLWcv9wgWUbr0dnEGnsqKMiGgILFpF3MegDZwA0k0xUiTu
 1/bYY2tFeegaXnpgbvAOSVbUgGNGsORkcRBycNokdlY44FmQ0VDJdg43NH3I06NKs7Rc
 K2mkaOXIDwU66lZ3cd0tjsYVYMzEUNw5npiEo0t+HOR43JzRvc/sEVD7Gu494xp4XCf2
 0A2g==
X-Gm-Message-State: AKaTC03xYJKnHhKtruvgA+KKT2SDz8JsNOC5awlk33PPyT2yJXCRg6Tg2eWYIRwUO02UJGJk
X-Received: by 10.99.176.14 with SMTP id h14mr9935087pgf.22.1479947312875;
 Wed, 23 Nov 2016 16:28:32 -0800 (PST)
Received: from mxsl.svl.corp.google.com ([100.123.242.80])
 by smtp.gmail.com with ESMTPSA id d1sm55255435pfb.76.2016.11.23.16.28.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 23 Nov 2016 16:28:32 -0800 (PST)
From: Maxim Sloyko <maxims@google.com>
To: sjg@chromium.org
Cc: openbmc@lists.ozlabs.org,
	Maxim Sloyko <maxims@google.com>
Subject: [PATCH u-boot v2 5/6] aspeed: Add function to configure pins for I2C
 devices
Date: Wed, 23 Nov 2016 16:28:11 -0800
Message-Id: <1479947292-121635-5-git-send-email-maxims@google.com>
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
X-List-Received-Date: Thu, 24 Nov 2016 00:28:35 -0000

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
