Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id C6F0D1A0018
 for <openbmc@lists.ozlabs.org>; Fri, 20 Nov 2015 15:30:28 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447993823622686.7183099231554;
 Thu, 19 Nov 2015 20:30:23 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux] arm/mach-aspeed: Perform SCU setup for i2c busses 4-8
Date: Thu, 19 Nov 2015 23:30:22 -0500
Message-Id: <1447993822-11150-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447993822-11150-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1447993822-11150-1-git-send-email-openbmc-patches@stwcx.xyz>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Nov 2015 04:30:29 -0000

From: Jeremy Kerr <jk@ozlabs.org>

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 arch/arm/mach-aspeed/aspeed.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index 7a1f614..46bc7f5 100644
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -183,6 +183,14 @@ static void __init aspeed_init_early(void)
 	udbg_uart_putc('O');
 	udbg_uart_putc('\n');
 
+	/*
+	 * temporary: enable i2c usage of the shared GPIO/I2C pins for
+	 * i2c busses 4 - 8
+	 */
+	reg = readl(AST_IO(AST_BASE_SCU | 0x90));
+	reg |= 0x3E0000;
+	writel(reg, AST_IO(AST_BASE_SCU | 0x90));
+
 	aspeed_dump_scu();
 }
 
-- 
2.6.3
