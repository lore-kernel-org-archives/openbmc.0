Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xDdcm07g0zDqvq
 for <openbmc@lists.ozlabs.org>; Sat, 22 Jul 2017 03:51:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="RVFe6OyV"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="SPkHGiu4"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9EBED2082B;
 Fri, 21 Jul 2017 13:51:49 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Fri, 21 Jul 2017 13:51:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=lo8cSc
 5NTJ2R5lGriewXmJTLxqDR/g3V2dHWV9atnek=; b=RVFe6OyVmiHhHUKnk0jdOr
 gilW7orpxkhfAHNjKN3Qq7DLsh+HtVlQCEMRPA/qBh1itPrWAAeU4GC9tqWtSp5T
 DZM9BaiZ8vipsStSVVebVjkOjqCoD3eYaSbLo61uo/jKcYLue5HF5hGeZkJLcQhw
 kHUYsuc9bYOidMSlWszVRBgCe73cI/A2bcypQmZa+E4RnR6O49ee0YxoKql6IJIP
 zzW52tvLMWOZOWc7eOOfLCBFzjKCBZlL6z6ypoGHKRBtTLZRLoFX6AapDIlDUEyT
 bfRGlzJmXASrvFvEEq9tHln15vzijf9xLXc9z82pyKWtdOuG9zjLqyPYsKnDI29g
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=lo8cSc5NTJ2R5lGriewXmJTLxqDR/g3V2dHWV9atn
 ek=; b=SPkHGiu48mvC2QBebDCQUHVDjBrKSxSHm7/hUmwpKIryAsX2MESsGWquA
 TfIag5QD30+yg4cnsJxajTX9xSIENuAKZiht85hsZBz54sTsx7QHApZPEyRA8Re3
 pcjlEb8o2uMUSHRMiZhRwNliNUR+DO46zbZNYl4gEyLwy9VG2tdub26Cojb8AFtk
 8H60B+fo4zzaJrxLDBxIzKw3Lxkv7R+FKsrCNmo56mxqpP0W2/YE0HTrFVU47W7p
 2BfqQ4D0bStlrVDK9IA+PTkI9H2TXbwGh+waU0SKHCtbLOwx3OAupd5gMsTB4M2h
 OKHy/VgNoPSu28vXqDciNu+qLvozg==
