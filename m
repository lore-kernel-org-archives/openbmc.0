Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wD63R5vkmzDqFy
 for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2017 16:09:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="ByBvoZpi"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Wk7COO9n"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id B1CA2207DA;
 Thu, 27 Apr 2017 02:09:21 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 27 Apr 2017 02:09:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=O5J2bU
 jKqbi7JXAPxw6GXcgOK4e9h7tBD3/l+wgcpJg=; b=ByBvoZpiN6eGeot/EsmOkI
 6ZtbIo1w0SIG33PTbMZEzY0uDpu+1HmkRKQGxnoppyH9VC74fOWJZgBogtQJugVs
 N/aNYnsOrZnuTCoOljZ3Rz9s1pFm5Y5ICpWRAB3UUqucXUpJ20W3D+FpPRKKL60f
 4iGKOisSYRaIwha0oUBiFOmam09pBHcaC9KaY91A6asLD353Id3VZzz0GIT4zkyU
 tlmPZGaS/B9pAyvMgNKSCeaUJ3ll1cDXPsv5LISFRGf0Po6gURf2eLXze/ImpxVF
 vGDzMqVkqOqfocqKFRUc2NLr9pRG3unONONnKla8OXJr3QrXRYsYAmjK1VS8GdAg
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=O5J2bUjKqbi7JXAPxw6GXcgOK4e9h7tBD3/l+wgcp
 Jg=; b=Wk7COO9ntrekmip2OMamZ9yUuCrTNS8YqORRn7Meqd8boEHv0yWpY4/Jb
 iUvu1yBK0a7G/ge1vXEbtekgtVAlxlzJPkl7FYCtytSKOlAjsN1p4ezU+yIbioHG
 UgWiVbVsqJVIuEN+d6joPneBF9pRESZAY22CS0Fsa9sZ6y6Kaf9P9FhmvCvLlbD3
 5+EAxCpCFx4OR7qOCq7rcSw93ni4L49ezqGd+yXzttqcqztDyNsAZ0t9sP61J8ns
 ZOTcp86+HjWptAJFB6I+L9HS1L1ivTEBNyL3NWiDIOmjgZMkabVQ0okyoPRS29cY
 7dU0tiQTABsZ0rRLXPWXad3cGC/5Q==
X-ME-Sender: <xms:EYsBWYGUrhoDEPNTYMauejwTWLTCEq2KBiTQ69fUT9IrI_YHIBdWcA>
X-Sasl-enc: 0o70Q+IMH/xCTuJzVCGUqMFdMcjAG1uokLhLzRjZcBmM 1493273360
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 908F4241E1;
 Thu, 27 Apr 2017 02:09:18 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: openbmc@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, clg@kaod.org,
 mine260309@gmail.com, raltherr@google.com, xow@google.com
Subject: [PATCH linux dev-4.10 04/10] aspeed: garrison: Request RGMII and MDIO
 through devicetree
Date: Thu, 27 Apr 2017 15:38:17 +0930
Message-Id: <20170427060823.32226-5-andrew@aj.id.au>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170427060823.32226-1-andrew@aj.id.au>
References: <20170427060823.32226-1-andrew@aj.id.au>
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
X-List-Received-Date: Thu, 27 Apr 2017 06:09:24 -0000

This drops the muxing of ROMCS[1-3]#, ROMA24.

I assume they are unused as no other system designs have used them.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts | 5 +++++
 arch/arm/mach-aspeed/aspeed.c                 | 3 ---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
index 3bdaaf5008b2..8518bdf529f4 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
@@ -121,4 +121,9 @@
 
 &vuart {
 	status = "okay";
+}
+
+&mac0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii1_default &pinctrl_mdio1_default>;
 };
diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index 2333670f5c1d..b3aba87964bf 100644
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -103,9 +103,6 @@ static void __init do_garrison_setup(void)
 	/* Setup PNOR address mapping for 64M flash */
 	writel(0x30000C00, AST_IO(AST_BASE_LPC | 0x88));
 	writel(0xFC0003FF, AST_IO(AST_BASE_LPC | 0x8C));
-
-	/* SCU setup */
-	writel(0xd7000000, AST_IO(AST_BASE_SCU | 0x88));
 }
 
 static void __init do_ast2500evb_setup(void)
-- 
2.9.3
