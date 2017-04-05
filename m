Return-Path: <jaghu@google.com>
Received: from mail-pf0-x233.google.com (mail-pf0-x233.google.com
 [IPv6:2607:f8b0:400e:c00::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vyS4K6nl3zDqHH
 for <openbmc@lists.ozlabs.org>; Wed,  5 Apr 2017 10:52:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="GIlE8RQm"; 
 dkim-atps=neutral
Received: by mail-pf0-x233.google.com with SMTP id 197so14725095pfv.1
 for <openbmc@lists.ozlabs.org>; Tue, 04 Apr 2017 17:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=PCA+afEwEScEQTrMI/yXGmCSPK/Tk7tVTFb9+IPwFu4=;
 b=GIlE8RQmRzaWJgXxauGJoU32Q+UmpBBF7wphXcmBXzqSDEQ7BzBpvekLKi0DcRfB2v
 +9Ij8tpaeBnVTINXqtDSDzrVjGUTCacYadmLgNXuI8I8SzhyZdtPg1ax2pvyssro5vm7
 5I1yDXlbhawLrIaRgS+Tk8T/wwmuRJkNWAs+IWgky7EXbByq3qutca5XweBnYbtf/P+4
 VhEsPmd4+6HqwD2rjrQkJuOlXyLHBe3eUK/baLlxJAOmhhAIDMURcsKIZSBLkdXKZ9JL
 PYH+4tabj1AN61QXV1MgUEbcOfc+eOHZgw74EjGDP+Hc8cXmvX7mFjKXFfJeTI2ZKx5T
 Pxvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=PCA+afEwEScEQTrMI/yXGmCSPK/Tk7tVTFb9+IPwFu4=;
 b=obr4SbH4hI+DN6oje7DjLn9NcxtiG/bgvHvaEqFX+/58Qe++EQkl+5RZO00kdOxa/f
 bTG1kwaEMOGau9bqQiII3p42l1UjpefwINhre07RXFzQNLdxaeysanewnGs4KASniOTp
 uSMURR8EV/GKFel8H9AUwyoh+Ba3E929Yf0AcQ5BPqyFb1ZPE5QAxanqSarMWXSycJ38
 ZRQy67VeUqiDMvlSqtQTMTbzivstfnRLf/fYjkjMMi6o0pjFFamaBULdgO6utH5Z99DX
 nOfsyHPcvUEvHveolyBqkoOb3tJ3Efi4Bf6JJ5QEAUuXu4UDYIKTqGvpb/Ps7gD+TS1H
 yqdA==
X-Gm-Message-State: AFeK/H1s+FC09MsDNXXOq9LS80ZMrQuOZKffDIAHyqSgjS1r45jpFBJQKEDNusrTiy7jSSz3
X-Received: by 10.98.33.28 with SMTP id h28mr12877063pfh.248.1491353567122;
 Tue, 04 Apr 2017 17:52:47 -0700 (PDT)
Received: from jaghu22.svl.corp.google.com ([100.123.242.38])
 by smtp.gmail.com with ESMTPSA id y186sm33746960pfg.52.2017.04.04.17.52.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 04 Apr 2017 17:52:46 -0700 (PDT)
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
To: joel@jms.id.au, jdelvare@suse.com, linux@roeck-us.net,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, corbet@lwn.net, linux-doc@vger.kernel.org,
 robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Subject: [PATCH linux v7 1/2] Documentation: dt-bindings: Document bindings
 for ASPEED AST2400/AST2500 PWM and Fan tach controller device driver
Date: Tue,  4 Apr 2017 17:52:40 -0700
Message-Id: <20170405005241.8794-2-jaghu@google.com>
X-Mailer: git-send-email 2.12.2.715.g7642488e1d-goog
In-Reply-To: <20170405005241.8794-1-jaghu@google.com>
References: <20170405005241.8794-1-jaghu@google.com>
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
X-List-Received-Date: Wed, 05 Apr 2017 00:52:50 -0000

This binding provides interface for adding values related to ASPEED
AST2400/2500 PWM and Fan tach controller support.
The PWM controller can support upto 8 PWM output ports.
The Fan tach controller can support upto 16 tachometer inputs.

Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 v7:
- Added a semicolon at the end of pwm_tacho_fixed_clk node in Examples section

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
index 000000000000..cf4460564adb
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
+};
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
