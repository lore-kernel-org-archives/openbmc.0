Return-Path: <wangzhiqiang8906@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.167.193; helo=mail-oi1-f193.google.com;
 envelope-from=wangzhiqiang8906@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=inspur.com
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43Ldsr4YbXzDqPT
 for <openbmc@lists.ozlabs.org>; Fri, 21 Dec 2018 17:25:35 +1100 (AEDT)
Received: by mail-oi1-f193.google.com with SMTP id m6so3921374oig.11
 for <openbmc@lists.ozlabs.org>; Thu, 20 Dec 2018 22:25:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=7Ya/zC6LBgduxaiLYT+du0sy+8d3rgvtfo9XZPcDtpE=;
 b=geT5nGd3F/Mc3ssy5ROqFxMdRGUsonyX+drPbjEO8bUFOxyQPjDnkMlqErt7PMqknQ
 yT3NfIev3EqN3Ujce3T1kIP3aMoU8zYCTBzXXCVJMZ881sn/Mh6Nr1PUziLzAgflD/ew
 A+4jbAiN2384snLBGIN0kPT4fw0uWA5DMINKFRAVlh2QcyuTwYCnnl3cdAC3ZgWKvKqN
 xGudiqIxsx8jZI3eOC2oROeYwULdE//Qq9r336zNXdhb1iGEfHDNI8ycdI7gatc8dI/M
 heSu/IHye8fBm1AyWyP82OwiAfXPyCEePwBMGrFSGV0Lq4jjWdKSOiOwjkMyDGKGNZTH
 mhPQ==
X-Gm-Message-State: AA+aEWZDI1Sc4e6IXjd6W2YEz2wb+ulTGFWr+MyCPWQ8aZN48c5ozIRg
 Zldzc94aERhypkPwt3bBolSVJJRheV4=
X-Google-Smtp-Source: ALg8bN6nde0jEQPvXpKgnjQXg3LnDnFCGrKQpsczKay+VYcZfF61At/M2pGweR4JHjA8LLcDfJ4ypA==
X-Received: by 2002:aca:a805:: with SMTP id r5mr609962oie.5.1545373533724;
 Thu, 20 Dec 2018 22:25:33 -0800 (PST)
Received: from localhost ([97.64.21.159])
 by smtp.gmail.com with ESMTPSA id b18sm12439080oii.51.2018.12.20.22.25.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Dec 2018 22:25:32 -0800 (PST)
From: John Wang <wangzqbj@inspur.com>
To: joel@jms.id.au
Cc: openbmc@lists.ozlabs.org
Subject: [PATCH] ARM:dts:aspeed Add Inspur on5263m5 BMC
Date: Fri, 21 Dec 2018 14:25:29 +0800
Message-Id: <1545373529-22629-1-git-send-email-wangzqbj@inspur.com>
X-Mailer: git-send-email 2.7.4
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Dec 2018 06:25:38 -0000

Add initial version of device tree file for on5263m5 ast2500bmc

Signed-off-by: John Wang <wangzqbj@inspur.com>
---
 arch/arm/boot/dts/aspeed-bmc-inspur-on5263m5.dts | 146 +++++++++++++++++++++++
 1 file changed, 146 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-inspur-on5263m5.dts

diff --git a/arch/arm/boot/dts/aspeed-bmc-inspur-on5263m5.dts b/arch/arm/boot/dts/aspeed-bmc-inspur-on5263m5.dts
new file mode 100644
index 0000000..dff1085
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-inspur-on5263m5.dts
@@ -0,0 +1,146 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2017 Intel Corporation
+/dts-v1/;
+
+#include "aspeed-g5.dtsi"
+#include <dt-bindings/gpio/aspeed-gpio.h>
+
+/ {
+	model = "ON5263M5 BMC";
+	compatible = "inspur,on5263m5-bmc", "aspeed,ast2500";
+
+	chosen {
+		stdout-path = &uart5;
+		bootargs = "earlyprintk";
+	};
+
+	memory {
+		reg = <0x80000000 0x20000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		vga_memory: framebuffer@7f000000 {
+			no-map;
+			reg = <0x7f000000 0x01000000>;
+		};
+	};
+	
+	leds {
+	    compatible = "gpio-leds";
+	    
+	    bmc_alive {
+	        label = "bmc_alive";
+		gpios = <&gpio ASPEED_GPIO(I, 1) GPIO_ACTIVE_LOW>;
+		linux,default-trigger = "timer";
+	    };
+	};
+
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
+			<&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>;
+	};
+
+};
+
+&fmc {
+	status = "okay";
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "bmc";
+#include "openbmc-flash-layout.dtsi"
+	};
+};
+
+&spi1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi1_default>;
+
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "pnor";
+	};
+};
+
+&uart5 {
+	status = "okay";
+};
+
+&mac0 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rmii1_default>;
+	use-ncsi;
+};
+
+&mac1 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii2_default &pinctrl_mdio2_default>;
+};
+
+&i2c6 {
+	status = "okay";
+
+	tmp421@4e {
+	        compatible = "ti,tmp421";
+		reg = <0x4e>;
+	};
+
+	tmp112@48 {
+		compatible = "ti,tmp112";
+		reg = <0x48>;
+	};
+	
+	eeprom@54 {
+		compatible = "atmel,24c64";
+    		reg = <0x54>; 
+		pagesize = <32>;
+	};
+};
+
+&i2c7 {
+	status = "okay";
+
+	adm1278@11 {
+		  compatible = "adi,adm1278";
+		  reg = <0x11>;
+	};
+};
+
+&gfx {
+	status = "okay";
+};
+
+&pinctrl {
+	aspeed,external-nodes = <&gfx &lhc>;
+};
+
+&pwm_tacho {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default>;
+
+	fan@0 {
+   		reg = <0x00>;
+   		aspeed,fan-tach-ch = /bits/ 8 <0x00 0x01>;  
+ 	};
+
+ 	fan@1 {
+   		reg = <0x01>;
+   		aspeed,fan-tach-ch = /bits/ 8 <0x02 0x03>;
+ 	};
+};
+
+&adc {
+	status = "okay";
+};
-- 
2.7.4
