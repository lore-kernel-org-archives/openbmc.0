Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sk3hT6Q8XzDrVY
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 00:52:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=eL9VJ44m; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=CdnRCpAV; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id D6C8420813;
 Tue, 27 Sep 2016 10:52:07 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute7.internal (MEProxy); Tue, 27 Sep 2016 10:52:07 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:in-reply-to:message-id:references
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=/GGKV
 LbX5qfBNUyLhrcOSR5DuJA=; b=eL9VJ44mW1y56/og3BuCr665TOGE8W09m1B7G
 T1SgHFvBWmVety0g9dWiFLFejL/G8MyPcBPi/EznFGHBBU3AlWdVzQHnDCYWfcdw
 e3iJo6rjwblajZpw8WKGnIT603sYsQ4M8B7j/8I3Rpq66tpe76Na7e4gGUEnGQyF
 0ym4uI=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:in-reply-to
 :message-id:references:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=/GGKVLbX5qfBNUyLhrcOSR5DuJA=; b=CdnRC
 pAV+NFedU4J7Oc0vfjd7dBKlPDnbB9smtPhrkpdxkTFQ0PoVwSx9Dl/5Za/Xjtsh
 o3HLlJk/uBCL9o8eaxzSBq3goZn5YeGqnti2KGFFzMipo9S+hxGhkjQa1MX0chR8
 BpG5HOdme2wX/7fCLEADaO6vbzDmJveM0YRA2A=
X-Sasl-enc: uGfJavDNHpDCl0JNf+Qm93n7GCN2hg4RyL52bejrHh1U 1474987926
Received: from keelia.au.ibm.com (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id E1818F29CC;
 Tue, 27 Sep 2016 10:52:03 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Joel Stanley <joel@jms.id.au>, Mark Rutland <mark.rutland@arm.com>,
 Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 6/8] pinctrl: aspeed-g4: Capture SuperIO pinmux dependency
Date: Wed, 28 Sep 2016 00:20:18 +0930
Message-Id: <b5f67ba76018314d08e240f95951751896687d37.1474986045.git-series.andrew@aj.id.au>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.115463f791b69859c5ce9dafd61a5755ea039f4b.1474986045.git-series.andrew@aj.id.au>
References: <cover.115463f791b69859c5ce9dafd61a5755ea039f4b.1474986045.git-series.andrew@aj.id.au>
In-Reply-To: <cover.115463f791b69859c5ce9dafd61a5755ea039f4b.1474986045.git-series.andrew@aj.id.au>
References: <cover.115463f791b69859c5ce9dafd61a5755ea039f4b.1474986045.git-series.andrew@aj.id.au>
X-Mailman-Approved-At: Wed, 28 Sep 2016 08:21:04 +1000
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
X-List-Received-Date: Tue, 27 Sep 2016 14:52:10 -0000

Two LPC-related signals in the AST2400 depend on state in the SuperIO IP
block. Use the recently added infrastructure to capture this
relationship.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c | 4 ++--
 drivers/pinctrl/aspeed/pinctrl-aspeed.h    | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
index a21b071ff290..ceb13d4955cb 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
@@ -82,8 +82,8 @@ FUNC_GROUP_DECL(MDIO2, A3, D5);
 
 #define H19 13
 #define H19_DESC        SIG_DESC_SET(SCU80, 13)
-SIG_EXPR_LIST_DECL_SINGLE(LPCPD, LPCPD, H19_DESC);
-SIG_EXPR_LIST_DECL_SINGLE(LPCSMI, LPCSMI, H19_DESC);
+SIG_EXPR_LIST_DECL_SINGLE(LPCPD, LPCPD, H19_DESC, SIG_DESC_BIT(SIORD30, 1, 0));
+SIG_EXPR_LIST_DECL_SINGLE(LPCSMI, LPCSMI, H19_DESC, SIG_DESC_SET(SIORD30, 1));
 MS_PIN_DECL(H19, GPIOB5, LPCPD, LPCSMI);
 
 FUNC_GROUP_DECL(LPCPD, H19);
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.h b/drivers/pinctrl/aspeed/pinctrl-aspeed.h
index 4384407d77fb..3a76d2c95584 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.h
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.h
@@ -266,6 +266,8 @@
 #define SCUA8           0xA8 /* Multi-function Pin Control #9 */
 #define HW_STRAP2       0xD0 /* Strapping */
 
+#define SIORD30		SIG_DESC_TO_REG(ASPEED_IP_SIO, 0x30)
+
  /**
   * A signal descriptor, which describes the register, bits and the
   * enable/disable values that should be compared or written.
-- 
git-series 0.8.10
