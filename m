Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vMkQ93D9TzDqBW
 for <openbmc@lists.ozlabs.org>; Tue, 14 Feb 2017 11:51:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="P+3sE0OH"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="OyFCCjHu"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 612D1209BB;
 Mon, 13 Feb 2017 19:51:43 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 13 Feb 2017 19:51:43 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=ske
 I5Vg2huQ5l3c6B4776gFud9k=; b=P+3sE0OHm8XjmBy80uGAFSMHXa34+QkB4aA
 ajCW6rnLziFlpDBdzBORjZZi6dofxw7nPyF2NCMc/4OFNhZ1MUkiVLzyj2ewbHa4
 pLi2D/j1ygRX4eTjk9/EqQInAMBBdn4OVe7rBN6lsuWSRDwO58sRpAclAEvRzC8A
 T66dtyxU=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=skeI5Vg2huQ5l3c6B4776gFud9k=; b=OyFCC
 jHuso6fg21DzTdU+sCAxRw6GJtkcHrcOFDZiBETySWhagTln/EaZRsoutUFiv978
 1FYx+ZYpXxZWxkLOAQh+pcVtjuEIykt0TBVjWF7PT0NasIr+a9vR+XfbTX1/4rQZ
 wsC78X8FFgadYGNGe4rZ0RjlsovLKJjjClUM+o=
X-ME-Sender: <xms:n1SiWAo1SvX0YVBE40okyHvqSCtVB582c1LsktGEBbWllmyLciyK0Q>
X-Sasl-enc: NWNIhcYxnU4FnePz/fZ2lsUfMCjw04Zb13zWX4JpND4O 1487033502
Received: from keelia.au.ibm.com (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id EC8D67E0F1;
 Mon, 13 Feb 2017 19:51:40 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: Patrick Williams <patrick@stwcx.xyz>, Rick Altherr <raltherr@google.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: [PATCH linux dev-4.7 v2 1/3] ARM: dts: aspeed-g5: Add SoC Display
 Controller node
Date: Tue, 14 Feb 2017 11:21:02 +1030
Message-Id: <20170214005104.11940-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170214005104.11940-1-andrew@aj.id.au>
References: <20170214005104.11940-1-andrew@aj.id.au>
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
X-List-Received-Date: Tue, 14 Feb 2017 00:51:46 -0000

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Joel Stanley <joel@jms.id.au>
(cherry picked from commit daf042580a0dacd894a3825dd6f048364fd66770)
[AJ: Reworked to disable GFX in the dtsi, as it is missing from the 2520]
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-ast2500-evb.dts         | 4 ++++
 arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts    | 4 ++++
 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts     | 4 ++++
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 4 ++++
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts       | 4 ++++
 arch/arm/boot/dts/aspeed-g5.dtsi                 | 9 +++++++++
 6 files changed, 29 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-ast2500-evb.dts b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
index 9d88f3aadbc6..1999a06eec80 100644
--- a/arch/arm/boot/dts/aspeed-ast2500-evb.dts
+++ b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
@@ -79,3 +79,7 @@
 		reg = <0x4d>;
 	};
 };
+
+&gfx {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
index e6d61c3abd80..9e48c4a1313c 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
@@ -198,3 +198,7 @@
 	status = "okay";
 	/* CPLD at reg = <3E> */
 };
+
+&gfx {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
index c23627ec5e84..947cfeb02457 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
@@ -155,3 +155,7 @@
 &vuart {
 	status = "okay";
 };
+
+&gfx {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index 4b2d8aa8abb6..76b738dd0c6b 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -273,3 +273,7 @@
 &vuart {
 	status = "okay";
 };
+
+&gfx {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
index e1c9b3f4fe44..e22701bfe5fc 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
@@ -343,3 +343,7 @@
 &vuart {
 	status = "okay";
 };
+
+&gfx {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index e1994c9e38c3..b73503c866aa 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -1005,6 +1005,15 @@
 				reg = <0x1e6e202c 0x4>;
 			};
 
+			gfx: display@1e6e6000 {
+				compatible = "aspeed,ast2500-gfx", "syscon";
+				reg = <0x1e6e6000 0x1000>;
+				reg-io-width = <4>;
+
+				/* AST2520 doesn't have GFX, so disable */
+				status = "disabled";
+			};
+
 			sram@1e720000 {
 				compatible = "mmio-sram";
 				reg = <0x1e720000 0x9000>;	// 36K
-- 
2.9.3
