Return-Path: <maxims@google.com>
Received: from mail-pf0-x233.google.com (mail-pf0-x233.google.com
 [IPv6:2607:f8b0:400e:c00::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vkhcv4C62zDqYl
 for <openbmc@lists.ozlabs.org>; Fri, 17 Mar 2017 08:36:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="BIOhsBNl"; 
 dkim-atps=neutral
Received: by mail-pf0-x233.google.com with SMTP id w189so30114843pfb.0
 for <openbmc@lists.ozlabs.org>; Thu, 16 Mar 2017 14:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=p4yNJygvN5oKMpAuQEqDKzqPA1r0k+9a1bjarTWn6Yc=;
 b=BIOhsBNlfjPrY0FCplzpW6ZxgEm3LjIWV51R2KYt9EiTUpzi5/70I6+ZwewiJdPyLQ
 v51eoy6sRBBVIuSnxirpaydG1zzLwltgMPcTuzVWvnBYkxGPbU0ABxTzaDGa6X6qGdqS
 SFzs5iRvRCN65O9LCMvfiqx2fzuDqMCr/+LqbS7C6QFChOo6ZUhtbebNIluFxeiM2REU
 fZHzuhtaozB7vd8ZT7FKxYRNOorC8F2fbhf4U6cEYwPk/p+ybzZ5l8UMFUOLlOnFaILw
 FK8e1CtA/io6IkMi5ZiBR+Xg+dFbDoUnJb16aNbLPUFvPYZcnEYd46Rf+IsaLGqVvgIl
 bJLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=p4yNJygvN5oKMpAuQEqDKzqPA1r0k+9a1bjarTWn6Yc=;
 b=Vve8DLg75gt8PqxM5PiihyQ5AaoUoaEaAQlqn0TIwJEg5spgCxrxTVidWexKfgk4CJ
 FdPLN6xxtZqkOYp9Evb4xb5gs/oLHUFt3kxN/+Lzc4/Q6r/FC/6OAqCF/deJ6bjlHpvi
 sABSaCtQNADcqH9Ut89gZxdzENKlBCLZsM9V6ydSCUTOFauI6VCLwy68/+aGQg1viPZc
 nPg4mUjPb3uGV9fzFvBRqJmwLBpJWe3OemkMfkK4/PivYpa8gKN5Vc3iToG3HnzOAdyC
 BtmQdzACfQH3hZKT81aOLiGw2wH6oocPTZg02c0NJfqMJyf/p2u+WTTKrhYaw07uy+K+
 ZAuQ==
X-Gm-Message-State: AFeK/H0wuZU+hfFW71R2vR+eN4y+yZnDBqMDsOdAhyXvo2zlkckPekgRJj7zsjh53DnuuGMD
X-Received: by 10.99.97.12 with SMTP id v12mr11286287pgb.124.1489700205861;
 Thu, 16 Mar 2017 14:36:45 -0700 (PDT)
Received: from mxsl.svl.corp.google.com ([100.123.242.80])
 by smtp.gmail.com with ESMTPSA id v17sm2191375pgc.20.2017.03.16.14.36.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 16 Mar 2017 14:36:45 -0700 (PDT)
From: Maxim Sloyko <maxims@google.com>
To: u-boot@lists.denx.de,
	Simon Glass <sjg@chromium.org>
Cc: openbmc@lists.ozlabs.org, Maxim Sloyko <maxims@google.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>
Subject: [PATCH 10/17] aspeed: Add P-Bus clock in ast2500 clock driver
Date: Thu, 16 Mar 2017 14:36:17 -0700
Message-Id: <20170316213624.140344-11-maxims@google.com>
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
X-List-Received-Date: Thu, 16 Mar 2017 21:36:48 -0000

Add P-Bus Clock support to ast2500 clock driver.
This is the clock used by I2C devices.

Signed-off-by: Maxim Sloyko <maxims@google.com>
---

 arch/arm/include/asm/arch-aspeed/scu_ast2500.h |  3 ++-
 drivers/clk/aspeed/clk_ast2500.c               | 11 +++++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/arm/include/asm/arch-aspeed/scu_ast2500.h b/arch/arm/include/asm/arch-aspeed/scu_ast2500.h
index 1cdd3b9198..319d75e05c 100644
--- a/arch/arm/include/asm/arch-aspeed/scu_ast2500.h
+++ b/arch/arm/include/asm/arch-aspeed/scu_ast2500.h
@@ -21,7 +21,8 @@
 #define SCU_MPLL_NUM_MASK		0xff
 #define SCU_MPLL_POST_SHIFT		13
 #define SCU_MPLL_POST_MASK		0x3f
-
+#define SCU_PCLK_DIV_SHIFT		23
+#define SCU_PCLK_DIV_MASK		7
 #define SCU_HPLL_DENUM_SHIFT		0
 #define SCU_HPLL_DENUM_MASK		0x1f
 #define SCU_HPLL_NUM_SHIFT		5
diff --git a/drivers/clk/aspeed/clk_ast2500.c b/drivers/clk/aspeed/clk_ast2500.c
index 504731271c..9e4c66ea85 100644
--- a/drivers/clk/aspeed/clk_ast2500.c
+++ b/drivers/clk/aspeed/clk_ast2500.c
@@ -110,6 +110,17 @@ static ulong ast2500_clk_get_rate(struct clk *clk)
 		rate = ast2500_get_mpll_rate(clkin,
 					     readl(&priv->scu->m_pll_param));
 		break;
+	case BCLK_PCLK:
+		{
+			ulong apb_div = 4 + 4 * ((readl(&priv->scu->clk_sel1)
+						  >> SCU_PCLK_DIV_SHIFT) &
+						 SCU_PCLK_DIV_MASK);
+			rate = ast2500_get_hpll_rate(clkin,
+						     readl(&priv->scu->
+							   h_pll_param));
+			rate = rate / apb_div;
+		}
+		break;
 	case PCLK_UART1:
 		rate = ast2500_get_uart_clk_rate(priv->scu, 1);
 		break;
-- 
2.12.0.367.g23dc2f6d3c-goog
