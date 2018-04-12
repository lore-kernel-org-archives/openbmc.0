Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="JhE5zjmx"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="CLVgmXuT"; dkim-atps=neutral
X-Greylist: delayed 344 seconds by postgrey-1.36 at bilbo;
 Thu, 12 Apr 2018 13:58:16 AEST
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40M6Zc3BPxzF1RV
 for <openbmc@lists.ozlabs.org>; Thu, 12 Apr 2018 13:58:16 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4D086218AF;
 Wed, 11 Apr 2018 23:52:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 11 Apr 2018 23:52:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=iImhjXV41K4RYBPn9
 Ihkda/XkHDf6RQFlX92ks76Oxc=; b=JhE5zjmxeZ6clbPYiGkFfl6PcmmMz07sR
 dz2rX/suMNppmlQdmtVXCmsnhUxkGt1fYB3O/L2UduvVhR+hZa2OpEBJCfAnA1eJ
 0B8ir18Itc9Goo/icZVKWW7pMsy7jiD9Rgp3ABRI+zDtYEA77OAEdkd+CD56VLKc
 GRxnihIjAiVUi+bqL7mTRiuIdkvoj/LxfRjaTsL8m+bRjjiFxOqHZDOEYdDoJyWy
 xEzuxoJhOz3LihZtKQCPRUF3Fxt8onH2/kxh4oD4FpMkEBjLRo5B3XGv5jwISAUk
 YJQWVBk+9E/3zM8AySjnPXzY5da69jIWTPjWvyvMXd5BonWBM8htg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=iImhjXV41K4RYBPn9Ihkda/XkHDf6RQFlX92ks76Oxc=; b=CLVgmXuT
 AWu2tA7BJSNCPsIh9k+dT7pJjEt5p4nn40e+EWMlAuhJ9DkxG0x6r9L8ul8vQvvI
 IesnKSga8W59E4FQY/ITWVKnrSvHmueATkl1y84WyNoz7ZFLVe4vmnug2fcOvDu2
 FA4FyiqMh6DVN8zKy1BBqJ3lBV4TjF1PEsfQvUuSNeVGAYqJqZhrphSnkSqoaRQt
 o2qGMaQuokmwhQcA4d4q9AzQ4aDz88H9DxDZOLb6RqbboqnDqjQl09yEX+xqac1x
 LeaaXbo/knNnmh20/tgWEyH0XODDosvzE9PggfMzo1aPMZhu16R2ez4YneXFm4K8
 PMC2V7gNPqbMQQ==
X-ME-Sender: <xms:A9jOWuFXCm_2sc0r5zBL64orlL0DMDFYiZyEiFlp3fua9kN6LI1c3Q>
Received: from dave.base64.com.au (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id B4B161027B;
 Wed, 11 Apr 2018 23:52:32 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Cc: Andrew Jeffery <andrew@aj.id.au>, joel@jms.id.au, jk@ozlabs.org,
 benh@kernel.crashing.org
Subject: [RFC PATCH linux dev-4.13 3/3] dts: aspeed-g5: Expose SuperIO scratch
 registers
Date: Thu, 12 Apr 2018 13:21:45 +0930
Message-Id: <20180412035145.21488-4-andrew@aj.id.au>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180412035145.21488-1-andrew@aj.id.au>
References: <20180412035145.21488-1-andrew@aj.id.au>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Apr 2018 03:58:19 -0000

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-g5.dtsi | 88 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 8321df50c593..25a88dd44d91 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -325,6 +325,11 @@
 						status = "disabled";
 					};
 
+					sio_scratch: scratch@f0 {
+						compatible = "aspeed,bmc-misc";
+						reg = <0xf0 0x10>;
+					};
+
 					mbox: mbox@180 {
 						compatible = "aspeed,ast2500-mbox";
 						reg = <0x180 0x5c>;
@@ -1473,3 +1478,86 @@
 		bit-shift = <0>;
 	};
 };
+
+&sio_scratch {
+	siorx_2b {
+		offset = <0xf0>;
+		bit-mask = <0xff>;
+		bit-shift = <24>;
+	};
+	siorx_2a {
+		offset = <0xf0>;
+		bit-mask = <0xff>;
+		bit-shift = <16>;
+	};
+	siorx_29 {
+		offset = <0xf0>;
+		bit-mask = <0xff>;
+		bit-shift = <8>;
+	};
+	siorx_28 {
+		offset = <0xf0>;
+		bit-mask = <0xff>;
+		bit-shift = <0>;
+	};
+	siorx_2f {
+		offset = <0xf4>;
+		bit-mask = <0xff>;
+		bit-shift = <24>;
+	};
+	siorx_2e {
+		offset = <0xf4>;
+		bit-mask = <0xff>;
+		bit-shift = <16>;
+	};
+	siorx_2d {
+		offset = <0xf4>;
+		bit-mask = <0xff>;
+		bit-shift = <8>;
+	};
+	siorx_2c {
+		offset = <0xf4>;
+		bit-mask = <0xff>;
+		bit-shift = <0>;
+	};
+	siorx_23 {
+		offset = <0xf8>;
+		bit-mask = <0xff>;
+		bit-shift = <24>;
+	};
+	siorx_22 {
+		offset = <0xf8>;
+		bit-mask = <0xff>;
+		bit-shift = <16>;
+	};
+	siorx_21 {
+		offset = <0xf8>;
+		bit-mask = <0xff>;
+		bit-shift = <8>;
+	};
+	siorx_20 {
+		offset = <0xf8>;
+		bit-mask = <0xff>;
+		bit-shift = <0>;
+	};
+	siorx_27 {
+		offset = <0xfc>;
+		bit-mask = <0xff>;
+		bit-shift = <24>;
+	};
+	siorx_26 {
+		offset = <0xfc>;
+		bit-mask = <0xff>;
+		bit-shift = <16>;
+	};
+	siorx_25 {
+		offset = <0xfc>;
+		bit-mask = <0xff>;
+		bit-shift = <8>;
+	};
+	siorx_24 {
+		offset = <0xfc>;
+		bit-mask = <0xff>;
+		bit-shift = <0>;
+	};
+};
-- 
2.14.1
