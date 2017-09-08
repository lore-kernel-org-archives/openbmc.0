Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="bM5MVPJo"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="cUp6wOAg"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xpPkS1CvMzDqR8
 for <openbmc@lists.ozlabs.org>; Fri,  8 Sep 2017 14:40:00 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 02EC120BFB;
 Fri,  8 Sep 2017 00:39:58 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Fri, 08 Sep 2017 00:39:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=KoYjDx
 s13UIbroALTMsvHG4CKwn091z4Ys6237spqeE=; b=bM5MVPJoF/p6mt2qA77Kje
 O38odur6+W8vJFR3cJoIpYtv7Df0njL7qV4JUahSXYKgo0qVeUwstXuz4xNCxxQK
 FwLn05LkVXFyU9MPqmu0q24mqU9witYp74f0ES3b1ifQLCuUequwISeFLj//2SiP
 COnAbThkFVskQh1UAwN5OIHj7Wu7e8JhkeFxCCMPUFqnIeIJlms1I2AjZolKTh6v
 foSjzuXHBpZ5hvoUD720s4dyT7PfFBJKfT1MVNg2jqpaZnjehiNBoKJjzAgp1nNs
 jcayPoDyrLq5QxvGeYqw1Kxy6ENQcN9JGqz/lkBhI1+ImkB9LPh99nfe5zp/E95w
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=KoYjDxs13UIbroALTMsvHG4CKwn091z4Ys6237spq
 eE=; b=cUp6wOAgfiHjhFhXs4IY7mSqkdha+3x5Auw3IIyF/x6E8QvsSJdPyUP7k
 be1QOzcOuWtTl1ehUQnvHYXUBMqWppN5a5Boq14Ls/IVlrHDA02EmuAyp4WI+h9O
 xamrzfWBoPLY4F4vmpNojbmkT0KpVZo3DDeZ1lcyePzSI/HUFX/2HM9aunWmIP38
 t/HOKIsEGKhieN79xH7gyjKuDr9lAEWqdcBBmZZ7w79ZlGhCs3PiMKkBlHFWLrEY
 T+x+/yeRY69ykYVfVzmv2IvD+6b0qjx5fMudM7cA25vWO7tqF00uSupoVBmYIE+4
 4lrrFoUz5ZrOVag8k2NDhaqeJjvXg==
X-ME-Sender: <xms:HR-yWT8RU-qQd4dqd0LBlrV8a0JVBK3YuHxz4wUVp7GESJ6OUwsflQ>
X-Sasl-enc: jNB4QclHe/Hf0BbifmUiUzE2SFe40bTEkaP6UmnASvRe 1504845597
Received: from keelia.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7E9BA7E426;
 Fri,  8 Sep 2017 00:39:54 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, robh+dt@kernel.org, mark.rutland@arm.com,
 jdelvare@suse.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, joel@jms.id.au, mspinler@linux.vnet.ibm.com,
 msbarth@linux.vnet.ibm.com, openbmc@lists.ozlabs.org
Subject: [PATCH v3 1/3] dt-bindings: hwmon: pmbus: Add Maxim MAX31785
 documentation
Date: Fri,  8 Sep 2017 14:39:17 +1000
Message-Id: <20170908043919.6924-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170908043919.6924-1-andrew@aj.id.au>
References: <20170908043919.6924-1-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 08 Sep 2017 04:40:00 -0000

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 .../devicetree/bindings/hwmon/pmbus/max31785.txt   | 158 +++++++++++++++++++++
 1 file changed, 158 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/max31785.txt

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/max31785.txt b/Documentation/devicetree/bindings/hwmon/pmbus/max31785.txt
new file mode 100644
index 000000000000..af9578e7742c
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/max31785.txt
@@ -0,0 +1,158 @@
+Bindings for the Maxim MAX31785 Intelligent Fan Controller
+==========================================================
+
+Reference:
+
+https://datasheets.maximintegrated.com/en/ds/MAX31785.pdf
+
+Required properties:
+- compatible     : One of "maxim,max31785" or "maxim,max31785a"
+- reg            : I2C address, one of 0x52, 0x53, 0x54, 0x55.
+- #address-cells : Must be 1
+- #size-cells    : Must be 0
+- #thermal-sensor-cells  : Should be 1. The device supports:
+                           - One internal sensor
+                           - Four external I2C digital sensors
+                           - Six external thermal diodes
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
+Only fans with subnodes present will be considered as installed. If
+use-stored-presence is present in the parent node, then only fans that are both
+defined in the devicetree and have their installed bit set are considered
+installed.
+
+Required subnode properties:
+- compatible             : Must be "pmbus-fan"
+- reg                    : The PMBus page the properties apply to.
+- #cooling-cells         : Should be 2. See the thermal bindings at [1].
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
+- cooling-min-level      : Smallest cooling state accepted. See [1].
+- cooling-max-level      : Largest cooling state accepted. See [1].
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
+- maxim,tmp-fans        : An array of phandles to fans controlled by the
+                          current temperature sensor.
+
+[1] Documentation/devicetree/bindings/thermal/thermal.txt
+
+Example:
+	fan-max31785: max31785@52 {
+		reg = <0x52>;
+		compatible = "maxim,max31785";
+                #address-cells = <1>;
+                #size-cells = <0>;
+                #thermal-sensor-cells = <1>;
+
+                fan@0 {
+                        compatible = "pmbus-fan";
+                        reg = <0>;
+                        mode = "rpm";
+                        tach-pulses = <1>;
+
+                        #cooling-cells = <2>;
+                        cooling-min-level = <0>;
+                        cooling-max-level = <9>;
+
+                        maxim,fan-rotor-input = "tach";
+                        maxim,fan-dual-tach;
+                };
+
+                /*
+                 * Hardware controlled fan: Fan speed is controlled by a
+                 * temperature sensor feeding values into the lookup table. The
+                 * fan association is done in the temperature sensor node. One
+                 * sensor can drive multiple fans.
+                 */
+                cpu_fan: fan@1 {
+                        compatible = "pmbus-fan";
+                        reg = <1>;
+                        mode = "rpm";
+                        tach-pulses = <1>;
+
+                        #cooling-cells = <2>;
+
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
+
+                cpu_temp: sensor@6 {
+                        compatible = "pmbus-temperature";
+                        reg = <6>;
+
+                        maxim,tmp-offset = <0>;
+                        maxim,tmp-fans = <&cpu_fan>;
+                };
+	};
-- 
2.11.0
