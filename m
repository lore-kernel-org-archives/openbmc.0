Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qTgyb5MHrzDqFq
 for <openbmc@lists.ozlabs.org>; Tue, 22 Mar 2016 16:20:55 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1458624052089898.9820844084072;
 Mon, 21 Mar 2016 22:20:52 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Adi Gangidi <adi.gangidi@rackspace.com>
Subject: [PATCH linux v3 3/3] Updated SCU88 register and SCU90 init values
Date: Tue, 22 Mar 2016 00:20:29 -0500
Message-Id: <1458624029-15479-4-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1458624029-15479-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1458624029-15479-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 22 Mar 2016 05:20:56 -0000

From: Adi Gangidi <adi.gangidi@rackspace.com>

a) Updated SCU88 init value in barreleye init
b) Updated SCU90 init values in common init
c) Removed some some white spaces
---
 arch/arm/mach-aspeed/aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index 143a45e..5c18316 100644
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -118,7 +118,7 @@ static void __init do_common_setup(void)
 	/* SCU setup */
 	writel(0x01C000FF, AST_IO(AST_BASE_SCU | 0x88));
 	writel(0xC1C000FF, AST_IO(AST_BASE_SCU | 0x8c));
-	writel(0x01C0007F, AST_IO(AST_BASE_SCU | 0x88));    
+	writel(0x01C0007F, AST_IO(AST_BASE_SCU | 0x88));  
 	writel(0x003FA008, AST_IO(AST_BASE_SCU | 0x90));
 
 	/* Setup scratch registers */
-- 
2.7.1
