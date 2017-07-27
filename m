Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xJ7Fj5HJszDrHq
 for <openbmc@lists.ozlabs.org>; Thu, 27 Jul 2017 20:17:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="pINaSYmf"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="AiiAA5Ny"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 95529206A5;
 Thu, 27 Jul 2017 06:17:27 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 27 Jul 2017 06:17:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=LlQ89Y
 +nECvfV0OPqRPsKdyysx/qh5xTcopQBDSf7CQ=; b=pINaSYmf3kaEPNXNVqoWSK
 PL4dpD6XfHIy53YqtQRBucztCF2uV4NUcI7PmEWDHHA95SyooksfA99a3t8UWAoK
 bAcoM+lugODHTONUr3k2ONIaN9KoMLpiY/t714VzCCmx6ksWl6CxjVlQ9ywGj8RJ
 DWqrWpTZP9YrsZ0d6FYMDoigLKF/m5OGfGG4DhVkvMKXc2WLWKwBbIYr+yuWnDjH
 zXG8Lb0NZHNyC/dG2nkIntBOUYzQ6djIHQTO7UR2D0ENo+mvfQTY26wOgL2gAwej
 XT9+YlhLkIeQT//HX/799QWwgEGk8UZjwAs2TSc05teWSbw3iEgYLd6LjWZbSN4A
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=LlQ89Y+nECvfV0OPqRPsKdyysx/qh5xTcopQBDSf7
 CQ=; b=AiiAA5NyzaIyRpUax5RuoM2+bgCu6b9Y+RfV1CSSu9PPpvdgJglEbIB2y
 AH/E9DDUWBeueBkOWepf/Z+5nTiJhKhja3X0V72rjwil92EOxmSoOHPs/p6W8IpW
 oCpS6PGahAGMWNqZVTLZrGKEWVs+GuvWhV/hirsqTcxi1XzXSxzSlsIX3CxT5G2Y
 jyXo7AVTHyZxOLJBhv3YZFyFeO0wTCS/Ih7ROaLyFbtw1vy/bh96AMzAVKyd2CBj
 9M1H1tOwHjhmP3gPBdXLaGtawJ4dwkaJV0k0mmT33cj47PYQCU6ZZ7KO+uSsrxv/
 ql3tARutSrt9TywX3dfQQa7W3dUdQ==
X-ME-Sender: <xms:t715WXsD2vm_HBn0n9-j-TveVGjbLm3rnltYIw3uqLqqkwunM3JjrQ>
X-Sasl-enc: 50mn1LZss4vfw4lEK5OXA3g+gKVfRvFvE3VtlBDhShET 1501150646
Received: from keelia.aj.id.au (ppp118-210-176-216.bras2.adl6.internode.on.net
 [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id 58C117E2F8;
 Thu, 27 Jul 2017 06:17:25 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>, mspinler@linux.vnet.ibm.com,
 msbarth@linux.vnet.ibm.com, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 v3 2/4] dt-bindings: watchdog: aspeed: External
 reset signal properties
Date: Thu, 27 Jul 2017 19:46:45 +0930
Message-Id: <20170727101647.26960-3-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170727101647.26960-1-andrew@aj.id.au>
References: <20170727101647.26960-1-andrew@aj.id.au>
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
X-List-Received-Date: Thu, 27 Jul 2017 10:17:30 -0000

For the AST2500 and compatible watchdog controllers the external reset
signal can be configured for push-pull or open-drain drive types, and in
the case of open-drain driving, active low or high.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
index f526b003b2e0..7aa885f620ef 100644
--- a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
@@ -36,10 +36,18 @@ Optional properties:
  - aspeed,interrupt:	If property is present then interrupt CPU.
 			If not specified then don't interrupt CPU.
 
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
