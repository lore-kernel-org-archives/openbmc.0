Return-Path: <openbmc+bounces-2354-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61201C55179
	for <openbmc@archiver.kernel.org>; Mon,  3 Aug 2026 11:22:41 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hDDlL3Q7Zz3bs0;
	Mon, 03 Aug 2026 21:21:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1785756094;
	cv=none; b=kn+hm/HzxZ85HWys04hKQOKgP+453t6fA+6SOHn9QyyaKmIkUHSMBnBVngmTLib0spB3NUaoG7oaVxtYPrY8CL1JmQIpkfIE4s5gn97tH9+fAPXOslptnjoI5Y4ehrCVjSaCMpQ5PStftFT6kgjV6WFF9XEbsdV/ic5B3yNOI29boHtzaIBen0i7D+VXShNUMZbxrAC3ExKx12/J8ApANf5Bg05ZMIGeLqCEh8GOdazUinql4DmDY/hOQ3MLjRfe1Ksk0pt/UC858MYwlTvky1Sqr9lbf9xvN8/TvL+lbOkMH7d08yG5ZCmvDUcQOYNYGUZaY0fvWsA6GRMbxj/4BA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1785756094; c=relaxed/relaxed;
	bh=IwAojWFj1FaBqKUS949mqDER/OD8Ai/Ip7436rIkcQQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=A1nvWR9LKr/CQ7wtQZGO67YABr4OQuQkf4/OosEm6UO7HEqzdAFdWP7DYUh+xi9Szm+Mwiu2fkxIbmMIvcVj5EVPTQPUn9gKhmltMEhc+NVPqNTX85F9V81BJd0RWu9hBr1R349HGL4exPbhS06tbFXc9BCuDPQPNuY+9c1zgDh2bDUkvOFQqtgKQsVmUe01H6MNYjvGCAfbsbG/89ltxUmaGNwlijEIA3QWHg3BtazAeur0RNsUu6B8vxH1PuZyyzVIOZ0VQgTDbti7TeaXd17vuMvDmgiQ4f6dMfMCNt+AYzz70Bg59ayzHDEyehHr0Zo4N2tBGdd16J1+4IzPjA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=f7uzeU1o; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=f7uzeU1o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hDDlK1ZW4z3brr
	for <openbmc@lists.ozlabs.org>; Mon, 03 Aug 2026 21:21:33 +1000 (AEST)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-47f92e3c14bso2278267f8f.0
        for <openbmc@lists.ozlabs.org>; Mon, 03 Aug 2026 04:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785756090; x=1786360890; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IwAojWFj1FaBqKUS949mqDER/OD8Ai/Ip7436rIkcQQ=;
        b=f7uzeU1oXgQCAi3Qw/4TQag0JDOAtQrQdRsqkugSpBXxD7NvuTWAH8nQaf0CWa0pKz
         gRhfoLeqx/bSNmdOxr8dcFXsZ7KvvqzH31f9+8e+gqivluxCTFX6zdvyacfP0dzGcqT5
         nMAe+yIxm12dAuRD06hC7gdN2S4xF2CqGz5cnyMggw1M3qKbp5OCK5v8xO+7mIFCTRj7
         uqO0zr6DK7HPWHbK7op+12ura8ZXIhf97qs/i1TNww8Mkhff7+nDMCUVthOMRCVYSqCh
         l+J6SeLHEsxP4j/GbXh0DWtsYJ4uvOYBbt/UDqEC84F5R0ZuJc3JbJz+2DPglXGWADa1
         f0xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785756090; x=1786360890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IwAojWFj1FaBqKUS949mqDER/OD8Ai/Ip7436rIkcQQ=;
        b=RRkphHefYpXnF7nbD2zTmCAVbn8bgghyX8Po/5JA/cczrf40Fke9L2E/VE7aZMvl7Z
         FrX1Y+oN2jVDP2uBuVrIfJvo7C1+9uu87+XkpQQWIeiZO68L4jeqYYQAOQkLXpDGxTZU
         heGwle+XXSsHuI4Q8syM6Uih9iGGEpWe0p9hqY1d972aEzOM5QyfwXQ8JK+RXz4GL/cW
         SjAtX8aNkPeqqpY+vYY0X8zjxpT6iQ25YhrlT4t737hDj+sD5uHz3S2Rdihw7kLaLLOJ
         r09rkGnwJIYTJ0RPNZSVfEncvapiOfx8J8XjMLI7U6Vc2fN8VlYXFBcsuzrzImeALSLT
         FnsQ==
