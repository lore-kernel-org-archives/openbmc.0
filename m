Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xDdcp4wFMzDqw5
 for <openbmc@lists.ozlabs.org>; Sat, 22 Jul 2017 03:51:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="ZpkNm3qR"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="XeXZdZqb"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9575420816;
 Fri, 21 Jul 2017 13:51:52 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Fri, 21 Jul 2017 13:51:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=iAiAkX
 uSU+GdoAnCuKwtLH276a+WQeYmPBJTmsAsFjo=; b=ZpkNm3qRabiwxGb6gfL/zO
 1MXXt5eTTcCEqQB3PRGDQpVb54X6huoWTbnoZvETi90tEcy+PbUJlvImtg0MjIri
 G96IyraAkZx6jPWX5wmLBbRdJNTbjFLcI06tR2ek5Gj723rbFndX0HDjROZVvkRK
 JD6YZfwj/sR9oDe7joxpdZqX8t2KhTUvR8OnCKoVkUcvHe7jF4J6ZIOzz6UqnjwQ
 E+js0ewVRsxXY+hbkQ9h4HeBDaeK+lqzD7GxTV4/baX6jB7m59cZF/bec7DQGt6s
 9NXHZDkIKCH4QqjwV29e+x9J2mezl/slL6gGO+ep/8PDkjUYmi2lQNX4dQlNpxhw
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=iAiAkXuSU+GdoAnCuKwtLH276a+WQeYmPBJTmsAsF
 jo=; b=XeXZdZqbdYHJ7076m8cfUSqaD/OlxMCTPNKDhK9nuLnCcaKrbww7yUimj
 bpSkGucYCRGhbefFJSLj5WfZoXUFZG5U7gV4da1qXkeEDBSZMN/gPTHL1doRZxsW
 U2QB2XMR5r6PL67RcErx1lshX8QuLoly0sqLQBjRIm51hum1/VnZdmmSLdwBITEN
 iJ1rmNpCUHWrY488SBP0XvMKHXp2m/XKUwZrfUlUqZvb1UIvmNKaV67zVUcVj9er
 riUtVILrkMtg7pTQf57Cnu3pBwWAmUqb44fwkKXpoxS061vDiAtBVXrH+IWYEEox
 +ecE1A4ZLt7XJFnH4+1SGW8RIKo9g==
X-ME-Sender: <xms:OD9yWbh8N9p4xR5tKA7xKj0ztcD4UqYSokhvPJUp86-hWC5RI2bPwQ>
X-Sasl-enc: 9Vh4ZUppBqGX1yM5hiesdsVxE4BZXw1y/zNBBBxt76Jc 1500659511
Received: from keelia.aj.id.au (ppp118-210-176-216.bras2.adl6.internode.on.net
 [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0C9427E1FC;
 Fri, 21 Jul 2017 13:51:49 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>, bradleyb@fuzziesquirrel.com,
 mspinler@linux.vnet.ibm.com, msbarth@linux.vnet.ibm.com,
 openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 2/5] ARM: aspeed: Update max31785 node in
 Witherspoon devicetree
Date: Sat, 22 Jul 2017 03:21:28 +0930
Message-Id: <20170721175131.17840-3-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170721175131.17840-1-andrew@aj.id.au>
References: <20170721175131.17840-1-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 21 Jul 2017 17:51:55 -0000

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 55 +++++++++++++++++++++++-
 1 file changed, 53 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index d9649013ee78..7dab4567cc20 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -197,7 +197,7 @@
 	 *    Power Supply 0
 	 *    Power Supply 1
 	 *    Fir Card ->
-	 *      MAX31785 Fan Cntl
+	 *	MAX31785 Fan Cntl
 	 *    Regs 3.3VS, 1.1VCS, 5VCS, 1.8V
 	 */
 
@@ -210,7 +210,58 @@
 	max31785@52 {
 		compatible = "maxim,max31785";
 		reg = <0x52>;
-		fault-max-fan;
+
+		fan@0 {
+			compatible = "pmbus-fan";
+			page = <0>;
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
+			page = <1>;
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
+			page = <2>;
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
+			page = <3>;
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
 
 	dps: dps310@76 {
-- 
2.11.0
