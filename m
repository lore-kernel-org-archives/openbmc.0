Return-Path: <brendanhiggins@google.com>
Received: from mail-pf0-x232.google.com (mail-pf0-x232.google.com
 [IPv6:2607:f8b0:400e:c00::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wfk6F16bqzDqGr
 for <openbmc@lists.ozlabs.org>; Sat,  3 Jun 2017 11:30:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Nn1R6hgr"; 
 dkim-atps=neutral
Received: by mail-pf0-x232.google.com with SMTP id m17so58945675pfg.3
 for <openbmc@lists.ozlabs.org>; Fri, 02 Jun 2017 18:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=h+HRj34r+uzWoXbnhmWw69CdXmrdaSzElDI4qEAAqZs=;
 b=Nn1R6hgrhl9hTF9p/655/Dhn+rFIMPkr2gjh4nDKN20rk49okcrjqnm5GoEkgKrBgU
 t8xbrmzZe+JbPzaMlWAmIR9B5nmaA7Y3QqQnrXFyn2lwZbnFNlVt/mvRBErh036wArQk
 BLw7+MpHRkU2imucneLt7g5xxmFVUFrXRBg2KI3T3dM1L79oZBsRj/sRZLn2tEyKkonv
 7ra6JZj+XOIIBV/IYJ9jv+t9RB1DJrFEsER4gQzBjQSJKwAqLTfdfAdsiSes6hiDEKhb
 YszrpQNF9l0en/0XczAcftY5xBf+yYtJSUnJJbl4jcSvfTEkY+sm40rQWTZbC5e5n5Cd
 a2sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=h+HRj34r+uzWoXbnhmWw69CdXmrdaSzElDI4qEAAqZs=;
 b=PXveqKZVKZr8S8/K08ipP6APXZ9Yet3/edbCNkCje7pWEWlYq00nlBSL7a1vp0eSLy
 ztJkItX6InkIQIKLuGH46rZt4ovdC8j4K9SVs6AjsyzX5SUTCPmDM4LdF88Dmnrp+pkb
 3ukKZiT5CPZMyFRqYos/FXZ5LlNkmtqO3322cG5WxiKMbWN5hVD6DdxTP3aFHYTfJlTp
 FzY1RfdWb9YGzAmb9zEbGmWlH6RpQ5NkTmLdN1RI/OyAePntc+gqf7JBwKHc/bl6+4Hk
 Vld4eigt87tISF/Sdz2RdT46Y6QdOUuCIoY+zC2R0hSMNFNagqozaunBp/Nl41gtGq9w
 iZhw==
X-Gm-Message-State: AODbwcBhEoorv63l6dv2rB94w0czpHfJ8bHwsXKozQNU+9hEJHHG9wpA
 /kiuFykIFB+bEBpr
X-Received: by 10.84.193.129 with SMTP id f1mr2785047pld.129.1496453410934;
 Fri, 02 Jun 2017 18:30:10 -0700 (PDT)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id 65sm33462651pgf.14.2017.06.02.18.30.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 02 Jun 2017 18:30:10 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: wsa@the-dreams.de, robh+dt@kernel.org, mark.rutland@arm.com,
 tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com,
 joel@jms.id.au, vz@mleia.com, mouse@mayc.ru, clg@kaod.org,
 benh@kernel.crashing.org, ryan_chen@aspeedtech.com
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH v10 3/5] i2c: aspeed: added documentation for Aspeed I2C driver
Date: Fri,  2 Jun 2017 18:29:50 -0700
Message-Id: <20170603012952.2192-4-brendanhiggins@google.com>
X-Mailer: git-send-email 2.13.0.506.g27d5fe0cd-goog
In-Reply-To: <20170603012952.2192-1-brendanhiggins@google.com>
References: <20170603012952.2192-1-brendanhiggins@google.com>
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
X-List-Received-Date: Sat, 03 Jun 2017 01:30:13 -0000

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
Changes for v10:
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
