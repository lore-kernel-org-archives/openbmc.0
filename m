Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wfHSR1N49zDqN6
 for <openbmc@lists.ozlabs.org>; Fri,  2 Jun 2017 18:29:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="pHuScSAE"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Uy6Hmnss"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 7AA5720AE5;
 Fri,  2 Jun 2017 04:29:24 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Fri, 02 Jun 2017 04:29:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=GJH2eU
 sDG7x9+EoCceQO79UrD5SCiuq8NrWo5IiKje8=; b=pHuScSAER14yRL/OdVeK0f
 bKRy2vvCeAE29xV5BegMvd2svISQr481fwqc6vRGm4+XJRWGiEPs/1nBVtHlKfJY
 kZkQCvi6eulkh65sbJd+NEU847pUCKddyMo4uzuFjCFmvdNx0g5/pyWuuXZ50fLN
 iYgMBF+hmg8BBOXsjIA5gUb+Y+vJs3XjwD+tg/+PktB6W80q1GHywA1gyAdEsrD2
 jbFz8jrDc3btp4KWgXf5J/N5v9XGBLsnqN16xjyiXzy+oNCuPhaOzAiOrduWOzHv
 NZj8KNCS9J1UwEoQnOfOJP50nKHK4orT88wVHEOQiATftPiPP9ysVkc76AT8U2EA
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=GJH2eUsDG7x9+EoCceQO79UrD5SCiuq8NrWo5IiKj
 e8=; b=Uy6HmnsspllKImP5Cp50y92K10NNGk9YpC/rC1LTD39sXaaZ08iAHlw4f
 yZbuUUhaxe+xc93cF1uuTxr9ppcHWeghp71diO191A/jwjoynvwxnOPBFm6degsI
 BLMfnC3l46NuwtpGqxECRPA09PLtuz4P+8XHAkpjkx/4MEv8FpGJhsNS6ez1n7+X
 BvDacYA6NQr0RNVKM2gPv6EhiamNdjKFoB077+tnPck494tr4AHFBwObqpzcAYwr
 4rs0vFWuKaCp9nfgoiMDPgYrgHKGZFYZo2pV38Thp2/0tOUghNihyYZL0mvcwvVu
 BNLQiWCwU0fmTwZk2tLqYOL4twVMw==
X-ME-Sender: <xms:5CExWQYgsefukse0Rj1_VKi4nTJCjXzrIF9PE5V6xpvaUqqkkB1ICQ>
X-Sasl-enc: I3rrwtQHyZqPP2c5zN+V+uDhSPUobdtXQypecvwJNVjg 1496392163
Received: from keelia.base64.com.au (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 65DF47E7C6;
 Fri,  2 Jun 2017 04:29:22 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>, anoo@linux.vnet.ibm.com,
 openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 3/3] arm: aspeed: Configure mbox and lpc nodes
 on Palmetto
Date: Fri,  2 Jun 2017 17:58:44 +0930
Message-Id: <20170602082844.7370-4-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170602082844.7370-1-andrew@aj.id.au>
References: <20170602082844.7370-1-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 02 Jun 2017 08:29:27 -0000

Assign 16MB of reserved memory for mboxd to make use of via the
aspeed-lpc-ctrl device.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
index 60792f6ff7ec..8ebed01e7725 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
@@ -29,6 +29,11 @@
 			no-map;
 			reg = <0x5f000000 0x01000000>; /* 16MB */
 		};
+
+		flash_memory: region@98000000 {
+			no-map;
+			reg = <0x98000000 0x01000000>; /* 16MB */
+		};
 	};
 
         leds {
@@ -309,3 +314,13 @@
 &vuart {
 	status = "okay";
 };
+
+&lpc_ctrl {
+	status = "okay";
+	memory-region = <&flash_memory>;
+	flash = <&spi>;
+};
+
+&mbox {
+	status = "okay";
+};
-- 
2.11.0
