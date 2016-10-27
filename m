Return-Path: <joel.stan@gmail.com>
Received: from mail-pf0-x244.google.com (mail-pf0-x244.google.com
 [IPv6:2607:f8b0:400e:c00::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t4GvS08gKzDvJS
 for <openbmc@lists.ozlabs.org>; Thu, 27 Oct 2016 17:19:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=0khY52Ev; 
 dkim-atps=neutral
Received: by mail-pf0-x244.google.com with SMTP id s8so1641741pfj.2
 for <openbmc@lists.ozlabs.org>; Wed, 26 Oct 2016 23:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=sender:from:to:subject:date:message-id;
 bh=KYw3mcLYrVJOkVKsV6Z0hNgErYD4JhMsyEQ3pzqBCXc=;
 b=0khY52Evm6/wjDa7GZ2XVoEcAYrrzdnKEtYzlF/70MZ4j8iUiMfGsQNnn1G5pgo7C4
 DNqrpOGzxk/LUfInzZhs9HrrhHq8wGjnhTVZAtkisU6VYhD0W4kpP05acp/msK+Mz39v
 +n85uROKZjvprX5fnKMWYhvJb/m8HCP8rgmvt6V5qCcWy8OJRjD3OUwZvvpD9tgEGD9k
 eKXLzVZNNSu+FvGJvuItbEqTNR2UQjl6/pj1g5mORaNc/O1CxdbnzlEOsJPV0U6dxqEa
 JWlETcCj/k7//fFyIWP000Qhci7hWSIVCh38BiiNRtcbA+dSx0u9U6LmcbnmvjV7/voe
 IfvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:sender:from:to:subject:date:message-id;
 bh=KYw3mcLYrVJOkVKsV6Z0hNgErYD4JhMsyEQ3pzqBCXc=;
 b=InLbkaiY70cKDG2+X9hseJisVpfLgJ7ZeMMaT4CvIR9y8mDJEIXuz19HJb53VWM+ER
 urbPC/uZ2w8hJZaEGWttGTuLJ7WAIEwM14vJdha+9n/owBQjgT3epMIlXEoBPUPBmrkt
 I78PNVO70XPLcOtN3zOfjWzHP7Er4x+Ee2GIvBF8fgb9AhqdI8UgiFHTBribC3ShwYpU
 q+a7kQJSiAlG25Z8YOf6x0e/FB2bUcGUndSoSs8ElRc7hbeQnWfSi2X+g2D4h4LFKKlN
 DLzNkUjB7FmkfXRGJyLqTbCx/vJYY1AiilqayJKRx65/GXUU/XS1TUxlBIDvZVauhAeJ
 0yeg==
X-Gm-Message-State: ABUngvdbce+zbn0osl0ADhX1f/6JNQ/yEjYXUCoYF9QfQW1FxI2x4oRuAiM0RRYAZ9K3qA==
X-Received: by 10.98.56.15 with SMTP id f15mr10863774pfa.106.1477549186089;
 Wed, 26 Oct 2016 23:19:46 -0700 (PDT)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id g78sm8425468pfe.19.2016.10.26.23.19.43
 for <openbmc@lists.ozlabs.org>
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Wed, 26 Oct 2016 23:19:45 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Thu, 27 Oct 2016 16:49:39 +1030
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [linux dev-4.7 PATCH] arm: dts: Add Romulus BMC machine
Date: Thu, 27 Oct 2016 16:49:35 +1030
Message-Id: <20161027061935.29217-1-joel@jms.id.au>
X-Mailer: git-send-email 2.9.3
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
X-List-Received-Date: Thu, 27 Oct 2016 06:19:48 -0000

Romulus is a dual socket OpenPower Power9 system produced by IBM with
an Aspeed ast2500 BMC.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/Makefile                   |   1 +
 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts | 156 +++++++++++++++++++++++++++
 2 files changed, 157 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index b9541c68afc8..ff647a08fe41 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -896,6 +896,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += aspeed-bmc-opp-palmetto.dtb \
 	aspeed-bmc-opp-garrison.dtb \
 	aspeed-bmc-opp-witherspoon.dtb \
 	aspeed-bmc-opp-zaius.dtb \
+	aspeed-bmc-opp-romulus.dtb \
 	aspeed-bmc-facebook-cmm.dtb \
 	aspeed-ast2500-evb.dtb
 endif
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
new file mode 100644
index 000000000000..e1be7b0c5484
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
@@ -0,0 +1,156 @@
+/dts-v1/;
+
+#include "aspeed-g5.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	model = "Romulus BMC";
+	compatible = "ibm,romulus-bmc", "aspeed,ast2500";
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
+};
+
+&fmc {
+	status = "okay";
+	flash@0 {
+		status = "okay";
+#include "aspeed-bmc-opp-flash-layout.dtsi"
+	};
+	flash@1 {
+		status = "okay";
+		label = "alt";
+	};
+};
+
+&spi1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi1debug_default>;
+
+	flash@0 {
+		status = "okay";
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
+	use-ncsi;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rmii1_default>;
+};
+
+&i2c0 {
+	status = "disabled";
+};
+
+&i2c1 {
+	status = "enabled";
+
+	/* CPU1 */
+};
+
+&i2c2 {
+	/* FSI Mux */
+
+	status = "okay";
+};
+
+&i2c3 {
+	status = "okay";
+
+	/* Clock chip */
+};
+
+&i2c4 {
+	status = "okay";
+
+	/* Voltage regulators:
+	 *  CPU0 VDD/VCS
+	 *  CPU0 VDN/VIO
+	 *  CPU0 VDDR A
+	 *  CPU0 VDDR B
+	 */
+};
+
+&i2c5 {
+	status = "okay";
+
+	/* Voltage regulators:
+	 *  CPU1 VDD/VCS
+	 *  CPU1 VDN/VIO
+	 *  CPU1 VDDR A
+	 *  CPU1 VDDR B
+	 */
+};
+
+&i2c6 {
+	/* PCIe slot 1 (x8) */
+	status = "enabled";
+};
+
+&i2c7 {
+	/* PCIe slot 2 (x16) */
+	status = "enabled";
+};
+
+&i2c8 {
+	/* PCIe slot 3 (x16) */
+	status = "enabled";
+};
+
+&i2c9 {
+	/* PCIe slot 4 (x16) */
+	status = "enabled";
+};
+
+&i2c10 {
+	/* PCIe slot 5 (x8) */
+	status = "enabled";
+};
+
+&i2c11 {
+	status = "okay";
+
+	rtc@32 {
+		compatible = "epson,rx8900";
+		reg = <0x32>;
+	};
+
+	/* TPM */
+};
+
+&i2c12 {
+	status = "okay";
+
+	/* CPLD */
+	/* Fan Controller 0xa4/a5 */
+	/* Power Supply */
+	/* Temp Sensor */
+	/* Temp Sensor */
+
+};
+
+&i2c13 {
+	status = "disabled";
+};
+
+&vuart {
+	status = "okay";
+};
-- 
2.9.3
