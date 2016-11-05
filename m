Return-Path: <brendanhiggins@google.com>
Received: from mail-pf0-x22b.google.com (mail-pf0-x22b.google.com
 [IPv6:2607:f8b0:400e:c00::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t9hhQ1Wj3zDvdR
 for <openbmc@lists.ozlabs.org>; Sat,  5 Nov 2016 12:59:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="UByxfBlD"; 
 dkim-atps=neutral
Received: by mail-pf0-x22b.google.com with SMTP id 189so60719113pfz.3
 for <openbmc@lists.ozlabs.org>; Fri, 04 Nov 2016 18:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=IQe4zYLArBghwh9KhP6cZRtcF1GGYkyc8Oxn05ebv7o=;
 b=UByxfBlDD91B9ASXzlBosyAUxHZA57k1gd3qMz1z9Zs5TlJvYtdxNw7otluYKDREs3
 cAhnnGJ052anZsGAjt+pSURE19kb7Yp7mG5dmcEA7Ihrn3qmD9943xOPEEA90HleGI5z
 mhvKEdL7NgrkUUbxW1LB+8exLCUe01nc5nuVkfsfYN0ChRiFB/naUoZOoR0smKeLYwbY
 oOxwGIPy2NjDh8CQO846yyahKe9JoP+G6sCk85yPnKRqii15g+m48IQi6nc6Yvgu0A/M
 mk/5dMpEtWppaUiEI9mhm8oL/tgDz0YXzNkHmjlyCVvhaqOUCkMCM5qNiu7n02Yw3fD2
 IZ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=IQe4zYLArBghwh9KhP6cZRtcF1GGYkyc8Oxn05ebv7o=;
 b=cJfE35neoEzdHpzkZee1J7cK6gYRZtAb5Of+UmLOErjHr/RvXqLUWFJqNf0xyioU+A
 6U0VF4y/S4ZxM0q7EgCAjv5YoVoPfAc6YKdwd7IYeZONMRa/jDMaSi7cFnG1sB8s3NeI
 358AF9La511Hz94md2qPwvOu++MJXpQ5ByIkl8F+mzJJKnZHDFWmUQNkyoFS1JZ9Xfpm
 sv/Cq+xnmGzpFSnnDEp6BEYqKUFSeP3istoUkF3jUUCnjftNpO8BYUJC7Kt1nFVtRTlx
 lCN6BDGZVJ7ZmVtYu6dgNOFeoUFCxxFXAhi27Y5wyuiOFSwnusCBAKPqC2/CpOh4VS/3
 eVAA==
X-Gm-Message-State: ABUngveacUxiP8y23lRZeWCd0xGHTHX9VM+cl5/Ir26YRiwp7gQZZ9V4Tmo4AaCYRxrTYdVc
X-Received: by 10.99.55.66 with SMTP id g2mr26042262pgn.65.1478311140218;
 Fri, 04 Nov 2016 18:59:00 -0700 (PDT)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id k89sm23153902pfg.6.2016.11.04.18.58.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 04 Nov 2016 18:58:59 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: wsa@the-dreams.de,
	robh+dt@kernel.org,
	mark.rutland@arm.com
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, joel@jms.id.au,
 openbmc@lists.ozlabs.org, Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH v4 2/2] i2c: aspeed: added documentation for Aspeed I2C driver
Date: Fri,  4 Nov 2016 18:58:19 -0700
Message-Id: <1478311099-6771-3-git-send-email-brendanhiggins@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1478311099-6771-1-git-send-email-brendanhiggins@google.com>
References: <1478311099-6771-1-git-send-email-brendanhiggins@google.com>
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
X-List-Received-Date: Sat, 05 Nov 2016 01:59:02 -0000

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