X-Gm-Message-State: AOJu0YxqnMHw6eGAuopbevsJqSVufXcBGslmNH4aMocIjHk5TJw2Rai3
	ZGu296ePzjUkgxwr1M68m/I/bOfwN+9c3KsEvHlXO0cclD4odarP7Dc8
X-Gm-Gg: AR+sD13Vv0+UMaLjneNrrKnuoU6QBh/XrAivf72ak5DSUJWrLAvkbHaMitG4b15oOwA
	Cjs4OY9lj/Gs7siVZoQ7NLPMAiuc20+2tVQ5NHlzxbf1BLreksbXChHvntU1i+dF9v0LwCyxmas
	T2mMstE53iAjwcC4YcKfwS1kX9h427iGalsDkc2a20Tn9uHUZZVUlKvU6G0TSkCfzmPmXj9PBEG
	phy5jSASn218wAJA618U9pQ3LJw6Or4xj6vgLnP2qsotPDh+8kjwjcht8KnPDfxPHhR+9x9HIeJ
	exlgNByHlAD4qo0T2IYEtLbM8CgwrRG5iBidOIaFODNL6tJ/qxnvmJ7FBA0a1WsGtpkI68FxF1T
	L+pFuMO8XTHTUgseymM+ahcIqH3ItuKm7UaZJCsdf9podMccgpW75TNwhOt3c8kzkkGoUSOMj7s
	QZ26pAmhwMehl2YO3M+52mq6NrEcQYVYQtjYLBlBhZdHZo3cMaNiFuFPI5WkFjtSifpwAJrj8=
X-Received: by 2002:a05:6000:50a:b0:47f:cbbd:30ea with SMTP id ffacd0b85a97d-47fd72a8d0emr21385657f8f.14.1785756090134;
        Mon, 03 Aug 2026 04:21:30 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd458adc9sm34154913f8f.27.2026.08.03.04.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 04:21:29 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: andrew@codeconstruct.com.au,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com
Subject: [PATCH v9 5/5] arm64: dts: nuvoton: npcm845-evb: Add peripheral nodes
Date: Mon,  3 Aug 2026 14:19:06 +0300
Message-Id: <20260803111906.1931384-6-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260803111906.1931384-1-tmaimon77@gmail.com>
References: <20260803111906.1931384-1-tmaimon77@gmail.com>
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

Enable peripheral support for the NPCM845 evaluation board by wiring up
the SoC controller nodes to the board design. Add board aliases,
GPIO-backed MDIO buses for the external PHYs, a reserved-memory region
for TIP firmware, and flash partitions for the FIU boot flash. Enable
the Ethernet MACs, MMC controller, FIU controllers, USB device
controllers, ADC, RNG, PWM/FAN controller, I2C buses, and PECI
interface with the board-specific pinctrl and PHY connections they
require.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../boot/dts/nuvoton/nuvoton-npcm845-evb.dts  | 435 ++++++++++++++++++
 1 file changed, 435 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
