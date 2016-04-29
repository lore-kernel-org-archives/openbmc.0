Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qx2cR04VNzDqB2
 for <openbmc@lists.ozlabs.org>; Fri, 29 Apr 2016 15:41:10 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1461908456729840.4202481255525;
 Thu, 28 Apr 2016 22:40:56 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Ken <ken.sk.lai@mail.foxconn.com>
Subject: [PATCH linux] Add debounce for power button,
 pull down gpioQ7 to unlock identify LED
Date: Fri, 29 Apr 2016 00:40:54 -0500
Message-Id: <1461908454-24209-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1461908454-24209-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1461908454-24209-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 29 Apr 2016 05:41:11 -0000

From: Ken <ken.sk.lai@mail.foxconn.com>

---
 arch/arm/mach-aspeed/aspeed.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)
 mode change 100644 => 100755 arch/arm/mach-aspeed/aspeed.c

diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
old mode 100644
new mode 100755
index 594a781..fa5d467
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -138,9 +138,10 @@ static void __init do_barreleye_setup(void)
 	/* GPIO setup */
 	writel(0x9E82FCE7, AST_IO(AST_BASE_GPIO | 0x00));
 	writel(0x0370E677, AST_IO(AST_BASE_GPIO | 0x04));
-
+	writel(0x00001080, AST_IO(AST_BASE_GPIO | 0x84));
 	/* SCU setup */
 	writel(0x01C00000, AST_IO(AST_BASE_SCU | 0x88));
+	writel(0x010FFFFF, AST_IO(AST_BASE_SCU | 0xA8));
 
 	/*
 	 * Do read/modify/write on power gpio to prevent resetting power on
@@ -150,7 +151,10 @@ static void __init do_barreleye_setup(void)
 	reg |= 0xCFC8F7FD;
 	writel(reg, AST_IO(AST_BASE_GPIO | 0x20));
 	writel(0xC738F20A, AST_IO(AST_BASE_GPIO | 0x24));
-	writel(0x0031FFAF, AST_IO(AST_BASE_GPIO | 0x80));
+	writel(0x0031FF2F, AST_IO(AST_BASE_GPIO | 0x80));
+	writel(0x00000001, AST_IO(AST_BASE_GPIO | 0x48));
+	writel(0x00000001, AST_IO(AST_BASE_GPIO | 0x4C));
+	writel(0x00075300, AST_IO(AST_BASE_GPIO | 0x58));
 }
 
 static void __init do_palmetto_setup(void)
-- 
2.8.1
