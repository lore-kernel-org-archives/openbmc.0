Return-Path: <andrew@aj.id.au>
Received: from homiemail-a19.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rQqN01QWdzDq5s
 for <openbmc@lists.ozlabs.org>; Fri, 10 Jun 2016 14:44:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=O5TVGOVE; 
 dkim-atps=neutral
Received: from homiemail-a19.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a19.g.dreamhost.com (Postfix) with ESMTP id 87B05604078;
 Thu,  9 Jun 2016 21:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=from:to:cc
 :subject:date:message-id:in-reply-to:references; s=aj.id.au; bh=
 NeO98GBliycnXKVxxl8ykRrpwcs=; b=O5TVGOVEglxAj8z1EoRJB5iyuBt+9YEf
 pcjFqyOicve8Q9bl+PYqQE14XUhn4F0bHPyebZle+NcD4u0nOKOhJap3bjRdVDHL
 e3ugx1FXYujeaxMbruYXMvYnrEf/OpHaDGQzt2gBZBGUXtRSngOx1doTcCW9ahDl
 +Of+1ikVYXE=
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a19.g.dreamhost.com (Postfix) with ESMTPSA id 5A976604061;
 Thu,  9 Jun 2016 21:44:45 -0700 (PDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: OpenBMC <openbmc@lists.ozlabs.org>
Cc: Joel Stanley <joel@jms.id.au>, Gavin Shan <gwshan@linux.vnet.ibm.com>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux 1/4] aspeed: Use old MDC/MDIO interface for ftgmac100
 driver compat
Date: Fri, 10 Jun 2016 14:14:26 +0930
Message-Id: <1465533869-3218-2-git-send-email-andrew@aj.id.au>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1465533869-3218-1-git-send-email-andrew@aj.id.au>
References: <1465533869-3218-1-git-send-email-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 10 Jun 2016 04:44:48 -0000

This is a work-around, and we should aim to move to the new interface.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/mach-aspeed/aspeed.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index 90c541f32ee8..12f3a044a03c 100644
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -82,6 +82,7 @@ static void __init aspeed_dt_init(void)
 
 #define AST_BASE_LPC		0x1E789000 /* LPC Controller */
 #define AST_BASE_SPI		0x1E630000 /* SPI Memory Controller */
+#define AST_BASE_MAC1		0X1E660000 /* MAC 1 */
 #define AST_BASE_SCU		0x1E6E2000 /* System Control Unit (SCU) */
 #define AST_BASE_GPIO		0x1E780000 /* GPIO Controller */
 
@@ -186,8 +187,15 @@ static void __init do_garrison_setup(void)
 
 static void __init do_ast2500evb_setup(void)
 {
+	unsigned long reg;
+
 	/* Reset AHB bridges */
 	writel(0x02, AST_IO(AST_BASE_SCU | 0x04));
+
+	/* Set old MDIO interface */
+	reg = readl(AST_IO(AST_BASE_MAC1 | 0x40));
+	reg &= ~0x80000000;
+	writel(reg, AST_IO(AST_BASE_MAC1 | 0x40));
 }
 
 #define SCU_PASSWORD	0x1688A8A8
-- 
2.7.4
