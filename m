Return-Path: <jaghu@google.com>
Received: from mail-pg0-x22a.google.com (mail-pg0-x22a.google.com
 [IPv6:2607:f8b0:400e:c05::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vg6cT0p4ZzDqXc
 for <openbmc@lists.ozlabs.org>; Sat, 11 Mar 2017 12:54:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="odzNrAVv"; 
 dkim-atps=neutral
Received: by mail-pg0-x22a.google.com with SMTP id 25so44937287pgy.0
 for <openbmc@lists.ozlabs.org>; Fri, 10 Mar 2017 17:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BpplqzoAafGSDP5Yujow0JoNlqlZi+gDijFG5DulOIc=;
 b=odzNrAVv+3iFaNVkZW8m6R5kgfLWjh4eq90xZVb/kerGXnk9mQVJ7LQj2JMJBYa55x
 XT+4rqkXv1nJQwI5h39Ww1HxCLOIS5LmGIGNSQs41wT5QkCFkVy6raeGm3eCO/BZiAPa
 onKGs+86kUb/GA4/Yix1rHQAXxswSoYEhkUYeYodfbILsFVq6CAkO+Z56z29IwTr/HD0
 RCDJR2tMQXXm0SR7jsKRpgIOgsHUOwtp+H3/v0vWHGQXQI8z3/xVK2m0aPwhDJAv0oYL
 TQsp4WdGDFb7OQlaf4SQTCVg+pwILPcGcabAoQ+WWFNCtlafTF9tB+Iv0d7AnK1swVYk
 BLjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BpplqzoAafGSDP5Yujow0JoNlqlZi+gDijFG5DulOIc=;
 b=fNrCJFzD/9EqTIzSoFbvnoSg4Oq1kbcuJq2xFaS5OLQF0x2EhAFP4nzoIUIzLHkx4M
 uTvfAL7OEM/JZHem4zgrXJsHtS2cX5tZ9ez7q8x22l+0mgdSKwsITBWWGnBqqbodg1Bu
 E8X4dpD1CJHQMIHPz2ABGA+34idtKb7QAVzT8TLwNTNfsM7FMIeGwR7dQHdLEh7bofkr
 sxYjFxmHs3gqK3teSyuUdAyBEdkwSIhY0U+U/TNU6qi/GNdAZU2NPatvomS5Ts8MY3sg
 1OnSATK45BfSAwbMz/dQUiQO43Vrqr9wwkxyHr8qnTDJbh/xq7HTe7R42S2QPivpLn5v
 ygfA==
X-Gm-Message-State: AMke39kG8nqTN8v4ROoZCnYTYMLsNe6baP8Up6jwQQaep73rT7wNS4Wv5GUMblWQOjp1uaQ+
X-Received: by 10.99.98.6 with SMTP id w6mr23736025pgb.223.1489197238164;
 Fri, 10 Mar 2017 17:53:58 -0800 (PST)
Received: from jaghu22.svl.corp.google.com ([100.123.242.38])
 by smtp.gmail.com with ESMTPSA id w131sm20818216pfd.34.2017.03.10.17.53.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 10 Mar 2017 17:53:57 -0800 (PST)
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
To: joel@jms.id.au, jdelvare@suse.com, linux@roeck-us.net,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, corbet@lwn.net, linux-doc@vger.kernel.org,
 robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Subject: [PATCH linux v4 1/2] Documentation: dt-bindings: Document bindings
 for ASPEED AST2400/AST2500 PWM and Fan tach controller device driver
Date: Fri, 10 Mar 2017 17:53:50 -0800
Message-Id: <20170311015351.23092-2-jaghu@google.com>
X-Mailer: git-send-email 2.12.0.246.ga2ecc84866-goog
In-Reply-To: <20170311015351.23092-1-jaghu@google.com>
References: <20170311015351.23092-1-jaghu@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Sat, 11 Mar 2017 01:54:01 -0000

This binding provides interface for adding values related to ASPEED
AST2400/2500 PWM and Fan tach controller support.
The PWM controller can support upto 8 PWM output ports.
The Fan tach controller can support upto 16 tachometer inputs.

Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
---
 v4:
- Used 'reg'

 v3:
- Made the structure more common

 v2:
- Removed '_' in node and property names
- Gave some explanation for the properties used

 .../devicetree/bindings/hwmon/aspeed-pwm-tacho.txt | 86 ++++++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt

diff --git a/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt b/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
new file mode 100644
index 000000000000..0dfd2841ace3
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
@@ -0,0 +1,86 @@
+ASPEED AST2400/AST2500 PWM and Fan Tacho controller device driver
+
+The ASPEED PWM controller can support upto 8 PWM outputs. The ASPEED Fan Tacho
+controller can support upto 16 Fan tachometer inputs.
+
+There can be upto 8 fans supported. Each fan can have one PWM output and
+one/two Fan tach inputs.
+
+Required properties for pwm-tacho node:
+- #address-cells : should be 1.
+
+- #size-cells : should be 1.
+
+- reg : address and length of the register set for the device.
+
+- pinctrl-names : a pinctrl state named "default" must be defined.
+
+- pinctrl-0 : phandle referencing pin configuration of the PWM ports.
+
+- compatible : should be "aspeed,aspeed2400-pwm-tacho" for AST2400 or
+	       "aspeed,aspeed2500-pwm-tacho" for AST2500.
+
+- clocks : a fixed clock providing input clock frequency(PWM
+	   and Fan Tach clock)
+
+fan subnode format:
+===================
+Under fan subnode there can upto 8 child nodes, with each child node
+representing a fan. If there are 8 fans each fan can have one PWM port and
+one/two Fan tach inputs.
+
+Required properties for each child node:
+- reg : should specify PWM source port.
+	integer value in the range 0 to 7 with 0 indicating PWM port A and
+	7 indicating PWM port H.
+
+  Atleast one tach subnode is required. Each tach subnode represents a fan
+  tach input.
+  tach subnode format:
+  --------------------
+  Required properties for each child node:
+  - fan-ctrl-gpios : should specify the tachometer input GPIO pin on the hardware.
+             	     Fan Tachometer function can only work when GPIO is in
+		     ”input mode”.
+
+  - fan-tach-ch : should specify the Fan tach input channel.
+	          integer value in the range 0 through 15, with 0 indicating
+		  Fan tach channel 0 and 15 indicating Fan tach channel 15.
+
+Examples:
+
+pwmtachofixedclk: fixedclk {
+	compatible = "fixed-clock";
+	#clock-cells = <0>;
+	clock-frequency = <24000000>;
+}
+
+pwmtacho: pwmtachocontroller@1e786000 {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	reg = <0x1E786000 0x1000>;
+	compatible = "aspeed,aspeed2500-pwm-tacho";
+	clocks = <&pwmtachofixedclk>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default>;
+
+	fan0 {
+		reg = /bits/ 8 <0x00>;
+		tach0 {
+			fan-ctrl-gpios = <&gpio ASPEED_GPIO(O, 0) GPIO_ACTIVE_HIGH>;
+			fan-tach-ch = /bits/ 8 <0x00>;
+		};
+	};
+
+	fan1 {
+		reg = /bits/ 8 <0x01>;
+		tach0 {
+			fan-ctrl-gpios = <&gpio ASPEED_GPIO(O, 1) GPIO_ACTIVE_HIGH>;
+			fan-tach-ch = /bits/ 8 <0x01>;
+		};
+		tach1 {
+			fan-ctrl-gpios = <&gpio ASPEED_GPIO(O, 2) GPIO_ACTIVE_HIGH>;
+			fan-tach-ch = /bits/ 8 <0x02>;
+		};
+	};
+};
--
2.12.0.246.ga2ecc84866-goog
