Return-Path: <Yang.BrianC.W@inventec.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=inventec.com
 (client-ip=218.32.67.167; helo=mail.inventec.com;
 envelope-from=yang.brianc.w@inventec.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=inventec.com
X-Greylist: delayed 326 seconds by postgrey-1.36 at bilbo;
 Tue, 10 Apr 2018 17:55:55 AEST
Received: from mail.inventec.com (hub02.inventec.com [218.32.67.167])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40Kzxl2FvczDqvM
 for <openbmc@lists.ozlabs.org>; Tue, 10 Apr 2018 17:55:55 +1000 (AEST)
Received: from IEC1-MSE-FE1.inventec.com (10.1.254.203) by
 IEC1-EX2010-04.iec.inventec (10.1.254.157) with Microsoft SMTP Server id
 14.3.361.1; Tue, 10 Apr 2018 15:50:16 +0800
Received: from IEC1-SPAM-2.inventec.com (smg2.inventec.com [10.1.254.202])	by
 IEC1-MSE-FE1.inventec.com with ESMTP id w3A7oCvT022327	for
 <openbmc@lists.ozlabs.org>; Tue, 10 Apr 2018 15:50:12 +0800 (GMT-8)
 (envelope-from yang.brianc.w@inventec.com)
Received: from mail-pl0-f71.google.com (mail-pl0-f71.google.com
 [209.85.160.71])	by IEC1-SPAM-2.inventec.com with ESMTP id w3A7oBtA004863
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)	for
 <openbmc@lists.ozlabs.org>; Tue, 10 Apr 2018 15:50:12 +0800 (GMT-8)
 (envelope-from yang.brianc.w@inventec.com)
Received: by mail-pl0-f71.google.com with SMTP id 91-v6so8917355plf.6
 for <openbmc@lists.ozlabs.org>; Tue, 10 Apr 2018 00:50:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=NyBbth5O/r0gY0eLBuVpjP9z7CuI6/Xk7wXRdUC8wj4=;
 b=cawz1EcvSLWX2UBqs5CN7OvgyC3QLcQLdpEZBI/Lnstx425SdEeSrYauyGggVse7h6
 JUyRqfqUNqRZKxZFnxYQCAx0ZWTwoZ3YNZqYoQ9i5HTfg5YvOh2yjwJgWM//0d4lLrNM
 mtprQxv5tTFhYM+z+VsCAyn0ZWoQcWMVmCl9B1XlfLAnhpuCrHTh2O+FyLaYtPtTtrD6
 x7/HRhZnoPAXXcazwsBlQikL73QPm5BOehQQcNYfcc4r5vO1z+E3qUTFucmDeltOyT2/
 vx2FxPk5y7sIK0YATM41aNmYYkSeQpWkud6TCLkrRKzFJesxIy8LPyEkkq2Bu6aEvD5O
 Sxqg==
X-Gm-Message-State: ALQs6tBRbZGgYlsknRkVd8tHfv588EGwq058aS5A+wNyNrsC3NUY1X2J
 eUksZAe6t3/E5lvSDuosHNL2b4of9AqSnnBQLYoNL39UnjZXfhQJpadp1sWHi0ZCNFCMTATxQjJ
 b1S4dRfY7Sv+oiSKS5SFwaQ==
X-Received: by 10.99.127.3 with SMTP id a3mr13973165pgd.267.1523346609705;
 Tue, 10 Apr 2018 00:50:09 -0700 (PDT)
X-Google-Smtp-Source: AIpwx48vMHNV25PJGk9Z9Hfc2Axmladp92Z+diW3nrVvP6ddy3zwpQx3uUiVaHzZkD92yeHlnLsb0A==
X-Received: by 10.99.127.3 with SMTP id a3mr13973148pgd.267.1523346609176;
 Tue, 10 Apr 2018 00:50:09 -0700 (PDT)
Received: from localhost (60-248-18-139.HINET-IP.hinet.net. [60.248.18.139])
 by smtp.gmail.com with ESMTPSA id
 q15sm4496813pfi.140.2018.04.10.00.50.07        (version=TLS1_2
 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);        Tue, 10 Apr 2018
 00:50:07 -0700 (PDT)
From: Brian Yang <yang.brianc.w@inventec.com>
To: <openbmc@lists.ozlabs.org>
CC: Brian Yang <yang.brianc.w@inventec.com>, <joel@jms.id.au>
Subject: [PATCH linux dev-4.13] ARM: dts: aspeed: Add Inventec Lanyang BMC
Date: Tue, 10 Apr 2018 03:47:11 -0400
Message-ID: <1523346431-404008-1-git-send-email-yang.brianc.w@inventec.com>
X-Mailer: git-send-email 2.7.4
X-DNSRBL: 
X-MAIL: IEC1-MSE-FE1.inventec.com w3A7oCvT022327
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Apr 2018 07:55:56 -0000

The Inventec Lanyang is Power 9 platform with ast2500 BMC.

Signed-off-by: Brian Yang <yang.brianc.w@inventec.com>
---
 arch/arm/boot/dts/Makefile                   |   1 +
 arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts | 331 +++++++++++++++++++++++++++
 2 files changed, 332 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 5cfee25..d1882f0 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1057,6 +1057,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-ast2500-evb.dtb \
 	aspeed-bmc-arm-centriq2400-rep.dtb \
 	aspeed-bmc-intel-s2600wf.dtb \
