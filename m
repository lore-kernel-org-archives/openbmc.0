Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wJx5s28pfzDqFr
 for <openbmc@lists.ozlabs.org>; Fri,  5 May 2017 12:43:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="EonX4iY+"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="K2ZZumta"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3317B20ACF;
 Thu,  4 May 2017 22:43:11 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 04 May 2017 22:43:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=b7eI/z
 qJI1Pbc67rf4+x36Vi3uRwnARrnJOLDyjJiI0=; b=EonX4iY+vAbd3PdQU23m6n
 xF5bJtD/iWMh9KYOwlw3pqERIIU4wCWxyZtxhFjuev7MXy4ZAuYnukHcM0rO+gs4
 buLiBYnt252EHNs/qSXfGondNKh1lXI7vWwvo66hf9S13jWhwEfaINLaG77Y1F7t
 7xYdLArlkLZpdTYzJtfN6Av/Y57dz+lUoil3t0cG6u1NFWHXgmWpqOE+9iEa5MQV
 pJgokdWIQHWqzeHPuEdVAduzQ4Ctg7zadCFHQwn0PN1CyFoYJp+Rfl7dtLO3oTys
 bNYdZhL5pVjgeYgpwkh7nSl59UWkVoGgSU4DHeG+t2yuDyMBJGmHyMblm/8t8G9g
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=b7eI/zqJI1Pbc67rf4+x36Vi3uRwnARrnJOLDyjJi
 I0=; b=K2ZZumtaAgDfZEau2DZmyTuLtyuIkaYEu/x0fmlA8N7JySYK3689N/z3k
 A3XOweVHivHreK2S2VcbST2PZlo2tlFB/GoVFiMrz42ilTwm9L56q1RnRrdJWfuG
 fgBUI3EpRNt5jWsjaniGbY/hx2zB13WG77Cx+bc6vJrx35qYFhStK0N+T7Xgurxv
 UBR5b9eQmR0r0T+K9qpibcobXXAN8qm8iHK2GglY5giyNrIIIJfcF1mx7GupfAp7
 wdpGD16RSnDI4IiszIVtcE3OK5vekLn9F9Da9f6HoNQ++EHSpnV9peqbBfm9B6s4
 hvpnAgfH0slePs8/qhxLTWnEAYe6g==
X-ME-Sender: <xms:v-YLWW0jjilp3Cc-JbNCJNW25i4x5l5k1SjamKNAfgNz-So2jD1btQ>
X-Sasl-enc: INIuy8gJxqb26twVR7yukg+ELa4mYtmC7vwgDhytUjC4 1493952190
Received: from keelia.au.ibm.com (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id 82C4E7E351;
 Thu,  4 May 2017 22:43:08 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 bradleyb@fuzziesquirrel.com, ken.th.liu@foxconn.com,
 john.hc.wang@foxconn.com
Subject: [PATCH linux dev-4.10 v3 3/3] aspeed: barreleye: Debounce
 BMC_PWBTN_IN_N through devicetree
Date: Fri,  5 May 2017 12:12:26 +0930
Message-Id: <20170505024227.30962-4-andrew@aj.id.au>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170505024227.30962-1-andrew@aj.id.au>
References: <20170505024227.30962-1-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 05 May 2017 02:43:14 -0000

This is a breaking change for userspace, as the GPIO is now represented
as a key-code from a GPIO keyboard input.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts | 11 +++++++++++
 arch/arm/mach-aspeed/aspeed.c                  |  8 --------
 2 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
index be1f2d120fee..9b75fc039f2d 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
@@ -74,6 +74,17 @@
 			gpios = <&gpio ASPEED_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
 		};
 	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		gpioe0 {
+			gpios = <&gpio ASPEED_GPIO(E, 0) GPIO_ACTIVE_LOW>;
+			label = "bmc_pwbtn_in_n";
+			linux,code = <0>;
+			debounce-interval = <20>;
+		};
+	};
 };
 
 &pinctrl {
diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index 31b0e69f62b8..760fed641a0b 100644
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -73,14 +73,6 @@ static void __init do_barreleye_setup(void)
 	writel(reg, AST_IO(AST_BASE_GPIO | 0x20));
 	writel(0xC738F20A, AST_IO(AST_BASE_GPIO | 0x24));
 	writel(0x0031FFAF, AST_IO(AST_BASE_GPIO | 0x80));
-
-	/* Select TIMER3 as debounce timer */
-	writel(0x00000001, AST_IO(AST_BASE_GPIO | 0x48));
-	writel(0x00000001, AST_IO(AST_BASE_GPIO | 0x4C));
-
-	/* Set debounce timer to 480000 cycles, with a pclk of 48MHz,
-	 * corresponds to 20 ms. This time was found by experimentation */
-	writel(0x000EA600, AST_IO(AST_BASE_GPIO | 0x58));
 }
 
 static void __init do_palmetto_setup(void)
-- 
2.9.3
