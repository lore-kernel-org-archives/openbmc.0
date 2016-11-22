Return-Path: <joel.stan@gmail.com>
Received: from mail-pg0-x244.google.com (mail-pg0-x244.google.com
 [IPv6:2607:f8b0:400e:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tNBnB5FbTzDvxV
 for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2016 15:09:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="M4tpDPl4"; 
 dkim-atps=neutral
Received: by mail-pg0-x244.google.com with SMTP id p66so748533pga.2
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 20:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=sender:from:to:subject:date:message-id:in-reply-to:references;
 bh=f5gs+KG8uri7Nnohg2PX4z04rZvmuxPSZeihwQTPsSY=;
 b=M4tpDPl47TVBc5iUSodL4QUKh4Dpe9NP2tUsZqr+/+oMABL7Wn3B9SZQtew/BTPCSK
 NcgcTbTafn9BZ1vnzgDYQQKsjUp6jvqONUFC1TS484igTk+6AhRjM5kJ7h2bnT3FrvA4
 NcU2+4/Rza+aJHSGf8nhz+jOq7QnCtMwl282LnqKcIxk9ZPqL2RSZc0bx+phQNsfQr01
 y4lEzwvB9S1StGM5Ynx1jSC++Z/VNJCERYayaR6bPQ2ELtCHW7dLMeUVR771BpCxrtNF
 vl37Nsr/7mxQQQU5XLI+DoeQ0QDNmpfvK6O2iRYbQdxIzmzLb4MILS0Aou2QIk4a3wTZ
 woWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references;
 bh=f5gs+KG8uri7Nnohg2PX4z04rZvmuxPSZeihwQTPsSY=;
 b=GrRBWKGR43F03aM2cVV8t3GWNGAPlT3AGdVUjg2OzemEyVq0vhq6qVuFdH5ujKhcaF
 Xalu9yzU4T6GM2vzQjcTLhwE+RwxuIMlqo+xghAxaW/9xJ+Ud4DsRToP/q9dJG6OJHJC
 c2dKg2KHfQMnj8nYJZUQ3wlfa371JScC2yuClPeELDtqHitGNclJ3SEG6yQ93uPJEjxK
 JgdQ9H2B7K86Gv4nKK1IC25Y0C5NsIoF5kYdstdYL7ErdJKyS05oawSuux2W6qNZesKU
 qnDaqAQeOhCwMg3o9tbArEunGDKQMKm7eHRbLDnBcZJv8foY5Tb+1htrifcmCfs0UazW
 kiXQ==
X-Gm-Message-State: AKaTC01etxpsqaMb6jorUHN+qM7U7Ig9BG1NP+ybGbyTugMRYKMjL+dZg9QOPuOxLgoVPg==
X-Received: by 10.99.121.69 with SMTP id u66mr38777644pgc.96.1479787773176;
 Mon, 21 Nov 2016 20:09:33 -0800 (PST)
Received: from aurora.jms.id.au ([2403:480:11:8000:34fc:e5f1:fa3d:d083])
 by smtp.gmail.com with ESMTPSA id l3sm22802453pgc.41.2016.11.21.20.09.29
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Mon, 21 Nov 2016 20:09:32 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Tue, 22 Nov 2016 14:39:25 +1030
From: Joel Stanley <joel@jms.id.au>
To: andrew@aj.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH 5/7] arm: aspeed: Remove SCU8C hacks
Date: Tue, 22 Nov 2016 14:38:47 +1030
Message-Id: <20161122040849.31604-5-joel@jms.id.au>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161122040849.31604-1-joel@jms.id.au>
References: <20161122040849.31604-1-joel@jms.id.au>
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
X-List-Received-Date: Tue, 22 Nov 2016 04:09:35 -0000

 - ROM pins were configured but these are unused on Plametto.

These settings were present, but I suspect unused:

 - GPIOR had the pulldown disabled. Most of these pins are unused and
   pulled up on Palmetto.

 - GPIOP is used as BMC_TACH, inputs from a fan controller.

 - GPIOI is the SPI buses for the flash.

 - GPIOH and G are misc I/O.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/mach-aspeed/aspeed.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index ea76c95c33fc..55447123bf39 100644
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -45,9 +45,6 @@ static void __init do_common_setup(void)
 	/* Set UART routing */
 	writel(0x00000000, AST_IO(AST_BASE_LPC | 0x9c));
 
-	/* TODO: This should go in the GPIO driver device tree bindings */
-	writel(0xC1C000FF, AST_IO(AST_BASE_SCU | 0x8c));
-
 	/* Setup scratch registers */
 	writel(0x00000042, AST_IO(AST_BASE_LPC | 0x170));
 	writel(0x00008000, AST_IO(AST_BASE_LPC | 0x174));
-- 
2.10.2
