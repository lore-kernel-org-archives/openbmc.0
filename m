Return-Path: <openbmc+bounces-1320-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 268CAEA795F
	for <openbmc@archiver.kernel.org>; Thu,  5 Feb 2026 03:46:16 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f63626TKWz30Pr;
	Thu, 05 Feb 2026 14:45:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770255622;
	cv=none; b=WfJVxcLOl8OrE0e20gMzaeg9v2DEDQmf/sPHhuOcimQqc23e0QB0o+UjPkGLkSHtNVyRxDmdSQubddPrqJM3/EAnZ4JlrTTx47bnT2ePJKMX79iCuRMynyQhFrvK+BNuepq209O1aocxPXuNMq6Pe0TN2ipM/+YmbwOvzNJi6B8Ms8KzGpSZZlv/0+tEhsnIf728Li1Z/RhHpTAwEXUxrfk7B/KWhhkGC5V26OoRoCdVbeO5J6gk/FFpH4bMZEWfVNl3QTFsSdur3CkzXIGiOL1WP98UNZWXKntEVgLYKUa0Y9mB1J8V98w/aUJCMlkztm9QJRPoHtGsOYR7YepVMw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770255622; c=relaxed/relaxed;
	bh=CNKXP9GpRqv+eSR2XeMEVjl61X03fT0QbLuz4FZVIqk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HGjWYRjpOmIdHhAvhUJJhcyo8aP1jeht09oYYoZUjVjtdjR+zdVIRzuP0Zapaa5W+DdoYq7jd2sy/R8J/Q8ACOfTzga5xpWo9gKn9V+/9J6MgtDwIOoB65j9awuURAWg6UWzxdEnDn/tr3HXL5qXTDuUnrohoKzlNtdWhg3aEClBqzx0cR+NnBmgquWJO6xIPAFesDGzsHXND7thyOrSR2g9qzqOwibwx8NnkzQ7Sd1bJZ4zx85D7miUw89+qkl6nYp1IIVWQZrk8TKLGk0SppZuV4FpoIacm3fPDprvaC+Vwo8yGuS6boy/4uBhbOxHgoG5vLJP5Yf8Z6uXAZIt5g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UNQLUZGM; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UNQLUZGM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f60KK5bjHz2xHt
	for <openbmc@lists.ozlabs.org>; Thu, 05 Feb 2026 12:40:21 +1100 (AEDT)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-35480b0827bso310758a91.0
        for <openbmc@lists.ozlabs.org>; Wed, 04 Feb 2026 17:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770255620; x=1770860420; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CNKXP9GpRqv+eSR2XeMEVjl61X03fT0QbLuz4FZVIqk=;
        b=UNQLUZGMBd7B65hx94PaexDWt9iqamneW/WXlON6rwF/t2XE/epVoiZdqsL1sx5NK2
         TweK7aN1yQ0+UzPEZ3pP0DlOIwru1X6iBTLPW+zB3YhmEIMyDMrp6JFXqoHhntm24Ch7
         Uf48TluSqWD52pp4E1nUoBown0exPBdIsdxS0pOZAFu8gbSrJ5kFhk66Dd6rBQOkOLME
         dkMwn3cv0EFWLE8cNBzPvBbYfLyF6EMV5cwOfBuOOpKKAZqDhhBrdZL9+mDdHyq1ezfp
         +pgNzP2w4KpeEOply8NrR+ZF29HIpI9LAprwQziacyGtg1Gh59Lt0AJEnGv7PK0S1xca
         cwyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770255620; x=1770860420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CNKXP9GpRqv+eSR2XeMEVjl61X03fT0QbLuz4FZVIqk=;
        b=uWzTPniZEUOHh9u6dCO5IuXIrNWDMM8cX9+9QG4Yhosurpbv7e4Iu9rc10rDcidrw8
         U1cBTn5eMGrPbJv1vkRD3Iq9prluVAN45MPYx3qNWi6zfdNrgXpqnkpjVLJMAjqN7Iaw
         ZF4VfaLIbwjNqnbEF0yma5ETxqMNw1CieC8OgsiXdzykERRabi3gsyUXLDikk6BX60v3
         PaeFxJ6CuYVh5KeXJD1PsuzrRhkXECoN7gpjS95q5fUZYP3RaK9pBG6buQxjuCMOdxuT
         f2V1DiSaLq9m8XEj8UJv+o1NMcc/XagGiafE+dgvPZaJvn+T+j3dg/Q9NasizaXdDYQ4
         Q2lQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLi1wxcgqO1V7qktfIdFDQxzvOnuqL21c7fc84tkQGGoCzLNzIObk1dnrVbpZmvmZDshAkvJo2@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzDUCHlNTJfFB7XFQrP5KMiIYVtrO/8i4cfJ6DNGcJgQgfrzPsO
	LRsWn2K5RFHaXrH9zGw+8akgZoF8zK0JpgX1pKXfNg+pO/X2DniDoHOq
