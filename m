Return-Path: <xow@google.com>
Received: from mail-pf0-x231.google.com (mail-pf0-x231.google.com
 [IPv6:2607:f8b0:400e:c00::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tyqqz5rgWzDqLx
 for <openbmc@lists.ozlabs.org>; Wed, 11 Jan 2017 11:43:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="kH7UlkYz"; 
 dkim-atps=neutral
Received: by mail-pf0-x231.google.com with SMTP id y143so34549554pfb.0
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 16:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=piH+6bFRayuVE91e8ea85lR7/Wn7iFkwKKSdToPg3yg=;
 b=kH7UlkYzcG9cffHrPPl8cq+R4Nou/SpE7O7xQmp12IW+0q9oW4MW85+XFe/HGvNvPe
 e9fSEF8IGU4poOsMNK0z7yd3bSLfedtzcy/qKG3zVpZ4RHR20O2aGQV0mxv8mmoyBzOk
 YCk/KahjknAV9q/s+QQvjx7Sul/5AVD03BwH2FpmuYJ/bDzfGXV3JZ47LEx0HtvCRjLE
 665daxOLtlzvYUGqXVmdm7bBNz8Cjwxkz4qljiZxP/wuDUkX5MNhK9v4+nSFOa7Pyw/s
 rF5EDFwp1rR5kWuV40+nusSvd0pQSudZZ1RmTP4t0Pyatizes6sCzOwFHWsXMBV9wAXD
 7z0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=piH+6bFRayuVE91e8ea85lR7/Wn7iFkwKKSdToPg3yg=;
 b=RzkfPmLQHwcHamLgDWfggDy69bJ9rIxrud+iWfsdPckXLDrO2YUttpRefKLV7xrN9w
 e8Gcsv788EIx/+JjXDheS7Cma+eazXFpyxg+E3sCMybTb3/3Rh0BIA44r0yfU07PF8q8
 VTF+OcFkT5+8Np8RZ1f9ZuZNMGzJS5/3Z8+FkEdO1ejUt8hdNTAOMG9jiOcqLzq/Tq16
 HZq/UudCtBUjergLEZewNzcvJk6S+RpGCPVXvhgWvdpRsepp8Ll5MhDzYe+kSsYpvLAO
 vrhgMBki6uHOv9aSIrUQR3CoZfxosy1CMi/sTqV9WEzT+Uvqnu5eAOY/sWeh+LL1sUSt
 +UeA==
X-Gm-Message-State: AIkVDXJBticGrUKxYBODl2RfDgS7hSGp1jfB81qsnt0JM6nIL7QgH076HYrhLMceeMtkyrrD
X-Received: by 10.84.148.134 with SMTP id k6mr9076996pla.142.1484095384388;
 Tue, 10 Jan 2017 16:43:04 -0800 (PST)
Received: from pewter.svl.corp.google.com ([100.123.242.121])
 by smtp.gmail.com with ESMTPSA id 64sm8459292pfu.17.2017.01.10.16.43.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 10 Jan 2017 16:43:03 -0800 (PST)
From: Xo Wang <xow@google.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux 1/2] arm: aspeed: zaius: Reset PHY regardless of board
 revision
Date: Tue, 10 Jan 2017 16:42:56 -0800
Message-Id: <20170111004257.8817-1-xow@google.com>
X-Mailer: git-send-email 2.11.0.390.gc69c2f50cf-goog
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
X-List-Received-Date: Wed, 11 Jan 2017 00:43:12 -0000

Since there isn't yet an implementation of PHY hard reset in net
drivers, Zaius BMC continues to rely on the machine driver for PHY hard
reset on the EVT2 board revision.
Updates driver to assert PHY reset regardless of board revision bits.

Signed-off-by: Xo Wang <xow@google.com>
---
 arch/arm/mach-aspeed/aspeed.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index 807ccc2fa28d..e4150c8a5d8d 100644
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -136,6 +136,8 @@ static void __init do_zaius_setup(void)
 {
 	unsigned long reg;
 	unsigned long board_rev;
+	/* D3 in GPIOA/B/C/D direction and data registers */
+	unsigned long phy_reset_mask = BIT(27);
 
 	do_common_setup();
 
@@ -145,26 +147,23 @@ static void __init do_zaius_setup(void)
 
 	/* EVT1 hacks */
 	if (board_rev == 0) {
-		/* D3 in GPIOA/B/C/D direction and data registers */
-		unsigned long phy_reset_mask = BIT(27);
-
 		/* Disable GPIO I, G/AB pulldowns due to weak driving buffers */
 		reg = readl(AST_IO(AST_BASE_SCU | 0x8C));
 		writel(reg | BIT(24) | BIT(22), AST_IO(AST_BASE_SCU | 0x8C));
-
-		/* Assert MAC2 PHY hardware reset */
-		/* Set pin low */
-		reg = readl(AST_IO(AST_BASE_GPIO | 0x00));
-		writel(reg & ~phy_reset_mask, AST_IO(AST_BASE_GPIO | 0x00));
-		/* Enable pin for output */
-		reg = readl(AST_IO(AST_BASE_GPIO | 0x04));
-		writel(reg | phy_reset_mask, AST_IO(AST_BASE_GPIO | 0x04));
-		udelay(3);
-		/* Set pin high */
-		reg = readl(AST_IO(AST_BASE_GPIO | 0x00));
-		writel(reg | phy_reset_mask, AST_IO(AST_BASE_GPIO | 0x00));
 	}
 
+	/* Assert MAC2 PHY hardware reset */
+	/* Set pin low */
+	reg = readl(AST_IO(AST_BASE_GPIO | 0x00));
+	writel(reg & ~phy_reset_mask, AST_IO(AST_BASE_GPIO | 0x00));
+	/* Enable pin for output */
+	reg = readl(AST_IO(AST_BASE_GPIO | 0x04));
+	writel(reg | phy_reset_mask, AST_IO(AST_BASE_GPIO | 0x04));
+	udelay(3);
+	/* Set pin high */
+	reg = readl(AST_IO(AST_BASE_GPIO | 0x00));
+	writel(reg | phy_reset_mask, AST_IO(AST_BASE_GPIO | 0x00));
+
 	/* Setup PNOR address mapping for 64M flash
 	 *
 	 *   ADRBASE: 0x3000 (0x30000000)
-- 
2.11.0.390.gc69c2f50cf-goog
