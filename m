Return-Path: <maxims@google.com>
Received: from mail-pg0-x22c.google.com (mail-pg0-x22c.google.com
 [IPv6:2607:f8b0:400e:c05::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tPCcN5jdzzDw31
 for <openbmc@lists.ozlabs.org>; Thu, 24 Nov 2016 06:50:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="oMNSvUuV"; 
 dkim-atps=neutral
Received: by mail-pg0-x22c.google.com with SMTP id f188so9242082pgc.3
 for <openbmc@lists.ozlabs.org>; Wed, 23 Nov 2016 11:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=UG18gitPaJBc+5HfKoEdx6x6NOgvw0z4KVarC412SXk=;
 b=oMNSvUuV2EM9UJqSyAeATVvjCHQyF3p9bHcRrB2OHwyETzqUnE3p2NSzEC7CQTgpjj
 Wf3HeVVHvZQJmJRZAJluF6Cqs5q+vt2lzgw8YxjdmrUxIUo+frrBHv3r7YRC0LYq6aft
 xG/LLZ5Gy2T0nrPCePfrXP1OAARrz/xuKkihNBQ82vVBJmJMCmRi/gOydVgXxYOHeGk7
 LxNSvMHdVyCtk+j5Z8mTSQvF7h0g4z9GYdvu6Mq0ZKEIbPYDUrIDFu8j1G85LuFH6fd9
 sPdcUWL1Yzv9a8BVbU65zGb0UkmaD6zUhSsFtYIIL2Zy6UG2LMfgWxojq69P+GvAuWCX
 ZOYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=UG18gitPaJBc+5HfKoEdx6x6NOgvw0z4KVarC412SXk=;
 b=CNML2JbU4L1NFVOH0iaM/pyp2yeXxP7jy0BP74xoqcTHpP1RtMrHnm8wtXiX/A7v+H
 HDzP4wfUkXJhr2n1MNz8RLvTbwym3WTyTMhgIEXQqDaZpiQ+ihrtdTQZi+FZuGVfGSqv
 mlLkTcjuJbO+xDFqpuZBqWvYM2LtGvVYo3qU/FQNiVOLealBZrXP+9k3xC2ihByJhd9M
 EvvflSLtmmYH5jTr8gP4fi5+chU2yaZ74hJPUd2HFnXhnjhPYl538SlfMYc9GrqftefX
 egWLvCIhqPe1sTY90E9Grf9uZRyiiNpcFoioGBQagTC3/dYzDUcGvSjFsRFaLMRV7IB9
 Ee9Q==
X-Gm-Message-State: AKaTC004Yk/E4ioDCK8L2V7F9yxl6J/HnrpsqLV+1nwYx3hm1OKC6noGgIbtr9R2aTVAPWps
X-Received: by 10.84.197.1 with SMTP id m1mr9903720pld.75.1479930626847;
 Wed, 23 Nov 2016 11:50:26 -0800 (PST)
Received: from mxsl.svl.corp.google.com ([100.123.242.80])
 by smtp.gmail.com with ESMTPSA id b12sm52335523pfb.78.2016.11.23.11.50.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 23 Nov 2016 11:50:26 -0800 (PST)
From: Maxim Sloyko <maxims@google.com>
To: sjg@chromium.org
Cc: openbmc@lists.ozlabs.org,
	Maxim Sloyko <maxims@google.com>
Subject: [PATCH u-boot v1 4/6] aspeed: Add function to calculate APB Clock
 frequency
Date: Wed, 23 Nov 2016 11:50:00 -0800
Message-Id: <1479930602-91012-4-git-send-email-maxims@google.com>
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
X-List-Received-Date: Wed, 23 Nov 2016 19:50:29 -0000

This is needed by I2C driver.

Signed-off-by: Maxim Sloyko <maxims@google.com>
---
 arch/arm/include/asm/arch-aspeed/ast_scu.h |  4 ++++
 arch/arm/mach-aspeed/ast-scu.c             | 13 +++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/arch/arm/include/asm/arch-aspeed/ast_scu.h b/arch/arm/include/asm/arch-aspeed/ast_scu.h
index d248416..6f00e37 100644
--- a/arch/arm/include/asm/arch-aspeed/ast_scu.h
+++ b/arch/arm/include/asm/arch-aspeed/ast_scu.h
@@ -38,6 +38,10 @@ extern void ast_scu_get_who_init_dram(void);
 extern u32 ast_get_clk_source(void);
 extern u32 ast_get_h_pll_clk(void);
 extern u32 ast_get_ahbclk(void);
+/*
+ * Return the frequency of APB clock
+ */
+extern u32 ast_get_apbclk(void);
 
 extern u32 ast_scu_get_vga_memsize(void);
 
diff --git a/arch/arm/mach-aspeed/ast-scu.c b/arch/arm/mach-aspeed/ast-scu.c
index 280c421..87236e2 100644
--- a/arch/arm/mach-aspeed/ast-scu.c
+++ b/arch/arm/mach-aspeed/ast-scu.c
@@ -318,6 +318,19 @@ u32 ast_get_ahbclk(void)
 
 #endif /* AST_SOC_G5 */
 
+u32 ast_get_apbclk(void)
+{
+	ulong h_pll = ast_get_h_pll_clk();
+
+	/*
+	 * The formula for converting the bit pattern to divisor is
+	 * (4 + 4 * DIV), according to datasheet
+	 */
+	ulong apb_div = 4 + 4 * SCU_GET_PCLK_DIV(ast_scu_read(AST_SCU_CLK_SEL));
+	return h_pll / apb_div;
+}
+
+
 void ast_scu_show_system_info(void)
 {
 
-- 
2.8.0.rc3.226.g39d4020
