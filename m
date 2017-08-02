Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xMgch2gGszDrHR;
 Wed,  2 Aug 2017 14:46:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="dBV0W9Hx"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="amydFutQ"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 5CD5520896;
 Wed,  2 Aug 2017 00:46:10 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Wed, 02 Aug 2017 00:46:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=iklIJe
 eu7ngGYXMxEeOO9cKDg2XchLotQypdNrCwy6c=; b=dBV0W9HxVdY7VKhozlu3J1
 W51ajsBqFdIwytx45drvU7NEXa1x2IsDW1TABezQotWfCRIieUnJAYrQKLLm5LZ9
 KZ9u86NISfBfARSghk3NubkQQgvztqfIZ/c2w/IA0xF7nAwf5XU+2Y2S9NGcawh5
 OI1An7mRmILbHSyMueFQtK3JNnPSMcK/Wo2QsFcc86DQEyD2aPPCGRA5ntlRZYnX
 Z/Lzr0k+qwNEiEE7XIsRfmKgm7oIeYdjtHxST4mlVAS6ZIFUoQKOLa0TqrwE1BFp
 98kpXWlXDTrSmOtmKBwh0uoMYevoJjL4rUfYr3uFsXljbo/bGs8IiwTM42l7enew
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=iklIJeeu7ngGYXMxEeOO9cKDg2XchLotQypdNrCwy
 6c=; b=amydFutQGa2ntIbitfZ3C4Wm7npMwA2K2DL28wuBSiZKKDQQ+t3DIQnNZ
 PvnuvHb6UQJ0h3L79tdWcK958GQfjMetPoHEhqc05q4yYFl7LJAnNh7vu7ZUDZAF
 2FTHyL71GPOE1F4ZSJMJBhjKAmyi3I+c+k9aqD9hMfvZ0t7h7592/7qFxR2xUJIf
 s1urmyTkT2ANDY0/qT/l11O1UsUD6wSiidHucmMfN+Gqu/uiFpAlC0yeP1X0v5Ok
 FFOs/EPdXoepoXtLmFGmNwEZfZSL4yPYY3Q3M6sbPDP92f9G32atKTEYy/juxbiC
 91AbTBeEwrrtTrQJMn/SQHQIRx7SA==
X-ME-Sender: <xms:ElmBWdudCfxRnSNftI-6Ud8lzEuXKrfbYG2QAhFP1uangibk21lUXA>
X-Sasl-enc: Zsa5Z0KKPEJlDcTWIR1LbK2P90EagRtfh0UQfDW5PR8/ 1501649169
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2AC3C241D9;
 Wed,  2 Aug 2017 00:46:05 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-watchdog@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, wim@iguana.be, linux@roeck-us.net,
 robh+dt@kernel.org, mark.rutland@arm.com, joel@jms.id.au,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org
Subject: [PATCH 1/2] dt-bindings: watchdog: aspeed: External reset signal
 properties
Date: Wed,  2 Aug 2017 14:15:28 +0930
Message-Id: <20170802044529.30032-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170802044529.30032-1-andrew@aj.id.au>
References: <20170802044529.30032-1-andrew@aj.id.au>
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
X-List-Received-Date: Wed, 02 Aug 2017 04:46:13 -0000

For the AST2500 and compatible watchdog controllers the external reset
signal can be configured for push-pull or open-drain drive types, and in
the case of push-pull driving, active low or high.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
index 2b34ce9b60b9..c5077a1f5cb3 100644
--- a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
@@ -33,10 +33,18 @@ Optional properties:
         - none: No reset is performed on timeout. Assumes another watchdog
                 engine is responsible for this.
 
+ - aspeed,alt-boot:    If property is present then boot from alternate block.
  - aspeed,external-signal: If property is present then signal is sent to
 			external reset counter (only WDT1 and WDT2). If not
 			specified no external signal is sent.
- - aspeed,alt-boot:    If property is present then boot from alternate block.
+ - aspeed,ext-pulse-duration: External signal pulse duration in microseconds
+
+Optional properties for AST2500-compatible watchdogs:
+ - aspeed,ext-push-pull: If aspeed,external-signal is present, set the pin's
+			 drive type to push-pull. The default is open-drain.
+ - aspeed,ext-active-high: If aspeed,external-signal is present and and the pin
+			   is configured as push-pull, then set the pulse
+			   polarity to active-high. The default is active-low.
 
 Example:
 
-- 
2.11.0
