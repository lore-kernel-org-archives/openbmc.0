Return-Path: <openbmc+bounces-1538-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA82FB5E83
	for <openbmc@archiver.kernel.org>; Mon, 16 Mar 2026 22:48:13 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fZVc75bnqz2yhG;
	Tue, 17 Mar 2026 09:48:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773640485;
	cv=none; b=Pa5NtGoaHFwBBZ94LtnF/Ylb/jrprlxrIg5ZrrjRs3r0Wd+/SWmhygNiw4mvgU6yF+nzFHmFvJfwboa7BcnE7tYFBGxNTF/LCpjBudBm/XhgnP/v87dM9yTMP1/d55KzB7nQnpsXBNTmfhIBtVyK4C6U9lG0d9TgZIH23eBgaPd7/218kz7RazVpkYluL4/kM+gZ0dTGoELhCUh0XEjzL5UMdpeFvDy9TADV8YmjycKHrguBSXpMrsx6aVboniU6nwYzssXOCjdbpiYC8Sn2G+ZhIuLez0wzoP0pgH4eh1Rw1lNxYR7b6xXYwINBnXoDh2R1rqC32BRQFhmEGSpGkw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773640485; c=relaxed/relaxed;
	bh=HvbJo4sg+keqA0UYOTwphLAy1mW7zcwD5w4Qm8DSQTA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H44TAdh6nIu1gILmDFuzCn+hUJYZ8oqxULreIvUxhggRvCOT8lrttzE2LSNwJYx84czBbFs+ETCdK1AojUpLdCgxqhTtVz/z2NFvUuulaLUpgN0iFWveLYkKsIr1GxOFwaVit6iYz54macyv14E1NNrGycWwJZuMqZbzdU6pRAyHxn9ZGU+0h9LKcjI+Ci116lTfGePwXnb28+M2ScfyghXtcspa3LsbJGNCplcYkvpNuOiBRIRE/gIVstAqMASFZuE+VyooRsOZUtKuTY+AsMYDob8KuJmocgy8SxClSEMfLJmPXBnt5J49F4GkzV4HzoQvoiNQ6ofJ+v0VUufvWg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PzdWvvUR; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PzdWvvUR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fZ46r6QL4z2xlP
	for <openbmc@lists.ozlabs.org>; Mon, 16 Mar 2026 16:54:44 +1100 (AEDT)
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-c7381c4345cso1711682a12.1
        for <openbmc@lists.ozlabs.org>; Sun, 15 Mar 2026 22:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773640483; x=1774245283; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HvbJo4sg+keqA0UYOTwphLAy1mW7zcwD5w4Qm8DSQTA=;
        b=PzdWvvURY6m6HwHwt3/eADJV/eoroH10+EqEVjg3EIqkBhIfxLDFkJbw+2TAWhX98T
         zvjKNeOTyvTj8iVtsgWHpWL7KOWvKO4Y+T45yxnXXw87+gZnkkOqDCY9z/Yc09q7bZND
         uwA9zm/7cv3g2ZGYoY6rmIfd6HWfixkEa89nre5VBbZ6/XVNhuJnrZxlhHxoFYieWyRZ
         JHixX/XPI20bwVgNlUARogztfFsdc9ae/mI8RDOE/Qi+ypiZAJQX4L/tz+T4C5QeZvax
         AGKpIzljyiF+DtYgMlKL6gumHlI6/XzC8GPXLbHLMXUJeTsIbTU/01tEve+Dta5Z/rI2
         Eiow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773640483; x=1774245283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HvbJo4sg+keqA0UYOTwphLAy1mW7zcwD5w4Qm8DSQTA=;
        b=N7uiq+cHAvQ9uCjDZEMhZLRHmx1lu0YVbM3xG33h1HNWXJNZat579t7ppZQIiYjilu
         XM0RWk5M9SOvga9Kb0Q7nUBM0lfbV3mmjknj2wz6v8A+OcYHgvRIMGLV8G1wViSgNBSD
         g/9eyDPuOaISDNbqG3gXEiuPFYk3pyhgi3kmn/goIalm8AC/Y+TyQJGLTW5o9LsNO6yZ
         GM7RellgS6xvZtRXUKmFlBeC9S0dYHij1uorGjhkKe2EW9z9L1jvrozWmUnuOVJK98vJ
         cXU1aSzAX0m3SmA7/wikdNbdjszyKQ2SuhvjBEWq55/2mxnHDEOIR0j8W+99u/SrqJRp
         wSwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQZaSWhKrnJjSPEM57+7kxr4Syk2mCEolDqtWQj75ybsO6KcwhF3r6uMtUAJRe9YDSF5Xr21G1@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxxXMsCzQBcapHuiWNOLVUOomdalnpUSG7Q+Jaaj7vInAwKVHjZ
	LV9R05yyE2JvJKTC68Upw5yOAY7JfGvNR1/p+br3Xs8J+GfEknj1tAY/
X-Gm-Gg: ATEYQzwFOpDqFnFi8cCIFtyFcxPvik157Tetv8JIgSuMGJN0EeParPrzjLcVdWX7Uac
	HA86bcRQrVxTifIkCdSF57XefUCsmMv+Rw+9tsAmTZY8Fxo3LW2DUKtywnWRRe+ymfrQ/tEEuOV
	HSdsmswbn5Rx06OyT78l0Wz6BlOVLUFn9qMA8nCvliTSbnuYG0UIGR53D/gIfOvhKunVI7yU8Sl
	Yn90Aa6YsqqF3LH6tTSehdBYgfaJUQ0yOzHBWrVskMsd6ylH4JiaM1mbALkGH/wnb+vjfnJ7KxI
	54El6hPxVCRto5izKI0NTfK398aJhsSGcpLG927xNJOq2gAUuZYidU3tZX4IytZWI3TZR/BTkPs
	1M07csbJ86hdeNFdwz2FPPN+6krWG9TwtIaadArYudvNJ4u3xYYEH29G9Tgr/QfXHB/qayIBFVc
	0Pt6R7dcZmYT7Mw5MM3SMsCe7l6QynQ6DnpwAKOVr1uhsa9UsvqrtUSUcEWcf1X+S6mPppxsApO
	xKJ6quaRVqOnzu5wv0iNuw=
