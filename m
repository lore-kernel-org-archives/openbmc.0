Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xJ6qP60WBzDrH5
 for <openbmc@lists.ozlabs.org>; Thu, 27 Jul 2017 19:58:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="C9BBAEi4"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="a2DfZKfG"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 914D320A5E;
 Thu, 27 Jul 2017 05:58:07 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 27 Jul 2017 05:58:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=vjvFjl
 Xgh9kRK0g2XHo7UmfdyQzN7gITAiJIre56yE0=; b=C9BBAEi44qEDJq4z/jGQtk
 DnFMMUJBMBB4ajdEeVWKFM8xSByJBy4YbNYPIvT2UhErUZ/U0xyp0frAjoGZCtaq
 p5E6vUByKr/ns98/OoOWoNYfiDcQp2swjldUQx/DgCd7F85hqAQm4woI9cjIrUwu
 sVw5GTKks7AxckYyETvSEVLzrd9jHTuArf/fimRxKtK6tRdqaOd4RvvPAaQIrHa/
 2/VIKEPcAeBSP10hCprzYGdG7J0XCgRPjgMRNwH9X8C5scU4kCTwJ5eIb7sLU7Zf
 QhW1I40a027hgsry459tBEVtvObLrZX63BBujgKQSS3ZCAPU2mfuVW5rnqkf39Ag
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=vjvFjlXgh9kRK0g2XHo7UmfdyQzN7gITAiJIre56y
 E0=; b=a2DfZKfGZY2S09Erq84Pv/pgLW7rtg6f/UJaqxpUVka5QBrFCGdbmnFCY
 33qmXydgzMPxTllIUa/Z6KtB5WiUMegyijUHs8zp7vwjyS+4QuL5g2mjmEUeNoBw
 TwUo4OtCKPBeWQ9EBk+4/NRmz0p/vwDkK4p6fdNY370VsHuwcPkr0VYaxGocfW/Q
 hIvPgOkWkgC91m2huUwjB3mBIeB5dnOwovmcV2KDV7c8YWVbgu6Wvo/efJp1K97q
 akfda3XdqcooB53fIZkXqBsOpKH9JY4/lDP38FH+19sdtylRE9il9bTuaq0aLPkS
 1WmtC8+aP6v4r2qvuFs3UuIazsnrQ==
X-ME-Sender: <xms:L7l5WcS9ku4-KSIDnYpXKYNnf92KpvNzCGz4fMr7uQJM275fMN9ozg>
X-Sasl-enc: EEPsaF0AnxQHEfE698sTVWbESyvU1vC6F3s0YX8R3rGE 1501149486
Received: from keelia.aj.id.au (ppp118-210-176-216.bras2.adl6.internode.on.net
 [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0CB7E24130;
 Thu, 27 Jul 2017 05:58:04 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>, msbarth@linux.vnet.ibm.com,
 mspinler@linux.vnet.ibm.com, bradleyb@fuzziesquirrel.com,
 openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 v2 4/8] ARM: dts: aspeed: witherspoon: Update
 max31785 node
Date: Thu, 27 Jul 2017 19:27:13 +0930
Message-Id: <20170727095717.25479-5-andrew@aj.id.au>
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
X-List-Received-Date: Thu, 27 Jul 2017 09:58:10 -0000

Witherspoon contains four dual-tach fans. We configure them go to 100%
when the fault pin is asserted, and disable the fan ramp watchdog. This
preserves the behaviour of the previous driver.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 57 +++++++++++++++++++++++-
 1 file changed, 55 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index d9649013ee78..a474b3f58350 100644
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
 
@@ -210,7 +210,60 @@
 	max31785@52 {
 		compatible = "maxim,max31785";
 		reg = <0x52>;
-		fault-max-fan;
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
 	};
 
 	dps: dps310@76 {
-- 
2.11.0
