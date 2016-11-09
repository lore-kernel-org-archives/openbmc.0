Return-Path: <jaghu@google.com>
Received: from mail-pf0-x22d.google.com (mail-pf0-x22d.google.com
 [IPv6:2607:f8b0:400e:c00::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tD8nW5c9VzDvYM
 for <openbmc@lists.ozlabs.org>; Wed,  9 Nov 2016 13:11:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="B9Q0XOI4"; 
 dkim-atps=neutral
Received: by mail-pf0-x22d.google.com with SMTP id 189so117859895pfz.3
 for <openbmc@lists.ozlabs.org>; Tue, 08 Nov 2016 18:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=4iNmfTI5XOBYsZHdWqxspBTHHUomgp4/ISjVfQ1DJWA=;
 b=B9Q0XOI4FWkyU4tA14o/HJinAvFY2KX6O1qiTxR0J76K5YX/iqg9pS2yLayeaiGJkX
 72cJV5+ZFxcPDXZKZGvCBgt/bgoTBZESvUvTnG68qa+YWEtQiOl1rD1kusbDQa2ujzaz
 eB23ixyFekKPOkcVHjZRilY3h4uN1Cbnes55LKb9IvZvKChE14GLxk0O8kfR5NKH/IJY
 hyb95ZS+pRXqXa/gj5wNHqxQgroGvzGw7P5W7sY04GQJNSpXzE88vo+B5023dFy25y0L
 zarFuOwi+OuVi+SJDc4d7+RHVwsWW8OKH+QXRaxZQ0aWsKQoHNk7/d9LZrT/yuANEXHm
 FKIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=4iNmfTI5XOBYsZHdWqxspBTHHUomgp4/ISjVfQ1DJWA=;
 b=dXX4VcrK2FIrotwz+wu7rMX+MteBLlgyB915Dvr5AnP10rlAIYpCE1RpcPg1sTA74L
 oKcBnbynfLC1KJto8YXsCu9QLhaVDXIiZqF1AFbuCR+k964WAnwoayJEAvWK6v1B2/6S
 uDfcrKjXg/WV68hYNhgqrjfvPC+9C1kuuWQkbphbx0nGdwgCQzxz7q9wabUCxARouxTF
 JA7xxoNb9pJkIZgsaL5CfZ6RVnbQeGbA7GeljL05rd1oxuIboa3cZ5YHEYF7pVeGDjlW
 PpxjhKEevexq8y98FFmK/SD7DHN8OSYdh+ps+K7RIm3lg92erUMjZgQGnM0VjKupasff
 r/QA==
X-Gm-Message-State: ABUngvcCcDOyELYx6hfFxSEbVSMuYT5kWs2oQj++CgzPmLRE4niB4cb6a0w58pguFZqaFKbf
X-Received: by 10.99.0.194 with SMTP id 185mr23087741pga.111.1478657517867;
 Tue, 08 Nov 2016 18:11:57 -0800 (PST)
Received: from jaghu22.svl.corp.google.com ([100.123.242.38])
 by smtp.gmail.com with ESMTPSA id sh9sm51056998pac.41.2016.11.08.18.11.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 08 Nov 2016 18:11:56 -0800 (PST)
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Subject: [PATCH linux v2 1/3] devicetree: binding documentation update for
 ASPEED AST2500 PWM driver
Date: Tue,  8 Nov 2016 18:11:43 -0800
Message-Id: <1478657505-23109-2-git-send-email-jaghu@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1478657505-23109-1-git-send-email-jaghu@google.com>
References: <1478657505-23109-1-git-send-email-jaghu@google.com>
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
X-List-Received-Date: Wed, 09 Nov 2016 02:12:00 -0000

Add binding documentation update for ASPEED AST2500 PWM driver.
The ASPEED AST2500 PWM driver supports 8 PWM output ports.
The parent node indicates a PWM controller and has options to:
provide register set information, provide pinctrl information,
enable PWM and Fan Tach clock, select clock source, provide settings for
three different PWM sources (type M, N and O).

Each sub node indicates a PWM output port and has options to:
enable PWM port, select the PWM source for the PWM port, provide
duty cycle values to be used at startup.

v2:
- Made binding documentation update as a separate patch.
- Included AST2500 in the description.
- Changed format to "aspeed,ast2500-pwm".
- Included explanation for types M ,N and O and calculation example to
  determine L, H, and period bits.

Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
---
 .../bindings/hwmon/aspeed,ast2500-pwm.txt          | 116 +++++++++++++++++++++
 1 file changed, 116 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed,ast2500-pwm.txt

diff --git a/Documentation/devicetree/bindings/hwmon/aspeed,ast2500-pwm.txt b/Documentation/devicetree/bindings/hwmon/aspeed,ast2500-pwm.txt
new file mode 100644
index 0000000..2c3f2b6
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/aspeed,ast2500-pwm.txt
@@ -0,0 +1,116 @@
+ASPEED AST2500 PWM device driver
+
+The ASPEED AST2500 PWM controller can support 8 PWM outputs.
+
+Required properties:
+- #address-cells : should be 1.
+- #size-cells : should be 1.
+- reg : address and length of the register set for the device.
+- pinctrl-names : A pinctrl state named "default" must be defined.
+- pinctrl-0 : Phandle referencing pin configuration of the aspeed pwm ports.
+- compatible : should be "aspeed,ast2500-pwm".
+- clock_enable : option to enable PWM and fan tach clock. should be 1.
+  (D[0] in PTCR00).
+- clock_source : option for clock source selection. 0 indicates 24MHz clock
+  and 1 indicates MCLK (D[1] in PTCR00).
+- typem_pwm_clock : PWM types M, N and 0 are three types just to have three
+  independent PWM source. Each could be assigned to the 8 PWM channels
+  with it's own settings
+  This array contains 4 values.
+  The first value indicates if the values for type M PWM are valid.
+  If the first value is 1, then it indicates that the rest of the values
+  are valid. If it is 0, then invalid.
+  The second value indicates the type M PWM clock division L bit (D[3:0]
+  in PTCR04). (value 0 in D[3:0] indicates 1, value 1 in D[3:0] indicates 2,
+  value 2 in D[3:0] indicates 4, value 3 in D[3:0] indicates 6 and so on
+  with increments in multiples of two).
+  The third value indicates type M PWM clock divison H bit (D[7:4] in PTCR04).
+  (value 0 in D[7:4] indicates 1, value 1 in D[7:4] indicates 2,
+  value 2 in D[7:4] indicates 4, value 3 in D[7:4] indicates 8 and
+  so on with increments in powers of two).
+  The fourth value indicates type M PWM period bit (D[15:8] in PTCR04).
+  If type M is chosen and clock source is 24 MHz then:
+  The PWM base clock = 24Mhz / (type M clock division L bit *
+  type M clock division H bit).
+  The PWM frequency = The PWM base clock / (type M PWM period bit + 1)
+  If we plan to output 25Khz PWM frequency then we can use:
+  typem_pwm_clock = <1 5 0 95>
+  The PWM frequency = 24Mhz / (10 * 1  * (95 + 1)) = 25Khz
+- typen_pwm_clock : This array contains 4 values.
+  The first value indicates if the values for type N PWM are valid.
+  If the first value is 1, then it indicates that the rest of the values
+  are valid. If it is 0, then invalid.
+  The second value indicates the type N PWM clock division L bit (D[19:16]
+  in PTCR04).
+  The third value indicates type N PWM clock division H bit
+  (D[23:20] in PTCR04).
+  The fourth value indicates type N PWM period bit (D[31:24] in PTCR04).
+  Calculations similar as for type M.
+- typeo_pwm_clock : This array contains 4 values.
+  The first value indicates indicates if the values for type O PWM are valid.
+  If the first value is 1, then it indicates that the rest of the values
+  are valid. If it is 0, then invalid.
+  The second value indicates if the type O PWM clock division L bit
+  (D[3:0] in PTCR44).
+  The third value indicates type O PWM clock divison H bit (D[7:4] in PTCR44).
+  The fourth value indicates type O PWM period bit (D[15:8] in PTCR44).
+  Calculations similar as for type M.
+
+Each subnode represents a PWM output port.
+
+Subnode Format
+--------------
+Required properties:
+- pwm_port : Indicates the PWM port. Values 0 through 7 indicate PWM ports
+  A through H respectively.
+- pwm_enable : Option to enable the PWM port indicated above. 0 is enable
+  and 1 is disable.
+  D[8] in PTCR00 indicates enabling PWM port A,
+  D[9] in PTCR00 indicates enabling PWM port B,
+  D[10] in PTCR00 indicates enabling PWM port C,
+  D[11] in PTCR00 indicates enabling PWM port D,
+  D[8] in PTCR40 indicates enabling PWM port E,
+  D[9] in PTCR40 indicates enabling PWM port F,
+  D[10] in PTCR40 indicates enabling PWM port G,
+  D[11] in PTCR40 indicates enabling PWM port H.
+- pwm_type : Indicates the clock type for the PWM port. value 0 is type M
+  PWM clock. value 1 is type N PWM clock. value 2 is type O PWM clock.
+  D[12] in PTCR00 indicates type selection bit of PWM A port,
+  D[13] in PTCR00 indicates type selection bit of PWM B port,
+  D[14] in PTCR00 indicates type selection bit of PWM C port,
+  D[15] in PTCR00 indicates type selection bit of PWM D port,
+  D[12] in PTCR40 indicates type selection bit of PWM E port,
+  D[13] in PTCR40 indicates type selection bit of PWM F port,
+  D[14] in PTCR40 indicates type selection bit of PWM G port,
+  D[15] in PTCR40 indicates type selection bit of PWM H port.
+- pwm_duty_cycle_percent : duty cycle value.
+
+Examples:
+
+pwm: pwm-controller@1e786000 {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	reg = <0x1E786000 0x78>;
+	pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default
+	 		&pinctrl_pwm2_default &pinctrl_pwm3_default>;
+	compatible = "aspeed,ast2500-pwm";
+	clock_enable = /bits/ 8 <0x01>;
+	clock_source = /bits/ 8 <0x00>;
+	typem_pwm_clock = <1 5 0 95>;
+	typen_pwm_clock = <0 0 0 0>;
+	typeo_pwm_clock = <0 0 0 0>;
+	pwm_port0 {
+		pwm_port = /bits/ 8 <0x00>;
+		pwm_enable = /bits/ 8 <0x01>;
+		pwm_type = /bits/ 8 <0x00>;
+		pwm_duty_cycle_percent = /bits/ 8 <0x5A>;
+	};
+	pwm_port1 {
+		pwm_port = /bits/ 8 <0x01>;
+		pwm_enable = /bits/ 8 <0x01>;
+		pwm_type = /bits/ 8 <0x00>;
+		pwm_duty_cycle_percent = /bits/ 8 <0x5A>;
+	};
+};
+
--
2.8.0.rc3.226.g39d4020
