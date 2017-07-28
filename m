Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xJvKB1XgJzDrS3
 for <openbmc@lists.ozlabs.org>; Sat, 29 Jul 2017 02:23:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Q34FgpWl"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="WNKPd66Y"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 388DF209F7;
 Fri, 28 Jul 2017 12:23:08 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Fri, 28 Jul 2017 12:23:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=j1bgEy
 O2EeICpLeL9abCPx6nkN7sLXUCxHZ1G3e/G4U=; b=Q34FgpWlRHN5YFfVBQxDGL
 ZeAliaWL3Mw2ApnMdlXtAOitEonjwEQYaufNyJsqqJlikP8Un67DsSvbQRN8cjkr
 QVBK5GKOIYEIJUt6F4Pqfi+EsXYhZ0YOll9ejkr34I/v0mWnunIT8q/2jpizEvRu
 +v5ekykMPyyTFFWTDaFa74wAx215Y3P3tbgoSjN/l/2CB0HL7rJWBTvotWIGiQk6
 QeBlBIURvXuE9hrl3H4WntARASCWA6rVI65NvTP7xGO5IpAO18tHnwnsj7EIrxYJ
 i5FDaZJjJVaLFVWwdSxzDyKiVezJQJkicNxQAu9iqjjGk1iA4pXTYC2x7dlqNPOg
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=j1bgEyO2EeICpLeL9abCPx6nkN7sLXUCxHZ1G3e/G
 4U=; b=WNKPd66YWc5tGzwBMC7EGdQThR/WLWs7Fqxfsj8W/43D/ps1CUwHpovuZ
 ZZ+dI6LtP/VbNmmD93rtKFv1MfZppijgRxRfPWhOaFFLBND00dYPMmp56U90lH2h
 QkDLsXnZUDMckwybM9RDOUUzCmBpGjc2p7uQve4aDR6XLW92lm3xSkY2Zmq5wAh4
 pw2b1EkPtjx56UFL054syAHEe1zi82gtg9xsDO7XhqT/W5JilHMke6LUzz3tC3WO
 IUHQQK4M+HmE35sui+e8d0l5WGx/yVlF0kOxi8eK5IuXhmSYH+gYt6LDG9MWcmtJ
 qZRonxc+UqwS6/O6UyQFNmCI6xs3g==
X-ME-Sender: <xms:7GR7WW94YdjLA7nilAM4PP4yfOfUDFxRiZwhDW9tci3xGwWIMfPLrA>
X-Sasl-enc: ZCsSlKNNcUSCh3xe5NkW/NmXpYNRWeIOraiaANxEgySY 1501258987
Received: from keelia.au.ibm.com
 (ppp118-210-176-216.bras2.adl6.internode.on.net [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id F2F5B7E1FC;
 Fri, 28 Jul 2017 12:23:05 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>, mspinler@linux.vnet.ibm.com,
 msbarth@linux.vnet.ibm.com, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 3/6] ARM: dts: aspeed: Configure Romulus to
 mark its fans as installed
Date: Sat, 29 Jul 2017 01:52:46 +0930
Message-Id: <20170728162249.9145-4-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 28 Jul 2017 16:23:10 -0000

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
index dea556f994f9..180e91f6a36a 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
@@ -220,6 +220,7 @@
 		fan@0 {
 			compatible = "pmbus-fan";
 			reg = <0>;
+			mark-fan-installed;
 			tach-pulses = <2>;
 			maxim,fan-rotor-input = "tach";
 			maxim,fan-pwm-freq = <25000>;
@@ -233,6 +234,7 @@
 		fan@1 {
 			compatible = "pmbus-fan";
 			reg = <1>;
+			mark-fan-installed;
 			tach-pulses = <2>;
 			maxim,fan-rotor-input = "tach";
 			maxim,fan-pwm-freq = <25000>;
@@ -246,6 +248,7 @@
 		fan@2 {
 			compatible = "pmbus-fan";
 			reg = <2>;
+			mark-fan-installed;
 			tach-pulses = <2>;
 			maxim,fan-rotor-input = "tach";
 			maxim,fan-pwm-freq = <25000>;
@@ -259,6 +262,7 @@
 		fan@3 {
 			compatible = "pmbus-fan";
 			reg = <3>;
+			mark-fan-installed;
 			tach-pulses = <2>;
 			maxim,fan-rotor-input = "tach";
 			maxim,fan-pwm-freq = <25000>;
@@ -272,6 +276,7 @@
 		fan@4 {
 			compatible = "pmbus-fan";
 			reg = <4>;
+			mark-fan-installed;
 			tach-pulses = <2>;
 			maxim,fan-rotor-input = "tach";
 			maxim,fan-pwm-freq = <25000>;
@@ -285,6 +290,7 @@
 		fan@5 {
 			compatible = "pmbus-fan";
 			reg = <5>;
+			mark-fan-installed;
 			tach-pulses = <2>;
 			maxim,fan-rotor-input = "tach";
 			maxim,fan-pwm-freq = <25000>;
-- 
2.11.0
