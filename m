Return-Path: <jaghu@google.com>
Received: from mail-pg0-x231.google.com (mail-pg0-x231.google.com
 [IPv6:2607:f8b0:400e:c05::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vxpHs1vvlzDqC4
 for <openbmc@lists.ozlabs.org>; Tue,  4 Apr 2017 09:30:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="H+xpp/EZ"; 
 dkim-atps=neutral
Received: by mail-pg0-x231.google.com with SMTP id g2so132874349pge.3
 for <openbmc@lists.ozlabs.org>; Mon, 03 Apr 2017 16:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=10/oAIeKkQP9riZEzrx8VwyExk73kIYjP0NVNv0+yM4=;
 b=H+xpp/EZYnmETgivNTwj7A5GP2z4zek5thKx51uKWvEcXixicB8HzcZ+yCDEKtwRUw
 pfWtpAESbLiiUEIV272tHFWmGJzjnlT16KJfVM01aZoy5t1Gu45hy1W8UY+euZtiwkcu
 yLa5vmbcMNmDxHi5xZIVVSAJS0gBKU0MAGa14IO7MWslbs7GYrz35Hl56awIEBh/l0+B
 YPTWzxI3FfDPM4iOux0cCn48BK5b4SddhSLgEc97Xbawe/fCFeONEnWh7YtBMw1PeM4G
 cUn2CMqsgJSaDSBFgjIkPw70+yRhUobHsxhNWfk1ggJUY9UEyLn4lvncNsS7oLXW8sm3
 Kq5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=10/oAIeKkQP9riZEzrx8VwyExk73kIYjP0NVNv0+yM4=;
 b=B1HoThmbyhVODmegiDQ21zoYuTSzRjdtfISDcTwE8cmxJVlM+iBT1OCVajdrsEDzTi
 YqzS+d1eq5mmYMgX9hH0esuo/NQXooIwo9KGcOZtgL8jtwq3vqNVFbeBjMhso2HSqzVH
 t8mmlT3dicMZDhLgySg9tDcZfCYTRRYsxpGrqM9/R4ATJjfH/76qq7xwFBB9I+gCDVli
 +AxXfzf5/kjZEKoPzf0o0H0P47jDJh+Df9MANMoPzHa3Evm42PhqpPKFKvrNfTmALpCV
 fri/XfUimOIvMY86ZsOKEBM5QfLtI/nT4Si7eOha6ST46zLcrr3tOXaEncs18IuM/oZP
 yDOA==
X-Gm-Message-State: AFeK/H0R09UiCCsqTvNIXki2WNYr0OXmbItcmkUnDHE0IMXvs4zEEzEDtqpsoU0hU3qZjKRj
X-Received: by 10.84.254.5 with SMTP id b5mr25103338plm.76.1491262231205;
 Mon, 03 Apr 2017 16:30:31 -0700 (PDT)
Received: from jaghu22.svl.corp.google.com ([100.123.242.38])
 by smtp.gmail.com with ESMTPSA id 140sm27788643pfa.58.2017.04.03.16.30.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 03 Apr 2017 16:30:30 -0700 (PDT)
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
To: joel@jms.id.au, jdelvare@suse.com, linux@roeck-us.net,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, corbet@lwn.net, linux-doc@vger.kernel.org,
 robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Subject: [PATCH linux v6 1/2] Documentation: dt-bindings: Document bindings
 for ASPEED AST2400/AST2500 PWM and Fan tach controller device driver
Date: Mon,  3 Apr 2017 16:30:24 -0700
Message-Id: <20170403233025.26952-2-jaghu@google.com>
X-Mailer: git-send-email 2.12.2.715.g7642488e1d-goog
In-Reply-To: <20170403233025.26952-1-jaghu@google.com>
References: <20170403233025.26952-1-jaghu@google.com>
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
X-List-Received-Date: Mon, 03 Apr 2017 23:30:33 -0000

This binding provides interface for adding values related to ASPEED
AST2400/2500 PWM and Fan tach controller support.
The PWM controller can support upto 8 PWM output ports.
The Fan tach controller can support upto 16 tachometer inputs.

Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
---
 v6:
- Changed to aspeed,fan-tach-ch

 v5:
- Changed the naming scheme to aspeed,ast2400/2500-pwm-tacho
- Removed gpio pin muxing
- Added aspeed vendor prefix for fan-tach-ch
- Changed to fan@0/1
- Changed reg to 32 bits

 v4:
- Used 'reg'

 v3:
- Made the structure more common

 v2:
- Removed '_' in node and property names
- Gave some explanation for the properties used

 .../devicetree/bindings/hwmon/aspeed-pwm-tacho.txt | 68 ++++++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt

diff --git a/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt b/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
new file mode 100644
index 000000000000..ac0a69ab0755
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
@@ -0,0 +1,68 @@
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
+- compatible : should be "aspeed,ast2400-pwm-tacho" for AST2400 and
+	       "aspeed,ast2500-pwm-tacho" for AST2500.
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
+- aspeed,fan-tach-ch : should specify the Fan tach input channel.
+                integer value in the range 0 through 15, with 0 indicating
+		Fan tach channel 0 and 15 indicating Fan tach channel 15.
+		Atleast one Fan tach input channel is required.
+
+Examples:
+
+pwm_tacho_fixed_clk: fixedclk {
+	compatible = "fixed-clock";
+	#clock-cells = <0>;
+	clock-frequency = <24000000>;
+}
+
+pwm_tacho: pwmtachocontroller@1e786000 {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	reg = <0x1E786000 0x1000>;
+	compatible = "aspeed,ast2500-pwm-tacho";
+	clocks = <&pwm_tacho_fixed_clk>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default>;
+
+	fan@0 {
+		reg = <0x00>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x00>;
+	};
+
+	fan@1 {
+		reg = <0x01>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x01 0x02>;
+	};
+};
--
2.12.2.715.g7642488e1d-goog
