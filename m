Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vM9Hd5TPhzDqBW
 for <openbmc@lists.ozlabs.org>; Mon, 13 Feb 2017 13:59:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="SyYq+EKa"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="LstTzlRh"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A72EC2083F;
 Sun, 12 Feb 2017 21:59:07 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Sun, 12 Feb 2017 21:59:07 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=lyH
 QwJpT3L91oXsYk/B+ANF+aCA=; b=SyYq+EKa6FImf3BluOpHNPSBXROB7ObhpCY
 e1UjwEtglIBcCrgUl8N0tiJYLEwsHbKColNGWEM2zXyG5mzC3XxC9tQwZFi3sA60
 2X5I6WTfSVfINKCUgLAO/AelBf1dLv5VWNAyxhnx70TcElmqLsJE0ShK0Pn6F+sK
 pIUzm8Qw=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=lyHQwJpT3L91oXsYk/B+ANF+aCA=; b=LstTz
 lRh5GvWwpLQykFFGGEkVyFVip6Sz9DfhaUVPUby6HKGCZ3zfAGXfPXBHP1Q4zNqK
 UQ5TBnbXp6abMTbPrlqiJf0U4kYYTOQaV5gldcrdMlDyT4KRqjEedCOIJaqSb8TS
 ZpsX587wB2pmox7kQJAsA/IvikpmMNNpLkKRYA=
X-ME-Sender: <xms:-yChWPpbL82wYQiOti1YfKc548xUFj_ux0bENS__2cV9Pf48dVtPFg>
X-Sasl-enc: EwOfn3jRXh6qEe2GSzjJEfq9WMpyPg/HUacuCviFMIZN 1486954746
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id AFB80241E9;
 Sun, 12 Feb 2017 21:59:05 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: [PATCH linux dev-4.7 1/3] ARM: dts: aspeed-g5: Add SoC Display
 Controller node
Date: Mon, 13 Feb 2017 13:28:49 +1030
Message-Id: <20170213025851.6051-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170213025851.6051-1-andrew@aj.id.au>
References: <20170213025851.6051-1-andrew@aj.id.au>
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
X-List-Received-Date: Mon, 13 Feb 2017 02:59:10 -0000

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Joel Stanley <joel@jms.id.au>
(cherry picked from commit daf042580a0dacd894a3825dd6f048364fd66770)
---
 arch/arm/boot/dts/aspeed-g5.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index e1994c9e38c3..5ce0a7a65e77 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -1005,6 +1005,12 @@
 				reg = <0x1e6e202c 0x4>;
 			};
 
+			gfx: display@1e6e6000 {
+				compatible = "aspeed,ast2500-gfx", "syscon";
+				reg = <0x1e6e6000 0x1000>;
+				reg-io-width = <4>;
+			};
+
 			sram@1e720000 {
 				compatible = "mmio-sram";
 				reg = <0x1e720000 0x9000>;	// 36K
-- 
2.9.3
