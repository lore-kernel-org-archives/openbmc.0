Return-Path: <ryanchen.aspeed@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c01::242; helo=mail-pl0-x242.google.com;
 envelope-from=ryanchen.aspeed@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ez9qMwQ4"; 
 dkim-atps=neutral
Received: from mail-pl0-x242.google.com (mail-pl0-x242.google.com
 [IPv6:2607:f8b0:400e:c01::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41QS626vz2zF35c
 for <openbmc@lists.ozlabs.org>; Wed, 11 Jul 2018 15:18:50 +1000 (AEST)
Received: by mail-pl0-x242.google.com with SMTP id 31-v6so8630911plc.4
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jul 2018 22:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ceXG4LJt4BA5FfL8fZ/C/7NGzDwQJCWg44JRl21zHWo=;
 b=Ez9qMwQ4QjwWXz2gMzCxWYJFeOlqQHa2ycpygYJrJXUq3nGc6vifcMDlmAVtaI+nV3
 ybuQVB9CgpLLbwbXUAKj/dYNiIXntJN90CKofBBRiUSMNbh/DYd59DcqGiUQx2g7Y8xb
 uel6zprazRPZuXoh9yLmAbFElyLdMcvHWrWQOka6lCf8LRcSxLL8ISSyjfEONsvmk5Z2
 wO8ldr0EnkTLP/K2qox2sDBIRxjdGpirkjXv0W+NrfEgSq4Mw73wHXlTrGTGTtSdYdJb
 nfoGx7sVcBh1G3kwXbVLgmO3LW1BlSJtlaX4POydSswdIHOKmMiwIXDsBAoJMe2c1HSv
 JUeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ceXG4LJt4BA5FfL8fZ/C/7NGzDwQJCWg44JRl21zHWo=;
 b=lzP//nguKv7FYt2PJxA5WfK5isheysODH6YB5U/0T2SSWZcyUzs+7W2UagP7jN/652
 FN0wB56Yysl5WpjrU4rOxsENi0z+idHvVyYE1PNRiTCFs6XlnQpILnvcGCErbuh6LFdN
 ZcAtrDFXQEo7AmmZIzPvSpMT9oHoRkivBmduoiDIqB1Opv6nTrvLMETcuH/HNRLOz/WH
 q6D2wHVdqWg5+jfdGB/2rIPtmBha5PB8gssY0ZMS+AwRrm50u81EGX2vOfJqVP3dz4OH
 I1JUREXh0OU5lIKerN3s9R4LxRFmdjjzf2r6j0FtQQO4xLkuC9tHvLHaeyH2++q1Tn4G
 R8Fg==
X-Gm-Message-State: APt69E1kYK9zshaXcKxmdlDVJ2ax323KbbyULc9tkQW78X1xmaWZ6Li4
 cBhtkcNnctWCx7a3pwZ7hXCt0Q==
X-Google-Smtp-Source: AAOMgpc9+AbU8gF7Tc4wrTFj0EaWyxdCkzy+K8aEugmXtWjJybniHetobVzxKH5P4wv+So2mMG8xmA==
X-Received: by 2002:a17:902:780e:: with SMTP id
 p14-v6mr22595391pll.239.1531286328583; 
 Tue, 10 Jul 2018 22:18:48 -0700 (PDT)
Received: from ryan-ubuntu.aspeedtech.com (211-20-114-70.HINET-IP.hinet.net.
 [211.20.114.70])
 by smtp.gmail.com with ESMTPSA id p18-v6sm21357097pfe.22.2018.07.10.22.18.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 10 Jul 2018 22:18:47 -0700 (PDT)
From: Ryan Chen <ryanchen.aspeed@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: Ryan Chen <ryanchen.aspeed@gmail.com>, joel@jms.id.au, andrew@aj.id.au,
 ryan_chen@aspeedtech.com, benh@kernel.crashing.org, mine260309@gmail.com
Subject: [PATCH linux dev-4.17 4/7] dts: Aspeed: Add Aspeed sdhci dts document
Date: Wed, 11 Jul 2018 13:17:07 +0800
Message-Id: <1531286230-28453-5-git-send-email-ryanchen.aspeed@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1531286230-28453-1-git-send-email-ryanchen.aspeed@gmail.com>
References: <1531286230-28453-1-git-send-email-ryanchen.aspeed@gmail.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Jul 2018 05:18:51 -0000

This add Aspeed sdhci irq driver's dts file and devicetree document

Signed-off-by: Ryan Chen <ryanchen.aspeed@gmail.com>
---
 .../aspeed,aspeed-sdhci-ic.txt                     | 25 ++++++++++++++++++++++
 arch/arm/boot/dts/aspeed-g4.dtsi                   | 20 +++++++++++++++++
 arch/arm/boot/dts/aspeed-g5.dtsi                   | 20 +++++++++++++++++
 3 files changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/aspeed,aspeed-sdhci-ic.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/aspeed,aspeed-sdhci-ic.txt b/Documentation/devicetree/bindings/interrupt-controller/aspeed,aspeed-sdhci-ic.txt
new file mode 100644
index 0000000..e3393c3
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/aspeed,aspeed-sdhci-ic.txt
@@ -0,0 +1,25 @@
+Device tree configuration for the SDHCI Interrupt Controller on the AST24XX and
+AST25XX SoCs.
+
+Required Properties:
+- #address-cells	: should be 1
+- #size-cells 		: should be 1
+- #interrupt-cells 	: should be 1
+- compatible 		: should be "aspeed,aspeed-sdhci-ic"
+- reg			: address start and range of controller
+- interrupts		: interrupt number
+- interrupt-controller	: denotes that the controller receives and fires
+			  new interrupts for child busses
+
+Example:
+
+sdhci_ic: interrupt-controller@0 {
+	#interrupt-cells = <1>;
+	#size-cells = <1>;
+	#interrupt-cells = <1>;
+	compatible = "aspeed,aspeed-sdhci-irq";
+	reg = <0x0 0x100>;
+	interrupts = <26>;
+	interrupt-controller;
+	clocks = <&syscon ASPEED_CLK_GATE_SDCLKCLK>;
+};
\ No newline at end of file
diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index e86fa80..7ad646d 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -190,6 +190,13 @@
 				reg = <0x1e720000 0x8000>;	// 32K
 			};
 
+			sdhci: sdhci@1e740000 {
+				compatible = "simple-bus";
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0 0x1e740000 0x1000>;
+			};
+
 			gpio: gpio@1e780000 {
 				#gpio-cells = <2>;
 				gpio-controller;
@@ -369,6 +376,19 @@
 	};
 };
 
