Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wfHSN4YpQzDqLt
 for <openbmc@lists.ozlabs.org>; Fri,  2 Jun 2017 18:29:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="muxUq3AO"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="erU79OPl"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D4F5C20ACB;
 Fri,  2 Jun 2017 04:29:21 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Fri, 02 Jun 2017 04:29:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=e6LCM5
 NyUcy00F8aLQfU7bk9MTbsN06y9tWSQIgRBIc=; b=muxUq3AOalD1Oad4BmOPsz
 YLxob5TsHMls8TsHoS0LqmNx2131xeVlGl0eRc/bDcPexMlonOmDorfo3hdtYuFg
 jjkwgs3gtXvjt4fNcCIU/Axlwv5BAvmhMejeWh18X4laf4Ksh+z6fnTilNDRUQKm
 o6LFWYy00/5VSH2DfQNfn8GE/L07Yd7YU3QzZnaZ2WwxqnjMS7LlN1D+KsJyncZH
 x0nP8k2P48u5vieSlc4JkpfAyMZeFdfGnyqOUZiBg2zKLYyJiMFuaHqFurtta8uL
 DcUGYakw6eR4XCTbPTaOg/HjeRZ1k2ebqIDwa/QimjwLFiIue5Qz1qWIhKqG/+4Q
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=e6LCM5NyUcy00F8aLQfU7bk9MTbsN06y9tWSQIgRB
 Ic=; b=erU79OPl6hfsa2VVAmD8x3C6UPPa01gtr/jIav+GdAGycek71JltdfxRt
 1oJRAvU+zqSE4lAysWlPKlECBtZlXzdgdq2hdc2+dNLd4cLQ2V7vHrCYvaBJfTzq
 KfPHDyLUuQvoVuRHHhef/4hYFhUGX1CJfP5XPLopH/mN1fbF/0L/JF1arP42soxq
 uIhb4B1/G8aRp8wbIzBB9myny+O0xvUOHKesxZQc2CWYrsK66EG78wePa2HHoXc+
 DpHlx/3MCx+3z0WpQ9ElnGzDsqpBWmdz+zCUAexYRUh+5YMLSewFN1nGRrPzJ8Bm
 hTiyVOkMbNf0AIuj3raB60lhOiA1g==
X-ME-Sender: <xms:4SExWWcys9O5uTS_8oQg41pnCvoVJyzZmBQ82FPR03F3Gh6tObv7CA>
X-Sasl-enc: r9JkukZUe3hbps18sGM4bOu8H+3So5pRbEeqN7x5z3Ff 1496392160
Received: from keelia.base64.com.au (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id B44FA7E7AA;
 Fri,  2 Jun 2017 04:29:19 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>, anoo@linux.vnet.ibm.com,
 openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 2/3] arm: aspeed: Add LPC devicetree node and
 children
Date: Fri,  2 Jun 2017 17:58:43 +0930
Message-Id: <20170602082844.7370-3-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 02 Jun 2017 08:29:25 -0000

This is enablement for mbox protocol support on P8. Expose
/dev/aspeed-lpc-ctrl and /dev/aspeed-mbox for use by mboxd.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-g4.dtsi | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index 9b0291061925..a998a00a2728 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -78,6 +78,44 @@
 			};
 		};
 
+		lpc: lpc@1e789000 {
+			compatible = "aspeed,ast2400-lpc", "simple-mfd";
+			reg = <0x1e789000 0x1000>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x1e789000 0x1000>;
+
+			lpc_bmc: lpc-bmc@0 {
+				compatible = "aspeed,ast2400-lpc-bmc";
+				reg = <0x0 0x80>;
+			};
+
+			lpc_host: lpc-host@80 {
+				compatible = "aspeed,ast2400-lpc-host", "simple-mfd", "syscon";
+				reg = <0x80 0x1e0>;
+				reg-io-width = <4>;
+
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0x0 0x80 0x1e0>;
+
+				lpc_ctrl: lpc-ctrl@0 {
+					compatible = "aspeed,ast2400-lpc-ctrl";
+					reg = <0x0 0x80>;
+					status = "disabled";
+				};
+
+				mbox: mbox@180 {
+					compatible = "aspeed,ast2400-mbox";
+					reg = <0x180 0x5c>;
+					interrupts = <46>;
+					#mbox-cells = <1>;
+					status = "disabled";
+				};
+			};
+		};
+
 		vic: interrupt-controller@1e6c0080 {
 			compatible = "aspeed,ast2400-vic";
 			interrupt-controller;
-- 
2.11.0
