Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wD63n5PLyzDqJX
 for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2017 16:09:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="kGkstnXA"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="k2U8EDTx"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9F22F207DA;
 Thu, 27 Apr 2017 02:09:39 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 27 Apr 2017 02:09:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=4KFMtd
 Y2howq9dJBTC6vq7+LBxK21JNTnnJ1Ecopf/c=; b=kGkstnXAO6Y0W9deL20fK9
 NGSu0fbVjFMaU8EJnzZ16YdDosl/1AIomUy6e1OKRhkCcyFRK3J7FJbBpUC8skte
 91THiX92CX5i8qZfIekP0vZb9ikItLstLIQJ5ug5NnzgrjIG9XgHbwrLqSGMWgVW
 cXeaBcfNPSKhvAXyz/WCbTpPYoah6I2l621zO62c05IzrvNl+0JUjbH51wjmfyO5
 PyRUyRrZsS/yRCfb12f3IypXceI9cWRu/t39aLX/D9ZMv7JrgsjhX53hAhhdsdis
 XvTKrFn7ryvJbqxoS9z3a5mAL0GZYRaxYHlb83YhP5JM29c1Q/DZbxe+ulVaCM0A
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=4KFMtdY2howq9dJBTC6vq7+LBxK21JNTnnJ1Ecopf
 /c=; b=k2U8EDTx4tUN1ravHWuMFVqzMn9bEMqjjKWGRd+JxYdNM46j0yYak7C/I
 ++yn3wH9PAb2eUBJoV9NGzgslpYZe1IeF+98GcAu59ERU0VEvUonOgDVQ79us+wM
 Vc8+5bSSwBFFkYd2R3NArCO85PUcN8BJJjqqQKKVphxd5/1CQC01Mz75Gwuz1Mh/
 xMdJkwQl8V2eLjc5x+lOakQK5ZFbAhTDz2+//+yzCGcS10FDT5T1PpL0lngxzRgX
 Xg/b7kX9eOihHwdxGpd8CN5HdXt/UYnvZS0q3M4lbQUIQ9dDYqg38U/7Pn1dHS+f
 8VvMlx01wmSdFyETE35gLxB7QeMFQ==
X-ME-Sender: <xms:I4sBWYfsTD1N11XPHCfU7maJxm676I2Sr9kSSxzxd_aXTph7xX08gw>
X-Sasl-enc: BD/KcMhjqim4I4apKBftv0RAQp9csOhRReahRPCsY0Ml 1493273378
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6E86A241E1;
 Thu, 27 Apr 2017 02:09:36 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: openbmc@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, clg@kaod.org,
 mine260309@gmail.com, raltherr@google.com, xow@google.com
Subject: [PATCH linux dev-4.10 09/10] aspeed: witherspoon: Remove manual CS
 decoding window configuration
Date: Thu, 27 Apr 2017 15:38:22 +0930
Message-Id: <20170427060823.32226-10-andrew@aj.id.au>
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
X-List-Received-Date: Thu, 27 Apr 2017 06:09:42 -0000

This is now handled by the SMC driver

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/mach-aspeed/aspeed.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index e7d01f5490af..837649b9fad9 100644
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -148,12 +148,6 @@ static void __init do_zaius_setup(void)
 static void __init do_witherspoon_setup(void)
 {
 	do_common_setup();
-
-	/* Set SPI1 CE1 decoding window to 0x34000000 */
-	writel(0x70680000, AST_IO(AST_BASE_SPI | 0x34));
-
-	/* Set SPI1 CE0 decoding window to 0x30000000 */
-	writel(0x68600000, AST_IO(AST_BASE_SPI | 0x30));
 }
 
 static void __init do_romulus_setup(void)
-- 
2.9.3
