Return-Path: <brendanhiggins@google.com>
Received: from mail-pf0-x236.google.com (mail-pf0-x236.google.com
 [IPv6:2607:f8b0:400e:c00::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sPZX23hSvzDrnM
 for <openbmc@lists.ozlabs.org>; Thu,  1 Sep 2016 05:02:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=byUMn4Q5; 
 dkim-atps=neutral
Received: by mail-pf0-x236.google.com with SMTP id x72so22290830pfd.2
 for <openbmc@lists.ozlabs.org>; Wed, 31 Aug 2016 12:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=83KiGFoNtGPqyblMBIz+WZjMPoTSZQPsJJH3xtL0coY=;
 b=byUMn4Q54WDTqLq8Fv7+dwQd/7Fd61fXx8KH3Co0nNUndCBD7b2bphp11BWOD/eEKS
 lR08fobYjIztg9C7cHUrntFJhZJG4CkGLkZLzAwkITnx/TlSssWefuMg2R+Uy9O7w7Yh
 crkBzoXs/ttWXKyMvq42BmkvXAZ3c4249jEr05zoh0kSDJcTefyVGjiAAeM38LnBZvXv
 7i7bt9Px6ObiYjKREwAjQCvjU0Sx9Dr3Y3UZcNYYU9I23OgYHXHacETpGUkl8+gWMj9a
 h/KtOuafrx1zvTOqVSLueBUy/L0KWVXwbekz90OxCqewlvLHVVPsBNOa21jJtdcUJ8gw
 hzzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=83KiGFoNtGPqyblMBIz+WZjMPoTSZQPsJJH3xtL0coY=;
 b=M6ZPD78BZ2aUOdNTlt73RWPlQkzzYQ8wqxxcxjd1oknszUeJuTmK56phFnPVvxbkb8
 JzlSy4iBd4azSbNkyQzArO3kMuxLiRbvTe9t6j94poLeZ10hAFbFqF6EiL2QolpijZj6
 2wm3hIVokYKlyJCsuGjy/TWyrgpQG30abnY/1yjGrMtDg7qWeKr4g2GrX73R7KpuxPP0
 scu2q64mr5osVJnp7jVkd7+VeH02bxuqLCYa/gf9mAm9ix/mpQAVpvSLkudI/weommoK
 Ahn8KazetiHm/bQclJbXiIw/62KJgMtnglk6wobMYrVTa3FmK4OdSzbmsKfhK5Uiaq8v
 PzGA==
X-Gm-Message-State: AE9vXwNdTphgt5B8yPtijDvdjys71kATYUrZ9QCVQynBIK8am+lAEwlanElw9Kn76OXNUOAV
X-Received: by 10.98.105.135 with SMTP id e129mr19525504pfc.59.1472670160290; 
 Wed, 31 Aug 2016 12:02:40 -0700 (PDT)
Received: from mactruck.mtv.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id 191sm1452574pfx.68.2016.08.31.12.02.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 31 Aug 2016 12:02:39 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: openbmc@lists.ozlabs.org
Cc: Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH 2/2] i2c: aspeed: added documentation for Aspeed I2C driver
Date: Wed, 31 Aug 2016 12:02:27 -0700
Message-Id: <1472670147-8888-3-git-send-email-brendanhiggins@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1472670147-8888-1-git-send-email-brendanhiggins@google.com>
References: <1472670147-8888-1-git-send-email-brendanhiggins@google.com>
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
X-List-Received-Date: Wed, 31 Aug 2016 19:02:42 -0000

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
