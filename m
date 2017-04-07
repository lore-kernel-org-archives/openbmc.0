Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w005r5lMyzDqJk
 for <openbmc@lists.ozlabs.org>; Fri,  7 Apr 2017 22:59:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="qZVheRLo"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="JyymTsWv"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id B314720BBB;
 Fri,  7 Apr 2017 08:59:26 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Fri, 07 Apr 2017 08:59:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=rr/nn4
 5nE/1csmMVZBZDbMI194HisfLBqUPn5XqFbXk=; b=qZVheRLoe4fGDkDBUMjJV9
 t04835U49N/Q+Q2Lq/VULHB1kEJDh3wBRKahz71DIkK1G5OPT0iQTF5E8RrPZlX1
 yZe2qbJKxV5oGKWs/XYUO5rPn2lTNhtYCEXesiqPDtywyvOEV97zQHqy9/I/qdkZ
 Sv8hSPmScWLG9i3kIxit46zdpGmbXDX57yQw1oj/3r52AsVxCwYvLGN8jBol7BWl
 dF5mp12Ja4Aq6w+DgRlpd1wQ4PbZyAEwThDQSxhe52KyWDtPsAuHz+5TowasNJ9O
 j9NFbh+f3Z1B9T5engE6ODqjfuww9SfyKPCB4pyxGm1QYvMTGHEnzJsifAp9356w
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=rr/nn45nE/1csmMVZBZDbMI194HisfLBqUPn5XqFb
 Xk=; b=JyymTsWvMyNm75YZJJ4y2pV38HA7ij27Cpol6cAK9UPpqJQ3LYF6u9n+6
 fdmic9NBJSCyJJEWAl4v/QnEdkceYhB3YPaFvOnQcyqjC5MT5TyeCKekr+aTWOYy
 ZjkFiDDD5mKSVzcwRxIcGIP7BcKDUJR8DFnPxLkAc29C1gjhxh4korFLVY30q8zA
 6cnh36ediE0qIAUk/Tt6ekZHqnkxeKiD4oPi9YLSEZSl8eF7htKxEaE1BThPTx5R
 C19DaS58mrWADsTmbhT1gHFPv1SZ3HtcoA6xcO78zLg9m/4xaOBoCZD+OcTk1cq+
 OvNzg5/ClXfQdQNjQa4uPt93e1Pow==
X-ME-Sender: <xms:Lo3nWMQCLcXfat2sii9qO2HuHIP9OThiiJOein8HGvnkHFuYfaeFPQ>
X-Sasl-enc: ToIQvRSOS6X3zSQq28jdEovqpuWP84+NnxOozTpMF9RZ 1491569965
Received: from keelia.au.ibm.com (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id 084E87E71B;
 Fri,  7 Apr 2017 08:59:22 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, Rob Herring <robh+dt@kernel.org>,
 Joel Stanley <joel@jms.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: [PATCH v2 2/4] gpio: aspeed: dt: Add optional clocks property
Date: Fri,  7 Apr 2017 22:29:00 +0930
Message-Id: <20170407125902.15960-3-andrew@aj.id.au>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170407125902.15960-1-andrew@aj.id.au>
References: <20170407125902.15960-1-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 07 Apr 2017 12:59:29 -0000

We need a reference to the HPLL to calculate debounce cycles. If the
clocks property is not supplied in the GPIO node then the consumer
should deny any debounce requests.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 Documentation/devicetree/bindings/gpio/gpio-aspeed.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt b/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt
index 6f30b9a048da..c756afa88cc6 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt
@@ -18,6 +18,7 @@ Required properties:
 Optional properties:
 
 - interrupt-parent      : The parent interrupt controller, optional if inherited
+- clocks                : A phandle to the HPLL clock node for debounce timings
 
 The gpio and interrupt properties are further described in their respective
 bindings documentation:
-- 
2.9.3
