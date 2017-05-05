Return-Path: <maxims@google.com>
Received: from mail-pf0-x235.google.com (mail-pf0-x235.google.com
 [IPv6:2607:f8b0:400e:c00::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wKQpY3y01zDqCd
 for <openbmc@lists.ozlabs.org>; Sat,  6 May 2017 08:01:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="M1N2TXTd"; 
 dkim-atps=neutral
Received: by mail-pf0-x235.google.com with SMTP id v14so8211626pfd.2
 for <openbmc@lists.ozlabs.org>; Fri, 05 May 2017 15:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=2AH/tXSPLngFIKjx8uEJCD9c0l4zVMIqI2UrGBvB2UU=;
 b=M1N2TXTduBNJFnd2WrzaFMP0nFIi0ZMW5vdaHEVx4FKeZ7U2fn991FvYqATUzkSeIY
 bGcwAx4ZbeycH3XaTDm4zjWywI1uGwtnZtTJfm7jMevXk2BcQYlI1YjJfvrpZq3uS/16
 3KcKpgCoKF8dbDlAHpjCw3aAbbf24cqSry/7YXsaKfclXcR/zOxgZ5qd84T6QOw6PRvT
 Tnw1oUEHXOMafPIbUp/RbR/J3Z59z6pKF7Bx0hi3rZ0DSZahKM7TBoVCS8qYi3GaBKok
 XTp+j7S+0wLLvaIPA5oaTbdOnohcwFqaHn3VjaIqAImb6lH1VDeq708KO7tWaztHZxFc
 3UeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=2AH/tXSPLngFIKjx8uEJCD9c0l4zVMIqI2UrGBvB2UU=;
 b=hx1xuRveDdt2fU5cikZ5SI5z5oIGy1UO99NyvO9pXZQ7wAOQuy63lYdtzY2SWh7d+5
 IIBXPt0zTcNJayDVXHKdD26xD+tZ/Fu2nRJWBLMmLkCLvTkkOPZvIxN0QZgHWTaxUEH7
 LAr0KLKnC00p8vZzKdVSFPZ1KDl4DD25CJrvALtWjarYlWNn2snSJTGF7FaaLlxV17/1
 OkucG2i2F/MWM9lungEOmAMQKvzJxiAJcZGG2QvsBofPM1JZuzt+DPmmeW3ACEWe4xF3
 56vHxKRW4XytUMaBNfi2clmk5eg3hSsTmQ/QWil/z6D0q3wIf/cf2EEC8jOiczefhzCy
 gbZw==
X-Gm-Message-State: AN3rC/57tX2DbSqgDs2XddN8r83MZw793nQ0HL/6y/4stH79AxMUdUrm
 rDPnkXucnc3aoqXy
X-Received: by 10.84.230.135 with SMTP id e7mr69230728plk.20.1494021698537;
 Fri, 05 May 2017 15:01:38 -0700 (PDT)
Received: from mxsl.svl.corp.google.com ([100.123.242.80])
 by smtp.gmail.com with ESMTPSA id r131sm7768501pgr.67.2017.05.05.15.01.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 05 May 2017 15:01:37 -0700 (PDT)
From: Maxim Sloyko <maxims@google.com>
To: u-boot@lists.denx.de,
	Simon Glass <sjg@chromium.org>
Cc: openbmc@lists.ozlabs.org, Maxim Sloyko <maxims@google.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>
Subject: [PATCH v2 04/15] aspeed: Make SCU lock/unlock functions part of SCU
 API
Date: Fri,  5 May 2017 15:01:04 -0700
Message-Id: <20170505220115.143025-5-maxims@google.com>
X-Mailer: git-send-email 2.13.0.rc1.294.g07d810a77f-goog
In-Reply-To: <20170505220115.143025-1-maxims@google.com>
References: <20170417190034.71945-1-maxims@google.com>
 <20170505220115.143025-1-maxims@google.com>
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
X-List-Received-Date: Fri, 05 May 2017 22:01:42 -0000

Make functions for locking and unlocking SCU part of SCU API.
Many drivers need to modify settings in SCU and thus need to unlock it
first. This change makes it possible.

Signed-off-by: Maxim Sloyko <maxims@google.com>
Reviewed-by: Simon Glass <sjg@chromium.org>
---

Changes in v2: None
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
2.13.0.rc1.294.g07d810a77f-goog
