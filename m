Return-Path: <brendanhiggins@google.com>
Received: from mail-pg0-x22f.google.com (mail-pg0-x22f.google.com
 [IPv6:2607:f8b0:400e:c05::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wsgc70zyDzDqhn
 for <openbmc@lists.ozlabs.org>; Wed, 21 Jun 2017 07:15:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Qpsxh0Hi"; 
 dkim-atps=neutral
Received: by mail-pg0-x22f.google.com with SMTP id f185so67923344pgc.0
 for <openbmc@lists.ozlabs.org>; Tue, 20 Jun 2017 14:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=HXNtfM0aeeFqJOUAZghFRWcTqGFZWObQIgDo7KMzvdY=;
 b=Qpsxh0Hi72geBpBtGKmPSlkB19IX01IjBoLiMG8ogOYg8oWb6DhVkve2qYufsP58oB
 xMenmyDP1NVq10fmlKHGKM1/4NcE0T2BiBku8NVZQO5BbCGxMfSND1xT1pI695u2ouoo
 Nrr11YkFoe6PsMS/Ktw8BtCE8/+kw1k3AGW13dPiF5BsQRNvC3R6f537NTRG7SdY8Ogo
 LOWrBzijgN31neWVN4YrL/xJkq+4pOW9KEXHBAvsZVpAtXX2xnF3Yb3t1PSyfZZF6Wde
 XbhwKWIcnMplhBBPqD05S6J3xh5el6X2V3jV1gScaiFvZZWQP+fGaElE+Kv5hmvEcN7x
 1ikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=HXNtfM0aeeFqJOUAZghFRWcTqGFZWObQIgDo7KMzvdY=;
 b=CqNy59xpwB4j4TprfeCt/T1k+xY5JgW1wEiP9xEJoL5VjtEedkne+Kk0cIhATfZiK0
 Q6Tx/evg1ErqLHknYyPVYgpjXOlZMYVduQMkzmd7Hp62PZMrdFmQOWxMJdQA7qth4GnG
 SOd8JjnbNryvZBVVJpxTLYmgXt9l0DY1ljeZv/JSWx11ZrCr+bP/h3xUTy/3O4ZLzeOD
 zYLIxfbdu8dZQ7zt0Y6BE58+QeD5urq7pzIgj0VQJT1j82QTwoK/ri3dec1PyyVb4Ej6
 j6uIA3e7VWuWRZkn7kumvea1f2U/rD5MPRCg+cHhZcRWWLdjMQcTp0HtN0v2bDcdiFdn
 E11A==
X-Gm-Message-State: AKS2vOwRxOAJTKORcWv2ReI3XVa29qaP9gizy4UKshNqONwCslZUyH7j
 DXLecMxBVXLNMlK0
X-Received: by 10.99.2.78 with SMTP id 75mr24914907pgc.120.1497993333309;
 Tue, 20 Jun 2017 14:15:33 -0700 (PDT)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id a69sm29012015pfg.91.2017.06.20.14.15.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 20 Jun 2017 14:15:32 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: wsa@the-dreams.de, robh+dt@kernel.org, mark.rutland@arm.com,
 gregkh@linuxfoundation.org, davem@davemloft.net, mchehab@kernel.org,
 joel@jms.id.au, martin.petersen@oracle.com, benh@kernel.crashing.org
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH v11 2/4] i2c: aspeed: added documentation for Aspeed I2C driver
Date: Tue, 20 Jun 2017 14:15:14 -0700
Message-Id: <20170620211516.13095-3-brendanhiggins@google.com>
X-Mailer: git-send-email 2.13.1.611.g7e3b11ae1-goog
In-Reply-To: <20170620211516.13095-1-brendanhiggins@google.com>
References: <20170620211516.13095-1-brendanhiggins@google.com>
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
X-List-Received-Date: Tue, 20 Jun 2017 21:15:35 -0000

Added device tree binding documentation for Aspeed I2C busses.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
Acked-by: Rob Herring <robh@kernel.org>
---
hanges for v2:
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
Changes for v11:
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
2.13.1.611.g7e3b11ae1-goog
