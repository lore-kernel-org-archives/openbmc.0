Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vF3Zh2GbnzDqBX
 for <openbmc@lists.ozlabs.org>; Fri,  3 Feb 2017 15:21:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="hwsRkc9Q"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="WRH4E89y"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 44AFB20A64;
 Thu,  2 Feb 2017 23:20:58 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 02 Feb 2017 23:20:58 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=eNg
 8bMmQsC4QQEr24SLHVL1SSRo=; b=hwsRkc9QxucT7jsOj7WVcHaENCtG3/HpPRC
 9elqju1QS4/o0APIm3zUSFGFkc2+2iF8e2XBJLHDAdEnocRlCuAlewfRdI9zTiWQ
 TqhpZf0JbEGTOkIMehdJv7nNOpNZ+SikTd4/bCS2ZEjrkWqx/r/mynhrYbwZ6IZ6
 tVECAwI8=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=eNg8bMmQsC4QQEr24SLHVL1SSRo=; b=WRH4E
 89yFuhUSkyL6xDOKKy+J+Bj/aLAtE/CJvHVig3x8ZVkF+UGtzxJwegnTfeMPhWdJ
 QLs+dQDCTpNMwZZaPMLxLrUl0+ezz06kg4tPvL+8vCmasTakP3aX4Fm7jyWupUBZ
 c7T0eEzsAnUdkkU2GHT1a6HhoYNEDz9egrlMss=
X-ME-Sender: <xms:KgWUWKBhmTDIbE0AHCefEA63_bVjdHntUFk57VcP0CG5AnXUq85jHw>
X-Sasl-enc: v9j8gHaJNXsXY0mI1OoKeafKSpcPGXW4kAOXvnyQJ7n2 1486095657
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id F1DA824570;
 Thu,  2 Feb 2017 23:20:55 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 Christopher Bostic <cbostic@linux.vnet.ibm.com>
Subject: [PATCH linux dev-4.7 01/14] gpio: aspeed: dt: Reset bindings to
 mainline
Date: Fri,  3 Feb 2017 14:50:00 +1030
Message-Id: <20170203042013.2719-2-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 03 Feb 2017 04:21:00 -0000

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 .../devicetree/bindings/gpio/gpio-aspeed.txt         | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt b/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt
index 1954b288cd49..393bb2ed8a77 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt
@@ -2,28 +2,22 @@ Aspeed GPIO controller Device Tree Bindings
 -------------------------------------------
 
 Required properties:
+- compatible		: Either "aspeed,ast2400-gpio" or "aspeed,ast2500-gpio"
+
 - #gpio-cells 		: Should be two
 			  - First cell is the GPIO line number
 			  - Second cell is used to specify optional
 			    parameters (unused)
 
-- compatible		: Either "aspeed,ast2400-gpio" or "aspeed,ast2500-gpio"
-
 - reg			: Address and length of the register set for the device
 - gpio-controller	: Marks the device node as a GPIO controller.
 - interrupts		: Interrupt specifier (see interrupt bindings for
 			  details)
+- interrupt-controller	: Mark the GPIO controller as an interrupt-controller
 
 Optional properties:
-- interrupt-controller	: Marks the device node as an interrupt controller.
-- interrupt-parent	: The parent interrupt controller, optional if inherited
-- #interrupt-cells 	: Should be 2.  The first cell is the GPIO number.
-			  The second cell bits[3:0] is used to specify trigger
-			  type and level flags:
-			      1 = low-to-high edge triggered.
-			      2 = high-to-low edge triggered.
-			      4 = active high level-sensitive.
-			      8 = active low level-sensitive.
+
+- interrupt-parent     : The parent interrupt controller, optional if inherited
 
 The gpio and interrupt properties are further described in their respective
 bindings documentation:
@@ -34,9 +28,9 @@ bindings documentation:
   Example:
 	gpio@1e780000 {
 		#gpio-cells = <2>;
-		compatible = "aspeed,ast2400-gpio"
+		compatible = "aspeed,ast2400-gpio";
 		gpio-controller;
-		interrupt-parent = <&intc>;
 		interrupts = <20>;
 		reg = <0x1e780000 0x1000>;
+		interrupt-controller;
 	};
-- 
2.9.3