index 2dc1a4fbb..3d88af388 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
@@ -9,6 +9,42 @@ / {
 	model = "Nuvoton npcm845 Development Board (Device Tree)";
 
 	aliases {
+		ethernet1 = &gmac1;
+		ethernet2 = &gmac2;
+		ethernet3 = &gmac3;
+		fiu0 = &fiu0;
+		fiu1 = &fiu3;
+		fiu2 = &fiux;
+		fiu3 = &fiu1;
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		i2c3 = &i2c3;
+		i2c4 = &i2c4;
+		i2c5 = &i2c5;
+		i2c6 = &i2c6;
+		i2c7 = &i2c7;
+		i2c8 = &i2c8;
+		i2c9 = &i2c9;
+		i2c10 = &i2c10;
+		i2c11 = &i2c11;
+		i2c12 = &i2c12;
+		i2c13 = &i2c13;
+		i2c14 = &i2c14;
+		i2c15 = &i2c15;
+		i2c16 = &i2c16;
+		i2c17 = &i2c17;
+		i2c18 = &i2c18;
+		i2c19 = &i2c19;
+		i2c20 = &i2c20;
+		i2c21 = &i2c21;
+		i2c22 = &i2c22;
+		i2c23 = &i2c23;
+		i2c24 = &i2c24;
+		i2c25 = &i2c25;
+		i2c26 = &i2c26;
+		mdio-gpio0 = &mdio0;
+		mdio-gpio1 = &mdio1;
 		serial0 = &serial0;
 	};
 
@@ -16,6 +52,30 @@ chosen {
 		stdout-path = &serial0;
 	};
 
+	mdio0: mdio-0 {
+		compatible = "virtual,mdio-gpio";
+		#address-cells = <1>;
+		gpios = <&gpio1 25 GPIO_ACTIVE_HIGH>,
+			<&gpio1 26 GPIO_ACTIVE_HIGH>;
+		#size-cells = <0>;
+
+		phy0: ethernet-phy@0 {
+			reg = <0>;
+		};
+	};
+
+	mdio1: mdio-1 {
+		compatible = "virtual,mdio-gpio";
+		#address-cells = <1>;
+		gpios = <&gpio2 27 GPIO_ACTIVE_HIGH>,
+			<&gpio2 28 GPIO_ACTIVE_HIGH>;
+		#size-cells = <0>;
+
+		phy1: ethernet-phy@0 {
+			reg = <0>;
+		};
+	};
+
 	memory@0 {
 		reg = <0x0 0x0 0x0 0x40000000>;
 		device_type = "memory";
@@ -26,12 +86,387 @@ refclk: refclk-25mhz {
 		#clock-cells = <0>;
 		clock-frequency = <25000000>;
 	};
+
+	reserved-memory {
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		tip@0 {
+			reg = <0x0 0x0 0x0 0x6200000>;
+			no-map;
+		};
+	};
+};
+
+&gmac1 {
+	phy-mode = "rgmii-id";
+
+	status = "okay";
+};
+
+&gmac2 {
+	phy-handle = <&phy0>;
+	phy-mode = "rmii";
+	pinctrl-0 = <&r1_pins
+		    &r1oen_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&gmac3 {
+	phy-handle = <&phy1>;
+	phy-mode = "rmii";
+	pinctrl-0 = <&r2_pins
+		    &r2oen_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
 };
 
 &serial0 {
 	status = "okay";
 };
 
+&fiu0 {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <5000000>;
+		spi-rx-bus-width = <1>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			bmc@0 {
+				compatible = "fixed-partitions";
+				reg = <0x00000000 0x04000000>;
+				#address-cells = <1>;
+				label = "bmc";
+				#size-cells = <1>;
+
+				u-boot@0 {
+					reg = <0x00000000 0x007c0000>;
+					label = "u-boot";
+				};
+
+				u-boot-env@7c0000 {
+					reg = <0x007c0000 0x00040000>;
+					label = "u-boot-env";
+				};
+
+				kernel@800000 {
+					reg = <0x00800000 0x00800000>;
+					label = "kernel";
+				};
+
+				rofs@1000000 {
+					reg = <0x01000000 0x02c00000>;
+					label = "rofs";
+				};
+
+				rwfs@3c00000 {
+					reg = <0x03c00000 0x00400000>;
+					label = "rwfs";
+				};
+			};
+		};
+	};
+};
+
+&fiu1 {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <5000000>;
+		spi-rx-bus-width = <2>;
+		spi-tx-bus-width = <2>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				reg = <0x0 0x0>;
+				label = "spi1-system1";
+			};
+		};
+	};
+};
+
+&fiu3 {
+	pinctrl-0 = <&spi3_pins>, <&spi3quad_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <5000000>;
+		spi-rx-bus-width = <1>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				reg = <0x0 0x0>;
+				label = "spi3-system1";
+			};
+		};
+	};
+};
+
+&fiux {
+	nuvoton,spix-mode;
+
+	status = "okay";
+};
+
+&sdhci {
+	status = "okay";
+};
+
+&udc0 {
+	status = "okay";
+};
+
+&udc1 {
+	status = "okay";
+};
+
+&udc2 {
+	status = "okay";
+};
+
+&udc3 {
+	status = "okay";
+};
+
+&udc4 {
+	status = "okay";
+};
+
+&udc5 {
+	status = "okay";
+};
+
+&udc6 {
+	status = "okay";
+};
+
+&udc7 {
+	status = "okay";
+};
+
+&mc {
+	status = "okay";
+};
+
+&peci {
+	status = "okay";
+};
+
+&rng {
+	status = "okay";
+};
+
+&adc {
+	#io-channel-cells = <1>;
+
+	status = "okay";
+};
+
 &watchdog1 {
 	status = "okay";
 };
