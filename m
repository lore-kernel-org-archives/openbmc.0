Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w003h3gJZzDqKS
 for <openbmc@lists.ozlabs.org>; Fri,  7 Apr 2017 22:57:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Klqa91sA"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ZMIY4swQ"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9123A2090A;
 Fri,  7 Apr 2017 08:57:33 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Fri, 07 Apr 2017 08:57:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=a3iiQV
 x+0T2NXbDQAbeQ1UC/pMoWwmetCiiUtd8bc0M=; b=Klqa91sAyBJ1Jwu8t9hel+
 j1SJEj8YneQS9BpzX6ZzkbV3kfnTByoJyJk0ZENHCNZZuE9/ITAgt8paBFf48d9Z
 5m0twvf74g6SSs+g0c17GwX2+ggI3ZkfNQf3xVoA65Nxzz7JGzXfBcrR/q+D4AlF
 DaMOl5vn0Q6sDBQ4hxSBb9KZt8RldjQLJfILxHFE4GLhUfhYSkGPOZn8ol69K1j+
 WT1aGvIF6TKm10R8ZT4T99YrAaPfpvbKm26aV0fJUe0i25bJf40xXdJw+Q9uyO6K
 4aW2aHWlrNHjRL9u1vB0MmACK9GGHAso3TfEX5TRJWnwe7SkZnAjJzCYW5Cootzg
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=a3iiQVx+0T2NXbDQAbeQ1UC/pMoWwmetCiiUtd8bc
 0M=; b=ZMIY4swQMmOFD4HncOTUh2U2t/FclH2AXEKZta09X+4FVxS5q8s/cSZMU
 g91cNP3oXCDOtnQ/XgbHEoKth0Q9ZzIMZNEq6Fw1FHHP8d/+wDEQOK1YJRN2t3+w
 9Vk4x1880J+/BCD0X7c/tfrhYSS1+GMQd4m8fQlWRqpKz4ekEplRFt+dV2A9GxrS
 EgZT7WdJFf745H93eTMun3XgKa1l3ZlxxHJLXaD6ckrf7FQVoSj8GGQ1b84LjWk0
 KSUIYbLu2QsFTplr6yH+JGX/frzwO6wH9+iN7HCa8FtdIYXSuMeZqj/2oRzdMOya
 zBmmpM2AJeiU4L2YxT8aSZABZ2ncw==
X-ME-Sender: <xms:vYznWAVa8iT66fYgZSrglzWVL1K4sqneivlouJuBTK8oPyLUapDh6g>
X-Sasl-enc: bVXWtevwVJgZxC5tghVYwb3dw4s1lootq8s5lzQwoG1I 1491569852
Received: from keelia.au.ibm.com (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2858C7E695;
 Fri,  7 Apr 2017 08:57:28 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, Rob Herring <robh+dt@kernel.org>,
 Joel Stanley <joel@jms.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: [PATCH v2 1/4] pinctrl: aspeed: Document pinconf in devicetree
 bindings
Date: Fri,  7 Apr 2017 22:27:10 +0930
Message-Id: <20170407125713.15678-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170407125713.15678-1-andrew@aj.id.au>
References: <20170407125713.15678-1-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 07 Apr 2017 12:57:37 -0000

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 .../devicetree/bindings/pinctrl/pinctrl-aspeed.txt | 40 +++++++++++++++++-----
 1 file changed, 31 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt
index b98e6f030da8..ca01710ee29a 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt
@@ -34,13 +34,28 @@ Documentation/devicetree/bindings/mfd/syscon.txt
 Subnode Format
 ==============
 
-The required properties of child nodes are (as defined in pinctrl-bindings):
-- function
-- groups
+The required properties of pinmux child nodes are:
+- function: the mux function to select
+- groups  : the list of groups to select with this function
 
-Each function has only one associated pin group. Each group is named by its
-function. The following values for the function and groups properties are
-supported:
+Required properties of pinconf child nodes are:
+- groups: A list of groups to select (either this or "pins" must be
+          specified)
+- pins  : A list of ball names as strings, eg "D14" (either this or "groups"
+          must be specified)
+
+Optional properties of pinconf child nodes are:
+- bias-disable  : disable any pin bias
+- bias-pull-down: pull down the pin
+- drive-strength: sink or source at most X mA
+
+Definitions are as specified in
+Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt, with any
+further limitations as described above.
+
+For pinmux, each mux function has only one associated pin group. Each group is
+named by its function. The following values for the function and groups
+properties are supported:
 
 aspeed,ast2400-pinctrl, aspeed,g4-pinctrl:
 
@@ -90,6 +105,11 @@ syscon: scu@1e6e2000 {
 			function = "I2C3";
 			groups = "I2C3";
 		};
+
+		pinctrl_gpioh0_unbiased_default: gpioh0 {
+			pins = "A8";
+			bias-disable;
+		};
 	};
 };
 
@@ -110,6 +130,11 @@ ahb {
 					function = "I2C3";
 					groups = "I2C3";
 				};
+
+				pinctrl_gpioh0_unbiased_default: gpioh0 {
+					pins = "A18";
+					bias-disable;
+				};
 			};
 		};
 
@@ -143,6 +168,3 @@ ahb {
 		};
 	};
 };
-
-Please refer to pinctrl-bindings.txt in this directory for details of the
-common pinctrl bindings used by client devices.
-- 
2.9.3
