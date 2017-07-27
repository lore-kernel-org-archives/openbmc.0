Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xJ5F15LJMzDrGr
 for <openbmc@lists.ozlabs.org>; Thu, 27 Jul 2017 18:46:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="GleBe8q5"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="DUsK/J4N"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 933262082A;
 Thu, 27 Jul 2017 04:46:43 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 27 Jul 2017 04:46:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=IEAL9e
 IAN0QmPyV4vPn21mpvwNBUreLbBgFNgxW0F94=; b=GleBe8q5lX3km9FjAsblYJ
 4qI2dLO6bIA2DKv0Y21ymVcE8pKOI9gC5w1jGhQQiAprjiOJ+ee9zsDWeH73X71y
 YNOrvo/cZ9U63YZeLRG1H50N+8yAQ+XnvP7aiIG6IrmBdNqRfJZ02J+/jVrbFvhK
 EEkYoavMf9qhlcGiuJ8ZFzLWjCl8ast1iVVyFCpwdCMVVOziQkTrmZreXKpJ9Djh
 wDtcZ/6/t3fJQta/bv4zOwUPiUSx+X1FmHQDk76NPBUrAi47pFxNsPyGHnwPotMg
 z5DaA1M3ckoizceGIsbxnBjakhdo7X6vQaoeOrXbYfmBDNvFKz7VQu7yR6+j/lkQ
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=IEAL9eIAN0QmPyV4vPn21mpvwNBUreLbBgFNgxW0F
 94=; b=DUsK/J4NF2ofHrLxfJf6NUnKF+PMSi63NCfNwT7KxTu2YRFfdcHM9brQR
 aZfztR+dQTCtO30g7Hka9HsFCsR3n8KIzvupG9JGCLclEwf+cj2zMD4T0+ei/BRE
 xBUxFq2iLL+D573N+JwcrX00SBEwivCjW4awnY49RYkx19JA0sFmTKlGAO+5QKMs
 pRkvtqzTvX1mwbiNZUOltcAZj8IVrmj2CudfOLGNWUaxep3aEh2JFIKweD/iUJBV
 PfPoE+ZVFMPXt0VbQ2qCx2Mz7dNOfK+mJIg/HVFcrO+bTbe08KoOi+64N7XMBi2o
 7qBzZemCd1ngyk9LtR7sORRy6j0/Q==