+	aspeed-bmc-opp-lanyang.dtb \
 	aspeed-bmc-opp-palmetto.dtb \
 	aspeed-bmc-opp-romulus.dtb \
 	aspeed-bmc-opp-witherspoon.dtb \
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts b/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts
new file mode 100644
index 0000000..6241730
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts
@@ -0,0 +1,331 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright (c) 2018 Inventec Corporation
+/dts-v1/;
+
+#include "aspeed-g5.dtsi"
+#include <dt-bindings/gpio/aspeed-gpio.h>
+
+/ {
+	model = "Lanyang BMC";
+	compatible = "inventec,lanyang-bmc", "aspeed,ast2500";
+
+	chosen {
+		stdout-path = &uart5;
+		bootargs = "console=ttyS4,115200 earlyprintk";
+	};
+
+	memory {
+		reg = <0x80000000 0x40000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		flash_memory: region@98000000 {
+			no-map;
+			reg = <0x98000000 0x04000000>; /* 64M */
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		sys_boot_status {
+			label = "System_boot_status";
+			gpios = <&gpio ASPEED_GPIO(B, 6) GPIO_ACTIVE_LOW>;
+		};
+
+		attention {
+			label = "Attention_locator";
+			gpios = <&gpio ASPEED_GPIO(B, 7) GPIO_ACTIVE_HIGH>;
+		};
+
+		plt_fault {
+			label = "Platform_fault";
+			gpios = <&gpio ASPEED_GPIO(B, 1) GPIO_ACTIVE_HIGH>;
+		};
+
+		hdd_fault {
+			label = "Onboard_drive_fault";
+			gpios = <&gpio ASPEED_GPIO(B, 3) GPIO_ACTIVE_HIGH>;
+		};
+		bmc_err {
+			lable = "BMC_fault";
+			gpios = <&gpio ASPEED_GPIO(H, 6) GPIO_ACTIVE_HIGH>;
+		};
+
+		sys_err {
+			lable = "Sys_fault";
+			gpios = <&gpio ASPEED_GPIO(H, 7) GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	fsi: gpio-fsi {
+		compatible = "fsi-master-gpio", "fsi-master";
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		clock-gpios = <&gpio ASPEED_GPIO(J, 0) GPIO_ACTIVE_HIGH>;
+		data-gpios = <&gpio ASPEED_GPIO(J, 1) GPIO_ACTIVE_HIGH>;
+		trans-gpios = <&gpio ASPEED_GPIO(D, 5) GPIO_ACTIVE_HIGH>;
+		enable-gpios = <&gpio ASPEED_GPIO(D, 0) GPIO_ACTIVE_HIGH>;
+		mux-gpios = <&gpio ASPEED_GPIO(H, 2) GPIO_ACTIVE_HIGH>;
+	};
+
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
+			<&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>,
+			<&adc 8>, <&adc 9>, <&adc 10>, <&adc 11>,
+			<&adc 13>, <&adc 14>, <&adc 15>;
+	};
+
+	iio-hwmon-battery {
+		compatible = "iio-hwmon";
+		io-channels = <&adc 12>;
+	};
+};
+
+#include "ibm-power9-cfam.dtsi"
+
+&pwm_tacho {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default
+		&pinctrl_pwm2_default &pinctrl_pwm3_default>;
+
+	fan@0 {
+		reg = <0x00>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x00>;
+	};
+
+	fan@1 {
+		reg = <0x01>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x01>;
+	};
+
+	fan@2 {
+		reg = <0x02>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x02>;
+	};
+
+	fan@3 {
+		reg = <0x03>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x03>;
+	};
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
+		label = "pnor";
+		m25p,fast-read;
+	};
+};
+
+&spi2 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi2ck_default
+		     &pinctrl_spi2cs0_default
+		     &pinctrl_spi2cs1_default
+		     &pinctrl_spi2miso_default
+		     &pinctrl_spi2mosi_default>;
+
+	flash@0 {
+		status = "okay";
+	};
+};
+
+&uart1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_txd1_default
+		     &pinctrl_rxd1_default>;
+};
+
+&lpc_ctrl {
+	status = "okay";
+	memory-region = <&flash_memory>;
+	flash = <&spi1>;
+};
+
+&lpc_snoop {
+	status = "okay";
+	snoop-ports = <0x80>;
+};
+
+&mbox {
+	status = "okay";
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
+&i2c0 {
+	status = "okay";
+
+	eeprom@55 {
+		compatible = "atmel,24c64";
+		reg = <0x55>;
+		pagesize = <32>;
+	};
+
+	rtc@68 {
+		compatible = "nxp,pcf8523";
+		reg = <0x68>;
+	};
+
+	tmp75@48 {
+		compatible = "ti,tmp75";
+		reg = <0x48>;
+	};
+};
+
+&i2c1 {
+	status = "okay";
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
+&vuart {
+	status = "okay";
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
+&gpio {
+	pin_gpio_b0 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(B, 0) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "BMC_HDD1_PWR_EN";
+	};
+
+	pin_gpio_b5 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(B, 5) GPIO_ACTIVE_HIGH>;
+		input;
+		line-name = "BMC_USB1_OCI2";
+	};
+
+	pin_gpio_h5 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(H, 5) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "BMC_CP0_PERST_ENABLE_R";
+	};
+
+	pin_gpio_z2 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(Z, 2) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "RST_PCA9546_U177_N";
+	};
+
+	pin_gpio_aa6 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(AA, 6) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "BMC_CP0_RESET_N";
+	};
+
+	pin_gpio_aa7 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(AA, 7) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "BMC_TPM_RESET_N";
+	};
+
+	pin_gpio_ab0 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(AB, 0) GPIO_ACTIVE_LOW>;
+		output-high;
+		line-name = "BMC_USB_PWRON_N";
+	};
+};
+
+&ibt {
+	status = "okay";
+};
+
+&adc {
+	status = "okay";
+};
+
-- 
2.7.4
