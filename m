Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tDlxt1wPdzDvh4
 for <openbmc@lists.ozlabs.org>; Thu, 10 Nov 2016 12:36:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="dphPC67G"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="oblMV0DT"; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id A66A32032C;
 Wed,  9 Nov 2016 20:36:15 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute7.internal (MEProxy); Wed, 09 Nov 2016 20:36:15 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=R4m
 BJm1yV8/CjkUNnBf4ISF7Bwc=; b=dphPC67GqD7ndeyucc5p5PUsoG4hDXvMeVn
 haceN5TIIIrxL62W23uwIXIj3lQY7lnn1GlxeUzjGYYdgdEPK436RuAod3tdSO72
 vDykVdKexrtYfgww5/fWXSjwrHXDMmhtFxupEndgWvZUcFwPnBp+oi2UIaLHGKog
 9Ie0CUec=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=R4mBJm1yV8/CjkUNnBf4ISF7Bwc=; b=oblMV
 0DTg7cSYkckEZSv9I+OUMez/hyX+8rp5tdsBLocJc31Q6KeUK3NjvqOwiI3zA4KX
 p/GE40cXpzW6j9ipGoiOuHo5tElOXsM74JYdSarZbLp5MGeLtw9fSixJ2bkK+rb7
 QuiDNSsdjutpp86m29QzQWyiLaUY52+BskiQrQ=
X-ME-Sender: <xms:D88jWHum8Q-bs5dpAy9A6nrNRW1W2G36fXKrBn8UzSR9MD6lKQcLRw>
X-Sasl-enc: ZDpzCaHblFhDgJnEITfxi7bhaTF6YSvjtpoV87BcFzqf 1478741774
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id DFC50F29CD;
 Wed,  9 Nov 2016 20:36:13 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC <openbmc@lists.ozlabs.org>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-4.7 4/4] arm: aspeed: dt: Add LPC Host Interface
 Controller nodes
Date: Thu, 10 Nov 2016 12:05:56 +1030
Message-Id: <20161110013556.8542-5-andrew@aj.id.au>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20161110013556.8542-1-andrew@aj.id.au>
References: <20161110013556.8542-1-andrew@aj.id.au>
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
X-List-Received-Date: Thu, 10 Nov 2016 01:36:18 -0000

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-g4.dtsi | 5 +++++
 arch/arm/boot/dts/aspeed-g5.dtsi | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index 1ee9e87aa5b2..85669dc64433 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -857,6 +857,11 @@
 				clocks = <&clk_apb>;
 			};
 
+			hic: hic@1e789080 {
+				compatible = "aspeed,ast2400-hic";
+				reg = <0x1e789080 0x20>;
+			};
+
 			scrsio: scrsio@1e789170 {
 				compatible = "aspeed,ast2400-scrsio";
 				reg = <0x1e789170 0x10>;
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 505f4878d9af..2aed7492788d 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -991,6 +991,11 @@
 				clocks = <&clk_apb>;
 			};
 
+			hic: hic@1e789080 {
+				compatible = "aspeed,ast2500-hic";
+				reg = <0x1e789080 0x10>;
+			};
+
 			scrsio: scrsio@1e789170 {
 				compatible = "aspeed,ast2500-scrsio";
 				reg = <0x1e789170 0x10>;
-- 
2.9.3
