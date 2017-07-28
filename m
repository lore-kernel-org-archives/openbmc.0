Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xJvK743JxzDrS3
 for <openbmc@lists.ozlabs.org>; Sat, 29 Jul 2017 02:23:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="f8RvK4NK"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="HfblEFI7"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 8B43C20D31;
 Fri, 28 Jul 2017 12:23:05 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Fri, 28 Jul 2017 12:23:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=OLdjeB
 UYAKTwzkCAkY38W+cPD63u5WN0J2rTRjImWg8=; b=f8RvK4NKO3JsVt4xwgSfCc
 SGlFS0MXFkTS4qMy/Cq06eXHumtP4zEmO0xDsDCRdwWCzustplOphmO9R7HICYcR
 advDKcGB7gZiLp8o1aVvyLVK0x5IQgSIKC/73uw81YC0fiZW5zH1/D/1F/+CBpfu
 9j0MJ6J6VNxd3YvlV/5bu6hG4/WuUaTUXomQbVbKiqNXTQ7gk9nXEwMZTfRlIxtV
 NCkcuySpciIqPlLfnG2WLVW/4e7TRpPyVkJTq3Dcbs3d4b3/8KvpzZcLSiBOX/b6
 pSOgDrLqOHbnRlYC/y7tPCZQCGDnctzJEEHUEySkst7CpN+6/2PD8Ie/YZ5mwhjA
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=OLdjeBUYAKTwzkCAkY38W+cPD63u5WN0J2rTRjImW
 g8=; b=HfblEFI7mSHGa7a/QNs5mO+W5aQnB8AeAmEOVBmbzCr0L6pDNv34UQiE2
 0lUyp9ShYNRlhoZkHBMIgmsUhjOaYV+X1WIqe8uQsZqIx+DqO2mevf4LkSd8fNxX
 UvRiLZfxQ7AWaeIeSfpvpSip1yrdoz6nTYvC6tOv0xVIOwcYepawb028BsOlnpYZ
 DWr775StCwrMXF/xLxthNH1u9v+NOjrXxptEroSyqwKJ25ITlof2NBH1jpi1hxZw
 yJ2woXeLnLT/DEfSUm1DTWtZcJQNGb/tEUhSl9smTkynb06l2sgMu184SV+ertlG
 J/klmssvoGLFfQsC23M0uEvjtqTuQ==
X-ME-Sender: <xms:6WR7Wfd7f7auo2vf007PVqPuNmwbcBHLcbLrGg40VTTyvfesZ1guQQ>
X-Sasl-enc: 0fq0axE/YGkD/DoOhMaInZ/M5U5YuKBesIuW1vzHPp4L 1501258984
Received: from keelia.au.ibm.com
 (ppp118-210-176-216.bras2.adl6.internode.on.net [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id 513027E17C;
 Fri, 28 Jul 2017 12:23:03 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>, mspinler@linux.vnet.ibm.com,
 msbarth@linux.vnet.ibm.com, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 2/6] ARM: dts: aspeed: Configure Firestone to
 mark its fans as installed
Date: Sat, 29 Jul 2017 01:52:45 +0930
Message-Id: <20170728162249.9145-3-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170728162249.9145-1-andrew@aj.id.au>
References: <20170728162249.9145-1-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 28 Jul 2017 16:23:07 -0000

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
index d52b5282baef..b4aab876be88 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
@@ -136,6 +136,7 @@
 		fan@0 {
 			compatible = "pmbus-fan";
 			reg = <0>;
+			mark-fan-installed;
 			tach-pulses = <2>;
 			maxim,fan-rotor-input = "tach";
 			maxim,fan-pwm-freq = <25000>;
@@ -149,6 +150,7 @@
 		fan@1 {
 			compatible = "pmbus-fan";
 			reg = <1>;
+			mark-fan-installed;
 			tach-pulses = <2>;
 			maxim,fan-rotor-input = "tach";
 			maxim,fan-pwm-freq = <25000>;
@@ -162,6 +164,7 @@
 		fan@2 {
 			compatible = "pmbus-fan";
 			reg = <2>;
+			mark-fan-installed;
 			tach-pulses = <2>;
 			maxim,fan-rotor-input = "tach";
 			maxim,fan-pwm-freq = <25000>;
@@ -175,6 +178,7 @@
 		fan@3 {
 			compatible = "pmbus-fan";
 			reg = <3>;
+			mark-fan-installed;
 			tach-pulses = <2>;
 			maxim,fan-rotor-input = "tach";
 			maxim,fan-pwm-freq = <25000>;
@@ -188,6 +192,7 @@
 		fan@4 {
 			compatible = "pmbus-fan";
 			reg = <4>;
+			mark-fan-installed;
 			tach-pulses = <2>;
 			maxim,fan-rotor-input = "tach";
 			maxim,fan-pwm-freq = <25000>;
@@ -201,6 +206,7 @@
 		fan@5 {
 			compatible = "pmbus-fan";
 			reg = <5>;
+			mark-fan-installed;
 			tach-pulses = <2>;
 			maxim,fan-rotor-input = "tach";
 			maxim,fan-pwm-freq = <25000>;
-- 
2.11.0
