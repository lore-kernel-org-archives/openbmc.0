Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x244.google.com (mail-yw0-x244.google.com
 [IPv6:2607:f8b0:4002:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x1nM43QnxzDqhp
 for <openbmc@lists.ozlabs.org>; Tue,  4 Jul 2017 12:02:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Y2qRptZB"; 
 dkim-atps=neutral
Received: by mail-yw0-x244.google.com with SMTP id z21so10863403ywz.2
 for <openbmc@lists.ozlabs.org>; Mon, 03 Jul 2017 19:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id;
 bh=iaOXPVC3Pn/9hjRClXHhhT8citGVmfNjdtQjuAEYKIQ=;
 b=Y2qRptZBqI47IWR8QgeLF1JQcD/zN3zxbgxjY26ixC7rSKZvUugOFeZ77myzUbz69L
 rmBNz93Dz41AdzMtCWlPUavmVETqFdtwDtowXypylMvkU/K73jNu2ZBj3+vFPUuObpMs
 7gkjcOAAj4Dmp8M5Bib6Ew7u9jNPP6Dc1B0ZRi/g/wvC4JjhMnPexaBvrGEHdytIceVO
 8hgMOFg3OaUDZjRHyflNnKHdBrdH4eknLb4YGS8aS3O1589j3FmawZlL/Uh01fQ7L/oJ
 6qweevX3eQAglyySNWOrfre357bLJ2sz5EbEXASG158PHRUBN4yzbm/32RcwHF3DiESx
 u3uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id;
 bh=iaOXPVC3Pn/9hjRClXHhhT8citGVmfNjdtQjuAEYKIQ=;
 b=d8t5ou/37FtOCFnIkES7teIyvm5LOvLySycwaks4NK1BsXZNsGrE0fVghwlm4PsEO0
 VYH2LzJk2QPfS1CXCWF3pGXt/fmcdx89fKGV7SHYF/YpTP48/2LwbgzUDZeBOkKUx2H1
 rICMKLJZFS4JOstJAvct9vtNeCH+Xp0qHz50mB3PHBLfVlDZ1ZZaHvV3C8ujqqCkupcr
 NuNWQr/LBKV6GsYJ86QxIbyTKaYXMPyT4hYGAiluQvObH4UgZa1/lWJVNCM7Y1B1paQR
 Z7trDzkO7JytqTqMN8Q8YLpxbaO9g5MiRO1/yN5oxgk1tS1CCqpuCW8JMBnZgQ9aVnfy
 6abQ==
X-Gm-Message-State: AKS2vOxHm6BEGQS3uGoHNuBz/h8hvLi0Mgj2mcYfnqkMDJkbAYGHvDem
 VZzgnDiJtcWviQpvCwFBLQ==
X-Received: by 10.129.117.213 with SMTP id q204mr28841844ywc.229.1499133742098; 
 Mon, 03 Jul 2017 19:02:22 -0700 (PDT)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id j13sm7255440ywa.78.2017.07.03.19.02.19
 for <openbmc@lists.ozlabs.org>
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Mon, 03 Jul 2017 19:02:21 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Tue, 04 Jul 2017 10:40:13 +0930
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10] ARM: aspeed: Release UART1 from reset for all
 platforms
Date: Tue,  4 Jul 2017 10:40:12 +0930
Message-Id: <20170704011012.26158-1-joel@jms.id.au>
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
X-List-Received-Date: Tue, 04 Jul 2017 02:02:25 -0000

This workaround was in place for Zaius. Make it common to all
platforms as the held-in-reset behaviour breaks the Linux tty layer
where users expect the existence of a device to mean it is usable.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/mach-aspeed/aspeed.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index 420a8d0344da..d3eb9e7c2d8b 100644
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
+	/* Clear "Enable UART1 reset source from LPC" */
+	writel(reg & ~BIT(4), AST_IO(AST_BASE_LPC | 0x98));
+
 	/*
 	 * Temporary setup of AST registers until pinmux driver is complete
 	 */
-- 
2.13.2
