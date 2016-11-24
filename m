Return-Path: <jaghu@google.com>
Received: from mail-pg0-x236.google.com (mail-pg0-x236.google.com
 [IPv6:2607:f8b0:400e:c05::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tPYkV3kR6zDw6H
 for <openbmc@lists.ozlabs.org>; Thu, 24 Nov 2016 20:26:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="UDUgcd+c"; 
 dkim-atps=neutral
Received: by mail-pg0-x236.google.com with SMTP id 3so16835186pgd.0
 for <openbmc@lists.ozlabs.org>; Thu, 24 Nov 2016 01:26:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=u7WSPK0uaGqRwjvfFTxoEfCgYyq8NH85mgCStITr9II=;
 b=UDUgcd+cNjAsM/YqSMiGHj2CcZS6l+dvOEQuTtPrOSq1gKNkx8RJ3JMd3PMZWYlIgJ
 4Qjkf0qAiQ8/t+hXZWREUSDrFTJH59PP/yLtNT/OrtY+pmIzNkWCbdeOOAgdyiMFawnQ
 pyzarh5dECIPLuHQdze62VwrpVU9hJg+YMWFIYFwwSC6vUllVPvqP18VsTRBPdunlXv/
 GMC+qyZlKphiXZ9xT/15hK0xEO8YLAmXWmwCiee5U2VPcQI0dRKFOBDUSKbHun8+fGwo
 dpB+3fyfqc10eOtCQxv/NjefZrHYllnTe1dMvYsBXb6ynN0yuGm921SdBqCsulN66Z0R
 QGYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=u7WSPK0uaGqRwjvfFTxoEfCgYyq8NH85mgCStITr9II=;
 b=EdnOGzMJ/ILA1Ablk+S2GR9//TCuexhtB/Noge7+T5rIx3S9vnzKOt7fXleLySCHcu
 XpZ4rZVUEuH20DYMywh5Yx5ZM2mTmvk+DKEVmrqPKGlybIsM4BPlYfTsvRlgHsBAH6cR
 uqWCNc1/xRKQ0ia27oebO62d/ltYB1ft9KlyJ6ohPjdeHA+XlWRnYkexB5XswQEPZZHr
 MDdFZ/xqu+7qaUasfhSPzYWWj7/tX2M31RE7Ww/B/VEVWnfSFsdQSY6sHgpvrHftxGeM
 F2oLnQO2qILZgvcGO/jqXkfn99OHm50Lbb0EEZ22iXPe6iYdWEhc0HFQ18pgXXFkx9xz
 fCRA==
X-Gm-Message-State: AKaTC01zOgEDjaE5y1J219sC/GZn6aIVcj3G5Mcew/Jy1vC0usgRurhCIV50/yQQ6ADk7hE0
X-Received: by 10.84.169.36 with SMTP id g33mr3378844plb.174.1479979616711;
 Thu, 24 Nov 2016 01:26:56 -0800 (PST)
Received: from jaghu22.svl.corp.google.com ([100.123.242.38])
 by smtp.gmail.com with ESMTPSA id q145sm58705035pfq.22.2016.11.24.01.26.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 24 Nov 2016 01:26:55 -0800 (PST)
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Subject: [PATCH linux v3 1/3] Documentation: dt-bindings: Document binding for
 ASPEED AST2400/2500 PWM support
Date: Thu, 24 Nov 2016 01:26:48 -0800
Message-Id: <1479979610-2958-2-git-send-email-jaghu@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1479979610-2958-1-git-send-email-jaghu@google.com>
References: <1479979610-2958-1-git-send-email-jaghu@google.com>
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
X-List-Received-Date: Thu, 24 Nov 2016 09:26:59 -0000

This binding provides interface for adding values related to ASPEED
AST2400/2500 PWM support.
The parent node indicates a PWM controller. The parent node can have
upto 8 child nodes. Each node indicates a PWM output port.
PWM clock types M, N and 0 are three types just to have three independent
PWM sources. Each port can be assigned a different PWM clock type.
Each port can have the duty-cycle set to a different value.

Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
---
v2:
- Made binding documentation update as a separate patch.
- Included AST2500 in the description.
- Changed format to "aspeed,ast2500-pwm".
- Included explanation for types M ,N and O and calculation example to
-  determine L, H, and period bits.

v3:
- Included struct clk and phandle reference to clock node.
- Removed clock calculation description from the bindings document.
- Added some whitespace and improved style of binding document.

 .../devicetree/bindings/hwmon/aspeed-pwm.txt       | 104 +++++++++++++++++++++
 1 file changed, 104 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed-pwm.txt

diff --git a/Documentation/devicetree/bindings/hwmon/aspeed-pwm.txt b/Documentation/devicetree/bindings/hwmon/aspeed-pwm.txt
new file mode 100644
index 0000000..11a007c
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/aspeed-pwm.txt
@@ -0,0 +1,104 @@
+ASPEED AST2400/AST2500 PWM device driver
+
+The ASPEED PWM controller can support 8 PWM outputs.
+PWM clock types M, N and 0 are three types just to have three
+independent PWM sources. Each could be assigned to the 8 PWM port
+with it's own settings.
+
+Required properties:
+- #address-cells : should be 1.
+
+- #size-cells : should be 1.
+
+- reg : address and length of the register set for the device.
+
+- pinctrl-names : a pinctrl state named "default" must be defined.
+
+- pinctrl-0 : phandle referencing pin configuration of the ASPEED PWM ports.
+
+- compatible : should be "aspeed,ast2400-pwm" for AST2400 or
+  "aspeed,ast2500-pwm" for AST2500.
+
+- clocks : phandle reference to clocks. upto three fixed clocks providing
+  three different input clock frequencies. each clock frequency indicates a
+  desired PWM frequency.
+
+   the first PWM frequency in combination with type M PWM period value
+    (described below) and source clock frequency will be used to calculate the
+    type M PWM clock division high and low values.
+   the second PWM frequency in combination with type N PWM period value and
+    source clock frequency will be used to calculate the type N PWM clock
+    division high and low values.
+   the third PWM frequency in combination with type O PWM period value and
+    source clock frequency will be used to calculate the type O PWM clock
+    division high and low values.
+
+  Since atleast one PWM frequency or one PWM clock type(type M PWM clock type)
+  is required, the first clock is required. the other two are optional.
+
+- pwm_typem_period : indicates type M PWM period. integer value in the range
+  0 to 255.
+
+Optional properties:
+- pwm_typen_period : indicates type N PWM period. integer value in the range
+  0 to 255.
+
+- pwm_typeo_period : indicates type O PWM period. integer value in the range
+  0 to 255.
+
+Each subnode represents a PWM output port.
+
+Subnode Format
+--------------
+Required properties:
+- pwm_port : indicates the PWM port. values 0 through 7 indicate PWM ports
+  A through H respectively.
+
+- pwm_enable : option to enable the PWM port indicated above. 0 is enable
+  and 1 is disable.
+
+- pwm_type : indicates the clock type for the PWM port. value 0 is type M
+  PWM clock. value 1 is type N PWM clock. value 2 is type O PWM clock.
+
+- pwm_fan_ctrl : pulse width modulation fan control. integer value
+  in the range 0 to 255. 255 is max or 100%.
+
+Additional details are available in the detailed datasheet for the device
+AST2400/AST2500.
+
+Examples:
+
+clocks {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	pwm_typem_clock: fixedclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <25000>;
+	}
+}
+
+pwm: pwm-controller@1e786000 {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	reg = <0x1E786000 0x78>;
+	pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default>
+	compatible = "aspeed,ast2500-pwm";
+	clocks = <&pwm_typem_clock>;
+	pwm_typem_period = <95>;
+	pwm_port0 {
+		pwm_port = /bits/ 8 <0x00>;
+		pwm_enable = /bits/ 8 <0x01>;
+		pwm_type = /bits/ 8 <0x00>;
+		pwm_fan_ctrl = /bits/ 8 <0x5A>;
+	};
+	pwm_port1 {
+		pwm_port = /bits/ 8 <0x01>;
+		pwm_enable = /bits/ 8 <0x01>;
+		pwm_type = /bits/ 8 <0x00>;
+		pwm_fan_ctrl = /bits/ 8 <0x5A>;
+	};
+};
+
--
2.8.0.rc3.226.g39d4020
