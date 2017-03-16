Return-Path: <maxims@google.com>
Received: from mail-pg0-x22b.google.com (mail-pg0-x22b.google.com
 [IPv6:2607:f8b0:400e:c05::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vkhcq6056zDqYd
 for <openbmc@lists.ozlabs.org>; Fri, 17 Mar 2017 08:36:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="vpAuyDdY"; 
 dkim-atps=neutral
Received: by mail-pg0-x22b.google.com with SMTP id b129so31022203pgc.2
 for <openbmc@lists.ozlabs.org>; Thu, 16 Mar 2017 14:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=9ti/LBqmxxT/3UUqgR+/dr15EX2qCl/l/Mo7UFrgbC8=;
 b=vpAuyDdYUyyhAAEnXoZMK2PiiViyIv4twLOQOijAF+4betaBVyXe20aPT3p4Ib0lbe
 nB+iTP0h65NX9xB2jafD6OBiaXd1RPZzTu3W4JhWjPNhqudq+Dz7mVzoEGCtoiD1aenJ
 O1pkP03LW7gD7NlYJjuIlqc1V9jfzGDziF0r3m4lEW7PZxBW9RP2Y0gVZwQvy/yFaNVR
 Q4O69zACM8IYImgFAujapL24BUY/AxmJvNk3RJcZcmPvwp1FoRgE1BLJrFUD8g/lNvrQ
 Z37PN6iImMFrqozjKAKytVpswjHOZtb2/9xCOt6T5RqB8sZfcDFj0/lFtXts7nAmMj7S
 T42Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=9ti/LBqmxxT/3UUqgR+/dr15EX2qCl/l/Mo7UFrgbC8=;
 b=NMAmCIqSnFL/rgzCFf/1XslFtSt7eN2T3y84g7fXC+Gdh8BugnxPnFNOndUay8gELg
 QWTiM26MC2fYMj9vhxH0MxFM1LdKaFB8LOlxf8M/Uhd2exzO+AADNhkqplBRBAxTu32q
 7ZCpg4ezReo50XHhp9wBZW5KvrXRwTHYp5XBIm8XrOmxnVJIgyMyWt4Gw5lDmwyxBLvA
 eKQovpsHiVavOBhd8uFC+sKsoyRNgEFDar9nktt08R6ysv8TTh8K/lNxJxS4wz1xpBHb
 GvRa0ATE7bWOKh2e3izJf2pQMXfq8rvCDulg2bZcuLUt+WPkAdWUx05CBYACTN9XwyMt
 qo9Q==
X-Gm-Message-State: AFeK/H1tZTM3TR5UKELTCHRnOChwxe8x/gG0WKfHhl4Wuhpf1xEjW8l35xUjgLJGVJDjXtlr
X-Received: by 10.98.153.198 with SMTP id t67mr12984254pfk.1.1489700201832;
 Thu, 16 Mar 2017 14:36:41 -0700 (PDT)
Received: from mxsl.svl.corp.google.com ([100.123.242.80])
 by smtp.gmail.com with ESMTPSA id v17sm2191375pgc.20.2017.03.16.14.36.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 16 Mar 2017 14:36:41 -0700 (PDT)
From: Maxim Sloyko <maxims@google.com>
To: u-boot@lists.denx.de,
	Simon Glass <sjg@chromium.org>
Cc: openbmc@lists.ozlabs.org, Maxim Sloyko <maxims@google.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>
Subject: [PATCH 06/17] aspeed: Device Tree configuration for Reset Driver
Date: Thu, 16 Mar 2017 14:36:13 -0700
Message-Id: <20170316213624.140344-7-maxims@google.com>
X-Mailer: git-send-email 2.12.0.367.g23dc2f6d3c-goog
In-Reply-To: <20170316213624.140344-1-maxims@google.com>
References: <20170316213624.140344-1-maxims@google.com>
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
X-List-Received-Date: Thu, 16 Mar 2017 21:36:44 -0000

Add Reset Driver configuration to ast2500 SoC Device Tree and bindings
for various reset signals

Signed-off-by: Maxim Sloyko <maxims@google.com>
---

 arch/arm/dts/ast2500-evb.dts              | 15 +++++++++++
 arch/arm/dts/ast2500-u-boot.dtsi          | 10 +++++++
 include/dt-bindings/reset/ast2500-reset.h | 45 +++++++++++++++++++++++++++++++
 3 files changed, 70 insertions(+)
 create mode 100644 include/dt-bindings/reset/ast2500-reset.h

diff --git a/arch/arm/dts/ast2500-evb.dts b/arch/arm/dts/ast2500-evb.dts
index dc13952fb8..723941ac0b 100644
--- a/arch/arm/dts/ast2500-evb.dts
+++ b/arch/arm/dts/ast2500-evb.dts
@@ -21,3 +21,18 @@
 &sdrammc {
 	clock-frequency = <400000000>;
 };
+
+&wdt1 {
+	u-boot,dm-pre-reloc;
+	status = "okay";
+};
+
+&wdt2 {
+	u-boot,dm-pre-reloc;
+	status = "okay";
+};
+
+&wdt3 {
+	u-boot,dm-pre-reloc;
+	status = "okay";
+};
diff --git a/arch/arm/dts/ast2500-u-boot.dtsi b/arch/arm/dts/ast2500-u-boot.dtsi
index c95a7ba835..faeeec1be4 100644
--- a/arch/arm/dts/ast2500-u-boot.dtsi
+++ b/arch/arm/dts/ast2500-u-boot.dtsi
@@ -1,4 +1,5 @@
 #include <dt-bindings/clock/ast2500-scu.h>
+#include <dt-bindings/reset/ast2500-reset.h>
 
 #include "ast2500.dtsi"
 
@@ -11,12 +12,21 @@
 		#reset-cells = <1>;
 	};
 
+	rst: reset-controller {
+		u-boot,dm-pre-reloc;
+		compatible = "aspeed,ast2500-reset";
+		aspeed,wdt = <&wdt1>;
+		#reset-cells = <1>;
+	};
+
 	sdrammc: sdrammc@1e6e0000 {
 		u-boot,dm-pre-reloc;
 		compatible = "aspeed,ast2500-sdrammc";
 		reg = <0x1e6e0000 0x174
 			0x1e6e0200 0x1d4 >;
+		#reset-cells = <1>;
 		clocks = <&scu PLL_MPLL>;
+		resets = <&rst AST_RESET_SDRAM>;
 	};
 
 	ahb {
diff --git a/include/dt-bindings/reset/ast2500-reset.h b/include/dt-bindings/reset/ast2500-reset.h
new file mode 100644
index 0000000000..eb5e1db97b
--- /dev/null
+++ b/include/dt-bindings/reset/ast2500-reset.h
@@ -0,0 +1,45 @@
+/*
+ * Copyright 2017 Google, Inc
+ *
+ * SPDX-License-Identifier: GPL-2.0+
+ */
+
+#ifndef _ABI_MACH_ASPEED_AST2500_RESET_H_
+#define _ABI_MACH_ASPEED_AST2500_RESET_H_
+
+/*
+ * The values are intentionally layed out as flags in
+ * WDT reset parameter.
+ */
+
+#define AST_RESET_SOC			0
+#define AST_RESET_CHIP			1
+#define AST_RESET_CPU			(1 << 1)
+#define AST_RESET_ARM			(1 << 2)
+#define AST_RESET_COPROC		(1 << 3)
+#define AST_RESET_SDRAM			(1 << 4)
+#define AST_RESET_AHB			(1 << 5)
+#define AST_RESET_I2C			(1 << 6)
+#define AST_RESET_MAC1			(1 << 7)
+#define AST_RESET_MAC2			(1 << 8)
+#define AST_RESET_GCRT			(1 << 9)
+#define AST_RESET_USB20			(1 << 10)
+#define AST_RESET_USB11_HOST		(1 << 11)
+#define AST_RESET_USB11_HID		(1 << 12)
+#define AST_RESET_VIDEO			(1 << 13)
+#define AST_RESET_HAC			(1 << 14)
+#define AST_RESET_LPC			(1 << 15)
+#define AST_RESET_SDIO			(1 << 16)
+#define AST_RESET_MIC			(1 << 17)
+#define AST_RESET_CRT2D			(1 << 18)
+#define AST_RESET_PWM			(1 << 19)
+#define AST_RESET_PECI			(1 << 20)
+#define AST_RESET_JTAG			(1 << 21)
+#define AST_RESET_ADC			(1 << 22)
+#define AST_RESET_GPIO			(1 << 23)
+#define AST_RESET_MCTP			(1 << 24)
+#define AST_RESET_XDMA			(1 << 25)
+#define AST_RESET_SPI			(1 << 26)
+#define AST_RESET_MISC			(1 << 27)
+
+#endif  /* _ABI_MACH_ASPEED_AST2500_RESET_H_ */
-- 
2.12.0.367.g23dc2f6d3c-goog
