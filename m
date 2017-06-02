Return-Path: <roblip@gmail.com>
Received: from mail-pf0-x243.google.com (mail-pf0-x243.google.com
 [IPv6:2607:f8b0:400e:c00::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wfZTl1L3xzDqKX
 for <openbmc@lists.ozlabs.org>; Sat,  3 Jun 2017 05:46:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="a4clBQ2x"; 
 dkim-atps=neutral
Received: by mail-pf0-x243.google.com with SMTP id u26so13563281pfd.2
 for <openbmc@lists.ozlabs.org>; Fri, 02 Jun 2017 12:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=cx1bLVws58XRFI5Zh+JZUbMKgZXmIrsICC6Mb7/WxN0=;
 b=a4clBQ2xgiKfT9O5zbFi2FjtbmQAgOcG4ijTaWVcpqSsE9723OIDuenXA1L3OsgfXW
 5DCHowXw1t0tbOKshIcYyGJIITJAu/X1Sc6XPWkyQ4Mn5NOqZqaTtoMcqENo4+Jarx/B
 hGIuO6tPHakTC1BYuRBGfc/J1FNF8dCSzIzqkJqAoMw3WUv2cXFkEjsuV+RjXPIFcYwd
 y9yabJLgk9WnrReuMk/RvvJqAo7V8YVJIrpk6l9a6T0DG/g2twb/WJwo9EODaqx3QoLy
 q/gw+KS9WA4LwD0SbWTF6iothHOOOsGVw4IvLC7QrTMlJC2NLEPL/YiXN3yveLRDyOVo
 4/lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=cx1bLVws58XRFI5Zh+JZUbMKgZXmIrsICC6Mb7/WxN0=;
 b=QRjSb0ea/gyQQNhgjCzJaXfpdX41wd6CnKrmvk0c8DYT2ixq7w9+MgCe8V626q5iF+
 g+eiJ9uLzygYm9FEhZOKPutHoOxh+wliQX78cZ2wYdp8fXKIMzX8i1Mh9dYlrXOGdghs
 Fdl0hPa2emIBYwIR53dOhGL28EkLa7EqQ9UPUKROQvUPu17r2OC2wAn5E2tmMBshhnF3
 Z4E62jgG5mRSmDy+QzXKHHnE1IL3FdfDXEr7wZdoTHEFHU8H5niTy/E+R+gwpALaw62g
 shAxn80Eqn8s8SW0wsAGuXMex0GIeJ7ajsZlSVWzcA/7+GCBp3TQ0liaAAUq88+zUMzB
 YSjA==
X-Gm-Message-State: AODbwcDwpCRAjXeQMXDGGCjJasZpW/Z/70L8/nxjWjNgHcnWaRr1WbMd
 W75CnatPSDQUJlrQL/wU8A==
X-Received: by 10.84.232.8 with SMTP id h8mr1437817plk.278.1496432793049;
 Fri, 02 Jun 2017 12:46:33 -0700 (PDT)
Received: from rlippert.svl.corp.google.com ([100.123.242.116])
 by smtp.gmail.com with ESMTPSA id g13sm4871840pgu.54.2017.06.02.12.46.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 02 Jun 2017 12:46:31 -0700 (PDT)
From: Robert Lippert <roblip@gmail.com>
X-Google-Original-From: Robert Lippert <rlippert@google.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-4.10] ARM: aspeed: zaius: Support new board FSI gpio
 pin mapping
Date: Fri,  2 Jun 2017 12:46:12 -0700
Message-Id: <20170602194612.11866-1-rlippert@google.com>
X-Mailer: git-send-email 2.13.0.506.g27d5fe0cd-goog
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
X-List-Received-Date: Fri, 02 Jun 2017 19:46:35 -0000

FSI routing was broken on EVT boards and all boards were reworked
to use the nearest available GPIO pins.  Future boards have
fixed the issue so need to use the original planned GPIOG ports.

Signed-off-by: Robert Lippert <rlippert@google.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts |  8 ++++++--
 arch/arm/mach-aspeed/aspeed.c              | 30 ++++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
index b5c4c0fb2986..68baf3288263 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
@@ -80,8 +80,12 @@
 
 		status = "okay";
 
-		clock-gpios = <&gpio ASPEED_GPIO(C, 3) GPIO_ACTIVE_HIGH>;
-		data-gpios = <&gpio ASPEED_GPIO(C, 2) GPIO_ACTIVE_HIGH>;
+		/*
+		 * These 2 GPIOs are set per board revision in aspeed.c.
+		 * These are the DVT and beyond values:
+		 * clock-gpios = <&gpio ASPEED_GPIO(G, 0) GPIO_ACTIVE_HIGH>;
+		 * data-gpios = <&gpio ASPEED_GPIO(G, 1) GPIO_ACTIVE_HIGH>;
+		 */
 		trans-gpios = <&gpio ASPEED_GPIO(O, 6) GPIO_ACTIVE_HIGH>;
 		enable-gpios = <&gpio ASPEED_GPIO(D, 0) GPIO_ACTIVE_HIGH>;
 		mux-gpios = <&gpio ASPEED_GPIO(P, 6) GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index 5c88286c96fd..1e080d8909f4 100644
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -8,6 +8,8 @@
  */
 
 #include <linux/init.h>
+#include <linux/gpio/machine.h>
+#include <dt-bindings/gpio/aspeed-gpio.h>
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
 #include <linux/io.h>
@@ -141,6 +143,34 @@ static void __init do_zaius_setup(void)
 	/* Read BOARD_REV[4:0] fuses from GPIOM[7:3] */
 	reg = readl(AST_IO(AST_BASE_GPIO | 0x78));
 	board_rev = (reg >> 3) & 0x1F;
+	printk(KERN_INFO "Zaius platform board revision: 0x%02x\n", board_rev);
+
+	/* EVT boards have different FSI pin mappings */
+	if (board_rev < 0x08) {
+		static struct gpiod_lookup_table fsi_evt_gpio_lookup = {
+			.dev_id = "fsi-master",
+			.table = {
+				GPIO_LOOKUP("1e780000.gpio", ASPEED_GPIO(C, 3),
+					    "clock", GPIO_ACTIVE_HIGH),
+				GPIO_LOOKUP("1e780000.gpio", ASPEED_GPIO(C, 2),
+					    "data", GPIO_ACTIVE_HIGH),
+				{ },
+			},
+		};
+		gpiod_add_lookup_table(&fsi_evt_gpio_lookup);
+	} else {
+		static struct gpiod_lookup_table fsi_gpio_lookup = {
+			.dev_id = "fsi-master",
+			.table = {
+				GPIO_LOOKUP("1e780000.gpio", ASPEED_GPIO(G, 0),
+					    "clock", GPIO_ACTIVE_HIGH),
+				GPIO_LOOKUP("1e780000.gpio", ASPEED_GPIO(G, 1),
+					    "data", GPIO_ACTIVE_HIGH),
+				{ },
+			},
+		};
+		gpiod_add_lookup_table(&fsi_gpio_lookup);
+	}
 
 	/* Assert MAC2 PHY hardware reset */
 	/* Set pin low */
-- 
2.13.0.506.g27d5fe0cd-goog
