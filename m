Return-Path: <jaghu@google.com>
Received: from mail-pf0-x233.google.com (mail-pf0-x233.google.com
 [IPv6:2607:f8b0:400e:c00::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v8tsF2gfxzDqKh
 for <openbmc@lists.ozlabs.org>; Fri, 27 Jan 2017 20:34:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="tJxqii6c"; 
 dkim-atps=neutral
Received: by mail-pf0-x233.google.com with SMTP id y143so72338357pfb.0
 for <openbmc@lists.ozlabs.org>; Fri, 27 Jan 2017 01:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IFGvtXSVTbJ5KV8IRVFm0kWYTiu0yE32i6BstH0XfzU=;
 b=tJxqii6c6iBishegBW5MhFQwAQtu+TPF3mx/S+QWf8PDmVYmNJC5px/iTDk+5Y1g3J
 MwmU7IR+zd2EPNBDn9gjQN5ed0fAQrrOP6WbhFkC4MBq0/jbhlrrUXUH+PxCkmrocqlq
 K8vL+Xb+BibBc/XVuGiIEvkAgV3PJRxVFKxlKk/q1LiUPoq9RDX4tDyuGlLeZzP6RfFB
 h4H/RSxevMR3CR5rsLkb7YG/zgt9LeCBCdvXoqHstyMGzNWGbbADC9LXs1Z1CxLQrDzq
 N6C1K+mOj07gysTtb8He6yDaNw5odTjgVUoE4IjiciWmKPfxflqtL78TU2YBUehPnV1K
 H/xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IFGvtXSVTbJ5KV8IRVFm0kWYTiu0yE32i6BstH0XfzU=;
 b=BMWpzzMXoTRHQ2Lm6TgPOZXOENwniv4J/oJs1e6UWn5jJRctOkQxf/yrQ4aEas6bnU
 XcefMgYahRnCb46x6kRkn/+KuycIRvsMHYRE8GBJScPye3s5OkqmDZhHDTnZ9OEWQEeT
 +cn/W4OxMtyf0oR20xDPMAClYK/ZQdhFVXEcsR4FlXzA2wJDr+JJ6fihB3ShW6wYH9dC
 IIspLLOuc060KmcHS1u00zfpGOk8KBcuvaZK8IgJnjTC5tWC9CBByzZdvyp06J6hNmJf
 BRXd+MUxdRX6pvDYCA38YYNXt90jkm9e7lQPO9PHNPsysR0RCRI2/weyi9CGQYmGrkZi
 TQdg==
X-Gm-Message-State: AIkVDXKpcUMJCNfPKm2otB1EdQomoVkZqguKZqJxI/HEaXE7280Dk6ja4puxGgiZ70ft4Oj7
X-Received: by 10.98.34.130 with SMTP id p2mr8033747pfj.11.1485509646167;
 Fri, 27 Jan 2017 01:34:06 -0800 (PST)
Received: from jaghu22.svl.corp.google.com ([100.123.242.38])
 by smtp.gmail.com with ESMTPSA id u75sm9542047pgc.31.2017.01.27.01.34.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 27 Jan 2017 01:34:05 -0800 (PST)
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
To: openbmc@lists.ozlabs.org, linux@roeck-us.net, joel@jms.id.au,
 jdelvare@suse.com, linux-hwmon@vger.kernel.org, corbet@lwn.net,
 linux-doc@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Subject: [PATCH linux v2 1/2] Documentation: dt-bindings: Document bindings
 for ASPEED AST2400/AST2500 PWM and Fan tach controller device driver
Date: Fri, 27 Jan 2017 01:33:59 -0800
Message-Id: <20170127093400.28904-2-jaghu@google.com>
X-Mailer: git-send-email 2.11.0.483.g087da7b7c-goog
In-Reply-To: <20170127093400.28904-1-jaghu@google.com>
References: <20170127093400.28904-1-jaghu@google.com>
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
X-List-Received-Date: Fri, 27 Jan 2017 09:34:10 -0000

This binding provides interface for adding values related to ASPEED
AST2400/2500 PWM and Fan tach controller support.
The PWM controller can support upto 8 PWM output ports.
The Fan tach controller can support upto 16 tachometer inputs.
Types M, N and 0 are three types just to have three independent
PWM/Fan Tach related settings.

Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
---
v2:
- Removed '_' in node or property names
- Gave some explanation for the properties used.

 .../devicetree/bindings/hwmon/aspeed-pwm-tacho.txt | 178 +++++++++++++++++++++
 1 file changed, 178 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt

diff --git a/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt b/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
new file mode 100644
index 000000000000..290122bfe170
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
@@ -0,0 +1,178 @@
+ASPEED AST2400/AST2500 PWM and Fan Tacho controller device driver
+
+The ASPEED PWM controller can support upto 8 PWM outputs. The ASPEED Fan Tacho
+controller can support upto 16 tachometer inputs.
+
+There are three different types M, N, O. These three types are just to have
+different PWM and Fan Tach settings. Each type can have the following settings:
+	PWM related:
+		1) PWM period
+		2) PWM clock division high
+		3) PWM clock division low
+	Fan Tach related:
+		1) Fan Tach type enable
+		2) Fan Tach clock division
+		3) Fan Tach mode selection
+		4) Fan Tach period
+
+Each PWM port should be assigned a type which can be type M, N or O.
+
+Each Fan Tach channel should be assigned a PWM source, which can be PWM port A
+through H. The Fan Tach channel implicitly gets the type (M, N or O), from the
+type assigned to its PWM source.
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
+- pinctrl-0 : phandle referencing pin configuration of the AST2400/AST2500 PWM
+	      ports.
+
+- compatible : should be "aspeed,aspeed2400-pwm-tacho" for AST2400 or
+	       "aspeed,aspeed2500-pwm-tacho" for AST2500.
+
+- clocks : a fixed clock providing input clock frequency(PWM
+	   and Fan Tach clock)
+
+type-values subnode format:
+===========================
+Under type-values subnode there can be upto 3 child nodes indicating type M/N/O
+values. Atleast one child node is required.
+
+Required properties for the child node(type M/N/O):
+- type : indicates type M/N/O. integer value in the range 0 to 2 with 0
+	 indicating type M, 1 indicating type N  and 2 indicating type O.
+
+- pwm-period : indicates type M/N/O PWM period, as per the AST2400/AST2500
+	       datasheet. integer value in the range 0 to 255.
+
+- pwm-clock-division-l : indicates type M/N/O PWM clock division L value,
+			 as per the AST2400/AST2500 datasheet.
+			 integer value in the range 0 to 15.
+			 0 here indicates divide 1, 1 indicates divide 2,
+			 2 indicates divide 4, 3 indicates divide 6, and so on
+			 till 15 indicates divide 30.
+
+- pwm-clock-division-h : indicates type M/N/O PWM clock division H value,
+			 as per the AST2400/AST2500 datasheet.
+			 integer value in the range 0 to 15.
+			 0 here indicates divide 1, 1 indicates divide 2,
+			 2 indicates divide 4, 3 indicates divide 8, and so on
+			 till 15 indicates divide 32768.
+
+- fan-tach-type-enable : indicates fan tach enable of type M/N/O as per the
+		         AST2400/AST2500 datasheet. boolean value.
+
+- fan-tach-clock-division : indicates fan tach clock division as per the
+			    AST2400/AST2500 datasheet.
+			    integer value in the range 0 to 7.
+			    0 indicates divide 4, 1 indicates divide 16,
+			    2 indicates divide 64, 3 indicates divide 256
+			    and so on till 7 indicates divide 65536.
+
+- fan-tach-mode-selection : indicates fan tach mode mode selection as per the
+			    AST2400/AST2500 datasheet. integer value in the
+			    range 0 to 2. 0 indicates falling edge, 1 indicates
+			    rising edge and 2 indicates both edges.
+
+- fan-tach-period : indicates fan tach period as per the AST2400/AST2500
+		    datasheet. integer value (can be upto 16 bits long).
+
+pwm-port subnode format:
+========================
+Under pwm-port subnode there can upto 8 child nodes each indicating values
+for one of the 8 PWM output ports.
+
+Required properties for each child node(starting from PWM A through PWM H):
+- pwm-port : should specify PWM #X port , X ranges from A through H.
+	     integer value in the range 0 to 7 with 0 indicating PWM port
+	     A and 7 indicating PWM port H.
+
+- type : indicates type selection value of PWM port. integer value in the
+	 range 0 to 2; 0 indicates type M, 1 indicates type N, 2 indicates
+	 type O.
+
+- fan-ctrl : set the PWM duty cycle initial value. integer value between
+	     0(off) and 255(full speed).
+
+fan-tach-channel subnode format:
+================================
+Under fan-tach-channel subnode there can be upto 16 child nodes each indicating
+values for one of the 16 fan tach channels.
+
+Required properties for each child node(starting from fan tach #0 through
+fan tach #15):
+- fan-ctrl-gpios : should specify the tachometer input GPIO pin on the hardware.
+		   Fan Tachometer function can only work when GPIO is in
+		   ”input mode”
+
+- fan-tach : should specify the fan tach channel #X, X ranges from 0 through
+	     15. integer value in the range 0 through 15.
+
+- pwm-source : indicates PWM source of the fan tach channel. integer value in
+	       the range 0 to 7. 0 indicates PWM port A, 1 indicates PWM
+	       port B and so on till 7 indicates PWM port H.
+
+Examples:
+
+pwm-tacho-fixed-clk: fixedclk {
+	compatible = "fixed-clock";
+	#clock-cells = <0>;
+	clock-frequency = <24000000>;
+}
+
+pwm-tacho: pwm-tacho-controller@1e786000 {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	reg = <0x1E786000 0x1000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default>;
+	compatible = "aspeed,aspeed2500-pwm-tacho";
+	clocks = <&pwm-tacho-fixed-clk>;
+	type-values {
+		typem {
+			type = /bits/ 8 <0x00>;
+			pwm-period = /bits/ 8 <0x5F>;
+			pwm-clock-division-h = /bits/ 8 <0x00>;
+			pwm-clock-division-l = /bits/ 8 <0x05>;
+			fan-tach-type-enable;
+			fan-tach-clock-division = /bits/ 8 <0x00>;
+			fan-tach-mode-selection = /bits/ 8 <0x00>;
+			fan-tach-period = /bits/ 16 <0x1000>;
+		};
+	};
+
+	pwm-port {
+		pwm-port0 {
+			pwm-port = /bits/ 8 <0x00>;
+			type = /bits/ 8 <0x00>;
+			fan-ctrl = /bits/ 8 <0xFF>;
+		};
+
+		pwm-port1 {
+			pwm-port = /bits/ 8 <0x01>;
+			type = /bits/ 8 <0x00>;
+			fan-ctrl = /bits/ 8 <0xFF>;
+		};
+        };
+
+	fan-tach-channel {
+		fan-tach0 {
+			fan-ctrl-gpios = <&gpio ASPEED_GPIO(O, 0) GPIO_ACTIVE_HIGH>;
+			fan-tach = /bits/ 8 <0x00>;
+			pwm-source = /bits/ 8 <0x00>;
+		};
+
+		fan-tach1 {
+			fan-ctrl-gpios = <&gpio ASPEED_GPIO(O, 1) GPIO_ACTIVE_HIGH>;
+			fan-tach = /bits/ 8 <0x01>;
+			pwm-source = /bits/ 8 <0x01>;
+		};
+
+	};
+};
--
2.11.0.483.g087da7b7c-goog
