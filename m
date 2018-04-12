Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="RzotxkxP"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="B5FdymRy"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40M6Zc5rH3zF1RW
 for <openbmc@lists.ozlabs.org>; Thu, 12 Apr 2018 13:58:16 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 630DC218E9;
 Wed, 11 Apr 2018 23:52:32 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 11 Apr 2018 23:52:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=uZTs07PzKhUF7x8qt
 5oesZvgrwTazBajwdCiY9RnbS8=; b=RzotxkxPNBSKIKLdk870o0dEOQzVHISv8
 uGB0OyX5iJQw21OkiEzkgJrxnrXkd8Cy7pjUoG+3e+0KEsmEtudVrsXnwuTKuCR/
 xOYnMm55jqllci0k4cBqptE2blyb15HHV6D6Q1U4AA4jbNf4YDiio6c7vR0g6kPl
 3oQJBWoNnGS5WkTTOJPNuEdM3xcQoUaJM7TVh1FVHZtizd2m4sso/aV5X6nKiyLj
 6J6AQ5sQ7mzxw0Q/a6dCdjhO0IgZaIhCmDwTtVgpNhqgjEx9ygCRxqZX9T8LCvm3
 aEbmNvBjWIkYDsfKkmCBOeMV9RWbHxSonua0IAsSOcAElEuQ3bNEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=uZTs07PzKhUF7x8qt5oesZvgrwTazBajwdCiY9RnbS8=; b=B5FdymRy
 q1jaqnjTvDAsXtVjcUfQogBLPRS66N2VkktI/+DmjVia4KgPZFqf6lTeW0SrbCbn
 5LbNGdpXRYsY1nO/DxP+DccGfFAnAKCHf52Xmi5RlrxFY+K4UWcj8JKoW5zfvjhJ
 MKuK/VBQxlGxqYKqJS16gJvOkOSgIpUYQ93SJ/0tfCVeJj4RgIcikZbdTmmjPfXf
 sJHPSEznAYMahAN21y9lT3pCS2VBGb6X9usXp/SPR1m85aKIxdBkuGY348uC8Y9J
 3j+BrlE64v7ScXO0SOABGGgN7seP9i2R3kgaJYbSY2Te3KV1XLtfnvFuTQaqLI5m
 FMCP8tGS0M3ssw==
X-ME-Sender: <xms:ANjOWhxyp9yTMfAPwQ8WqkQzFD8LHzCGPnHuhu73Whc9Z_Iv0mI-oQ>
Received: from dave.base64.com.au (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id D8E981027B;
 Wed, 11 Apr 2018 23:52:29 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Cc: Andrew Jeffery <andrew@aj.id.au>, joel@jms.id.au, jk@ozlabs.org,
 benh@kernel.crashing.org
Subject: [RFC PATCH linux dev-4.13 2/3] dts: aspeed-g5: Expose VGA scratch
 registers
Date: Thu, 12 Apr 2018 13:21:44 +0930
Message-Id: <20180412035145.21488-3-andrew@aj.id.au>
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
 arch/arm/boot/dts/aspeed-g5.dtsi | 48 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 1468b4ad22dc..8321df50c593 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -158,6 +158,11 @@
 
 				};
 
+				vga_scratch: scratch@50 {
+					compatible = "aspeed,bmc-misc";
+					reg = <0x50 0x20>;
+				};
+
 				hwrng@78 {
 					compatible = "timeriomem_rng";
 					reg = <0x78 0x4>;
@@ -1425,3 +1430,46 @@
 		groups = "WDTRST2";
 	};
 };
+
+&vga_scratch {
+	vga0 {
+		offset = <0x50>;
+		bit-mask = <0xffffffff>;
+		bit-shift = <0>;
+	};
+	vga1 {
+		offset = <0x54>;
+		bit-mask = <0xffffffff>;
+		bit-shift = <0>;
+	};
+	vga2 {
+		offset = <0x58>;
+		bit-mask = <0xffffffff>;
+		bit-shift = <0>;
+	};
+	vga3 {
+		offset = <0x5c>;
+		bit-mask = <0xffffffff>;
+		bit-shift = <0>;
+	};
+	vga4 {
+		offset = <0x60>;
+		bit-mask = <0xffffffff>;
+		bit-shift = <0>;
+	};
+	vga5 {
+		offset = <0x64>;
+		bit-mask = <0xffffffff>;
+		bit-shift = <0>;
+	};
+	vga6 {
+		offset = <0x68>;
+		bit-mask = <0xffffffff>;
+		bit-shift = <0>;
+	};
+	vga7 {
+		offset = <0x6c>;
+		bit-mask = <0xffffffff>;
+		bit-shift = <0>;
+	};
+};
-- 
2.14.1
