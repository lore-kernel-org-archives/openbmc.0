Return-Path: <openbmc+bounces-2099-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE3F5CD98C5
	for <openbmc@archiver.kernel.org>; Mon, 15 Jun 2026 14:26:56 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gfC8v6Gnbz3c52;
	Tue, 16 Jun 2026 00:26:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::332"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1781533567;
	cv=none; b=COAPebjmpEeSTgQQFPwBLreAvrPSgoRzbSva2TY+1681zn3uzpGyHY/iLYEftzIcGsSzogXqfF6KwlYW31T5JOUH8l6y0ZmTTBDPmbBbz5HzuhZicp0XbXG7R3aqQ2qIVCUSSGzvFqr+wNfWUZMNrmrHjmE9T+caZ4cH4krJbygmJ249U5lkm6Rq7sSEl+Df3cPBUR0GO8ocot2gVDALXNo4qg9eZotHOWltUcmgZODGwLYF2PyslKkMHwVBQepCdpOZphSKFVRA0zbBngGVNlB/c9ImTxJhy6kXoLCIlyEB2UkuFJZn9mIx9DkoNQReK84768IW0wwiTd1253zScg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1781533567; c=relaxed/relaxed;
	bh=u+sl9BErH+q28328n6lO44FfMgT3hZirp2Ce6Af1PK8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dd1J0ltxhN/bMB2FS8u52iBgeX3QrhZ9aPqyLmrsR0x0JTkWzNMg5oxJdg1E5TWUuzaaTGH9WKy1HZfDzarIKivGwpR4cgN5I6Qe1FdtGxr5zVqYrG4TTspl/4MFc5ccFtzJ9Xr53NTYVZCbrQTJaJZSOGDvZVneAtvv37/x2jC/g0A3b8FUeWp2H8P8CeZyKgt8AwdpvieA/klMJ47y0A2mhT7kZ/Z1wq3S/Xx3139F0D/JeakBYNgxs6/A+egrLvWF75bH75+fvDA5b1raUly/K0vN4bAwXueUA5LCfTHmC2BQ6P0EceLmrLggpm++QGJuxZxP0MjXIX02R2KVDA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eI5/SPeX; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eI5/SPeX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gfC8t4l5Fz3c4v
	for <openbmc@lists.ozlabs.org>; Tue, 16 Jun 2026 00:26:06 +1000 (AEST)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-490c1915793so30299335e9.2
        for <openbmc@lists.ozlabs.org>; Mon, 15 Jun 2026 07:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781533563; x=1782138363; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u+sl9BErH+q28328n6lO44FfMgT3hZirp2Ce6Af1PK8=;
        b=eI5/SPeX0EkSk6ijN+cjrh2F1YI61Xml/ukZnpdr31l3YsFh4EXnTdJINpBvMo8V2r
         YETnVAQjEDGsPe9wAPkM4olbGwDqumDG0gJ8nisxwMAdJxU79blL+0iB8IQDHNMmGIJN
         aLAVey7AOwB+JHttYR2plKI+mXBJXF6L5zmN56mL13Um1iAmJUTvjqh85iUekw526MXc
         s93itUfm14Vd/H35SVT+t8rGt9ILjCQQU4NNa/6diuRglnWti7F/bHdXN/AAI/4HzlLG
         VEmoy18kEPQ9q1f7iBHwayJVbAv81HYqgjwqBwoZnc+9BOSX6n4jGqxq3WpyGTN9xVMz
         L6Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781533563; x=1782138363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u+sl9BErH+q28328n6lO44FfMgT3hZirp2Ce6Af1PK8=;
        b=cadD+ZebtHxEqjQ3dGiHcB81+GirGD8/M9CAYwMsgPt0k1ycBX0ocPkOjsGpm3z1PZ
         EU96/Xy98t63PAtSSYwax3o7nD8Boit9wVS/gH4FCEosFFRgQ1o0wHo6/JvU/99Fdm1g
         BFjHAiI1JNPsKPcPtvD+B8+gNlgWz32uCJgVYSZqE664hOrqCgFCTA/gk1YxTlWitkbU
         nKwkhJ9azyZtoPEfxUNoTiAbLMNxOVNa7toqa6kItFzngchvClLCe2kuEGlkXz9zyp7T
         O53qtIlXmpFoV0YeB1kWXv4T81j8XanX05x0aEQ84aTRyu3FJN4QNyBo3D3T52+ILeVm
         t7Rg==
