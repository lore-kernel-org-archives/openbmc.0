Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rw9nR70zczDqXD
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jul 2016 21:01:15 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1469098872465626.6468936172497;
 Thu, 21 Jul 2016 04:01:12 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux] Fix the incorrect debounce setting on power button
Date: Thu, 21 Jul 2016 06:01:10 -0500
Message-Id: <20160721110110.6902-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160721110110.6902-1-openbmc-patches@stwcx.xyz>
References: <20160721110110.6902-1-openbmc-patches@stwcx.xyz>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Jul 2016 11:01:16 -0000

From: johnhcwang <hsienchiang@gmail.com>

PCLK divider selection is decided by SCU08[25:23] and the value is 011b
on Barreleye.
That means PCLK should be H-PLL/8=384MHz/8=48MHz, but the current
debounce timer value was computed by 24MHz.
So the correct value should be 20ms*48000000/1000=EA600h

Signed-off-by: johnhcwang <hsienchiang@gmail.com>
---
 arch/arm/mach-aspeed/aspeed.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index 11d8a61..fadbbb6 100755
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -159,9 +159,9 @@ static void __init do_barreleye_setup(void)
 	writel(0x00000001, AST_IO(AST_BASE_GPIO | 0x48));
 	writel(0x00000001, AST_IO(AST_BASE_GPIO | 0x4C));
 
-	/* Set debounce timer to 480000 cycles, with a pclk of 24MHz,
+	/* Set debounce timer to 480000 cycles, with a pclk of 48MHz,
 	 * corresponds to 20 ms. This time was found by experimentation */
-	writel(0x00075300, AST_IO(AST_BASE_GPIO | 0x58));
+	writel(0x000EA600, AST_IO(AST_BASE_GPIO | 0x58));
 }
 
 static void __init do_palmetto_setup(void)
-- 
2.9.0
