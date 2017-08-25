Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xdsMF6cKNzDrL5
 for <openbmc@lists.ozlabs.org>; Fri, 25 Aug 2017 16:53:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="orP6YaWF"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="CT6A4kUT"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A271920DE9;
 Fri, 25 Aug 2017 02:53:43 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Fri, 25 Aug 2017 02:53:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=dJGPMa
 fibcacdFnlKxFoDDiqQZjOPcK3jl/f7YBLQqc=; b=orP6YaWFjqKfZi4WL86D/S
 OWwYiYJu1kTpi/JVevnxqzrGJZYBNCLLOAb0xhmSLLPfFfUkqeF9S5LFVTniGHrv
 pSHCI7fEG4m7+SYX4DkKMQkEbcYtaUEq3uDSUS75qbmr+Ju//W1ocAojXP462RSc
 vi32F2rULHS/1IW9BRFSxidzU0ihG3esygeJK5zJiEDCmoVISfUDDL402/Cs5fzY
 6X9JgKpx1jKKMu8Tdu7MtpjcgcrYtEr6GAZ78y8xuMgcUa1AIro3mkE5cd2rWf4H
 m1N0RO/UR+zKOvsKfSdpLbOCdZRlIMHGefbNqMfdusj6Meqox7wQkMvbSPCv3H1A
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=dJGPMafibcacdFnlKxFoDDiqQZjOPcK3jl/f7YBLQ
 qc=; b=CT6A4kUTGlz+HJ9dJNTbOxxXDskpi4x8WCcoQK1roB59Z3i/8/inaloyD
 GfqriCh0SWz3YX0HjhUmLdZIHMihaLPfzNcZTPXAvh0095cCjQKa2LadSUYOdruJ
 MKzTY71CxKF9ofX0ECGy/4MuopkSR2qJv85x3tQCJ4e9ntt9GymuGZrmpLqzqLRW
 UfulA861vWhqsMh26XB+aV+pQ3UOfLIzO5rZjz7HhtepzTaF153CwAUMf7j+WCV1
 qrVT//3NtFX+Qcs/1u2VYnrVkkIHYmTDTKpXXTR1GjBx5booM0KRIRCaRJ/VafT/
 X5CCc3H3p+xxug6yq4L5NSHE4HIkQ==
X-ME-Sender: <xms:d8mfWVW-QbuxefhKSxBwIJTVG2AaYMwqKRups1xwxC2pYL6bpqYikQ>
X-Sasl-enc: w0DXJxJAOQ+N/FbexWKAgJIERGDuA2wOgeE7+5GGYl7l 1503644022
Received: from keelia.aj.id.au (ppp118-210-176-216.bras2.adl6.internode.on.net
 [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7B65F240B1;
 Fri, 25 Aug 2017 02:53:40 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>, clg@kaod.org, vishwa@linux.vnet.ibm.com,
 bjwyman@gmail.com, geissonator@gmail.com, eajames@linux.vnet.ibm.com,
 openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 4/5] aspeed: witherspoon: Tidy and unify LED
 nodes
Date: Fri, 25 Aug 2017 16:22:43 +0930
Message-Id: <20170825065244.488-5-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 25 Aug 2017 06:53:46 -0000

There's no reason for these to be separate, the gpios property defines
the controller needed for each LED. Also fix the node names so we can
drop the label property.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 25 ++++++++++--------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index dd30c20c9fb2..81996f070818 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -87,48 +87,43 @@
 		};
 	};
 
-	pca_leds {
+	leds {
 		compatible = "gpio-leds";
 
 		fan0 {
-			label = "fan0";
 			default-state = "keep";
 			gpios = <&pca0 0 GPIO_ACTIVE_LOW>;
 		};
+
 		fan1 {
-			label = "fan1";
 			default-state = "keep";
 			gpios = <&pca0 1 GPIO_ACTIVE_LOW>;
 		};
+
 		fan2 {
-			label = "fan2";
 			default-state = "keep";
 			gpios = <&pca0 2 GPIO_ACTIVE_LOW>;
 		};
+
 		fan3 {
-			label = "fan3";
 			default-state = "keep";
 			gpios = <&pca0 3 GPIO_ACTIVE_LOW>;
 		};
-		front_fault {
-			label = "front-fault";
+
+		front-fault {
 			default-state = "keep";
 			gpios = <&pca0 13 GPIO_ACTIVE_LOW>;
 		};
-		front_power {
-			label = "front-power";
+
+		front-power {
 			default-state = "keep";
 			gpios = <&pca0 14 GPIO_ACTIVE_LOW>;
 		};
-		front_id {
-			label = "front-id";
+
+		front-id {
 			default-state = "keep";
 			gpios = <&pca0 15 GPIO_ACTIVE_LOW>;
 		};
-	};
-
-	leds {
-		compatible = "gpio-leds";
 
 		rear-fault {
 			gpios = <&gpio ASPEED_GPIO(N, 2) GPIO_ACTIVE_LOW>;
-- 
2.11.0
