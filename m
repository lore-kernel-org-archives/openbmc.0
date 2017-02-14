Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vMkQH3vKSzDqD0
 for <openbmc@lists.ozlabs.org>; Tue, 14 Feb 2017 11:51:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Q03JlDjt"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="FIIuCEjk"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 79A68209B0;
 Mon, 13 Feb 2017 19:51:49 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 13 Feb 2017 19:51:49 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=x07
 T6VlFsd0MsS1xa2d2Z03jkfc=; b=Q03JlDjtGdmiuLYkrxcG8P4Tzs2UWtoPt+1
 5Z5y4xQaG6g6ENmqxulqdMRuR64qT816JHCl9vLNOpcWoaXHaGR4no/+/wqwx9VW
 Af/BiQrq73GKiN84AsoKfh8tfyKlOs74YB4gdVYlvEZseogf2EwRCvdzB1FnQ8Cy
 Qq5M0uhw=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=x07T6VlFsd0MsS1xa2d2Z03jkfc=; b=FIIuC
 EjkA1NzoLUY8TnF8bfRjFcDF5NvLmfWh4+b154xZt/Q1ygP/biZya/Fb47bcou5C
 Wj0xRVo2HufYQKPQu3v/hW91uEKfe04X6gJofqn+HEIRqm7wOaowcmfQGEgISHij
 fC7dXNgZ9NKpjnQ/OTsdw2HJMircxEkH6XsKoA=
X-ME-Sender: <xms:pVSiWFlWZM0bZ7OHR51TVECk25XgOWnFJHBCJwJ0DgMSr5PQzyHYHw>
X-Sasl-enc: w0SKmSsqPIb7zM7zKb4YPt8ZUWgy2946USHm/jIUykMc 1487033508
Received: from keelia.au.ibm.com (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id 152677E0D5;
 Mon, 13 Feb 2017 19:51:46 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: Patrick Williams <patrick@stwcx.xyz>, Rick Altherr <raltherr@google.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: [PATCH linux dev-4.7 v2 3/3] ARM: dts: aspeed-g5: Give pinctrl
 phandles for gfx and lhc
Date: Tue, 14 Feb 2017 11:21:04 +1030
Message-Id: <20170214005104.11940-4-andrew@aj.id.au>
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
X-List-Received-Date: Tue, 14 Feb 2017 00:51:52 -0000

The g5's pinctrl reported:

[    0.750000] aspeed-g5-pinctrl 1e6e2000.syscon:pinctrl@1e6e2000: No GFX phandle found, some mux configurations may fail
[    0.750000] aspeed-g5-pinctrl 1e6e2000.syscon:pinctrl@1e6e2000: No LHC phandle found, some mux configurations may fail

as the aspeed,external-nodes property was missing from the pinctrl
node. Fix the mux capability by adding the required phandles in the
AST2500-based board files, as the AST2520 from the g5 family doesn't
have a GFX IP block.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---

The commit is *very* loosely based on b590c8d2eed5748dfe52c4fc13df6cadb1b56d58
in the ARM next/dt tree.

Since v1:

* Push assignment of phandles to the aspeed,external-nodes property out to the
  board dts. I expect eventually we'll want to do this in an ast2500.dtsi

 arch/arm/boot/dts/aspeed-ast2500-evb.dts         | 4 ++++
 arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts    | 4 ++++
 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts     | 4 ++++
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 4 ++++
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts       | 4 ++++
 5 files changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-ast2500-evb.dts b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
index 1999a06eec80..40f2184f9fe7 100644
--- a/arch/arm/boot/dts/aspeed-ast2500-evb.dts
+++ b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
@@ -83,3 +83,7 @@
 &gfx {
 	status = "okay";
 };
+
+&pinctrl {
+	aspeed,external-nodes = <&gfx &lhc>;
+};
diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
index 9e48c4a1313c..8df116ea8594 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
@@ -202,3 +202,7 @@
 &gfx {
 	status = "okay";
 };
+
+&pinctrl {
+	aspeed,external-nodes = <&gfx &lhc>;
+};
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
index 947cfeb02457..f4060551a874 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
@@ -159,3 +159,7 @@
 &gfx {
 	status = "okay";
 };
+
+&pinctrl {
+	aspeed,external-nodes = <&gfx &lhc>;
+};
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index 76b738dd0c6b..c067fb78d491 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -277,3 +277,7 @@
 &gfx {
 	status = "okay";
 };
+
+&pinctrl {
+	aspeed,external-nodes = <&gfx &lhc>;
+};
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
index e22701bfe5fc..d9f63d7752dd 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
@@ -347,3 +347,7 @@
 &gfx {
 	status = "okay";
 };
+
+&pinctrl {
+	aspeed,external-nodes = <&gfx &lhc>;
+};
-- 
2.9.3