X-Received: by 2002:a17:90b:580c:b0:359:8df1:8553 with SMTP id 98e67ed59e1d1-35a21fd7ac6mr9309269a91.9.1773640482884;
        Sun, 15 Mar 2026 22:54:42 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35b9db7dfe6sm2166285a91.8.2026.03.15.22.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 22:54:42 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mcoquelin.stm32@gmail.com,
	richardcochran@gmail.com
Cc: alexandre.torgue@foss.st.com,
	joabreu@synopsys.com,
	ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	peppe.cavallaro@st.com,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH net-next v14 2/3] arm64: dts: nuvoton: Add Ethernet nodes
Date: Mon, 16 Mar 2026 13:54:26 +0800
Message-ID: <20260316055427.1310569-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260316055427.1310569-1-a0987203069@gmail.com>
References: <20260316055427.1310569-1-a0987203069@gmail.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add GMAC nodes for our MA35D1 development boards:
two RGMII interfaces for SOM board, and one RGMII
and one RMII interface for IoT board.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      | 25 +++++++++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 24 +++++++++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 52 +++++++++++++++++++
 3 files changed, 101 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
index 9482bec1aa57..78534d613486 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
@@ -18,6 +18,8 @@ aliases {
 		serial12 = &uart12;
 		serial13 = &uart13;
 		serial14 = &uart14;
+		ethernet0 = &gmac0;
+		ethernet1 = &gmac1;
 	};
 
 	chosen {
@@ -126,3 +128,26 @@ &uart14 {
 	pinctrl-0 = <&pinctrl_uart14>;
 	status = "okay";
 };
+
+&gmac0 {
+	status = "okay";
+	phy-handle = <&eth_phy0>;
+};
+
+&mdio0 {
+	eth_phy0: ethernet-phy@0 {
+		reg = <0>;
+	};
+};
+
+&gmac1 {
+	status = "okay";
+	phy-mode = "rmii";
+	phy-handle = <&eth_phy1>;
+};
+
+&mdio1 {
+	eth_phy1: ethernet-phy@1 {
+		reg = <1>;
+	};
+};
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
index f6f20a17e501..a029b660e8dc 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
@@ -18,6 +18,8 @@ aliases {
 		serial12 = &uart12;
 		serial14 = &uart14;
 		serial16 = &uart16;
+		ethernet0 = &gmac0;
+		ethernet1 = &gmac1;
 	};
 
 	chosen {
@@ -129,3 +131,25 @@ &uart16 {
 	pinctrl-0 = <&pinctrl_uart16>;
 	status = "okay";
 };
+
+&gmac0 {
+	status = "okay";
+	phy-handle = <&eth_phy0>;
+};
+
+&mdio0 {
+	eth_phy0: ethernet-phy@0 {
+		reg = <0>;
+	};
+};
+
+&gmac1 {
+	status = "okay";
+	phy-handle = <&eth_phy1>;
+};
+
+&mdio1 {
+	eth_phy1: ethernet-phy@1 {
+		reg = <1>;
+	};
+};
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
index e51b98f5bdce..7228ad4735b5 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -379,5 +379,57 @@ uart16: serial@40880000 {
 			clocks = <&clk UART16_GATE>;
 			status = "disabled";
 		};
+
+		gmac0: ethernet@40120000 {
+			compatible = "nuvoton,ma35d1-dwmac", "snps,dwmac-3.70a";
+			reg = <0x0 0x40120000 0x0 0x10000>;
+			interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			clocks = <&clk EMAC0_GATE>, <&clk EPLL_DIV8>;
+			clock-names = "stmmaceth", "ptp_ref";
+
+			nuvoton,sys = <&sys 0>;
+			resets = <&sys MA35D1_RESET_GMAC0>;
+			reset-names = "stmmaceth";
+			snps,multicast-filter-bins = <0>;
+			snps,perfect-filter-entries = <8>;
+			rx-fifo-depth = <4096>;
+			tx-fifo-depth = <2048>;
+
+			phy-mode = "rgmii-id";
+			status = "disabled";
+
+			mdio0: mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		gmac1: ethernet@40130000 {
+			compatible = "nuvoton,ma35d1-dwmac", "snps,dwmac-3.70a";
+			reg = <0x0 0x40130000 0x0 0x10000>;
+			interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			clocks = <&clk EMAC1_GATE>, <&clk EPLL_DIV8>;
+			clock-names = "stmmaceth", "ptp_ref";
+
+			nuvoton,sys = <&sys 1>;
+			resets = <&sys MA35D1_RESET_GMAC1>;
+			reset-names = "stmmaceth";
+			snps,multicast-filter-bins = <0>;
+			snps,perfect-filter-entries = <8>;
+			rx-fifo-depth = <4096>;
+			tx-fifo-depth = <2048>;
+
+			phy-mode = "rgmii-id";
+			status = "disabled";
+
+			mdio1: mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
 	};
 };
-- 
2.43.0


