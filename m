Return-Path: <openbmc+bounces-1435-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD74AEFCE4D
	for <openbmc@archiver.kernel.org>; Wed,  4 Mar 2026 23:22:11 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fR7w12TNXz3c9r;
	Thu, 05 Mar 2026 10:21:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772529628;
	cv=none; b=lzJyLv2o3/zXIWndFI+G/9Y7y6oTlpLwYlmOebDtMlqIwUjCVs0Kk5OkQRikXdWIyxVeWyqqEgXwX2/NjesYHkO+AIyvWuSFW5G/PBJqPwTlu+vMR9sWZ2Uopw8yOffCtQQiOVQ92qw7dc5wkmLhf2FQ1cX7YsN3fmO2ZMQ8PfevgqWHW0/4eCn62qXYmhOtrg5b5PewofsU4iQX6sqEmgh8WGqH6Gfvly/QMN6mMvO0ldM9Z96jaIaNx+ABA+9Iv4r3z7FmSX5vEKbvL4HAHTuL/SK9BOySEJUUZ8UU5/0aDfiLDb35QyVtLc+yhF8YdNsXmLkK6JYBwNo2IkzTWw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772529628; c=relaxed/relaxed;
	bh=HvbJo4sg+keqA0UYOTwphLAy1mW7zcwD5w4Qm8DSQTA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RIJ6vKa+7FPw+7LcGf9zJLxGPIJcV7xA+3TD8SpItNxB9vFSIXwdouK87Vl8vlnR5IyliuYFG6UDTNJa1Civacnfz4XW1LEUGzjf8ml1Qg5aRpJdL+fzrJJWNgWy/y3pZQMqbZQ7xbvtlT2aqObAZExFONtWfh5m1uimn55jQTeoFTJlXN4FEEeKvhcaqADasLl4/coF2LyPn+lgkUcxqqZR1SZaSwDVO2z/+hKWmEIINGPDFPf2flo6npEYtzgLZIlNA0kqnovRpJ9BScQoKJtut3qIqkbqnKOLaS3xmJvGz5y23QArjQeNF3tSIupK0R1FFP1s0WD+99ki8Dl/IA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AYdleSkn; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AYdleSkn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQ9JC3qMvz30Lw
	for <openbmc@lists.ozlabs.org>; Tue, 03 Mar 2026 20:20:27 +1100 (AEDT)
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-c70b4a0cda5so2017707a12.1
        for <openbmc@lists.ozlabs.org>; Tue, 03 Mar 2026 01:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772529625; x=1773134425; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HvbJo4sg+keqA0UYOTwphLAy1mW7zcwD5w4Qm8DSQTA=;
        b=AYdleSkn0SI4bwS1G1BK0tEnQHK6dm7Lzzt91M1xg7iqypIGR6vE8xOFTTwZ/PmdwS
         h8/Pv3SUJ7ssWLeWMwFSlpjt7pF6KAf4G035G0ry38laeJv/vjBkuUEnt33bE2afiVvc
         zVFOghTYrCfnF4ZulgIF8eNqvaSQdM6l4OndFPx8g7ytz11iZArIpBhnDW/iPMecKvuV
         OkhgZjdiX1yylINnjx6zS2zO09XistjOXYrgoETfbW9OsJIyHXE022NPksv8jGE3JQWb
         mp7MOBYg0qYzFCgjL1I8gxkP1ryYPFZUiKpEbW5zMvmCYmdONCHNWb7jTxwwtwCmF6wG
         BHSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772529625; x=1773134425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HvbJo4sg+keqA0UYOTwphLAy1mW7zcwD5w4Qm8DSQTA=;
        b=G8vAf1NzcPRK18Bp44JuN3dgvRn9VKE7hmv5K1okK2Qh1leOwHPUBIYzRDI01PdZiQ
         Dkdr7RKvOjdXbFdzMw1x1CWVudjct56MqQAnNDMF3XwQkTYPJ2zdFz2YDbPJj3kep66r
         7vOiU1z/KHNcB73o7+biLqhStbBp7Rm4pcY5cUNXivn8MEHHat8n7AXyrEZe/WNnOnVJ
         YniQPbBEbwtXiuTyBORl6aOyt/+/Ig2QKjQbdLu1P7nYuPghzF7t7CZ7saInGhRmEGTG
         2U5JyR08Q/0UI02paDfGrlAVmHx+I+yi2jP3JLr5uVqLZiyRvXn2cDZlaxwI8Wk6rO/3
         30+Q==
X-Forwarded-Encrypted: i=1; AJvYcCV/ZLBz1iJSZpghO/KBGh/5/7VS0+AYSp4JkeLfVU0Wsc52yo2ADNM+gpdLHMH5Rk6W+jHRj5+o@lists.ozlabs.org
X-Gm-Message-State: AOJu0YywiZ5trBLLL+6rivrCrRuLNYF2VVr+bSgEXHkzUNMVxsg/kXKQ
	gbvIOp/3wFT+YCcSCW35yCCGUFyCYM8ya9W+Pr7ldPhE5nmoKg2yRA8N
X-Gm-Gg: ATEYQzwSmo+Bi0wYu+PfTrkpxey30AoU15wX2i0AZe1VxZA6vGXDiB73UvKgppncGwd
	XjZTNk3mftIFTIv7EkhXN8Xf7HXeU79SrnW9cGYUigtFOB5bVoQJOjw0d55PWIO+4ZBTX9BhoyL
	TeGO/3wtv84X9NgDoMNXGTHBmvsUPH1e/O/BrxTD6/pTNHAhv+g0L98FBqZdBfjza/kChliOTK7
	Y6D22djafDfiWbvTS5n+p9f+KN9LiIV2UFgQysk2f+osVopp+kLO6m16YFckGnf7XkhKY6FesJR
	Sgn3tCxfc2JooVT5FssUQUSCl9nj2XM1MvfSS0AGOMqlrItnLQHxx+cMe4MJFO0NJaT9cUNabVS
	9IE501Y41CXXvPjCgol4idYXAY9L9lshb7ZRLZBoMoEXX8XwgAfNr+89zmKmx2Uowy/7ys2e2HS
	RrLLGL/DwBQ26c2F+qobWvuJCBhYGXetue5SGu/483pAlA9sXbZL3a+QfDZXp1bXDod4m4PNtKO
	+5izu4d6Xze
X-Received: by 2002:a17:903:2c05:b0:2aa:e47d:e3b with SMTP id d9443c01a7336-2ae60b26667mr17936825ad.0.1772529625504;
        Tue, 03 Mar 2026 01:20:25 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb69f996sm158777475ad.50.2026.03.03.01.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 01:20:25 -0800 (PST)
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
Subject: [PATCH net-next v13 2/3] arm64: dts: nuvoton: Add Ethernet nodes
Date: Tue,  3 Mar 2026 17:20:05 +0800
Message-ID: <20260303092006.263715-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303092006.263715-1-a0987203069@gmail.com>
References: <20260303092006.263715-1-a0987203069@gmail.com>
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


