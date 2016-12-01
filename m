Return-Path: <xow@google.com>
Received: from mail-pg0-x22f.google.com (mail-pg0-x22f.google.com
 [IPv6:2607:f8b0:400e:c05::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tTmZ41LrWzDvrV
 for <openbmc@lists.ozlabs.org>; Thu,  1 Dec 2016 16:49:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="R4QE4d2k"; 
 dkim-atps=neutral
Received: by mail-pg0-x22f.google.com with SMTP id p66so90986547pga.2
 for <openbmc@lists.ozlabs.org>; Wed, 30 Nov 2016 21:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9SV3UjLJzoTnN3g0nSCTalAh3l0dco0GXr698jicqjQ=;
 b=R4QE4d2kJdF/kNMykeDHKcGoiYNJYbAwIm4Sf4Maxb3NxOGNebpkcYltQqxAda6M2z
 x8KTsKYXQM/hiZ/PDzMl9fWN0pRJXl7dY+4l2sYgNel1K/oY6aFKxbUTuTjLy4dZVLai
 NtBGETylGDqhJR7vlI+W65cEwEsgphBBfuBz6Trt578PdyU85t3ESz/pQAg5Dm6yI/SE
 21+S0mrcfmaeZ0DEriLY5dSW3VmboGZx5OgcUxt8FxrBTLOJ1hGmLFjvVu/cb8bkVY1p
 6Cb3IRL9mqFkJPcP2yNrFL8tUynabttnf3mh5hZL/FEHu2vvc4+Rip5/ws9oDicVwl9c
 1dFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9SV3UjLJzoTnN3g0nSCTalAh3l0dco0GXr698jicqjQ=;
 b=kkKbxG2r6/1r9yzban/vHz3VL/dFMFqbEWzO8PpqV/9DJtCtEm6AdCIRoKupokDFda
 xyJtJG8LAzIMgQuN8bAFcdpb0bT1q+toPaddUEs5GI9mrVri5syf/1FlWv2dmsSm+8o+
 OqfvY3i699yflApCZBoJP6RvxY3yyA78ABq7VOMpTnhPLavL2KJ/MKw3cOyrEeb3/uRI
 46nsYP3ffS2vCJHV7xv1I+oZ7uWBG+QRHcXlFN17w3tX8XRtdsuFUeP1vO5fi2UiUzBG
 eNu5uDwSQEqaQomh4bmOlYWW/cH0vETz4CWNYyFAiFDEMwZPY7guRY5wViS5Sau3ejTd
 yWBQ==
X-Gm-Message-State: AKaTC03WEAbF0Sy1AwBqjSHcwDtsJFwWyaVk/u5FG++uInLcQmE3py9XLkETPIDqGwdatVTf
X-Received: by 10.99.63.135 with SMTP id m129mr66228517pga.16.1480571353345;
 Wed, 30 Nov 2016 21:49:13 -0800 (PST)
Received: from pewter.svl.corp.google.com ([100.123.242.121])
 by smtp.gmail.com with ESMTPSA id 135sm89074126pgc.7.2016.11.30.21.49.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 30 Nov 2016 21:49:12 -0800 (PST)
From: Xo Wang <xow@google.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux] arm: aspeed: zaius: Setup LPC to AHB bridge
Date: Wed, 30 Nov 2016 21:49:05 -0800
Message-Id: <1480571345-135418-1-git-send-email-xow@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Thu, 01 Dec 2016 05:49:16 -0000

Add explicit SPI1 flash windows rather than use boot values.
Add 64 MiB mapping for LPC host interface to SPI1 CE0's window.
Add missing call to do_common_setup() which includes enabling LPC FWH
access cycles.

Signed-off-by: Xo Wang <xow@google.com>
---
 arch/arm/mach-aspeed/aspeed.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index a491cd2..807ccc2 100644
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -137,6 +137,8 @@ static void __init do_zaius_setup(void)
 	unsigned long reg;
 	unsigned long board_rev;
 
+	do_common_setup();
+
 	/* Read BOARD_REV[4:0] fuses from GPIOM[7:3] */
 	reg = readl(AST_IO(AST_BASE_GPIO | 0x78));
 	board_rev = (reg >> 3) & 0x1F;
@@ -162,6 +164,24 @@ static void __init do_zaius_setup(void)
 		reg = readl(AST_IO(AST_BASE_GPIO | 0x00));
 		writel(reg | phy_reset_mask, AST_IO(AST_BASE_GPIO | 0x00));
 	}
+
+	/* Setup PNOR address mapping for 64M flash
+	 *
+	 *   ADRBASE: 0x3000 (0x30000000)
+	 *   HWMBASE: 0x0C00 (0x0C000000)
+	 *  ADDRMASK: 0xFC00 (0xFC000000)
+	 *   HWNCARE: 0x03FF (0x03FF0000)
+	 *
+	 * Mapping appears at 0x60300fc000000 on the host
+	 */
+	writel(0x30000C00, AST_IO(AST_BASE_LPC | 0x88));
+	writel(0xFC0003FF, AST_IO(AST_BASE_LPC | 0x8C));
+
+	/* Set SPI1 CE1 decoding window to 0x34000000 */
+	writel(0x70680000, AST_IO(AST_BASE_SPI | 0x34));
+
+	/* Set SPI1 CE0 decoding window to 0x30000000 */
+	writel(0x68600000, AST_IO(AST_BASE_SPI | 0x30));
 }
 
 static void __init do_witherspoon_setup(void)
-- 
2.8.0.rc3.226.g39d4020
