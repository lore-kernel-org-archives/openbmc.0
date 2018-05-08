Return-Path: <benh@kernel.crashing.org>
Authentication-Results: lists.ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40g1Zp0b9TzF1m4
 for <openbmc@lists.ozlabs.org>; Tue,  8 May 2018 11:08:32 +1000 (AEST)
Received: from pasglop.au.ibm.com (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w4816hrR022397;
 Mon, 7 May 2018 20:07:25 -0500
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: openbmc@lists.ozlabs.org
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH linux dev-4.13 4/6] fsi/fsi-master-gpio: Add "no-gpio-delays"
 option
Date: Tue,  8 May 2018 11:06:38 +1000
Message-Id: <20180508010640.14113-4-benh@kernel.crashing.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180508010640.14113-1-benh@kernel.crashing.org>
References: <20180508010640.14113-1-benh@kernel.crashing.org>
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
X-List-Received-Date: Tue, 08 May 2018 01:08:37 -0000

This adds support for an optional device-tree property that
makes the driver skip all the delays around clocking the
GPIOs and set it in the device-tree of common POWER9 based
OpenPower platforms.

This useful on chips like the AST2500 where the GPIO block is
running at a fairly low clock frequency (25Mhz typically). In
this case, the delays are unnecessary and due to the low
precision of the timers, actually quite harmful in terms of
performance.

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts  |  1 +
 .../boot/dts/aspeed-bmc-opp-witherspoon.dts   |  1 +
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts    |  1 +
 drivers/fsi/fsi-master-gpio.c                 | 20 +++++++++++++++----
 4 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
index d746e562e8fd..0fdf08077ed3 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
@@ -59,6 +59,7 @@
 		compatible = "fsi-master-gpio", "fsi-master";
 		#address-cells = <2>;
 		#size-cells = <0>;
+		no-gpio-delays;
 
 		clock-gpios = <&gpio ASPEED_GPIO(AA, 0) GPIO_ACTIVE_HIGH>;
 		data-gpios = <&gpio ASPEED_GPIO(AA, 2) GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index 596608f4b936..214718b7784d 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -160,6 +160,7 @@
 		compatible = "fsi-master-gpio", "fsi-master";
 		#address-cells = <2>;
 		#size-cells = <0>;
+		no-gpio-delays;
 
 		clock-gpios = <&gpio ASPEED_GPIO(AA, 0) GPIO_ACTIVE_HIGH>;
 		data-gpios = <&gpio ASPEED_GPIO(E, 0) GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
index 7f5a29566801..085926935574 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
@@ -91,6 +91,7 @@
 		compatible = "fsi-master-gpio", "fsi-master";
 		#address-cells = <2>;
 		#size-cells = <0>;
+		no-gpio-delays;
 
 		trans-gpios = <&gpio ASPEED_GPIO(O, 6) GPIO_ACTIVE_HIGH>;
 		enable-gpios = <&gpio ASPEED_GPIO(D, 0) GPIO_ACTIVE_HIGH>;
diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
index d6508bbad1fb..c82bbd35276e 100644
--- a/drivers/fsi/fsi-master-gpio.c
+++ b/drivers/fsi/fsi-master-gpio.c
@@ -62,6 +62,7 @@ struct fsi_master_gpio {
 	struct gpio_desc	*gpio_enable;	/* FSI enable */
 	struct gpio_desc	*gpio_mux;	/* Mux control */
 	bool			external_mode;
+	bool			no_delays;
 };
 
 #define CREATE_TRACE_POINTS
@@ -79,9 +80,11 @@ static void clock_toggle(struct fsi_master_gpio *master, int count)
 	int i;
 
 	for (i = 0; i < count; i++) {
-		ndelay(FSI_GPIO_STD_DLY);
+		if (!master->no_delays)
+			ndelay(FSI_GPIO_STD_DLY);
 		gpiod_set_value(master->gpio_clk, 0);
-		ndelay(FSI_GPIO_STD_DLY);
+		if (!master->no_delays)
+			ndelay(FSI_GPIO_STD_DLY);
 		gpiod_set_value(master->gpio_clk, 1);
 	}
 }
@@ -90,10 +93,12 @@ static int sda_clock_in(struct fsi_master_gpio *master)
 {
 	int in;
 
-	ndelay(FSI_GPIO_STD_DLY);
+	if (!master->no_delays)
+		ndelay(FSI_GPIO_STD_DLY);
 	gpiod_set_value(master->gpio_clk, 0);
 	in = gpiod_get_value(master->gpio_data);
-	ndelay(FSI_GPIO_STD_DLY);
+	if (!master->no_delays)
+		ndelay(FSI_GPIO_STD_DLY);
 	gpiod_set_value(master->gpio_clk, 1);
 	return in ? 1 : 0;
 }
@@ -677,6 +682,13 @@ static int fsi_master_gpio_probe(struct platform_device *pdev)
 	}
 	master->gpio_mux = gpio;
 
+	/*
+	 * Check if GPIO block is slow enought that no extra delays
+	 * are necessary. This improves performance on ast2500 by
+	 * an order of magnitude.
+	 */
+	master->no_delays = device_property_present(&pdev->dev, "no-gpio-delays");
+
 	master->master.n_links = 1;
 	master->master.flags = FSI_MASTER_FLAG_SWCLOCK;
 	master->master.read = fsi_master_gpio_read;
-- 
2.17.0
