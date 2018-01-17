Return-Path: <mine260309@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c00::242; helo=mail-pf0-x242.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="d7xpuQX0"; 
 dkim-atps=neutral
Received: from mail-pf0-x242.google.com (mail-pf0-x242.google.com
 [IPv6:2607:f8b0:400e:c00::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zLtlB4NWyzF0W9
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jan 2018 15:04:38 +1100 (AEDT)
Received: by mail-pf0-x242.google.com with SMTP id t12so10847477pfg.2
 for <openbmc@lists.ozlabs.org>; Tue, 16 Jan 2018 20:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id;
 bh=3YlMvhpyuwf8RImLnwOl06qRwbE0xymaYJhDLpVjqr0=;
 b=d7xpuQX0KPkdeKv5rJdzwPqc+8oY2HuPud2es6oi0GEnUVG9IsODvHG27J6Rryczga
 92383Iims24VKZDxeI2MTi1F9RSdhez5Zzvcba2+z37ORRF0iaS8p49bUhZCJesptZ2e
 iue7bTQda4UcqQk9DfImopc5OhZRty7Oa8BoJDLuChN3rZH6PDD7q5MGLfNIxx/OPFdq
 /ApTasRWfBOu0gQo4Jz3FT3JK1WuLvLW0wVMaqfgt8D060Z4G4spdfJGwij+BP92CBnG
 n18swGJRdpCdCKuWifT5+P5PsNiz5mFEva+WKcckmRM20i0b2tu383XH1ar+Y4au0Tzm
 MuOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=3YlMvhpyuwf8RImLnwOl06qRwbE0xymaYJhDLpVjqr0=;
 b=hcl327KB4n7kr2fGhS6yDVCDxLa+mecjyVE7bpwGOUPGaXmu/SNjfwYbmt8N7KewKy
 nzD3ZXaezU0PBVJiWQ3JA6vjRMvHfmec76cEDnpFOvBTwIqXURu+OkY5sei7yl5L653k
 bib49OZ3fEB2ShP+Kb1PFMwj7XYHQ8HxxNyxrYgRWa81Dc962ESNCuCEWB73B30acYBs
 pSRkWQXSPO6ID6ZoyVBSo7a96cxFkFOwtxqwoadxGDIqYlk+FYVZ7spZJt56SMOVk9TW
 p3+FLWy/0KTAKYRgFJ5BaP3TKOhD0fFoExH3TUlbD6DIV9hAUqvxwoYSAuaQhXUxZvz4
 z5CQ==
X-Gm-Message-State: AKGB3mLw/783HSHzMt5ZWKTR/B7LmmIXFAWKCyxWbEBiqT8aoX8eMzvr
 toUiE0vvmH/gdSyKMZz8mpm7kWOF
X-Google-Smtp-Source: ACJfBougIKB2rKgo3WaBzMETcRrytV1ZqWn+boPt+IPHv4OKJ9Pu1+eBgg+5aa/oRmjPgKqE6KbauA==
X-Received: by 10.99.181.73 with SMTP id u9mr28549076pgo.377.1516161875732;
 Tue, 16 Jan 2018 20:04:35 -0800 (PST)
Received: from localhost ([159.203.222.251])
 by smtp.gmail.com with ESMTPSA id 13sm7542576pfs.112.2018.01.16.20.04.19
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=AES128-SHA bits=128/128);
 Tue, 16 Jan 2018 20:04:21 -0800 (PST)
From: Lei YU <mine260309@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 1/3] hwmon: Add W83773G driver
Date: Wed, 17 Jan 2018 12:04:00 +0800
Message-Id: <1516161842-16203-1-git-send-email-mine260309@gmail.com>
X-Mailer: git-send-email 1.9.1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Jan 2018 04:04:39 -0000

Nuvoton W83773G is a hardware monitor IC providing one local
temperature and two remote temperature sensors.

