Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wjw9C52vSzDqFH
 for <openbmc@lists.ozlabs.org>; Thu,  8 Jun 2017 16:13:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="K0iHA8jY"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="KT/JP8t2"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id B8B66209FB;
 Thu,  8 Jun 2017 02:13:48 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 08 Jun 2017 02:13:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc:x-sasl-enc; s=fm1; bh=K+MNSuzk9ZQFiy3iHHGKcZemi30X5A
 T90vXnVultIas=; b=K0iHA8jYEV9+Hek+vP/ZHXZgGOxRk06k7sGdGDPClf33TM
 S4TDTj1zsIvhPc3Px2JASRXD+cyGatKyTTtqHBZwQjUwH1GTUYYK6fzsMEX3Mu0I
 IzJ/G4A0Iq5rlBA3Ya8jmVRXbFiyzOwmX5bt66QySd3g/11RdkBJ9Qd20lsLKnSh
 ESs1zTvjzks5jUvFkXs292o3lgH3SVQx4Ng8XEuRCgHv2BU4rS/oxHbllrDfU1qo
 LmZKFykDwCsn0u2+rDnIH+bpLa0MZNGiw4rgrRfZbBcykgJfvWenqH45VxLs0v2b
 lV4yLpOCEP0OZGwhl9oLEz8TWxf8vunwSeR0sMwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=K+MNSu
 zk9ZQFiy3iHHGKcZemi30X5AT90vXnVultIas=; b=KT/JP8t2NeLwNgExTPd56s
 m5gPYvNIbBWXvectO2FhYvmb60tcaWUJX1t3e/eGwUUHFCVc01prm+N3z0CwJcPh
 TKQruR96PKKIn8JgGdvw9J2GDKkf3JttzfzaUeLLlqp/rLJ6wPqREQstr2KEZvGL
 fy5Sdg/IVLgaqapk9qTmGFV0drie4vdPsNgCILqVdIQgQRJD79XOb0II+Kyn2bq9
 3KSjP4QC7TvS1saEfQr9lTX/IrKOkaNU61e0fm18n0Y8TgYlPZHDXUUS1rvO6/au
 iXmm6je401IyCAnzkHiWZDFoRPIpMMjR0s27OcL9doSiIfbkBf8/ltYz/VovqnkA
 ==
X-ME-Sender: <xms:HOs4Wd1WqDE71WHLYmyzNTvbgsjXgS1MueTWavNP85YZltFpAkfkqA>
X-Sasl-enc: 18CNXwisq5QcLTpucQvMH3aIYeMBCYNHDezq7x1Upqbn 1496902427
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9DE597E850;
 Thu,  8 Jun 2017 02:13:46 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>, msbarth@linux.vnet.ibm.com,
 openbmc@lists.ozlabs.org
Subject: [PATCH] hwmon: max31785: Use standard sysfs ABI for fast rotor inputs
Date: Thu,  8 Jun 2017 15:42:49 +0930
Message-Id: <20170608061249.29233-1-andrew@aj.id.au>
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
X-List-Received-Date: Thu, 08 Jun 2017 06:13:53 -0000

Non-standard attributes are an obstacle for userspace. Instead, use the
standard fanX_input attributes, and number the fast-rotor values in
[NR_CHANNEL, 2 * NR_CHANNEL - 1].

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
Matt,

I have a couple of observations testing this on a Witherspoon system that has
the necessary modifications:

1. The fast-rotor values are non-zero and vary despite the chassis power being
   off (the slow rotor values become non-zero when the chassis is powered-on).
2. The fast-rotor values seem to be 'sticky' - sometimes they don't vary as
   often as I would expect (e.g. in fan ramp- up or down).
2. The fast-rotor attributes appear to correspond to the slow rotor values.

On point 1, here's what I see out of the box:

    root@witherspoon:/sys/bus/i2c/drivers/max31785/3-0052/hwmon/hwmon1# grep '.*' fan*
    fan10_input:10190
    fan11_input:0
    fan12_input:0
    fan1_fault:0
    fan1_input:10714
    fan1_pulses:2
    fan1_target:10500
    fan2_fault:0
    fan2_input:10416
    fan2_pulses:2
    fan2_target:10500
    fan3_fault:0
    fan3_input:10744
    fan3_pulses:2
    fan3_target:10500
    fan4_fault:0
    fan4_input:10806
    fan4_pulses:2
    fan4_target:10500
    fan5_fault:0
    fan5_input:0
    fan5_pulses:1
    fan5_target:1638
    fan6_fault:0
    fan6_input:0
    fan6_pulses:1
    fan6_target:1638
    fan7_input:10135
    fan8_input:9920
    fan9_input:10162

