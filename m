Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="najrWVdt"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="AR9UWUcg"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yWLhf2VRxzDrK9
 for <openbmc@lists.ozlabs.org>; Tue,  7 Nov 2017 18:31:29 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0E7EC20A33;
 Tue,  7 Nov 2017 02:31:27 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Tue, 07 Nov 2017 02:31:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=iX8Em5Sl85XfRjsrf
 vNw6Ki3d9wesVQMO32NVznP1us=; b=najrWVdtB8gpLMWGuAgl2Z3MEJcernCYw
 /Te0ZHAbzsJ/7VJczDiVeRo29NOF6I4uPyKSzAL3+ppvDeM8O9D2U1bx/FwwL4Q4
 0xHBEe/JOGqJgMInuwxvApny4zbCjTYvA9IXPiQI3vWE8Ro+5r2uS5WT3ynT4yVZ
 +rYllzD24ph49SGvWHvnr4wc+m9ddLX+mI6TH/Nsyj0SlLK3khTJ1CUB1aPVspMb
 X0bSdkdF2o7FyzbfBogGWghNIAjneRUUZLkR5tPCUaQywkO4ACAAxAncCv49EuM2
 TKsIiKd/SGk/PkkQ6aXcntJtK0FvH/rooBfNIhObRfdXMxia0az8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=iX8Em5Sl85XfRjsrfvNw6Ki3d9wesVQMO32NVznP1us=; b=AR9UWUcg
 QFN80cyz3fChpcwVb/52QH5wpXEeTSkTCfcRVdF/GvUaqMdhQzWyeiD7k6eO4Ll2
 8eCpNA2r8s3LQa4aZFLVXeu5BwQZ0YwgunWrfRYUSSo4eqJlrvkaW37j6lJg5Nv7
 o72gwkKNKplb7G/AmEYKc1TioA4StxzOAsBlAIA8QXhmzpheOPX4RNLTdftH9i9G
 WFolyDe56nTFV2beqruwHvbmtNmgShbZ0aG/bEIeQwu24cDbMJ0HUtBgTOBFKU4p
 UY9sR8t4rqWeL3PVnpuvyAOgk2Rf5YFWq30PbQst3f4c41i6kTOwOfXjBUQxOsEY
 XlNkKCpHRvGuXA==
X-ME-Sender: <xms:TmEBWim8yBc-7GvU2uoJzD5SyAmKpsiRp_qOWNHW5Q0emVrUb9b7Vw>
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4F8DC24108;
 Tue,  7 Nov 2017 02:31:24 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13 01/23] ARM: aspeed: g4: Add LPC devicetree node
 and children
Date: Tue,  7 Nov 2017 18:00:24 +1030
Message-Id: <20171107073046.13319-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20171107073046.13319-1-andrew@aj.id.au>
References: <20171107073046.13319-1-andrew@aj.id.au>
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
X-List-Received-Date: Tue, 07 Nov 2017 07:31:32 -0000
X-List-Received-Date: Tue, 07 Nov 2017 07:31:32 -0000
X-List-Received-Date: Tue, 07 Nov 2017 07:31:32 -0000

This is enablement for mbox protocol support on P8. Expose
/dev/aspeed-lpc-ctrl and /dev/aspeed-mbox for use by mboxd.

OpenBMC-Staging-Count: 1
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-g4.dtsi | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index 60ab04aa75ea..c27a8671b597 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -77,6 +77,44 @@
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
