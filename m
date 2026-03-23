Return-Path: <openbmc+bounces-1708-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77114FEC104
	for <openbmc@archiver.kernel.org>; Tue, 24 Mar 2026 22:52:12 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fgQJT2Wk5z2yr4;
	Wed, 25 Mar 2026 09:51:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::431"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1774261095;
	cv=none; b=GwuiioRbfNiS6HZVu/yAqV01/DYjXNHDht2BRuR/TXLPTM6fRXz9KbHCXHX3Z1bGSyRneq42pcWwhSM/HMQ6xQ3BiFxOugUSi03pseNk3DON30gyt6CCk2BF86rnn9BaT0vc7fLtJsjeHoTqvH5vh+BLyL7S9s4X6AJ9NauFQi5o8RiRSUPeeZofTVRaWMuXQOy3Hjt1PFtW2E0f0NSCNzOj2H+inPmYsuZCG2S3rIp4g4M7mRjv2XgzmGXaZ3UgvL36QxaDvwYWnK+bVceZRov+w/nfUQy41U03keTZPhMOjHPj/ShHxEj2DSOH42Y2tl3tyZRQGpQAatOp0mZzQA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1774261095; c=relaxed/relaxed;
	bh=HvbJo4sg+keqA0UYOTwphLAy1mW7zcwD5w4Qm8DSQTA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=goU15qR2v/L01NgaFoXlSLJXw+i+AmlK0ybJVLam1t8aMUhH+fCTI9PwwKCk8wRPyGLhpjuYZpb4eKC/+KN/7lCd5t6JSb57g8o//48CxdPhIY0HnKOm/6jSmGADBRyFyoLFOB5WLG9My5QISdAFKdhHSDmfX+1CpUqHl6tnsdC2SPk+uICJWiEUYvOwpxqgx8T9aPBpp3+er/rJYNy8vLyk1n7hop0MIfd2dnFW8veJN2MaJDiYjoyR9kv8TOZXwKNjiVtuKpO5ZyzJeOQzvswPUJH/N9cU4Et3pVDJ6cBaKTrUrCZtY+0nUGAm5aMNKT36ybVLCTYscX7AOYGQOQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KKIy6UPL; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KKIy6UPL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ffTdf4Wj0z2xly
	for <openbmc@lists.ozlabs.org>; Mon, 23 Mar 2026 21:18:14 +1100 (AEDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-82a655cfab5so2581825b3a.1
        for <openbmc@lists.ozlabs.org>; Mon, 23 Mar 2026 03:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774261092; x=1774865892; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HvbJo4sg+keqA0UYOTwphLAy1mW7zcwD5w4Qm8DSQTA=;
        b=KKIy6UPLBYjfaupQ9ylcv5JmLe3l12soO1/N7MES0CvDdUZBc8k7KbxBtNi8OOSH22
         N9ix/5GvoyDmMx2Y96rGVJcAC9BuiresxIeViRpoJBp7BqbVBtV8JjBW3WOMltuzuPDg
         TEbEtRf2WPR9uwri4bfsENPLGFkgQQpIIl31cPiBp9bUnPrbwq94s95oqTFOzy70IkTW
         FW/SmjP7a5eauPVL8N+tNsp5hW6nZjT+PqSl7VdrJwjBpRfyaWDvPtpQcHEJYLWrLlky
         Rh3PLTM3ksYkZGQGoJ0PJGcWWoAlrykXn3R0G1O7gfw7sGuPyqLwH6M1zgRoPdnnnk+9
         Qu0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774261092; x=1774865892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HvbJo4sg+keqA0UYOTwphLAy1mW7zcwD5w4Qm8DSQTA=;
        b=n9UC64LLVDsuSV8A0Y0GbxsC/vi3h9jlcAHHTu+nfNpIsq3/AfAbVkuYLlh1P7dLwk
         JHXAwqoYOCVq54HJSaFmMFMKJIy5eo+iWdLdLsF93wS+oLNwkgFXqYXojcKfUFP6cguL
         XzHUbkn0gfwymnTzz95QtnMLBCtJqJ7pFfxTN3ofrPjHj78yWrnRIGyS7fT0HhAjQuI3
         g8AizY7KzOMCgBkzQbH1fN1Wav4fFDGMT9otg44gHVK7SY9VOkzV38OzID3KX2WH3cQJ
         spYPcCaMAeb86IE7BTM5DkjQzv7kFGtaHd4eEkyqd9juReYjXgUwHI1NzyLAh7XsIQo8
         OHVw==
X-Forwarded-Encrypted: i=1; AJvYcCV4zKRpXVj/S8tuFOYtKRbviDhRunLgrMmqiuD30IyZf2KgDDqofbOLNxTaLmVqp/uHZgOLyTMr@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyuw5cfp/3C4nRkHaOu3GocQEIxdVvFqcbzHeiLAnUz2Qm9vF+c
	41AmryuvBD7II1fO+qkHhH2OWokwpswsMcFlxcAP8K2XSj3rn/7D6RkC
X-Gm-Gg: ATEYQzw/hgObiinRAcrbdmTiFTCn3P3FOs52myD/yECRKsJJ2+n2VzylRhtoDMgJbDG
	Qh3EJwJfPSz5IdsuOJQ18Eqz+zpGPjjGsMS61JAUERL1oTfBtS+YjKIf//vzParLwttEo/573gA
	MU9aNIKtU4X/BeiHsfCyT6WrPoWpQiKAEsDPJqI1ETU/9o7nZApqbPs7oFvKdbky9dDtPs93XZg
	hGWPCE13A3fqLKlUXQKmqTXWwpWbazHsTw1n1xRsmOfUimHUv/o/upOVeAmTUdiUzvJKjxc9qbP
	I34mRBsVQ4N2BM8xDm/zJx2u0z2igWfkPsPcKS9SKqvfY3ZtYBnLQANit1CQbAVJuFLZVMTojCt
	U++5wrTsMOoVxDTcqzkBsdN4uqS9FV45jedR4qLPQ55zyNYL8xO+R3sKimmuzmlyjPNLyfOY8n2
	OUKTT6fpXrFCIdEhxPIqHSJOfECaMJT9eUqdaJF45BBwOCparZ1pnKfBuFPaXzn0BuWpWEBbPHB
	3Ax19VX28Qr
X-Received: by 2002:a05:6a00:23c6:b0:82a:899b:d804 with SMTP id d2e1a72fcca58-82a8c353162mr9822673b3a.38.1774261092458;
        Mon, 23 Mar 2026 03:18:12 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b04220d9asm8630779b3a.60.2026.03.23.03.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 03:18:12 -0700 (PDT)
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
Subject: [PATCH net-next v15 2/3] arm64: dts: nuvoton: Add Ethernet nodes
Date: Mon, 23 Mar 2026 18:17:55 +0800
Message-ID: <20260323101756.81849-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260323101756.81849-1-a0987203069@gmail.com>
References: <20260323101756.81849-1-a0987203069@gmail.com>
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


