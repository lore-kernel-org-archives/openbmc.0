Return-Path: <openbmc+bounces-2245-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8318C43458
	for <openbmc@archiver.kernel.org>; Wed,  8 Jul 2026 17:00:48 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gwPTj01Csz30CX;
	Thu, 09 Jul 2026 02:59:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::334"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1783529992;
	cv=none; b=L2e5Qie0n7ZGtIi/fO6iChvs77gTh0/d6Z7PvQHBx2TEA05H+Gfl9cunzC6eELEHPzLLVAykaLUlROngLoZUQOJDa/JVGIlTITBgH4dOB4Fgt/+d65/Cxx9q0wmVXqti9rPiMbl8bq5/HSSU1lvI4cOphD55GFOCkRKuDJiLRRXvM4Gv6nN6mmtzsBzM6MqGhSTm4COXiX7fx0tB499z5+AhieSBCm61inaPE1Jnz9Fs3pZjxLF4T/35rUhmUeeic//S0/hri8awp5VzXfR5vZxlj/b4X7OROzHaErDU8N1Iem78iSAX/EDGvWFUjq2z0b4od19NPWrSKvOivdoCBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1783529992; c=relaxed/relaxed;
	bh=LBkRK4qvw3GAK88j75HJZJSZl22o0gWGNwof6GHgXyo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nl/nfBjNIp52jRnXHq9KcPe194ccufLSXKncR58mHMvumjt/ZlMWp1UK+gWf/TNZqKMIFUrXMonDs8vQz3jvvYkKG5EEhrRewipItoqDtHefF10ge947Ro2MIM41qRgpR4fizaY07kR4bk9k0uK6fsYvjt0eOphN/2qycD0+9Dyuyn+wFrbgMKvQ/Ee0K9PqnDykGl84V3SZGhto9dDRqOeINm5K93IiTxf1ECz4LhV9adNLw27zjQ0rKKcoyGDncmTsygkj+ZF4ip8qdThW14NdTRfYS/6v/gQxK8FrGNQgeO227W4aXYp+YqHqUotZyGCR6f6C7DsDvsDeRg1lAQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=f7+VZ0l7; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=f7+VZ0l7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gwPTg61Pnz30BX
	for <openbmc@lists.ozlabs.org>; Thu, 09 Jul 2026 02:59:51 +1000 (AEST)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-493e4cccd8dso4165195e9.2
        for <openbmc@lists.ozlabs.org>; Wed, 08 Jul 2026 09:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783529989; x=1784134789; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LBkRK4qvw3GAK88j75HJZJSZl22o0gWGNwof6GHgXyo=;
        b=f7+VZ0l7+HT4XS2Urv9QU4xSVgE12OdHgfhEEtpFgdLxurRXWyMv2p1+vjL4MZDfZ9
         XdFpELIMyy6SorZzBLBQ3CNEtaCj9eIjBvG1tEurHqAFmz4qIIfjUSECKQQ5+8XGJouo
         A3+ujhDPqJswu99hypKqBFsjA4IrZj6FrRtggJoz0dqgEWKMHn64TmWgGC57oaWQJwHo
         lmARX2RXnTa3WFMg+5aQ/xoPIIBW15iDsAZtbxUpN0YdjLOZb+69JV/IrIyJK5Z5mC/F
         p29IHRxUResgboFytWop3kRdM4lYGEY5NvqrMdIMFoTH95stQsVomGtWG+B4+kJWr6ik
         fvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783529989; x=1784134789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LBkRK4qvw3GAK88j75HJZJSZl22o0gWGNwof6GHgXyo=;
        b=fxNHNZ3RST9Al8L2qfOXIL4tA8jylVK1A5KHMC+24Ok4ID3A46XKT9bPLwCjDhTk/8
         ssuBxnwRj2Usu/u1jyNXWkkYcfmwp0fDZlB+ppvXaBDJsO69ARP2eGoVXCmpVU7pjfTu
         zJRF10kVksr+/XDULeK2FsbDejRSaHOJpN3+wExAIq0V2Uju4iRTwjofe1B/wZUy5JTq
         2P/8ICE6NiVVfpfMyVMqbTwRu4omukFJz9NUEKqeNXDkwKH5iiMqY/qVChXyzeQDyorq
         8rvUNQZWUGjDrBMHxirHHDpOmXAjGeGcM8DBUxJmKArlIUwi9+T9gulaDWxiWthGNZmU
         tHaQ==
X-Gm-Message-State: AOJu0YzKqBhKsIRHALHFQY42SO9XZ1lEbTFu6tZFCfk/cZ/DWGqwME0O
	fTn+6GncCa/DGndP+tQxMBNsFItK4mhU12IEbuejrMJJJTGJGbQB/CVp
X-Gm-Gg: AfdE7ck2NYDlvPWr/4bmEX7KH/SpMJtXANWtI3RERks9jJT7Sa+AM8oDMRoFBJ+7PS/
	rbCz8srfLVvwdHIlMb0DwrRZkVKsbsFn23jFxMfkmecjAUM/5qUqE/iyYQ8Ysa1jJv36Mq4qJWW
	1mAeo9BCy/1Bzfb2b/k0oSv0ldetLjlj0u/LEX1ZStgUyXzPaEqtDUbCtCmvnxiAK20WJlY+Hh3
	EoFqT8aJC5cg+51JDcniMjwG4GF8EiTMlPfHksv80TBMtwN96oFxSl0yNB/lsxHsHUgvbrdWUGn
	FW1TIstPbgh2QWAMkOJ+l5Onv48y55cMvwdLqAtJsulZzwQk5qlIqyM/UyiRhr0CnaV4naHz0NR
	hyRyBOpjPgiZSBVy2hKyeyrAaYnYBPiFs5iF5W3KUl7pIGGiGtREJKxeSaw9gx95a///mIpLjvX
	B5U2jsKb2+gYf3i1EVSzdkgXo=
X-Received: by 2002:a05:600c:8a1a:10b0:493:b646:dc2f with SMTP id 5b1f17b1804b1-493e689fd8cmr27584755e9.13.1783529988806;
        Wed, 08 Jul 2026 09:59:48 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0faed92sm141201035e9.9.2026.07.08.09.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 09:59:48 -0700 (PDT)
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
Subject: [PATCH v8 4/4] arm64: dts: nuvoton: npcm845-evb: Add peripheral nodes
Date: Wed,  8 Jul 2026 19:59:29 +0300
Message-Id: <20260708165929.2233934-5-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260708165929.2233934-1-tmaimon77@gmail.com>
References: <20260708165929.2233934-1-tmaimon77@gmail.com>
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


