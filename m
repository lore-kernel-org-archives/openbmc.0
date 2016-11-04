Return-Path: <joel.stan@gmail.com>
Received: from mail-pf0-x241.google.com (mail-pf0-x241.google.com
 [IPv6:2607:f8b0:400e:c00::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t96n039tpzDt11
 for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2016 14:31:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="FQLF5cPB"; 
 dkim-atps=neutral
Received: by mail-pf0-x241.google.com with SMTP id a136so6587700pfa.0
 for <openbmc@lists.ozlabs.org>; Thu, 03 Nov 2016 20:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=mMRn0oxHxIzUwvAw4WgQcGqS8PtVs7LPzuZvnQKKKUE=;
 b=FQLF5cPBlhK0HEjVKAOF+M8AII4eANWyi79aJhLO7Gg1Kp6E53u7ogzVczqLiAXDXy
 QeuG/zQswHatnn9xphqo+eJuTAs/ck5J45uWsXkP1CsHJixgNkCMkdjPpPdAAEdkB5LD
 axMd3YbspZx89SbRmyXHWc5Fp7cmoZRfncdYewKP+16qpRVwRRywYZlMVLDt02Zxuync
 CfsAh6poEa/lSeIE+rX8OdmVRkolRlrS6+Z3yPZpAmhJz5Qlwci+jI5GUqeAqCeHov+P
 etkQ2X9VxE0f3u4B3htSkVDv3ARbqRcBj28jYquOS8UYAWMiaNgsRcmElKaagCMG08Id
 uRLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=mMRn0oxHxIzUwvAw4WgQcGqS8PtVs7LPzuZvnQKKKUE=;
 b=iHXw5Dj7Du11bmABgP4IQ9hWd+ctOmS4QEsYWGuQ2GDH/yZq4C8NwAIi6mmH1Pdrzx
 tCfrzEThDvc2hZxbcLauyEgmhupKzxX7OYHnTZRdIsjdMKb/UIsapJWaQUt7I431lFYm
 Gu43O+zm3hO98NXsGCs8WrInoCwXHfMWCeSz21Ax9LjEQwJ/TDrrK+YcmMPGASfHt6qt
 qEk8YphpYnVPm258Fso/sN4MRv1bDbTr/5KzlO4m8LxkS6A7MJz5wd4y+nU+ioeJfwvz
 O+kGp4XtfApWyKuMczh+yMvNM3GWHCMyoqh9nW4hS+9gm/XpetKCt7U85vR3bzdb0HDi
 d0dg==
X-Gm-Message-State: ABUngvcqUKDs1Wsi/742pCTH5FwZlRN0gZK6SeGVZ3SsW2bsMM/3uEdSgWJJaTWWlwVdaA==
X-Received: by 10.98.24.136 with SMTP id 130mr7919897pfy.73.1478230258780;
 Thu, 03 Nov 2016 20:30:58 -0700 (PDT)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id v4sm15855898pfb.52.2016.11.03.20.30.55
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Thu, 03 Nov 2016 20:30:58 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Fri, 04 Nov 2016 14:00:51 +1030
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 2/2] arm: aspeed: Remove SPI1 strapping hacks
Date: Fri,  4 Nov 2016 14:00:42 +1030
Message-Id: <20161104033042.32562-2-joel@jms.id.au>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20161104033042.32562-1-joel@jms.id.au>
References: <20161104033042.32562-1-joel@jms.id.au>
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
X-List-Received-Date: Fri, 04 Nov 2016 03:31:00 -0000

Now that we have device tree and pinmux support for setting the
strapping we can remove these from the board file.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/mach-aspeed/aspeed.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index ebb2224dcd13..2100e54ffbc2 100644
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -160,13 +160,8 @@ static void __init do_ast2500evb_setup(void)
 
 	do_ast2500_common_setup();
 
-	reg = readl(AST_IO(AST_BASE_SCU | 0x70));
-
 	/* Set strap to RGMII for dedicated PHY networking */
-	reg |= BIT(6) | BIT(7);
-	/* Enable SPI Master and SPI Slave to AHB Bridge */
-	reg |= BIT(13);
-	writel(reg, AST_IO(AST_BASE_SCU | 0x70));
+	writel(BIT(6) | BIT(7), AST_IO(AST_BASE_SCU | 0x70));
 }
 
 static void __init do_witherspoon_setup(void)
@@ -190,12 +185,6 @@ static void __init do_zaius_setup(void)
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