Expanding on point 2, I issued `obmcutil chassison`, then proceeded to set
progressively increasing fan targets:

    root@witherspoon:/sys/bus/i2c/drivers/max31785/3-0052/hwmon/hwmon1# grep '.*' fan*
    fan10_input:7142
    fan11_input:0
    fan12_input:0
    fan1_fault:0
    fan1_input:6432
    fan1_pulses:2
    fan1_target:6500
    fan2_fault:0
    fan2_input:9816
    fan2_pulses:2
    fan2_target:9500
    fan3_fault:0
    fan3_input:8426
    fan3_pulses:2
    fan3_target:8500
    fan4_fault:0
    fan4_input:7515
    fan4_pulses:2
    fan4_target:7500
    fan5_fault:0
    fan5_input:0
    fan5_pulses:1
    fan5_target:1638
    fan6_fault:0
    fan6_input:0
    fan6_pulses:1
    fan6_target:1638
    fan7_input:6009
    fan8_input:9351
    fan9_input:7944

The fanX_input values for X in [6, 10] are consistently lower than X in [1, 4].

 drivers/hwmon/max31785.c | 103 +++++++++++++++++++++++++----------------------
 1 file changed, 54 insertions(+), 49 deletions(-)

diff --git a/drivers/hwmon/max31785.c b/drivers/hwmon/max31785.c
index ed47d08a0ada..ca69d0974c00 100644
--- a/drivers/hwmon/max31785.c
+++ b/drivers/hwmon/max31785.c
@@ -88,10 +88,14 @@ struct max31785 {
 	u8	mfr_fan_config[NR_CHANNEL];
 	u8	fault_status[NR_CHANNEL];
 	u16	pwm[NR_CHANNEL];
-	u16	tach_rpm[NR_CHANNEL];
-	u16	tach_rpm_fast[NR_CHANNEL];
+	u16	tach_rpm[NR_CHANNEL * 2];
 };
 