X-Gm-Message-State: AOJu0YyLO1w3t/NxhcjgkPrVZmKC1CgNPvyV6rpdU9J9UM6+8WVscD7z
	sDrZUsz31n0AncKmTF8nAhKo8dtNxnqYxAYlc9qrnPH7tuAzSY47YNvr
X-Gm-Gg: Acq92OHRysFBmSv/u3oBuyCauu5AzESKSQWDYyDFaQ9awsVJkT1t87UaFOStlNaGsYL
	Pib4S2T82ZgosCzlQaAFENIs2xDDb3mZx8K/yaa02CjHlG/IjCtDwmUVJJ8ItKoDH008rYEzS6f
	xpbKmE/H+6qFxrU9wKmzek5DNOliaUyzweKMD7bS0unTgMIVi5VwsS7eJK8Z9DEbHZ4wtoQg5aY
	nnRJ2ZchV+7YamY9KMMkeXCG2B8F4nIDvUfUN2Lzs9ctZytcwJjH7swcs+1Lk5ekLm5Odb68hDl
	+Q3iUAwWZjJTvpQh8zUANxOCKm5fsDfCIbv8SiXfWLArao/bLVQE6+Ah2aF9Rb4D0rPwn0Y+82q
	fOu3idSpflsxQnc5aY48ki/2oyoJFRxPLZpfxR73WuKrJLyBmY9WpCf/Tb5TTGaDyE/vMJ5optz
	Lfso6N7B1HyA0WTEaKtrKOZUC5uwlZGHlDwQ==
X-Received: by 2002:a05:600c:3b90:b0:490:9ea0:c11f with SMTP id 5b1f17b1804b1-490ec4c5bb8mr189036805e9.5.1781533563461;
        Mon, 15 Jun 2026 07:26:03 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea961f18sm273333205e9.2.2026.06.15.07.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 07:26:03 -0700 (PDT)
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
Subject: [PATCH v5 4/4] arm64: dts: nuvoton: npcm845-evb: Add peripheral nodes
Date: Mon, 15 Jun 2026 17:25:48 +0300
Message-Id: <20260615142548.1373799-5-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260615142548.1373799-1-tmaimon77@gmail.com>
References: <20260615142548.1373799-1-tmaimon77@gmail.com>
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
 .../boot/dts/nuvoton/nuvoton-npcm845-evb.dts  | 413 ++++++++++++++++++
 1 file changed, 413 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
