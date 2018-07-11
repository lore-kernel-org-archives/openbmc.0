Return-Path: <ryanchen.aspeed@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c00::241; helo=mail-pf0-x241.google.com;
 envelope-from=ryanchen.aspeed@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="fkxoSFR1"; 
 dkim-atps=neutral
Received: from mail-pf0-x241.google.com (mail-pf0-x241.google.com
 [IPv6:2607:f8b0:400e:c00::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41QS692FHlzF35Y
 for <openbmc@lists.ozlabs.org>; Wed, 11 Jul 2018 15:18:57 +1000 (AEST)
Received: by mail-pf0-x241.google.com with SMTP id y8-v6so17610951pfm.10
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jul 2018 22:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=FJr+FLWPB8+BSO4MxQOovjyWtA3KnP5Hsyz9sNJ0ZL4=;
 b=fkxoSFR114ofRr3xZhSJ+ish4wsMy60GHke+w2K+qRh+L9a+QxxtywI1s6sUkmAtH/
 FTt+pzjONuq0el+ufYzgoaZzrPJQUstg+dHZb+TvddS/VldFuxUaa92TTZhI1cmVdtNX
 KP/VgzzNVSjkESeT7b7hvqVv/TzPcXb/LfebolD1w52oowInAodTLshUnSIAIvPAD3/e
 MKD0xYqhtH4F0UKXBDvEaPlzZAkbp+CT9bkQaAp9rjDNotAJtFa+6uSMElA4u/aj901u
 QsBvvDfrZ8In0wg9Jnth5fZ6yaxALPCRV/QtK7G3YkLRHtfJG6lfQT9++IQTGeI5yjDE
 cwNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=FJr+FLWPB8+BSO4MxQOovjyWtA3KnP5Hsyz9sNJ0ZL4=;
 b=qsL6XWa75xBAPor5IpNBkHSiAQu7BWHgVBbIRGDV0xPbJSkAqHpoZrCBd8BMQDVveM
 DUJzZouQGnIcAPap9ngpJ+2mm3kQyJ6wWCLd5LbZqlggWCnUbfSKj5KOdqGBHBZRX30h
 ElMEIoDPKmWUE6Q+h01OufX5Ejxc8PH2c+Nnb5FHpMVCP+X/cPtUkw1m6+vOXgzWneeu
 kKGFcQlvSDwK3uJXYWpA7zMybJ3g7F/sjf0owI+eL/outWwGh5I7hgEpjiq0VepucsjI
 WsmygKUfXOFQwQQPmRJ2Wo3cg+8vU6TyoUgQ3FZNolWqC//MaOTKX2nDUrqefzeT9bK2
 ZUOQ==
X-Gm-Message-State: APt69E1tqmksbL0Xy/shsrWGcW6+k3i10Vwh7uKPwzl3LsCjKkBoyfw3
 viErh7F4w5xoG7IIst28NM6HpQ==
X-Google-Smtp-Source: AAOMgpfH6ufRolGQG2Y4dp8fqdMqX6U+VkQLT1pBkXmHMwyJuyu8eJAnJUHYv6i6/FjDEGIi7PKUXA==
X-Received: by 2002:a62:cd3:: with SMTP id
 80-v6mr21547370pfm.184.1531286334930; 
 Tue, 10 Jul 2018 22:18:54 -0700 (PDT)
Received: from ryan-ubuntu.aspeedtech.com (211-20-114-70.HINET-IP.hinet.net.
 [211.20.114.70])
 by smtp.gmail.com with ESMTPSA id p18-v6sm21357097pfe.22.2018.07.10.22.18.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 10 Jul 2018 22:18:54 -0700 (PDT)
From: Ryan Chen <ryanchen.aspeed@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: Ryan Chen <ryanchen.aspeed@gmail.com>, joel@jms.id.au, andrew@aj.id.au,
 ryan_chen@aspeedtech.com, benh@kernel.crashing.org, mine260309@gmail.com
Subject: [PATCH linux dev-4.17 6/7] dts: Aspeed: Add devicetree for Aspeed
 sdhci
Date: Wed, 11 Jul 2018 13:17:09 +0800
Message-Id: <1531286230-28453-7-git-send-email-ryanchen.aspeed@gmail.com>
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
X-List-Received-Date: Wed, 11 Jul 2018 05:18:57 -0000

Add devicetree for Aspeed's sdhci

Signed-off-by: Ryan Chen <ryanchen.aspeed@gmail.com>
---
 .../bindings/mmc/aspeed,aspeed-sdhci.txt           | 42 ++++++++++++++++++++++
 arch/arm/boot/dts/aspeed-ast2500-evb.dts           | 14 ++++++++
 arch/arm/boot/dts/aspeed-g4.dtsi                   | 20 +++++++++++
 arch/arm/boot/dts/aspeed-g5.dtsi                   | 20 +++++++++++
 4 files changed, 96 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mmc/aspeed,aspeed-sdhci.txt

diff --git a/Documentation/devicetree/bindings/mmc/aspeed,aspeed-sdhci.txt b/Documentation/devicetree/bindings/mmc/aspeed,aspeed-sdhci.txt
new file mode 100644
index 0000000..c7cb985
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/aspeed,aspeed-sdhci.txt
@@ -0,0 +1,42 @@
+Device Tree Bindings for the ASPEED SoC SDHCI Controller
+
+This file documents differences between the core properties in mmc.txt
+and the properties present in the ASPEED SDHCI
+
+Required properties:
+- compatible : should be "aspeed,ast2500-sdhci" or "aspeed,ast2400-sdhci"
+- clocks : phandle + clock specifier pair of the external clock
+- interrupts : interrupt number
+- interrupt-parent : interrupt controller for bus, should reference a
+                     aspeed,aspeed-sdhci-ic interrupt controller
+
+Example:
+
+sdhci {
+	compatible = "simple-bus";
+	#address-cells = <1>;
+	#size-cells = <1>;
+	ranges = <0 0x1e740000 0x1000>;
+
+	sdhci_ic: interrupt-controller@0 {
+		#interrupt-cells = <1>;
+		compatible = "aspeed,aspeed-sdhci-irq";
+		reg = <0x0 0x100>;
+		interrupts = <26>;
+		interrupt-controller;
+		clocks = <&syscon ASPEED_CLK_GATE_SDCLKCLK>;
+		clock-names = "sdclk", "sd_extclk";
+	};
+
+	sdhci_slot0: sdhci_slot0@100 {
+		compatible = "aspeed,sdhci-ast2500";
+		reg = <0x100 0x100>;
+		interrupts = <0>;
+		interrupt-parent = <&sdhci_ic>;
+		slot = <0>;
+		sdhci,auto-cmd12;
+		clocks = <&syscon ASPEED_CLK_SDIO>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_sd1_default>;
+	};
+};
diff --git a/arch/arm/boot/dts/aspeed-ast2500-evb.dts b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
index 5dbb33c..5578ae0 100644
--- a/arch/arm/boot/dts/aspeed-ast2500-evb.dts
+++ b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
@@ -97,6 +97,20 @@
 	};
 };
 
