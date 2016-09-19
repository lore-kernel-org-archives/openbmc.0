Return-Path: <brendanhiggins@google.com>
Received: from mail-pa0-x229.google.com (mail-pa0-x229.google.com
 [IPv6:2607:f8b0:400e:c03::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sdMQV1xrfzDsfW
 for <openbmc@lists.ozlabs.org>; Tue, 20 Sep 2016 09:23:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=HnkmX11v; 
 dkim-atps=neutral
Received: by mail-pa0-x229.google.com with SMTP id wk8so157371pab.1
 for <openbmc@lists.ozlabs.org>; Mon, 19 Sep 2016 16:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=/zTGPERDcYsrm9Pho+NSAcFpCsAnWk1JtyjPW/ca8Zw=;
 b=HnkmX11vAaGl063HZSuYukADbQzGpOfyP5Ao/q79bRP1YAIz3wBBuY8JdQtNYr8hgJ
 0b0iWawxNOH/O3m3SvY/w2qXvjQ6M5xkM5yZWn8sNvBiMiAb986E/WHJVqD480YzWR80
 6H0ApFKvYoMHa5sLOts8BL/bXNmJGvU+yoeU0L36frmV/glKUbYnpPYHWh1jnqD8iQkH
 iz1nTQm6VWMNS9gb8buckc6zcaISnRB+0B5luZ6u+db+Potwu5sndW/tCiTOM1NdonJB
 061f5eJ0Hn4ht0Y4xft27GYYEIuBobpKKjFzAzrZ3MqhNIxu4LlqD1+5mkF5Ml1Efv/2
 t4Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=/zTGPERDcYsrm9Pho+NSAcFpCsAnWk1JtyjPW/ca8Zw=;
 b=X5a+leBEc08NNuM4lE+XRsGFO3OOKSDGsw4loDMV4qwJuIZE0Qg9d1PXp9E2Ov8FtX
 TfroEtOfpmF/daG1iUh2BWrji/oKHr0h1Wcyg4LuYkcz9+YE3RliUFfGJAp5rhFupIho
 /BEaTSZtAlgCJTOxBH6xnEyIOGbX/v4gtKFEqSDoIoHgl09Ufg/Cy7DnEP//9H8t1F12
 QLOAq0+k4vObs8dzZ+SSFpZzj7mX9f25heHU9CCHhV/RoVq3JyS/GM2A/ctxwDgA3WN9
 p++vZ23rJbW6+J6bsvx9ZfeT4yVcutQRT/ly5ne2DD3+x8gnAtGf0qbORMJg6JMRhRkb
 uImQ==
X-Gm-Message-State: AE9vXwMTzbXSlRGtlIlXpVZ71KHldicPf/D7fQdrSCYmoZaut5HxfIs9pKa2Po/w27rqS8vK
X-Received: by 10.66.23.69 with SMTP id k5mr51082914paf.144.1474327423482;
 Mon, 19 Sep 2016 16:23:43 -0700 (PDT)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id m5sm33938002paw.40.2016.09.19.16.23.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 19 Sep 2016 16:23:43 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: wsa@the-dreams.de,
	robh+dt@kernel.org,
	mark.rutland@arm.com
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, joel@jms.id.au,
 jk@ozlabs.org, Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH v3 2/2] i2c: aspeed: added documentation for Aspeed I2C driver
Date: Mon, 19 Sep 2016 16:23:34 -0700
Message-Id: <1474327414-651-2-git-send-email-brendanhiggins@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1474327414-651-1-git-send-email-brendanhiggins@google.com>
References: <CAFd5g47W-dGVt6hA+FSpqxCqvd5ZpQP=FCCpYGErahF0iKqTEQ@mail.gmail.com>
 <1474327414-651-1-git-send-email-brendanhiggins@google.com>
X-Mailman-Approved-At: Tue, 20 Sep 2016 12:06:31 +1000
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
X-List-Received-Date: Mon, 19 Sep 2016 23:23:46 -0000

Added device tree binding documentation for Aspeed I2C controller and
busses.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
---
Changes for v2:
  - None
Changes for v3:
  - Removed reference to "bus" device tree param
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