Signed-off-by: Lei YU <mine260309@gmail.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/Kconfig   |  10 ++
 drivers/hwmon/Makefile  |   1 +
 drivers/hwmon/w83773g.c | 329 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 340 insertions(+)
 create mode 100644 drivers/hwmon/w83773g.c

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 9256dd0..fb0fa33 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1703,6 +1703,16 @@ config SENSORS_VT8231
 	  This driver can also be built as a module.  If so, the module
 	  will be called vt8231.
 
+config SENSORS_W83773G
+	tristate "Nuvoton W83773G"
+	depends on I2C
+	help
+	  If you say yes here you get support for the Nuvoton W83773G hardware
+	  monitoring chip.
+
+	  This driver can also be built as a module.  If so, the module
+	  will be called w83773g.
+
 config SENSORS_W83781D
 	tristate "Winbond W83781D, W83782D, W83783S, Asus AS99127F"
 	depends on I2C
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 98000fc..fc26696 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -13,6 +13,7 @@ obj-$(CONFIG_SENSORS_ATK0110)	+= asus_atk0110.o
 # asb100, then w83781d go first, as they can override other drivers' addresses.
 obj-$(CONFIG_SENSORS_ASB100)	+= asb100.o
 obj-$(CONFIG_SENSORS_W83627HF)	+= w83627hf.o
+obj-$(CONFIG_SENSORS_W83773G)	+= w83773g.o
 obj-$(CONFIG_SENSORS_W83792D)	+= w83792d.o
 obj-$(CONFIG_SENSORS_W83793)	+= w83793.o
 obj-$(CONFIG_SENSORS_W83795)	+= w83795.o
