Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17703606A31A
	for <openbmc@archiver.kernel.org>; Tue, 27 Oct 2026 03:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dZYUkUeu
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jDGhj4b4Wz2yYK;
	Tue, 27 Oct 2026 14:49:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1235"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793072981;
	cv=none; b=IgmmlfTb2/olABRUB3AGZjwtyLfCYS8GHfq1mfHAODhAdV+0GFREfsBKT1IS0IDno+TDDZAlpwUdk/f7BV8Zq0tZrqRONFPdGaEw9zT2XwXvUb9E/gkxNgjh1yDaY24KyjqoRCAEb0Kwus60UpiIWAr4Ye/wQy0FVPQ6nsi7U9qqx4499+Z4tszGyTkC55YIWrAJ+fJ89jTXmOmCSHrhpvQgvYfFKEFarAlXpsGWKFWz5EZ2h5qqmW/M5Q0niewy7OB340ZlLRUM1I7WXvZy9GkOgejLRMWYo5tUq8nSF9fapR5b1OmNKdK3at/FvM7k+GJcbn/s6Ox5aBAXvwZglQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793072981; c=relaxed/relaxed;
	bh=ayFq1I1PgE7HlCuF6H4wPpUQ+/WQM35PTFr519q3M/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GYb8e8or2umwHnxquHCFEXfifybIz1wFyIvmlU8Dp76kiBM2LBywQ/9cjwRK0TGyWEnTUxXV/pLkKjccvnA6fihxeFbClX3ct4k0e8pHwrwbrN8VJn+68a2QnZTPNmQVSs/RmocYqLXnzaajJioCZG4IMieJ7qxldRCyu4GdG3P06ReRCOTCuxuSllnjdC+6MZYcf6mTL3GFC6yUuORf6IuR/epQUctY4LyUzGM82Upq91ZjICnPZnmbfgmiv3uQ0nELkYvHYygsnRk0yVpALEoP1CBiTUShldlnCCrY6UeHuE5e7rvGBiZ0D7vyWE6S3OMsfDm72qQ9Lfz454v/BA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dZYUkUeu; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1235; helo=mail-dl1-x1235.google.com; envelope-from=prasanth.padarthi10@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dZYUkUeu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1235; helo=mail-dl1-x1235.google.com; envelope-from=prasanth.padarthi10@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-dl1-x1235.google.com (mail-dl1-x1235.google.com [IPv6:2607:f8b0:4864:20::1235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jDGhh08hWz2yPG
	for <openbmc@lists.ozlabs.org>; Tue, 27 Oct 2026 14:49:39 +1100 (AEDT)
Received: by mail-dl1-x1235.google.com with SMTP id a92af1059eb24-185fd3a4ca3so3166028c88.0
        for <openbmc@lists.ozlabs.org>; Mon, 26 Oct 2026 20:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793072978; x=1793677778; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ayFq1I1PgE7HlCuF6H4wPpUQ+/WQM35PTFr519q3M/U=;
        b=dZYUkUeu5KFy+pOJiDb9eLomzvJdNdA10VzfSx4262nihAca8ZwVlSdR6kQ7h+4wQw
         x7RtzqHH/yUEs8CYgi+etitX0iCWtPtY3ExvAMHKJebKJC0O76+WzKcjwJ8JeZ9LgOTr
         qhv6ZHBdotsrU6V6ZvW2yS6UsNIXOGSkQ5gr3HtRoY5lzhGhSZJPRRtEre+UAckWgQDm
         Gc0yrezBVzVZvP5hNDqmbUv+enh28c4bRtVV2PORURJ7ND2Oo7oa0b2Cvd5tp8JVOwva
         kt2CejhJ36FwNznUVOfjLhzMA9ib0UzeOVH4IxBbpd7om/GbfB545J5N0hZLZR3txDgB
         DCjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793072978; x=1793677778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ayFq1I1PgE7HlCuF6H4wPpUQ+/WQM35PTFr519q3M/U=;
        b=IR1c/n1dPIHSbssLJ9XModoyYCwMTUAlV8YaTGTFe0c3mNKAAYqC8hrt5TMerGJmka
         DaX89/QS5F4cQKzH/gJgdKbVLY+nplpyTUf/BVp054Sz47HcU73+iBaqL4UOx9ofmkSA
         zJd0vNuTqnpQKfIp2HsQWqJcTbzs06zy+Ks8hUEKtPfkqfDA9cJQxsGuUNH4rsd7qrFT
         9mYJqgA7b9gwAE9XBqEgG5UPJ/Htni7geXqqzIqSALf60MDBquwWn0vsMaJ39WWmiFub
         vL7FiRZPFiq8Hc6LG0Yvk3ZHrkuY1BHm6zD0e3oRfoc113iLdGTJZREJGWoMijUh0qDh
         RnDw==
X-Forwarded-Encrypted: i=1; AKwUvBz/T/yI43U2yffa2qwyjaqrcyLZnMTTToS1t3OUM+L1B9WYXaMvU34t29v1VlA8zw8r/9jde1iD@lists.ozlabs.org
X-Gm-Message-State: AFq9FYLMkQG1Qd5+6Fq6yPMFs1DJ6+S+o2QMjuWfGfPkP3HaCpAnxAgA
	nkHMeSYjH71kOO5Kd6PcEX+SaS6tp6MWOD2tf86mQ/FvdJI1SQG5S2xK
X-Gm-Gg: AYBFou10MdxbuiZ0s4En5sLoeT/i8kwSyh8kpT5nO0IRCp8n6GQu/6q27bA5MowEnOG
	K1hQxLTYtEbnpbrhBsZ7xrfvtkhemCF75enG3OUf/OK4wgq1ONuGYZN22SdVvWgD7IbvJaZpZDs
	Jnag96etuiXlFnZdB3XT/84rt/LqZ/cAxqgTot0v7wlpv2oIVa7B0oaTf7+oqbq4/IU/EKdIeC8
	a53Je0NhL4bYoVV4/ndHMJ5kGXXyejOnQFeRCsVofZm3+XZ75atQEFLfO5xJufm75sK6yahKy9/
	uG2ZHYwAYwApDTmTEyaSD9UDnF3DMEpde2BMnwP7T4PLRjaB9f5uD77FMBwcSQdNvsbIYtIF0Tz
	OiX6f5MDSWcGYmUxXC8is09wtHZx+7Orfri0aXmDjb50tGKJClbvB6OYo5W89bcgH9OQrHF/+Ic
	/P8ph6rAqqVDa1B73trKCEjeynNslwLBZgHzlM64fBAbyuZ4WqtgItIk2Ck3LNL4IfU+yC9lRgq
	ToKMwuoDMOkofqePnpDeVIUTaNYOCESaAWfplw2pX60lOgFYUbgPmGuLMCGrA9Ij4b7UcuI8V/F
	iQsm4gURVeyhT+VB
X-Received: by 2002:a05:7022:1407:b0:1a2:1a28:9348 with SMTP id a92af1059eb24-1a21a289389mr4067703c88.37.1793072977517;
        Mon, 26 Oct 2026 20:49:37 -0700 (PDT)
Received: from debian.prasanth ([103.177.82.12])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a2a5a515sm26430012c88.19.2026.10.26.20.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 20:49:37 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	andrew@lunn.ch,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v9 2/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
Date: Tue, 27 Oct 2026 09:19:11 +0530
Message-ID: <20261027034911.99482-3-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027034911.99482-1-prasanth.padarthi10@gmail.com>
References: <20261027034911.99482-1-prasanth.padarthi10@gmail.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
Precedence: list
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the device tree for the ASRock Rack B650D4U BMC, based on the
ASPEED AST2600 SoC.

Describe memory, SPI NOR partitions, the UART console, GPIO line
names, framebuffer memory, and the EEPROM on I2C7. Use the EEPROM
as the NVMEM provider for the MAC0 address and configure MAC0 with
an RTL8211F PHY in RGMII-ID mode.

Enable both ADC engines with 2.5 V internal references and their
pin groups. Expose the sixteen channels through an IIO-to-hwmon
bridge for board voltage monitoring.

The DTB compiles with aspeed_g5_defconfig. Binding validation with
dtschema 2026.9 completes without diagnostics. Board validation
reports unmatched schemas for inherited AST2600 LHC and I3C-global
nodes, with no board-specific errors in the reported output.

ADC readings and recovery after BMC restart were tested using the
same ADC configuration in a locally patched OpenBMC image. That
image uses a different flash layout and separate power-control
changes; this complete upstream DTS has not been boot-tested.

Reviewed-by: Andrew Lunn <andrew@lunn.ch> # MAC0 and MDIO nodes only
Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
---
 arch/arm/boot/dts/aspeed/Makefile             |   1 +
 .../dts/aspeed/aspeed-bmc-asrock-b650d4u.dts  | 173 ++++++++++++++++++
 2 files changed, 174 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts

diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
index 6874b621d..fcb94e62c 100644
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
index 000000000..630588dcb
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
@@ -0,0 +1,173 @@
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
+		/* A0-A7 */     "", "", "", "", "", "", "", "",
+		/* B0-B7 */     "", "", "", "", "", "", "", "",
+		/* C0-C7 */     "", "", "", "", "", "", "", "",
+		/* D0-D7 */     "", "", "", "", "", "", "", "",
+		/* E0-E7 */     "", "", "", "", "", "", "", "",
+		/* F0-F7 */     "", "", "", "", "", "", "", "",
+		/* G0-G7 */     "", "", "", "", "", "", "", "",
+		/* H0-H7 */     "", "", "", "", "", "", "", "",
+		/* I0-I7 */     "", "", "", "", "", "", "", "",
+		/* J0-J7 */     "", "", "", "", "", "", "", "",
+		/* K0-K7 */     "", "", "", "", "", "", "", "",
+		/* L0-L7 */     "", "", "", "", "", "", "", "",
+		/* M0-M7 */     "", "", "", "", "", "", "", "",
+		/* N0-N7 */     "", "", "", "", "", "", "", "",
+		/* O0-O7 */     "", "", "", "", "", "", "", "",
+		/* P0-P7 */     "button-reset-n", "control-reset-n",
+		"button-power-n", "control-power-n",
+		"button-nmi-n", "control-nmi-n",
+		"", "",
+		/* Q0-Q7 */     "", "", "", "", "", "", "", "",
+		/* R0-R7 */     "", "", "", "", "", "", "", "",
+		/* S0-S7 */     "", "", "", "", "", "", "", "",
+		/* T0-T7 */     "", "", "", "", "", "", "", "",
+		/* U0-U7 */     "", "", "", "", "", "", "", "",
+		/* V0-V7 */     "", "", "", "", "", "", "", "",
+		/* W0-W7 */     "", "", "", "", "", "", "", "",
+		/* X0-X7 */     "", "", "", "", "", "", "", "",
+		/* Y0-Y7 */     "", "", "", "", "", "", "", "",
+		/* Z0-Z7 */     "", "", "", "", "", "", "", "";
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
+
+/ {
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&adc0 0>, <&adc0 1>, <&adc0 2>, <&adc0 3>,
+			      <&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
+			      <&adc1 0>, <&adc1 1>, <&adc1 2>, <&adc1 3>,
+			      <&adc1 4>, <&adc1 5>, <&adc1 6>, <&adc1 7>;
+	};
+};
+
+&adc0 {
+	status = "okay";
+	aspeed,int-vref-microvolt = <2500000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_adc0_default>,
+		    <&pinctrl_adc1_default>,
+		    <&pinctrl_adc2_default>,
+		    <&pinctrl_adc3_default>,
+		    <&pinctrl_adc4_default>,
+		    <&pinctrl_adc5_default>,
+		    <&pinctrl_adc6_default>,
+		    <&pinctrl_adc7_default>;
+};
+
+&adc1 {
+	status = "okay";
+	aspeed,int-vref-microvolt = <2500000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_adc8_default>,
+		    <&pinctrl_adc9_default>,
+		    <&pinctrl_adc10_default>,
+		    <&pinctrl_adc11_default>,
+		    <&pinctrl_adc12_default>,
+		    <&pinctrl_adc13_default>,
+		    <&pinctrl_adc14_default>,
+		    <&pinctrl_adc15_default>;
+};
-- 
2.47.3


