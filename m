Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sQW5k1pwZzDrnt
 for <openbmc@lists.ozlabs.org>; Fri,  2 Sep 2016 17:31:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=kfRoLNDH; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=N9TaBdd3; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 2A613205DB;
 Fri,  2 Sep 2016 03:31:36 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute7.internal (MEProxy); Fri, 02 Sep 2016 03:31:36 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-sasl-enc:x-sasl-enc; s=mesmtp; bh=1vb8aC7rz2eQ3hJhD46+gEOOBN0
 =; b=kfRoLNDHobqTZo0tSXG3pCUZCQBkQMvM3yDPQ5vj2/UBNt1EzpP5r1pWdLE
 0WmtATeCL1LuB5MkdWFlnBKrHI7J8klSZ1wLX/3cBritQuB3fQGGGoj++xPAU5X2
 mlU+3fJtiHT9O1TCeVE4Q1pBefHDC1UETljtFydIA1jaRN8Y=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=smtpout; bh=1vb8
 aC7rz2eQ3hJhD46+gEOOBN0=; b=N9TaBdd3ggl6RdOFyCXLSHD08SxVErIrd77j
 rOShRdMigMT0EYwQ2D1EdxGwPYWf/hqxNIjMJQ8kITv0wDMvXAu5gMLeqmb4CGt/
 /ZDccGwbF8Nyw5gEtS3cj4Zvi7eyseAigEwZYKCtTe4i0XYe4G4eQ6xd8iKidONS
 QqfyVtE=
X-Sasl-enc: N0tHT2ZKh3bzA7d7NgGD4QBxVZPmeEV9I64s400yA4Xh 1472801495
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id A25A7F29D2;
 Fri,  2 Sep 2016 03:31:34 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux 1/3] aspeed-g5: Add I2C mux configuration properties
Date: Fri,  2 Sep 2016 17:00:49 +0930
Message-Id: <20160902073051.31492-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.9.3.1.g0db844e
In-Reply-To: <20160902073051.31492-1-andrew@aj.id.au>
References: <20160902073051.31492-1-andrew@aj.id.au>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Sep 2016 07:31:39 -0000

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-g5.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 3d7b69b50785..f73a2b18e152 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -384,6 +384,8 @@
 					clock-frequency = <100000>;
 					status = "disabled";
 					interrupts = <2>;
+					pinctrl-names = "default";
+					pinctrl-0 = <&pinctrl_i2c3_default>;
 				};
 
 				i2c3: i2c-bus@100 {
@@ -395,6 +397,8 @@
 					clock-frequency = <100000>;
 					status = "disabled";
 					interrupts = <3>;
+					pinctrl-names = "default";
+					pinctrl-0 = <&pinctrl_i2c4_default>;
 				};
 
 				i2c4: i2c-bus@140 {
@@ -406,6 +410,8 @@
 					clock-frequency = <100000>;
 					status = "disabled";
 					interrupts = <4>;
+					pinctrl-names = "default";
+					pinctrl-0 = <&pinctrl_i2c5_default>;
 				};
 
 				i2c5: i2c-bus@180 {
@@ -417,6 +423,8 @@
 					clock-frequency = <100000>;
 					status = "disabled";
 					interrupts = <5>;
+					pinctrl-names = "default";
+					pinctrl-0 = <&pinctrl_i2c6_default>;
 				};
 
 				i2c6: i2c-bus@1c0 {
@@ -428,6 +436,8 @@
 					clock-frequency = <100000>;
 					status = "disabled";
 					interrupts = <6>;
+					pinctrl-names = "default";
+					pinctrl-0 = <&pinctrl_i2c7_default>;
 				};
 
 				i2c7: i2c-bus@300 {
@@ -439,6 +449,8 @@
 					clock-frequency = <100000>;
 					status = "disabled";
 					interrupts = <7>;
+					pinctrl-names = "default";
+					pinctrl-0 = <&pinctrl_i2c8_default>;
 				};
 
 				i2c8: i2c-bus@340 {
@@ -450,6 +462,8 @@
 					clock-frequency = <100000>;
 					status = "disabled";
 					interrupts = <8>;
+					pinctrl-names = "default";
+					pinctrl-0 = <&pinctrl_i2c9_default>;
 				};
 
 				i2c9: i2c-bus@380 {
@@ -461,6 +475,8 @@
 					clock-frequency = <100000>;
 					status = "disabled";
 					interrupts = <9>;
+					pinctrl-names = "default";
+					pinctrl-0 = <&pinctrl_i2c10_default>;
 				};
 
 				i2c10: i2c-bus@3c0 {
@@ -472,6 +488,8 @@
 					clock-frequency = <100000>;
 					status = "disabled";
 					interrupts = <10>;
+					pinctrl-names = "default";
+					pinctrl-0 = <&pinctrl_i2c11_default>;
 				};
 
 				i2c11: i2c-bus@400 {
@@ -483,6 +501,8 @@
 					clock-frequency = <100000>;
 					status = "disabled";
 					interrupts = <11>;
+					pinctrl-names = "default";
+					pinctrl-0 = <&pinctrl_i2c12_default>;
 				};
 
 				i2c12: i2c-bus@440 {
@@ -494,6 +514,8 @@
 					clock-frequency = <100000>;
 					status = "disabled";
 					interrupts = <12>;
+					pinctrl-names = "default";
+					pinctrl-0 = <&pinctrl_i2c13_default>;
 				};
 
 				i2c13: i2c-bus@480 {
@@ -505,6 +527,8 @@
 					clock-frequency = <100000>;
 					status = "disabled";
 					interrupts = <13>;
+					pinctrl-names = "default";
+					pinctrl-0 = <&pinctrl_i2c14_default>;
 				};
 
 			};
-- 
2.9.3.1.g0db844e
