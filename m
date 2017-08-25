Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xdsMK2j9BzDrLH
 for <openbmc@lists.ozlabs.org>; Fri, 25 Aug 2017 16:53:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="C9x1+knE"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="lzuuE4B6"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 2AF5920CC7;
 Fri, 25 Aug 2017 02:53:47 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Fri, 25 Aug 2017 02:53:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=TiXwP3
 xTJNPCtig9vXwgkKEFvDp6GvkYuk6c4QX/BQI=; b=C9x1+knEjRyVFqZauEZ+wV
 wn5216LDc67YPoXaoqGj/GeQhd6+KzmSIkSGvK5TTeQ5JAqaPH/cOIyE8o+E7IBx
 l/UW+DVvHIQyz/LjuMzTe1KYbmH8AbD6tScUr3G0QO327qyg8pn9nkGjsv3NCat/
 VDXkBVD26d85ogSx5K6wf9ATXFuvWPTVPPa3Fld1xwqqh80UT+J5uWJ4IjoJm8j3
 TLpi8tr8oJQxxMwbRFHRpfjnUIiS4pdoPxPJdExqR4eG4V9rMynkKctVBnrlyxsa
 5l3gmQ59w3gQ22RW85HdYBna3ulOXZGPDum7Q7DpZEcc0iffPr1lAxxaAiujb05g
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=TiXwP3xTJNPCtig9vXwgkKEFvDp6GvkYuk6c4QX/B
 QI=; b=lzuuE4B6HFHyU9qmwsew7BkhXbmiMDdV09twrTRA4RuoKGPaVg2dpu1P2
 XW9LO7CHil/SkYz8NHjda3aASG0KcPv1LMkzUb3rKE+dQC0z44mca6mV6fc/f+ko
 LwfC/TiZ30s7OxlKGdUtxUtgbEgteGMWtSJgjyhzMKmBY+gN0firisGaZ3a/IWmp
 fA6IOLCsezA3BcopkbvL7zyyrONnAwZv165bPrvaHLdbo2gflLYe5we2UbCOQQMN
 I6jqmTSm3ehWCipsnXTuhvAe+r/apYAa/H/vs0CDWJnZU10WaMIvcPvY27xUrJ97
 YLJ0pxRd7W/SQKPXpXfGjPknOc0lg==
X-ME-Sender: <xms:e8mfWc6TE0AttW1Q-u1QPSPuIxoTMbf8b0o3Wz4gg6XLSkoZ_9wivw>
X-Sasl-enc: sQpPZoxAIejFfpQbRPtC/6hEEpM/t9NiTTBYsQSeocUs 1503644026
Received: from keelia.aj.id.au (ppp118-210-176-216.bras2.adl6.internode.on.net
 [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id 164542418B;
 Fri, 25 Aug 2017 02:53:43 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>, clg@kaod.org, vishwa@linux.vnet.ibm.com,
 bjwyman@gmail.com, geissonator@gmail.com, eajames@linux.vnet.ibm.com,
 openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 5/5] aspeed: witherspoon: leds: Retain state
 across BMC resets
Date: Fri, 25 Aug 2017 16:22:44 +0930
Message-Id: <20170825065244.488-6-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170825065244.488-1-andrew@aj.id.au>
References: <20170825065244.488-1-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 25 Aug 2017 06:53:49 -0000

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index 81996f070818..68058eca1559 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -91,36 +91,43 @@
 		compatible = "gpio-leds";
 
 		fan0 {
+			retain-state-shutdown;
 			default-state = "keep";
 			gpios = <&pca0 0 GPIO_ACTIVE_LOW>;
 		};
 
 		fan1 {
+			retain-state-shutdown;
 			default-state = "keep";
 			gpios = <&pca0 1 GPIO_ACTIVE_LOW>;
 		};
 
 		fan2 {
+			retain-state-shutdown;
 			default-state = "keep";
 			gpios = <&pca0 2 GPIO_ACTIVE_LOW>;
 		};
 
 		fan3 {
+			retain-state-shutdown;
 			default-state = "keep";
 			gpios = <&pca0 3 GPIO_ACTIVE_LOW>;
 		};
 
 		front-fault {
+			retain-state-shutdown;
 			default-state = "keep";
 			gpios = <&pca0 13 GPIO_ACTIVE_LOW>;
 		};
 
 		front-power {
+			retain-state-shutdown;
 			default-state = "keep";
 			gpios = <&pca0 14 GPIO_ACTIVE_LOW>;
 		};
 
 		front-id {
+			retain-state-shutdown;
 			default-state = "keep";
 			gpios = <&pca0 15 GPIO_ACTIVE_LOW>;
 		};
-- 
2.11.0
