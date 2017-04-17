Return-Path: <maxims@google.com>
Received: from mail-pf0-x22d.google.com (mail-pf0-x22d.google.com
 [IPv6:2607:f8b0:400e:c00::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w6HfP6mSCzDqBH
 for <openbmc@lists.ozlabs.org>; Tue, 18 Apr 2017 05:01:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ZPTC4fM3"; 
 dkim-atps=neutral
Received: by mail-pf0-x22d.google.com with SMTP id s16so69553467pfs.0
 for <openbmc@lists.ozlabs.org>; Mon, 17 Apr 2017 12:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=2xLhKn9+ID8gIc6ZGGa8Ed9rv75hRcPfk1JrrZlj9NM=;
 b=ZPTC4fM3Go8GkQ8/x2AYY0vlUysYl3ts6VMAs7yb7eGH2v5YrihBqfM2rZ5l/3m9zF
 i+EGquASpZSw7WMdJCka3mUSv2h61R51+FCMTDy2koKO+hs8fFJYS65zOEk75MR/gyEF
 sT84NlHiZdEiShPN9Ngo19xFMjnqyaMI0n9WrZConUoqJQRhpsgOe4qRJUqEDjEgSMUo
 lNbf3bXUMogSg+uxh6efmFOsfujR6SnOAOlqzigNm1Hl3csrZeDOZRj+OANjsaBE9esb
 AOMEIMpbQe48mxEJeLf4v0zPIn/bYviQa5iwIOQS8GoCnLajbzpdksgtn3k5m+/1GtdZ
 O1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=2xLhKn9+ID8gIc6ZGGa8Ed9rv75hRcPfk1JrrZlj9NM=;
 b=tCZ0o9WZLEgT52nl9HM0ZvOnrFB8uwVAZUZMwro9JLhrnL5IEOVbfNCC+YfelBcJ1w
 2CU2EK8BMdfiC7Pkyl18byhVxchObGysZlx/7aIQjpO/l98EHV+00SkxgGDHxC/JCAIi
 HUHfhXn0FMEXHMMSO2RDPQ5pUcwgGs13TcL/5q3hqvq9zGp0ai2vCWGdH7ubNRkSlJwq
 MoAo2gRVrig3IaUL90MxOJY9OXZ8Q3APMJD8AvjA2oD4xnELQe1jfhjyivlDpD7gRQVA
 yjgbASCd5xfy0Hmew5Id+u5QEJhDycJZWy3Zy9z46axH8cGguIXgpum5zpTgH896J3TV
 ojGw==
X-Gm-Message-State: AN3rC/5VgXsGQaiCr959mBT/JyXZkeQsQbrtPvtj7CNqjUX9mGYgS2f4
 Bs/g7IcPf25RLD3ZgdbEow==
X-Received: by 10.98.101.3 with SMTP id z3mr13656298pfb.94.1492455659291;
 Mon, 17 Apr 2017 12:00:59 -0700 (PDT)
Received: from mxsl.svl.corp.google.com ([100.123.242.80])
 by smtp.gmail.com with ESMTPSA id p80sm19526121pfk.50.2017.04.17.12.00.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 17 Apr 2017 12:00:58 -0700 (PDT)
From: Maxim Sloyko <maxims@google.com>
To: u-boot@lists.denx.de,
	Simon Glass <sjg@chromium.org>
Cc: openbmc@lists.ozlabs.org, Maxim Sloyko <maxims@google.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>
Subject: [PATCH v1 06/15] aspeed: Device Tree configuration for Reset Driver
Date: Mon, 17 Apr 2017 12:00:25 -0700
Message-Id: <20170417190034.71945-7-maxims@google.com>
X-Mailer: git-send-email 2.12.2.762.g0e3151a226-goog
In-Reply-To: <20170417190034.71945-1-maxims@google.com>
References: <20170417190034.71945-1-maxims@google.com>
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
X-List-Received-Date: Mon, 17 Apr 2017 19:01:02 -0000

Add Reset Driver configuration to ast2500 SoC Device Tree and bindings
for various reset signals

Signed-off-by: Maxim Sloyko <maxims@google.com>
---

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
2.12.2.762.g0e3151a226-goog
