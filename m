Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xJ6qF1Ct6zDrH2
 for <openbmc@lists.ozlabs.org>; Thu, 27 Jul 2017 19:58:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="ZlOwdyp7"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="XQqSnJog"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 064A2208E9;
 Thu, 27 Jul 2017 05:57:59 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 27 Jul 2017 05:57:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=Qm6FSZ
 o8ibVuHyj92sqzUm+zQtGawmUgl+KKvlZphqM=; b=ZlOwdyp7KkryiRko4ZRElj
 5A/d7fHe25/7nAzg6tEeo7aMk64xFZmSsb0tFN8XrZcIzt1MC1D+6s7L5jkMdqsk
 gtwWxQFCDk3F7uYNx7gTNxhEiLXpaOpR/vnDAVh8nCIq/LCS8+nqWYxbVxoqiefG
 Dk4fi06m5/QJm3J+3qdWoAJl/DBIwSKY8NQnGIp/vWdOza705X4/zY7jw76t0JoX
 JBqar9sCaaP7MM8TSi/5L8+rMrRiBmY6jl7Km5AidPwDeHDmcbF+KXJKASA/rwUx
 AAQRMEPgUlk7V8bUyWZ1ZFJQyJ1RQpNHiPVAp2ourBoY7VNfo6vGKjoTstbgi5OQ
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=Qm6FSZo8ibVuHyj92sqzUm+zQtGawmUgl+KKvlZph
 qM=; b=XQqSnJoghXCSLrEaFcQYrrBY9LIl32IvyH6Ss72Hv9b8dquymBFlKDF0m
 TT/zb4XvHjOzyfU2kEplw90+Pekt+zhEio5woU7/99Wo0P8xQpgd87FBadOKS57R
 yPHqXoA+uD2GJbSPXaE1A20akRewnP5Ah4tQDhzw/m7wOAsfUFFm/dGHZ+tsp404
 3WqYzv3pXYMDsSktqX2ualUfgslbQFCYnSlhu5Ex2j2YC4DtLTVT+jINPXa3XqMa
 2PnAxkWCtkzpLuAsOehY84LjsPjpMwnwUvRawpsPHlwifqKArDgt+NPydXujmRvT
 GSMNXJ/TPJ7DLIrW6liXS2YCWm15w==
X-ME-Sender: <xms:Jrl5Wbj8aFukpbBnv4TYXi4kW70w-kBxmkOVfTAlpgYyuvZihbp1Jw>
X-Sasl-enc: M5lCNamrdG5lxnznhZor+2s6E9bkVCbfPjPTGAhewPRC 1501149478
Received: from keelia.aj.id.au (ppp118-210-176-216.bras2.adl6.internode.on.net
 [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id 878FD24407;
 Thu, 27 Jul 2017 05:57:56 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>, msbarth@linux.vnet.ibm.com,
 mspinler@linux.vnet.ibm.com, bradleyb@fuzziesquirrel.com,
 openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 v2 1/8] dt-bindings: hwmon: pmbus: Add Maxim
 MAX31785 documentation
Date: Thu, 27 Jul 2017 19:27:10 +0930
Message-Id: <20170727095717.25479-2-andrew@aj.id.au>
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
X-List-Received-Date: Thu, 27 Jul 2017 09:58:01 -0000

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 .../devicetree/bindings/hwmon/pmbus/max31785.txt   | 117 +++++++++++++++++++++
 1 file changed, 117 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/max31785.txt

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/max31785.txt b/Documentation/devicetree/bindings/hwmon/pmbus/max31785.txt
new file mode 100644
index 000000000000..96e705434a59
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/max31785.txt
@@ -0,0 +1,117 @@
+Bindings for the Maxim MAX31785 Intelligent Fan Controller
+==========================================================
+
+Reference:
+[1] https://datasheets.maximintegrated.com/en/ds/MAX31785.pdf
+
+Required properties:
+- compatible     : One of "maxim,max31785" or "maxim,max31785a"
+- reg            : I2C address, one of 0x52, 0x53, 0x54, 0x55.
+- #address-cells : Must be 1
+- #size-cells    : Must be 0
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
+- reg                    : The PMBus page the properties apply to.
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
+- reg           : The PMBus page the properties apply to.
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
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                fan@0 {
+                        compatible = "pmbus-fan";
+                        reg = <0>;
+                        mode = "rpm";
+                        tach-pulses = <1>;
+                        maxim,fan-rotor-input = "tach";
+                        maxim,fan-dual-tach;
+                };
+
+                fan@1 {
+                        compatible = "pmbus-fan";
+                        reg = <1>;
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
