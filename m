Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xHg5Y28g5zDqmV
 for <openbmc@lists.ozlabs.org>; Thu, 27 Jul 2017 02:08:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="u07HqSyv"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="MW4ziolP"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0222C20823;
 Wed, 26 Jul 2017 12:08:47 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Wed, 26 Jul 2017 12:08:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=T9Ury7
 BsPRJfc7vm37faWh99tBZTts1DVcbpT4xL8sw=; b=u07HqSyvzIgNE90MXlLE1b
 KiHu9Q+eRN483wTrO79V/9OQoLZl/oTzceQLofxEwpvAy0c3nbzsj/BuXi4TWMV+
 7BjBuE/PMfltRSQTrDyUAaPfXHtwqd1JXcDLWnYnUi8q2MX2uSgYG9SIAeFJd1+B
 Nadsb4mbN7/T/RFKWN3U7A/VlfH7t3fN4psBRCjmLXWh+sLJOCqEiJ1eKfq5SsbR
 AEd1v7CFgVJn61NnEPC3urI9P9tM57Ss5RtJCCZGvgohPggLv3cNkLJCYKE/u8vv
 meWEBAlCo42irqjflxtXX8zp/UB8wvr8jwicu3gtVz3KZ5C+aZaj1VbHYP3UqwGA
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=T9Ury7BsPRJfc7vm37faWh99tBZTts1DVcbpT4xL8
 sw=; b=MW4ziolP7vF54VEZqoinqMFdx2sSJlUkZz2FWw31RlDuhdAr2RSIJcO/u
 HgNlcYcm1fsB2tOOxR4/InylfpyhMSI3oid4EPpsdvA6D2HAmuOwsI2uoi0K2X0U
 LiKEbnF8Erl3hiBGLSrCrL60HSgBgbLes/p9jWnuc1vzAlkSNKvxZEr4hYKgXEXP
 4pC9iZFqZTmosIz9tEqluqRg57hVTcQFY5sX6YxtyCR8xETlOxG8cbcujWNQwreR
 8Bsod347V9u2l97YJCpWhSWtv+9z+k/Az0SP9kEPFVY9kWCaDl5jpyh8X4aWnWqF
 TzEmiHy6iWKE0VP9YnlRYih3nt6xw==
X-ME-Sender: <xms:jr54WWC3Q-Aa4NlGbH9qIVhhYuiTSrNFC6njvhJLUeHyahaVlouFig>
X-Sasl-enc: 6SBMpc6BhkB3sNbbB5CjTNexqLCXjlkiiFwGovaXMuwP 1501085326
Received: from keelia.aj.id.au (ppp118-210-176-216.bras2.adl6.internode.on.net
 [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id BDA882414B;
 Wed, 26 Jul 2017 12:08:44 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>, mspinler@linux.vnet.ibm.com,
 msbarth@linux.vnet.ibm.com, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 v2 2/4] dt-bindings: watchdog: aspeed: External
 reset signal properties
Date: Thu, 27 Jul 2017 01:38:29 +0930
Message-Id: <20170726160831.17867-3-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170726160831.17867-1-andrew@aj.id.au>
References: <20170726160831.17867-1-andrew@aj.id.au>
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
X-List-Received-Date: Wed, 26 Jul 2017 16:08:50 -0000

For the AST2500 and compatible watchdog controllers the external reset
signal can be configured for push-pull or open-drain drive types, and in
the case of open-drain driving, active low or high.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
index f526b003b2e0..fa661319a080 100644
--- a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
@@ -41,6 +41,13 @@ Optional properties:
 			specified no external signal is sent.
  - aspeed,alt-boot:    If property is present then boot from alternate block.
 
+Optional properties for AST2500-compatible watchdogs:
+ - aspeed,ext-push-pull: If aspeed,external-signal is present, set the pin's
+			 drive type to push-pull. The default is open-drain.
+ - aspeed,ext-active-high: If aspeed,external-signal is present and and the pin
+			   is configured as open-drain, then set the pulse
+			   polarity to active-high. The default is active-low.
+
 Example:
 
 	wdt1: watchdog@1e785000 {
-- 
2.11.0