+
+&pwm_fan {
+	#address-cells = <1>;
+	pinctrl-0 = <&pwm0_pins &pwm1_pins
+		    &pwm2_pins &pwm3_pins
+		    &pwm4_pins &pwm5_pins
+		    &pwm6_pins &pwm7_pins
+		    &fanin0_pins &fanin1_pins
+		    &fanin2_pins &fanin3_pins
+		    &fanin4_pins &fanin5_pins
+		    &fanin6_pins &fanin7_pins>;
+	pinctrl-names = "default";
+	#size-cells = <0>;
+
+	status = "okay";
+
+	fan@0 {
+		reg = <0x00>;
+		cooling-levels = <127 255>;
+		fan-tach-ch = /bits/ 8 <0x0 0x1>;
+	};
+
+	fan@1 {
+		reg = <0x01>;
+		cooling-levels = <127 255>;
+		fan-tach-ch = /bits/ 8 <0x2 0x3>;
+	};
+
+	fan@2 {
+		reg = <0x02>;
+		cooling-levels = <127 255>;
+		fan-tach-ch = /bits/ 8 <0x4 0x5>;
+	};
+
+	fan@3 {
+		reg = <0x03>;
+		cooling-levels = <127 255>;
+		fan-tach-ch = /bits/ 8 <0x6 0x7>;
+	};
+
+	fan@4 {
+		reg = <0x04>;
+		cooling-levels = <127 255>;
+		fan-tach-ch = /bits/ 8 <0x8 0x9>;
+	};
+
+	fan@5 {
+		reg = <0x05>;
+		cooling-levels = <127 255>;
+		fan-tach-ch = /bits/ 8 <0xa 0xb>;
+	};
+
+	fan@6 {
+		reg = <0x06>;
+		cooling-levels = <127 255>;
+		fan-tach-ch = /bits/ 8 <0xc 0xd>;
+	};
+
+	fan@7 {
+		reg = <0x07>;
+		cooling-levels = <127 255>;
+		fan-tach-ch = /bits/ 8 <0xe 0xf>;
+	};
+};
+
+&i2c0 {
+	status = "okay";
+};
+
+&i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	eeprom@50 {
+		compatible = "atmel,24c256";
+		reg = <0x50>;
+	};
+};
+
+&i2c2 {
+	status = "okay";
+};
+
+&i2c3 {
+	status = "okay";
+};
+
+&i2c4 {
+	status = "okay";
+};
+
+&i2c5 {
+	status = "okay";
+};
+
+&i2c6 {
+	status = "okay";
+};
+
+&i2c7 {
+	status = "okay";
+};
+
+&i2c8 {
+	status = "okay";
+};
+
+&i2c9 {
+	status = "okay";
+};
+
+&i2c10 {
+	status = "okay";
+};
+
+&i2c11 {
+	status = "okay";
+};
+
+&i2c12 {
+	status = "okay";
+};
+
+&i2c13 {
+	status = "okay";
+};
+
+&i2c14 {
+	status = "okay";
+};
+
+&i2c15 {
+	status = "okay";
+};
+
+&i2c16 {
+	status = "okay";
+};
+
+&i2c17 {
+	status = "okay";
+};
+
+&i2c18 {
+	status = "okay";
+};
+
+&i2c19 {
+	status = "okay";
+};
+
+&i2c20 {
+	status = "okay";
+};
+
+&i2c21 {
+	status = "okay";
+};
+
+&i2c22 {
+	status = "okay";
+};
+
+&i2c23 {
+	status = "okay";
+};
+
+&i2c24 {
+	status = "okay";
+};
+
+&i2c25 {
+	status = "okay";
+};
+
+&i2c26 {
+	status = "okay";
+};
-- 
2.34.1

