Return-Path: <maxims@google.com>
Received: from mail-pf0-x22d.google.com (mail-pf0-x22d.google.com
 [IPv6:2607:f8b0:400e:c00::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t8tST1QBSzDvPH
 for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2016 05:15:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=KlNq87U9; 
 dkim-atps=neutral
Received: by mail-pf0-x22d.google.com with SMTP id 189so35672887pfz.3
 for <openbmc@lists.ozlabs.org>; Thu, 03 Nov 2016 11:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=l+ePO//fIz5kfvTPbirRNjxaTZTkvCHBCKLksPi9XE4=;
 b=KlNq87U9BU6hca0slry5Vfojcx2F0YHxtSVV1LFLfUk5kYJZdzKrqsj6XCqzL+SE/X
 KogpHqNk8x4zcuCGwQbCvoSCVs8L0WkdslL771Ua/HwJ+KlcCZso6szYsEQCudK1YzQs
 hMyOp5Xr2sLQ7fBAH5S6cXrjUVLAjeCJKqsgEoGO7lK2s5tVyxMQrNiuTKc/8L9BY0o9
 2UqJ0UpXilRXVH/e3MI1D9zrNp85YGec+JItzmtIkyawDw4uLr7QM0zRvG2t6XWNtDWT
 KfUox1oRZNgX4QsoUZGM7foDLE02tamGN55JIHYF95FqXQ7swt8Cy8VTcu1AP12p5u3z
 T/jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=l+ePO//fIz5kfvTPbirRNjxaTZTkvCHBCKLksPi9XE4=;
 b=Mle0TmE7K+cODrpHXIJ6rYGn/CA2O6oB3AbXeEPcMrGxIu2OWa9tO9mVig5nrXRvKt
 vnmeMCanULHSH98Bxk/AjSPwpy8QdjmL2UkC6I+H7Tn51dsLDgGaiRK1Fds9uXDvOsLm
 BjrH+Yh61Ee6Gc3mcL8oVfEuoxiU+VHgq6OI9kdF6Q+gO0aFYYF1kla1309K6jlUOyRP
 A4azt/h2Zehn3uq1rThb7XhsBCGyWJqO7nQYXVO1sxtBYDAwVSX3aQpdvKhbIwlhAHqs
 b5HzGbzxn3VBRCWvsAracdEqCTLm57SmntjymSnplU899iawFcTCNBFIHFl0hhWebJg1
 F41Q==
X-Gm-Message-State: ABUngvd+f9cVbWQG6Elw2VfU7f+m5YSt7Z1N3f5oKA4uVArw/d3kjRM3khumUHbaGmIsSvO8
X-Received: by 10.99.126.74 with SMTP id o10mr15578614pgn.66.1478196951015;
 Thu, 03 Nov 2016 11:15:51 -0700 (PDT)
Received: from mxsl.svl.corp.google.com ([100.123.242.80])
 by smtp.gmail.com with ESMTPSA id h5sm14297843pfg.86.2016.11.03.11.15.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 03 Nov 2016 11:15:50 -0700 (PDT)
From: maxims@google.com
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot 3/5] aspeed: Added function to calculate APB Clock
 frequency.
Date: Thu,  3 Nov 2016 11:15:02 -0700
Message-Id: <1478196904-143229-3-git-send-email-maxims@google.com>
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
X-List-Received-Date: Thu, 03 Nov 2016 18:15:53 -0000

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
