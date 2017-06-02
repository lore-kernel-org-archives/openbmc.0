Return-Path: <brendanhiggins@google.com>
Received: from mail-it0-x22e.google.com (mail-it0-x22e.google.com
 [IPv6:2607:f8b0:4001:c0b::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wfHqr19jFzDqLR
 for <openbmc@lists.ozlabs.org>; Fri,  2 Jun 2017 18:46:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="GW+aMyZ0"; 
 dkim-atps=neutral
Received: by mail-it0-x22e.google.com with SMTP id w68so6556607itc.0
 for <openbmc@lists.ozlabs.org>; Fri, 02 Jun 2017 01:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=4Xi/RxpuH/AksIrHNT+lvoi3NRx96ZFTOTJ9ZmPIl9o=;
 b=GW+aMyZ0+AhctGn2eafJIz/tIWllnWmfAQyTduWH67qYQthhgl4O0jZypkT3VvDYaR
 L/XAZLIqdYp9N7sShKTMHwXpI4PRbGMl2jVNgJ6JkivoH8dyBrV9KTxAvpdMLwHc95+Y
 hFbwn/NEQAsGyi2Bd6FF4j4Ng8iqSePAS9SuCW3IbYeKqWgNfvhr+a/WSjM421bd8JFK
 OHi27gD1wnTXIvigFOc+kC2IZGgTgyPEZpJVjjIcEiFLKkBuQ3kai7pPt94AR80daQ4i
 CCUpCXboa1EPp+9alYbjwJZrMzwEKaZWUh2V5zaFIrNH8xGYctMe+Vb+Hv8HERviyw9g
 v1Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=4Xi/RxpuH/AksIrHNT+lvoi3NRx96ZFTOTJ9ZmPIl9o=;
 b=tv2w2+47rSB/iLYH7icHXENqFXC9TUsgDpX2B51RcKfOiJsDQrzn6UrsMCBWQl+OZH
 CZqQAicaPqOimfkLXpukK5PEXBFGS/c6n2U8BlOXs+ZTsU5gtspjBUnBgm/TCIn/n7IC
 WRZAwWYoIffzBuh1dsY3wk0Lp/6zWr1rJoC4XqLvkwL7Xv44UKnozon/prKtFAyPKSPM
 l1LKsb4uHvAlslrGGpb4kNmgiAKHuAP2VJ/WE4XZymwumPgrAwLVBxuPCnDSnz7ms3cc
 9/wiECCOvKIgQkDbKasPTnMS20oH1x5LgxXmGFOQhj7MKyiegAYAyYB9cVzyOSbf+X0O
 ZaRw==
X-Gm-Message-State: AODbwcCDKOhHU6mgunRgBsMiPQw81nXosHaS9Nf0xJJdfe3PhGfyVTxM
 6JzOEWQrpa7Up9m4
X-Received: by 10.99.117.11 with SMTP id q11mr5977395pgc.179.1496393173881;
 Fri, 02 Jun 2017 01:46:13 -0700 (PDT)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id o76sm48911007pfi.119.2017.06.02.01.46.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 02 Jun 2017 01:46:13 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: wsa@the-dreams.de, robh+dt@kernel.org, mark.rutland@arm.com,
 tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com,
 joel@jms.id.au, vz@mleia.com, mouse@mayc.ru, clg@kaod.org,
 benh@kernel.crashing.org, ryan_chen@aspeedtech.com
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH v9 3/5] i2c: aspeed: added documentation for Aspeed I2C driver
Date: Fri,  2 Jun 2017 01:46:01 -0700
Message-Id: <20170602084603.30811-4-brendanhiggins@google.com>
X-Mailer: git-send-email 2.13.0.506.g27d5fe0cd-goog
In-Reply-To: <20170602084603.30811-1-brendanhiggins@google.com>
References: <20170602084603.30811-1-brendanhiggins@google.com>
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
X-List-Received-Date: Fri, 02 Jun 2017 08:46:17 -0000

Added device tree binding documentation for Aspeed I2C busses.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
Acked-by: Rob Herring <robh@kernel.org>
---
Changes for v2:
  - None
Changes for v3:
  - Removed reference to "bus" device tree param
Changes for v4:
  - None
Changes for v5:
  - None
Changes for v6:
  - Replaced the controller property with and interrupt controller, leaving only
    the busses in the I2C documentation.
Changes for v7:
  - Changed clock-frequency to bus-frequency in device tree
Changes for v8:
  - Added multi-master property to device tree
Changes for v9:
  - None
---
 .../devicetree/bindings/i2c/i2c-aspeed.txt         | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-aspeed.txt

diff --git a/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
new file mode 100644
index 000000000000..bd6480b19535
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
@@ -0,0 +1,48 @@
+Device tree configuration for the I2C busses on the AST24XX and AST25XX SoCs.
+
+Required Properties:
+- #address-cells	: should be 1
+- #size-cells		: should be 0
+- reg			: address offset and range of bus
+- compatible		: should be "aspeed,ast2400-i2c-bus"
+			  or "aspeed,ast2500-i2c-bus"
+- clocks		: root clock of bus, should reference the APB
+			  clock
+- interrupts		: interrupt number
+- interrupt-parent	: interrupt controller for bus, should reference a
+			  aspeed,ast2400-i2c-ic or aspeed,ast2500-i2c-ic
+			  interrupt controller
+
+Optional Properties:
+- bus-frequency	: frequency of the bus clock in Hz defaults to 100 kHz when not
+		  specified
+- multi-master	: states that there is another master active on this bus.
+
+Example:
+
+i2c {
+	compatible = "simple-bus";
+	#address-cells = <1>;
+	#size-cells = <1>;
+	ranges = <0 0x1e78a000 0x1000>;
+
+	i2c_ic: interrupt-controller@0 {
+		#interrupt-cells = <1>;
+		compatible = "aspeed,ast2400-i2c-ic";
+		reg = <0x0 0x40>;
+		interrupts = <12>;
+		interrupt-controller;
+	};
+
+	i2c0: i2c-bus@40 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		#interrupt-cells = <1>;
+		reg = <0x40 0x40>;
+		compatible = "aspeed,ast2400-i2c-bus";
+		clocks = <&clk_apb>;
+		bus-frequency = <100000>;
+		interrupts = <0>;
+		interrupt-parent = <&i2c_ic>;
+	};
+};
-- 
2.13.0.506.g27d5fe0cd-goog
