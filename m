Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wfDfr6d43zDqL5
 for <openbmc@lists.ozlabs.org>; Fri,  2 Jun 2017 16:23:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="r5RBedMy"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="qtVyAEzn"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4BCF5207EF;
 Fri,  2 Jun 2017 02:23:14 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Fri, 02 Jun 2017 02:23:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=rpFNG3
 8fIiEze36SCv31zAhk3wDmSUK+5OCwoazaq48=; b=r5RBedMymOWF7leuszdm3j
 3zwOOgVmiyJev13UZltUjk6hXBCP9OIhTB/nzxDj7OxHHcF6woyI0KotfklPvgRb
 ULKzBJFzUj2HlS8/R8y6fLOqrL1F36Zza5AOEbOTvo6S/iNar9o23WYpBJPhBPLi
 z5idMqTxcW+k+asK+js62Zb3ofnRufh/Iz2l+XvhhJdzjUZmPb9kJcG0JgFhsi0U
 hp9s8bwrkxTh1J5gS0nyaHo8Vt+zWiSL7UQQESDNgUy9ll/sQhzC2FPs40467T/s
 Jo3+UG9w30sCyQpD9weDzHtHBSChhz2j9x141L0VipixjTB75M9rXnqvm+7WuaLQ
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=rpFNG38fIiEze36SCv31zAhk3wDmSUK+5OCwoazaq
 48=; b=qtVyAEzn/JTxRcoBP0vjQI5rZ3Xv7RxrD7/AX+qKAhuncHwYZ4/229k1q
 m5RWTAsvEUmX1muXSTPG/S6g6VqbAtOWDEErKPtYMHXRQS3gM+odn5dxX5CwK6vV
 4ZpltNSZhyk2F9lMl4le+J2lO1v0GEHn/RwgfbzIc89uc7HIpAPqKWpzmkyxAkXc
 88Pz11WyTsx31EL8lKZe2Sgd0iI7b4eB3k7ABUAclQDVMkpDtcpGhex98ifngmGe
 EKLcpuGv1hrOJgxVfz6NLgFFyxBlVZ9Rl1Qc53K85JFjwlrCLVZu6bJtkg6Bw/We
 xnyhzhhXQJk9pfJOmT/n4IhsKii9Q==
