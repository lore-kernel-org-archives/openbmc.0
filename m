Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xJ6qL5NgqzDrJG
 for <openbmc@lists.ozlabs.org>; Thu, 27 Jul 2017 19:58:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="DR6DnqSP"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="MZ8Km9zR"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 95371207FD;
 Thu, 27 Jul 2017 05:58:04 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 27 Jul 2017 05:58:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=R6ygFL
 b/3p5ogWYBQHXjcViWCSZPUmddSV9Oh65Q6Sw=; b=DR6DnqSPvuGe9WP3LhGIa7
 N5uJiAm/kQ0GsHA1VS8YCnyxLtjBTx431Ztw9DAvp1PpAHyqZ7R4/chNezMF4xpj
 PG1QI2gukSzhQ4Iw59uKstzmIYBAhRNgh4YUQbmAPz8U89/GUHd8CEGbk8ovYh65
 iwugQxbtN3ZhXkUwnpXLcx3pwiyvVR7J4yG2e0O0FMEL9rpKOObGh6uQ8OrkSwLC
 sGPkxPQFIndzJGYzFF5dW8e0Zdc63d2SGcCBIOHdCbjIFK3AIJFBr+AoSblAsWu5
 GRyFlmdQ6PxIZUR2ybVjFqwML8oI9oJ8Mk/pWlQLoKVJk/Hegb3NGgB72mY0zLfA
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=R6ygFLb/3p5ogWYBQHXjcViWCSZPUmddSV9Oh65Q6
 Sw=; b=MZ8Km9zRvEeXX6IGxf0+2Tcl1x5qNXfwYUnKwOVzhYm14DFkeGJCZAQSp
 St6+4Uxg5h/bqbHe+tVwnwJw7H1z/eTtcoElsZ3Kp1bcHNku2pwMss5YQXUtxAIE
 rM1ZntqfIwBd0PLG3MOMID9Eq20CirepVvqjWo80niqZb/R1lRO9OpY6N40KU0HK
 O62GjOtXb8ftJhhkJYLUvrfTkyApQXUopAG97lBtOhLlTuPfp27aYckB506Ws9Ns
 fNisJleyinpaKXxSRQJP6DwGkjNM7fgjrbDD67k7qBZFvX51mSaIdTnqI6BLTuvt
 PsHmt7TKflzRwXW6OG1+UlDMMBTmA==
X-ME-Sender: <xms:LLl5WR1Swp3kfEUv7vDRm4r2qxayd4P7uT8ZBrA-WbD9J_vYa0LNpg>
X-Sasl-enc: fqVSUmLTMjgGWqg6YEyIGxqUSkj5frqWNxAswAxQ+re4 1501149483
Received: from keelia.aj.id.au (ppp118-210-176-216.bras2.adl6.internode.on.net
 [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2D7F124287;
 Thu, 27 Jul 2017 05:58:01 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: msbarth@linux.vnet.ibm.com, mspinler@linux.vnet.ibm.com,
 bradleyb@fuzziesquirrel.com, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 v2 3/8] ARM: dts: aspeed: firestone: Update
 max31785 node
Date: Thu, 27 Jul 2017 19:27:12 +0930
Message-Id: <20170727095717.25479-4-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170727095717.25479-1-andrew@aj.id.au>
References: <20170727095717.25479-1-andrew@aj.id.au>
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
X-List-Received-Date: Thu, 27 Jul 2017 09:58:07 -0000

From: Joel Stanley <joel@jms.id.au>

We set 6 fans, the maxium number of possible fans for the Maxim
chip. The driver will detect which fans are installed and enable those.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts | 84 +++++++++++++++++++++++++-
 1 file changed, 82 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
index fef73ea7fd0c..7b4055f99e2b 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
@@ -105,12 +105,92 @@
 	// i2c hub PCA9516A
 	// spruce / madrone PDB
 	// APSS
+
 	// FIR (fan / SATA backplane)
-	fanctl@52 {
+	max31785@52 {
 		compatible = "max,max31785";
 		reg = <0x52>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		fan@0 {
+			compatible = "pmbus-fan";
+			reg = <0>;
+			tach-pulses = <2>;
+			maxim,fan-rotor-input = "tach";
+			maxim,fan-pwm-freq = <25000>;
+			maxim,fan-dual-tach;
+			maxim,fan-no-watchdog;
+			maxim,fan-no-fault-ramp;
+			maxim,fan-ramp = <2>;
+			maxim,fan-fault-pin-mon;
+		};
+
+		fan@1 {
+			compatible = "pmbus-fan";
+			reg = <1>;
+			tach-pulses = <2>;
+			maxim,fan-rotor-input = "tach";
+			maxim,fan-pwm-freq = <25000>;
+			maxim,fan-dual-tach;
+			maxim,fan-no-watchdog;
+			maxim,fan-no-fault-ramp;
+			maxim,fan-ramp = <2>;
+			maxim,fan-fault-pin-mon;
+		};
+
+		fan@2 {
+			compatible = "pmbus-fan";
+			reg = <2>;
+			tach-pulses = <2>;
+			maxim,fan-rotor-input = "tach";
+			maxim,fan-pwm-freq = <25000>;
+			maxim,fan-dual-tach;
+			maxim,fan-no-watchdog;
+			maxim,fan-no-fault-ramp;
+			maxim,fan-ramp = <2>;
+			maxim,fan-fault-pin-mon;
+		};
+
+		fan@3 {
+			compatible = "pmbus-fan";
+			reg = <3>;
+			tach-pulses = <2>;
+			maxim,fan-rotor-input = "tach";
+			maxim,fan-pwm-freq = <25000>;
+			maxim,fan-dual-tach;
+			maxim,fan-no-watchdog;
+			maxim,fan-no-fault-ramp;
+			maxim,fan-ramp = <2>;
+			maxim,fan-fault-pin-mon;
+		};
+
+		fan@4 {
+			compatible = "pmbus-fan";
+			reg = <4>;
+			tach-pulses = <2>;
+			maxim,fan-rotor-input = "tach";
+			maxim,fan-pwm-freq = <25000>;
+			maxim,fan-dual-tach;
+			maxim,fan-no-watchdog;
+			maxim,fan-no-fault-ramp;
+			maxim,fan-ramp = <2>;
+			maxim,fan-fault-pin-mon;
+		};
+
+		fan@5 {
+			compatible = "pmbus-fan";
+			reg = <5>;
+			tach-pulses = <2>;
+			maxim,fan-rotor-input = "tach";
+			maxim,fan-pwm-freq = <25000>;
+			maxim,fan-dual-tach;
+			maxim,fan-no-watchdog;
+			maxim,fan-no-fault-ramp;
+			maxim,fan-ramp = <2>;
+			maxim,fan-fault-pin-mon;
+		};
 	};
-
 };
 
 &i2c4 {
-- 
2.11.0
