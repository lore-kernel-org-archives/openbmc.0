Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vF3b66xywzDqDC
 for <openbmc@lists.ozlabs.org>; Fri,  3 Feb 2017 15:21:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="EWXURVCb"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="JocnYqe6"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id CBA5F20A9A;
 Thu,  2 Feb 2017 23:21:20 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 02 Feb 2017 23:21:20 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=f2G
 OOLAyASq2fzB+pBIt6dEv3rI=; b=EWXURVCbTs9Gq7+x4wZQPPGOF/DhxHkjcER
 v0YpyW/VYv0DLT2JNG0T/iWaosTQNf0uxQIgpKkxKx1kJQrzY57dU8nMsnxQfNFd
 6VfgQsKBqjyvQSgqBoirpfRT23XsmvrGYxkyLGkQxPko2TfRPabwldk+XbHHiScn
 BZo+0Fng=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=f2GOOLAyASq2fzB+pBIt6dEv3rI=; b=JocnY
 qe6OHqkoyAlk/LT95eVtoD8j+WR7kndIe5C9qrPxQEOyP0nOVYXjswuIkx6PdAt1
 A3sX3HW1hEDZZ78m7IAr7CkiRXQWP8VCYtMfk6sgZ9BWhLBKfXY1JIz4lGPWeMGH
 PUTgOgirxKtqh+hgLTU/MZTUr2Ep2axf6AEcHQ=
X-ME-Sender: <xms:QAWUWAymbsmBE7wU_e18Nqg4PiF3ZR3msfabE2jej15qkUQQ0qg8_Q>
X-Sasl-enc: 5K9xh8tWqhamMlzrtH2B4mndk7hVn+/EFa/KF5Homiv5 1486095680
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id AFAE1240CC;
 Thu,  2 Feb 2017 23:21:18 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 Christopher Bostic <cbostic@linux.vnet.ibm.com>
Subject: [PATCH linux dev-4.7 09/14] pinctrl: aspeed: dt: Fix compatibles for
 the System Control Unit
Date: Fri,  3 Feb 2017 14:50:08 +1030
Message-Id: <20170203042013.2719-10-andrew@aj.id.au>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170203042013.2719-1-andrew@aj.id.au>
References: <20170203042013.2719-1-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 03 Feb 2017 04:21:23 -0000

Reference the SoC-specific compatible string in the examples as
required.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Acked-by: Joel Stanley <joel@jms.id.au>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
(cherry picked from commit c95b0fec3cff0ba584fd2f9e71fd9001ad15381a)
---
 Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt
index 67e133ba3113..016b8c3f3df5 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt
@@ -11,9 +11,14 @@ Required properties:
 		"aspeed,ast2500-pinctrl"
 		"aspeed,g5-pinctrl"
 
-The pin controller node should be a child of a syscon node with the required
+The pin controller node should be the child of a syscon node with the required
 property:
-- compatible: "syscon", "simple-mfd"
+
+- compatible : 		Should be one of the following:
+			"aspeed,ast2400-scu", "syscon", "simple-mfd"
+			"aspeed,g4-scu", "syscon", "simple-mfd"
+			"aspeed,ast2500-scu", "syscon", "simple-mfd"
+			"aspeed,g5-scu", "syscon", "simple-mfd"
 
 Refer to the the bindings described in
 Documentation/devicetree/bindings/mfd/syscon.txt
@@ -64,7 +69,7 @@ TXD3 TXD4 UART6 USBCKI VGABIOSROM VGAHS VGAVS VPI24 VPO WDTRST1 WDTRST2
 Examples:
 
 syscon: scu@1e6e2000 {
-	compatible = "syscon", "simple-mfd";
+	compatible = "aspeed,ast2400-scu", "syscon", "simple-mfd";
 	reg = <0x1e6e2000 0x1a8>;
 
 	pinctrl: pinctrl {
-- 
2.9.3