X-ME-Sender: <xms:UgQxWZBEDhLdkiTaAJL9oWpFagf_WKwu_6UaTyLu_WsARRbgNi6cxw>
X-Sasl-enc: 3uhalhYUB8Dok/yFp0yCKeLGiJEIw3ZYTA7p/j4UU839 1496384593
Received: from keelia.base64.com.au (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id AA0B424009;
 Fri,  2 Jun 2017 02:23:11 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: tpearson@raptorengineering.com, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org, cbostic@linux.vnet.ibm.com,
 msbarth@linux.vnet.ibm.com
Subject: [RFC PATCH linux dev-4.10 6/7] hwmon: max31785: Enable fast rotor
 measurement feature
Date: Fri,  2 Jun 2017 15:52:06 +0930
Message-Id: <20170602062208.15999-7-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170602062208.15999-1-andrew@aj.id.au>
References: <20170602062208.15999-1-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 02 Jun 2017 06:23:17 -0000

MFR_REVISION 0x3040 of the max31785 chip provides two rotor readings
for READ_FAN_SPEED_1, with an extra 16 bits after the original
READ_FAN_SPEED_1 response. For this firmware revision, the first result
represents the 'slow' rotor reading whilst the second represents the
'fast' rotor reading.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 Documentation/hwmon/max31785 |   8 +++
 drivers/hwmon/max31785.c     | 115 ++++++++++++++++++++++++++++++++++++++-----
 2 files changed, 112 insertions(+), 11 deletions(-)

diff --git a/Documentation/hwmon/max31785 b/Documentation/hwmon/max31785
index 0911d204547e..f0d0e54d9a9f 100644
--- a/Documentation/hwmon/max31785
+++ b/Documentation/hwmon/max31785
@@ -34,3 +34,11 @@ fan[1-6]_pulses          RW  tachometer pulses per fan revolution
 fan[1-6]_target          RW  desired fan speed in RPM
 pwm[1-6]_enable          RW  pwm mode, 0=disabled, 1=pwm, 2=rpm, 3=automatic
 pwm[1-6]                 RW  fan target duty cycle (0-255)
+
+Dynamic syfs entries
+--------------------
+
+Whether these entries are present depends on the firmware features detected on
+the device during probe.
+
+fan[1-6]_input_fast      RO  fan tachometer speed in RPM (fast rotor measurement)
diff --git a/drivers/hwmon/max31785.c b/drivers/hwmon/max31785.c
index d1feb73d08f1..fb971277165c 100644
--- a/drivers/hwmon/max31785.c
+++ b/drivers/hwmon/max31785.c
@@ -37,6 +37,7 @@
 #define MAX31785_REG_FAN_SPEED_1		0x90
 #define MAX31785_REG_MFR_ID			0x99
 #define MAX31785_REG_MFR_MODEL			0x9a
+#define MAX31785_REG_MFR_REVISION		0x9b
 #define MAX31785_REG_MFR_FAN_CONFIG		0xf1
 #define MAX31785_REG_READ_FAN_PWM		0xf3
 
@@ -59,6 +60,8 @@
 static const unsigned short normal_i2c[] = { 0x52, 0x53, 0x54, 0x55,
 							I2C_CLIENT_END };
 
+#define MAX31785_CAP_FAST_ROTOR BIT(0)
+
 /*
  * Client data (each client gets its own)
  */
@@ -67,14 +70,17 @@ struct max31785 {
 	struct mutex device_lock;
 	bool valid; /* zero until following fields are valid */
 	unsigned long last_updated; /* in jiffies */
+	u32 capabilities;
 
 	/* register values */
 	u8 fan_config[NR_CHANNEL];
 	u16 fan_command[NR_CHANNEL];
 	u8 mfr_fan_config[NR_CHANNEL];
 	u8 fault_status[NR_CHANNEL];
-	u16 tach_rpm[NR_CHANNEL];
 	u16 pwm[NR_CHANNEL];
+	u16 tach_rpm[NR_CHANNEL];
+	/* Fast rotor measurement */
+	u16 tach_rpm_fast[NR_CHANNEL];
 };
 
 static int max31785_set_page(struct i2c_client *client,
@@ -123,6 +129,35 @@ static int max31785_write_fan_data(struct i2c_client *client,
 	return 0;
 }
 
+static int max31785_update_fan_speed(struct max31785 *data, u8 fan)
+{
+	s64 rc;
+
+	rc = max31785_set_page(data->client, MAX31785_PAGE_FAN_CONFIG(fan));
+	if (rc)
+		return rc;
+
+	if (data->capabilities & MAX31785_CAP_FAST_ROTOR) {
+		rc = i2c_smbus_read_dword_data(data->client,
+				MAX31785_REG_FAN_SPEED_1);
+		if (rc < 0)
+			return rc;
+
+		data->tach_rpm[fan] = rc & 0xffff;
+		data->tach_rpm_fast[fan] = (rc >> 16) & 0xffff;
+
+		return rc;
+	}
+
+	rc = i2c_smbus_read_dword_data(data->client, MAX31785_REG_FAN_SPEED_1);
+	if (rc < 0)
+		return rc;
+
+	data->tach_rpm[fan] = rc;
+
+	return rc;
+}
+
 static bool is_automatic_control_mode(struct max31785 *data,
 			int index)
 {
@@ -134,8 +169,8 @@ static struct max31785 *max31785_update_device(struct device *dev)
 	struct max31785 *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
 	struct max31785 *ret = data;
+	int rv;
 	int i;
-	int rv;
 
 	mutex_lock(&data->device_lock);
 
@@ -147,11 +182,9 @@ static struct max31785 *max31785_update_device(struct device *dev)
 				goto abort;
 			data->fault_status[i] = rv;
 
-			rv = max31785_read_fan_data(client, i,
-					MAX31785_REG_FAN_SPEED_1, 0);
+			rv = max31785_update_fan_speed(data, i);
 			if (rv < 0)
 				goto abort;
-			data->tach_rpm[i] = rv;
 
 			if ((data->fan_config[i]
 				& MAX31785_FAN_CFG_CONTROL_MODE_RPM)
@@ -478,6 +511,20 @@ static int max31785_read_fan(struct max31785 *data, u32 attr, int channel,
 	return rc;
 }
 
+static int max31785_fan_get_fast(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	struct sensor_device_attribute_2 *attr2 = to_sensor_dev_attr_2(attr);
+	struct max31785 *data = dev_get_drvdata(dev);
+
+	int ret = i2c_smbus_read_byte_data(data->client, attr2->index);
+
+	if (ret < 0)
+		return ret;
+
+	return sprintf(buf, "%d\n", data->tach_rpm_fast[attr2->index]);
+}
+
 static int max31785_read_pwm(struct max31785 *data, u32 attr, int channel,
 		long *val)
 {
@@ -631,14 +678,53 @@ static const struct hwmon_chip_info max31785_chip_info = {
 	.info = max31785_info,
 };
 
+static SENSOR_DEVICE_ATTR(fan1_input_fast, 0444, max31785_fan_get_fast,
+		NULL, 0);
+static SENSOR_DEVICE_ATTR(fan2_input_fast, 0444, max31785_fan_get_fast,
+		NULL, 1);
+static SENSOR_DEVICE_ATTR(fan3_input_fast, 0444, max31785_fan_get_fast,
+		NULL, 2);
+static SENSOR_DEVICE_ATTR(fan4_input_fast, 0444, max31785_fan_get_fast,
+		NULL, 3);
+static SENSOR_DEVICE_ATTR(fan5_input_fast, 0444, max31785_fan_get_fast,
+		NULL, 4);
+static SENSOR_DEVICE_ATTR(fan6_input_fast, 0444, max31785_fan_get_fast,
+		NULL, 5);
+
+static struct attribute *max31785_attrs[] = {
+	&sensor_dev_attr_fan1_input_fast.dev_attr.attr,
+	&sensor_dev_attr_fan2_input_fast.dev_attr.attr,
+	&sensor_dev_attr_fan3_input_fast.dev_attr.attr,
+	&sensor_dev_attr_fan4_input_fast.dev_attr.attr,
+	&sensor_dev_attr_fan5_input_fast.dev_attr.attr,
+	&sensor_dev_attr_fan6_input_fast.dev_attr.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(max31785);
+
+static int max31785_get_capabilities(struct max31785 *data)
+{
+	s32 rc;
+
+	rc = i2c_smbus_read_word_data(data->client, MAX31785_REG_MFR_REVISION);
+	if (rc < 0)
+		return rc;
+
+	if (rc == 0x3040)
+		data->capabilities |= MAX31785_CAP_FAST_ROTOR;
+
+	return 0;
+}
+
 static int max31785_probe(struct i2c_client *client,
 			  const struct i2c_device_id *id)
 {
 	struct i2c_adapter *adapter = client->adapter;
+	const struct attribute_group **extra_groups;
 	struct device *dev = &client->dev;
-	struct max31785 *data;
 	struct device *hwmon_dev;
-	int err;
+	struct max31785 *data;
+	int rc;
 
 	if (!i2c_check_functionality(adapter,
 			I2C_FUNC_SMBUS_BYTE_DATA | I2C_FUNC_SMBUS_WORD_DATA))
@@ -654,12 +740,19 @@ static int max31785_probe(struct i2c_client *client,
 	/*
 	 * Initialize the max31785 chip
 	 */
-	err = max31785_init_client(client, data);
-	if (err)
-		return err;
+	rc = max31785_init_client(client, data);
+	if (rc)
+		return rc;
+
+	rc = max31785_get_capabilities(data);
+	if (rc < 0)
+		return rc;
+
+	if (data->capabilities & MAX31785_CAP_FAST_ROTOR)
+		extra_groups = max31785_groups;
 
 	hwmon_dev = devm_hwmon_device_register_with_info(dev,
-			client->name, data, &max31785_chip_info, NULL);
+			client->name, data, &max31785_chip_info, extra_groups);
 
 	return PTR_ERR_OR_ZERO(hwmon_dev);
 }
-- 
2.11.0
