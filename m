Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="IGU5mbuu"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="kb3mkvWj"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yWLhl3Mn1zDrK8
 for <openbmc@lists.ozlabs.org>; Tue,  7 Nov 2017 18:31:35 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3BD5620D73;
 Tue,  7 Nov 2017 02:31:32 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Tue, 07 Nov 2017 02:31:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=nVkWsl/4kjaBS87OH
 x+wWJ+CwIHzExGevx08/VsMwJ8=; b=IGU5mbuuyvt2GX/v/c+dk8uNxDZwJeGGn
 ramlAShJNv2WpT7ZhXlFlifWJcK07iazxO0RmkMobXPZtFAh1fiEi/VZmbimZLCU
 i+3cxLEAnlmZZviHHHhiBChw/z9cY8YakC6Zs5tSC56WSHcKGSyh4VbX9GqXuts6
 Mn5XFTslb72aO9u9ooS6egKc0Fyo1gbwi6lyhUISqrw8VnRfS8ebFixrhNO1rcGU
 Nzh6jRk25TVfOkRFLZMskMuqlUkwaIal13wZfkVUGGuJS9gdDyCYi+mGPSnfuTd6
 Ipc/RQf5yuOgRJ9/TT+qGOyTcjLiFwrAYFyAQPnYB2ILYDqL1ATCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=nVkWsl/4kjaBS87OHx+wWJ+CwIHzExGevx08/VsMwJ8=; b=kb3mkvWj
 5035q5h7wWRZ4WW79AYALsmr88Z+GNYZKYHqwZzutu+dN+Gcwcknm+mhNW6mrd0S
 lVCa6VNkesxU7hceOGQ/tQSABA6PkKiFwTpZ5uZ6LMY6te3g3nqxXMVguE8KYIq3
 WeF6Gn2S+3K0k948Gb2rStiVKaa4JeE0ycoTWNwR+KBOk9U16rjig7Yn/Y37pkdN
 39OqquHLv8GCVw4gAJhiiUBpGjG7SQCHVOgKR7I3K6l263BNU1FPIT6porvKsoOM
 shdDz0R53HdSqUS03NCT0A/+y+hAZIStr8w5hr9rfqI6txBrnRqwkASxoyYrkbNk
 73T61tWcMwKnTw==
X-ME-Sender: <xms:VGEBWpvbt_gWqzWRvmuA8eHdzTtYxrR7ljMjDm-T3rQEudrxSxm2Ng>
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2B48824108;
 Tue,  7 Nov 2017 02:31:30 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13 03/23] dt-bindings: hwmon: pmbus: Add Maxim
 MAX31785 documentation
Date: Tue,  7 Nov 2017 18:00:26 +1030
Message-Id: <20171107073046.13319-4-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20171107073046.13319-1-andrew@aj.id.au>
References: <20171107073046.13319-1-andrew@aj.id.au>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Nov 2017 07:31:36 -0000

OpenBMC-Staging-Count: 1
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 .../devicetree/bindings/hwmon/pmbus/max31785.txt   | 123 +++++++++++++++++++++
 1 file changed, 123 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/max31785.txt

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/max31785.txt b/Documentation/devicetree/bindings/hwmon/pmbus/max31785.txt
new file mode 100644
index 000000000000..7d9fc31a829d
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/max31785.txt
@@ -0,0 +1,123 @@
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
+Optional properties:
+- use-stored-presence    : Do not treat the devicetree description as canon for
+                           fan presence (the 'installed' bit of FAN_CONFIG_*).
+                           Instead, rely on the on the default value store of
+                           the device to populate it.
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
