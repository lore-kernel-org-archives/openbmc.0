Return-Path: <maxims@google.com>
Received: from mail-pf0-x231.google.com (mail-pf0-x231.google.com
 [IPv6:2607:f8b0:400e:c00::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tNj731mpTzDvxg
 for <openbmc@lists.ozlabs.org>; Wed, 23 Nov 2016 10:56:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="BAzjZSdx"; 
 dkim-atps=neutral
Received: by mail-pf0-x231.google.com with SMTP id 189so6363675pfz.3
 for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2016 15:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=l+ePO//fIz5kfvTPbirRNjxaTZTkvCHBCKLksPi9XE4=;
 b=BAzjZSdxfZsLwPOJiVn6MOyaI3NtY1016lBdO+f1JerHSADVNWluxvkyihRBd8kr9V
 M8cv6/Ayd9g8ealOLwB4NturAm2LGJhLuuIK2xQ75hdH3mDG/tRGB9FMXqT6PNcvW25L
 i/alvvIlS7VF4fPp8NyG1jNw0/2eXvD7a6Il++rCjkuOGAi1yW7MFLs7b/SkQ0oSYE78
 sFl+vZ4hkW68NE9S1I0OQYji7ulPuD7xt74k/OUQWWILTxewt02xAR+n/bim3IJqb0Uz
 YgEyH1fbZxYPBa6iiKqfxFQ/RrejxeHS3n0fAG7HFCv4vfI7570BkO3VsyrZudZYGTp0
 nDig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=l+ePO//fIz5kfvTPbirRNjxaTZTkvCHBCKLksPi9XE4=;
 b=RaLw0K25B9IoDDJjWITqz/An9Lc9xts8AOMhYVTqnMsNlx2Tnqavuv0fvVF+52GHgM
 qn/tPv9HQWUXg0pl8ZG+l2m9AmuOfNrmXXYZUbe60xl66ZdwhPL7PIz6IaNucPDqqMjX
 Ha5OWIOL18HbAg6iLcTaYo/cqgO3XHZSVqH+soFfAU6qaf4fudhrQ2Sj9MDTqHaOXXPl
 bkDQmivCDpJTLMahpq6kDtDMpW06qVhme4ibzLSS/W/cRj2M7+Ykav1ndq92QKvip1W/
 AaZWK5jMvOd8Lhd0D10wp33pLn7Q9aH1yN3Wq7JWSGg4TJW7gCj2lTPmCYPZ3oSii6d+
 SRPg==
X-Gm-Message-State: AKaTC03ks9RAZtKluZCPYPHwowGWt7VCjuE5ok7qjM77QrPzeAdxElu2FW/3COoeg4k9Vw4l
X-Received: by 10.84.128.195 with SMTP id a61mr566398pla.55.1479859005157;
 Tue, 22 Nov 2016 15:56:45 -0800 (PST)
Received: from mxsl.svl.corp.google.com ([100.123.242.80])
 by smtp.gmail.com with ESMTPSA id s2sm47626060pfi.10.2016.11.22.15.56.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 22 Nov 2016 15:56:44 -0800 (PST)
From: maxims@google.com
To: sjg@google.com
Cc: u-boot@lists.denx.de, openbmc@lists.ozlabs.org,
 Maxim Sloyko <maxims@google.com>
Subject: [PATCH u-boot 3/5] aspeed: Added function to calculate APB Clock
 frequency.
Date: Tue, 22 Nov 2016 15:56:14 -0800
Message-Id: <1479858976-139210-4-git-send-email-maxims@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1479858976-139210-1-git-send-email-maxims@google.com>
References: <1479858976-139210-1-git-send-email-maxims@google.com>
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
X-List-Received-Date: Tue, 22 Nov 2016 23:56:47 -0000

From: Maxim Sloyko <maxims@google.com>

This is needed by I2C driver.

Signed-off-by: Maxim Sloyko <maxims@google.com>
---
 arch/arm/include/asm/arch-aspeed/ast_scu.h |  1 +
 arch/arm/mach-aspeed/ast-scu.c             | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/arm/include/asm/arch-aspeed/ast_scu.h b/arch/arm/include/asm/arch-aspeed/ast_scu.h
index d248416..eb5aaa2 100644
--- a/arch/arm/include/asm/arch-aspeed/ast_scu.h
+++ b/arch/arm/include/asm/arch-aspeed/ast_scu.h
@@ -38,6 +38,7 @@ extern void ast_scu_get_who_init_dram(void);
 extern u32 ast_get_clk_source(void);
 extern u32 ast_get_h_pll_clk(void);
 extern u32 ast_get_ahbclk(void);
+extern u32 ast_get_apbclk(void);
 
 extern u32 ast_scu_get_vga_memsize(void);
 
diff --git a/arch/arm/mach-aspeed/ast-scu.c b/arch/arm/mach-aspeed/ast-scu.c
index 280c421..e00dbe2 100644
--- a/arch/arm/mach-aspeed/ast-scu.c
+++ b/arch/arm/mach-aspeed/ast-scu.c
@@ -318,6 +318,17 @@ u32 ast_get_ahbclk(void)
 
 #endif /* AST_SOC_G5 */
 
+u32 ast_get_apbclk(void)
+{
+	u32 h_pll = ast_get_h_pll_clk();
+	/* The formula for converting the bit pattern to divisor is
+	 * (4 + 4 * DIV), according to datasheet
+	 */
+	u32 apb_div = 4 + 4 * SCU_GET_PCLK_DIV(ast_scu_read(AST_SCU_CLK_SEL));
+	return h_pll / apb_div;
+}
+
+
 void ast_scu_show_system_info(void)
 {
 
-- 
2.8.0.rc3.226.g39d4020
