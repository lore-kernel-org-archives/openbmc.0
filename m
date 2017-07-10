Return-Path: <andrew@aj.id.au>
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x5mx11RHHzDqD0
 for <openbmc@lists.ozlabs.org>; Mon, 10 Jul 2017 23:57:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="m18iHItH"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="qyVOM3SJ"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0B10920968;
 Mon, 10 Jul 2017 09:57:07 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 10 Jul 2017 09:57:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=SWm+2k
 kzzX0mPo3rfdzvEtEpNPzkReFS5sXBK92VhPA=; b=m18iHItHZh6OHVOzXLKLrA
 oRRDCJAKXu8ycxCeOnpSi6zHhiN5VtJ09j8eLu+WOzxGQYHki5Gksvn3940x1mrh
 TqrcSEbUbv6DPJnzLxvCqrhOCr2L8cDImHcXGvTUKzQG4faGu5bpmZvJYctgbuL5
 y3L70w/JlPjchcWIHBtCtRIAI+c2JGkKv70yMJkY53UlS7h9le3+p+TO2RWxrTQs
 kB32MN7s4RWwedutCuWsdTMsUtvysyF30Ku4sNbrpgBDrUg395o5mL4ULhXGc86r
 x+diDWArHkvRyUkzEMWjkK8D+FLRZuYUsEoC/YrfmeidFYLOqcXnwGEG1NYpG56g
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=SWm+2kkzzX0mPo3rfdzvEtEpNPzkReFS5sXBK92Vh
 PA=; b=qyVOM3SJpiPRi48Y0emEx33iashhKJjqeYSCQCveg1pT1HeoL7+jvQhqw
 PbFsdkfDMjkSauxxokAthHOb9XzxyLEWnroNq/zXuJK+h68u6A4NAx8udUXLex6g
 HfebfeStNwXpS2UJy1BywCLV951nAneGHa+3kHuHLt5Fb8F9XeR046EYWkXPY7tt
 e9Kf9AXyS/7T55x31jIqXGQJGYQOJbEgAnU9vRQpypXTbzeBaNc6a7TY6HsFVn7P
 lSyajohIlmNOtDQ4U9RZY5H/OD9Yc7Ewc8XeMxKvI7sJ/C8eMwCUSl4fpCogTvzZ
 1GR9jfDkUtgwF42dQaY819JL0k1wQ==