+static inline bool max31785_has_fast_rotor(struct max31785 *data)
+{
+	return !!(data->capabilities & MAX31785_CAP_FAST_ROTOR);
+}
+
 static int max31785_set_page(struct i2c_client *client,
 				u8 page)
 {
@@ -188,14 +192,14 @@ static int max31785_update_fan_speed(struct max31785 *data, u8 fan)
 	if (rc)
 		return rc;
 
-	if (data->capabilities & MAX31785_CAP_FAST_ROTOR) {
+	if (max31785_has_fast_rotor(data)) {
 		rc = max31785_smbus_read_long_data(data->client,
 				MAX31785_REG_FAN_SPEED_1);
 		if (rc < 0)
 			return rc;
 
 		data->tach_rpm[fan] = rc & 0xffff;
-		data->tach_rpm_fast[fan] = (rc >> 16) & 0xffff;
+		data->tach_rpm[NR_CHANNEL + fan] = (rc >> 16) & 0xffff;
 
 		return rc;
 	}
@@ -475,7 +479,7 @@ static int max31785_detect(struct i2c_client *client,
 	return 0;
 }
 
-static const u32 max31785_fan_config[] = {
+static const u32 max31785_fan_config_0x3030[] = {
 	HWMON_F_INPUT | HWMON_F_PULSES | HWMON_F_TARGET | HWMON_F_FAULT,
 	HWMON_F_INPUT | HWMON_F_PULSES | HWMON_F_TARGET | HWMON_F_FAULT,
 	HWMON_F_INPUT | HWMON_F_PULSES | HWMON_F_TARGET | HWMON_F_FAULT,
@@ -485,9 +489,30 @@ static const u32 max31785_fan_config[] = {
 	0
 };
 
-static const struct hwmon_channel_info max31785_fan = {
+static const struct hwmon_channel_info max31785_fan_0x3030 = {
 	.type = hwmon_fan,
-	.config = max31785_fan_config,
+	.config = max31785_fan_config_0x3030,
+};
+
+static const u32 max31785_fan_config_0x3040[] = {
+	HWMON_F_INPUT | HWMON_F_PULSES | HWMON_F_TARGET | HWMON_F_FAULT,
+	HWMON_F_INPUT | HWMON_F_PULSES | HWMON_F_TARGET | HWMON_F_FAULT,
+	HWMON_F_INPUT | HWMON_F_PULSES | HWMON_F_TARGET | HWMON_F_FAULT,
+	HWMON_F_INPUT | HWMON_F_PULSES | HWMON_F_TARGET | HWMON_F_FAULT,
+	HWMON_F_INPUT | HWMON_F_PULSES | HWMON_F_TARGET | HWMON_F_FAULT,
+	HWMON_F_INPUT | HWMON_F_PULSES | HWMON_F_TARGET | HWMON_F_FAULT,
+	HWMON_F_INPUT,
+	HWMON_F_INPUT,
+	HWMON_F_INPUT,
+	HWMON_F_INPUT,
+	HWMON_F_INPUT,
+	HWMON_F_INPUT,
+	0
+};
+
+static const struct hwmon_channel_info max31785_fan_0x3040 = {
+	.type = hwmon_fan,
+	.config = max31785_fan_config_0x3040,
 };
 
 static const u32 max31785_pwm_config[] = {
@@ -505,8 +530,14 @@ static const struct hwmon_channel_info max31785_pwm = {
 	.config = max31785_pwm_config
 };
 
-static const struct hwmon_channel_info *max31785_info[] = {
-	&max31785_fan,
+static const struct hwmon_channel_info *max31785_info_0x3030[] = {
+	&max31785_fan_0x3030,
+	&max31785_pwm,
+	NULL,
+};
+
+static const struct hwmon_channel_info *max31785_info_0x3040[] = {
+	&max31785_fan_0x3040,
 	&max31785_pwm,
 	NULL,
 };
@@ -562,15 +593,6 @@ static int max31785_read_fan(struct max31785 *data, u32 attr, int channel,
 	return rc;
 }
 
-static int max31785_fan_get_fast(struct device *dev,
-				struct device_attribute *attr, char *buf)
-{
-	struct sensor_device_attribute_2 *attr2 = to_sensor_dev_attr_2(attr);
-	struct max31785 *data = max31785_update_device(dev);
-
-	return sprintf(buf, "%d\n", data->tach_rpm_fast[attr2->index]);
-}
-
 static int max31785_read_pwm(struct max31785 *data, u32 attr, int channel,
 		long *val)
 {
@@ -723,9 +745,14 @@ static const struct hwmon_ops max31785_hwmon_ops = {
 	.write = max31785_write,
 };
 
-static const struct hwmon_chip_info max31785_chip_info = {
+static const struct hwmon_chip_info max31785_chip_info_0x3030 = {
 	.ops = &max31785_hwmon_ops,
-	.info = max31785_info,
+	.info = max31785_info_0x3030,
+};
+
+static const struct hwmon_chip_info max31785_chip_info_0x3040 = {
+	.ops = &max31785_hwmon_ops,
+	.info = max31785_info_0x3040,
 };
 
 static ssize_t max31785_fault_resp_store(struct device *dev,
@@ -802,31 +829,7 @@ static ssize_t max31785_fault_resp_show(struct device *dev,
 }
 
 static DEVICE_ATTR(fault_resp, 0644, max31785_fault_resp_show,
-		max31785_fault_resp_store);
-
-static SENSOR_DEVICE_ATTR(fan1_input_fast, 0444, max31785_fan_get_fast,
-		NULL, 0);
-static SENSOR_DEVICE_ATTR(fan2_input_fast, 0444, max31785_fan_get_fast,
-		NULL, 1);
-static SENSOR_DEVICE_ATTR(fan3_input_fast, 0444, max31785_fan_get_fast,
-		NULL, 2);
-static SENSOR_DEVICE_ATTR(fan4_input_fast, 0444, max31785_fan_get_fast,
-		NULL, 3);
-static SENSOR_DEVICE_ATTR(fan5_input_fast, 0444, max31785_fan_get_fast,
-		NULL, 4);
-static SENSOR_DEVICE_ATTR(fan6_input_fast, 0444, max31785_fan_get_fast,
-		NULL, 5);
-
-static struct attribute *max31785_attrs[] = {
-	&sensor_dev_attr_fan1_input_fast.dev_attr.attr,
-	&sensor_dev_attr_fan2_input_fast.dev_attr.attr,
-	&sensor_dev_attr_fan3_input_fast.dev_attr.attr,
-	&sensor_dev_attr_fan4_input_fast.dev_attr.attr,
-	&sensor_dev_attr_fan5_input_fast.dev_attr.attr,
-	&sensor_dev_attr_fan6_input_fast.dev_attr.attr,
-	NULL,
-};
-ATTRIBUTE_GROUPS(max31785);
+		   max31785_fault_resp_store);
 
 static int max31785_get_capabilities(struct max31785 *data)
 {
@@ -846,7 +849,7 @@ static int max31785_probe(struct i2c_client *client,
 			  const struct i2c_device_id *id)
 {
 	struct i2c_adapter *adapter = client->adapter;
-	const struct attribute_group **extra_groups;
+	const struct hwmon_chip_info *chip;
 	struct device *dev = &client->dev;
 	struct device *hwmon_dev;
 	struct max31785 *data;
@@ -871,15 +874,17 @@ static int max31785_probe(struct i2c_client *client,
 	if (rc < 0)
 		return rc;
 
-	if (data->capabilities & MAX31785_CAP_FAST_ROTOR)
-		extra_groups = max31785_groups;
+	if (max31785_has_fast_rotor(data))
+		chip = &max31785_chip_info_0x3040;
+	else
+		chip = &max31785_chip_info_0x3030;
 
 	rc = device_create_file(dev, &dev_attr_fault_resp);
 	if (rc)
 		return rc;
 
 	hwmon_dev = devm_hwmon_device_register_with_info(dev,
-			client->name, data, &max31785_chip_info, extra_groups);
+			client->name, data, chip, NULL);
 
 	return PTR_ERR_OR_ZERO(hwmon_dev);
 }
-- 
2.11.0
