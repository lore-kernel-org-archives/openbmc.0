Return-Path: <joel.stan@gmail.com>
Received: from mail-pf0-x243.google.com (mail-pf0-x243.google.com
 [IPv6:2607:f8b0:400e:c00::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t7y5b4fsTzDvNL
 for <openbmc@lists.ozlabs.org>; Wed,  2 Nov 2016 16:56:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=IuV74k7Q; 
 dkim-atps=neutral
Received: by mail-pf0-x243.google.com with SMTP id n85so745019pfi.3
 for <openbmc@lists.ozlabs.org>; Tue, 01 Nov 2016 22:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=sender:from:to:subject:date:message-id:in-reply-to:references;
 bh=+13weK+qwQPVkH35CIUzQCFTNADqnqmBlO09poC+lYs=;
 b=IuV74k7QCUCOpMKHnDTUf+1dNyog0f9R6N18t+OrH4uEiIuX+AxHgzuOVc2mQeJIS8
 nFaGMZjbdl9frLwqeYx89YfOEG+MmcL4y7GDf27/3lrEAYd6bCHM497Pg9jzAo1WChi1
 gZUtibEOClTNQxWrzooHB8eC9PlTlXLDHnCfv3Fiv88c3x7uOShwaFUA7AfNdncy9GiL
 XjyELNezT9wjMzDOgBvz2q/32PiBpx9kasKNn/cPXPSp1g2qdOHkf7nVCpBWipNUk0xd
 smiKapfTbtlxM2HJVLLZBaDbrwS5A5zEzh2aljSSgmW2b5jJEKL1ZDaoIdFg0OEFkWW5
 GGhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references;
 bh=+13weK+qwQPVkH35CIUzQCFTNADqnqmBlO09poC+lYs=;
 b=Y0FaYuue3KnQO5LrVMHQ1ZDhA75+zdAaAUnU9+gaNKcSP1ro67x8GgdvCgKkoEALPb
 Cb33Qp4/kdcmI99eOXbpBo+12mHZ8WjCQxPZ3zS8QfcBkxWhyF8Bv1gccF6qweC0MfGU
 6gqLX9Q74Y3K5jsH0RsXmMdHTrGZUJhfxbNtwQghw4Uo2/RDPuEuP/wNaoFO8TGQw6ch
 YYUo5PpPlQFyGKB8Ef4yk172565r5dYpbJkGcQp2XNiA09vxYBpPJBYwoTdf07uuDeaT
 OuxMN1BBlWGK6mUDAZV7Az/RjwWUy71W6jG3JKvTXRHeOHPXvYOcxc9AysM6RJ9bQ6jU
 vELA==
X-Gm-Message-State: ABUngvfd6WqxTzoRZWHR2Tc7qZb+cBWHsDrTfpMYR8eNaVtPqOGs2UiP8X1zesBj/xqX1g==
X-Received: by 10.99.119.9 with SMTP id s9mr3037068pgc.11.1478066177900;
 Tue, 01 Nov 2016 22:56:17 -0700 (PDT)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id y189sm1082213pfy.34.2016.11.01.22.56.14
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Tue, 01 Nov 2016 22:56:17 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Wed, 02 Nov 2016 16:26:10 +1030
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
	Xo Wang <xow@google.com>
Subject: [PATCH 2/2] arm: aspeed: Set SPI master strap for all boards
Date: Wed,  2 Nov 2016 16:25:57 +1030
Message-Id: <20161102055557.24349-2-joel@jms.id.au>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20161102055557.24349-1-joel@jms.id.au>
References: <20161102055557.24349-1-joel@jms.id.au>
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
X-List-Received-Date: Wed, 02 Nov 2016 05:56:20 -0000

All of the ast2500 systems that we support have incorrect strapping for
SPI. This commit moves the Zaius specific strapping change to the common
ast2500 setup, so that Witherspoon, Romulus and the EVB can benefit.

This moves the strapping change out from the Zaius board version check.
I don't see an issue there, as the will still be correct for future
boards.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/mach-aspeed/aspeed.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index 0a4578290d5e..57c32ff0fa83 100644
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -152,6 +152,12 @@ static void __init do_ast2500_common_setup(void)
 	reg = readl(AST_IO(AST_BASE_MAC0 | 0x40));
 	reg &= ~0x80000000;
 	writel(reg, AST_IO(AST_BASE_MAC0 | 0x40));
+
+	/* Set strap[13:12] to 01, Enable SPI master */
+	/* Set bits in writes to SCU7C are cleared from SCU70 */
+	writel(BIT(13), AST_IO(AST_BASE_SCU | 0x7C));
+	/* SCU70 is set-only, so no read-modify-write needed */
+	writel(BIT(12), AST_IO(AST_BASE_SCU | 0x70));
 }
 
 static void __init do_ast2500evb_setup(void)
@@ -190,12 +196,6 @@ static void __init do_zaius_setup(void)
 		/* D3 in GPIOA/B/C/D direction and data registers */
 		unsigned long phy_reset_mask = BIT(27);
 
-		/* Set strap[13:12] to 01, Enable SPI master */
-		/* Set bits in writes to SCU7C are cleared from SCU70 */
-		writel(BIT(13), AST_IO(AST_BASE_SCU | 0x7C));
-		/* SCU70 is set-only, so no read-modify-write needed */
-		writel(BIT(12), AST_IO(AST_BASE_SCU | 0x70));
-
 		/* Disable GPIO I, G/AB pulldowns due to weak driving buffers */
 		reg = readl(AST_IO(AST_BASE_SCU | 0x8C));
 		writel(reg | BIT(24) | BIT(22), AST_IO(AST_BASE_SCU | 0x8C));
-- 
2.9.3