X-ME-Sender: <xms:sodjWRveuEj5P1AEp9WXmvN-D14ap9gAQvcgjuf_VjagTJskjJoF1g>
X-Sasl-enc: Lg9JOCYXpwTRpM52I+UJG7vEqEx1ZOdifMZTfih5/bkc 1499695025
Received: from keelia.aj.id.au (220-253-43-190.dyn.iinet.net.au
 [220.253.43.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 503FC7E51B;
 Mon, 10 Jul 2017 09:57:03 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, jdelvare@suse.com,
 linux-kernel@vger.kernel.org, joel@jms.id.au, openbmc@lists.ozlabs.org,
 msbarth@linux.vnet.ibm.com, mspinler@linux.vnet.ibm.com
Subject: [RFC PATCH 2/4] pmbus: Add fan configuration support
Date: Mon, 10 Jul 2017 23:26:16 +0930
Message-Id: <20170710135618.13661-3-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170710135618.13661-1-andrew@aj.id.au>
References: <20170710135618.13661-1-andrew@aj.id.au>
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
X-List-Received-Date: Mon, 10 Jul 2017 13:57:09 -0000

Augment PMBus support to include control of fans via the
FAN_COMMAND_[1-4] registers, both in RPM and PWM modes. The behaviour
of FAN_CONFIG_{1_2,3_4} and FAN_COMMAND_[1-4] are tightly coupled, and
their interactions do not fit the existing use of struct pmbus_sensor.
The patch introduces struct pmbus_fan_ctrl to distinguish from the
simple sensor case, along with associated sysfs show/set implementations.

Further, the interpreting the value of FAN_COMMAND_[1-4] depends on both
the current fan mode (RPM or PWM, as configured in
FAN_CONFIG_{1_2,3_4}), and the device-specific behaviour for the
register. For example, the MAX31785 chip defines the following:

PWM (m = 1, b = 0, R = 2):
         0x0000 - 0x2710: 0 - 100% fan PWM duty cycle
         0x2711 - 0x7fff: 100% fan PWM duty cycle
         0x8000 - 0xffff: Ignore FAN_COMMAND_[1-4], use automatic fan control

RPM (m = 1, b = 0, R = 0):
         0x0000 - 0x7FFF: 0 - 32,767 RPM
         0x8000 - 0xFFFF: Ignore FAN_COMMAND_[1-4], use automatic fan control

To handle the device-specific interpretation of the FAN_COMMAND_[1-4],
add an optional callbacks to the info struct to get/set the 'mode'
value required for the pwm[1-n]_enable sysfs attribute. A fallback
calculation exists if the callbacks are not populated; the fallback
ignores device-specific ranges and tries to determine a reasonable value
from FAN_CONFIG_{1_2,3_4} and FAN_COMMAND_[1-4].

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/hwmon/pmbus/pmbus.h      |   7 +
 drivers/hwmon/pmbus/pmbus_core.c | 335 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 342 insertions(+)

diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index bfcb13bae34b..927eabc1b273 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -223,6 +223,8 @@ enum pmbus_regs {
 #define PB_FAN_1_RPM			BIT(6)
 #define PB_FAN_1_INSTALLED		BIT(7)
 
+enum pmbus_fan_mode { percent = 0, rpm };
+
 /*
  * STATUS_BYTE, STATUS_WORD (lower)
  */
@@ -380,6 +382,11 @@ struct pmbus_driver_info {
 	int (*identify)(struct i2c_client *client,
 			struct pmbus_driver_info *info);
 
+	/* Allow the driver to interpret the fan command value */
+	int (*get_pwm_mode)(int id, u8 fan_config, u16 fan_command);
+	int (*set_pwm_mode)(int id, long mode, u8 *fan_config,
+			    u16 *fan_command);
+
 	/* Regulator functionality, if supported by this chip driver. */
 	int num_regulators;
 	const struct regulator_desc *reg_desc;
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index ba59eaef2e07..3b0a55bbbd2c 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -69,6 +69,38 @@ struct pmbus_sensor {
 #define to_pmbus_sensor(_attr) \
 	container_of(_attr, struct pmbus_sensor, attribute)
 
+#define PB_FAN_CONFIG_RPM		PB_FAN_2_RPM
+#define PB_FAN_CONFIG_INSTALLED		PB_FAN_2_INSTALLED
+#define PB_FAN_CONFIG_MASK(i)		(0xff << (4 * !((i) & 1)))
+#define PB_FAN_CONFIG_GET(i, n)		(((n) >> (4 * !((i) & 1))) & 0xff)
+#define PB_FAN_CONFIG_PUT(i, n)		(((n) & 0xff) << (4 * !((i) & 1)))
+
+struct pmbus_fan_ctrl_attr {
+	struct device_attribute attribute;
+	char name[PMBUS_NAME_SIZE];
+};
+
+struct pmbus_fan_ctrl {
+	struct pmbus_fan_ctrl_attr fan_target;
+	struct pmbus_fan_ctrl_attr pwm;
+	struct pmbus_fan_ctrl_attr pwm_enable;
+	int index;
+	u8 page;
+	u8 id;
+	u8 config;
+	u16 command;
+};
+#define to_pmbus_fan_ctrl_attr(_attr) \
+	container_of(_attr, struct pmbus_fan_ctrl_attr, attribute)
+#define fan_target_to_pmbus_fan_ctrl(_attr) \
+	container_of(to_pmbus_fan_ctrl_attr(_attr), struct pmbus_fan_ctrl, \
+			fan_target)
+#define pwm_to_pmbus_fan_ctrl(_attr) \
+	container_of(to_pmbus_fan_ctrl_attr(_attr), struct pmbus_fan_ctrl, pwm)
+#define pwm_enable_to_pmbus_fan_ctrl(_attr) \
+	container_of(to_pmbus_fan_ctrl_attr(_attr), struct pmbus_fan_ctrl, \
+			pwm_enable)
+
 struct pmbus_boolean {
 	char name[PMBUS_NAME_SIZE];	/* sysfs boolean name */
 	struct sensor_device_attribute attribute;
@@ -806,6 +838,219 @@ static ssize_t pmbus_show_label(struct device *dev,
 	return snprintf(buf, PAGE_SIZE, "%s\n", label->label);
 }
 
+static ssize_t pmbus_show_fan_command(struct device *dev,
+				      enum pmbus_fan_mode mode,
+				      struct pmbus_fan_ctrl *fan, char *buf)
+{
+	struct i2c_client *client = to_i2c_client(dev->parent);
+	struct pmbus_data *data = i2c_get_clientdata(client);
+	struct pmbus_sensor sensor;
+	long val;
+
+	mutex_lock(&data->update_lock);
+
+	if ((mode == percent && (fan->config & PB_FAN_CONFIG_RPM)) ||
+			(mode == rpm && !(fan->config & PB_FAN_CONFIG_RPM))) {
+		mutex_unlock(&data->update_lock);
+		return -ENOTSUPP; /* XXX: This seems dodgy, but what to do? */
+	}
+
+	sensor.class = PSC_FAN;
+	if (mode == percent)
+		sensor.data = fan->command * 255 / 100;
+	else
+		sensor.data = fan->command;
+
+	val = pmbus_reg2data(data, &sensor);
+
+	mutex_unlock(&data->update_lock);
+
+	return snprintf(buf, PAGE_SIZE, "%ld\n", val);
+}
+
+static ssize_t pmbus_show_fan_target(struct device *dev,
+				     struct device_attribute *da, char *buf)
+{
+	return pmbus_show_fan_command(dev, rpm,
+				      fan_target_to_pmbus_fan_ctrl(da), buf);
+}
+
+static ssize_t pmbus_show_pwm(struct device *dev,
+			      struct device_attribute *da, char *buf)
+{
+	return pmbus_show_fan_command(dev, percent, pwm_to_pmbus_fan_ctrl(da),
+				      buf);
+}
+
+static ssize_t pmbus_set_fan_command(struct device *dev,
+				     enum pmbus_fan_mode mode,
+				     struct pmbus_fan_ctrl *fan,
+				     const char *buf, ssize_t count)
+{
+	struct i2c_client *client = to_i2c_client(dev->parent);
+	struct pmbus_data *data = i2c_get_clientdata(client);
+	int config_addr, command_addr;
+	struct pmbus_sensor sensor;
+	ssize_t rv;
+	long val;
+
+	if (kstrtol(buf, 10, &val) < 0)
+		return -EINVAL;
+
+	mutex_lock(&data->update_lock);
+
+	sensor.class = PSC_FAN;
+
+	val = pmbus_data2reg(data, &sensor, val);
+
+	if (mode == percent)
+		val = val * 100 / 255;
+
+	config_addr = (fan->id < 2) ? PMBUS_FAN_CONFIG_12 : PMBUS_FAN_CONFIG_34;
+	command_addr = config_addr + 1 + (fan->id & 1);
+
+	if (mode == rpm)
+		fan->config |= PB_FAN_CONFIG_RPM;
+	else
+		fan->config &= ~PB_FAN_CONFIG_RPM;
+
+	rv = pmbus_update_byte_data(client, fan->page, config_addr,
+				    PB_FAN_CONFIG_PUT(fan->id, fan->config),
+				    PB_FAN_CONFIG_MASK(fan->id));
+	if (rv < 0)
+		goto done;
+
+	fan->command = val;
+	rv = pmbus_write_word_data(client, fan->page, command_addr,
+				   fan->command);
+
+done:
+	mutex_unlock(&data->update_lock);
+
+	if (rv < 0)
+		return rv;
+
+	return count;
+}
+
+static ssize_t pmbus_set_fan_target(struct device *dev,
+				    struct device_attribute *da,
+				    const char *buf, size_t count)
+{
+	return pmbus_set_fan_command(dev, rpm,
+				     fan_target_to_pmbus_fan_ctrl(da), buf,
+				     count);
+}
+
+static ssize_t pmbus_set_pwm(struct device *dev, struct device_attribute *da,
+			     const char *buf, size_t count)
+{
+	return pmbus_set_fan_command(dev, percent, pwm_to_pmbus_fan_ctrl(da),
+				     buf, count);
+}
+
+static ssize_t pmbus_show_pwm_enable(struct device *dev,
+				     struct device_attribute *da, char *buf)
+{
+	struct pmbus_fan_ctrl *fan = pwm_enable_to_pmbus_fan_ctrl(da);
+	struct i2c_client *client = to_i2c_client(dev->parent);
+	struct pmbus_data *data = i2c_get_clientdata(client);
+	long mode;
+
+	mutex_lock(&data->update_lock);
+
+
+	if (data->info->get_pwm_mode) {
+		u8 config = PB_FAN_CONFIG_PUT(fan->id, fan->config);
+
+		mode = data->info->get_pwm_mode(fan->id, config, fan->command);
+	} else {
+		struct pmbus_sensor sensor = {
+			.class = PSC_FAN,
+			.data = fan->command,
+		};
+		long command;
+
+		command = pmbus_reg2data(data, &sensor);
+
+		/* XXX: Need to do something sensible */
+		if (fan->config & PB_FAN_CONFIG_RPM)
+			mode = 2;
+		else
+			mode = (command >= 0 && command < 100);
+	}
+
+	mutex_unlock(&data->update_lock);
+
+	return snprintf(buf, PAGE_SIZE, "%ld\n", mode);
+}
+
+static ssize_t pmbus_set_pwm_enable(struct device *dev,
+				    struct device_attribute *da,
+				    const char *buf, size_t count)
+{
+	struct pmbus_fan_ctrl *fan = pwm_enable_to_pmbus_fan_ctrl(da);
+	struct i2c_client *client = to_i2c_client(dev->parent);
+	struct pmbus_data *data = i2c_get_clientdata(client);
+	int config_addr, command_addr;
+	struct pmbus_sensor sensor;
+	ssize_t rv = count;
+	long mode;
+
+	if (kstrtol(buf, 10, &mode) < 0)
+		return -EINVAL;
+
+	mutex_lock(&data->update_lock);
+
+	sensor.class = PSC_FAN;
+
+	config_addr = (fan->id < 2) ? PMBUS_FAN_CONFIG_12 : PMBUS_FAN_CONFIG_34;
+	command_addr = config_addr + 1 + (fan->id & 1);
+
+	if (data->info->set_pwm_mode) {
+		u8 config = PB_FAN_CONFIG_PUT(fan->id, fan->config);
+		u16 command = fan->command;
+
+		rv = data->info->set_pwm_mode(fan->id, mode, &config, &command);
+		if (rv < 0)
+			goto done;
+
+		fan->config = PB_FAN_CONFIG_GET(fan->id, config);
+		fan->command = command;
+	} else {
+		fan->config &= ~PB_FAN_CONFIG_RPM;
+		switch (mode) {
+		case 0:
+		case 1:
+			/* XXX: Safe at least? */
+			fan->command = pmbus_data2reg(data, &sensor, 100);
+			break;
+		case 2:
+		default:
+			/* XXX: Safe at least? */
+			fan->command = 0xffff;
+			break;
+		}
+	}
+
+	rv = pmbus_update_byte_data(client, fan->page, config_addr,
+				    PB_FAN_CONFIG_PUT(fan->id, fan->config),
+				    PB_FAN_CONFIG_MASK(fan->id));
+	if (rv < 0)
+		goto done;
+
+	rv = pmbus_write_word_data(client, fan->page, command_addr,
+				   fan->command);
+
+done:
+	mutex_unlock(&data->update_lock);
+
+	if (rv < 0)
+		return rv;
+
+	return count;
+}
+
 static int pmbus_add_attribute(struct pmbus_data *data, struct attribute *attr)
 {
 	if (data->num_attributes >= data->max_attributes - 1) {
@@ -1094,6 +1339,51 @@ static int pmbus_add_sensor_attrs(struct i2c_client *client,
 	return 0;
 }
 
+static int pmbus_add_fan_ctrl_attr(struct pmbus_data *data,
+				   struct pmbus_fan_ctrl_attr *fa,
+				   const char *name_fmt,
+				   ssize_t (*show)(struct device *dev,
+					   struct device_attribute *attr,
+					   char *buf),
+				   ssize_t (*store)(struct device *dev,
+					   struct device_attribute *attr,
+					   const char *buf, size_t count),
+				   int idx)
+{
+	struct device_attribute *da;
+
+	da = &fa->attribute;
+
+	snprintf(fa->name, sizeof(fa->name), name_fmt, idx);
+	pmbus_dev_attr_init(da, fa->name, 0644, show, store);
+
+	return pmbus_add_attribute(data, &da->attr);
+}
+
+static inline int pmbus_add_fan_target_attr(struct pmbus_data *data,
+					    struct pmbus_fan_ctrl *fan)
+{
+	return pmbus_add_fan_ctrl_attr(data, &fan->fan_target, "fan%d_target",
+				       pmbus_show_fan_target,
+				       pmbus_set_fan_target, fan->index);
+}
+
+static inline int pmbus_add_pwm_attr(struct pmbus_data *data,
+				     struct pmbus_fan_ctrl *fan)
+{
+
+	return pmbus_add_fan_ctrl_attr(data, &fan->pwm, "pwm%d", pmbus_show_pwm,
+				       pmbus_set_pwm, fan->index);
+}
+
+static inline int pmbus_add_pwm_enable_attr(struct pmbus_data *data,
+					    struct pmbus_fan_ctrl *fan)
+{
+	return pmbus_add_fan_ctrl_attr(data, &fan->pwm_enable, "pwm%d_enable",
+				       pmbus_show_pwm_enable,
+				       pmbus_set_pwm_enable, fan->index);
+}
+
 static const struct pmbus_limit_attr vin_limit_attrs[] = {
 	{
 		.reg = PMBUS_VIN_UV_WARN_LIMIT,
@@ -1565,6 +1855,13 @@ static const int pmbus_fan_config_registers[] = {
 	PMBUS_FAN_CONFIG_34
 };
 
+static const int pmbus_fan_command_registers[] = {
+	PMBUS_FAN_COMMAND_1,
+	PMBUS_FAN_COMMAND_2,
+	PMBUS_FAN_COMMAND_3,
+	PMBUS_FAN_COMMAND_4,
+};
+
 static const int pmbus_fan_status_registers[] = {
 	PMBUS_STATUS_FAN_12,
 	PMBUS_STATUS_FAN_12,
@@ -1587,6 +1884,39 @@ static const u32 pmbus_fan_status_flags[] = {
 };
 
 /* Fans */
+static int pmbus_add_fan_ctrl(struct i2c_client *client,
+		struct pmbus_data *data, int index, int page, int id,
+		u8 config)
+{
+	struct pmbus_fan_ctrl *fan;
+	int rv;
+
+	fan = devm_kzalloc(data->dev, sizeof(*fan), GFP_KERNEL);
+	if (!fan)
+		return -ENOMEM;
+
+	fan->index = index;
+	fan->page = page;
+	fan->id = id;
+	fan->config = config;
+
+	rv = _pmbus_read_word_data(client, page,
+			pmbus_fan_command_registers[id]);
+	if (rv < 0)
+		return rv;
+	fan->command = rv;
+
+	rv = pmbus_add_fan_target_attr(data, fan);
+	if (rv < 0)
+		return rv;
+
+	rv = pmbus_add_pwm_attr(data, fan);
+	if (rv < 0)
+		return rv;
+
+	return pmbus_add_pwm_enable_attr(data, fan);
+}
+
 static int pmbus_add_fan_attributes(struct i2c_client *client,
 				    struct pmbus_data *data)
 {
@@ -1624,6 +1954,11 @@ static int pmbus_add_fan_attributes(struct i2c_client *client,
 					     PSC_FAN, true, true) == NULL)
 				return -ENOMEM;
 
+			ret = pmbus_add_fan_ctrl(client, data, index, page, f,
+						 regval);
+			if (ret < 0)
+				return ret;
+
 			/*
 			 * Each fan status register covers multiple fans,
 			 * so we have to do some magic.
-- 
2.11.0
