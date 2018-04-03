Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="P1+Ugwkv"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="MdAsss7m"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40Fryw1WplzF257
 for <openbmc@lists.ozlabs.org>; Wed,  4 Apr 2018 00:27:36 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C9DFC21A1C;
 Tue,  3 Apr 2018 10:27:33 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 03 Apr 2018 10:27:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=CVPP6KZsyOVWc56Q+
 N16ZDvhG+iDx66+RHR6C9TIAoI=; b=P1+UgwkvAn9CwPCzmj8U8dtcVMPaKqs5H
 HwuFPUKNtC1wJdYmowaw2B9cJ2U5KY0hQ4pBT0BRfCXdRuML/OKEq5YpDDHphguQ
 m6tSbadOCdTSoij/cYyhRzPQrbu6gA/nyp9EXPH5E5/zElQ7fOAhsiDC85IgYI+L
 GBd4bOH5RutBl0dgKY8MaM6nWsfEcDo9yohbhT05lOteUpQYt/pxqdmV9W6maHu/
 A26Fm1fPOveiyWuUqdsK8RIFNbBr0WmMlTUsyVPQObnBB83s1qzmrKQ8beBtLUp3
 CduB5uj9o3iFEoLJca3YMdlUahIqfPFDzKx3yxZ+loIrpv8c50vag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=CVPP6KZsyOVWc56Q+N16ZDvhG+iDx66+RHR6C9TIAoI=; b=MdAsss7m
 OMEPt8OaK1UesOim+ZNwxvP9BerpPio9A3s02i6ZN/O+r5jLm4rm4+3jV/OfxQKr
 BWWO8WhAAv4Pj5Zzc+WhIb8TcfCuf24iyATvx1j0Ols3tHCZeQc15uASYVrepc0h
 EbRfaDegZp3QKEf+vl+Kqg1Cdp9j+g3XmJ7HkJkSQLW82sJbHbhq8HGZxsrgxjA9
 xs8Hka+4390TfJfx6ngyTH/wg3JI84WBl2VPBBxA4mF02avsvzPTsb6LdxoJU26W
 1hKLq1rD/UV6Ob3vicdBFeCjqg3f0CPnhprcjWMnzQsz4SUwUlLWgO8zPcCX3s+i
 IEMq8eweoSjEyA==
X-ME-Sender: <xms:VY_DWrHKTL8PcGr4qoBptfnG-m3hAfpp2K1cfa9PZ0RGNEFG0oNbAw>
Received: from dave.aj.id.au (202-161-9-32.dyn.iinet.net.au [202.161.9.32])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0DBA710251;
 Tue,  3 Apr 2018 10:27:31 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13 1/5] dt-bindings: hwmon: pmbus: Add Maxim
 MAX31785 documentation
Date: Tue,  3 Apr 2018 23:56:51 +0930
Message-Id: <20180403142655.16681-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180403142655.16681-1-andrew@aj.id.au>
References: <20180403142655.16681-1-andrew@aj.id.au>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Apr 2018 14:27:38 -0000
X-List-Received-Date: Tue, 03 Apr 2018 14:27:38 -0000
X-List-Received-Date: Tue, 03 Apr 2018 14:27:38 -0000

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
2.14.1
