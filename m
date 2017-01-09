Return-Path: <jaghu@google.com>
Received: from mail-pf0-x22e.google.com (mail-pf0-x22e.google.com
 [IPv6:2607:f8b0:400e:c00::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ty8Fr5SV7zDqHs
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 08:59:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Ldev6kqE"; 
 dkim-atps=neutral
Received: by mail-pf0-x22e.google.com with SMTP id f144so24653725pfa.2
 for <openbmc@lists.ozlabs.org>; Mon, 09 Jan 2017 13:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=JvLvGOfeBboIx8KnL/1Pns4c2gFq3TrWvTRjPWyI68g=;
 b=Ldev6kqER96rKWC2drOvnN+1qOjqi6NARrMC4tu+Eud/EvmI046MVVqZIyzK8ROn+N
 4sbSvzzxDqWb/D78bePHberWmIQ//+yHKGJZAyxzFUzcIw0BMKmP0DzsPxk4N6u/+xqR
 sSjGcKU++J9JTyY7DCiKtCuyIlousKnznJnamPX+giK5SOLaAAx7KHVmWX23OlCsQZZR
 8jF53WKHltt0ixqg2+avu6W+7JaC7o5T6y7ey5bDxsHKg5Ho8vGWZLTaLh1lxjvejDuG
 a56nLDXJA+vfF4p0Lr7gCNEnIM8KvoQL+/ofIrQB7pUeozKmQeQgOdxWl+2CY/hBDFmL
 RzPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=JvLvGOfeBboIx8KnL/1Pns4c2gFq3TrWvTRjPWyI68g=;
 b=CgrIWSFuS9ImjysadH8cke+XGFZM7/Nm9Uo2EhL//5wY6IcXGjPneKfcbTGKB3T1iD
 BHRWJeI1XhoMBsR2HuYH2CrUoaOh42ft1mWALdIo9xC9tjuygjcCXdtCtNC7ahsvgs3j
 m/dg6evZuaUz1ssoNnlWRIjut65szZKBWFqN8cMA0U05sHPTugh4kkSzOTU4PR3cGflB
 D1PSRd2AepIFq/ZuknDtZ8rjN0I29GoiqLmdXHdZaCTI7RWLXeVV8Eq+7WCRciEC/MGc
 375keWEZNAJ3KyJ2JYcbNOdxJxkN+14up48PB9SbR2TM7OraSpEtZQQp4J6e3OJJCue5
 SQkQ==
X-Gm-Message-State: AIkVDXIf5/qKUspM4voN74pkw+SSDQzh0CxwXfraud8bmaXzzWvPvl8YuBWZFn0aotfhwLJl
X-Received: by 10.84.232.78 with SMTP id f14mr8648018pln.27.1483999182724;
 Mon, 09 Jan 2017 13:59:42 -0800 (PST)
Received: from jaghu22.svl.corp.google.com ([100.123.242.38])
 by smtp.gmail.com with ESMTPSA id p67sm181823046pfb.2.2017.01.09.13.59.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 09 Jan 2017 13:59:41 -0800 (PST)
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
To: openbmc@lists.ozlabs.org, joel@jms.id.au, jdelvare@suse.com,
 linux@roeck-us.net, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, corbet@lwn.net, linux-doc@vger.kernel.org,
 robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Subject: [PATCH linux v1 1/2] Documentation: dt-bindings: Document bindings
 for ASPEED AST2400/AST2500 pwm and fan tach controller device driver
Date: Mon,  9 Jan 2017 13:59:34 -0800
Message-Id: <20170109215935.30067-2-jaghu@google.com>
X-Mailer: git-send-email 2.11.0.390.gc69c2f50cf-goog
In-Reply-To: <20170109215935.30067-1-jaghu@google.com>
References: <20170109215935.30067-1-jaghu@google.com>
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
X-List-Received-Date: Mon, 09 Jan 2017 21:59:45 -0000

This binding provides interface for adding values related to ASPEED
AST2400/2500 PWM and Fan tach controller support.
The PWM controller can support upto 8 PWM output ports.
The Fan tach controller can support upto 16 tachometer inputs.
PWM clock types M, N and 0 are three types just to have three independent
PWM sources.

Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
---
 .../devicetree/bindings/hwmon/aspeed-pwm-tacho.txt | 153 +++++++++++++++++++++
 1 file changed, 153 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt

diff --git a/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt b/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
new file mode 100644
index 000000000000..8f346409ee8c
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
@@ -0,0 +1,153 @@
+ASPEED AST2400/AST2500 PWM and Fan Tacho controller device driver
+
+The ASPEED PWM controller can support upto 8 PWM outputs. The ASPEED Fan Tacho
+controller can support upto 16 tachometer inputs. The PWM controller supports
+3 types of frequency mode PWM for fan speed control. PWM clock types M, N and 0
+are 3 types of frequency mode PWM just to have 3 independent PWM sources.
+
+Required properties for pwm_tacho node:
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
+type_values subnode format:
+===========================
+Under type_values subnode there can be upto 3 child nodes indicating type M/N/O
+values. Atleast one child node is required.
+
+Required properties for the child node(type M/N/O):
+- pwm_period : indicates type M/N/O PWM period, as per the AST2400/AST2500
+	       datasheet. integer value in the range 0 to 255.
+
+- pwm_clock_division_l : indicates type M/N/O PWM clock division L value,
+			 as per the AST2400/AST2500 datasheet.
+			 integer value in the range 0 to 15.
+			 0 here indicates divide 1, 1 indicates divide 2,
+			 2 indicates divide 4, 3 indicates divide 6, and so on
+			 till 15 indicates divide 30.
+
+- pwm_clock_division_h : indicates type M/N/O PWM clock division H value,
+			 as per the AST2400/AST2500 datasheet.
+			 integer value in the range 0 to 15.
+			 0 here indicates divide 1, 1 indicates divide 2,
+			 2 indicates divide 4, 3 indicates divide 8, and so on
+			 till 15 indicates divide 32768.
+
+- fan_tach_enable : indicates fan tach enable of type M/N/O as per the
+		    AST2400/AST2500 datasheet. boolean value.
+
+- fan_tach_clock_division : indicates fan tach clock division as per the
+			    AST2400/AST2500 datasheet.
+			    integer value in the range 0 to 7.
+			    0 indicates divide 4, 1 indicates divide 16,
+			    2 indicates divide 64, 3 indicates divide 256
+			    and so on till 7 indicates divide 65536.
+
+- fan_tach_mode_selection : indicates fan tach mode mode selection as per the
+			    AST2400/AST2500 datasheet. integer value in the
+			    range 0 to 2. 0 indicates falling edge, 1 indicates
+			    rising edge and 2 indicates both edges.
+
+- fan_tach_period : indicates fan tach period as per the AST2400/AST2500
+		    datasheet. integer value (can be upto 16 bits long).
+
+pwm_port subnode format:
+========================
+Under pwm_port subnode there can upto 8 child nodes each indicating values
+for one of the 8 PWM output ports.
+
+Required properties for each child node(starting from PWM A through PWM H):
+- enable : enable PWM #X port, X ranges from A through H. boolean value.
+
+- type : indicates type selection value of PWM #X port, X ranges from A
+	 through H. integer value in the range 0 to 2;
+	 0 indicates type M, 1 indicates type N, 2 indicates type O.
+
+- fan_ctrl : set the PWM fan control initial value. integer value between
+	     0(off) and 255(full speed).
+
+fan_tach_channel subnode format:
+================================
+Under fan_tach_channel subnode there can be upto 16 child nodes each indicating
+values for one of the 16 fan tach channels.
+
+Required properties for each child node(starting from fan tach #0 through
+fan tach #16):
+- fan-ctrl-gpios : should specify the tachometer input pin on the hardware.
+
+- enable : enable fan tach #X, X ranges from 0 through 16. boolean value.
+
+- pwm_source : indicates PWM source of fan tach #X, X ranges from 0 through 16.
+	       integer value in the range 0 to 7. 0 indicates PWM port A,
+	       1 indicates PWM port B and so on till 7 indicates PWM port H.
+
+Examples:
+
+pwm_tacho_fixed_clk: fixedclk {
+	compatible = "fixed-clock";
+	#clock-cells = <0>;
+	clock-frequency = <24000000>;
+}
+
+pwm_tacho: pwm-tacho-controller@1e786000 {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	reg = <0x1E786000 0x1000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default>;
+	compatible = "aspeed,aspeed2500-pwm-tacho";
+	clocks = <&pwm_tacho_fixed_clk>;
+	type_values {
+		typem {
+			pwm_period = /bits/ 8 <0x5F>;
+			pwm_clock_division_h = /bits/ 8 <0x00>;
+			pwm_clock_division_l = /bits/ 8 <0x05>;
+			fan_tach_enable;
+			fan_tach_clock_division = /bits/ 8 <0x00>;
+			fan_tach_mode_selection = /bits/ 8 <0x00>;
+			fan_tach_period = /bits/ 16 <0x1000>;
+		};
+	};
+
+	pwm_port {
+		pwm_port0 {
+			enable;
+			type = /bits/ 8 <0x00>;
+			fan_ctrl = /bits/ 8 <0xFF>;
+		};
+
+		pwm_port1 {
+			enable;
+			type = /bits/ 8 <0x00>;
+			fan_ctrl = /bits/ 8 <0xFF>;
+		};
+        };
+
+	fan_tach_channel {
+		fan_tach0 {
+			fan-ctrl-gpios = <&gpio ASPEED_GPIO(O, 0) GPIO_ACTIVE_HIGH>;
+			enable;
+			pwm_source = /bits/ 8 <0x00>;
+		};
+
+		fan_tach1 {
+			fan-ctrl-gpios = <&gpio ASPEED_GPIO(O, 1) GPIO_ACTIVE_HIGH>;
+			enable;
+			pwm_source = /bits/ 8 <0x01>;
+		};
+
+	};
+};
--
2.11.0.390.gc69c2f50cf-goog
