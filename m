Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xJ6qf2BYqzDrJM
 for <openbmc@lists.ozlabs.org>; Thu, 27 Jul 2017 19:58:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="MFiY6usi"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Q/mE4wrN"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 304E1206D8;
 Thu, 27 Jul 2017 05:58:20 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 27 Jul 2017 05:58:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=1TBVAh
 JJuYz/3BPyf/XwepduQT7G8a/TkJtsNGlfEkA=; b=MFiY6usiKjTmLDBX0xGbwG
 Hqhq80fRO8yJOelK3F1HC+b2/n43oL6skVsy+dRH4nRDDOgvgQBLVTddwPkpkAen
 tN/f9Jgj3FpgzmHu1TCs2ZSn7U3HtMgV+MfRfnmj0Cwh412fOz+wqKf6DU288GSZ
 e2P/rq7ZTumMy26CLXT9TcG7FTlf5VLm2WX+bwwrXWTx+4/sAO7UNWOuHTOs3jFX
 C4Q+aOThdzNvk4LeEcbD5R3QzM5wUVVeRJzj0AuWeprzUcPTkWiDOZzSk04Qq2i+
 A8LJzz1i8Cp9bGoBqDcjdGqUbrKU6d0c/B0zP6+fsC+XIYf7JcPwC/la8TYEvrvA
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=1TBVAhJJuYz/3BPyf/XwepduQT7G8a/TkJtsNGlfE
 kA=; b=Q/mE4wrNg17VzJUssXRXyUdWPa5rzG0X/WBf8OAHTC1Xpc0ghYTxyGs3y
 sCBDz1Ey6TMWAcVYjV0SSsRcwcnuI+HqFwFt1tCURKz6AT7+I3L2G9ZhaCMOREkp
 V+Jn1MfVVjrHVIMnGuoiMRiLXpYnhYONpqGfQlmfDC+3qMLpcj2+FnnMiDxGv87D
 z8iV+sQc2yItSMQFG//6dvuUvgcHnGgRlIRuowhtPtZ2B3awFaceo/tzPWUIy4Kx
 xjKTJLikhsxB+Xx2qVB23CQA4slEF3QgLcJNJfvrlnbzzzl8ORUsC81gVCxSiApG
 /NF3fZ7D/jtOrKaVOMoKEHMt4BCMA==
X-ME-Sender: <xms:PLl5WeZGHFI-r5b1mltgP09O2H1YjQXtB9saLtLq_roVddM5_cSdYg>
X-Sasl-enc: xC7Jj5Xgx1A6/p8QHmxlu8GnJwX41xBlqUudIwz94aSj 1501149499
Received: from keelia.aj.id.au (ppp118-210-176-216.bras2.adl6.internode.on.net
 [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id B778A24130;
 Thu, 27 Jul 2017 05:58:17 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>, msbarth@linux.vnet.ibm.com,
 mspinler@linux.vnet.ibm.com, bradleyb@fuzziesquirrel.com,
 openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 v2 8/8] ARM: dts: aspeed: Witherspoon has a
 MAX31785A fan controller
Date: Thu, 27 Jul 2017 19:27:17 +0930
Message-Id: <20170727095717.25479-9-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170727095717.25479-1-andrew@aj.id.au>
References: <20170727095717.25479-1-andrew@aj.id.au>
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
X-List-Received-Date: Thu, 27 Jul 2017 09:58:23 -0000

The 'A' variant includes support for reading both tachometer values in
a dual tachometer fan configuration. Set the compatible value in the
devicetree to ensure the extra attributes are exposed.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index a474b3f58350..5afc03a19863 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -208,7 +208,7 @@
 	};
 
 	max31785@52 {
-		compatible = "maxim,max31785";
+		compatible = "maxim,max31785a";
 		reg = <0x52>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-- 
2.11.0
