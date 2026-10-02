Return-Path: <openbmc+bounces-2701-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F6CFCA5FDD
	for <openbmc@archiver.kernel.org>; Sat,  3 Oct 2026 00:07:54 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hxQtY0jndz3bSw;
	Sat, 03 Oct 2026 10:06:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:36::c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1790922599;
	cv=none; b=F60MZkukMXs27l0w13quGLhQJaENoDKdESwhgRVIySnbwUFzNyXLyWzEtYCuYeFfaaznCYkcMcBgLcvuh5zxEYe0yujy9VLQqxonDhU9ZMb6CLxRS9TcP5quQmFCgGL28vl5QXB9yqqYQYX77o5BXhTZd63RzfNq83G/c5tMHuZF3wHmChmVsYjltp2/wE+lD1mUSIKZ3LuQ99wmdPMoPKxjbHAFSONs4/bf4/z5hxRU0J63gncsReZPMOHeoWNokdCbCfI1hhBFjw5YGYIAnxz3WRmvbqnKvTuQoLxyEp5QkgrE9eI5wcpetvbdYHs06PkILc6HvGSwKSrzXsCEUA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1790922599; c=relaxed/relaxed;
	bh=dStcbhY+rumd3OvNKAll20rKoWFwQ08aAwWyl88q55Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J0cuFv3l+XHqYkLDbTa+MXOf2yyb3xwiyMRTFF8BHLKclaw/3Dal7aAc1J8tKY5TZH3AiPDwaR3iuKmroSpUquIoBgOFN7AtMpPJ6Pb64gUjfPBaf09B9Gb/2/oLOKsZ3Ff1MQP5sVCXdYLiyn0JY8u0N13T2t9ToP2z6HcUJJWlZZ9b7wOtyiJP+/rSDmzgADGYFrGLhEILI9W9cXt+TIuQCeMBka03xIpzV53CEP+8uWdjdJDAo6Zqwg4IT46QIimiMAptk3FM7FTQeO6MJz+l1vqqkbieC2vwYPdh6XBX8XXctqH5n63wk96MN7iAtZRuNC29jzB0mJqL1Yxwwg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Rxlf1/H9; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:36::c; helo=mail-dy2-x0c.google.com; envelope-from=prasanth.padarthi10@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Rxlf1/H9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:36::c; helo=mail-dy2-x0c.google.com; envelope-from=prasanth.padarthi10@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-dy2-x0c.google.com (mail-dy2-x0c.google.com [IPv6:2607:f8b0:4864:36::c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hwzRC0CKJz2yDs
	for <openbmc@lists.ozlabs.org>; Fri, 02 Oct 2026 16:29:59 +1000 (AEST)
Received: by mail-dy2-x0c.google.com with SMTP id 5a478bee46e88-34ea9118159so1472255eec.3
        for <openbmc@lists.ozlabs.org>; Thu, 01 Oct 2026 23:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790922597; x=1791527397; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dStcbhY+rumd3OvNKAll20rKoWFwQ08aAwWyl88q55Y=;
        b=Rxlf1/H9tqj//kbCONM1yVd+vq1TIOlNCFqI5ntRhNDnGekCuvt/zDeq/XWuGcNilS
         i+5473HWoWsx/zxqFQzwsD2WDh9SJU8Ne8V86yK4yxvmA4wMhGeNihyKVauTZxFBrzT+
         SosFDokqSyp/ODRP0uu9CDaDsOfBlS3Du0Fqex9jnJ6lWGR2pyJfRt6tPui84XnaYMpB
         AdE+K14VdFvmJWSQrnaxOjxxK6OdAR0PS+bS726voZl0eS8BcUTeu8ZYYweu6uIu58rx
         8bDE5k3AgUglO9fXhQMciwFmfMVtFpushreXqvDj/a58ByzVldtERv1iqVEXgwsocf8E
         c/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790922597; x=1791527397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dStcbhY+rumd3OvNKAll20rKoWFwQ08aAwWyl88q55Y=;
        b=y8TM1S4688sfijxyCd/MfgxuBymWJFMq5GT5JO1ttjhpjwAjrbPtLFBIOGK9Ca0rC6
         eIPDPbDynSsUjDHgsMUfGC8+TTEqK4AjCmuRoKdEoWQnKZaCU/LIbrySwkyuurJjArPU
         ZAoVvm8SMfOzQQQDtOWtv+XkY8aFAi0v6PcP5lTigFVBHbTh52STfA3xF0rP+FZ8/kcL
         wVUZjbUOHcu/JNNRrJmTc11woaSzH5MhjQ8zK23JeY047zR58ns2BeOE58v3cfp8qAe6
         hcbzhmYbXvDE2HsIsai22kQwsrnSYT/Btps9MZYpVl+/2SmG7QTQW+WIKAP+DnbaHraK
         u2GQ==
X-Forwarded-Encrypted: i=1; AKwUvBzT+GJ84y9lBojuCpClxX9bS2NVBhOETGhlmk1JJBrFd6ucnQ1xWJpOWFdt96hLKNkg9RQNJONw@lists.ozlabs.org
X-Gm-Message-State: AFuF++mjLYMBhM1Opw/Pw5PvE98lo6sj/W8lgujexTUXBuIqRqreL83F
	RyKk3WI/T0KNKJUG+CsqL8jAyvfnzpVVYWAsNWoTH/ptuzS0M/QO3YSI
X-Gm-Gg: AYBFou3Z1+nmFXEweVijw6B61VVV5JVESdrIHlRYfhPvbbHe8FOYyzO3Jm2FtaFql18
	13ndefpMpE1RtwPYe6kR5ddYicMWuFNb2SivBqotbOd7rTyyRqVRKI79VqOYl1+l69gzuBYUKTx
	7AJbcKtkzlhiW/OaTTpYHigeKAAvHqFrlltcqo2pNnKcBRIzErsoLDgKFUR+LJBwimSys9uTpX8
	q+I+xTf0L4aRp6FN1lGcgk8LF4h8tU4dDtJPxdWb8OFTcyJC0l4SoyaTYv6dDDVbUa6HEYOmUNq
	IXL/l8R5giHWTMX3c5gIi95sdcLDoVvtnuOlhrW8clznlG2ptWy2RE9PamdK+40EZtJA82BW1zn
	pBfnTJGfsXAdgoWxRtKlcfXbfn8ttVm0s2Sn8yQ58znY8HdByun4C1UIGo05XhwnsDh4ZmKUjPM
	RNpjMNDBfb4QD+VgBNsFp+WUxlL7TsIwdQDk+0bdTBqouDzycULBmimMK5d5eW3QcD60ztV7nZB
	DXZKmZyLh42j5Hk
X-Received: by 2002:a05:701b:291c:b0:143:298e:45a1 with SMTP id a92af1059eb24-14f5c7e2290mr1802049c88.40.1790922596939;
        Thu, 01 Oct 2026 23:29:56 -0700 (PDT)
Received: from debian.prasanth ([103.183.205.240])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f45fedd43sm6236636c88.4.2026.10.01.23.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 23:29:56 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v8 2/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
Date: Fri,  2 Oct 2026 11:59:33 +0530
Message-ID: <20261002062933.26497-3-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261002062933.26497-1-prasanth.padarthi10@gmail.com>
References: <20261002062933.26497-1-prasanth.padarthi10@gmail.com>
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

Add the device tree for the ASRock Rack B650D4U BMC, which is
based on the ASPEED AST2600 SoC.

Describe the BMC memory, SPI NOR flash layout, UART console,
GPIO line names, video framebuffer memory, I2C EEPROM, and MAC0
connected to an RTL8211F Ethernet PHY.

Use the EEPROM on I2C7 as the NVMEM provider for the MAC0 address.

Configure MAC0 to use the RTL8211F in RGMII-ID mode.

Reviewed-by: Andrew Lunn <andrew@lunn.ch> # MAC0 and MDIO nodes only
Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
---
 arch/arm/boot/dts/aspeed/Makefile             |   1 +
 .../dts/aspeed/aspeed-bmc-asrock-b650d4u.dts  | 135 ++++++++++++++++++
 2 files changed, 136 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts

diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
index 6b68671f9379..b109491d5c8f 100644
--- a/arch/arm/boot/dts/aspeed/Makefile
+++ b/arch/arm/boot/dts/aspeed/Makefile
@@ -10,6 +10,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-ampere-mtmitchell.dtb \
 	aspeed-bmc-arm-stardragon4800-rep2.dtb \
 	aspeed-bmc-asrock-altrad8.dtb \
+	aspeed-bmc-asrock-b650d4u.dtb \
 	aspeed-bmc-asrock-e3c246d4i.dtb \
 	aspeed-bmc-asrock-e3c256d4i.dtb \
 	aspeed-bmc-asrock-paul-ipmi-card.dtb \
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
new file mode 100644
index 000000000000..a4e384588a54
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
@@ -0,0 +1,135 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+#include "aspeed-g6.dtsi"
+
+/ {
+	compatible = "asrock,b650d4u-bmc", "aspeed,ast2600";
+	model = "ASRock Rack B650D4U BMC";
+
+	aliases {
+		serial0 = &uart5;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x20000000>;
+	};
+
+	reserved-memory {
+		ranges;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		gfx_memory: framebuffer {
+			compatible = "shared-dma-pool";
+			alignment = <0x01000000>;
+			reusable;
+			size = <0x01000000>;
+		};
+	};
+};
+
+&fmc {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		label = "bmc";
+		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <4>;
+		m25p,fast-read;
+
+		status = "okay";
+
+#include "openbmc-flash-layout-64.dtsi"
+	};
+};
+
+&gfx {
+	memory-region = <&gfx_memory>;
+
+	status = "okay";
+};
+
+&gpio0 {
+	gpio-line-names =
+		/* A0-A7 */	"","","","","","","","",
+		/* B0-B7 */	"","","","","","","","",
+		/* C0-C7 */	"","","","","","","","",
+		/* D0-D7 */	"","","","","","","","",
+		/* E0-E7 */	"","","","","","","","",
+		/* F0-F7 */	"","","","","","","","",
+		/* G0-G7 */	"","","","","","","","",
+		/* H0-H7 */	"","","","","","","","",
+		/* I0-I7 */	"","","","","","","","",
+		/* J0-J7 */	"","","","","","","","",
+		/* K0-K7 */	"","","","","","","","",
+		/* L0-L7 */	"","","","","","","","",
+		/* M0-M7 */	"","","","","","","","",
+		/* N0-N7 */	"","","","","","","","",
+		/* O0-O7 */	"","","","","","","","",
+		/* P0-P7 */	"button-reset-n","control-reset-n",
+		"button-power-n","control-power-n",
+		"button-nmi-n","control-nmi-n",
+		"","",
+		/* Q0-Q7 */	"","","","","","","","",
+		/* R0-R7 */	"","","","","","","","",
+		/* S0-S7 */	"","","","","","","","",
+		/* T0-T7 */	"","","","","","","","",
+		/* U0-U7 */	"","","","","","","","",
+		/* V0-V7 */	"","","","","","","","",
+		/* W0-W7 */	"","","","","","","","",
+		/* X0-X7 */	"","","","","","","","",
+		/* Y0-Y7 */	"","","","","","","","",
+		/* Z0-Z7 */	"","","","","","","","";
+};
+
+&i2c7 {
+	status = "okay";
+
+	eeprom@57 {
+		compatible = "atmel,24c128";
+		reg = <0x57>;
+		pagesize = <16>;
+
+		nvmem-layout {
+			compatible = "fixed-layout";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			eth0_macaddress: macaddress@3f80 {
+				reg = <0x3f80 6>;
+			};
+		};
+	};
+};
+
+&mac0 {
+	nvmem-cells = <&eth0_macaddress>;
+	nvmem-cell-names = "mac-address";
+	phy-handle = <&ethphy0>;
+	phy-mode = "rgmii-id";
+	pinctrl-0 = <&pinctrl_rgmii1_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&mdio0 {
+	status = "okay";
+
+	ethphy0: ethernet-phy@0 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0>;
+	};
+};
+
+&uart5 {
+	status = "okay";
+};
-- 
2.47.3


