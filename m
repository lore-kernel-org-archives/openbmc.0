Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3D8311A001D
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2016 12:30:35 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1455154230012877.9878972740808;
 Wed, 10 Feb 2016 17:30:30 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux 1/2] i2c: aspeed: Don't rename added devices
Date: Wed, 10 Feb 2016 19:30:27 -0600
Message-Id: <1455154228-7217-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1455154228-7217-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1455154228-7217-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Zoho-Virus-Status: 1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Feb 2016 01:30:35 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

Changing the name of a device with dev_set_name after device_add
is not allowed.

However, of_create_device takes a bus_id parameter that specifies
the name of the platform device being added.

This does mean the bus property has to be retrieved multiple times.
Creation is skiped if there is trouble retrieving or formatting
the name.

The documentation for kobject_set_name (non-vargs) says:
 * This sets the name of the kobject.  If you have already added the
 * kobject to the system, you must call kobject_rename() in order to
 * change the name of the kobject.

As the kernel doc for device_rename says:
 * Make up a "real" name in the driver before you register anything, or add
 * some other attributes for userspace to find the device, or use udev to add
 * symlinks -- but never rename kernel devices later, it's a complete mess. We
 * don't even want to get into that and try to implement the missing pieces in
 * the core. We really have other pieces to fix in the driver core mess. :)

before:
1e78a000.i2c/1e78a1c0.i2c-bus/i2c-6/i2c-dev/i2c-6
1e78a000.i2c/1e78a180.i2c-bus/i2c-5/i2c-dev/i2c-5
1e78a000.i2c/1e78a140.i2c-bus/i2c-4/i2c-dev/i2c-4
1e78a000.i2c/1e78a100.i2c-bus/i2c-3/i2c-dev/i2c-3
1e78a000.i2c/1e78a100.i2c-bus/i2c-3/3-0050
1e78a000.i2c/1e78a0c0.i2c-bus/i2c-2/i2c-dev/i2c-2
1e78a000.i2c/1e78a0c0.i2c-bus/i2c-2/2-004c/hwmon/hwmon0
1e78a000.i2c/1e78a080.i2c-bus/i2c-1/i2c-dev/i2c-1
1e78a000.i2c/1e78a040.i2c-bus/i2c-0/i2c-dev/i2c-0
1e78a000.i2c/1e78a040.i2c-bus/i2c-0/0-0050
1e78a000.i2c/1e78a040.i2c-bus/i2c-0/0-0068/rtc/rtc0
1e78a000.i2c/1e78a340.i2c-bus/i2c-8/i2c-dev/i2c-8

after:
1e78a000.i2c/i2c-0/i2c-0/i2c-dev/i2c-0
1e78a000.i2c/i2c-0/i2c-0/0-0050
1e78a000.i2c/i2c-0/i2c-0/0-0068/rtc/rtc0
1e78a000.i2c/i2c-1/i2c-1/i2c-dev/i2c-1
1e78a000.i2c/i2c-2/i2c-2/i2c-dev/i2c-2
1e78a000.i2c/i2c-2/i2c-2/2-004c/hwmon/hwmon0
1e78a000.i2c/i2c-3/i2c-3/i2c-dev/i2c-3
1e78a000.i2c/i2c-3/i2c-3/3-0050
1e78a000.i2c/i2c-4/i2c-4/i2c-dev/i2c-4
1e78a000.i2c/i2c-5/i2c-5/i2c-dev/i2c-5
1e78a000.i2c/i2c-6/i2c-6/i2c-dev/i2c-6
1e78a000.i2c/i2c-7/i2c-7/i2c-dev/i2c-7

1e620000.fmc                   1e78e000.serial
1e620000.fmc:flash@0           1e78f000.serial
1e630000.spi                   ahb
1e630000.spi:flash             ahb:apb
1e660000.ethernet              alarmtimer
1e6c0080.interrupt-controller  i2c-0
1e6e2000.syscon                i2c-1
1e720000.sram                  i2c-2
1e780000.gpio                  i2c-3
1e782000.timer                 i2c-4
1e783000.serial                i2c-5
1e784000.serial                i2c-6
1e785000.wdt                   i2c-7
1e787000.vuart                 i2c-8
1e789140.ibt                   leds
1e78a000.i2c                   serial8250
1e78d000.serial

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 drivers/i2c/busses/i2c-aspeed.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index 5488233..ccb438f 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -693,13 +693,6 @@ static int ast_i2c_probe_bus(struct platform_device *pdev)
 	if (ret)
 		return -ENXIO;
 
-	/*
-	 * Set a useful name derived from the bus number; the device tree
-	 * should provide us with one that corresponds to the hardware
-	 * numbering
-	 */
-	dev_set_name(&pdev->dev, "i2c-%d", bus_num);
-
 	bus->pclk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(bus->pclk)) {
 		dev_dbg(&pdev->dev, "clk_get failed\n");
@@ -828,7 +821,26 @@ static int ast_i2c_probe_controller(struct platform_device *pdev)
 			controller->irq);
 
 	for_each_child_of_node(pdev->dev.of_node, np) {
-		of_platform_device_create(np, NULL, &pdev->dev);
+		int ret;
+		u32 bus_num;
+		char bus_id[sizeof("i2c-12345")];
+
+		/*
+		 * Set a useful name derived from the bus number; the device
+		 * tree should provide us with one that corresponds to the
+		 * hardware numbering.  If the property is missing the
+		 * probe would fail so just skip it here.
+		 */
+
+		ret = of_property_read_u32(np, "bus", &bus_num);
+		if (ret)
+			continue;
+
+		ret = snprintf(bus_id, sizeof(bus_id), "i2c-%u", bus_num);
+		if (ret >= sizeof(bus_id))
+			continue;
+
+		of_platform_device_create(np, bus_id, &pdev->dev);
 		of_node_put(np);
 	}
 
-- 
2.7.1
