Return-Path: <ryanchen.aspeed@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c01::242; helo=mail-pl0-x242.google.com;
 envelope-from=ryanchen.aspeed@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="WvwLYGk5"; 
 dkim-atps=neutral
Received: from mail-pl0-x242.google.com (mail-pl0-x242.google.com
 [IPv6:2607:f8b0:400e:c01::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41VBhm20cczF3Hp
 for <openbmc@lists.ozlabs.org>; Tue, 17 Jul 2018 17:28:24 +1000 (AEST)
Received: by mail-pl0-x242.google.com with SMTP id 30-v6so58976pld.13
 for <openbmc@lists.ozlabs.org>; Tue, 17 Jul 2018 00:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=YidyZgNZNpk32kdZhvybpYUgMicOWIzAd55BNjl+II8=;
 b=WvwLYGk54FqoK0QrOraBNFvTN5lXBL0vZL3O38tdO2g0pH7RGFpAuA6nc+UJxXC2Cf
 Vcs1urFOEUQ2Vlp7r6lSyR45BEF2u2h/qRubasicA74HXyNQkUNzRV+kmA3yk6nbSi7k
 Dvj9ePSP+tioxeZ57Iq5gfCuj2Oc4Dcw6WGaFy0pIs2wUxtXM8Tiqs2mARqDr2U3kGif
 jLct6PXd8GGO04UXzxGOS8fgKQgmxhlPpkN+9JlSMBSLCfymvalm3TA2taur65JX2BY8
 /4VuPWaOySKGCqF20ao0Lq5xcAvcMtmNBs87WBeQULro4eqVVPR46a7x0WnmQ5OVjiq8
 EvwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=YidyZgNZNpk32kdZhvybpYUgMicOWIzAd55BNjl+II8=;
 b=bPwcRq4Ih4Tnx8IFaZnpNHh654O01JEg9UevvSWALjGrgnEgD6MmWNs8gLkqXJBOCj
 D45FkxwHiag/8jYgPjtBd11KjsY/wwfY+WJznbYhOo+i2St5dVBvf1G2DzN2thrMeg27
 5pB2C1paT8T9bS6aAwyW9Eitn++mBkij45Jj4vjEQDJRjFrrxk39xkbDU1nQiQuqKfyI
 uRIIfA4VLC/oyFEUM54q6DC8JE/WIFGzjQ41qQYP3P6555tie+3WFxuacpVtrDIsE7ke
 M0Vrodsa9W08Uovnw3qLVVI18ZxAtu+1aFqogWMcLsqhW/OgyqhmPCfrenQ0+C/6wPMF
 he1w==
X-Gm-Message-State: AOUpUlEqkMocddsM5E5sXQPIDG6YNzzXFH/j3dfxIsplsqqZHydHmPTn
 47aub0jLSTbguhft/KrJ+A0evQ==
X-Google-Smtp-Source: AAOMgpfAaS/mrAlZzsbU8/15RhIc5+Y7BDwnCz7RLNnr0vjO0iliZypDBTuTJjZWdL915JhWuS6eRw==
X-Received: by 2002:a17:902:585:: with SMTP id
 f5-v6mr518179plf.7.1531812502337; 
 Tue, 17 Jul 2018 00:28:22 -0700 (PDT)
Received: from ryan-ubuntu.aspeedtech.com (211-20-114-70.HINET-IP.hinet.net.
 [211.20.114.70])
 by smtp.gmail.com with ESMTPSA id f6-v6sm578647pgp.13.2018.07.17.00.28.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 17 Jul 2018 00:28:21 -0700 (PDT)
From: Ryan Chen <ryanchen.aspeed@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: Ryan Chen <ryanchen.aspeed@gmail.com>, joel@jms.id.au, andrew@aj.id.au,
 ryan_chen@aspeedtech.com, benh@kernel.crashing.org, mine260309@gmail.com
Subject: [PATCH linux dev-4.17 5/7] dts: Aspeed: Add devicetree for Aspeed
 sdhci
Date: Tue, 17 Jul 2018 15:26:16 +0800
Message-Id: <1531812378-14316-6-git-send-email-ryanchen.aspeed@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1531812378-14316-1-git-send-email-ryanchen.aspeed@gmail.com>
References: <1531812378-14316-1-git-send-email-ryanchen.aspeed@gmail.com>
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
X-List-Received-Date: Tue, 17 Jul 2018 07:28:25 -0000

Add devicetree for Aspeed's sdhci

V0->V1
separete patch toe device tree and binding document

Signed-off-by: Ryan Chen <ryanchen.aspeed@gmail.com>
---
 arch/arm/boot/dts/aspeed-ast2500-evb.dts | 14 +++++++++++
 arch/arm/boot/dts/aspeed-g4.dtsi         | 40 ++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/aspeed-g5.dtsi         | 40 ++++++++++++++++++++++++++++++++
 3 files changed, 94 insertions(+)

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
index e86fa80..f4a8d7d 100644
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
@@ -369,6 +376,39 @@
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
+};
+
 &i2c {
 	i2c_ic: interrupt-controller@0 {
 		#interrupt-cells = <1>;
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index d92f047..effe631 100644
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
@@ -446,6 +453,39 @@
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
+};
+
 &i2c {
 	i2c_ic: interrupt-controller@0 {
 		#interrupt-cells = <1>;
-- 
2.7.4
