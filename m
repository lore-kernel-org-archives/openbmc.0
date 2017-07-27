Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xJ6qH6CFBzDrHV
 for <openbmc@lists.ozlabs.org>; Thu, 27 Jul 2017 19:58:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="OPW5B4iV"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="EdAX7EFy"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id CCA11207F8;
 Thu, 27 Jul 2017 05:58:01 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 27 Jul 2017 05:58:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=foTGRd
 N0lykBeLqRZLcfFUs7wWrVeJjAVRSOzArxy2A=; b=OPW5B4iVosVt+52QQRUjU9
 3Q8/+oSbgK2AAUA+IP5aj5SZl5vBiQhS7l93zYQfVpTTJT8hNoJPcG1yY949DiQP
 VmSnVhNzsMF8s/itYbmruGUZLZy4QC3Hx7LJCoBO/DJsR+Fd1SuurGFDOz7uY/sY
 00t80Vj1Ru4bnjYXj/QbaI2c0wdD4+/7vo4yw+DXq4UWUg+uO0egnD9g391FXmSA
 JjOlNhiRedtCQX/Xt95i0pSzZUfRegLkxPjy95F6XOCYnZnEX0gG+xwlwM68YsXN
 CgTTlKdiSgGYKt0nWBLJsQxWb8uEbQX4+GqCaq/ZfFKT4Tavnj2iV6PHEFEhEGMA
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=foTGRdN0lykBeLqRZLcfFUs7wWrVeJjAVRSOzArxy
 2A=; b=EdAX7EFyBjF34V9vr2GSMQuP9B5Ft1+dZydAoEuu0isLd569xr30E9Ot6
 WpB9iD6IlG2MxjEYkF2O83vhEeZRoAH7VoYLBkmpuyr6Cpy27OAIBWJ81mb6TjSB
 WkLg8MiwoNp/orFxyDaRDoh8s1UeDlw0fkIC/15cMCIvZDtb7ze5zl60pz8EuZIX
 ABWuZ/lchz/nqGOdTMeQODbEFu6UUeskiNPiLofVCX2L1IIL29kdZp2GsWug51zs
 /B+vLtjYQ6d1VatdSWiwaoqx+5QxnHoCVV83d+QwLHiHA8akxo5cG4MFX1DPMdf9
 jOJ6+EYk0RTgixa+hOTfTzbz4EO0g==
X-ME-Sender: <xms:Kbl5WdcFCcPNd0U05rCR8efF3I6pkQH_KnLxR0acieoY5xBVLmVaZQ>
X-Sasl-enc: uNmnYSh2mqEv1djmaiSnYq1SwCVROGp3evl5Is2ym6YS 1501149480
Received: from keelia.aj.id.au (ppp118-210-176-216.bras2.adl6.internode.on.net
 [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id 665A924287;
 Thu, 27 Jul 2017 05:57:59 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: msbarth@linux.vnet.ibm.com, mspinler@linux.vnet.ibm.com,
 bradleyb@fuzziesquirrel.com, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 v2 2/8] ARM: dts: aspeed: romulus: Update
 max31785 node
Date: Thu, 27 Jul 2017 19:27:11 +0930
Message-Id: <20170727095717.25479-3-andrew@aj.id.au>
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
X-List-Received-Date: Thu, 27 Jul 2017 09:58:05 -0000

From: Joel Stanley <joel@jms.id.au>

Romulus contains four chassis and two CPU fans. The driver will detect
which fans are installed and enable those.

Acked-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts | 80 ++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
index a9e36157f1f5..dea556f994f9 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
@@ -214,6 +214,86 @@
 	max31785@52 {
 		compatible = "maxim,max31785";
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
 
 	/* CPLD */
-- 
2.11.0
