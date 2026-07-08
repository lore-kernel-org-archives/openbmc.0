Return-Path: <openbmc+bounces-2239-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92EEAC43458
	for <openbmc@archiver.kernel.org>; Wed,  8 Jul 2026 12:54:48 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gwJ2B3D2cz309w;
	Wed, 08 Jul 2026 22:54:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::331"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1783515250;
	cv=none; b=ZNKf/ui7vESIA9gk56KsvD7q9/lkbin7MHJ51k2eiggDIypBn66zE5FXwUbx80nMQk4/3TN2NXjKlyEn45Ey+2AgGR7tj5nHqQ00MoGGesMJZiqE+PoRS2nipe1MJkK4fHFmSrzSk67Ov4XIKpNAFxliW8C4O841+8uEb+erIu7JKH72b3uNSt8bDo/DhG+AJRI7HemDwZLvdGYVJT/BQtBxDOMAJbHKAbkXDJyJnx+F2KrdXy0pcn/9GkQRslCbl/SUb7/mUrJ2f9zt+gyZUnotVK6zOCgSxBfPgfXNfGoSWz1qCs+yhLKVbkxu10VATcxiQEJ3NvMliopgQkIyAg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1783515250; c=relaxed/relaxed;
	bh=d5MXfDCDE/AyuENJ/kxdvgeEz/KDFR45qXgmMmmZpAk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KtEf4wsXH4DEkX7FbOyFXW8mC/K5Y6PinoTBGuzQrCojvyxvCXk0w6ZDD75aVmLcgCcKjU8762ozlkMtJWNjw7QdEAfu/Metf1Q8ukIykf7hdLV1u/wc3k6PofHP5H1zoDiZq3arcQJ1egCtJ0HvSHdaJSsV44ptvz0ft9FQvVr2sui97gRe0jkKhb8fyO+QNXJ358H5BXEGEmInZLJZXNzsnXAjT4IbG5OdZ2lyOUYn3DyAED+I8FGO2uVS4G7sHlKBeSJlWU6c1Uf2kAs4PHvEA5WJZfZ/ZvX1wnPOV2MKD/cZ+cTzzxj/YqfOV22Snan8GOKg684t9wceQfdjJQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BqG5NkX5; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BqG5NkX5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gwJ283Mslz3054
	for <openbmc@lists.ozlabs.org>; Wed, 08 Jul 2026 22:54:08 +1000 (AEST)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-493d92b7db3so6814015e9.2
        for <openbmc@lists.ozlabs.org>; Wed, 08 Jul 2026 05:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515245; x=1784120045; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d5MXfDCDE/AyuENJ/kxdvgeEz/KDFR45qXgmMmmZpAk=;
        b=BqG5NkX5snrY+moYME+S+RNotzQsnzmQG5itUPCl/IpWFH+HPRkcSRxYwmlujStNTi
         V4c1KHsMfSIAOMfHwKjYZcg8wH8D2eZ+4NtVIBdN0ZE3shHU6EwoCDT7ZfjQStylsBAz
         5J9fx6yLKdVrOD21F5aTkmu7/poiPFF63+XP2IC9jshbYOyCtchSAbF9giPzmry43UTQ
         SkpjhcKbpqaGit8H345v8clQoRoqnldAIhiuLhyOt6+zYmZsWJIYVBiz3XZBj0ZxR00W
         k19RyLE3amhTzzUKVE029aRU+w55b3WbKpTmH/JcymEbDpyMgsD89qu9dS6sUYWAvnHV
         +gFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515245; x=1784120045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d5MXfDCDE/AyuENJ/kxdvgeEz/KDFR45qXgmMmmZpAk=;
        b=NvgQlSb0VCAkhUCsRy8hHt+fDzCZ7zJWFPAvqk3KfGkL5Xxp27AE6J8NvFASoqTD2X
         fGnri5oJdmsi2VTxMFxrTO2GJGPG5KIG+KWvJ4FtOuDVLymmsfVvBdQLvvwT/RYUpXie
         iKKJioITs0uU5oLEOKUfa7jTWBaClXUnn3e3lFSOeR70t/ik/PSkbUs58c+qSRRsLOqj
         /qT+vaM7ZKQozO/0O3fMPQ8RlhZ2wSSVv+ytxARSnmQMORXSc5ACDvINmUzPrEKaYxnN
         mKZoNQPcjEye3n1s1FVQT9O1b1ApWBLFK71qEyxKPvzlc78e4Lrn0SX9Mvn4srLwjLJU
         0N6A==