+&sdhci_slot0 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sd1_default>;
+};
+
+&sdhci_slot1 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sd2_default>;
+};
+
 /*
  * Enable port A as device (via the virtual hub) and port B as
  * host by default on the eval board. This can be easily changed
diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index 7ad646d..f4a8d7d 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -387,6 +387,26 @@
 		clocks = <&syscon ASPEED_CLK_GATE_SDCLKCLK>;
 	};
 
+	sdhci_slot0: sdhci_slot0@100 {
+		compatible = "aspeed,sdhci-ast2400";
+		reg = <0x100 0x100>;
+		interrupts = <0>;
+		interrupt-parent = <&sdhci_ic>;
+		sdhci,auto-cmd12;
+		clocks = <&syscon ASPEED_CLK_SDIO>;
+		status = "disabled";
+	};
+
+	sdhci_slot1: sdhci_slot1@200 {
+		compatible = "aspeed,sdhci-ast2400";
+		reg = <0x200 0x100>;
+		interrupts = <1>;
+		interrupt-parent = <&sdhci_ic>;
+		sdhci,auto-cmd12;
+		clocks = <&syscon ASPEED_CLK_SDIO>;
+		status = "disabled";
+	};
+
 };
 
 &i2c {
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index ba850ca..effe631 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -464,6 +464,26 @@
 		clocks = <&syscon ASPEED_CLK_GATE_SDCLKCLK>;
 	};
 
+	sdhci_slot0: sdhci_slot0@100 {
+		compatible = "aspeed,sdhci-ast2500";
+		reg = <0x100 0x100>;
+		interrupts = <0>;
+		interrupt-parent = <&sdhci_ic>;
+		sdhci,auto-cmd12;
+		clocks = <&syscon ASPEED_CLK_SDIO>;
+		status = "disabled";
+	};
+
+	sdhci_slot1: sdhci_slot1@200 {
+		compatible = "aspeed,sdhci-ast2500";
+		reg = <0x200 0x100>;
+		interrupts = <1>;
+		interrupt-parent = <&sdhci_ic>;
+		sdhci,auto-cmd12;
+		clocks = <&syscon ASPEED_CLK_SDIO>;
+		status = "disabled";
+	};
+
 };
 
 &i2c {
-- 
2.7.4
