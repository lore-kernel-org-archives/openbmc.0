Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wfDfl07RlzDqL2
 for <openbmc@lists.ozlabs.org>; Fri,  2 Jun 2017 16:23:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="iA7MEcwO"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="rS1tM1We"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 5C03D20852;
 Fri,  2 Jun 2017 02:23:08 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Fri, 02 Jun 2017 02:23:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=7aO1/A
 VtBufo04Sutw6fofyqtlNg25P15ELbL+BMIdg=; b=iA7MEcwO5QoHvEd5iqOvZl
 SsXzGAXOAgHdbyu3Jsf9WQ09mwXv2GPx0FQxGW064KvufSCEwKIe/GaV1Hj8Wag7
 U1iR26W602Fyc2ReuNGeIvtN4gHSRxND3PwK5AGjNrL1r/DNdjZB/3USCYKLXlk+
 kblyxuI4uK/OgWtMTU0OEb5ugnQDGgvVBQEveT69HXYwxbUgCKv9BQA/s7R0dKV+
 3WXcvxeI/1Dfwza2e572pn0PQZQJozXXw4huUEqBphg99R27uuN/dauL8YLhHmnl
 Uk4qHKbtZuh6wmb/OxW9V5P3es6se+wX25lV9GVSzkNGnkQfOpPZm4k/ZCKoihUg
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=7aO1/AVtBufo04Sutw6fofyqtlNg25P15ELbL+BMI
 dg=; b=rS1tM1WeHXzCEu5sB2T5Wm2wEZOgdDml2Px8Egfa962hMwGB3CnltGfr0
 TRKnLK+pXvtHYrJXRbVdmCZWQDYB09iXVg8e2Pw1Ohw6nLaB17zZ3eJ1eHZsCx+W
 dBKKXnJRF2k9vicqdWcpwYs0IQVJDMXv36RLyaangHsnto1XRFGwX2yXMLYdxBC4
 WG4L7ptQNBHMluPCMECJTql/SkEAUQ8YUiyj2aVxHdwIQ4oJVfR7Dzyqae9yDISa
 y1A3+sWl7ilRWDMqPogfR8O75114ccu5GH2EFZVCUoWSqmTbDTWgGCghlc3Qv0W4
 5wGh1/UhYclSekixDuoi/5ezy8YvQ==