X-Gm-Message-State: AOJu0Yy/gcHcUZnfNoZ88xu7EFtJFF4JNSgoM58GhisfTXQ9fgxnPpdd
	DGMPkwlc3SnSZBEoeoXWCwOw2IX2NaO0fwoe2gClsatviaeZzOQj/Qjy
X-Gm-Gg: AfdE7cmwzVPOr7+d0GLucuqcEp12UkRtTQUG+bwTqzXqy4yuu1FLwDD8MNjXAejFYO3
	GwFnqks1ggVozeTgkwQ1xcErO0I/umL7zDYcPYR6Opv6fEDPJesVo7qUaLl7P560ZptPLtGq0AX
	GQbe10L/iFPW4p959cmuLdwPosG/iwOyFOkT0RJHAL+x2N480KSGNzUteEzjVnN+5+mHVuQi/0X
	tTaNhqyDgSLrPMPn3U1ktFS1fRC6XYSLJPj9tgZmggPuF0lVbIozDqgefgKYRllLNtm4Rh9X6xi
	1Ty6PeYYyzf10EzJsFkBVV/21fCoXgYwTyOB0OlyuCbPh0kUXO+MPBw3xU631+G+gXharHOYoq4
	WjxYBk2VE+DKzDEXXcKI7i6Xfiq1yttqEoE6qItaXYEiNsveS5i9rS4UQqp/Czsuubdj3CPKsoi
	kKxG9rlKf3nYfz4hRMIRhn1wQ=
X-Received: by 2002:a05:600c:3f0a:b0:490:e974:e006 with SMTP id 5b1f17b1804b1-493e68e8195mr24651025e9.29.1783515244924;
        Wed, 08 Jul 2026 05:54:04 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f3676dsm143824625e9.5.2026.07.08.05.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:54:04 -0700 (PDT)
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
Subject: [PATCH v7 3/4] arm64: dts: nuvoton: npcm845: Add peripheral nodes
Date: Wed,  8 Jul 2026 15:53:51 +0300
Message-Id: <20260708125352.1915040-4-tmaimon77@gmail.com>
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

Extend the NPCM845 SoC DTSI with the peripheral controller nodes needed
by the evaluation board and downstream platforms. Add the Ethernet MACs,
USB device controllers and PHY, MMC controller, FIU controllers, memory
controller, RNG, ADC, PWM/FAN controller, and I2C buses. Also add the
OP-TEE firmware node needed to describe these blocks.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   | 695 +++++++++++++++++-
 .../boot/dts/nuvoton/nuvoton-npcm845.dtsi     |  11 +-
 2 files changed, 697 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
index 0e5feabf2..7608dcf54 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
@@ -4,6 +4,7 @@
 #include <dt-bindings/clock/nuvoton,npcm845-clk.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	#address-cells = <2>;
@@ -35,6 +36,11 @@ gic: interrupt-controller@dfff9000 {
 		};
 	};
 
