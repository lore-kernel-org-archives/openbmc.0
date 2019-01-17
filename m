Return-Path: <wangzhiqiang8906@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.210.196; helo=mail-pf1-f196.google.com;
 envelope-from=wangzhiqiang8906@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=inspur.com
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43gFHC6bKLzDqkq;
 Thu, 17 Jan 2019 17:56:39 +1100 (AEDT)
Received: by mail-pf1-f196.google.com with SMTP id w73so4340951pfk.10;
 Wed, 16 Jan 2019 22:56:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=SMY+o4iAmQhkVGtRN8BO3dEcyFUmXVzcyBddW2yYBSU=;
 b=Lubpp+Gt4glBFhDdo8d+7jUG+jJELUG32FPKufYIWX2oe+nW7urlgjOhI4FE3kliSK
 ilXIWIvzfXhUvoNXJPEqPR0DZrpCH0fbh0lJwSVbIY/mK9pmU8makmRMXXc/O9VqyaAH
 tioPedEiKqyJJDaH6yQadTBFluT9mIixe/3c5JvDvSQrkQWTeHiaCyX0xzTdSLSY8ip2
 cUnAhHyEsSdb0c+yNRhNBFoVrb306IXLFAM0X7QiyZ+dinaNhuAZXx6vt50hX7Txpplc
 LUC799j16k00+5P3GTrBGoeF17l/uQxXlA27kf4kINA9g809NhUpdr7V5MAGrdmVNhly
 /IaQ==
X-Gm-Message-State: AJcUukdE+z80RL6DOXsI6apmUFH/TkqLWgc33D15OZwwEQW5W7OspR9x
 30+jRv0awzKMcD6yWtHt57OqOMf0u8E=
X-Google-Smtp-Source: ALg8bN7jg6lA0crn9cQ6ER4o0LOfnX7dPDbrIuoHER6YSZkLp3cq0muHiLXaLkoUasNDtx2NzjVdMQ==
X-Received: by 2002:a63:6604:: with SMTP id a4mr12443087pgc.118.1547708197652; 
 Wed, 16 Jan 2019 22:56:37 -0800 (PST)
Received: from localhost ([97.64.21.159])
 by smtp.gmail.com with ESMTPSA id n7sm1110489pff.36.2019.01.16.22.56.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 16 Jan 2019 22:56:36 -0800 (PST)
From: John Wang <wangzqbj@inspur.com>
To: andrew@aj.id.au,
	joel@jms.id.au
Cc: openbmc@lists.ozlabs.org,
	linux-aspeed@lists.ozlabs.org
Subject: [PATCH] ARM:dts:aspeed Add Inspur on5263m5 BMC
Date: Thu, 17 Jan 2019 14:56:31 +0800
Message-Id: <1547708191-8721-1-git-send-email-wangzqbj@inspur.com>
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
X-List-Received-Date: Thu, 17 Jan 2019 06:56:40 -0000

Add initial version of device tree file for on5263m5 ast2500bmc

Signed-off-by: John Wang <wangzqbj@inspur.com>
---
 arch/arm/boot/dts/aspeed-bmc-inspur-on5263m5.dts | 146 +++++++++++++++++++++++
 1 file changed, 146 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-inspur-on5263m5.dts

diff --git a/arch/arm/boot/dts/aspeed-bmc-inspur-on5263m5.dts b/arch/arm/boot/dts/aspeed-bmc-inspur-on5263m5.dts
new file mode 100644
index 0000000..064ae30
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-inspur-on5263m5.dts
@@ -0,0 +1,146 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2018 Inspur Corporation
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
+		vga_memory: framebuffer@9f000000 {
+			no-map;
+			reg = <0x9f000000 0x01000000>;
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
