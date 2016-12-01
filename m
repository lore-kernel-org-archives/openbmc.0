Return-Path: <maxims@google.com>
Received: from mail-pg0-x234.google.com (mail-pg0-x234.google.com
 [IPv6:2607:f8b0:400e:c05::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tV9Bd5JtLzDvh7
 for <openbmc@lists.ozlabs.org>; Fri,  2 Dec 2016 08:18:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="a6KSeF1e"; 
 dkim-atps=neutral
Received: by mail-pg0-x234.google.com with SMTP id x23so99031674pgx.1
 for <openbmc@lists.ozlabs.org>; Thu, 01 Dec 2016 13:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=w8VGvm2/7NAHO787LuDFcP7AS/raXsCdyKQEXl5HG+U=;
 b=a6KSeF1enVPN4ZyAVs2+GgJlck0tnd8rhgwVxISB1o95nEwxsMq9hyQBY/Nxiu3fHh
 tjX3r9OCG/fhJwngyrYGAdrFlE60SAyOdLjrk9IVO2ffOjQ8asbDj3DRAGHCOZfbei1m
 Wolz1+AcmyYZYZQ0cQV8a3yeUL8dJJyMwKvTt3m5VgwDTXPk8pz9iUANJJRy4+89nDpm
 kLZ4PUPz/EcqoS1rUcdfS0G10SvPe4NU5zHvExRhfc+PGdWXpAh5xsaZ81kA3yuXtQ8B
 yIDn85zPb3XONT6VZ/fenE5q4Uywf8RNuX4l/BhmeZXgfbhk2ym8o9NnCSwOPDYzp+FW
 /rOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=w8VGvm2/7NAHO787LuDFcP7AS/raXsCdyKQEXl5HG+U=;
 b=kIauQNEiFkWn2MnPf4EUUy/ZcO/8FPOuLCPhElA03YVXzaWzMG2qHXU74cnmeFatlz
 k/9md5KefROnCQMgcsCenIvoKS21CnFjhQoWWq1Kum2qXfnct5gX6W9uhr0RO0P9I7af
 RgZZxmPiOyeMFBWZlP8jUCuCsfioeP/e0WC6At1nyFMKWcdNccdCxVq40+8WQKcGFKCB
 j70kd6zhi12/FzQw5gGaoTNgwoNxXw270aCsIDHs2b4n73UOuyTZ8s/5zOUWLIwXZRb4
 NERMpHCb889KYPMk5wfBaigGYH3kKx0ErAfIaRcE7+QcEdDh0k7iJ8Egitw9OWbZep4G
 OJ/Q==
X-Gm-Message-State: AKaTC03sXFbrPdhHKewStJO8vK/IwVa66kvlKvsAUZCskokJ5FjqSFmM4b7JiVU4DhDZEzCu
X-Received: by 10.99.100.132 with SMTP id y126mr71566292pgb.177.1480627127741; 
 Thu, 01 Dec 2016 13:18:47 -0800 (PST)
Received: from mxsl.svl.corp.google.com ([100.123.242.80])
 by smtp.gmail.com with ESMTPSA id r21sm2264446pfd.44.2016.12.01.13.18.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 01 Dec 2016 13:18:47 -0800 (PST)
From: Maxim Sloyko <maxims@google.com>
To: openbmc@lists.ozlabs.org
Cc: sjg@chromium.org,
	Maxim Sloyko <maxims@google.com>
Subject: [PATCH u-boot v3 4/6] aspeed: Add function to calculate APB Clock
 frequency
Date: Thu,  1 Dec 2016 13:18:33 -0800
Message-Id: <1480627115-5759-4-git-send-email-maxims@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1480627115-5759-1-git-send-email-maxims@google.com>
References: <1480627115-5759-1-git-send-email-maxims@google.com>
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
X-List-Received-Date: Thu, 01 Dec 2016 21:18:50 -0000

This is needed by I2C driver.

Signed-off-by: Maxim Sloyko <maxims@google.com>
Reviewed-by: Simon Glass <sjg@chromium.org>
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
