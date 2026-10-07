Return-Path: <openbmc+bounces-2739-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7416CA5FFF
	for <openbmc@archiver.kernel.org>; Wed,  7 Oct 2026 07:28:28 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4j04Sq0FxCz3bgK;
	Wed, 07 Oct 2026 18:27:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1791358026;
	cv=none; b=JFrf3Pz2sgrV97kEgQkEh6aidB3glAUgtaMnoYKqAKWivXOBgWx/XElQ+xlmMlquq8bs9sg02nlhP6ygDnI42Yc59NMTri1r3FgMrxaw67twspj92GeuyhudxgIikgoLZIc72orthNzxxR2cMsH2xc8XxnPcE6ThlNjRSYg/2qxIFbgBSNDfYbvZrTDKmZ2TMFQQ1lFTgxSouIcP/fFm6JEyZDduqsiIDfZXLONZZV2LCeXNjH2mw67F47kXwuO7FdCS9rX8fawrabE/WDwHeypTs+KZFgN5vwUNieuoz1Rk/vqu2UQ/QG0+1nUMMYPXN0bMG7X+Jj0UA1n6CW4Mcw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1791358026; c=relaxed/relaxed;
	bh=a1+uUeXQ7isnmGwkHOEGzJ/rbBiZI0pwst6VjBVDaKo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gZWjNk/3fZO71qKrItj3PfpiWRLOIiQOqkd1WXX7bZDbzj62Xd0tRllSEpqjQzs1UP8J6a/24vmdTVFkorTXoYGgb7y23WVY4uNgXUnV1Z0cZ7arEL6uhfHuxAcMgVfus/Qk0a9wd+wDYreYGuRa65GuPtYnZd1SnP7Me0ZmUPatME90pWl148N690Bj2RGSv7Md1lazz10Q3ySLurX4hShT+jHre2/7+mYoH/t0aYnwm9D/qgr67B9tG+pk70KSfwSgDdeq4WeVeqwGZsShck8EBPIuZLApmKK8sROqcBkrhB7/zQyCZfVVMVPRmMTAkN8v7yRwiJPiig+Dq6R5IA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dnxYWLiF; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dnxYWLiF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4j04Sn5jdpz3bSw
	for <openbmc@lists.ozlabs.org>; Wed, 07 Oct 2026 18:27:05 +1100 (AEDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-49fbb2acc90so13428945e9.2
        for <openbmc@lists.ozlabs.org>; Wed, 07 Oct 2026 00:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791358023; x=1791962823; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a1+uUeXQ7isnmGwkHOEGzJ/rbBiZI0pwst6VjBVDaKo=;
        b=dnxYWLiF3OZcqiTA9r9NL/1jSG1rkNnBld0Gio8ykSlFofzCdOfk+nwhyGCM/jY5gP
         fr53AkUhQvA9zZ1NnKblfl9i17Wd9pCm9I3dThlOIJHYbo7CC4DJZngYi0bKrqXb9vpU
         3pWw3LN3cUln8qPIYqq6ODbNi9WpKM77G0w9zkYVkrfr8pJH6o24z3kwNgq8SKtxow3t
         sKc5ddJumA16WMxT91FZjDwnUFh5W4trOs81HbiijVSeB4xunCsAmTmf0fVYYo6EksDH
         ZNtLp2DyiLADMiJgEy0pzd5AA8Vk4b3mKd3RDwZjvsg5He2CoQ0d/+9DPw2BpqwSJK3d
         aAzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791358023; x=1791962823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a1+uUeXQ7isnmGwkHOEGzJ/rbBiZI0pwst6VjBVDaKo=;
        b=JOPJ2XdJljZUNuftpCfTKmfSzcodzlR99T98tVvojCXomOunU7cBKEnE95JXdDVbwq
         U3050/Mt5LIQNRcimOusmhW01ydtv60ChH4xBY20UIiGOatTDUYAF8vpJHu9uQxTCQf1
         dJn86zGcI9FVeKsw+AKl9RgW9WiX29rr6mRxGqoaLTTrt5gkwca0a/+4jNpYhy7pZVWk
         fOtGnxeZKHWpEt89qtBB2Ov1yXAxOaOVI+q3Jw2eTyPDqKz0I6qH/D8U0bEeI7/ywzxD
         f5/LENs+XCN/tJKtYRrXbauRXzKuZIFSZOcGThGLnZEcGc4OiKBg+89i17ARXm/KEinN
         8ZAA==
X-Gm-Message-State: AFuF++kujzsD0YNePwhWOlqaZDesftVh1rY7+juxlbR9utK07hP+Ie9U
	dXk97sNC7eGkExMdxuPZDzV1xkPoxTMnsFjlB0jX/u4wHZzK0VZEirpd
X-Gm-Gg: AYBFou2xyMBx1o1dBWkauukZeN8zU1PELGnFw6jXQP+/B9jbIXzPZYHiB330Yj3kJJg
	4IBL8PtSBUTR3lmb2QC3Ckv/QySH+dzZbEzVGOCQvkO56B8OrD1VNKk0ms73Yum3ZoPaZHVbdvw
	9XMFCFZ/9nQ5vWx3+CjK/GkTWYrKGbH4kZ+lrViZwRo1VhKkvJF/w67OtRD+I9quEraj0nTr8xJ
	h4Oz0+2uzv7mNtqd+Zjdo2wAUoWpr40QEKD+3tXGkuNlQXtN8hUgzcL1ahGvetmOkwuy9qYG5BR
	fwsR8t5JdhM/m0VSRE0GXzuxsncpZt/97O/+ZlNYOZVQVlYKjRvz4armAO8BvPGApDBKhzSLODV
	kPc42Mr3SbtlnsNdK6UxOmCZ7zL+3CHWrYKibT382W1g4FMYUpFtK3BUEBuLRF9isVHjyOYJFR5
	BCqysJhbW8a1GAPDRGWEkUSd0GLEzQOFQ+Eqs6RJ0ZXf/dmPx5Rz6kAclf4gedGEPJPoDa/cTHu
	sRutF4CUZveuzbMLZI=
X-Received: by 2002:a05:600c:a104:b0:49c:fa21:1c81 with SMTP id 5b1f17b1804b1-4a1815a339cmr7750675e9.22.1791358022473;
        Wed, 07 Oct 2026 00:27:02 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a180310c9fsm29912955e9.4.2026.10.07.00.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 00:27:02 -0700 (PDT)
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
Subject: [PATCH RESEND v10 6/6] arm64: dts: nuvoton: npcm845-evb: Add peripheral nodes
Date: Wed,  7 Oct 2026 10:26:45 +0300
Message-Id: <20261007072645.1618147-7-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007072645.1618147-1-tmaimon77@gmail.com>
References: <20261007072645.1618147-1-tmaimon77@gmail.com>
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

Enable peripheral support for the NPCM845 evaluation board by wiring
up the SoC controller nodes to the board design. Add board aliases,
GPIO-backed MDIO buses for the external PHYs, a reserved-memory
region for TIP firmware, and flash partitions for the FIU boot
flash. Enable the Ethernet MACs, MMC controller, FIU controllers,
USB device controllers, ADC, RNG, PWM/FAN controller, I2C buses, and
PECI interface with the board-specific pinctrl and PHY connections
they require.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../boot/dts/nuvoton/nuvoton-npcm845-evb.dts  | 435 ++++++++++++++++++
 1 file changed, 435 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
index 2dc1a4f..3d88af3 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
@@ -9,6 +9,42 @@
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
 
@@ -16,6 +52,30 @@
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
@@ -26,12 +86,387 @@
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


