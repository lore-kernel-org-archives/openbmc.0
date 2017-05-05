Return-Path: <maxims@google.com>
Received: from mail-pg0-x229.google.com (mail-pg0-x229.google.com
 [IPv6:2607:f8b0:400e:c05::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wKQpZ3p3QzDqCd
 for <openbmc@lists.ozlabs.org>; Sat,  6 May 2017 08:01:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="nFKnp90G"; 
 dkim-atps=neutral
Received: by mail-pg0-x229.google.com with SMTP id o3so8833340pgn.2
 for <openbmc@lists.ozlabs.org>; Fri, 05 May 2017 15:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=XAjhbmmbOaQQLhhg+6NmC/3FcQ3VcD3jVkiBfMxQFgk=;
 b=nFKnp90GJ4IvrTbsLU/Os34Pj3N0MPeIYgsVz+lrq6kb25/iF/dgxX8v82JTNYIC6v
 EkHBbyKhzhsskjKxeUWDMWUn9ybT9H1IxJW+UXq+nQ49p7WgT33p3wEPsVEM7l94X1oC
 f6+YQgq5DnQTx0TQtbYyMC6i4+0lPsO6g1XYrZcHXDCef0ZihGP4IjHoh0ROrDSw/80N
 DhhnACPpWSnKgwexEP4tFgHCHPCD6AWWbPa8D2FFxqFQP0bMIv2KU+EjEW5Be841Lfmi
 mCAvDi0x0AvQCvV+Jg5ZgVnM2UgamygDiH/67sHtFFk/TgmlKbiqRJ4zNC8faMvRSdDa
 jXXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=XAjhbmmbOaQQLhhg+6NmC/3FcQ3VcD3jVkiBfMxQFgk=;
 b=r5RUZ0Ml+5LOyL6PIJ6KuekfOGsM+DK6S31ljFkpFpITk07PP8La1kkxZMDajvus6H
 e/QNFST1t4N/qYdwV94tS0P/xBoI9FBnM+JwfdAAC29XFGNmwAT/Tm5xgQzJt7/VPvag
 AiGIae5K6yQmsQCov0+EFbNbR74PL+YZ7LdTYj6shqvzBBmZ1FnO9IiiQw5LB+/Kzf11
 mN92GFBjeP8EUegKVwtdN2wiBXTLi/zLzA4iiEac1/4yEmN+exHUXhykKd0XfONCGGdS
 VKYDnCVHZWJUx15BRg10wuCdLp1KsX1PAQ1lVosIHlW7pLsV+DOJH553mppcqchbH1cX
 1cqQ==
X-Gm-Message-State: AN3rC/6Hr8tBEQ+78h5tSC+lPJMNTk5OdaVbkphJe58bERCCXjxnopd6
 ygP9t6l4vtEL1xh9
X-Received: by 10.98.32.220 with SMTP id m89mr16085883pfj.153.1494021700714;
 Fri, 05 May 2017 15:01:40 -0700 (PDT)
Received: from mxsl.svl.corp.google.com ([100.123.242.80])
 by smtp.gmail.com with ESMTPSA id r131sm7768501pgr.67.2017.05.05.15.01.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 05 May 2017 15:01:40 -0700 (PDT)
From: Maxim Sloyko <maxims@google.com>
To: u-boot@lists.denx.de,
	Simon Glass <sjg@chromium.org>
Cc: openbmc@lists.ozlabs.org, Maxim Sloyko <maxims@google.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>
Subject: [PATCH v2 06/15] aspeed: Device Tree configuration for Reset Driver
Date: Fri,  5 May 2017 15:01:06 -0700
Message-Id: <20170505220115.143025-7-maxims@google.com>
X-Mailer: git-send-email 2.13.0.rc1.294.g07d810a77f-goog
In-Reply-To: <20170505220115.143025-1-maxims@google.com>
References: <20170417190034.71945-1-maxims@google.com>
 <20170505220115.143025-1-maxims@google.com>
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
X-List-Received-Date: Fri, 05 May 2017 22:01:43 -0000

Add Reset Driver configuration to ast2500 SoC Device Tree and bindings
for various reset signals

Signed-off-by: Maxim Sloyko <maxims@google.com>
Reviewed-by: Simon Glass <sjg@chromium.org>
---

Changes in v2: None
Changes in v1: None

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
2.13.0.rc1.294.g07d810a77f-goog