diff --git a/drivers/hwmon/w83773g.c b/drivers/hwmon/w83773g.c
new file mode 100644
index 0000000..0b97c28
--- /dev/null
+++ b/drivers/hwmon/w83773g.c
@@ -0,0 +1,329 @@
+/*
+ * Copyright (C) 2017 IBM Corp.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * Driver for the Nuvoton W83773G SMBus temperature sensor IC.
+ * Supported models: W83773G
+ */
+
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/i2c.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/err.h>
+#include <linux/of_device.h>
+#include <linux/regmap.h>
+
+/* W83773 has 3 channels */
+#define W83773_CHANNELS				3
+
+/* The W83773 registers */
+#define W83773_CONVERSION_RATE_REG_READ		0x04
+#define W83773_CONVERSION_RATE_REG_WRITE	0x0A
+#define W83773_MANUFACTURER_ID_REG		0xFE
+#define W83773_LOCAL_TEMP			0x00
+
+static const u8 W83773_STATUS[2] = { 0x02, 0x17 };
+
+static const u8 W83773_TEMP_LSB[2] = { 0x10, 0x25 };
+static const u8 W83773_TEMP_MSB[2] = { 0x01, 0x24 };
+
+static const u8 W83773_OFFSET_LSB[2] = { 0x12, 0x16 };
+static const u8 W83773_OFFSET_MSB[2] = { 0x11, 0x15 };
+
+/* this is the number of sensors in the device */
+static const struct i2c_device_id w83773_id[] = {
+	{ "w83773g" },
+	{ }
+};
+
+MODULE_DEVICE_TABLE(i2c, w83773_id);
+
+static const struct of_device_id w83773_of_match[] = {
+	{
+		.compatible = "nuvoton,w83773g"
+	},
+	{ },
+};
+MODULE_DEVICE_TABLE(of, w83773_of_match);
+
+static inline long temp_of_local(s8 reg)
+{
+	return reg * 1000;
+}
+
+static inline long temp_of_remote(s8 hb, u8 lb)
+{
+	return (hb << 3 | lb >> 5) * 125;
+}
+
+static int get_local_temp(struct regmap *regmap, long *val)
+{
+	unsigned int regval;
+	int ret;
+
+	ret = regmap_read(regmap, W83773_LOCAL_TEMP, &regval);
+	if (ret < 0)
+		return ret;
+
+	*val = temp_of_local(regval);
+	return 0;
+}
+
+static int get_remote_temp(struct regmap *regmap, int index, long *val)
+{
+	unsigned int regval_high;
+	unsigned int regval_low;
+	int ret;
+
+	ret = regmap_read(regmap, W83773_TEMP_MSB[index], &regval_high);
+	if (ret < 0)
+		return ret;
+
+	ret = regmap_read(regmap, W83773_TEMP_LSB[index], &regval_low);
+	if (ret < 0)
+		return ret;
+
+	*val = temp_of_remote(regval_high, regval_low);
+	return 0;
+}
+
+static int get_fault(struct regmap *regmap, int index, long *val)
+{
+	unsigned int regval;
+	int ret;
+
+	ret = regmap_read(regmap, W83773_STATUS[index], &regval);
+	if (ret < 0)
+		return ret;
+
+	*val = (u8)regval & 0x04 >> 2;
+	return 0;
+}
+
+static int get_offset(struct regmap *regmap, int index, long *val)
+{
+	unsigned int regval_high;
+	unsigned int regval_low;
+	int ret;
+
+	ret = regmap_read(regmap, W83773_OFFSET_MSB[index], &regval_high);
+	if (ret < 0)
+		return ret;
+
+	ret = regmap_read(regmap, W83773_OFFSET_LSB[index], &regval_low);
+	if (ret < 0)
+		return ret;
+
+	*val = temp_of_remote(regval_high, regval_low);
+	return 0;
+}
+
+static int set_offset(struct regmap *regmap, int index, long val)
+{
+	int ret;
+	u8 high_byte;
+	u8 low_byte;
+
+	val = clamp_val(val, -127825, 127825);
+	/* offset value equals to (high_byte << 3 | low_byte >> 5) * 125 */
+	val /= 125;
+	high_byte = val >> 3;
+	low_byte = (val & 0x07) << 5;
+
+	ret = regmap_write(regmap, W83773_OFFSET_MSB[index], high_byte);
+	if (ret < 0)
+		return ret;
+
+	return regmap_write(regmap, W83773_OFFSET_LSB[index], low_byte);
+}
+
+static int get_update_interval(struct regmap *regmap, long *val)
+{
+	unsigned int regval;
+	int ret;
+
+	ret = regmap_read(regmap, W83773_CONVERSION_RATE_REG_READ, &regval);
+	if (ret < 0)
+		return ret;
+
+	*val = 16000 >> regval;
+	return 0;
+}
+
+static int set_update_interval(struct regmap *regmap, long val)
+{
+	int rate;
+
+	/*
+	 * For valid rates, interval can be calculated as
+	 *	interval = (1 << (8 - rate)) * 62.5;
+	 * Rounded rate is therefore
+	 *	rate = 8 - __fls(interval * 8 / (62.5 * 7));
+	 * Use clamp_val() to avoid overflows, and to ensure valid input
+	 * for __fls.
+	 */
+	val = clamp_val(val, 62, 16000) * 10;
+	rate = 8 - __fls((val * 8 / (625 * 7)));
+	return regmap_write(regmap, W83773_CONVERSION_RATE_REG_WRITE, rate);
+}
+
+static int w83773_read(struct device *dev, enum hwmon_sensor_types type,
+		       u32 attr, int channel, long *val)
+{
+	struct regmap *regmap = dev_get_drvdata(dev);
+
+	if (type == hwmon_chip) {
+		if (attr == hwmon_chip_update_interval)
+			return get_update_interval(regmap, val);
+		return -EOPNOTSUPP;
+	}
+
+	switch (attr) {
+	case hwmon_temp_input:
+		if (channel == 0)
+			return get_local_temp(regmap, val);
+		return get_remote_temp(regmap, channel - 1, val);
+	case hwmon_temp_fault:
+		return get_fault(regmap, channel - 1, val);
+	case hwmon_temp_offset:
+		return get_offset(regmap, channel - 1, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int w83773_write(struct device *dev, enum hwmon_sensor_types type,
+			u32 attr, int channel, long val)
+{
+	struct regmap *regmap = dev_get_drvdata(dev);
+
+	if (type == hwmon_chip && attr == hwmon_chip_update_interval)
+		return set_update_interval(regmap, val);
+
+	if (type == hwmon_temp && attr == hwmon_temp_offset)
+		return set_offset(regmap, channel - 1, val);
+
+	return -EOPNOTSUPP;
+}
+
+static umode_t w83773_is_visible(const void *data, enum hwmon_sensor_types type,
+				 u32 attr, int channel)
+{
+	switch (type) {
+	case hwmon_chip:
+		switch (attr) {
+		case hwmon_chip_update_interval:
+			return 0644;
+		}
+		break;
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_input:
+		case hwmon_temp_fault:
+			return 0444;
+		case hwmon_temp_offset:
+			return 0644;
+		}
+		break;
+	default:
+		break;
+	}
+	return 0;
+}
+
+static const u32 w83773_chip_config[] = {
+	HWMON_C_REGISTER_TZ | HWMON_C_UPDATE_INTERVAL,
+	0
+};
+
+static const struct hwmon_channel_info w83773_chip = {
+	.type = hwmon_chip,
+	.config = w83773_chip_config,
+};
+
+static const u32 w83773_temp_config[] = {
+	HWMON_T_INPUT,
+	HWMON_T_INPUT | HWMON_T_FAULT | HWMON_T_OFFSET,
+	HWMON_T_INPUT | HWMON_T_FAULT | HWMON_T_OFFSET,
+	0
+};
+
+static const struct hwmon_channel_info w83773_temp = {
+	.type = hwmon_temp,
+	.config = w83773_temp_config,
+};
+
+static const struct hwmon_channel_info *w83773_info[] = {
+	&w83773_chip,
+	&w83773_temp,
+	NULL
+};
+
+static const struct hwmon_ops w83773_ops = {
+	.is_visible = w83773_is_visible,
+	.read = w83773_read,
+	.write = w83773_write,
+};
+
+static const struct hwmon_chip_info w83773_chip_info = {
+	.ops = &w83773_ops,
+	.info = w83773_info,
+};
+
+static const struct regmap_config w83773_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+};
+
+static int w83773_probe(struct i2c_client *client,
+			const struct i2c_device_id *id)
+{
+	struct device *dev = &client->dev;
+	struct device *hwmon_dev;
+	struct regmap *regmap;
+	int ret;
+
+	regmap = devm_regmap_init_i2c(client, &w83773_regmap_config);
+	if (IS_ERR(regmap)) {
+		dev_err(dev, "failed to allocate register map\n");
+		return PTR_ERR(regmap);
+	}
+
+	/* Set the conversion rate to 2 Hz */
+	ret = regmap_write(regmap, W83773_CONVERSION_RATE_REG_WRITE, 0x05);
+	if (ret < 0) {
+		dev_err(&client->dev, "error writing config rate register\n");
+		return ret;
+	}
+
+	i2c_set_clientdata(client, regmap);
+
+	hwmon_dev = devm_hwmon_device_register_with_info(dev,
+							 client->name,
+							 regmap,
+							 &w83773_chip_info,
+							 NULL);
+	return PTR_ERR_OR_ZERO(hwmon_dev);
+}
+
+static struct i2c_driver w83773_driver = {
+	.class = I2C_CLASS_HWMON,
+	.driver = {
+		.name	= "w83773g",
+		.of_match_table = of_match_ptr(w83773_of_match),
+	},
+	.probe = w83773_probe,
+	.id_table = w83773_id,
+};
+
+module_i2c_driver(w83773_driver);
+
+MODULE_AUTHOR("Lei YU <mine260309@gmail.com>");
+MODULE_DESCRIPTION("W83773G temperature sensor driver");
+MODULE_LICENSE("GPL");
-- 
1.9.1
