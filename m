Return-Path: <joel.stan@gmail.com>
Received: from mail-pf0-x243.google.com (mail-pf0-x243.google.com
 [IPv6:2607:f8b0:400e:c00::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vtFgc5WdpzDqGp
 for <openbmc@lists.ozlabs.org>; Wed, 29 Mar 2017 15:50:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="HlGtug4g"; 
 dkim-atps=neutral
Received: by mail-pf0-x243.google.com with SMTP id n11so459367pfg.2
 for <openbmc@lists.ozlabs.org>; Tue, 28 Mar 2017 21:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=ygJv+nNLrnNmq1Sio09DIwJuCl+/8yryOpZFijcGtfk=;
 b=HlGtug4grQzhw++nSSB0lwzJvG3Ot05OUCBxAkdYVSashxcDB4VGTYRiVupFSZQd8z
 tPQZzSXrepEZt7NXRZNZFCfxrCLnKvokaka7qSjXzk92diVDokXu7XH76AAlP+xSIXbw
 WXvnMnnjEc/T8NTGOXzqObQozYx3mQbvP7+iIWASHZ4Npsv2jRbB3SNDtL+6xgQzg1Xh
 kiBtQ+03XsVZw4v0mp1kLAsN3WAVSQl6usRHDslXs+pV0TucuHnESvfkSrsb9sqiBph0
 ULmHRKoQKSHQO47maXFOK7Tt381cG2lE68aXHrBXADDhk8wA9y05YNXolXRxQatswuom
 zUiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=ygJv+nNLrnNmq1Sio09DIwJuCl+/8yryOpZFijcGtfk=;
 b=bDw+9loElkbjwPv9BMjC6jMwhoMNX1UgYCdM2EX4hiC4gx+KjMMHkP/X6a3ac5tJMS
 iwzkP7aM8mx5FIqV+TxkVX3Oa5soNL5ecpL2bzd2jATDtKOc/FuLfvZToDL+txIgVPH/
 61qo+tVzYulQGkQjSQ/WK+6b93UEf0yFuJEqYUIv+P7MOa4OKpWpTFTHFFyO1ISr2IYJ
 dckiR39Jw1I0jKZhbxUD4Z7Ul6dlVGh9rK6wzXUyeGwRKwgAMkAagnKF2zG82D+H60HO
 lD+T035ozbnRSd0K+/1rWi8YqVH5UTH/rx6KNQWGdJ7KBmXkRcsgJGiKrPfbt7yL8mn/
 +LiA==
X-Gm-Message-State: AFeK/H141hdU3y3JxDcB+vrp27okRbcjoa1kemsAdPzOYaLX/CJWrXXKxB0RJTA/4CFoIQ==
X-Received: by 10.99.177.4 with SMTP id r4mr17275336pgf.16.1490763018459;
 Tue, 28 Mar 2017 21:50:18 -0700 (PDT)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id d10sm10280853pfl.59.2017.03.28.21.50.13
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Tue, 28 Mar 2017 21:50:17 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Wed, 29 Mar 2017 15:20:08 +1030
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Cc: Ken Chen <chen.kenyy@inventec.com>, Lei YU <mine260309@gmail.com>,
 Joel Stanley <joel@jms.id.au>
Subject: [PATCH linux dev-4.7] ARM: dts: aspeed: Add Langyang BMC device tree
Date: Wed, 29 Mar 2017 15:19:53 +1030
Message-Id: <20170329044953.25308-1-joel@jms.id.au>
X-Mailer: git-send-email 2.11.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Mar 2017 04:50:21 -0000

From: Ken Chen <chen.kenyy@inventec.com>

Langyang is an OpenPower Power9 system made by Inventec.

Signed-off-by: Ken Chen <chen.kenyy@inventec.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/Makefile                   |   1 +
 arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts | 319 +++++++++++++++++++++++++++
 2 files changed, 320 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index ff647a08fe41..ba0e018e3275 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -897,6 +897,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += aspeed-bmc-opp-palmetto.dtb \
 	aspeed-bmc-opp-witherspoon.dtb \
 	aspeed-bmc-opp-zaius.dtb \
 	aspeed-bmc-opp-romulus.dtb \
+	aspeed-bmc-opp-lanyang.dtb \
 	aspeed-bmc-facebook-cmm.dtb \
 	aspeed-ast2500-evb.dtb
 endif
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts b/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts
new file mode 100644
index 000000000000..176e4b449339
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts
@@ -0,0 +1,319 @@
+/dts-v1/;
+
+#include "aspeed-g5.dtsi"
+#include <dt-bindings/gpio/aspeed-gpio.h>
+
+/ {
+	model = "Lanyang BMC";
+	compatible = "inventec,lanyang-bmc", "aspeed,ast2500";
+
+	aliases {
+		serial4 = &uart5;
+	};
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
+		flash_memory: region@94000000 {
+			no-map;
+			reg = <0x94000000 0x04000000>; /* 64M */
+		};
+	};
+
+	onewire0 {
+		compatible = "w1-gpio";
+		gpios = <&gpio ASPEED_GPIO(D, 1) GPIO_ACTIVE_HIGH>;
+	};
+
+	onewire1 {
+		compatible = "w1-gpio";
+		gpios = <&gpio ASPEED_GPIO(D, 2) GPIO_ACTIVE_HIGH>;
+	};
+
+	onewire2 {
+		compatible = "w1-gpio";
+		gpios = <&gpio ASPEED_GPIO(D, 3) GPIO_ACTIVE_HIGH>;
+	};
+
+	onewire3 {
+		compatible = "w1-gpio";
+		gpios = <&gpio ASPEED_GPIO(D, 4) GPIO_ACTIVE_HIGH>;
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
+	fsi-master {
+		compatible = "ibm,fsi-master", "ibm,fsi-master-gpio";
+
+		status = "okay";
+
+		clock-gpios = <&gpio ASPEED_GPIO(J, 0) GPIO_ACTIVE_HIGH>;
+		data-gpios = <&gpio ASPEED_GPIO(J, 1) GPIO_ACTIVE_HIGH>;
+		trans-gpios = <&gpio ASPEED_GPIO(D, 5) GPIO_ACTIVE_HIGH>;
+		enable-gpios = <&gpio ASPEED_GPIO(D, 0) GPIO_ACTIVE_HIGH>;
+		mux-gpios = <&gpio ASPEED_GPIO(H, 2) GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&fmc {
+	status = "okay";
+	flash@0 {
+		status = "okay";
+#include "aspeed-bmc-opp-flash-layout.dtsi"
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
+	rtc@68 {
+		compatible = "dallas,ds3231";
+		reg = <0x68>;
+	};
+
+	/* RTC DS3231 @68h	 */
+};
+
+&i2c1 {
+	status = "disable";
+
+	/* APSS
+	 * BCM5719
+	 */
+};
+
+&i2c2 {
+	status = "okay";
+
+	/* AT24C64 @55h */
+	eeprom@55 {
+		compatible = "atmel,24c64";
+		reg = <0x55>;
+		pagesize = <32>;
+	};
+
+	/*
+	 * PCA9546 @75h
+	 *		bus0	48V MON LM5058 @41h
+	 *				48V H-SWAP LM5058 @40h
+	 *		bus1	P0 0V8 MON LM5058 @40h
+	 *				P1 0V8 MON LM5058 @41h
+	 *		bus2	P0 0V7 MON LM5058 @40h
+	 *				P1 0V7 MON LM5058 @41h
+	 *		bus3	P0 VDDQ0 MON LM5058 @40h
+	 *				P0 VDDQ1 MON LM5058 @41h
+	 *				P1 VDDQ0 MON LM5058 @42h
+	 *				P1 VDDQ1 MON LM5058 @43h
+	 */
+	i2c-switch@75 {
+		compatible = "nxp,pca9546";
+		reg = <0x75>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+
+	/* Power sequencer UCD90160 PMBUS @64h */
+	ucd90160@64 {
+		compatible = "ti,ucd90160";
+		reg = <0x6B>;
+	};
+};
+
+&i2c4 {
+	status = "disabled";
+
+	/* P0 FSP connecter */
+};
+
+&i2c5 {
+	status = "okay";
+
+	/* CPU0 0V96 IR38063 @41h */
+	/* CPU1 0V96 IR38063 @42h */
+	/* CPU0 1V0 IR38063 @40h */
+	/* CPU1 1V0 IR38063 @43h */
+};
+
+&i2c6 {
+	status = "disabled";
+
+	/* P1 FSP connecter */
+};
+
+&i2c7 {
+	status = "okay";
+
+	/* CLK BUFF 9DBL0452 @6Dh */
+	/* CLK GEN 9FGS9092 @6Bh */
+};
+
+&i2c8 {
+	status = "okay";
+
+};
+
+&i2c9 {
+	status = "okay";
+
+	/* T-SENSOR TMP75 @48h */
+	tmp75@48 {
+		compatible = "ti,tmp75";
+		reg = <0x48>;
+	};
+
+	/* T-SENSOR TMP75 @49h */
+	tmp75@49 {
+		compatible = "ti,tmp75";
+		reg = <0x49>;
+	};
+
+	/* T-SENSOR TMP75 @4Ah */
+	tmp75@4A {
+		compatible = "ti,tmp75";
+		reg = <0x4A>;
+	};
+
+	/* 12V Brick Q54SJ12050 @96h(TBD) */
+};
+
+&i2c10 {
+	status = "disabled";
+};
+
+&i2c11 {
+	status = "disabled";
+
+	/* TPM connector @57h */
+};
+
+&i2c12 {
+	status = "disabled";
+};
+
+&i2c13 {
+	status = "disabled";
+};
+
+&gpio {
+	line_apss_reset {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(E, 4) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "BMC_APSS_RESET_N";
+	};
+};
+
+&vuart {
+	status = "okay";
+};
+
+&pinctrl {
+	aspeed,external-nodes = <&gfx &lhc>;
+};
-- 
2.11.0
