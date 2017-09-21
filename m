Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="RS+R5AZM"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ISlLMG3y"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xyQZl0CsbzDqZv
 for <openbmc@lists.ozlabs.org>; Thu, 21 Sep 2017 15:46:06 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 36A5B20D66;
 Thu, 21 Sep 2017 01:46:04 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 21 Sep 2017 01:46:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc:x-sasl-enc; s=fm1; bh=npFgE77660AiEaGzyytjsSsXWXotXJ
 GEaQv/Ennyyu8=; b=RS+R5AZMvLKFITO/d7DP9Q7jMpZW0xEUN/ukiOKTy/iVkA
 KX6SM3whMDkSe/neJBn8XidHIaMctA2pMOxknjej5gF5xe3VRuV4qblq5moMQmtG
 KQignpFzvZ6iXfgyTkEVPGB/WwoO7eDYZmbiSmNYliiybgN0iC1L9/jaUVvFyoPT
 bkdSXNzynL/3TPcfn/RwYXS2KZxxBKGWl9/wl9HM1vn5I+a2hSwhlgLRAiUQT4rU
 dU6vKAQ9yv17fER54sE5y0JACE+bYtZSyhRQMmS/mlruHJy4iSZhCM8L3jyVAXpz
 ePIUm3ZwjdB/wrfF55T7yUxHpWKmP2sEGI+Mb5/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=npFgE7
 7660AiEaGzyytjsSsXWXotXJGEaQv/Ennyyu8=; b=ISlLMG3y3AItd9N9x0xewz
 WZzSMgPTAaPLBRTFxY6j2aqtZoAANUUSuCHYQAsEFHiOUQK70NVC7V/8eRytE+tl
 quezHuav+wePT3zscW0J+EWMGhPbrCdPn9fdOMMjuGqs6/5I/UqReGkb4qhLBD3u
 JqHyRP7ZzVWNqo6yfCqkZ8nxpCKqUdZKmO2PGCYfiWV8relnNuxqvGXL2l/vRtcE
 MqLkOGaEpGay5Qh9hkB9nd90yzvT/wRA7sDt4+bjwSeBqRPSKSUgEvWgglaIJv6m
 noVw1Rss2+h+OI1v8pL+8nSUMkeK/owJu9uDwe+zoi0YNKHZ4zT5xU/soWHOCrPg
 ==
X-ME-Sender: <xms:HFLDWfyMDWkVONprRayriv-zGLnDEZTMKTMazilphgub7PC_ONZBJQ>
X-Sasl-enc: YH5iUpRTlEm+aKFNFKg8ieYtTX6A8Ma71voOAkL8wVM9 1505972763
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4278C7E16A;
 Thu, 21 Sep 2017 01:46:02 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Cc: Andrew Jeffery <andrew@aj.id.au>,
	joel@jms.id.au
Subject: [PATCH] ARM: aspeed: dts: Request mux as per strapping configuration
Date: Thu, 21 Sep 2017 15:15:54 +0930
Message-Id: <20170921054554.6169-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Sep 2017 05:46:08 -0000

Prevents the error:

[    5.750000] aspeed-smc 1e630000.spi: Error applying setting, reverse things back

The pinmux driver is only capable of modifying selected strapping bits
that make sense to change at runtime. The SPI strapping is not
currently defined modifiable, so "request" the mux as per how the board
is physically strapped.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
index ee3a1c0fd5f6..ab3fee64f87d 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
@@ -72,7 +72,7 @@
 &spi {
 	status = "okay";
 	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_spi1_default>;
+	pinctrl-0 = <&pinctrl_spi1debug_default>;
 
 	flash@0 {
 		status = "okay";
-- 
2.11.0
