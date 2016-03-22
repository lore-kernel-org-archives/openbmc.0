Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qTg4D0KwYzDq6X
 for <openbmc@lists.ozlabs.org>; Tue, 22 Mar 2016 15:40:43 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1458621642164649.3983427224949;
 Mon, 21 Mar 2016 21:40:42 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Adi Gangidi <adi.gangidi@rackspace.com>
Subject: [PATCH linux v2 1/2] Updated SCU88 register and SCU90 init values
Date: Mon, 21 Mar 2016 23:40:29 -0500
Message-Id: <1458621630-14179-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1458621630-14179-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1458621630-14179-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Zoho-Virus-Status: 1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Mar 2016 04:40:44 -0000

From: Adi Gangidi <adi.gangidi@rackspace.com>

Before This change:
a) SCU90[0]=1, function pin Incorrectly defined. It must be pull down internally.
b) For SCU88, bits 7:0 were set to 1. That is: We were reading : PWMx or VPIGx instead of GPIONx (GPIONx gives us the PCIe inventory status, where x is bit number). Because of this PCIe inventory was showing up wrong.

After This Change:
a) SCU90[0]=0
b) Bits (7:0) of SCU 88 are set to 0 . (According to Page 111 of data sheet these have to be set to 0 for us to to read GPION0 to GPIO N7 which indicate if PCIe device is present ).

Description of pins 0 of SCU 90:
Enable SD1 Function Pin

Description of pins 7:0 of SCU 88:
7 RW Enable PWM7 or VPIG7 function pin  (SCU90[5:4]=0x2 select Video pin)
6 RW Enable PWM6 or VPIG6 function pin   (SCU90[5:4]=0x2 select Video pin)
5 RW Enable PWM5 or VPIG5 function pin    (SCU90[5:4]!=0 select Video pin)
4 RW Enable PWM4 or VPIG4 function pin     (SCU90[5:4]!=0 select Video pin)
3 RW Enable PWM3 or VPIG3 function pin      (SCU90[5:4]!=0 select Video pin)
2 RW Enable PWM2 or VPIG2 function pin        (SCU90[5:4]!=0 select Video pin)
1 RW Enable PWM1 or VPIG1 function pin        (SCU90[5:4]=0x3 select Video pin)
0 RW Enable PWM0 or VPIG0 function pin         (SCU90[5:4]=0x3 select Video pin)
---
 arch/arm/mach-aspeed/aspeed.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index 15672f5..684c1b7 100644
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -118,8 +118,8 @@ static void __init do_common_setup(void)
 	/* SCU setup */
 	writel(0x01C000FF, AST_IO(AST_BASE_SCU | 0x88));
 	writel(0xC1C000FF, AST_IO(AST_BASE_SCU | 0x8c));
-	writel(0x01C0007F, AST_IO(AST_BASE_SCU | 0x88));
-	writel(0x003FA009, AST_IO(AST_BASE_SCU | 0x90));
+	writel(0x01C00000, AST_IO(AST_BASE_SCU | 0x88));    
+	writel(0x003FA008, AST_IO(AST_BASE_SCU | 0x90));
 
 	/* Setup scratch registers */
 	writel(0x00000042, AST_IO(AST_BASE_LPC | 0x170));
-- 
2.7.1
