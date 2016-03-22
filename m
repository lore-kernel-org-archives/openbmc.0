Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qV3jd1CzKzDqFX
 for <openbmc@lists.ozlabs.org>; Wed, 23 Mar 2016 07:11:01 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1458677447283732.2957673366052;
 Tue, 22 Mar 2016 13:10:47 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 4/4] Add kernel fixes for Inventory and OCC
Date: Tue, 22 Mar 2016 15:10:39 -0500
Message-Id: <1458677439-17628-5-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1458677439-17628-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1458677439-17628-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 22 Mar 2016 20:11:01 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

Add a fix to avoid out-of-bounds memory access in the OCC driver when
the host is using 12 core modules.

Add a fix to setup some of the SCU Pin Mux registers on Barreleye
to use the GPIO to allow the pci slot inventory to see the pins.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 ...ated-SCU88-register-and-SCU90-init-values.patch |  70 ++++++++++
 ...8_occ_i2c-Add-more-hwmon-sysfs-attribute-.patch | 148 +++++++++++++++++++++
 .../recipes-kernel/linux/linux-obmc_%.bbappend     |   2 +
 3 files changed, 220 insertions(+)
 create mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/0001-Updated-SCU88-register-and-SCU90-init-values.patch
 create mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/0001-hwmon-power8_occ_i2c-Add-more-hwmon-sysfs-attribute-.patch

diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/0001-Updated-SCU88-register-and-SCU90-init-values.patch b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/0001-Updated-SCU88-register-and-SCU90-init-values.patch
new file mode 100644
index 0000000..06621ff
--- /dev/null
+++ b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/0001-Updated-SCU88-register-and-SCU90-init-values.patch
@@ -0,0 +1,70 @@
+From ff221583a7dbfcc8aad2302e216306cc48eabdda Mon Sep 17 00:00:00 2001
+From: Adi Gangidi <adi.gangidi@rackspace.com>
+Date: Thu, 17 Mar 2016 10:01:10 -0500
+Subject: [PATCH] Updated SCU88 register and SCU90 init values
+
+From:    Adi Gangidi <adi.gangidi@rackspace.com>
+
+Before This change:
+a) SCU90[0]=1, function pin Incorrectly defined. It must be pull down internally.
+b) For SCU88, bits 7:0 were set to 1. That is: We were reading : PWMx or VPIGx instead of GPIONx (GPIONx gives us the PCIe inventory status, where x is bit number). Because of this PCIe inventory was showing up wrong.
+
+After This Change:
+a) SCU90[0]=0
+b) Bits (7:0) of SCU 88 are set to 0 . (According to Page 111 of data sheet these have to be set to 0 for us to to read GPION0 to GPIO N7 which indicate if PCIe device is present ).
+
+Description of pins 0 of SCU 90:
+Enable SD1 Function Pin
+
+Description of pins 7:0 of SCU 88:
+7 RW Enable PWM7 or VPIG7 function pin  (SCU90[5:4]=0x2 select Video pin)
+6 RW Enable PWM6 or VPIG6 function pin   (SCU90[5:4]=0x2 select Video pin)
+5 RW Enable PWM5 or VPIG5 function pin    (SCU90[5:4]!=0 select Video pin)
+4 RW Enable PWM4 or VPIG4 function pin     (SCU90[5:4]!=0 select Video pin)
+3 RW Enable PWM3 or VPIG3 function pin      (SCU90[5:4]!=0 select Video pin)
+2 RW Enable PWM2 or VPIG2 function pin        (SCU90[5:4]!=0 select Video pin)
+1 RW Enable PWM1 or VPIG1 function pin        (SCU90[5:4]=0x3 select Video pin)
+0 RW Enable PWM0 or VPIG0 function pin         (SCU90[5:4]=0x3 select Video pin)
+
+[ miltonm: move 88 to barreleye and palmetto with different values ]
+Signed-off-by: Milton Miller <miltonm@us.ibm.com>
+
+diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
+index f3180fc..d9d89e2 100644
+--- a/arch/arm/mach-aspeed/aspeed.c
++++ b/arch/arm/mach-aspeed/aspeed.c
+@@ -116,10 +116,8 @@ static void __init do_common_setup(void)
+ 	writel(0x00000000, AST_IO(AST_BASE_LPC | 0x9c));
+ 
+ 	/* SCU setup */
+-	writel(0x01C000FF, AST_IO(AST_BASE_SCU | 0x88));
+ 	writel(0xC1C000FF, AST_IO(AST_BASE_SCU | 0x8c));
+-	writel(0x01C0007F, AST_IO(AST_BASE_SCU | 0x88));
+-	writel(0x003FA009, AST_IO(AST_BASE_SCU | 0x90));
++	writel(0x003FA008, AST_IO(AST_BASE_SCU | 0x90));
+ 
+ 	/* Setup scratch registers */
+ 	writel(0x00000042, AST_IO(AST_BASE_LPC | 0x170));
+@@ -132,6 +130,9 @@ static void __init do_barreleye_setup(void)
+ 
+ 	do_common_setup();
+ 
++	/* More SCU setup */
++	writel(0x01C00000, AST_IO(AST_BASE_SCU | 0x88));    
++
+ 	/* Setup PNOR address mapping for 64M flash */
+ 	writel(0x30000C00, AST_IO(AST_BASE_LPC | 0x88));
+ 	writel(0xFC0003FF, AST_IO(AST_BASE_LPC | 0x8C));
+@@ -155,6 +156,9 @@ static void __init do_palmetto_setup(void)
+ {
+ 	do_common_setup();
+ 
++	/* More SCU setup */
++	writel(0x01C0007F, AST_IO(AST_BASE_SCU | 0x88));
++
+ 	/* Setup PNOR address mapping for 32M flash */
+ 	writel(0x30000E00, AST_IO(AST_BASE_LPC | 0x88));
+ 	writel(0xFE0001FF, AST_IO(AST_BASE_LPC | 0x8C));
+-- 
+1.8.2.2
+
diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/0001-hwmon-power8_occ_i2c-Add-more-hwmon-sysfs-attribute-.patch b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/0001-hwmon-power8_occ_i2c-Add-more-hwmon-sysfs-attribute-.patch
new file mode 100644
index 0000000..817a652
--- /dev/null
+++ b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/0001-hwmon-power8_occ_i2c-Add-more-hwmon-sysfs-attribute-.patch
@@ -0,0 +1,148 @@
+From f8087dfe91e6f82b634c99b3a48a147eaf59ca72 Mon Sep 17 00:00:00 2001
+From: Yi Li <adamliyi@msn.com>
+Date: Tue, 22 Mar 2016 15:12:49 +0800
+Subject: [PATCH] hwmon: power8_occ_i2c: Add more hwmon sysfs attribute
+ definition to support more sensors
+
+This patch fixes issue: https://github.com/openbmc/skeleton/issues/58
+
+The hwmon sys attributes are created using statically defined arrays.
+Some POWER CPU has 10-core, while some POWER CPU has 12-core.
+The more cores, the more OCC sensors. E.g, for 12-core CPU,
+there will be 28 temperature sensors. The statically defined
+array will overflow in this case.
+
+This is a temporary fix. Will need to generate the hwmon sysfs attributes
+dynamically.
+
+Signed-off-by: Yi Li <adamliyi@msn.com>
+
+diff --git a/drivers/hwmon/power8_occ_i2c.c b/drivers/hwmon/power8_occ_i2c.c
+index c9c70d1..3505fe7 100644
+--- a/drivers/hwmon/power8_occ_i2c.c
++++ b/drivers/hwmon/power8_occ_i2c.c
+@@ -831,6 +831,16 @@ static struct sensor_device_attribute temp_input[] = {
+ 	SENSOR_ATTR(temp20_input, S_IRUGO, show_occ_temp_input, NULL, 19),
+ 	SENSOR_ATTR(temp21_input, S_IRUGO, show_occ_temp_input, NULL, 20),
+ 	SENSOR_ATTR(temp22_input, S_IRUGO, show_occ_temp_input, NULL, 21),
++	SENSOR_ATTR(temp23_input, S_IRUGO, show_occ_temp_input, NULL, 22),
++	SENSOR_ATTR(temp24_input, S_IRUGO, show_occ_temp_input, NULL, 23),
++	SENSOR_ATTR(temp25_input, S_IRUGO, show_occ_temp_input, NULL, 24),
++	SENSOR_ATTR(temp26_input, S_IRUGO, show_occ_temp_input, NULL, 25),
++	SENSOR_ATTR(temp27_input, S_IRUGO, show_occ_temp_input, NULL, 26),
++	SENSOR_ATTR(temp28_input, S_IRUGO, show_occ_temp_input, NULL, 27),
++	SENSOR_ATTR(temp29_input, S_IRUGO, show_occ_temp_input, NULL, 28),
++	SENSOR_ATTR(temp30_input, S_IRUGO, show_occ_temp_input, NULL, 29),
++	SENSOR_ATTR(temp31_input, S_IRUGO, show_occ_temp_input, NULL, 30),
++	SENSOR_ATTR(temp32_input, S_IRUGO, show_occ_temp_input, NULL, 31),
+ };
+ 
+ static struct sensor_device_attribute temp_label[] = {
+@@ -856,7 +866,16 @@ static struct sensor_device_attribute temp_label[] = {
+ 	SENSOR_ATTR(temp20_label, S_IRUGO, show_occ_temp_label, NULL, 19),
+ 	SENSOR_ATTR(temp21_label, S_IRUGO, show_occ_temp_label, NULL, 20),
+ 	SENSOR_ATTR(temp22_label, S_IRUGO, show_occ_temp_label, NULL, 21),
+-
++	SENSOR_ATTR(temp23_label, S_IRUGO, show_occ_temp_label, NULL, 22),
++	SENSOR_ATTR(temp24_label, S_IRUGO, show_occ_temp_label, NULL, 23),
++	SENSOR_ATTR(temp25_label, S_IRUGO, show_occ_temp_label, NULL, 24),
++	SENSOR_ATTR(temp26_label, S_IRUGO, show_occ_temp_label, NULL, 25),
++	SENSOR_ATTR(temp27_label, S_IRUGO, show_occ_temp_label, NULL, 26),
++	SENSOR_ATTR(temp28_label, S_IRUGO, show_occ_temp_label, NULL, 27),
++	SENSOR_ATTR(temp29_label, S_IRUGO, show_occ_temp_label, NULL, 28),
++	SENSOR_ATTR(temp30_label, S_IRUGO, show_occ_temp_label, NULL, 29),
++	SENSOR_ATTR(temp31_label, S_IRUGO, show_occ_temp_label, NULL, 30),
++	SENSOR_ATTR(temp32_label, S_IRUGO, show_occ_temp_label, NULL, 31),
+ };
+ 
+ #define TEMP_UNIT_ATTRS(X)                      \
+@@ -889,6 +908,16 @@ static struct attribute *occ_temp_attr[][3] = {
+ 	TEMP_UNIT_ATTRS(19),
+ 	TEMP_UNIT_ATTRS(20),
+ 	TEMP_UNIT_ATTRS(21),
++	TEMP_UNIT_ATTRS(22),
++	TEMP_UNIT_ATTRS(23),
++	TEMP_UNIT_ATTRS(24),
++	TEMP_UNIT_ATTRS(25),
++	TEMP_UNIT_ATTRS(26),
++	TEMP_UNIT_ATTRS(27),
++	TEMP_UNIT_ATTRS(28),
++	TEMP_UNIT_ATTRS(29),
++	TEMP_UNIT_ATTRS(30),
++	TEMP_UNIT_ATTRS(31),
+ };
+ 
+ static const struct attribute_group occ_temp_attr_group[] = {
+@@ -914,6 +943,16 @@ static const struct attribute_group occ_temp_attr_group[] = {
+ 	{ .attrs = occ_temp_attr[19] },
+ 	{ .attrs = occ_temp_attr[20] },
+ 	{ .attrs = occ_temp_attr[21] },
++	{ .attrs = occ_temp_attr[22] },
++	{ .attrs = occ_temp_attr[23] },
++	{ .attrs = occ_temp_attr[24] },
++	{ .attrs = occ_temp_attr[25] },
++	{ .attrs = occ_temp_attr[26] },
++	{ .attrs = occ_temp_attr[27] },
++	{ .attrs = occ_temp_attr[28] },
++	{ .attrs = occ_temp_attr[29] },
++	{ .attrs = occ_temp_attr[30] },
++	{ .attrs = occ_temp_attr[31] },
+ };
+ 
+ 
+@@ -928,6 +967,8 @@ static struct sensor_device_attribute freq_input[] = {
+ 	SENSOR_ATTR(freq8_input, S_IRUGO, show_occ_freq_input, NULL, 7),
+ 	SENSOR_ATTR(freq9_input, S_IRUGO, show_occ_freq_input, NULL, 8),
+ 	SENSOR_ATTR(freq10_input, S_IRUGO, show_occ_freq_input, NULL, 9),
++	SENSOR_ATTR(freq11_input, S_IRUGO, show_occ_freq_input, NULL, 10),
++	SENSOR_ATTR(freq12_input, S_IRUGO, show_occ_freq_input, NULL, 11),
+ };
+ 
+ static struct sensor_device_attribute freq_label[] = {
+@@ -941,6 +982,8 @@ static struct sensor_device_attribute freq_label[] = {
+ 	SENSOR_ATTR(freq8_label, S_IRUGO, show_occ_freq_label, NULL, 7),
+ 	SENSOR_ATTR(freq9_label, S_IRUGO, show_occ_freq_label, NULL, 8),
+ 	SENSOR_ATTR(freq10_label, S_IRUGO, show_occ_freq_label, NULL, 9),
++	SENSOR_ATTR(freq11_label, S_IRUGO, show_occ_freq_label, NULL, 10),
++	SENSOR_ATTR(freq12_label, S_IRUGO, show_occ_freq_label, NULL, 11),
+ 
+ };
+ 
+@@ -962,6 +1005,8 @@ static struct attribute *occ_freq_attr[][3] = {
+ 	FREQ_UNIT_ATTRS(7),
+ 	FREQ_UNIT_ATTRS(8),
+ 	FREQ_UNIT_ATTRS(9),
++	FREQ_UNIT_ATTRS(10),
++	FREQ_UNIT_ATTRS(11),
+ };
+ 
+ static const struct attribute_group occ_freq_attr_group[] = {
+@@ -975,6 +1020,8 @@ static const struct attribute_group occ_freq_attr_group[] = {
+ 	{ .attrs = occ_freq_attr[7] },
+ 	{ .attrs = occ_freq_attr[8] },
+ 	{ .attrs = occ_freq_attr[9] },
++	{ .attrs = occ_freq_attr[10] },
++	{ .attrs = occ_freq_attr[11] },
+ };
+ 
+ static struct sensor_device_attribute_2 caps_curr_powercap[] = {
+@@ -1318,6 +1365,7 @@ static ssize_t set_occ_online(struct device *dev,
+ 
+ 		err = occ_create_hwmon_attribute(dev);
+ 		if (err) {
++			dev_err(dev, "ERROR: cannot create sysfs attr\n");
+ 			hwmon_device_unregister(data->hwmon_dev);
+ 			return err;
+ 		}
+@@ -1328,6 +1376,8 @@ static ssize_t set_occ_online(struct device *dev,
+ 		if (data->occ_online == 0)
+ 			return count;
+ 
++		dev_dbg(dev, "occ unregister hwmon @0x%x\n",
++				data->client->addr);
+ 		occ_remove_sysfs_files(data->hwmon_dev);
+ 		hwmon_device_unregister(data->hwmon_dev);
+ 		data->hwmon_dev = NULL;
+-- 
+1.8.2.2
+
diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc_%.bbappend b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc_%.bbappend
index 4ca3407..2894a56 100644
--- a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc_%.bbappend
+++ b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc_%.bbappend
@@ -4,4 +4,6 @@ SRC_URI += " \
  file://0001-Fix-directory-hardlinks-from-deleted-directories.patch \
  file://0001-Revert-jffs2-Fix-lock-acquisition-order-bug-in-jffs2.patch \
  file://0002-jffs2-Fix-page-lock-f-sem-deadlock.patch \
+ file://0001-hwmon-power8_occ_i2c-Add-more-hwmon-sysfs-attribute-.patch \
+ file://0001-Updated-SCU88-register-and-SCU90-init-values.patch \
  "
-- 
2.7.1
