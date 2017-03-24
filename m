Return-Path: <jaghu@google.com>
Received: from mail-pf0-x22d.google.com (mail-pf0-x22d.google.com
 [IPv6:2607:f8b0:400e:c00::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vqWqG6Xp0zDq95
 for <openbmc@lists.ozlabs.org>; Sat, 25 Mar 2017 05:17:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="dlky67vF"; 
 dkim-atps=neutral
Received: by mail-pf0-x22d.google.com with SMTP id 20so4191511pfk.2
 for <openbmc@lists.ozlabs.org>; Fri, 24 Mar 2017 11:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=7NtVhFgyoKBTJ07p6BlO3l8cPG76uohqwO51z/F8PsE=;
 b=dlky67vF1hy938hS9MjnPn57J/BiDoLIc1pgbc5VO40s8TsYmwdeO82N8iyvoFiND6
 KWat/usGiD5R8pnVcUnZkVp37gdur/eVEH9+VgULPHawlatWrq3r7OzpGXloLX0uWMnl
 sQ3dsCNAYxVqOMgvRP/s5dUhmn0E5A1F1fGX1sCaVB3PAqEgbokHsw1GunFOQW82L0gF
 DGeq0A8NOqfxKlSI6zOw3QgVBfD9igfsMQoJGGATYqQmjdA91VnL+ZcpY3zFtj0qKsVE
 f16wGWVAME+CJ2vnFOt/eVlLM/Z4rSc4Ne8l1nhMEcCZW6NrWcpn8Rt6ULGqjsXk18iU
 2Wug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=7NtVhFgyoKBTJ07p6BlO3l8cPG76uohqwO51z/F8PsE=;
 b=f4wQOYTDpclDeK3jkjJAK+3EKep39q2ySd6L4JJemRN2DGGyaL5HzEuj4iWpoZzsOI
 azZghmXawF8C+ctWerb+9fRbjGnnSNyVZw+WqgzwWjoE+wy76d+DOkAJoLw2YD+UK3wD
 bFKzgkumK06wdvFEkCPKs+RiCjQKla4W2EiiaZ9RlWqTXJiaT3hwl9xgVn3DK0zh4ees
 eyDkJHcfBjXxrzFsVUdwlGku5QBjxlSI0cfTTKmhLO1wG4NKK/VIdeYWee4CIe4PemLA
 wqI+20stTCAkPeem7qAvQ0GNKkBnDJ1barzfD1t+RZxiKnqH6SnV/vjybazzA+p8fAzh
 8cRQ==
X-Gm-Message-State: AFeK/H0HL2B3VO3lzh2gScsQtG+sKbB1n3yJCgSsqxFj4O+lWwH/z31PjgBD+0wuvvaSX2FV
X-Received: by 10.84.130.99 with SMTP id 90mr2077744plc.94.1490379448823;
 Fri, 24 Mar 2017 11:17:28 -0700 (PDT)
Received: from jaghu22.svl.corp.google.com ([100.123.242.38])
 by smtp.gmail.com with ESMTPSA id f21sm6021367pfj.44.2017.03.24.11.17.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 24 Mar 2017 11:17:28 -0700 (PDT)
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
To: joel@jms.id.au, jdelvare@suse.com, linux@roeck-us.net,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, corbet@lwn.net, linux-doc@vger.kernel.org,
 robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Subject: [PATCH linux v5 1/2] Documentation: dt-bindings: Document bindings
 for ASPEED AST2400/AST2500 PWM and Fan tach controller device driver
Date: Fri, 24 Mar 2017 11:17:22 -0700
Message-Id: <20170324181723.29379-2-jaghu@google.com>
X-Mailer: git-send-email 2.12.1.578.ge9c3154ca4-goog
In-Reply-To: <20170324181723.29379-1-jaghu@google.com>
References: <20170324181723.29379-1-jaghu@google.com>
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
X-List-Received-Date: Fri, 24 Mar 2017 18:17:31 -0000

This binding provides interface for adding values related to ASPEED
AST2400/2500 PWM and Fan tach controller support.
The PWM controller can support upto 8 PWM output ports.
The Fan tach controller can support upto 16 tachometer inputs.

Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
---
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
index 000000000000..f96d32bfcdfa
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
+- aspeed-fan-tach-ch : should specify the Fan tach input channel.
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
+		aspeed-fan-tach-ch = /bits/ 8 <0x00>;
+	};
+
+	fan@1 {
+		reg = <0x01>;
+		aspeed-fan-tach-ch = /bits/ 8 <0x01 0x02>;
+	};
+};
--
2.12.1.578.ge9c3154ca4-goog
