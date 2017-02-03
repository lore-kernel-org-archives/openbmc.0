Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vF3b02DKrzDqCt
 for <openbmc@lists.ozlabs.org>; Fri,  3 Feb 2017 15:21:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="TZmCguTv"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="UZNlmhVS"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3A38520A72;
 Thu,  2 Feb 2017 23:21:14 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 02 Feb 2017 23:21:14 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=4GB
 9Ob9pJrw79FQFPBZHtNi4GhE=; b=TZmCguTvfcA0krCYFHlSgKGO9YgBlKD/Ijg
 Cxl9dGB55pEI/ccyikCPISeYTOk3/DS6DuLnD3KyeOChVOdw1VfiqOpIGs9Cmq85
 bMhp2FUwnjcFh8Qs1hGfUQiu1zfYw8mDcgkLBaP3htEPGJwh4pdeb4Z/8dlwJZgs
 p+474XKg=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=4GB9Ob9pJrw79FQFPBZHtNi4GhE=; b=UZNlm
 hVSOeCchH0nuBrgUH3nWysbIhSqVt6EtWgN2lyqUxE8h8MF8kyShjA8bpwd+fyTg
 elkBG06iqrcJ4pvVbL/b5URsEBS5C4ISo8DvpY9xTd/inClPLho6RPL2yoVzWRky
 TvzC8bgS6hso1n+7CDGOwl7wvaAB0NXQjo9xz0=
X-ME-Sender: <xms:OgWUWA3SSvH06AZpMtCayeLfyAvbFOgBSWWmLydkn4G1lGmBXjy4VQ>
X-Sasl-enc: ye9AjTHbxeOdnzs4feqTtu0K3HZN+emdzBU3me8eNhfI 1486095673
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id D3B9D24066;
 Thu,  2 Feb 2017 23:21:11 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 Christopher Bostic <cbostic@linux.vnet.ibm.com>
Subject: [PATCH linux dev-4.7 07/14] aspeed: g5: dt: Update GPIO pin range to
 mux banks Y, Z, AA, AB, AC
Date: Fri,  3 Feb 2017 14:50:06 +1030
Message-Id: <20170203042013.2719-8-andrew@aj.id.au>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170203042013.2719-1-andrew@aj.id.au>
References: <20170203042013.2719-1-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 03 Feb 2017 04:21:16 -0000

The Aspeed GPIO driver recently gained support for exporting banks Y,
Z, AA, AB and AC. Update the devicetree so GPIO requests for these pins
are routed via pinmux, else the export succeeds but the GPIOs are
non-functional.

Applied from: https://patchwork.kernel.org/patch/9531795/

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-g5.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 14e03d8d35dc..e1994c9e38c3 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -1017,7 +1017,7 @@
 				reg = <0x1e780000 0x1000>;
 				interrupts = <20>;
 				interrupt-controller;
-				gpio-ranges = <&pinctrl 0 0 220>;
+				gpio-ranges = <&pinctrl 0 0 232>;
 			};
 
 			timer: timer@1e782000 {
-- 
2.9.3
