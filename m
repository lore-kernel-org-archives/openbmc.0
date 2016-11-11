Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tFRP22bG5zDvnm
 for <openbmc@lists.ozlabs.org>; Fri, 11 Nov 2016 15:13:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="LvqFjke0"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="f/T/2mB3"; dkim-atps=neutral
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 3AEF920D1A;
 Thu, 10 Nov 2016 23:13:40 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute5.internal (MEProxy); Thu, 10 Nov 2016 23:13:40 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:in-reply-to:message-id:references
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=qST5syiE04biyNs95oh1XRU/dcM=; b=LvqFjk
 e0Bk8iw9t37l/qK5XoEv/VM4ePJDPXfJNUFdSiE66YmaLJyZVVvu1hSL+NeFOGkh
 0q70dvdNaLp9fOQhTc1k3cZsdHAHuP13rjG3GL1N2I4aJptPLtJn4A/YlM//ULu2
 Hs+4yU+2ZLyUIiTXLu8XZ0Gqy41I0vDO4bYUA=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:in-reply-to
 :message-id:references:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=qST5syiE04biyN
 s95oh1XRU/dcM=; b=f/T/2mB333dd3Zr3P6V2BOhVi4Tn+sGeVEw658H74GudkD
 B30gN6VbLhWWopCQkLf6ZUTHcErQJfaDNDDh3s8Li/plkMj074YBO9W2UYaUjUFp
 jdwNZ5KNkFAfyS5uA4T6sgEFD5CSPxGOqo/dfJZVeG7/pvyI4saeLsB5MMx+E=
X-ME-Sender: <xms:dEUlWCrztZDYHZOAD1WK3V7Yx-jwdEeRXxTvuyXdSmTgyhAJRT4iRg>
X-Sasl-enc: i+8iSELEl5pOUmVbCZCek6sPMYwvzZYs8Qimgk2w8C6l 1478837619
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5250B7F06F;
 Thu, 10 Nov 2016 23:13:37 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: eajames.ibm@gmail.com,
	Joel Stanley <joel@jms.id.au>
Cc: "Edward A . James" <eajames@us.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [RFC PATCH linux 7/9] arm: aspeed: dt: Fix OCC compatible strings
Date: Fri, 11 Nov 2016 14:42:14 +1030
Message-Id: <242e2064f1b8b49f55188a9005217fc109cba8f2.1478835488.git.andrew@aj.id.au>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1478835488.git.andrew@aj.id.au>
References: <cover.1478835488.git.andrew@aj.id.au>
In-Reply-To: <cover.1478835488.git.andrew@aj.id.au>
References: <1478560512-23791-1-git-send-email-eajames.ibm@gmail.com>
 <cover.1478835488.git.andrew@aj.id.au>
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
X-List-Received-Date: Fri, 11 Nov 2016 04:13:43 -0000

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts | 4 ++--
 arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts | 4 ++--
 arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts  | 4 ++--
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts  | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
index 6ca618bd331d..6bbc7817e823 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
@@ -110,12 +110,12 @@
 	status = "okay";
 
 	occ@50 {
-		compatible = "ibm,occ-i2c";
+		compatible = "ibm,occ-p8-i2c";
 		reg = <0x50>;
 	};
 
 	occ@51 {
-		compatible = "ibm,occ-i2c";
+		compatible = "ibm,occ-p8-i2c";
 		reg = <0x51>;
 	};
 };
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
index e677e9ff00b8..b88baf5d7add 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
@@ -122,7 +122,7 @@
 
 	// turismo
 	occ@50 {
-		compatible = "ibm,occ-i2c";
+		compatible = "ibm,occ-p8-i2c";
 		reg = <0x50>;
 	};
 
@@ -137,7 +137,7 @@
 
 	// turismo
 	occ@50 {
-		compatible = "ibm,occ-i2c";
+		compatible = "ibm,occ-p8-i2c";
 		reg = <0x50>;
 	};
 
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
index a4471fb3b36b..461de1eaf108 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
@@ -63,7 +63,7 @@
 	status = "okay";
 
 	occ@50 {
-		compatible = "ibm,occ-i2c";
+		compatible = "ibm,occ-p8-i2c";
 		reg = <0x50>;
 	};
 };
@@ -72,7 +72,7 @@
 	status = "okay";
 
 	occ@50 {
-		compatible = "ibm,occ-i2c";
+		compatible = "ibm,occ-p8-i2c";
 		reg = <0x50>;
 	};
 };
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
index 0fd60c4eafad..7426110f053f 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
@@ -127,7 +127,7 @@
 	status = "okay";
 
 	occ@50 {
-		compatible = "ibm,occ-i2c";
+		compatible = "ibm,occ-p8-i2c";
 		reg = <0x50>;
 	};
 };
-- 
2.9.3
