Return-Path: <openbmc+bounces-2240-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA22C43458
	for <openbmc@archiver.kernel.org>; Wed,  8 Jul 2026 12:55:00 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gwJ2C3jdGz30BH;
	Wed, 08 Jul 2026 22:54:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::331"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1783515251;
	cv=none; b=gt4LOn8dasPkO3oX7rJyFrHBttahPZNHyZgqMnhz81vgenHHoWRtBT+q1Yrk3NrbLJgxIAmLfw8rIh4ZkNQjQHC0f0c+/wApHaxZ0bnQIyxQmls9JiICOW3fUaovt48qCqCvYrcneQBH1xQcFmPlSSA7Nt0jZb1zYOUwzCFDO783YWRyKvQY0tI96Bxh1VAzoulEF3TT2pzMjz+v0vWCE58qvlIEYGfY45nxdVmPI93XT78cRsBVKIPA46mPfa1teNgQxc05hWthDJOFqQZUx47eueNn/dh4BiagW+RSsvSV0VoF1B9lfMEtnznw7k6ETuITMdyJM4MVIpOCY+Yixw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1783515251; c=relaxed/relaxed;
	bh=LBkRK4qvw3GAK88j75HJZJSZl22o0gWGNwof6GHgXyo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nQvY3Q9t+i1PL5vh67hXs5H46rwYRvNunsLoWzxqGtNzRCACIxhLh1wnXDJsHeR7IgQV2nGUcxUaqxzYCeZZF6bWlgB0fh3M5KMbCeOHqv9SlxRN/U2cBFS3GbdIMjXv9WfZaFxiunZMhdrjOl2IFYwF6zZuBhAeTwczjQ7y+vQONyMHZltIRjlXQsu5t26IUIUXU+2NHAn03BINWlmShohXdhT3wAiIQ7KaKwLWfOuYTiuDiB1st/WyE8HPCeq1AO+zQyE4IGRVT6X4+3P7On3GuJIQO3Nc02TdfqZ+pjBM7U9h5Z0sbYD3RFxX1WRIAF2jSVbXcj+J+e8GcsMlSQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Fp8hgoAk; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Fp8hgoAk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gwJ2B1Kv9z3092
	for <openbmc@lists.ozlabs.org>; Wed, 08 Jul 2026 22:54:10 +1000 (AEST)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-493c59f740cso4562365e9.3
        for <openbmc@lists.ozlabs.org>; Wed, 08 Jul 2026 05:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515247; x=1784120047; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LBkRK4qvw3GAK88j75HJZJSZl22o0gWGNwof6GHgXyo=;
        b=Fp8hgoAk1pjb2GkGrYglqAGPUSk4GT8ILlUYtkTWLIjtS6QKWH1nqPDPJ8UojpG24d
         OfKJPrKTPMVXZJBcW3YLVy79Lnd2BdOJuFIFwBFqH+XsJ+JNHuTYnanVEgnnNUZH+A7n
         d6C1I7+EE5l4yIToEG8oac/PnXGWm6DeTD6mz/L4JGbY+EZes3+40g3bMM43UcRv7f9J
         FQnJSBbyUn0mWI5pM+Grq2EtDrPdQN4ybD1xM6wxaN7HqhNj7pCc9SubIjit2pKsup02
         t9z9fgiVLF2C4PCYfqdb97KCNZR5R42ucDxGGHNqDTHxRqr9Y6CbGfjaAepfbPzYaYBt
         7bmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515247; x=1784120047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LBkRK4qvw3GAK88j75HJZJSZl22o0gWGNwof6GHgXyo=;
        b=TklHu4pSltaUa8Zk5dkPYN+snlNgesu4k71Y1RI2AADNwgHaZ6H9RLgHc6iguolf0h
         kcy/Wm2ytiRwJNMac8NTW47FcpkISTVPhGcuDKNHlJLrYD78F8zqfW4WA/2A1jBW1/qU
         YrE8zMaJlTEZnXuDqMIB7zSdnJSKifEJ0SvgJo1Yw7Zo497iC1kEocg/wdm4ljN6LIcA
         Z1T0/O2FeK/7iEc7Pq6hTbAaPj0DlNBv/2k7ehBcKWWOYzMcjoT0Itzg8Uka5Bb0Lqpk
         gMA5WwfVu5q2FNsrvokYe37hzIHNXxfb/aVN7feE7MK/SdmSVNXrjyIa6YZP/zJTPhuK
         UKCw==
X-Gm-Message-State: AOJu0Yy/U4sviIQaTuqNMHCLwMaXiZhSM9ybdeGRonqmaL7N12YEQfI6
	2AAD58BMK4dEsOlJlK24uBUji3pcjd9zc181bEqXs76k+qFzj+d99PPY
X-Gm-Gg: AfdE7cnpbdikw/L7nqWczkj8bt7IB15gVExcEAVfm6cPQD/X1aPbyUIn1c+AmoRaElN
	6bQL8Y6GwMQHhFZ7EJSzz5zzjbmmagyzdLR+gA72VzZOYvgSA/DGV4rhKdKaOL/dmWhou3bfhii
	8NRkvLHQUr9eSP9l79UrPBwhjxkNG9HvasbAOQHqoiP0IPq/jP8iDL9Vu/eg8S/TnI5Zp93XYEF
	8KMtBpmIIGNeWOMjb2azl/PGd0wNmSjvgT2W633SQ7oedW3isJgEm6xWBXZnBggmwHeb5cjsvr/
	/HZifV4uiu0SBe47HCO6ZjyVWq+dv48cKmPstxKSJxaPswOhoizIkZDwpkuJSPdiHfOYTZIjWAy
	C9zhy4jBTsbroTr1QtDBgi38rxfeRn/nhJmlXrlmErD0ZTwdcNlWb8yOB4vn82ndIQUazB7XGoL
	jRHe3Iregk+3tjdkV4D89attg=
X-Received: by 2002:a05:600c:c491:b0:490:5057:f5f7 with SMTP id 5b1f17b1804b1-493e689ba3amr23005505e9.11.1783515247227;
        Wed, 08 Jul 2026 05:54:07 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f3676dsm143824625e9.5.2026.07.08.05.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:54:06 -0700 (PDT)
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
Subject: [PATCH v7 4/4] arm64: dts: nuvoton: npcm845-evb: Add peripheral nodes
Date: Wed,  8 Jul 2026 15:53:52 +0300
Message-Id: <20260708125352.1915040-5-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260708125352.1915040-1-tmaimon77@gmail.com>
References: <20260708125352.1915040-1-tmaimon77@gmail.com>
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
 .../boot/dts/nuvoton/nuvoton-npcm845-evb.dts  | 404 ++++++++++++++++++
 1 file changed, 404 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
index 5edf5d133..7717c3a8f 100644
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
@@ -26,12 +62,380 @@ refclk: refclk-25mhz {
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
+			no-map;
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
+				compatible = "fixed-partitions";
+				label = "bmc";
+				reg = <0x00000000 0x04000000>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+
+				u-boot@0 {
+					label = "u-boot";
+					reg = <0x00000000 0x007C0000>;
+				};
+				u-boot-env@7c0000 {
+					label = "u-boot-env";
+					reg = <0x007C0000 0x00040000>;
+				};
+				kernel@800000 {
+					label = "kernel";
+					reg = <0x00800000 0x00800000>;
+				};
+				rofs@1000000 {
+					label = "rofs";
+					reg = <0x01000000 0x02C00000>;
+				};
+				rwfs@3c00000 {
+					label = "rwfs";
+					reg = <0x03C00000 0x00400000>;
+				};
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
+	status = "okay";
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


