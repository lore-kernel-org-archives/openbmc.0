Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qThB76GWxzDqF6
 for <openbmc@lists.ozlabs.org>; Tue, 22 Mar 2016 16:30:55 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1458624653686305.07611473405905;
 Mon, 21 Mar 2016 22:30:53 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Adi Gangidi <adi.gangidi@rackspace.com>
Subject: [PATCH linux v4 2/4] Barreleye SCU88 Setup to do_barreleye_setup
Date: Tue, 22 Mar 2016 00:30:34 -0500
Message-Id: <1458624636-15845-3-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1458624636-15845-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1458624636-15845-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 22 Mar 2016 05:30:56 -0000

From: Adi Gangidi <adi.gangidi@rackspace.com>

I moved the Barreleye SCU88 Setup to do_barreleye_setup.  This way the SCU88 value gets overwritten to 0x01C00000 only for Barreleye. For Palmetto it remains what it was previously.

SCU 90 Setup though is common for chip sets we have, so it still remains in common setup.
---
 arch/arm/mach-aspeed/aspeed.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index 684c1b7..143a45e 100644
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -118,7 +118,7 @@ static void __init do_common_setup(void)
 	/* SCU setup */
 	writel(0x01C000FF, AST_IO(AST_BASE_SCU | 0x88));
 	writel(0xC1C000FF, AST_IO(AST_BASE_SCU | 0x8c));
-	writel(0x01C00000, AST_IO(AST_BASE_SCU | 0x88));    
+	writel(0x01C0007F, AST_IO(AST_BASE_SCU | 0x88));    
 	writel(0x003FA008, AST_IO(AST_BASE_SCU | 0x90));
 
 	/* Setup scratch registers */
@@ -139,6 +139,10 @@ static void __init do_barreleye_setup(void)
 	/* GPIO setup */
 	writel(0x9E82FCE7, AST_IO(AST_BASE_GPIO | 0x00));
 	writel(0x0370E677, AST_IO(AST_BASE_GPIO | 0x04));
+	
+	/* Barreleye SCU setup for PCIe Inventory */
+	writel(0x01C00000, AST_IO(AST_BASE_SCU | 0x88));    
+
 
 	/*
 	 * Do read/modify/write on power gpio to prevent resetting power on
-- 
2.7.1
