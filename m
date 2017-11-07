Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="ZEkL+OAq"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ERjwb/Ne"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yWLj60r08zDrKb
 for <openbmc@lists.ozlabs.org>; Tue,  7 Nov 2017 18:31:54 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id F3A7620D69;
 Tue,  7 Nov 2017 02:31:51 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Tue, 07 Nov 2017 02:31:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=7A2QbR3W5OpOftfu+
 QgKHXFa9D14K5wDOfZ2cLGce4g=; b=ZEkL+OAqi+oJoihTS2Tuoih/pxX06PONL
 cTz6Mci36IJszlh20gfthkKrJYzhx7LxZkP3YuC7VyKhm97XEOmYjk/MyTQntdM3
 r4fhvNAgCSDLEMj4a/TwE+jKW6gBH9Ldl08zWrSyHk+WpiYmqO+PeFFfNTITAfDa
 2WmkaAeAwNVNt+coZUVFAl5YE69R0Qe+fu5wrps9zSGpBW2D/w+JB7JA3KJ5SUBk
 QNFVLLKXijWj/pi5ncaYuIOkEwQWV4ctVAJdzzfLbchvaWxK5/uS/cPoZ+vyQ2oN
 Yic49j/6FTK3PxXwJTOOlZksmKx5YtmgEBZex/IbtR95PKbOSXmhg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=7A2QbR3W5OpOftfu+QgKHXFa9D14K5wDOfZ2cLGce4g=; b=ERjwb/Ne
 8leNu4/1Cld/va1Tsdl5lAzEOo5+km/9NX0VZqzTNN3ae1W3w4VsRSeil6ZKk8hf
 R5fIlK/hQF4bzdRL/vBeNu0RBfFguRof+Ra3qjD77gUPARL69sM7rEWBFnHtlxWC
 8l7tTuK6VduYeOVgKqMDT0etHs34mKOK4tq/gOnG4FlUI7Cg46Dk1Y0mLGBZVwBT
 WoYyHVpkOVSj/EVN5nukBhIrHemo1urUbsLQrLluzOKnTJrRIcS5bymwmq7zPSpU
 N5Fe7pSrHpEvzHbjfWU10Vevvm6NQbVtoeZZiv/TqWukzMgLFsePH0yGHPIMRVlx
 Knep0z5dcpX/rg==
X-ME-Sender: <xms:Z2EBWvuHsGBBfX2WBuSUsXjkncVzu-p13YqN7OnThTOB78vOHaQ4jg>
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 474C2242CF;
 Tue,  7 Nov 2017 02:31:49 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13 12/23] dt-bindings: watchdog: aspeed: External
 reset signal properties
Date: Tue,  7 Nov 2017 18:00:35 +1030
Message-Id: <20171107073046.13319-13-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20171107073046.13319-1-andrew@aj.id.au>
References: <20171107073046.13319-1-andrew@aj.id.au>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Nov 2017 07:31:54 -0000

For the AST2500 and compatible watchdog controllers the external reset
signal can be configured for push-pull or open-drain drive types, and in
the case of push-pull driving, active low or high.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Wim Van Sebroeck <wim@iguana.be>
(cherry picked from commit e654f19165483adfc30eeabe69a1efc23182bf0e)
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
