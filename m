Return-Path: <maxims@google.com>
Received: from mail-pf0-x22b.google.com (mail-pf0-x22b.google.com
 [IPv6:2607:f8b0:400e:c00::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w6HfM30ZZzDq9m
 for <openbmc@lists.ozlabs.org>; Tue, 18 Apr 2017 05:00:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Mq92hkTd"; 
 dkim-atps=neutral
Received: by mail-pf0-x22b.google.com with SMTP id 194so30289362pfv.3
 for <openbmc@lists.ozlabs.org>; Mon, 17 Apr 2017 12:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=yqGDb1Vk7pSyayZ7rgybseuBHM6tkU8G+1js+FYxDHA=;
 b=Mq92hkTdKygFPmZCBd/4E8Ouz2RDFpVDZzDA1a1tN4k4Wtrd8u4+tr+U8aPhNDwn1w
 mWG/R+lxN7UNA7TNnQdnJf/fE+sspAkSqp9SIgAQbrhjFb3iG+s0pve/5K2toR3T6420
 hHjF//S1nXBC7k6FjVLkpDqw4WP2tMe/WZ3y2sHLmJmhoiMgKN2JUksfZNbdqUup6U6B
 AhlVQQ7AGphYHpEhw8x7LyV02YY6K3YWptOEMOmErvUpR/Yjyn/WSKxpKA50bpHV+FJQ
 LOXljKzcoVZq+51Ub8wpnNDSZALhygCpv2l71GX9L6FJFOK/oO2z4d02Lv9blQnMZfIa
 A0dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=yqGDb1Vk7pSyayZ7rgybseuBHM6tkU8G+1js+FYxDHA=;
 b=ByreGsoU3w8c477qiYhiIvbhkHmyTvBO6gZ2zA+cSk68eB9HowTgsC6iC5DHqYeC3j
 Mm+SrhehRgLrkvQiCNpHjA7v34Zo7s6DgzsB2QfGGXgyM+VRhjBodDX+NtIUxkLU/AJ4
 5HBiWafrjgWeCTDs5V2VM8T5h1WLJDBBrmvtuC6SkMehzKCuej8y5wrAebJiK6qkRZLp
 gNZy1mffimyllBALHlBLvA76cAtvyfYBUkjxWVwvh+gHE10VwXl+8EmYcaLY/qzd1GJ9
 fub1bQfUA3gTgRTvYK1HJER4RHX/ZZdGGaTTnZPycG/LK/KxBckkMO9usjUoDLnQ3Ak1
 hZ/g==
X-Gm-Message-State: AN3rC/4E/3pII/TBk9ujCu9HGokhCwcOfmCttOJKUuNIGVRtngbMwzpz
 LRZGubvsPZn6PHIx
X-Received: by 10.84.213.137 with SMTP id g9mr17796421pli.53.1492455657452;
 Mon, 17 Apr 2017 12:00:57 -0700 (PDT)
Received: from mxsl.svl.corp.google.com ([100.123.242.80])
 by smtp.gmail.com with ESMTPSA id p80sm19526121pfk.50.2017.04.17.12.00.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 17 Apr 2017 12:00:56 -0700 (PDT)
From: Maxim Sloyko <maxims@google.com>
To: u-boot@lists.denx.de,
	Simon Glass <sjg@chromium.org>
Cc: openbmc@lists.ozlabs.org, Maxim Sloyko <maxims@google.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>
Subject: [PATCH v1 04/15] aspeed: Make SCU lock/unlock functions part of SCU
 API
Date: Mon, 17 Apr 2017 12:00:23 -0700
Message-Id: <20170417190034.71945-5-maxims@google.com>
X-Mailer: git-send-email 2.12.2.762.g0e3151a226-goog
In-Reply-To: <20170417190034.71945-1-maxims@google.com>
References: <20170417190034.71945-1-maxims@google.com>
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
X-List-Received-Date: Mon, 17 Apr 2017 19:00:59 -0000

Make functions for locking and unlocking SCU part of SCU API.
Many drivers need to modify settings in SCU and thus need to unlock it
first. This change makes it possible.

Signed-off-by: Maxim Sloyko <maxims@google.com>
---

Changes in v1: None

 arch/arm/include/asm/arch-aspeed/scu_ast2500.h | 14 ++++++++++++++
 arch/arm/mach-aspeed/ast2500/clk_ast2500.c     | 15 +++++++++++++++
 drivers/clk/aspeed/clk_ast2500.c               | 18 ++----------------
 3 files changed, 31 insertions(+), 16 deletions(-)

diff --git a/arch/arm/include/asm/arch-aspeed/scu_ast2500.h b/arch/arm/include/asm/arch-aspeed/scu_ast2500.h
index fc0c01ae33..0fa3ecb9b9 100644
--- a/arch/arm/include/asm/arch-aspeed/scu_ast2500.h
+++ b/arch/arm/include/asm/arch-aspeed/scu_ast2500.h
@@ -120,6 +120,20 @@ int ast_get_clk(struct udevice **devp);
  */
 void *ast_get_scu(void);
 
+/**
+ * ast_scu_unlock() - unlock protected registers
+ *
+ * @scu, pointer to ast2500_scu
+ */
+void ast_scu_unlock(struct ast2500_scu *scu);
+
+/**
+ * ast_scu_lock() - lock protected registers
+ *
+ * @scu, pointer to ast2500_scu
+ */
+void ast_scu_lock(struct ast2500_scu *scu);
+
 #endif  /* __ASSEMBLY__ */
 
 #endif  /* _ASM_ARCH_SCU_AST2500_H */
diff --git a/arch/arm/mach-aspeed/ast2500/clk_ast2500.c b/arch/arm/mach-aspeed/ast2500/clk_ast2500.c
index 079909fa64..30cfac1af0 100644
--- a/arch/arm/mach-aspeed/ast2500/clk_ast2500.c
+++ b/arch/arm/mach-aspeed/ast2500/clk_ast2500.c
@@ -6,6 +6,7 @@
 
 #include <common.h>
 #include <dm.h>
+#include <asm/io.h>
 #include <asm/arch/scu_ast2500.h>
 
 int ast_get_clk(struct udevice **devp)
@@ -28,3 +29,17 @@ void *ast_get_scu(void)
 
 	return priv->scu;
 }
+
+void ast_scu_unlock(struct ast2500_scu *scu)
+{
+	writel(SCU_UNLOCK_VALUE, &scu->protection_key);
+	while (!readl(&scu->protection_key))
+		;
+}
+
+void ast_scu_lock(struct ast2500_scu *scu)
+{
+	writel(~SCU_UNLOCK_VALUE, &scu->protection_key);
+	while (readl(&scu->protection_key))
+		;
+}
diff --git a/drivers/clk/aspeed/clk_ast2500.c b/drivers/clk/aspeed/clk_ast2500.c
index 26a5e58221..504731271c 100644
--- a/drivers/clk/aspeed/clk_ast2500.c
+++ b/drivers/clk/aspeed/clk_ast2500.c
@@ -132,20 +132,6 @@ static ulong ast2500_clk_get_rate(struct clk *clk)
 	return rate;
 }
 
-static void ast2500_scu_unlock(struct ast2500_scu *scu)
-{
-	writel(SCU_UNLOCK_VALUE, &scu->protection_key);
-	while (!readl(&scu->protection_key))
-		;
-}
-
-static void ast2500_scu_lock(struct ast2500_scu *scu)
-{
-	writel(~SCU_UNLOCK_VALUE, &scu->protection_key);
-	while (readl(&scu->protection_key))
-		;
-}
-
 static ulong ast2500_configure_ddr(struct ast2500_scu *scu, ulong rate)
 {
 	ulong clkin = ast2500_get_clkin(scu);
@@ -197,9 +183,9 @@ static ulong ast2500_configure_ddr(struct ast2500_scu *scu, ulong rate)
 	    | (best_num << SCU_MPLL_NUM_SHIFT)
 	    | (best_denum << SCU_MPLL_DENUM_SHIFT);
 
-	ast2500_scu_unlock(scu);
+	ast_scu_unlock(scu);
 	writel(mpll_reg, &scu->m_pll_param);
-	ast2500_scu_lock(scu);
+	ast_scu_lock(scu);
 
 	return ast2500_get_mpll_rate(clkin, mpll_reg);
 }
-- 
2.12.2.762.g0e3151a226-goog
