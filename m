Return-Path: <brendanhiggins@google.com>
Received: from mail-pg0-x232.google.com (mail-pg0-x232.google.com
 [IPv6:2607:f8b0:400e:c05::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vsfDJ5GrxzDqbX
 for <openbmc@lists.ozlabs.org>; Tue, 28 Mar 2017 16:13:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="dxae9aRC"; 
 dkim-atps=neutral
Received: by mail-pg0-x232.google.com with SMTP id g2so60960225pge.3
 for <openbmc@lists.ozlabs.org>; Mon, 27 Mar 2017 22:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=+zSKplLAdAoTCAmkZ32GgkniliqlPmNvUFTwKpkgoMk=;
 b=dxae9aRC4uigYOO3X2pNhQUCN6yW52/MJVGmXp3TULdDZ39Hd9jEdVXGI6gQg+LQoP
 GqhwtnnFb3aBWZf6lDNH3SDecTpqWuCVP5w3dtb+y6zqgqFmG8aagjtmtjqRa93zyQmA
 pnuwhGDfRG/WtaN0TC/YmaqkOx5qZozqGXy+NVJYDGBVkwbf5CxXLyxbCJQseySNndNJ
 Ga6I3Vw4Fq7okgQxafP9yRukaLBX+1ipqRNc5DkKSsmILFZ9xwGOcPVgQAryOQKNbDQI
 RUIIP+LKQUdyoaUUfFpTELCMohwkw+2I/SFDpxBXzv/Nuoh3hoCXemLvdkNDjUNFdC2n
 Gs5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=+zSKplLAdAoTCAmkZ32GgkniliqlPmNvUFTwKpkgoMk=;
 b=XqLuTiKCluZF3jLjCtQ0yx0hZbTkF1xORNPZveurlcW6BuSyesVL9rP8I6/P2e+hYX
 sWYJ7/mbrgR8wTQR6YytcIkB9bmRn2MubZiKVzOhywvvLX0AW81LzrHPOBokkTEvXTkq
 yl9GiRycNJiMqY2qZ+53Nnusp1jwmN4oueePEODiArnxr5e+4LApz0ADhNJAb6Hg3hdD
 n3MDFKBUdCTVxFwHLDZBSWTjQz+pCQ2KymbyyFWFEvJa/4v9MN9zyk8FQQ/w4bcO3NZp
 fIdXY81YRuEsROI08wkGa8eG6mH6N4cbSlNmoOd+jvEB2BQMI2SkTB7Q1w/FJ44EFScu
 3k8w==
X-Gm-Message-State: AFeK/H1Q+1bHgNswtKqRQbwRH+k7MVhTSk8MXfES64DSBdZRN6MxXJOByg1ewGCGRMRMktaQ
X-Received: by 10.98.218.76 with SMTP id w12mr29016627pfl.162.1490677982567;
 Mon, 27 Mar 2017 22:13:02 -0700 (PDT)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id p19sm368233pfl.15.2017.03.27.22.13.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 27 Mar 2017 22:13:02 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: wsa@the-dreams.de, robh+dt@kernel.org, mark.rutland@arm.com,
 tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com,
 joel@jms.id.au, vz@mleia.com, mouse@mayc.ru, clg@kaod.org
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 benh@kernel.crashing.org, Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH v6 3/5] i2c: aspeed: added documentation for Aspeed I2C driver
Date: Mon, 27 Mar 2017 22:12:24 -0700
Message-Id: <20170328051226.21677-4-brendanhiggins@google.com>
X-Mailer: git-send-email 2.12.2.564.g063fe858b8-goog
In-Reply-To: <20170328051226.21677-1-brendanhiggins@google.com>
References: <20170328051226.21677-1-brendanhiggins@google.com>
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
X-List-Received-Date: Tue, 28 Mar 2017 05:13:05 -0000

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
---
 .../devicetree/bindings/i2c/i2c-aspeed.txt         | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-aspeed.txt

diff --git a/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
new file mode 100644
index 000000000000..fbcc501706b1
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
@@ -0,0 +1,49 @@
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
+- clock-frequency	: frequency of the bus clock in Hz
+			  defaults to 100 kHz when not specified
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
+		bus = <0>;
+		clocks = <&clk_apb>;
+		clock-frequency = <100000>;
+		status = "disabled";
+		interrupts = <0>;
+		interrupt-parent = <&i2c_ic>;
+	};
+};
-- 
2.12.2.564.g063fe858b8-goog
