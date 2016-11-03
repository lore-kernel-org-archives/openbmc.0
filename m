Return-Path: <maxims@google.com>
Received: from mail-pf0-x22e.google.com (mail-pf0-x22e.google.com
 [IPv6:2607:f8b0:400e:c00::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t8tSX6hSDzDvPx
 for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2016 05:15:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=SHF9kMr4; 
 dkim-atps=neutral
Received: by mail-pf0-x22e.google.com with SMTP id n85so35654781pfi.1
 for <openbmc@lists.ozlabs.org>; Thu, 03 Nov 2016 11:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=lNmBSia75mIPwAkHSmTJYXw/EkvxTwEjwv+x+oDZ54g=;
 b=SHF9kMr4jT6k0okuj1qVjDe8BhB8X8rFC61WAeExd9VSivzrDscAXQAhP9MPr5J/4X
 Lo8tBZMP1IE85l9XbsGPQFOUBsY0vqklAoqAVQBtKOAeg/+kEcuAchVwM10cf+GfjaGM
 19BdAXlcC/imcN94b5cQqTCiNqIEIHZp+UJhONPya41nE7ZYyV8B78/74a9tO5mFwdGd
 GBXz2AwOcUoFZ1xj+J1qqc1uNk2f2ER5HSJBXMf8AtpCqbqH1xTg7DvmPRxMmMoWL3by
 Hp8TP08isEkqIpKutNlra5anSs8bNVDkkSQm6AdKScpF2PeF64t9O/CqBMVL9Z7caGQg
 4N7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=lNmBSia75mIPwAkHSmTJYXw/EkvxTwEjwv+x+oDZ54g=;
 b=XatiOc0GQLbnnj7SGXoCbs35niwAgyHIttE4xb3+rHUmVd+nS93riTgNNLcuhaiBWJ
 Z+rq1ulVW1Tzuxo5xymtQuUmK/C8CUfooTI0GpaQlHxnbXChFWlb52Bm8016nx9c7ose
 Vm5I7ERT6z41mwNmJvmzyNT1RQUcPgI5enuLqSiUffl4FTyjiNKHGsDLDyVraManp+rK
 PUrtCPlI4pkDInNmbPsQDT5WoJzmIPwY8a6dPI2OPPmpbis0Gsi1BqipyN1xCKObCDMK
 iROHWP1ywiKLesEOkhYraeUDX1nG+3lQp8uSM0r/fp2X9PebvZGsDVYzZFN8PgtW150N
 13rw==
X-Gm-Message-State: ABUngvdXm0QNTQk7UHS29LXnYEbXRD2a4qBcFs1vIs0nsgNMu5ZtcqWSAIBxUYO6UeOTfBT4
X-Received: by 10.98.108.4 with SMTP id h4mr18863660pfc.11.1478196954627;
 Thu, 03 Nov 2016 11:15:54 -0700 (PDT)
Received: from mxsl.svl.corp.google.com ([100.123.242.80])
 by smtp.gmail.com with ESMTPSA id h5sm14297843pfg.86.2016.11.03.11.15.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 03 Nov 2016 11:15:54 -0700 (PDT)
From: maxims@google.com
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot 4/5] aspeed: Added function to configure pins for I2C
 devices.
Date: Thu,  3 Nov 2016 11:15:03 -0700
Message-Id: <1478196904-143229-4-git-send-email-maxims@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1478196904-143229-1-git-send-email-maxims@google.com>
References: <1478196904-143229-1-git-send-email-maxims@google.com>
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
X-List-Received-Date: Thu, 03 Nov 2016 18:15:57 -0000

From: Maxim Sloyko <maxims@google.com>

In the absence of pinmux driver, I2C driver will be
configuring pins directly.

Signed-off-by: Maxim Sloyko <maxims@google.com>
---
 arch/arm/include/asm/arch-aspeed/ast_scu.h |  5 +++++
 arch/arm/mach-aspeed/ast-scu.c             | 28 ++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/arch/arm/include/asm/arch-aspeed/ast_scu.h b/arch/arm/include/asm/arch-aspeed/ast_scu.h
index eb5aaa2..80ebd6f 100644
--- a/arch/arm/include/asm/arch-aspeed/ast_scu.h
+++ b/arch/arm/include/asm/arch-aspeed/ast_scu.h
@@ -46,4 +46,9 @@ extern void ast_scu_init_eth(u8 num);
 extern void ast_scu_multi_func_eth(u8 num);
 extern void ast_scu_multi_func_romcs(u8 num);
 
+/* Enable I2C controller and pins for a particular device.
+ * Device numbering starts at 1
+ */
+extern void ast_scu_enable_i2c(u8 num);
+
 #endif
diff --git a/arch/arm/mach-aspeed/ast-scu.c b/arch/arm/mach-aspeed/ast-scu.c
index e00dbe2..b5aa8bf 100644
--- a/arch/arm/mach-aspeed/ast-scu.c
+++ b/arch/arm/mach-aspeed/ast-scu.c
@@ -507,3 +507,31 @@ void ast_scu_get_who_init_dram(void)
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
