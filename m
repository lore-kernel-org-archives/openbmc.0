Return-Path: <ryanchen.aspeed@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c00::241; helo=mail-pf0-x241.google.com;
 envelope-from=ryanchen.aspeed@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="MmiP+xQr"; 
 dkim-atps=neutral
Received: from mail-pf0-x241.google.com (mail-pf0-x241.google.com
 [IPv6:2607:f8b0:400e:c00::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41VBhq1FJPzF3Hx
 for <openbmc@lists.ozlabs.org>; Tue, 17 Jul 2018 17:28:27 +1000 (AEST)
Received: by mail-pf0-x241.google.com with SMTP id k19-v6so83429pfi.1
 for <openbmc@lists.ozlabs.org>; Tue, 17 Jul 2018 00:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=XELpOjgit+nCfSwRRXIApCcpQveodg30tP3Suiy8k5k=;
 b=MmiP+xQrTuXT3vH775o17lMX5091qM6kwdrDyQb5MwRZyB9LCZ7XmhPK4fP5yIoFPx
 4/AGAW1yL5/F6tD36WBoHpXsAF/u25s6Mfr88wI3hdkKACM3mUXSxFV9he1pFCV6zKBo
 ohPleSH6CmrI8iaAwp5ANPkkFirEahiKMb9NCvs8VE5zixJblkFKFAKGyMtXmj3d2LxE
 hviUsHPBeji92Lk3WG85qFV9jJ84o29u0Km9z12FyqVdP66MKNdccNczZnP+vbKmwAfQ
 TWGwh+a3LcH6HoedKSFmwYxpzj8gAsIIPRwwktTZXCsRGMkVT7Fzb55BspyAJrt6Jsr9
 QSAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=XELpOjgit+nCfSwRRXIApCcpQveodg30tP3Suiy8k5k=;
 b=j3gNkfEpBhJi7anQEm0aNBVJzkk9OWij15wzpVVWnJyE83b6nVtQB9cQOg/HwQyRsn
 D6Mr0DEbmaCCygy6uJmu15ZKcWdb4x1sYvnG3zl0kwMwdey6frm3DhaG5ouZSmZz3aRh
 8ASR4Y8ndo4jRKtU31jWMvt28n5JA5wx7YYBtYzgsIXQPZFBkTJpJavY9hbm+hgOUKVI
 1kFagixvYExrj1+zWt0bE/6VBEONaa3rxlMbqe6Onn35qWxR0vmxzr6ScPXonTsvsUcq
 0zJ1Lg90aKCxv+E7Rx5t8LcDEM3uGxE6noccVRPL2rSxXQ0rKELjp/xTLc0wScjWQXmL
 f/nA==
X-Gm-Message-State: AOUpUlHP9pjXiYJWolche4EZadk5efkLH1veXzuTARRboB6jV5yzJ7y6
 8fi/kU1eWqHCyfUgjXxZlGqoRg==
X-Google-Smtp-Source: AAOMgpfSSje32mquPk6HXvaQ8GTQDF5JyRFpb3ADN1XQcv8qhpVRPZ397rPvYyg8a+Ua9dttxBBgAA==
X-Received: by 2002:a62:45d2:: with SMTP id
 n79-v6mr515631pfi.137.1531812505065; 
 Tue, 17 Jul 2018 00:28:25 -0700 (PDT)
Received: from ryan-ubuntu.aspeedtech.com (211-20-114-70.HINET-IP.hinet.net.
 [211.20.114.70])
 by smtp.gmail.com with ESMTPSA id f6-v6sm578647pgp.13.2018.07.17.00.28.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 17 Jul 2018 00:28:24 -0700 (PDT)
From: Ryan Chen <ryanchen.aspeed@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: Ryan Chen <ryanchen.aspeed@gmail.com>, joel@jms.id.au, andrew@aj.id.au,
 ryan_chen@aspeedtech.com, benh@kernel.crashing.org, mine260309@gmail.com
Subject: [PATCH linux dev-4.17 6/7] Documentation: mmc: add aspeed sdhci
 binding document
Date: Tue, 17 Jul 2018 15:26:17 +0800
Message-Id: <1531812378-14316-7-git-send-email-ryanchen.aspeed@gmail.com>
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
X-List-Received-Date: Tue, 17 Jul 2018 07:28:28 -0000

add aspeed sdhci binding document

V0->V1
add independent patch for binding document

Signed-off-by: Ryan Chen <ryanchen.aspeed@gmail.com>
---
 .../bindings/mmc/aspeed,aspeed-sdhci.txt           | 54 ++++++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mmc/aspeed,aspeed-sdhci.txt

diff --git a/Documentation/devicetree/bindings/mmc/aspeed,aspeed-sdhci.txt b/Documentation/devicetree/bindings/mmc/aspeed,aspeed-sdhci.txt
new file mode 100644
index 0000000..6ad30e5
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/aspeed,aspeed-sdhci.txt
@@ -0,0 +1,54 @@
+Device Tree Bindings for the Aspeed SoC SDHCI Controller
+
+This file documents differences between the core properties in mmc.txt
+and the properties present in the Aspeed SDHCI
+Aspeed SD/SDIO Host controller have have general information in front of controller.
+In ast25xx/ast24xx have two slots, and each slot have own register.
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
+
+	sdhci_slot1: sdhci_slot1@200 {
+		compatible = "aspeed,sdhci-ast2500";
+		reg = <0x200 0x100>;
+		interrupts = <1>;
+		interrupt-parent = <&sdhci_ic>;
+		sdhci,auto-cmd12;
+		clocks = <&syscon ASPEED_CLK_SDIO>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_sd2_default>;
+	};
+};
-- 
2.7.4
