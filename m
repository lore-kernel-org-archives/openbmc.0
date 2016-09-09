Return-Path: <brendanhiggins@google.com>
Received: from mail-pa0-x235.google.com (mail-pa0-x235.google.com
 [IPv6:2607:f8b0:400e:c03::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sW7HQ4qYzzDrq6
 for <openbmc@lists.ozlabs.org>; Sat, 10 Sep 2016 05:56:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=Thg9YMmD; 
 dkim-atps=neutral
Received: by mail-pa0-x235.google.com with SMTP id b2so31321974pat.2
 for <openbmc@lists.ozlabs.org>; Fri, 09 Sep 2016 12:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=83KiGFoNtGPqyblMBIz+WZjMPoTSZQPsJJH3xtL0coY=;
 b=Thg9YMmDC2+c+v0kzCtdDJ50VKaLdcCXdlBO9/hB07OrBmghytOAoBlAmfj2SyuyHH
 iS9WtOuT8CCtMkXmt5yg+/oexlg/u7FFHSFqTg5tPvjBvBRUr7aM4yoJQJG5Zo4+r9Y8
 XFgvELyUnfkf9blQuM9dmk54u4Donmt/zRMpuFOy3KhB85cV2xqxluN8KF5hn9XeetkA
 T1f2b7DzzMFMfmVchJi4H5uAbCoJQUCdY4TFjoR9yExdcBsw50pcwnbsZ0pqu4m6dwPz
 fsZVrIXr9rEYy+tHfWVNyULWXNn9MOr0U2J4uYIylRUiVkic4zRtL8GxTVF2umTdJRHk
 jxcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=83KiGFoNtGPqyblMBIz+WZjMPoTSZQPsJJH3xtL0coY=;
 b=FygL+/dKCM0v437Dmp/ffJCwOqTu08nmnWGETqYgNCkv2MKZiBOQ1icJeAloS/4Bcl
 srQGbLpDU5zAq4Hw+1gampTfHxJlVyMWAe5zjfYS2oL8ngFVruTIwK6Ix8XKjY+K4acN
 ake+y64yBvpMAobDqUr/L6UKdxd/DXCy6Uza/qf4krigU3mCbuSWxdA1HHY2bMGdvMTk
 BvrEqb3vV0CG7Wd58Z2bFiC5f8uNtVYHRvpxaeU7sKpiJmrH5Fbe5Kyo7E1MrlcLA/Uy
 Vns59QUAvEJ5+qayu/gpdiah0OSUHH2gUfyiwHolXCULQ98hFH5zeWQVl6Ckw+d9Zeif
 x9Kw==
X-Gm-Message-State: AE9vXwPqWke+EF0elB1Z+GsyyPDGkce3wBHHclCXSpUJxvZ7YW5a0YQUieVkEi0gmCpZv8wa
X-Received: by 10.66.5.137 with SMTP id s9mr1318383pas.151.1473450960846;
 Fri, 09 Sep 2016 12:56:00 -0700 (PDT)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id e72sm7166946pfb.49.2016.09.09.12.56.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 09 Sep 2016 12:56:00 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: wsa@the-dreams.de,
	robh+dt@kernel.org,
	mark.rutland@arm.com
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, joel@jms.id.au,
 jk@ozlabs.org, Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH 2/2] i2c: aspeed: added documentation for Aspeed I2C driver
Date: Fri,  9 Sep 2016 12:54:30 -0700
Message-Id: <1473450870-10333-3-git-send-email-brendanhiggins@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1473450870-10333-1-git-send-email-brendanhiggins@google.com>
References: <1473450870-10333-1-git-send-email-brendanhiggins@google.com>
X-Mailman-Approved-At: Sat, 10 Sep 2016 06:31:09 +1000
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
X-List-Received-Date: Fri, 09 Sep 2016 19:56:04 -0000

Added device tree binding documentation for Aspeed I2C controller and
busses.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
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