+	udc0_phy: usb-phy {
+		compatible = "usb-nop-xceiv";
+		#phy-cells = <0>;
+	};
+
 	ahb {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -51,6 +57,252 @@ clk: rstc: reset-controller@f0801000 {
 			#clock-cells = <1>;
 		};
 
+		gmac1: ethernet@f0804000 {
+			device_type = "network";
+			compatible = "snps,dwmac-3.72a", "snps,dwmac";
+			reg = <0x0 0xf0804000 0x0 0x2000>;
+			interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			clocks	= <&clk NPCM8XX_CLK_AHB>;
+			clock-names = "stmmaceth";
+			pinctrl-names = "default";
+			pinctrl-0 = <&rg2_pins
+					&rg2mdio_pins>;
+			status = "disabled";
+		};
+
+		gmac2: ethernet@f0806000 {
+			device_type = "network";
+			compatible = "snps,dwmac-3.72a", "snps,dwmac";
+			reg = <0x0 0xf0806000 0x0 0x2000>;
+			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			clocks	= <&clk NPCM8XX_CLK_AHB>;
+			clock-names = "stmmaceth";
+			pinctrl-names = "default";
+			pinctrl-0 = <&r1_pins
+					&r1err_pins
+					&r1md_pins>;
+			status = "disabled";
+		};
+
+		gmac3: ethernet@f0808000 {
+			device_type = "network";
+			compatible = "snps,dwmac-3.72a", "snps,dwmac";
+			reg = <0x0 0xf0808000 0x0 0x2000>;
+			interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			clocks	= <&clk NPCM8XX_CLK_AHB>;
+			clock-names = "stmmaceth";
+			pinctrl-names = "default";
+			pinctrl-0 = <&r2_pins
+					&r2err_pins
+					&r2md_pins>;
+			status = "disabled";
+		};
+
+		mc: memory-controller@f0824000 {
+			compatible = "nuvoton,npcm845-memory-controller";
+			reg = <0x0 0xf0824000 0x0 0x1000>;
+			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		udc0: usb@f0830000 {
+			compatible = "nuvoton,npcm845-udc", "nuvoton,npcm750-udc";
+			reg = <0x0 0xf0830000 0x0 0x1000
+			       0x0 0xfffeb000 0x0 0x800>;
+			interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk NPCM8XX_CLK_SU>;
+			clock-names = "clk_usb_bridge";
+
+			phys = <&udc0_phy>;
+			phy_type = "utmi_wide";
+			dr_mode = "peripheral";
+			status = "disabled";
+		};
+
+		udc1: usb@f0831000 {
+			compatible = "nuvoton,npcm845-udc", "nuvoton,npcm750-udc";
+			reg = <0x0 0xf0831000 0x0 0x1000
+			       0x0 0xfffeb800 0x0 0x800>;
+			interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk NPCM8XX_CLK_SU>;
+			clock-names = "clk_usb_bridge";
+
+			phys = <&udc0_phy>;
+			phy_type = "utmi_wide";
+			dr_mode = "peripheral";
+			status = "disabled";
+		};
+
+		udc2: usb@f0832000 {
+			compatible = "nuvoton,npcm845-udc", "nuvoton,npcm750-udc";
+			reg = <0x0 0xf0832000 0x0 0x1000
+			       0x0 0xfffec000 0x0 0x800>;
+			interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk NPCM8XX_CLK_SU>;
+			clock-names = "clk_usb_bridge";
+
+			phys = <&udc0_phy>;
+			phy_type = "utmi_wide";
+			dr_mode = "peripheral";
+			status = "disabled";
+		};
+
+		udc3: usb@f0833000 {
+			compatible = "nuvoton,npcm845-udc", "nuvoton,npcm750-udc";
+			reg = <0x0 0xf0833000 0x0 0x1000
+			       0x0 0xfffec800 0x0 0x800>;
+			interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk NPCM8XX_CLK_SU>;
+			clock-names = "clk_usb_bridge";
+
+			phys = <&udc0_phy>;
+			phy_type = "utmi_wide";
+			dr_mode = "peripheral";
+			status = "disabled";
+		};
+
+		udc4: usb@f0834000 {
+			compatible = "nuvoton,npcm845-udc", "nuvoton,npcm750-udc";
+			reg = <0x0 0xf0834000 0x0 0x1000
+			       0x0 0xfffed000 0x0 0x800>;
+			interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk NPCM8XX_CLK_SU>;
+			clock-names = "clk_usb_bridge";
+
+			phys = <&udc0_phy>;
+			phy_type = "utmi_wide";
+			dr_mode = "peripheral";
+			status = "disabled";
+		};
+
+		udc5: usb@f0835000 {
+			compatible = "nuvoton,npcm845-udc", "nuvoton,npcm750-udc";
+			reg = <0x0 0xf0835000 0x0 0x1000
+			       0x0 0xfffed800 0x0 0x800>;
+			interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk NPCM8XX_CLK_SU>;
+			clock-names = "clk_usb_bridge";
+
+			phys = <&udc0_phy>;
+			phy_type = "utmi_wide";
+			dr_mode = "peripheral";
+			status = "disabled";
+		};
+
+		udc6: usb@f0836000 {
+			compatible = "nuvoton,npcm845-udc", "nuvoton,npcm750-udc";
+			reg = <0x0 0xf0836000 0x0 0x1000
+			       0x0 0xfffee000 0x0 0x800>;
+			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk NPCM8XX_CLK_SU>;
+			clock-names = "clk_usb_bridge";
+
+			phys = <&udc0_phy>;
+			phy_type = "utmi_wide";
+			dr_mode = "peripheral";
+			status = "disabled";
+		};
+
+		udc7: usb@f0837000 {
+			compatible = "nuvoton,npcm845-udc", "nuvoton,npcm750-udc";
+			reg = <0x0 0xf0837000 0x0 0x1000
+			       0x0 0xfffee800 0x0 0x800>;
+			interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk NPCM8XX_CLK_SU>;
+			clock-names = "clk_usb_bridge";
+
+			phys = <&udc0_phy>;
+			phy_type = "utmi_wide";
+			dr_mode = "peripheral";
+			status = "disabled";
+		};
+
+		udc8: usb@f0838000 {
+			compatible = "nuvoton,npcm845-udc", "nuvoton,npcm750-udc";
+			reg = <0x0 0xf0838000 0x0 0x1000
+			       0x0 0xfffef000 0x0 0x800>;
+			interrupts = <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk NPCM8XX_CLK_SU>;
+			clock-names = "clk_usb_bridge";
+
+			phys = <&udc0_phy>;
+			phy_type = "utmi_wide";
+			dr_mode = "peripheral";
+			status = "disabled";
+		};
+
+		udc9: usb@f0839000 {
+			compatible = "nuvoton,npcm845-udc", "nuvoton,npcm750-udc";
+			reg = <0x0 0xf0839000 0x0 0x1000
+			       0x0 0xfffef800 0x0 0x800>;
+			interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk NPCM8XX_CLK_SU>;
+			clock-names = "clk_usb_bridge";
+
+			phys = <&udc0_phy>;
+			phy_type = "utmi_wide";
+			dr_mode = "peripheral";
+			status = "disabled";
+		};
+
+		sdhci: mmc@f0842000 {
+			compatible = "nuvoton,npcm845-sdhci";
+			reg = <0x0 0xf0842000 0x0 0x100>;
+			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk NPCM8XX_CLK_AHB>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&mmc8_pins
+				     &mmc_pins>;
+			status = "disabled";
+		};
+
+		fiu0: spi@fb000000 {
+			compatible = "nuvoton,npcm845-fiu";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0 0xfb000000 0x0 0x1000>;
+			reg-names = "control";
+			clocks =  <&clk NPCM8XX_CLK_SPI0>;
+			status = "disabled";
+		};
+
+		fiu1: spi@fb002000 {
+			compatible = "nuvoton,npcm845-fiu";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0 0xfb002000 0x0 0x1000>;
+			reg-names = "control";
+			clocks =  <&clk NPCM8XX_CLK_SPI1>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&spi1_pins>;
+			status = "disabled";
+		};
+
+		fiu3: spi@c0000000 {
+			compatible = "nuvoton,npcm845-fiu";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0 0xc0000000 0x0 0x1000>;
+			reg-names = "control";
+			clocks =  <&clk NPCM8XX_CLK_SPI3>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&spi3_pins>;
+			status = "disabled";
+		};
+
+		fiux: spi@fb001000 {
+			compatible = "nuvoton,npcm845-fiu";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0 0xfb001000 0x0 0x1000>,
+			<0x0 0xf8000000 0x0 0x2000000>;
+			reg-names = "control", "memory";
+			clocks =  <&clk NPCM8XX_CLK_SPIX>;
+			status = "disabled";
+		};
+
 		apb {
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -59,13 +311,6 @@ apb {
 			ranges = <0x0 0x0 0xf0000000 0x00300000>,
 				<0xfff00000 0x0 0xfff00000 0x00016000>;
 
-			timer0: timer@8000 {
-				compatible = "nuvoton,npcm845-timer";
-				interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
-				reg = <0x8000 0x1C>;
-				clocks = <&refclk>;
-			};
-
 			serial0: serial@0 {
 				compatible = "nuvoton,npcm845-uart", "nuvoton,npcm750-uart";
 				reg = <0x0 0x1000>;
@@ -168,6 +413,442 @@ peci: peci-controller@100000 {
 				cmd-timeout-ms = <1000>;
 				status = "disabled";
 			};
+
+			rng: rng@b000 {
+				compatible = "nuvoton,npcm845-rng";
+				reg = <0xb000 0x8>;
+				status = "disabled";
+			};
+
+			adc: adc@c000 {
+				compatible = "nuvoton,npcm845-adc";
+				reg = <0xC000 0x8>;
+				interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk NPCM8XX_CLK_ADC>;
+				resets = <&rstc 0x20 27>;
+				status = "disabled";
+			};
+
+			i2c0: i2c@80000 {
+				reg = <0x80000 0x1000>;
+				compatible = "nuvoton,npcm845-i2c";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks =  <&clk NPCM8XX_CLK_APB2>;
+				clock-frequency = <100000>;
+				interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&smb0_pins>;
+				nuvoton,sys-mgr = <&gcr>;
+				status = "disabled";
+			};
+
+			i2c1: i2c@81000 {
+				reg = <0x81000 0x1000>;
+				compatible = "nuvoton,npcm845-i2c";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks =  <&clk NPCM8XX_CLK_APB2>;
+				clock-frequency = <100000>;
+				interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&smb1_pins>;
+				nuvoton,sys-mgr = <&gcr>;
+				status = "disabled";
+			};
+
+			i2c2: i2c@82000 {
+				reg = <0x82000 0x1000>;
+				compatible = "nuvoton,npcm845-i2c";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks =  <&clk NPCM8XX_CLK_APB2>;
+				clock-frequency = <100000>;
+				interrupts = <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&smb2_pins>;
+				nuvoton,sys-mgr = <&gcr>;
+				status = "disabled";
+			};
+
+			i2c3: i2c@83000 {
+				reg = <0x83000 0x1000>;
+				compatible = "nuvoton,npcm845-i2c";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks =  <&clk NPCM8XX_CLK_APB2>;
+				clock-frequency = <100000>;
+				interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&smb3_pins>;
+				nuvoton,sys-mgr = <&gcr>;
+				status = "disabled";
+			};
+
+			i2c4: i2c@84000 {
+				reg = <0x84000 0x1000>;
+				compatible = "nuvoton,npcm845-i2c";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks =  <&clk NPCM8XX_CLK_APB2>;
+				clock-frequency = <100000>;
+				interrupts = <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&smb4_pins>;
+				nuvoton,sys-mgr = <&gcr>;
+				status = "disabled";
+			};
+
+			i2c5: i2c@85000 {
+				reg = <0x85000 0x1000>;
+				compatible = "nuvoton,npcm845-i2c";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks =  <&clk NPCM8XX_CLK_APB2>;
+				clock-frequency = <100000>;
+				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&smb5_pins>;
+				nuvoton,sys-mgr = <&gcr>;
+				status = "disabled";
+			};
+
+			i2c6: i2c@86000 {
+				reg = <0x86000 0x1000>;
+				compatible = "nuvoton,npcm845-i2c";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks =  <&clk NPCM8XX_CLK_APB2>;
+				clock-frequency = <100000>;
+				interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&smb6_pins>;
+				nuvoton,sys-mgr = <&gcr>;
+				status = "disabled";
+			};
+
+			i2c7: i2c@87000 {
+				reg = <0x87000 0x1000>;
+				compatible = "nuvoton,npcm845-i2c";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks =  <&clk NPCM8XX_CLK_APB2>;
+				clock-frequency = <100000>;
+				interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&smb7_pins>;
+				nuvoton,sys-mgr = <&gcr>;
+				status = "disabled";
+			};
+
+			i2c8: i2c@88000 {
+				reg = <0x88000 0x1000>;
+				compatible = "nuvoton,npcm845-i2c";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks =  <&clk NPCM8XX_CLK_APB2>;
+				clock-frequency = <100000>;
+				interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&smb8_pins>;
+				nuvoton,sys-mgr = <&gcr>;
+				status = "disabled";
+			};
+
+			i2c9: i2c@89000 {
+				reg = <0x89000 0x1000>;
+				compatible = "nuvoton,npcm845-i2c";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks =  <&clk NPCM8XX_CLK_APB2>;
+				clock-frequency = <100000>;
+				interrupts = <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&smb9_pins>;
+				nuvoton,sys-mgr = <&gcr>;
+				status = "disabled";
+			};
+
+			i2c10: i2c@8a000 {
+				reg = <0x8a000 0x1000>;
+				compatible = "nuvoton,npcm845-i2c";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks =  <&clk NPCM8XX_CLK_APB2>;
+				clock-frequency = <100000>;
+				interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&smb10_pins>;
+				nuvoton,sys-mgr = <&gcr>;
+				status = "disabled";
+			};
+
+			i2c11: i2c@8b000 {
+				reg = <0x8b000 0x1000>;
+				compatible = "nuvoton,npcm845-i2c";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks =  <&clk NPCM8XX_CLK_APB2>;
+				clock-frequency = <100000>;
+				interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&smb11_pins>;
+				nuvoton,sys-mgr = <&gcr>;
+				status = "disabled";
+			};
+
+			i2c12: i2c@8c000 {
+				reg = <0x8c000 0x1000>;
+				compatible = "nuvoton,npcm845-i2c";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks =  <&clk NPCM8XX_CLK_APB2>;
+				clock-frequency = <100000>;
+				interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&smb12_pins>;
+				nuvoton,sys-mgr = <&gcr>;
+				status = "disabled";
+			};
+
+			i2c13: i2c@8d000 {
+				reg = <0x8d000 0x1000>;
+				compatible = "nuvoton,npcm845-i2c";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks =  <&clk NPCM8XX_CLK_APB2>;
+				clock-frequency = <100000>;
+				interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&smb13_pins>;
+				nuvoton,sys-mgr = <&gcr>;
+				status = "disabled";
+			};
+
+			i2c14: i2c@8e000 {
+				reg = <0x8e000 0x1000>;
+				compatible = "nuvoton,npcm845-i2c";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks =  <&clk NPCM8XX_CLK_APB2>;
+				clock-frequency = <100000>;
+				interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&smb14_pins>;
+				nuvoton,sys-mgr = <&gcr>;
+				status = "disabled";
+			};
+
+			i2c15: i2c@8f000 {
+				reg = <0x8f000 0x1000>;
+				compatible = "nuvoton,npcm845-i2c";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks =  <&clk NPCM8XX_CLK_APB2>;
+				clock-frequency = <100000>;
+				interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&smb15_pins>;
+				nuvoton,sys-mgr = <&gcr>;
+				status = "disabled";
+			};
+
+			i2c16: i2c@fff00000 {
+				reg = <0xfff00000 0x1000>;
+				compatible = "nuvoton,npcm845-i2c";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks =  <&clk NPCM8XX_CLK_APB2>;
+				clock-frequency = <100000>;
+				interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&smb16_pins>;
+				nuvoton,sys-mgr = <&gcr>;
+				status = "disabled";
+			};
+
+			i2c17: i2c@fff01000 {
+				reg = <0xfff01000 0x1000>;
+				compatible = "nuvoton,npcm845-i2c";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks =  <&clk NPCM8XX_CLK_APB2>;
+				clock-frequency = <100000>;
+				interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&smb17_pins>;
+				nuvoton,sys-mgr = <&gcr>;
+				status = "disabled";
+			};
+
+			i2c18: i2c@fff02000 {
+				reg = <0xfff02000 0x1000>;
+				compatible = "nuvoton,npcm845-i2c";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks =  <&clk NPCM8XX_CLK_APB2>;
+				clock-frequency = <100000>;
+				interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&smb18_pins>;
+				nuvoton,sys-mgr = <&gcr>;
+				status = "disabled";
+			};
+
+			i2c19: i2c@fff03000 {
+				reg = <0xfff03000 0x1000>;
+				compatible = "nuvoton,npcm845-i2c";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks =  <&clk NPCM8XX_CLK_APB2>;
+				clock-frequency = <100000>;
+				interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&smb19_pins>;
+				nuvoton,sys-mgr = <&gcr>;
+				status = "disabled";
+			};
+
+			i2c20: i2c@fff04000 {
+				reg = <0xfff04000 0x1000>;
+				compatible = "nuvoton,npcm845-i2c";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks =  <&clk NPCM8XX_CLK_APB2>;
+				clock-frequency = <100000>;
+				interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&smb20_pins>;
+				nuvoton,sys-mgr = <&gcr>;
+				status = "disabled";
+			};
+
+			i2c21: i2c@fff05000 {
+				reg = <0xfff05000 0x1000>;
+				compatible = "nuvoton,npcm845-i2c";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks =  <&clk NPCM8XX_CLK_APB2>;
+				clock-frequency = <100000>;
+				interrupts = <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&smb21_pins>;
+				nuvoton,sys-mgr = <&gcr>;
+				status = "disabled";
+			};
+
+			i2c22: i2c@fff06000 {
+				reg = <0xfff06000 0x1000>;
+				compatible = "nuvoton,npcm845-i2c";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks =  <&clk NPCM8XX_CLK_APB2>;
+				clock-frequency = <100000>;
+				interrupts = <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&smb22_pins>;
+				nuvoton,sys-mgr = <&gcr>;
+				status = "disabled";
+			};
+
+			i2c23: i2c@fff07000 {
+				reg = <0xfff07000 0x1000>;
+				compatible = "nuvoton,npcm845-i2c";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks =  <&clk NPCM8XX_CLK_APB2>;
+				clock-frequency = <100000>;
+				interrupts = <GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&smb23_pins>;
+				nuvoton,sys-mgr = <&gcr>;
+				status = "disabled";
+			};
+
+			i2c24: i2c@fff08000 {
+				reg = <0xfff08000 0x1000>;
+				compatible = "nuvoton,npcm845-i2c";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks =  <&clk NPCM8XX_CLK_APB2>;
+				clock-frequency = <100000>;
+				interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
+				nuvoton,sys-mgr = <&gcr>;
+				status = "disabled";
+			};
+
+			i2c25: i2c@fff09000 {
+				reg = <0xfff09000 0x1000>;
+				compatible = "nuvoton,npcm845-i2c";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks =  <&clk NPCM8XX_CLK_APB2>;
+				clock-frequency = <100000>;
+				interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
+				nuvoton,sys-mgr = <&gcr>;
+				status = "disabled";
+			};
+
+			i2c26: i2c@fff0a000 {
+				reg = <0xfff0a000 0x1000>;
+				compatible = "nuvoton,npcm845-i2c";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks =  <&clk NPCM8XX_CLK_APB2>;
+				clock-frequency = <100000>;
+				interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
+				nuvoton,sys-mgr = <&gcr>;
+				status = "disabled";
+			};
+
+			pwm_fan:pwm-fan-controller@103000 {
+				compatible = "nuvoton,npcm845-pwm-fan";
+				reg = <0x103000 0x3000>,
+					<0x180000 0x8000>;
+				reg-names = "pwm", "fan";
+				clocks =  <&clk NPCM8XX_CLK_APB3>,
+					<&clk NPCM8XX_CLK_APB4>;
+				clock-names = "pwm","fan";
+				interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&pwm0_pins &pwm1_pins
+						&pwm2_pins &pwm3_pins
+						&pwm4_pins &pwm5_pins
+						&pwm6_pins &pwm7_pins
+						&pwm8_pins &pwm9_pins
+						&pwm10_pins &pwm11_pins
+						&fanin0_pins &fanin1_pins
+						&fanin2_pins &fanin3_pins
+						&fanin4_pins &fanin5_pins
+						&fanin6_pins &fanin7_pins
+						&fanin8_pins &fanin9_pins
+						&fanin10_pins &fanin11_pins
+						&fanin12_pins &fanin13_pins
+						&fanin14_pins &fanin15_pins>;
+				status = "disabled";
+			};
+
+			pspi: spi@201000 {
+				compatible = "nuvoton,npcm845-pspi";
+				reg = <0x201000 0x1000>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&pspi_pins>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
+				clocks =  <&clk NPCM8XX_CLK_APB5>;
+				clock-names = "clk_apb5";
+				resets = <&rstc 0x24 23>;
+				status = "disabled";
+			};
+
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845.dtsi
index 8239d9a9f..21dea3236 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845.dtsi
@@ -64,8 +64,8 @@ arm-pmu {
 	};
 
 	psci {
-		compatible = "arm,psci-1.0";
-		method = "smc";
+		compatible      = "arm,psci-1.0";
+		method          = "smc";
 	};
 
 	timer {
@@ -75,4 +75,11 @@ timer {
 			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
 			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
 	};
+
+	firmware {
+		optee {
+			compatible = "linaro,optee-tz";
+			method = "smc";
+		};
+	};
 };
-- 
2.34.1


