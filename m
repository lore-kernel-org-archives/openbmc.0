Return-Path: <brendanhiggins@google.com>
Received: from mail-pf0-x233.google.com (mail-pf0-x233.google.com
 [IPv6:2607:f8b0:400e:c00::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tT2Cb6SXQzDvyF
 for <openbmc@lists.ozlabs.org>; Wed, 30 Nov 2016 12:00:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="QmnC/4my"; 
 dkim-atps=neutral
Received: by mail-pf0-x233.google.com with SMTP id i88so34995449pfk.2
 for <openbmc@lists.ozlabs.org>; Tue, 29 Nov 2016 17:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=uoyDYplubH2nW7azG+mGnRRCGVCjUsGJo5ofUF3FqFM=;
 b=QmnC/4mytoJ6XV+U3R4ggBfcblKsk1o9/fnkt9lZ1Z4TgDSgUhdcqPOPGXcVwFKFL2
 M0tuFtQBjZSafltKHg2GpqmsTxepC8YVO8auNP/OJ7/L4KpsKdCtKEOJOpw/4X+VOrbx
 0kmYUXgHvVrS9dEi1yloYN76jvTaXpE3/jAmmG2VpGErqB5nQ5nnhBW4FW7eEIoEary5
 Dg6wJz5joDAYc47RsKy4jAMvXZUh9JI+TQ+jiQ3e34B5XcI3nl7MpfeVj6L6yuW/gdZh
 6Df4U5k6NyIVMoXVz2lrpmlRftLEKvxogBnb1RymVfekO9fpxufQU4Fsx/a/gyuBf83F
 sXIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=uoyDYplubH2nW7azG+mGnRRCGVCjUsGJo5ofUF3FqFM=;
 b=kLaGp1tlrt+E5G/uevW/T9Y+reSTwo2SIjSVv9bEIrUEIz5qo8CXs2YUFFx3PF26RQ
 gVF9hcZG51jXrsv2WhNynFL2vpzzi6QM4ypsyUU5dPQo9YQ293a/UMK9OlSpAi8JgjUb
 bz6UUEknQCRYVNC+IUBBnYAVFv/eEHkTmTqxjtRzOVidfNS/NUT+akO7t4eGH2eKc/vv
 fw2G5DM+2z1ywqWDXEZh7/GnoQCkxWJS5mIsuYRP52l6HGKrSKVqJPibcrQ73humIUvi
 w2KJvR0KtaVvE2CyCovfubTAQSKLnrBsfhUbI4OHL9NJzI2Zb3YgnW7jcQLv9sS3Vkgn
 CjOQ==
X-Gm-Message-State: AKaTC02hWUU6zKaZZSUpgJSfPRMPXq+3cy9Q3+HEuUBP4wBuNkslzq2lC2HxtVzGnN5/XJub
X-Received: by 10.84.151.9 with SMTP id i9mr25268145pli.67.1480467641852;
 Tue, 29 Nov 2016 17:00:41 -0800 (PST)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id j190sm79598297pgd.23.2016.11.29.17.00.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 29 Nov 2016 17:00:39 -0800 (PST)
From: Brendan Higgins <brendanhiggins@google.com>
To: wsa@the-dreams.de, vz@mleia.com, clg@kaod.org, mouse@mayc.ru,
 robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, joel@jms.id.au,
 openbmc@lists.ozlabs.org, Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH v5 2/2] i2c: aspeed: added documentation for Aspeed I2C driver
Date: Tue, 29 Nov 2016 17:00:18 -0800
Message-Id: <1480467618-7497-3-git-send-email-brendanhiggins@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1480467618-7497-1-git-send-email-brendanhiggins@google.com>
References: <1480467618-7497-1-git-send-email-brendanhiggins@google.com>
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
X-List-Received-Date: Wed, 30 Nov 2016 01:00:44 -0000

Added device tree binding documentation for Aspeed I2C controller and
busses.

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
---
 .../devicetree/bindings/i2c/i2c-aspeed.txt         | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-aspeed.txt

diff --git a/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
new file mode 100644
index 0000000..dd11a97
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
@@ -0,0 +1,61 @@
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
+		clock-frequency = <100000>;
+		status = "disabled";
+		interrupts = <0>;
+		interrupt-parent = <&i2c>;
+	};
+};
+
-- 
2.8.0.rc3.226.g39d4020