+&sdhci {
+
+	sdhci_ic: interrupt-controller@0 {
+		#interrupt-cells = <1>;
+		compatible = "aspeed,aspeed-sdhci-irq";
+		reg = <0x0 0x100>;
+		interrupts = <26>;
+		interrupt-controller;
+		clocks = <&syscon ASPEED_CLK_GATE_SDCLKCLK>;
+	};
+
+};
+
 &i2c {
 	i2c_ic: interrupt-controller@0 {
 		#interrupt-cells = <1>;
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index d92f047..ba850ca 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -256,6 +256,13 @@
 				reg = <0x1e720000 0x9000>;	// 36K
 			};
 
+			sdhci: sdhci@1e740000 {
+				compatible = "simple-bus";
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0 0x1e740000 0x1000>;
+			};
+
 			gpio: gpio@1e780000 {
 				#gpio-cells = <2>;
 				gpio-controller;
@@ -446,6 +453,19 @@
 	};
 };
 
+&sdhci {
+
+	sdhci_ic: interrupt-controller@0 {
+		#interrupt-cells = <1>;
+		compatible = "aspeed,aspeed-sdhci-irq";
+		reg = <0x0 0x100>;
+		interrupts = <26>;
+		interrupt-controller;
+		clocks = <&syscon ASPEED_CLK_GATE_SDCLKCLK>;
+	};
+
+};
+
 &i2c {
 	i2c_ic: interrupt-controller@0 {
 		#interrupt-cells = <1>;
-- 
2.7.4
