Return-Path: <brendanhiggins@google.com>
Received: from mail-pa0-x229.google.com (mail-pa0-x229.google.com
 [IPv6:2607:f8b0:400e:c03::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sWHH55xqjzDrq9
 for <openbmc@lists.ozlabs.org>; Sat, 10 Sep 2016 11:56:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=RP2n+cHZ; 
 dkim-atps=neutral
Received: by mail-pa0-x229.google.com with SMTP id b2so33469589pat.2
 for <openbmc@lists.ozlabs.org>; Fri, 09 Sep 2016 18:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=GSI8Pkkz0FNqFC7kvnhU65/EMrsVMyAYSOhI9eM0XJs=;
 b=RP2n+cHZJo+pY/8cJRvhIEIupcXnQhjIDuSM3wH41GT1DbMH0IseFMgpWqP/URQYbd
 WL/1n1InU8CIWjDVu5/Smz+Q58Jqn0QfGlvRPSorFDtni8eeWdo37XxrI4gmbaCiOpQb
 PqSeOzYoO2WAXn/KaSW8efDaPbupFY4gZleDuOHPcTHcbZkoEMQjWeULcXSv7xQMTQZ5
 LiwmJUEMJEHiiuWFr0GI3xtDGNDtJ7IoT+8SoBXUQwzRopDGMLYd+tAMib3ewnvGORi0
 PauyRVREP+cE6iNe+C0sTnlZxOfws9NZ8IZiZHmljwrVmsFI9d1Ch67TtWj6RxjUQy4y
 G6EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=GSI8Pkkz0FNqFC7kvnhU65/EMrsVMyAYSOhI9eM0XJs=;
 b=NVixpKlY5E4ZIGubDNKGyytv5nZq5qn7V7AdSBnFYxMMBBdmWuxUmeuFsR5SSwB21g
 czEsrqO0yBlFYuwLNnF1rVezmHs2Vj6KK4WyLmZHHUP1t7B4mnYQPAz+vf0WekxgObU4
 qwz1Ad1rl7HL5/icPyyMx8VIIo9ozfbeDYdr/r884YMQiM1jHvEb4TTHn7AyFTwQVsk3
 d4ElZdWlsczHNKO5ourGRLY4D85oOulLMh+95pxI09m2DVPJ1U9INZhEr4gANX3BrlfO
 95IPJ3BE16ei0JLfbyWU1BTq44Llp+ii6/jl2/BNf+/hWwqNzlQyACah2hjzzziDFHwZ
 3KLA==
X-Gm-Message-State: AE9vXwNt3RKG1v9jU5Ctq35e6C6jWhzqFezNtwPLHHKOjVF9rzd31WnhpDfffWASdYl2+f29
X-Received: by 10.67.7.170 with SMTP id dd10mr11965355pad.152.1473472575672;
 Fri, 09 Sep 2016 18:56:15 -0700 (PDT)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id p17sm7978206pfi.7.2016.09.09.18.56.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 09 Sep 2016 18:56:15 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: wsa@the-dreams.de,
	robh+dt@kernel.org,
	mark.rutland@arm.com
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, joel@jms.id.au,
 jk@ozlabs.org, Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH v2 2/2] i2c: aspeed: added documentation for Aspeed I2C driver
Date: Fri,  9 Sep 2016 18:55:51 -0700
Message-Id: <1473472551-11149-2-git-send-email-brendanhiggins@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1473472551-11149-1-git-send-email-brendanhiggins@google.com>
References: <201609100847.j1qUadzy%fengguang.wu@intel.com>
 <1473472551-11149-1-git-send-email-brendanhiggins@google.com>
X-Mailman-Approved-At: Sat, 10 Sep 2016 22:32:05 +1000
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sat, 10 Sep 2016 01:56:18 -0000

Added device tree binding documentation for Aspeed I2C controller and
busses.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
---
Changes for v2:
  - None
---
 .../devicetree/bindings/i2c/i2c-aspeed.txt         | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-aspeed.txt

diff --git a/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
new file mode 100644
index 0000000..df68f2a
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
@@ -0,0 +1,63 @@
+Device tree configuration for the I2C controller and busses on the AST24XX
+and AST25XX SoCs.
+
+Controller:
+
+	Required Properties:
+	- #address-cells	: should be 1
+	- #size-cells 		: should be 1
+	- #interrupt-cells 	: should be 1
+	- compatible 		: should be "aspeed,ast2400-i2c-controller"
+				  or "aspeed,ast2500-i2c-controller"
+	- reg			: address start and range of controller
+	- ranges		: defines address offset and range for busses
+	- interrupts		: interrupt number
+	- clocks		: root clock of bus, should reference the APB
+				  clock
+	- clock-ranges		: specifies that child busses can inherit clocks
+	- interrupt-controller	: denotes that the controller receives and fires
+				  new interrupts for child busses
+
+Bus:
+
+	Required Properties:
+	- #address-cells	: should be 1
+	- #size-cells		: should be 0
+	- reg			: address offset and range of bus
+	- compatible		: should be "aspeed,ast2400-i2c-bus"
+				  or "aspeed,ast2500-i2c-bus"
+	- bus			: the bus's number
+	- interrupts		: interrupt number
+
+	Optional Properties:
+	- clock-frequency	: frequency of the bus clock in Hz
+				  defaults to 100 kHz when not specified
+
+Example:
+
+i2c: i2c@1e78a000 {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	#interrupt-cells = <1>;
+
+	compatible = "aspeed,ast2400-i2c-controller";
+	reg = <0x1e78a000 0x40>;
+	ranges = <0 0x1e78a000 0x1000>;
+	interrupts = <12>;
+	clocks = <&clk_apb>;
+	clock-ranges;
+	interrupt-controller;
+
+	i2c0: i2c-bus@40 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x40 0x40>;
+		compatible = "aspeed,ast2400-i2c-bus";
+		bus = <0>;
+		clock-frequency = <100000>;
+		status = "disabled";
+		interrupts = <0>;
+		interrupt-parent = <&i2c>;
+	};
+};
+
-- 
2.8.0.rc3.226.g39d4020