X-ME-Sender: <xms:TAQxWTxyB3mk6JJdpcG33Bcl9dt2fBKC8JKs8_YVE20PPJTimx2FwQ>
X-Sasl-enc: VPeCRT2iy5lunkUaKEXTCmbThGB3KYvcdoLv0yDx3kb+ 1496384587
Received: from keelia.base64.com.au (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4F1EA24009;
 Fri,  2 Jun 2017 02:23:05 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: tpearson@raptorengineering.com, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org, cbostic@linux.vnet.ibm.com,
 msbarth@linux.vnet.ibm.com
Subject: [RFC PATCH linux dev-4.10 4/7] hwmon: max31785: Adapt to new hwmon
 APIs
Date: Fri,  2 Jun 2017 15:52:04 +0930
Message-Id: <20170602062208.15999-5-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 02 Jun 2017 06:23:11 -0000

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/hwmon/max31785.c | 617 ++++++++++++++++++++++-------------------------
 1 file changed, 285 insertions(+), 332 deletions(-)

diff --git a/drivers/hwmon/max31785.c b/drivers/hwmon/max31785.c
index ad86082ffc7d..d1feb73d08f1 100644
--- a/drivers/hwmon/max31785.c
+++ b/drivers/hwmon/max31785.c
@@ -1,6 +1,6 @@
 /*
  * max31785.c - Part of lm_sensors, Linux kernel modules for hardware
- *             monitoring.
+ *	       monitoring.
  *
  * (C) 2016 Raptor Engineering, LLC
  *
@@ -62,7 +62,7 @@ static const unsigned short normal_i2c[] = { 0x52, 0x53, 0x54, 0x55,
 /*
  * Client data (each client gets its own)
  */
-struct max31785_data {
+struct max31785 {
 	struct i2c_client *client;
 	struct mutex device_lock;
 	bool valid; /* zero until following fields are valid */
@@ -123,20 +123,17 @@ static int max31785_write_fan_data(struct i2c_client *client,
 	return 0;
 }
 
-static bool is_automatic_control_mode(struct max31785_data *data,
+static bool is_automatic_control_mode(struct max31785 *data,
 			int index)
 {
-	if (data->fan_command[index] > 0x7fff)
-		return true;
-	else
-		return false;
+	return data->fan_command[index] > 0x7fff;
 }
 
-static struct max31785_data *max31785_update_device(struct device *dev)
+static struct max31785 *max31785_update_device(struct device *dev)
 {
-	struct max31785_data *data = dev_get_drvdata(dev);
+	struct max31785 *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
-	struct max31785_data *ret = data;
+	struct max31785 *ret = data;
 	int i;
 	int rv;
 
@@ -196,51 +193,10 @@ static struct max31785_data *max31785_update_device(struct device *dev)
 	return ret;
 }
 
-static ssize_t get_fan(struct device *dev,
-		       struct device_attribute *devattr, char *buf)
+static ssize_t max31785_fan_set_target(struct max31785 *data, int channel,
+		long rpm)
 {
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct max31785_data *data = max31785_update_device(dev);
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
-	return sprintf(buf, "%d\n", data->tach_rpm[attr->index]);
-}
-
-static ssize_t get_fan_target(struct device *dev,
-			      struct device_attribute *devattr, char *buf)
-{
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct max31785_data *data = max31785_update_device(dev);
-	int rpm;
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
-	if (data->fan_config[attr->index]
-		& MAX31785_FAN_CFG_CONTROL_MODE_RPM)
-		rpm = data->fan_command[attr->index];
-	else
-		rpm = data->fan_command[attr->index]
-					/ MAX31785_FAN_COMMAND_PWM_RATIO;
-
-	return sprintf(buf, "%d\n", rpm);
-}
-
-static ssize_t set_fan_target(struct device *dev,
-			      struct device_attribute *devattr,
-			      const char *buf, size_t count)
-{
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct max31785_data *data = dev_get_drvdata(dev);
-	struct i2c_client *client = data->client;
-	unsigned long rpm;
-	int err;
-
-	err = kstrtoul(buf, 10, &rpm);
-	if (err)
-		return err;
+	int rc;
 
 	if (rpm > 0x7fff)
 		return -EINVAL;
@@ -248,56 +204,27 @@ static ssize_t set_fan_target(struct device *dev,
 	mutex_lock(&data->device_lock);
 
 	/* Write new RPM value */
-	data->fan_command[attr->index] = rpm;
-	err = max31785_write_fan_data(client, attr->index,
+	data->fan_command[channel] = rpm;
+	rc = max31785_write_fan_data(data->client, channel,
 				MAX31785_REG_FAN_COMMAND_1,
-				data->fan_command[attr->index], 0);
+				data->fan_command[channel], 0);
 
 	mutex_unlock(&data->device_lock);
 
-	if (err < 0)
-		return err;
-
-	return count;
-}
-
-static ssize_t get_fan_pulses(struct device *dev,
-			      struct device_attribute *devattr, char *buf)
-{
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct max31785_data *data = max31785_update_device(dev);
-	int pulses;
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
-	pulses = ((data->fan_config[attr->index] & MAX31785_FAN_CFG_PULSE_MASK)
-			>> MAX31785_FAN_CFG_PULSE_SHIFT)
-			+ MAX31785_FAN_CFG_PULSE_OFFSET;
-
-	return sprintf(buf, "%d\n", pulses);
+	return rc;
 }
 
-static ssize_t set_fan_pulses(struct device *dev,
-			      struct device_attribute *devattr,
-			      const char *buf, size_t count)
+static ssize_t max31785_fan_set_pulses(struct max31785 *data, int channel,
+		long pulses)
 {
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct max31785_data *data = dev_get_drvdata(dev);
-	struct i2c_client *client = data->client;
-	unsigned long pulses;
-	int err;
-
-	err = kstrtoul(buf, 10, &pulses);
-	if (err)
-		return err;
+	int rc;
 
 	if (pulses > 4)
 		return -EINVAL;
 
 	/* XXX: This sequence disables the fan and sets in PWM mode */
-	data->fan_config[attr->index] &= MAX31785_FAN_CFG_PULSE_MASK;
-	data->fan_config[attr->index] |=
+	data->fan_config[channel] &= MAX31785_FAN_CFG_PULSE_MASK;
+	data->fan_config[channel] |=
 				((pulses - MAX31785_FAN_CFG_PULSE_OFFSET)
 				<< MAX31785_FAN_CFG_PULSE_SHIFT);
 
@@ -317,55 +244,21 @@ static ssize_t set_fan_pulses(struct device *dev,
 	 *
 	 * In all cases [1-4] is quite low
 	 */
-	data->fan_command[attr->index] = pulses;
+	data->fan_command[channel] = pulses;
 
 	/* Write new pulse value */
-	err = max31785_write_fan_data(client, attr->index,
+	rc = max31785_write_fan_data(data->client, channel,
 				MAX31785_REG_FAN_CONFIG_1_2,
-				data->fan_config[attr->index], 1);
+				data->fan_config[channel], 1);
 
 	mutex_unlock(&data->device_lock);
 
-	if (err < 0)
-		return err;
-
-	return count;
-}
-
-static ssize_t get_pwm(struct device *dev,
-		       struct device_attribute *devattr, char *buf)
-{
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct max31785_data *data = max31785_update_device(dev);
-	int pwm;
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
-	if ((data->fan_config[attr->index]
-		& MAX31785_FAN_CFG_CONTROL_MODE_RPM)
-		|| is_automatic_control_mode(data, attr->index))
-		pwm = data->pwm[attr->index] / 100;
-	else
-		pwm = data->fan_command[attr->index]
-					/ MAX31785_FAN_COMMAND_PWM_RATIO;
-
-	return sprintf(buf, "%d\n", pwm);
+	return rc;
 }
 
-static ssize_t set_pwm(struct device *dev,
-		       struct device_attribute *devattr,
-		       const char *buf, size_t count)
+static ssize_t max31785_pwm_set(struct max31785 *data, int channel, long pwm)
 {
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct max31785_data *data = dev_get_drvdata(dev);
-	struct i2c_client *client = data->client;
-	unsigned long pwm;
-	int err;
-
-	err = kstrtoul(buf, 10, &pwm);
-	if (err)
-		return err;
+	int rc;
 
 	if (pwm > 255)
 		return -EINVAL;
@@ -373,67 +266,33 @@ static ssize_t set_pwm(struct device *dev,
 	mutex_lock(&data->device_lock);
 
 	/* Write new PWM value */
-	data->fan_command[attr->index] = pwm * MAX31785_FAN_COMMAND_PWM_RATIO;
-	err = max31785_write_fan_data(client, attr->index,
+	data->fan_command[channel] = pwm * MAX31785_FAN_COMMAND_PWM_RATIO;
+	rc = max31785_write_fan_data(data->client, channel,
 				MAX31785_REG_FAN_COMMAND_1,
-				data->fan_command[attr->index], 0);
+				data->fan_command[channel], 0);
 
 	mutex_unlock(&data->device_lock);
 
-	if (err < 0)
-		return err;
-
-	return count;
-}
-
-static ssize_t get_pwm_enable(struct device *dev,
-			      struct device_attribute *devattr, char *buf)
-{
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct max31785_data *data = max31785_update_device(dev);
-	int mode;
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
-	if (!(data->fan_config[attr->index] & MAX31785_FAN_CFG_PWM_ENABLE))
-		mode = 0;
-	else if (is_automatic_control_mode(data, attr->index))
-		mode = 3;
-	else if (data->fan_config[attr->index]
-		& MAX31785_FAN_CFG_CONTROL_MODE_RPM)
-		mode = 2;
-	else
-		mode = 1;
-
-	return sprintf(buf, "%d\n", mode);
+	return rc;
 }
 
-static ssize_t set_pwm_enable(struct device *dev,
-			      struct device_attribute *devattr,
-			      const char *buf, size_t count)
+static ssize_t max31785_pwm_enable(struct max31785 *data, int channel,
+		long mode)
 {
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct max31785_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
-	unsigned long mode;
-	int err;
-
-	err = kstrtoul(buf, 10, &mode);
-	if (err)
-		return err;
+	int rc;
 
 	switch (mode) {
 	case 0:
-		data->fan_config[attr->index] =
-			data->fan_config[attr->index]
+		data->fan_config[channel] =
+			data->fan_config[channel]
 			& ~MAX31785_FAN_CFG_PWM_ENABLE;
 		break;
 	case 1: /* fallthrough */
 	case 2: /* fallthrough */
 	case 3:
-		data->fan_config[attr->index] =
-			data->fan_config[attr->index]
+		data->fan_config[channel] =
+			data->fan_config[channel]
 			 | MAX31785_FAN_CFG_PWM_ENABLE;
 		break;
 	default:
@@ -444,17 +303,17 @@ static ssize_t set_pwm_enable(struct device *dev,
 	case 0:
 		break;
 	case 1:
-		data->fan_config[attr->index] =
-			data->fan_config[attr->index]
+		data->fan_config[channel] =
+			data->fan_config[channel]
 			& ~MAX31785_FAN_CFG_CONTROL_MODE_RPM;
 		break;
 	case 2:
-		data->fan_config[attr->index] =
-			data->fan_config[attr->index]
+		data->fan_config[channel] =
+			data->fan_config[channel]
 			| MAX31785_FAN_CFG_CONTROL_MODE_RPM;
 		break;
 	case 3:
-		data->fan_command[attr->index] = 0xffff;
+		data->fan_command[channel] = 0xffff;
 		break;
 	default:
 		return -EINVAL;
@@ -462,161 +321,22 @@ static ssize_t set_pwm_enable(struct device *dev,
 
 	mutex_lock(&data->device_lock);
 
-	err = max31785_write_fan_data(client, attr->index,
+	rc = max31785_write_fan_data(client, channel,
 				MAX31785_REG_FAN_CONFIG_1_2,
-				data->fan_config[attr->index], 1);
+				data->fan_config[channel], 1);
 
-	if (err < 0)
-		goto abort;
-
-	err = max31785_write_fan_data(client, attr->index,
+	if (!rc)
+		rc = max31785_write_fan_data(client, channel,
 				MAX31785_REG_FAN_COMMAND_1,
-				data->fan_command[attr->index], 0);
+				data->fan_command[channel], 0);
 
-abort:
 	mutex_unlock(&data->device_lock);
 
-	if (err < 0)
-		return err;
-
-	return count;
+	return rc;
 }
 
-static ssize_t get_fan_fault(struct device *dev,
-			     struct device_attribute *devattr, char *buf)
-{
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	struct max31785_data *data = max31785_update_device(dev);
-	int fault;
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
-	fault = !!(data->fault_status[attr->index]
-			& MAX31785_FAN_STATUS_FAULT_MASK);
-
-	return sprintf(buf, "%d\n", fault);
-}
-
-static SENSOR_DEVICE_ATTR(fan1_input, S_IRUGO, get_fan, NULL, 0);
-static SENSOR_DEVICE_ATTR(fan2_input, S_IRUGO, get_fan, NULL, 1);
-static SENSOR_DEVICE_ATTR(fan3_input, S_IRUGO, get_fan, NULL, 2);
-static SENSOR_DEVICE_ATTR(fan4_input, S_IRUGO, get_fan, NULL, 3);
-static SENSOR_DEVICE_ATTR(fan5_input, S_IRUGO, get_fan, NULL, 4);
-static SENSOR_DEVICE_ATTR(fan6_input, S_IRUGO, get_fan, NULL, 5);
-
-static SENSOR_DEVICE_ATTR(fan1_fault, S_IRUGO, get_fan_fault, NULL, 0);
-static SENSOR_DEVICE_ATTR(fan2_fault, S_IRUGO, get_fan_fault, NULL, 1);
-static SENSOR_DEVICE_ATTR(fan3_fault, S_IRUGO, get_fan_fault, NULL, 2);
-static SENSOR_DEVICE_ATTR(fan4_fault, S_IRUGO, get_fan_fault, NULL, 3);
-static SENSOR_DEVICE_ATTR(fan5_fault, S_IRUGO, get_fan_fault, NULL, 4);
-static SENSOR_DEVICE_ATTR(fan6_fault, S_IRUGO, get_fan_fault, NULL, 5);
-
-static SENSOR_DEVICE_ATTR(fan1_target, S_IWUSR | S_IRUGO,
-		get_fan_target, set_fan_target, 0);
-static SENSOR_DEVICE_ATTR(fan2_target, S_IWUSR | S_IRUGO,
-		get_fan_target, set_fan_target, 1);
-static SENSOR_DEVICE_ATTR(fan3_target, S_IWUSR | S_IRUGO,
-		get_fan_target, set_fan_target, 2);
-static SENSOR_DEVICE_ATTR(fan4_target, S_IWUSR | S_IRUGO,
-		get_fan_target, set_fan_target, 3);
-static SENSOR_DEVICE_ATTR(fan5_target, S_IWUSR | S_IRUGO,
-		get_fan_target, set_fan_target, 4);
-static SENSOR_DEVICE_ATTR(fan6_target, S_IWUSR | S_IRUGO,
-		get_fan_target, set_fan_target, 5);
-
-static SENSOR_DEVICE_ATTR(fan1_pulses, S_IWUSR | S_IRUGO,
-		get_fan_pulses, set_fan_pulses, 0);
-static SENSOR_DEVICE_ATTR(fan2_pulses, S_IWUSR | S_IRUGO,
-		get_fan_pulses, set_fan_pulses, 1);
-static SENSOR_DEVICE_ATTR(fan3_pulses, S_IWUSR | S_IRUGO,
-		get_fan_pulses, set_fan_pulses, 2);
-static SENSOR_DEVICE_ATTR(fan4_pulses, S_IWUSR | S_IRUGO,
-		get_fan_pulses, set_fan_pulses, 3);
-static SENSOR_DEVICE_ATTR(fan5_pulses, S_IWUSR | S_IRUGO,
-		get_fan_pulses, set_fan_pulses, 4);
-static SENSOR_DEVICE_ATTR(fan6_pulses, S_IWUSR | S_IRUGO,
-		get_fan_pulses, set_fan_pulses, 5);
-
-static SENSOR_DEVICE_ATTR(pwm1, S_IWUSR | S_IRUGO, get_pwm, set_pwm, 0);
-static SENSOR_DEVICE_ATTR(pwm2, S_IWUSR | S_IRUGO, get_pwm, set_pwm, 1);
-static SENSOR_DEVICE_ATTR(pwm3, S_IWUSR | S_IRUGO, get_pwm, set_pwm, 2);
-static SENSOR_DEVICE_ATTR(pwm4, S_IWUSR | S_IRUGO, get_pwm, set_pwm, 3);
-static SENSOR_DEVICE_ATTR(pwm5, S_IWUSR | S_IRUGO, get_pwm, set_pwm, 4);
-static SENSOR_DEVICE_ATTR(pwm6, S_IWUSR | S_IRUGO, get_pwm, set_pwm, 5);
-
-static SENSOR_DEVICE_ATTR(pwm1_enable, S_IWUSR | S_IRUGO,
-		get_pwm_enable, set_pwm_enable, 0);
-static SENSOR_DEVICE_ATTR(pwm2_enable, S_IWUSR | S_IRUGO,
-		get_pwm_enable, set_pwm_enable, 1);
-static SENSOR_DEVICE_ATTR(pwm3_enable, S_IWUSR | S_IRUGO,
-		get_pwm_enable, set_pwm_enable, 2);
-static SENSOR_DEVICE_ATTR(pwm4_enable, S_IWUSR | S_IRUGO,
-		get_pwm_enable, set_pwm_enable, 3);
-static SENSOR_DEVICE_ATTR(pwm5_enable, S_IWUSR | S_IRUGO,
-		get_pwm_enable, set_pwm_enable, 4);
-static SENSOR_DEVICE_ATTR(pwm6_enable, S_IWUSR | S_IRUGO,
-		get_pwm_enable, set_pwm_enable, 5);
-
-static struct attribute *max31785_attrs[] = {
-	&sensor_dev_attr_fan1_input.dev_attr.attr,
-	&sensor_dev_attr_fan2_input.dev_attr.attr,
-	&sensor_dev_attr_fan3_input.dev_attr.attr,
-	&sensor_dev_attr_fan4_input.dev_attr.attr,
-	&sensor_dev_attr_fan5_input.dev_attr.attr,
-	&sensor_dev_attr_fan6_input.dev_attr.attr,
-
-	&sensor_dev_attr_fan1_fault.dev_attr.attr,
-	&sensor_dev_attr_fan2_fault.dev_attr.attr,
-	&sensor_dev_attr_fan3_fault.dev_attr.attr,
-	&sensor_dev_attr_fan4_fault.dev_attr.attr,
-	&sensor_dev_attr_fan5_fault.dev_attr.attr,
-	&sensor_dev_attr_fan6_fault.dev_attr.attr,
-
-	&sensor_dev_attr_fan1_target.dev_attr.attr,
-	&sensor_dev_attr_fan2_target.dev_attr.attr,
-	&sensor_dev_attr_fan3_target.dev_attr.attr,
-	&sensor_dev_attr_fan4_target.dev_attr.attr,
-	&sensor_dev_attr_fan5_target.dev_attr.attr,
-	&sensor_dev_attr_fan6_target.dev_attr.attr,
-
-	&sensor_dev_attr_fan1_pulses.dev_attr.attr,
-	&sensor_dev_attr_fan2_pulses.dev_attr.attr,
-	&sensor_dev_attr_fan3_pulses.dev_attr.attr,
-	&sensor_dev_attr_fan4_pulses.dev_attr.attr,
-	&sensor_dev_attr_fan5_pulses.dev_attr.attr,
-	&sensor_dev_attr_fan6_pulses.dev_attr.attr,
-
-	&sensor_dev_attr_pwm1.dev_attr.attr,
-	&sensor_dev_attr_pwm2.dev_attr.attr,
-	&sensor_dev_attr_pwm3.dev_attr.attr,
-	&sensor_dev_attr_pwm4.dev_attr.attr,
-	&sensor_dev_attr_pwm5.dev_attr.attr,
-	&sensor_dev_attr_pwm6.dev_attr.attr,
-
-	&sensor_dev_attr_pwm1_enable.dev_attr.attr,
-	&sensor_dev_attr_pwm2_enable.dev_attr.attr,
-	&sensor_dev_attr_pwm3_enable.dev_attr.attr,
-	&sensor_dev_attr_pwm4_enable.dev_attr.attr,
-	&sensor_dev_attr_pwm5_enable.dev_attr.attr,
-	&sensor_dev_attr_pwm6_enable.dev_attr.attr,
-	NULL
-};
-
-static umode_t max31785_attrs_visible(struct kobject *kobj,
-				     struct attribute *a, int n)
-{
-	return a->mode;
-}
-
-static const struct attribute_group max31785_group = {
-	.attrs = max31785_attrs,
-	.is_visible = max31785_attrs_visible,
-};
-__ATTRIBUTE_GROUPS(max31785);
-
 static int max31785_init_client(struct i2c_client *client,
-				struct max31785_data *data)
+				struct max31785 *data)
 {
 	int i, rv;
 
@@ -678,12 +398,245 @@ static int max31785_detect(struct i2c_client *client,
 	return 0;
 }
 
+static const u32 max31785_fan_config[] = {
+	HWMON_F_INPUT | HWMON_F_PULSES | HWMON_F_TARGET | HWMON_F_FAULT,
+	HWMON_F_INPUT | HWMON_F_PULSES | HWMON_F_TARGET | HWMON_F_FAULT,
+	HWMON_F_INPUT | HWMON_F_PULSES | HWMON_F_TARGET | HWMON_F_FAULT,
+	HWMON_F_INPUT | HWMON_F_PULSES | HWMON_F_TARGET | HWMON_F_FAULT,
+	HWMON_F_INPUT | HWMON_F_PULSES | HWMON_F_TARGET | HWMON_F_FAULT,
+	HWMON_F_INPUT | HWMON_F_PULSES | HWMON_F_TARGET | HWMON_F_FAULT,
+	0
+};
+
+static const struct hwmon_channel_info max31785_fan = {
+	.type = hwmon_fan,
+	.config = max31785_fan_config,
+};
+
+static const u32 max31785_pwm_config[] = {
+	HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+	HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+	HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+	HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+	HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+	HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+	0,
+};
+
+static const struct hwmon_channel_info max31785_pwm = {
+	.type = hwmon_pwm,
+	.config = max31785_pwm_config
+};
+
+static const struct hwmon_channel_info *max31785_info[] = {
+	&max31785_fan,
+	&max31785_pwm,
+	NULL,
+};
+
+static int max31785_read_fan(struct max31785 *data, u32 attr, int channel,
+		long *val)
+{
+	int rc = 0;
+
+	switch (attr) {
+	case hwmon_fan_pulses:
+	{
+		long pulses;
+
+		pulses = data->fan_config[channel];
+		pulses &= MAX31785_FAN_CFG_PULSE_MASK;
+		pulses >>= MAX31785_FAN_CFG_PULSE_SHIFT;
+		pulses += MAX31785_FAN_CFG_PULSE_OFFSET;
+
+		*val = pulses;
+		break;
+	}
+	case hwmon_fan_target:
+	{
+		long target = data->fan_command[channel];
+
+		if (!(data->fan_config[channel] &
+				MAX31785_FAN_CFG_CONTROL_MODE_RPM))
+			target /= MAX31785_FAN_COMMAND_PWM_RATIO;
+
+		*val = target;
+		break;
+	}
+	case hwmon_fan_input:
+		*val = data->tach_rpm[channel];
+		break;
+	case hwmon_fan_fault:
+		*val = !!(data->fault_status[channel] &
+				MAX31785_FAN_STATUS_FAULT_MASK);
+		break;
+	default:
+		rc = -EOPNOTSUPP;
+		break;
+	};
+
+	return rc;
+}
+
+static int max31785_read_pwm(struct max31785 *data, u32 attr, int channel,
+		long *val)
+{
+	bool is_auto;
+	bool is_rpm;
+	int rc;
+
+	is_rpm = !!(data->fan_config[channel] &
+			MAX31785_FAN_CFG_CONTROL_MODE_RPM);
+	is_auto = is_automatic_control_mode(data, channel);
+
+	switch (attr) {
+	case hwmon_pwm_enable:
+	{
+		bool pwm_enabled;
+
+		pwm_enabled = (data->fan_config[channel] &
+				MAX31785_FAN_CFG_PWM_ENABLE);
+
+		if (!pwm_enabled)
+			*val = 0;
+		else if (is_auto)
+			*val = 3;
+		else if (is_rpm)
+			*val = 2;
+		else
+			*val = 1;
+		break;
+	}
+	case hwmon_pwm_input:
+		if (is_rpm || is_auto)
+			*val = data->pwm[channel] / 100;
+		else
+			*val = data->fan_command[channel]
+				/ MAX31785_FAN_COMMAND_PWM_RATIO;
+		break;
+	default:
+		rc = -EOPNOTSUPP;
+	};
+
+	return rc;
+}
+
+static int max31785_read(struct device *dev, enum hwmon_sensor_types type,
+		u32 attr, int channel, long *val)
+{
+	struct max31785 *data;
+	int rc;
+
+	data = max31785_update_device(dev);
+
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
+	switch (type) {
+	case hwmon_fan:
+		return max31785_read_fan(data, attr, channel, val);
+	case hwmon_pwm:
+		return max31785_read_pwm(data, attr, channel, val);
+	default:
+		rc = -EOPNOTSUPP;
+	}
+
+	return rc;
+}
+
+static int max31785_write_fan(struct max31785 *data, u32 attr, int channel,
+		long val)
+{
+	int rc;
+
+	switch (attr) {
+		break;
+	case hwmon_fan_pulses:
+		return max31785_fan_set_pulses(data, channel, val);
+	case hwmon_fan_target:
+		return max31785_fan_set_target(data, channel, val);
+	default:
+		rc = -EOPNOTSUPP;
+	};
+
+	return rc;
+}
+
+static int max31785_write_pwm(struct max31785 *data, u32 attr, int channel,
+		long val)
+{
+	int rc;
+
+	switch (attr) {
+	case hwmon_pwm_enable:
+		return max31785_pwm_enable(data, channel, val);
+	case hwmon_pwm_input:
+		return max31785_pwm_set(data, channel, val);
+	default:
+		rc = -EOPNOTSUPP;
+	};
+
+	return rc;
+}
+
+static int max31785_write(struct device *dev, enum hwmon_sensor_types type,
+		u32 attr, int channel, long val)
+{
+	struct max31785 *data;
+	int rc;
+
+	data = dev_get_drvdata(dev);
+
+	switch (type) {
+	case hwmon_fan:
+		return max31785_write_fan(data, attr, channel, val);
+	case hwmon_pwm:
+		return max31785_write_pwm(data, attr, channel, val);
+	default:
+		rc = -EOPNOTSUPP;
+	}
+
+	return rc;
+
+}
+
+static umode_t max31785_is_visible(const void *_data,
+		enum hwmon_sensor_types type, u32 attr, int channel)
+{
+	switch (type) {
+	case hwmon_fan:
+		switch (attr) {
+		case hwmon_fan_input:
+		case hwmon_fan_fault:
+			return 0444;
+		case hwmon_fan_pulses:
+		case hwmon_fan_target:
+			return 0644;
+		};
+	case hwmon_pwm:
+		return 0644;
+	default:
+		return 0;
+	};
+}
+
+static const struct hwmon_ops max31785_hwmon_ops = {
+	.is_visible = max31785_is_visible,
+	.read = max31785_read,
+	.write = max31785_write,
+};
+
+static const struct hwmon_chip_info max31785_chip_info = {
+	.ops = &max31785_hwmon_ops,
+	.info = max31785_info,
+};
+
 static int max31785_probe(struct i2c_client *client,
 			  const struct i2c_device_id *id)
 {
 	struct i2c_adapter *adapter = client->adapter;
 	struct device *dev = &client->dev;
-	struct max31785_data *data;
+	struct max31785 *data;
 	struct device *hwmon_dev;
 	int err;
 
@@ -691,7 +644,7 @@ static int max31785_probe(struct i2c_client *client,
 			I2C_FUNC_SMBUS_BYTE_DATA | I2C_FUNC_SMBUS_WORD_DATA))
 		return -ENODEV;
 
-	data = devm_kzalloc(dev, sizeof(struct max31785_data), GFP_KERNEL);
+	data = devm_kzalloc(dev, sizeof(struct max31785), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
@@ -705,8 +658,8 @@ static int max31785_probe(struct i2c_client *client,
 	if (err)
 		return err;
 
-	hwmon_dev = devm_hwmon_device_register_with_groups(dev,
-			client->name, data, max31785_groups);
+	hwmon_dev = devm_hwmon_device_register_with_info(dev,
+			client->name, data, &max31785_chip_info, NULL);
 
 	return PTR_ERR_OR_ZERO(hwmon_dev);
 }
-- 
2.11.0
