Return-Path: <joel.stan@gmail.com>
Received: from mail-pg0-x242.google.com (mail-pg0-x242.google.com
 [IPv6:2607:f8b0:400e:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wtV973Mz5zDqnR
 for <openbmc@lists.ozlabs.org>; Thu, 22 Jun 2017 15:13:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Qhj28+ci"; 
 dkim-atps=neutral
Received: by mail-pg0-x242.google.com with SMTP id j186so1064272pge.1
 for <openbmc@lists.ozlabs.org>; Wed, 21 Jun 2017 22:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=IlaCMGRhvbpOevKB7TfqhfgFO3EGB9TjEW5XeY0J/Gs=;
 b=Qhj28+ciFs4WQXMXBW4pzQKkvYKfcrkiliHpK58fq+lZASjcDXzYMckzD9zM2ifkum
 BK9c48Nfja9g8sydTqPygWr9raXuV0ImchCuv4GypfwkkQGvJCB7PPboCN8qM4QiKcbY
 0CUg6vLm2noJfac9W4zq/p+lA2CPOtzLW18kqBf8XlzrDE/QHtdsn3Wj3/DR/K5m8oXe
 10KfPlnpbD2Fo428IcC3+DnRftVLmLxmY+M6CLLpntYUTDYgHX5LxejzCS/SPc9QqlvI
 CqDsqI2FZK4fPi2Iqasyjoe20S1B5CuhmzTOwOVS+1eClkPC6SgId0QC/Fky9dA66Ur/
 GsTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=IlaCMGRhvbpOevKB7TfqhfgFO3EGB9TjEW5XeY0J/Gs=;
 b=jGyGlgPCQVaU0Su0YF3ONr6RfTzdEMcwIJ8caf2hG7iqUuTAn/UaaEuUFrFQTNaEuP
 mif87hJIzyNjhcOudkkj15fkvzMNHLaDEt/NDgWdzyq/4MQ9Y8dR3nhVV4JvAN55lvej
 fPa/Lg08VOOu0aq6Sr6BLhgTpOeAgteF3Jw8itDKjvQgcIc5mNneEI8O0DjV70bV5UX9
 p3nxVi6Xgj3Sw7znnhTC8yCo8r2xcm0raK4oItfbsWnSpgUwbg1aT6W3y3LL2SAA/45R
 xWH+5rF5hz9/gunFYV1XfXOEm72v5qubbA8f4zlMmJE3cZCa1rhmNzsf62n7tp+WR5Cu
 nUKQ==
X-Gm-Message-State: AKS2vOzaYjPK5P6Ej4cH2H2WBunObqhjwLN7TPTChENxQSAd9VzMTYGF
 bmP3ueve3/fGe3FAFrVo6g==
X-Received: by 10.84.192.131 with SMTP id c3mr892721pld.7.1498108408638;
 Wed, 21 Jun 2017 22:13:28 -0700 (PDT)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id p21sm1018902pgn.12.2017.06.21.22.13.25
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Wed, 21 Jun 2017 22:13:27 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Thu, 22 Jun 2017 14:43:22 +0930
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Cc: Andrew Jeffery <andrew@aj.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH linux dev-4.10] ARM: aspeed: fix reset of AHB controller
Date: Thu, 22 Jun 2017 14:43:21 +0930
Message-Id: <20170622051321.18790-1-joel@jms.id.au>
X-Mailer: git-send-email 2.11.0
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
X-List-Received-Date: Thu, 22 Jun 2017 05:13:32 -0000

We have a reset of the AHB controller in the early boot path otherwise
some peripherals (i2c) are not accessible.

The reset register is level triggered (for all lines except the JTAG
peripheral): write 1 to reset, write 0 has no effect.

In c93456b24c68 ("aspeed: Don't blast SCU04 at boot time") we tried to
preserve the state of the JTAG controller, however, we inadvertently
reset a bunch of devices by doing the read/modify/write to the reset
register.

Preserve only the state of the JTAG reset.

Fixes: c93456b24c68 ("aspeed: Don't blast SCU04 at boot time")
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
Tested that i2c works again on the evb

 arch/arm/mach-aspeed/aspeed.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index 4c5c4853e778..32eb36183e92 100644
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -237,12 +237,14 @@ static void __init do_mellanox_setup(void)
 
 static void __init aspeed_init_early(void)
 {
+	u32 reg;
+
 	/* Unlock SCU */
 	writel(SCU_PASSWORD, AST_IO(AST_BASE_SCU));
 
-	/* Reset AHB bridges */
-	writel(readl(AST_IO(AST_BASE_SCU | 0x04)) | 0x02,
-	       AST_IO(AST_BASE_SCU | 0x04));
+	/* Reset AHB bridges. Do not modify the JTAG configuration bit */
+	reg = readl(AST_IO(AST_BASE_SCU | 0x04)) & BIT(22);
+	writel(reg | 0x02, AST_IO(AST_BASE_SCU | 0x04));
 
 	/* Enables all the clocks except D2CLK, USB1.1 Host, USB1.1, LHCLK */
 	writel(0x10CC5E80, AST_IO(AST_BASE_SCU | 0x0c));
-- 
2.11.0