X-Gm-Gg: AZuq6aIRmj1ocbaNwf/3ZPbEaoyv2LX3i8TyaSwGvf6SbD2aDeJRmPpJ1ZsFOzjx/+o
	5KsWiBPhQiIYYCM70nPyHIHKlF3A5YyAevMBA40sPmhhNxtQK6Sf8NQ5Tam/6IerB8A6TdTWcmB
	Io6pt61ahQORd86rZCtBpEmj1BE5tuKR5CEYfAMVHuorwq9UNNWD/1BWoKUqbXRcfp99YtGaVni
	F7ARdKI6Ulhg8RgD4p5GXxNd68DxOYX8EKBMpmoajrcah8AB5mk51rr8VAHaUqS7/Qg+iNZBn3Z
	s6rrBJDhZ2fBDx2ijH6x6dPK/si0r3S7eTa7AyOs8DYZmuQ1oQ4h2rH3f51ePn1TLhhVmYXknwn
	GpEXvVQ2ZfvReSTy6nNTPsTsFYQQcwShmzKqfNzpYyr2k59dyW41ck8Pq6tao35CZ1pRMNr2Yl0
	IE15a3P8COagXBpK4pMtvwUgo29PksJKgYnggcawaMrdEigGhn5vJ2i9Hohva7vJak7HbSbDBP
X-Received: by 2002:a17:90b:3145:b0:32e:23c9:6f41 with SMTP id 98e67ed59e1d1-3549be5a5f5mr861415a91.5.1770255619864;
        Wed, 04 Feb 2026 17:40:19 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3549c487a7bsm673571a91.16.2026.02.04.17.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 17:40:19 -0800 (PST)
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
Subject: [PATCH net-next v11 2/3] arm64: dts: nuvoton: Add Ethernet nodes
Date: Thu,  5 Feb 2026 09:40:04 +0800
Message-ID: <20260205014006.735408-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260205014006.735408-1-a0987203069@gmail.com>
References: <20260205014006.735408-1-a0987203069@gmail.com>
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
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      | 25 +++++++++++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 24 ++++++++++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 44 +++++++++++++++++++
 3 files changed, 93 insertions(+)

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
index e51b98f5bdce..a39c3640b322 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -379,5 +379,49 @@ uart16: serial@40880000 {
 			clocks = <&clk UART16_GATE>;
 			status = "disabled";
 		};
+
+		gmac0: ethernet@40120000 {
+			compatible = "nuvoton,ma35d1-dwmac";
+			reg = <0x0 0x40120000 0x0 0x10000>;
+			interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			clocks = <&clk EMAC0_GATE>, <&clk EPLL_DIV8>;
+			clock-names = "stmmaceth", "ptp_ref";
+
+			nuvoton,sys = <&sys 0>;
+			resets = <&sys MA35D1_RESET_GMAC0>;
+			reset-names = "stmmaceth";
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
+			compatible = "nuvoton,ma35d1-dwmac";
+			reg = <0x0 0x40130000 0x0 0x10000>;
+			interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			clocks = <&clk EMAC1_GATE>, <&clk EPLL_DIV8>;
+			clock-names = "stmmaceth", "ptp_ref";
+
+			nuvoton,sys = <&sys 1>;
+			resets = <&sys MA35D1_RESET_GMAC1>;
+			reset-names = "stmmaceth";
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


