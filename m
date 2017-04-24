Return-Path: <brendanhiggins@google.com>
Received: from mail-pf0-x235.google.com (mail-pf0-x235.google.com
 [IPv6:2607:f8b0:400e:c00::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wBZNS1lgRzDqC4
 for <openbmc@lists.ozlabs.org>; Tue, 25 Apr 2017 04:18:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="eAFpd6Bz"; 
 dkim-atps=neutral
Received: by mail-pf0-x235.google.com with SMTP id v14so12413524pfd.2
 for <openbmc@lists.ozlabs.org>; Mon, 24 Apr 2017 11:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=AWF+n0DB+kzZn872Zw8G5WiKbmBCkEw8ud77CHpYTZA=;
 b=eAFpd6BzpXAtNFlRpGwVV+5imh9ipdssHvD6GimZGRy+8t5Cm/ZOd3eCcJFer89P8J
 2sbZGF00/ct92FssmgDoMdXp1P9PCZoy9Etxf1TtUx6rZncY/QEhXURTWeDn4+pL818s
 /bUNquBpZt+NhvQUtO5B5urOtCMsCQYMH0wCaO7B02ywfq2ShVkUtXylfoCZT52JWeqm
 K7cgs8b0eRyEDyhm94eQLcIGTW0MAyV0wJBOYA6l2lTH58RAtmaf8TiCzuc6lStMk4LV
 EfMK5TbW5g1AwQx9POMgquCIWiAyvv858yQ+0eDJTmMtdHbSlQAMy8iP+dXLOjgePglF
 /nuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=AWF+n0DB+kzZn872Zw8G5WiKbmBCkEw8ud77CHpYTZA=;
 b=l7JwWmIOeU8S9vJcToqwuFz5gf76Le6XkLmBuYg+dd68UG0Z02KTJsHa4BmLrG8FWW
 BdDil6cIEoqxgScpqZLZ/UZ/8lDxwGbNiIoVbXnSMZyng/dKW6CuMbu0hXF8sYfHZXeS
 fBLB03n7OtLOG76WbsrYoyHsFMB5g6CWha+h8RDh5MzYIezp3sQekwddg6OmK86IoOCb
 F0Y5IzOQsHdwz0cZRwNth2dKaJOYkIIZzyBlDHNlzWP4tiooosEvKiwUL6XxIdAizYqU
 j3D244cLdGlckXm3leL/oxRtwleczoVmv/sbzVyK5jPOd0QM96CybO1Vu0ixqC3+fmCJ
 hWFA==
X-Gm-Message-State: AN3rC/6VCeXDYuVIm5qWYPZMP4kURJwpG5GNSNaW62VZBl3qed2pyjA+
 Log1F9rKHu1Ir/gT
X-Received: by 10.98.84.194 with SMTP id i185mr26691671pfb.234.1493057926246; 
 Mon, 24 Apr 2017 11:18:46 -0700 (PDT)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id 65sm32220630pgc.1.2017.04.24.11.18.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 24 Apr 2017 11:18:45 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: wsa@the-dreams.de, robh+dt@kernel.org, mark.rutland@arm.com,
 tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com,
 joel@jms.id.au, vz@mleia.com, mouse@mayc.ru, clg@kaod.org,
 benh@kernel.crashing.org
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH v7 3/5] i2c: aspeed: added documentation for Aspeed I2C driver
Date: Mon, 24 Apr 2017 11:18:16 -0700
Message-Id: <20170424181818.2754-4-brendanhiggins@google.com>
X-Mailer: git-send-email 2.12.2.816.g2cccc81164-goog
In-Reply-To: <20170424181818.2754-1-brendanhiggins@google.com>
References: <20170424181818.2754-1-brendanhiggins@google.com>
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
X-List-Received-Date: Mon, 24 Apr 2017 18:18:48 -0000

Added device tree binding documentation for Aspeed I2C busses.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
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
---
 .../devicetree/bindings/i2c/i2c-aspeed.txt         | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-aspeed.txt

diff --git a/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
new file mode 100644
index 000000000000..08ae65251080
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
@@ -0,0 +1,47 @@
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
2.12.2.816.g2cccc81164-goog
