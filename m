Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wkTVk2C47zDq5b
 for <openbmc@lists.ozlabs.org>; Fri,  9 Jun 2017 14:15:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="jNjhC7u7"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="bkCcmQut"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A3F1C2090E;
 Fri,  9 Jun 2017 00:15:55 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Fri, 09 Jun 2017 00:15:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=urQ4ud
 484zucHsLWegz7rf/REyaip67DHJjp4iDu1nA=; b=jNjhC7u7zSuGFCOXqk4JiF
 VLSpF+FxBGUWvQlvZ/Ggi2vESMol44uMXJ0tId7ge3ruoSLRP5/KG3DNe0lF5RQk
 16Hw3kMavuP04i4ueCyGhefygzz4CNsAncZ4YKDmM6Sb2bj1TUMk7FaCS9Bj9kwa
 CnTZa7YDZhXQ9zafWY9z/mO1YCy6woXLag4I39UxqvLGBit9rWdYgKYz/y81zaG7
 z1BUwI6UeeapodajvAcDR1iiKatJ3BKJAmCz10Nss4hfXVZlQh7d2Day01lPj6Bn
 X9n8ZnTLGXWfRqwy2wqiu+ArAdr/MnvIuPrGBKSVJ7AVKdQZSROGuKUqPKrmVzyA
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=urQ4ud484zucHsLWegz7rf/REyaip67DHJjp4iDu1
 nA=; b=bkCcmQut5PG06bqZKw+Xtc0dQQnHm7O0LJfD8nVZAdmcjgwWFwBxW2LKh
 SDNCqpLihYB9N1FE+84bLoWkCCKVkeg08KgzZvoujHioPdbCDt/3uuazRnCgb1Un
 phMTKZKpxi8tke1iZY1xyFUstaEXcXzWe19QwRhlWEvPzaL5U5bcarqVvaW6KVf9
 KK4ZwpAY0+Txe0tW1KfW4gbfeILMtmYcSRTrd/4pU8xrI8/kJA6tJUu5dlYnpPx9
 3xkxSPxz5WP8rh04C147Vy82oV2iJxV/RgsH2gI3fuqMoGZFBEXoPMPBPN1tc/rB
 6uAt23ZSE6TnuRV2VJUFccZxD5MFg==
X-ME-Sender: <xms:-yA6WU5aNNJn6mplyPY1ElSKkngN5kZeUyWNyN9LcOp4FufWS6R6iw>
X-Sasl-enc: L1KwMSkC1FQW1a1wNcSTGDJOE1y1B9VP/5EZlEHCfkD8 1496981754
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id E31772475E;
 Fri,  9 Jun 2017 00:15:53 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>, msbarth@linux.vnet.ibm.com,
 openbmc@lists.ozlabs.org
Subject: [PATCH v2 2/3] hwmon: max31785: Use standard sysfs ABI for fast rotor
 inputs
Date: Fri,  9 Jun 2017 13:44:56 +0930
Message-Id: <20170609041457.31708-3-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170609041457.31708-1-andrew@aj.id.au>
References: <20170609041457.31708-1-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 09 Jun 2017 04:15:59 -0000

Non-standard attributes are an obstacle for userspace. Instead, use the
standard fanX_input attributes, and number the fast-rotor values in
[NR_CHANNEL + 1, 2 * NR_CHANNEL].

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/hwmon/max31785.c | 98 +++++++++++++++++++++++++-----------------------
 1 file changed, 52 insertions(+), 46 deletions(-)

diff --git a/drivers/hwmon/max31785.c b/drivers/hwmon/max31785.c
index ffa2f6c948d5..ecece346be28 100644
--- a/drivers/hwmon/max31785.c
+++ b/drivers/hwmon/max31785.c
@@ -84,10 +84,14 @@ struct max31785 {
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
@@ -184,14 +188,14 @@ static int max31785_update_fan_speed(struct max31785 *data, u8 fan)
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
@@ -470,7 +474,7 @@ static int max31785_detect(struct i2c_client *client,
 	return 0;
 }
 
-static const u32 max31785_fan_config[] = {
+static const u32 max31785_fan_config_0x3030[] = {
 	HWMON_F_INPUT | HWMON_F_PULSES | HWMON_F_TARGET | HWMON_F_FAULT,
 	HWMON_F_INPUT | HWMON_F_PULSES | HWMON_F_TARGET | HWMON_F_FAULT,
 	HWMON_F_INPUT | HWMON_F_PULSES | HWMON_F_TARGET | HWMON_F_FAULT,
@@ -480,9 +484,30 @@ static const u32 max31785_fan_config[] = {
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
@@ -500,8 +525,14 @@ static const struct hwmon_channel_info max31785_pwm = {
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
@@ -557,15 +588,6 @@ static int max31785_read_fan(struct max31785 *data, u32 attr, int channel,
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
@@ -723,34 +745,16 @@ static const struct hwmon_ops max31785_hwmon_ops = {
 	.write = max31785_write,
 };
 
-static const struct hwmon_chip_info max31785_chip_info = {
+static const struct hwmon_chip_info max31785_chip_info_0x3030 = {
 	.ops = &max31785_hwmon_ops,
-	.info = max31785_info,
+	.info = max31785_info_0x3030,
 };
 
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
+static const struct hwmon_chip_info max31785_chip_info_0x3040 = {
+	.ops = &max31785_hwmon_ops,
+	.info = max31785_info_0x3040,
 };
-ATTRIBUTE_GROUPS(max31785);
+
 
 static int max31785_get_capabilities(struct max31785 *data)
 {
@@ -770,7 +774,7 @@ static int max31785_probe(struct i2c_client *client,
 			  const struct i2c_device_id *id)
 {
 	struct i2c_adapter *adapter = client->adapter;
-	const struct attribute_group **extra_groups;
+	const struct hwmon_chip_info *chip;
 	struct device *dev = &client->dev;
 	struct device *hwmon_dev;
 	struct max31785 *data;
@@ -795,11 +799,13 @@ static int max31785_probe(struct i2c_client *client,
 	if (rc < 0)
 		return rc;
 
-	if (data->capabilities & MAX31785_CAP_FAST_ROTOR)
-		extra_groups = max31785_groups;
+	if (max31785_has_fast_rotor(data))
+		chip = &max31785_chip_info_0x3040;
+	else
+		chip = &max31785_chip_info_0x3030;
 
 	hwmon_dev = devm_hwmon_device_register_with_info(dev,
-			client->name, data, &max31785_chip_info, extra_groups);
+			client->name, data, chip, NULL);
 
 	return PTR_ERR_OR_ZERO(hwmon_dev);
 }
-- 
2.11.0
