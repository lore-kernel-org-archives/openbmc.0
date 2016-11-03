Return-Path: <joel.stan@gmail.com>
Received: from mail-pf0-x242.google.com (mail-pf0-x242.google.com
 [IPv6:2607:f8b0:400e:c00::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t906n2yXDzDvRG
 for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2016 09:30:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=uDHzD9pN; 
 dkim-atps=neutral
Received: by mail-pf0-x242.google.com with SMTP id y68so5978123pfb.1
 for <openbmc@lists.ozlabs.org>; Thu, 03 Nov 2016 15:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=sender:from:to:subject:date:message-id:in-reply-to:references;
 bh=ItZ8piCBCfhYsme4Ffdcn1u753TrxnXwP1GO+XShDC8=;
 b=uDHzD9pNIAQAblFO94aQuDn15tx055WVsCap0RZwM5ZgrvfXU66RZfee9PP7KCNPXt
 B524LavGU9qwoceR4s+vcWX9zDrVR4X81/Qbq+NCSbaEZlPIjmQTKlGlnADqeAqse+DK
 emCGxSH5m6o1XuxSpsCBEMkacnPwZ82XI4nAaN8tEbYBasRECvedHcluL/gj7H2RC4Yp
 qoItqugovwBlYuVP9tF82FV0/XWrXTugo91ifr5OvX/AOGFPatxgbBRebCps9alRihtQ
 9qxLUg1HYDzN0FgUVvMjAeLHQB/hMsTXriTqxAiRujYBrlorPbmeusheagfkXRrW1CjT
 PGVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references;
 bh=ItZ8piCBCfhYsme4Ffdcn1u753TrxnXwP1GO+XShDC8=;
 b=fhnehTe2OSfCC274XuQLN1LPR4Swyfg1FKmu8OJoTH3eMVUE6FTRw4Ik9mJQkLr7Br
 uBVgFWisqDoPJVpugmPqziHxK6b8mhmHmw8V0kj9Xdh6b3xYCvjrxLLpVaOVxNh69tHX
 p6ZLBGIRVZtAa1X1Di9c39zMamu/s+FiJwihlSKrK9JHBzf5Fpb+4nb6uuDz9xq8wluE
 ay3AJMwvv4E/odYTsVHYRX1rMfpJS+xrqMrwdekSCQz2TV0ns44Mc2j6VKd8qh76dNFq
 j7+BoBBIf4Lizosmwbyuzo+h97gLA9pXxxCIZiLyj+0sDwmcFIhp7hAAlo6MxwcEi6+T
 OeiQ==
X-Gm-Message-State: ABUngvduje14haBzbtMtlZYjTQi1IjALQrqCbGgfJFUJ2uOTsRYvIy7f8UxiP/KXBiOFvw==
X-Received: by 10.98.130.194 with SMTP id w185mr21053265pfd.101.1478212255541; 
 Thu, 03 Nov 2016 15:30:55 -0700 (PDT)
Received: from aurora.jms.id.au ([2403:480:11:8000:3922:4bc4:ef17:3570])
 by smtp.gmail.com with ESMTPSA id m129sm15048835pfm.13.2016.11.03.15.30.52
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Thu, 03 Nov 2016 15:30:55 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Fri, 04 Nov 2016 09:00:48 +1030
From: Joel Stanley <joel@jms.id.au>
To: andrew@aj.id.au,
	openbmc@lists.ozlabs.org
Subject: [linux dev-4.7 PATCH 4/4] arm: aspeed: Remove SPI controller hacks
Date: Fri,  4 Nov 2016 09:00:09 +1030
Message-Id: <20161103223009.4794-5-joel@jms.id.au>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20161103223009.4794-1-joel@jms.id.au>
References: <20161103223009.4794-1-joel@jms.id.au>
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
X-List-Received-Date: Thu, 03 Nov 2016 22:30:57 -0000

The spi-nor driver aspeed-smc configures these registers now.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/mach-aspeed/aspeed.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index 46e711ca275c..f81dccbcd2eb 100644
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -42,19 +42,9 @@ static void __init do_common_setup(void)
 	/* Enable LPC FWH cycles, Enable LPC to AHB bridge */
 	writel(0x00000500, AST_IO(AST_BASE_LPC | 0x80));
 
-	/* Flash controller */
-	writel(0x00000003, AST_IO(AST_BASE_SPI | 0x00));
-	writel(0x00002404, AST_IO(AST_BASE_SPI | 0x04));
-
 	/* Set UART routing */
 	writel(0x00000000, AST_IO(AST_BASE_LPC | 0x9c));
 
-	/* SCU setup
-	 *  - GPIOC{4,5,6} are FUNC_MODE{0,1,2}. These nets are
-	 *    connected to the Ethernet phy and to ensure the correct
-	 *    operation they all need to be in GPIO mode (SCU90[0] = 0)
-	 *    and then pulled down
-	 */
 	/* TODO: This should go in the GPIO driver device tree bindings */
 	writel(0x01C000FF, AST_IO(AST_BASE_SCU | 0x88));
 	writel(0xC1C000FF, AST_IO(AST_BASE_SCU | 0x8c));
-- 
2.9.3