index 5edf5d13342d..28dbb865d739 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
@@ -10,6 +10,42 @@ / {
 
 	aliases {
 		serial0 = &serial0;
+		ethernet1 = &gmac1;
+		ethernet2 = &gmac2;
+		ethernet3 = &gmac3;
+		mdio-gpio0 = &mdio0;
+		mdio-gpio1 = &mdio1;
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
 	};
 
 	chosen {
@@ -26,12 +62,389 @@ refclk: refclk-25mhz {
 		clock-frequency = <25000000>;
 		#clock-cells = <0>;
 	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		tip_reserved: tip@0 {
+			reg = <0x0 0x0 0x0 0x6200000>;
+		};
+	};
+
+	mdio0: mdio-0 {
+		compatible = "virtual,mdio-gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		gpios = <&gpio1 25 GPIO_ACTIVE_HIGH>,
+			<&gpio1 26 GPIO_ACTIVE_HIGH>;
+
+		phy0: ethernet-phy@0 {
+			reg = <0>;
+		};
+	};
+
+	mdio1: mdio-1 {
+		compatible = "virtual,mdio-gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		gpios = <&gpio2 27 GPIO_ACTIVE_HIGH>,
+			<&gpio2 28 GPIO_ACTIVE_HIGH>;
+
+		phy1: ethernet-phy@0 {
+			reg = <0>;
+		};
+	};
+};
+
+&gmac1 {
+	phy-mode = "rgmii-id";
+	snps,eee-force-disable;
+	status = "okay";
+};
+
+&gmac2 {
+	phy-mode = "rmii";
+	pinctrl-names = "default";
+	pinctrl-0 = <&r1_pins
+			&r1oen_pins>;
+	phy-handle = <&phy0>;
+	status = "okay";
+};
+
+&gmac3 {
+	phy-mode = "rmii";
+	pinctrl-names = "default";
+	pinctrl-0 = <&r2_pins
+			&r2oen_pins>;
+	phy-handle = <&phy1>;
+	status = "okay";
 };
 
 &serial0 {
 	status = "okay";
 };
 
+&fiu0 {
+	status = "okay";
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		spi-rx-bus-width = <1>;
+		reg = <0>;
+		spi-max-frequency = <5000000>;
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			bmc@0 {
+				label = "bmc";
+				reg = <0x00000000 0x04000000>;
+			};
+			u-boot@0 {
+				label = "u-boot";
+				reg = <0x00000000 0x007C0000>;
+			};
+			u-boot-env@7c0000 {
+				label = "u-boot-env";
+				reg = <0x007C0000 0x00040000>;
+			};
+			kernel@800000 {
+				label = "kernel";
+				reg = <0x00800000 0x00800000>;
+			};
+			rofs@1000000 {
+				label = "rofs";
+				reg = <0x01000000 0x02C00000>;
+			};
+			rwfs@3c00000 {
+				label = "rwfs";
+				reg = <0x03C00000 0x00400000>;
+			};
+		};
+	};
+};
+
+&fiu1 {
+	status = "okay";
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		spi-rx-bus-width = <2>;
+		spi-tx-bus-width = <2>;
+		reg = <0>;
+		spi-max-frequency = <5000000>;
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			partition@0 {
+				label = "spi1-system1";
+				reg = <0x0 0x0>;
+			};
+		};
+	};
+};
+
+&fiu3 {
+	pinctrl-0 = <&spi3_pins>, <&spi3quad_pins>;
+	status = "okay";
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		spi-rx-bus-width = <1>;
+		reg = <0>;
+		spi-max-frequency = <5000000>;
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			partition@0 {
+				label = "spi3-system1";
+				reg = <0x0 0x0>;
+			};
+		};
+	};
+};
+
+&fiux {
+	nuvoton,spix-mode;
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
+	status = "okay";
+};
+
 &watchdog1 {
 	status = "okay";
 };
+
+&pwm_fan {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pwm0_pins &pwm1_pins
+		&pwm2_pins &pwm3_pins
+		&pwm4_pins &pwm5_pins
+		&pwm6_pins &pwm7_pins
+		&fanin0_pins &fanin1_pins
+		&fanin2_pins &fanin3_pins
+		&fanin4_pins &fanin5_pins
+		&fanin6_pins &fanin7_pins>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	fan@0 {
+		reg = <0x00>;
+		fan-tach-ch = /bits/ 8 <0x0 0x1>;
+		cooling-levels = <127 255>;
+	};
+	fan@1 {
+		reg = <0x01>;
+		fan-tach-ch = /bits/ 8 <0x2 0x3>;
+		cooling-levels = <127 255>;
+	};
+	fan@2 {
+		reg = <0x02>;
+		fan-tach-ch = /bits/ 8 <0x4 0x5>;
+		cooling-levels = <127 255>;
+	};
+	fan@3 {
+		reg = <0x03>;
+		fan-tach-ch = /bits/ 8 <0x6 0x7>;
+		cooling-levels = <127 255>;
+	};
+	fan@4 {
+		reg = <0x04>;
+		fan-tach-ch = /bits/ 8 <0x8 0x9>;
+		cooling-levels = <127 255>;
+	};
+	fan@5 {
+		reg = <0x05>;
+		fan-tach-ch = /bits/ 8 <0xa 0xb>;
+		cooling-levels = <127 255>;
+	};
+	fan@6 {
+		reg = <0x06>;
+		fan-tach-ch = /bits/ 8 <0xc 0xd>;
+		cooling-levels = <127 255>;
+	};
+	fan@7 {
+		reg = <0x07>;
+		fan-tach-ch = /bits/ 8 <0xe 0xf>;
+		cooling-levels = <127 255>;
+	};
+};
+
+&i2c0 {
+	status = "okay";
+};
+
+&i2c1 {
+	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	eeprom@50 {
+		compatible = "atmel,24c256";
+		reg = <0x50>;
+	};
+};
+
+&i2c2 {
+	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	ipmb@10 {
+		compatible = "ipmb-dev";
+		reg = <0x10>;
+		i2c-protocol;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	ipmb@11 {
+		compatible = "ipmb-dev";
+		reg = <0x11>;
+		i2c-protocol;
+	};
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


