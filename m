Return-Path: <maxims@google.com>
Received: from mail-pf0-x231.google.com (mail-pf0-x231.google.com
 [IPv6:2607:f8b0:400e:c00::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vkhcn6d84zDqYR
 for <openbmc@lists.ozlabs.org>; Fri, 17 Mar 2017 08:36:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Mxyc7aaq"; 
 dkim-atps=neutral
Received: by mail-pf0-x231.google.com with SMTP id o126so30113203pfb.3
 for <openbmc@lists.ozlabs.org>; Thu, 16 Mar 2017 14:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=dCBvUfQv3SLVl9AGGDxkjIWiFrDOGe8YWuo+q4McRzg=;
 b=Mxyc7aaqQV60slWnNVWa+QVqfAuzjtQqdqZ50QhCwAs8kLvId6ZT1KrdIV7pO0tbRP
 CraX8IPiwQBvG1Ld7bvwMxUdEyAzos3jEiegthqjNVI57IaLR13RaorpdDMaR49DOW18
 pVW9968dqUJbwvkY3VeIOLIjvXUiUO1dIv2cQrtVVV8EU+Q19iSojUfnkeqR02JtwVWh
 OJUi6vjwGE2qpaOyILaPB8D5MC45UOdFNR4gg2Pt6ljhxqWk9ZWYpcPXdz3RdzCYRbZ/
 znfovF8Q1AR1ANsiVeBRsZ7Ud3YXqx9ykcGEQj1FGoHSHAG5RUr+hGMO0Sc8KpSiTcwO
 e7WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=dCBvUfQv3SLVl9AGGDxkjIWiFrDOGe8YWuo+q4McRzg=;
 b=L7c44wikIHTGCat3ArpI/wOJa38A57g9skRpcWaXf3vyV8kMSzamcCnfV0O9ZoIYsY
 aKrjzGpSJQIVMCFUUvWb0tAq/YUMCrJcwWvAO66iBWniXC3O4ZiafysZFSWwHzAZVaCe
 BIe1DKXx115tZfF30+xULm+X/LiWc//0SmgC7cIlUJ4eePscQORYZDl8bDQ/o6NkYzP7
 FqOiXeU1HmYs8yktOMkfkYCc6fzM7dS2VbpK/qkZaoNissa2/sA8kMPaGEPq0usniGL6
 R8S2lImpTNsBz/Y1jzQJHlHdALgq5cj7+shheKs4xrR/n/QvhRjC717xo2YO9R+c2cYv
 sOfg==
X-Gm-Message-State: AFeK/H2nF56GA5hfrrDg+66wo1wmPYEH163ObuicqGwd16zEWMmHrbRP1OC+d1iRZRidxjyg
X-Received: by 10.98.101.71 with SMTP id z68mr12345087pfb.25.1489700199880;
 Thu, 16 Mar 2017 14:36:39 -0700 (PDT)
Received: from mxsl.svl.corp.google.com ([100.123.242.80])
 by smtp.gmail.com with ESMTPSA id v17sm2191375pgc.20.2017.03.16.14.36.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 16 Mar 2017 14:36:39 -0700 (PDT)
From: Maxim Sloyko <maxims@google.com>
To: u-boot@lists.denx.de,
	Simon Glass <sjg@chromium.org>
Cc: openbmc@lists.ozlabs.org, Maxim Sloyko <maxims@google.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>
Subject: [PATCH 04/17] aspeed: Make SCU lock/unlock functions part of SCU API
Date: Thu, 16 Mar 2017 14:36:11 -0700
Message-Id: <20170316213624.140344-5-maxims@google.com>
X-Mailer: git-send-email 2.12.0.367.g23dc2f6d3c-goog
In-Reply-To: <20170316213624.140344-1-maxims@google.com>
References: <20170316213624.140344-1-maxims@google.com>
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
X-List-Received-Date: Thu, 16 Mar 2017 21:36:42 -0000

Make functions for locking and unlocking SCU part of SCU API.
Many drivers need to modify settings in SCU and thus need to unlock it
first. This change makes it possible.

Signed-off-by: Maxim Sloyko <maxims@google.com>
---

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
2.12.0.367.g23dc2f6d3c-goog