X-ME-Sender: <xms:NT9yWTMMyaQ1V1-K1yGpepsReX5wbDdXiTYc8W23eZjd6tlmGuzJgQ>
X-Sasl-enc: kISe+d8DOZbG8hx4ZQ27/+SZo2Nt0Spp2lIXFbqn7HXN 1500659508
Received: from keelia.aj.id.au (ppp118-210-176-216.bras2.adl6.internode.on.net
 [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2F8D97E1FC;
 Fri, 21 Jul 2017 13:51:46 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>, bradleyb@fuzziesquirrel.com,
 mspinler@linux.vnet.ibm.com, msbarth@linux.vnet.ibm.com,
 openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 1/5] dt-bindings: hwmon: pmbus: Add Maxim
 MAX31785 documentation
Date: Sat, 22 Jul 2017 03:21:27 +0930
Message-Id: <20170721175131.17840-2-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 21 Jul 2017 17:51:52 -0000
X-List-Received-Date: Fri, 21 Jul 2017 17:51:52 -0000

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 .../devicetree/bindings/hwmon/pmbus/max31785.txt   | 113 +++++++++++++++++++++
 1 file changed, 113 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/max31785.txt

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/max31785.txt b/Documentation/devicetree/bindings/hwmon/pmbus/max31785.txt
new file mode 100644
index 000000000000..d00cd5c12bb0
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/max31785.txt
@@ -0,0 +1,113 @@
+Bindings for the Maxim MAX31785 Intelligent Fan Controller
+==========================================================
+
+Reference:
+[1] https://datasheets.maximintegrated.com/en/ds/MAX31785.pdf
+
+Required properties:
+- compatible : One of "maxim,max31785" or "maxim,max31785a"
+- reg        : I2C address, one of 0x52, 0x53, 0x54, 0x55.
+
+Capabilities are configured through subnodes of the controller's node.
+
+Fans
+----
+
+Only fans with subnodes present will be marked as installed.
+
+Required subnode properties:
+- compatible             : Must be "pmbus-fan"
+- page                   : The PMBus page the properties apply to.
+- maxim,fan-rotor-input  : The type of rotor measurement provided to the
+                           controller. Must be either "tach" for tachometer
+                           pulses or "lock" for a locked-rotor signal.
+- maxim,fan-lock-polarity: Required iff maxim,fan-rotor-input is "lock". Valid
+                           values are "low" for active low, "high" for active
+                           high.
+
+Optional subnode properties:
+- fan-mode               : "rpm" or "pwm". Default value is "pwm".
+- tach-pulses            : Tachometer pulses per revolution. Valid values are
+                           1, 2, 3 or 4. The default is 1.
+- maxim,fan-no-fault-ramp: Do not ramp the fan to 100% PWM duty on detecting a
+                           fan fault
+- maxim,fan-startup      : The number of rotations required before taking
+                           emergency action for an unresponsive fan and driving
+                           it with 100% or 0% PWM duty, depending on the state
+                           of maxim,fan-no-fault-ramp. Valid values are 0
+                           (automatic spin-up disabled), 2, 4, or 8. Default
+                           value is 0.
+- maxim,fan-health       : Enable automated fan health check
+- maxim,fan-ramp         : Configures how fast the device ramps the PWM duty
+                           cycle from one value to another. Valid values are 0
+                           to 7 inclusive, with values 0 - 2 configuring a
+                           1000ms update rate and 1 - 3% duty respective duty
+                           increase, and 3 - 7 a 200ms update rate with a 1 -
+                           5% respective duty increase. Default value is 0.
+- maxim,fan-no-watchdog  : Do not ramp fan to 100% PWM duty on failure to
+                           update desired fan rate inside 10s. This implies
+                           maxim,tmp-no-fault-ramp
+- maxim,tmp-no-fault-ramp: Do not ramp fan to 100% PWM duty on temperature
+                           sensor fault detection. This implies
+                           maxim,fan-no-watchdog
+- maxim,tmp-hysteresis   : The temperature hysteresis used to determine
+                           transitions to lower fan speed bands in the
+                           temperature/fan rate lookup table. Valid values are
+                           2, 4, 6 or 8 (degrees celcius). Default value is 2.
+- maxim,fan-dual-tach    : Enable dual tachometer functionality
+- maxim,fan-pwm-freq     : The PWM frequency. Valid values are 30, 50, 100, 150
+                           and 25000 (Hz). Default value is 30Hz.
+- maxim,fan-lookup-table : A 16-element cell array of alternating temperature
+                           and rate values representing the look up table. The
+                           rate units are set through the fan-mode property.
+- maxim,fan-fault-pin-mon: Ramp fans to 100% PWM duty when the FAULT pin is
+                           asserted
+
+Temperature
+-----------
+
+Required subnode properties:
+- compatible    : Must be "pmbus-temperature"
+- page          : The PMBus page the properties apply to.
+
+Optional subnode properties:
+- maxim,tmp-offset      : Valid values are 0 - 30 (degrees celcius) inclusive.
+                          Default value is 0.
+- maxim,tmp-fans        : An array of fan indexes whose fans are controlled by
+                          the current temperature sensor. Fans are indexed from
+                          zero. The valid values are 0 - 5 inclusive.
+
+Example:
+	fan-max31785: max31785@52 {
+		reg = <0x52>;
+		compatible = "maxim,max31785";
+
+                fan@0 {
+                        compatible = "pmbus-fan";
+                        page = <0>;
+                        mode = "rpm";
+                        tach-pulses = <1>;
+                        maxim,fan-rotor-input = "tach";
+                        maxim,fan-dual-tach;
+                };
+
+                fan@1 {
+                        compatible = "pmbus-fan";
+                        page = <1>;
+                        mode = "rpm";
+                        tach-pulses = <1>;
+                        maxim,fan-rotor-input = "tach";
+                        maxim,tmp-hysteresis = <2>;
+                        maxim,fan-lookup-table = <
+                        /*  Temperature    RPM  */
+                                 0        1000
+                                10        2000
+                                20        3000
+                                30        4000
+                                40        5000
+                                50        6000
+                                60        7000
+                                70        8000
+                        >;
+                };
+	};
-- 
2.11.0
