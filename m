Return-Path: <joel.stan@gmail.com>
Received: from mail-pg0-x243.google.com (mail-pg0-x243.google.com
 [IPv6:2607:f8b0:400e:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tNBmZ558BzDvxF
 for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2016 15:09:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="PnCwPKuu"; 
 dkim-atps=neutral
Received: by mail-pg0-x243.google.com with SMTP id p66so747161pga.2
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 20:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=sender:from:to:subject:date:message-id;
 bh=WQffn98CYE0RhRPapR3SaCvHiDBZwPo95QbnqUDjKg0=;
 b=PnCwPKuuKyRCF0JJGpQO5qsRG3rH10YcvLliywu4L8SxU8w4foV4kxPnyY9b6snTJ9
 nMRYKzBnbBHR4FXFVwv32c7vrGz8UiiPzyTxTgnMwUXe+mYPJJvhGtQIz94o6sv0QcXd
 18GCObt70CkQmNn54UmghG4LHDZUWT4MOkp+BUCRpY/4NuR2VSUp7/btVxti5Hr5YPjH
 9nT2hFfKJKCL3bDKGMtjjXo6oALayXiohDOE/X4pi8rLVqVndR+f4vJjLDUIp4T9IJLb
 qnyXvPO0Icu9co2b50ADLXDIgiRacBhftU47XUsode2CHf9i3lHCAWIlev1ErRKooqR9
 qQAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:sender:from:to:subject:date:message-id;
 bh=WQffn98CYE0RhRPapR3SaCvHiDBZwPo95QbnqUDjKg0=;
 b=kcsDL4I/b+rGa7jma0t5rEgMYtW/+fJ/XVxBPhCG17uGPhsW3uoFPQBnBTn0KUr7mk
 41gVwWI0FlNPoGdqKmwL0muxZQpNHQuLl67en9ncgzQtYKWXTuvVqgeBNT60dBhvS9Zi
 0FP8u/IPdlWszFx60E/H3Bm3xfbQdTvArN8vKmrg0+SHFbZAo62EGomXGSt5Tr5ZlyZr
 Eoi8N2UTejyWZ0uK6+bSireCsNIL4bnOQ6hXOHubFOyExhObQqYOFVoujapMwGuCM1vZ
 f5il8piQ++OYo9au+ugOy7vB5i24IQMw5NXDVtqvnc+3aFwSmsl/HhBKDDANpo1dswp7
 3k6w==
X-Gm-Message-State: AKaTC03/mNS97g+Ow99wcJkB/W9dU1fp53Rh2YuTMv4mkJV8/hlsOFoD2NThzQPVYmbhyg==
X-Received: by 10.98.80.9 with SMTP id e9mr22521920pfb.13.1479787740804;
 Mon, 21 Nov 2016 20:09:00 -0800 (PST)
Received: from aurora.jms.id.au ([2403:480:11:8000:34fc:e5f1:fa3d:d083])
 by smtp.gmail.com with ESMTPSA id d15sm40767755pfl.46.2016.11.21.20.08.57
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Mon, 21 Nov 2016 20:08:59 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Tue, 22 Nov 2016 14:38:52 +1030
From: Joel Stanley <joel@jms.id.au>
To: andrew@aj.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH 1/7] arm: aspeed: Remove UART muxing hacks
Date: Tue, 22 Nov 2016 14:38:43 +1030
Message-Id: <20161122040849.31604-1-joel@jms.id.au>
X-Mailer: git-send-email 2.10.2
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
X-List-Received-Date: Tue, 22 Nov 2016 04:09:03 -0000

These were added during initial bringup. None of these pins are used by
OpenBMC for the functions they're being muxed to (UART4 nor the VGA
output) so there are no device tree additions required to cover for
the removal.

We do use UART5, which is an exclusive function of the pins it sits on,
so again no pinmux configuration is required.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/mach-aspeed/aspeed.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index ce73867aadd4..0e4c34a91ac3 100644
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -181,18 +181,6 @@ static void __init aspeed_init_early(void)
 	/* Reset AHB bridges */
 	writel(0x02, AST_IO(AST_BASE_SCU | 0x04));
 
-	/* Enable UART4 RXD4, TXD4, NRI4, NDCD4, NCTS4 */
-	/* TODO: This should be pinmux. Also, why are we enabling uart4? */
-	writel(0xcb000000, AST_IO(AST_BASE_SCU | 0x80));
-
-	/* Enable
-	 *  - UART1 RXD1, RXD1, NRTS1, NDTR1, NRI1, NDSR1, NDCD1, NCTS1.
-	 *  - VGA DDCDAT, DDCCLK, VGAVS, VGAHS.
-	 *  - NAND flash FLWP#, FLBUSY#
-	 */
-	/* TODO: This should be pinmux */
-	writel(0x00fff0c0, AST_IO(AST_BASE_SCU | 0x84));
-
 	/* Enables all the clocks except D2CLK, USB1.1 Host, USB1.1, LHCLK */
 	writel(0x10CC5E80, AST_IO(AST_BASE_SCU | 0x0c));
 
-- 
2.10.2