X-ME-Sender: <xms:c6h5WeBuNr0wnMpJ6BMAZORFXeIJ3AuDNdG-t4O39KGn4snbRH2hhA>
X-Sasl-enc: vjpH+pDseBDNqVNHgnwwbUNuse0o9qNqPhzIpZLEdkoW 1501145202
Received: from keelia.aj.id.au (ppp118-210-176-216.bras2.adl6.internode.on.net
 [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id 64317240AF;
 Thu, 27 Jul 2017 04:46:37 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, robh+dt@kernel.org, mark.rutland@arm.com,
 jdelvare@suse.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, joel@jms.id.au, mspinler@linux.vnet.ibm.com,
 msbarth@linux.vnet.ibm.com, openbmc@lists.ozlabs.org
Subject: [PATCH 2/3] hwmon: pmbus: Add fan control support
Date: Thu, 27 Jul 2017 18:15:53 +0930
Message-Id: <20170727084554.8794-3-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170727084554.8794-1-andrew@aj.id.au>
References: <20170727084554.8794-1-andrew@aj.id.au>
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
X-List-Received-Date: Thu, 27 Jul 2017 08:46:46 -0000

Expose fanX_target, pwmX and pwmX_enable hwmon sysfs attributes.

Fans in a PMBus device are driven by the configuration of two registers:
FAN_CONFIG_x_y and FAN_COMMAND_x: FAN_CONFIG_x_y dictates how the fan
and the tacho operate (if installed), while FAN_COMMAND_x sets the
desired fan rate. The unit of FAN_COMMAND_x is dependent on the
operational fan mode, RPM or PWM percent duty, as determined by the
corresponding FAN_CONFIG_x_y.

The mapping of fanX_target, pwmX and pwmX_enable onto FAN_CONFIG_x_y and
FAN_COMMAND_x is implemented with the addition of virtual registers and
generic implementations in the core:

1. PMBUS_VIRT_FAN_TARGET_x
2. PMBUS_VIRT_PWM_x
3. PMBUS_VIRT_PWM_ENABLE_x

The facilitate the necessary side-effects of each access. Examples of
the read case, assuming m = 1, b = 0, R = 0:

             Read     |              With              || Gives
         -------------------------------------------------------
           Attribute  | FAN_CONFIG_x_y | FAN_COMMAND_y || Value
         ----------------------------------------------++-------
          fanX_target | ~PB_FAN_z_RPM  | 0x0001        || 1
          pwm1        | ~PB_FAN_z_RPM  | 0x0064        || 255
          pwmX_enable | ~PB_FAN_z_RPM  | 0x0001        || 1
          fanX_target |  PB_FAN_z_RPM  | 0x0001        || 1
          pwm1        |  PB_FAN_z_RPM  | 0x0064        || 0
          pwmX_enable |  PB_FAN_z_RPM  | 0x0001        || 1

And the write case:

             Write    | With  ||               Sets
         -------------+-------++----------------+---------------
           Attribute  | Value || FAN_CONFIG_x_y | FAN_COMMAND_x
         -------------+-------++----------------+---------------
          fanX_target | 1     ||  PB_FAN_z_RPM  | 0x0001
          pwmX        | 255   || ~PB_FAN_z_RPM  | 0x0064
          pwmX_enable | 1     || ~PB_FAN_z_RPM  | 0x0064

Also, the DIRECT mode scaling of some controllers is different between
RPM and PWM percent duty control modes, so PSC_PWM is introduced to
capture the necessary coefficients.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/hwmon/pmbus/pmbus.h      |  29 +++++
 drivers/hwmon/pmbus/pmbus_core.c | 222 ++++++++++++++++++++++++++++++++++++---
 2 files changed, 236 insertions(+), 15 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index bfcb13bae34b..a863b8fed16f 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -190,6 +190,28 @@ enum pmbus_regs {
 	PMBUS_VIRT_VMON_UV_FAULT_LIMIT,
 	PMBUS_VIRT_VMON_OV_FAULT_LIMIT,
 	PMBUS_VIRT_STATUS_VMON,
+
+	/*
+	 * RPM and PWM Fan control
+	 *
+	 * Drivers wanting to expose PWM control must define the behaviour of
+	 * PMBUS_VIRT_PWM_ENABLE_[1-4] in the {read,write}_word_data callback.
+	 *
+	 * pmbus core provides default implementations for
+	 * PMBUS_VIRT_FAN_TARGET_[1-4] and PMBUS_VIRT_PWM_[1-4].
+	 */
+	PMBUS_VIRT_FAN_TARGET_1,
+	PMBUS_VIRT_FAN_TARGET_2,
+	PMBUS_VIRT_FAN_TARGET_3,
+	PMBUS_VIRT_FAN_TARGET_4,
+	PMBUS_VIRT_PWM_1,
+	PMBUS_VIRT_PWM_2,
+	PMBUS_VIRT_PWM_3,
+	PMBUS_VIRT_PWM_4,
+	PMBUS_VIRT_PWM_ENABLE_1,
+	PMBUS_VIRT_PWM_ENABLE_2,
+	PMBUS_VIRT_PWM_ENABLE_3,
+	PMBUS_VIRT_PWM_ENABLE_4,
 };
 
 /*
@@ -223,6 +245,8 @@ enum pmbus_regs {
 #define PB_FAN_1_RPM			BIT(6)
 #define PB_FAN_1_INSTALLED		BIT(7)
 
+enum pmbus_fan_mode { percent = 0, rpm };
+
 /*
  * STATUS_BYTE, STATUS_WORD (lower)
  */
@@ -313,6 +337,7 @@ enum pmbus_sensor_classes {
 	PSC_POWER,
 	PSC_TEMPERATURE,
 	PSC_FAN,
+	PSC_PWM,
 	PSC_NUM_CLASSES		/* Number of power sensor classes */
 };
 
@@ -339,6 +364,8 @@ enum pmbus_sensor_classes {
 #define PMBUS_HAVE_STATUS_FAN34	BIT(17)
 #define PMBUS_HAVE_VMON		BIT(18)
 #define PMBUS_HAVE_STATUS_VMON	BIT(19)
+#define PMBUS_HAVE_PWM12	BIT(20)
+#define PMBUS_HAVE_PWM34	BIT(21)
 
 enum pmbus_data_format { linear = 0, direct, vid };
 enum vrm_version { vr11 = 0, vr12 };
@@ -413,6 +440,8 @@ int pmbus_write_byte_data(struct i2c_client *client, int page, u8 reg,
 			  u8 value);
 int pmbus_update_byte_data(struct i2c_client *client, int page, u8 reg,
 			   u8 mask, u8 value);
+int pmbus_update_fan(struct i2c_client *client, int page, int id,
+		     u8 config, u8 mask, u16 command);
 void pmbus_clear_faults(struct i2c_client *client);
 bool pmbus_check_byte_register(struct i2c_client *client, int page, int reg);
 bool pmbus_check_word_register(struct i2c_client *client, int page, int reg);
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index ba59eaef2e07..3c8bcbdf1d88 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -63,6 +63,7 @@ struct pmbus_sensor {
 	u16 reg;		/* register */
 	enum pmbus_sensor_classes class;	/* sensor class */
 	bool update;		/* runtime sensor update needed */
+	bool convert;		/* Whether or not to apply linear/vid/direct */
 	int data;		/* Sensor data.
 				   Negative if there was a read error */
 };
@@ -118,6 +119,27 @@ struct pmbus_data {
 	u8 currpage;
 };
 
+static const int pmbus_fan_rpm_mask[] = {
+	PB_FAN_1_RPM,
+	PB_FAN_2_RPM,
+	PB_FAN_1_RPM,
+	PB_FAN_2_RPM,
+};
+
+static const int pmbus_fan_config_registers[] = {
+	PMBUS_FAN_CONFIG_12,
+	PMBUS_FAN_CONFIG_12,
+	PMBUS_FAN_CONFIG_34,
+	PMBUS_FAN_CONFIG_34
+};
+
+static const int pmbus_fan_command_registers[] = {
+	PMBUS_FAN_COMMAND_1,
+	PMBUS_FAN_COMMAND_2,
+	PMBUS_FAN_COMMAND_3,
+	PMBUS_FAN_COMMAND_4,
+};
+
 void pmbus_clear_cache(struct i2c_client *client)
 {
 	struct pmbus_data *data = i2c_get_clientdata(client);
@@ -188,6 +210,29 @@ int pmbus_write_word_data(struct i2c_client *client, u8 page, u8 reg, u16 word)
 }
 EXPORT_SYMBOL_GPL(pmbus_write_word_data);
 
+int pmbus_update_fan(struct i2c_client *client, int page, int id,
+			       u8 config, u8 mask, u16 command)
+{
+	int from, rv;
+	u8 to;
+
+	from = pmbus_read_byte_data(client, page,
+				    pmbus_fan_config_registers[id]);
+	if (from < 0)
+		return from;
+
+	to = (from & ~mask) | (config & mask);
+
+	rv = pmbus_write_byte_data(client, page,
+				   pmbus_fan_config_registers[id], to);
+	if (rv < 0)
+		return rv;
+
+	return pmbus_write_word_data(client, page,
+				     pmbus_fan_command_registers[id], command);
+}
+EXPORT_SYMBOL_GPL(pmbus_update_fan);
+
 /*
  * _pmbus_write_word_data() is similar to pmbus_write_word_data(), but checks if
  * a device specific mapping function exists and calls it if necessary.
@@ -204,8 +249,40 @@ static int _pmbus_write_word_data(struct i2c_client *client, int page, int reg,
 		if (status != -ENODATA)
 			return status;
 	}
-	if (reg >= PMBUS_VIRT_BASE)
-		return -ENXIO;
+	if (reg >= PMBUS_VIRT_BASE) {
+		int id, bit;
+
+		switch (reg) {
+		case PMBUS_VIRT_FAN_TARGET_1:
+		case PMBUS_VIRT_FAN_TARGET_2:
+		case PMBUS_VIRT_FAN_TARGET_3:
+		case PMBUS_VIRT_FAN_TARGET_4:
+			id = reg - PMBUS_VIRT_FAN_TARGET_1;
+			bit = pmbus_fan_rpm_mask[id];
+			status = pmbus_update_fan(client, page, id, bit, bit,
+						  word);
+			break;
+		case PMBUS_VIRT_PWM_1:
+		case PMBUS_VIRT_PWM_2:
+		case PMBUS_VIRT_PWM_3:
+		case PMBUS_VIRT_PWM_4:
+		{
+			u32 command = word;
+
+			id = reg - PMBUS_VIRT_PWM_1;
+			bit = pmbus_fan_rpm_mask[id];
+			command *= 100;
+			command /= 255;
+			status = pmbus_update_fan(client, page, id, 0, bit,
+						  command);
+			break;
+		}
+		default:
+			status = -ENXIO;
+			break;
+		}
+		return status;
+	}
 	return pmbus_write_word_data(client, page, reg, word);
 }
 
@@ -221,6 +298,9 @@ int pmbus_read_word_data(struct i2c_client *client, u8 page, u8 reg)
 }
 EXPORT_SYMBOL_GPL(pmbus_read_word_data);
 
+static int pmbus_get_fan_command(struct i2c_client *client, int page, int id,
+				 enum pmbus_fan_mode mode);
+
 /*
  * _pmbus_read_word_data() is similar to pmbus_read_word_data(), but checks if
  * a device specific mapping function exists and calls it if necessary.
@@ -236,8 +316,42 @@ static int _pmbus_read_word_data(struct i2c_client *client, int page, int reg)
 		if (status != -ENODATA)
 			return status;
 	}
-	if (reg >= PMBUS_VIRT_BASE)
-		return -ENXIO;
+	if (reg >= PMBUS_VIRT_BASE) {
+		int id;
+
+		switch (reg) {
+		case PMBUS_VIRT_FAN_TARGET_1:
+		case PMBUS_VIRT_FAN_TARGET_2:
+		case PMBUS_VIRT_FAN_TARGET_3:
+		case PMBUS_VIRT_FAN_TARGET_4:
+			id = reg - PMBUS_VIRT_FAN_TARGET_1;
+			status = pmbus_get_fan_command(client, page, id, rpm);
+			break;
+		case PMBUS_VIRT_PWM_1:
+		case PMBUS_VIRT_PWM_2:
+		case PMBUS_VIRT_PWM_3:
+		case PMBUS_VIRT_PWM_4:
+		{
+			int rv;
+
+			id = reg - PMBUS_VIRT_PWM_1;
+			rv = pmbus_get_fan_command(client, page, id, percent);
+			if (rv < 0)
+				return rv;
+
+			rv *= 255;
+			rv /= 100;
+
+			status = rv;
+			break;
+		}
+		default:
+			status = -ENXIO;
+			break;
+		}
+
+		return status;
+	}
 	return pmbus_read_word_data(client, page, reg);
 }
 
@@ -304,6 +418,28 @@ static int _pmbus_read_byte_data(struct i2c_client *client, int page, int reg)
 	return pmbus_read_byte_data(client, page, reg);
 }
 
+static int pmbus_get_fan_command(struct i2c_client *client, int page, int id,
+				 enum pmbus_fan_mode mode)
+{
+	int config;
+
+	config = _pmbus_read_byte_data(client, page,
+				       pmbus_fan_config_registers[id]);
+	if (config < 0)
+		return config;
+
+	/*
+	 * We can't meaningfully translate between PWM and RPM, so if the
+	 * attribute mode (fan[1-*]_target is RPM, pwm[1-*] and pwm[1-*]_enable
+	 * are PWM) doesn't match the hardware mode, then report 0 instead.
+	 */
+	if ((mode == rpm) != (!!(config & pmbus_fan_rpm_mask[id])))
+		return 0;
+
+	return _pmbus_read_word_data(client, page,
+				     pmbus_fan_command_registers[id]);
+}
+
 static void pmbus_clear_fault_page(struct i2c_client *client, int page)
 {
 	_pmbus_write_byte(client, page, PMBUS_CLEAR_FAULTS);
@@ -489,7 +625,7 @@ static long pmbus_reg2data_direct(struct pmbus_data *data,
 	/* X = 1/m * (Y * 10^-R - b) */
 	R = -R;
 	/* scale result to milli-units for everything but fans */
-	if (sensor->class != PSC_FAN) {
+	if (!(sensor->class == PSC_FAN || sensor->class == PSC_PWM)) {
 		R += 3;
 		b *= 1000;
 	}
@@ -539,6 +675,9 @@ static long pmbus_reg2data(struct pmbus_data *data, struct pmbus_sensor *sensor)
 {
 	long val;
 
+	if (!sensor->convert)
+		return sensor->data;
+
 	switch (data->info->format[sensor->class]) {
 	case direct:
 		val = pmbus_reg2data_direct(data, sensor);
@@ -642,7 +781,7 @@ static u16 pmbus_data2reg_direct(struct pmbus_data *data,
 	}
 
 	/* Calculate Y = (m * X + b) * 10^R */
-	if (sensor->class != PSC_FAN) {
+	if (!(sensor->class == PSC_FAN || sensor->class == PSC_PWM)) {
 		R -= 3;		/* Adjust R and b for data in milli-units */
 		b *= 1000;
 	}
@@ -673,6 +812,9 @@ static u16 pmbus_data2reg(struct pmbus_data *data,
 {
 	u16 regval;
 
+	if (!sensor->convert)
+		return val;
+
 	switch (data->info->format[sensor->class]) {
 	case direct:
 		regval = pmbus_data2reg_direct(data, sensor, val);
@@ -895,12 +1037,18 @@ static struct pmbus_sensor *pmbus_add_sensor(struct pmbus_data *data,
 		return NULL;
 	a = &sensor->attribute;
 
-	snprintf(sensor->name, sizeof(sensor->name), "%s%d_%s",
-		 name, seq, type);
+	if (type)
+		snprintf(sensor->name, sizeof(sensor->name), "%s%d_%s",
+			 name, seq, type);
+	else
+		snprintf(sensor->name, sizeof(sensor->name), "%s%d",
+			 name, seq);
+
 	sensor->page = page;
 	sensor->reg = reg;
 	sensor->class = class;
 	sensor->update = update;
+	sensor->convert = true;
 	pmbus_dev_attr_init(a, sensor->name,
 			    readonly ? S_IRUGO : S_IRUGO | S_IWUSR,
 			    pmbus_show_sensor, pmbus_set_sensor);
@@ -1558,13 +1706,6 @@ static const int pmbus_fan_registers[] = {
 	PMBUS_READ_FAN_SPEED_4
 };
 
-static const int pmbus_fan_config_registers[] = {
-	PMBUS_FAN_CONFIG_12,
-	PMBUS_FAN_CONFIG_12,
-	PMBUS_FAN_CONFIG_34,
-	PMBUS_FAN_CONFIG_34
-};
-
 static const int pmbus_fan_status_registers[] = {
 	PMBUS_STATUS_FAN_12,
 	PMBUS_STATUS_FAN_12,
@@ -1587,6 +1728,48 @@ static const u32 pmbus_fan_status_flags[] = {
 };
 
 /* Fans */
+static int pmbus_add_fan_ctrl(struct i2c_client *client,
+		struct pmbus_data *data, int index, int page, int id,
+		u8 config)
+{
+	struct pmbus_sensor *sensor;
+	int rv;
+
+	rv = _pmbus_read_word_data(client, page,
+				   pmbus_fan_command_registers[id]);
+	if (rv < 0)
+		return rv;
+
+	sensor = pmbus_add_sensor(data, "fan", "target", index, page,
+				  PMBUS_VIRT_FAN_TARGET_1 + id, PSC_FAN,
+				  true, false);
+
+	if (!sensor)
+		return -ENOMEM;
+
+	if (!((data->info->func[page] & PMBUS_HAVE_PWM12) ||
+			(data->info->func[page] & PMBUS_HAVE_PWM34)))
+		return 0;
+
+	sensor = pmbus_add_sensor(data, "pwm", NULL, index, page,
+				  PMBUS_VIRT_PWM_1 + id, PSC_PWM,
+				  true, false);
+
+	if (!sensor)
+		return -ENOMEM;
+
+	sensor = pmbus_add_sensor(data, "pwm", "enable", index, page,
+				  PMBUS_VIRT_PWM_ENABLE_1 + id, PSC_PWM,
+				  true, false);
+
+	if (!sensor)
+		return -ENOMEM;
+
+	sensor->convert = false;
+
+	return 0;
+}
+
 static int pmbus_add_fan_attributes(struct i2c_client *client,
 				    struct pmbus_data *data)
 {
@@ -1624,6 +1807,15 @@ static int pmbus_add_fan_attributes(struct i2c_client *client,
 					     PSC_FAN, true, true) == NULL)
 				return -ENOMEM;
 
+			/* Fan control */
+			if (pmbus_check_word_register(client, page,
+					pmbus_fan_command_registers[f])) {
+				ret = pmbus_add_fan_ctrl(client, data, index,
+							 page, f, regval);
+				if (ret < 0)
+					return ret;
+			}
+
 			/*
 			 * Each fan status register covers multiple fans,
 			 * so we have to do some magic.
-- 
2.11.0
