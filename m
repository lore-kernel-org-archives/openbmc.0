Return-Path: <joel.stan@gmail.com>
Received: from mail-pg0-x242.google.com (mail-pg0-x242.google.com
 [IPv6:2607:f8b0:400e:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x1nyY1t3PzDqhp
 for <openbmc@lists.ozlabs.org>; Tue,  4 Jul 2017 12:29:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZSEo+H7n"; 
 dkim-atps=neutral
Received: by mail-pg0-x242.google.com with SMTP id u62so24759887pgb.0
 for <openbmc@lists.ozlabs.org>; Mon, 03 Jul 2017 19:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=uBybscjaCNLG/A2mehwD9P3JX2tUYNpdSDBOFD10t2M=;
 b=ZSEo+H7n2E5UFkQ6K6kh/5VX90Sf7U1xcWYOt90NqZ5mRrieKQ57lNIl/G+m3J/pWr
 +mAfIlcUSe0e67WudVLDTWnn2fQ/DjgmC+XaX3Wm7gytic/Jykm5mpMWKinbwo3ou1aZ
 edo4deWLbnXANq9LXhifvDVNaX9gerFKhee4NB7stBsM/9ncclRaxETdFNjOcpFNsgun
 DP7u6UShngNbRuukAcKVWLIWbBDdkQ69wiMib4q446KSG9xQxQo0wuJNWiiZXOC3Kjy5
 rg/5LpZiwgsMWQRqhAG2k0aV8sOfQKUJqHRwzvfw5THK70LENbyWPAG7h8H7KRosPGFn
 uLNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=uBybscjaCNLG/A2mehwD9P3JX2tUYNpdSDBOFD10t2M=;
 b=clIXMtNvbIlVNZgk0jAZqXa/W6PMFYzbBKj5u1uPVzr/AQswgyBKTD2SC3biGrde5E
 owP27G4beglFth5hhsS636mnGXZ/wph1TEw1qGIP7jX4ObYHeQ6ZWPhfB9Eq4ZCi80Jb
 Fu0HOkgjGSUTo8dr9DozRT6lnJL0roS1LLjCzlZ4Cac3RvJ1+M8nLgqZ0ZiAofLNI9z3
 a4uONZ8t6RCQWRR48vVlrZmLditGqkKL2d/iQP+eijo/w2203DGMpp894DAQJ9Q4Kw+a
 QLXF7cJttsWS1y9HTqD07+Saqz6dOOOCD+S5GCj+uIIFR4MWiorMa7BaqLWyCx6a05fa
 DFpw==
X-Gm-Message-State: AIVw110fgZHFh9pK8qlNEpTV8PsWfZUHhYaVoOLYR1Stt22lfI8b45OL
 cejNhfzoJ/T9t7R5BWMiTA==
X-Received: by 10.98.80.89 with SMTP id e86mr11395129pfb.195.1499135379014;
 Mon, 03 Jul 2017 19:29:39 -0700 (PDT)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id k29sm29732515pfb.119.2017.07.03.19.29.35
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Mon, 03 Jul 2017 19:29:38 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Tue, 04 Jul 2017 11:59:29 +0930
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 v2] ARM: aspeed: Release UARTs from reset for
 all platforms
Date: Tue,  4 Jul 2017 11:59:28 +0930
Message-Id: <20170704022928.1618-1-joel@jms.id.au>
X-Mailer: git-send-email 2.13.2
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
X-List-Received-Date: Tue, 04 Jul 2017 02:29:42 -0000

This workaround was in place for Zaius. Make it common to all
platforms as the held-in-reset behaviour breaks the Linux tty layer
where users expect the existence of a device to mean it is usable.

We release all four UARTs that are covered by this register from reset.

Signed-off-by: Joel Stanley <joel@jms.id.au>

---
v2: release all uarts

 arch/arm/mach-aspeed/aspeed.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index 420a8d0344da..690a726a548d 100644
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -173,14 +173,6 @@ static void __init do_zaius_setup(void)
 	/* Set pin high */
 	reg = readl(AST_IO(AST_BASE_GPIO | 0x00));
 	writel(reg | phy_reset_mask, AST_IO(AST_BASE_GPIO | 0x00));
-
-	/* Disable default behavior of UART1 being held in reset by LPCRST#.
-	 * By releasing UART1 from being controlled by LPC reset, it becomes
-	 * immediately available regardless of the host being up.
-	 */
-	reg = readl(AST_IO(AST_BASE_LPC | 0x98));
-	/* Clear "Enable UART1 reset source from LPC" */
-	writel(reg & ~BIT(4), AST_IO(AST_BASE_LPC | 0x98));
 }
 
 static void __init do_witherspoon_setup(void)
@@ -254,6 +246,14 @@ static void __init aspeed_init_early(void)
 	 */
 	writel(0x001fdff3, AST_IO(AST_BASE_SCU | 0x9c));
 
+	/* Disable default behavior of UART1 being held in reset by LPCRST#.
+	 * By releasing UART1 from being controlled by LPC reset, it becomes
+	 * immediately available regardless of the host being up.
+	 */
+	reg = readl(AST_IO(AST_BASE_LPC | 0x98));
+	/* Clear "Enable UART reset source from LPC" for all four UARTs */
+	writel(reg & ~GENMASK(7, 4), AST_IO(AST_BASE_LPC | 0x98));
+
 	/*
 	 * Temporary setup of AST registers until pinmux driver is complete
 	 */
-- 
2.13.2
