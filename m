Return-Path: <maxims@google.com>
Received: from mail-pg0-x234.google.com (mail-pg0-x234.google.com
 [IPv6:2607:f8b0:400e:c05::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tPKnG0zZWzDvnn
 for <openbmc@lists.ozlabs.org>; Thu, 24 Nov 2016 11:28:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="IaPLZoR5"; 
 dkim-atps=neutral
Received: by mail-pg0-x234.google.com with SMTP id f188so11436804pgc.3
 for <openbmc@lists.ozlabs.org>; Wed, 23 Nov 2016 16:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=IyMLKezLze11lAn0+kVrqIpOhypnXsKl6+tdkXMbMcw=;
 b=IaPLZoR5CD9NM5gmp2c9SXG3PismHOPRycyZkVDD5Uo0VGw4TLb8opGRdsDJM43b/U
 cXCTBE49s+ycLP/YnFcdSfQxIs7IuVNZEaxkIQvRIh7lHvkZ7Wkrlxa3DVvxuc8YMfLd
 l5IdrnbbT5tjYNKq6SghabQKgE9BcEqbB5LnQ8B69Uziq7BDr4S4fI0L7kgErYFCwLc3
 jytBt0qbTH4Yf0TrOMmCjLDOMzmQcebvo6WutbXuCS6DaW0X+tg9K0ARp8H7RT0caon/
 hzyS80GpDNY0RPDu2UDUze66uWFltT5n/4VNIiEeT/Gn8c9qDX6cCEGUjOTtny6UOO78
 25MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=IyMLKezLze11lAn0+kVrqIpOhypnXsKl6+tdkXMbMcw=;
 b=Xe8GFW/E/58T9o3FLVrZ/lUAvRujGSgs7OYbswqxkv0kI1D+Ju4lSEV8oHoBiiPx5U
 dhTE9mPRq1sR+Kyybul/P7ApWx3ujMGe6w3KmDx0ExEwKjjWr+ZPCM7EbjJXt92aE5HM
 zNd/igraVGNREzgLWJMMV2OtQkX0Qrc7epPbbgbKAZRIOERBpZnkzzn1dXzSW/GAiAHg
 XfZhhmDl1s/asPLMhVZNI1fivmh5MAZyptt0O+CNRG0pijUCHIb+qArOCMhbfUUPxre8
 u27Y99940Ki+Ax78N3NDPYJXW5+KKvkvceK76REGAGnXCJB/Kqctg1lUY+YF5K6zqXXc
 aGOg==
X-Gm-Message-State: AKaTC00BprUypJMlEU92Xq8sbCSgJ3ISp6g56QbaFTVF9q1j8c93z7qGTg2RMZXeBj1N3sl4
X-Received: by 10.98.28.79 with SMTP id c76mr5503949pfc.8.1479947312138;
 Wed, 23 Nov 2016 16:28:32 -0800 (PST)
Received: from mxsl.svl.corp.google.com ([100.123.242.80])
 by smtp.gmail.com with ESMTPSA id d1sm55255435pfb.76.2016.11.23.16.28.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 23 Nov 2016 16:28:31 -0800 (PST)
From: Maxim Sloyko <maxims@google.com>
To: sjg@chromium.org
Cc: openbmc@lists.ozlabs.org,
	Maxim Sloyko <maxims@google.com>
Subject: [PATCH u-boot v2 4/6] aspeed: Add function to calculate APB Clock
 frequency
Date: Wed, 23 Nov 2016 16:28:10 -0800
Message-Id: <1479947292-121635-4-git-send-email-maxims@google.com>
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
X-List-Received-Date: Thu, 24 Nov 2016 00:28:34 -0000

This is needed by I2C driver.

Signed-off-by: Maxim Sloyko <maxims@google.com>
---
Changes for v1:
	Add function comment.
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
