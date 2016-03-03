Return-Path: <adamliyi@msn.com>
X-Greylist: delayed 313 seconds by postgrey-1.35 at bilbo;
 Thu, 03 Mar 2016 16:13:33 AEDT
Received: from BLU004-OMC2S3.hotmail.com (blu004-omc2s3.hotmail.com
 [65.55.111.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 8ED6C1A0060
 for <openbmc@lists.ozlabs.org>; Thu,  3 Mar 2016 16:13:33 +1100 (AEDT)
Received: from BLU436-SMTP81 ([65.55.111.72]) by BLU004-OMC2S3.hotmail.com
 over TLS secured channel with Microsoft SMTPSVC(7.5.7601.23008); 
 Wed, 2 Mar 2016 21:08:16 -0800
X-TMN: [BuxE/pZD1TwKYIemQNZaPr+FR8EMUbtz]
X-Originating-Email: [adamliyi@msn.com]
Message-ID: <BLU436-SMTP813B0A91E6A878CE72C805D9BD0@phx.gbl>
Date: Thu, 3 Mar 2016 13:07:55 +0800
From: Yi Li <adamliyi@msn.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH] hwmon: Add adm1278 support in adm1275 hwmon pmbus driver
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
X-OriginalArrivalTime: 03 Mar 2016 05:08:15.0733 (UTC)
 FILETIME=[B16DA250:01D1750A]
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
X-List-Received-Date: Thu, 03 Mar 2016 05:13:34 -0000

This patch adds adm1278 Hot Swap Controller and Digital Power and
Energy Monitor support in the adm1275 hwmon pmbus driver.
The patch enables reading adm1278 sensors via hwmon sysfs interface.
The enabled sensors are: current, voltage (In and Out), power and temperature.

Signed-off-by: Yi Li <adamliyi@msn.com>
---
 drivers/hwmon/pmbus/Kconfig   |   4 +-
 drivers/hwmon/pmbus/adm1275.c | 102 ++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 100 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index df6ebb2..ea8a50f 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -31,8 +31,8 @@ config SENSORS_ADM1275
 	default n
 	help
 	  If you say yes here you get hardware monitoring support for Analog
-	  Devices ADM1075, ADM1275, ADM1276, ADM1293, and ADM1294 Hot-Swap
-	  Controller and Digital Power Monitors.
+	  Devices ADM1075, ADM1275, ADM1276, ADM1278, ADM1293, and ADM1294
+	  Hot-Swap Controller and Digital Power Monitors.
 
 	  This driver can also be built as a module. If so, the module will
 	  be called adm1275.
diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
index 188af4c..2ae7cd1 100644
--- a/drivers/hwmon/pmbus/adm1275.c
+++ b/drivers/hwmon/pmbus/adm1275.c
@@ -24,7 +24,7 @@
 #include <linux/bitops.h>
 #include "pmbus.h"
 
-enum chips { adm1075, adm1275, adm1276, adm1293, adm1294 };
+enum chips { adm1075, adm1275, adm1276, adm1278, adm1293, adm1294 };
 
 #define ADM1275_MFR_STATUS_IOUT_WARN2	BIT(0)
 #define ADM1293_MFR_STATUS_VAUX_UV_WARN	BIT(5)
@@ -70,6 +70,22 @@ enum chips { adm1075, adm1275, adm1276, adm1293, adm1294 };
 #define ADM1075_VAUX_OV_WARN		BIT(7)
 #define ADM1075_VAUX_UV_WARN		BIT(6)
 
+#define ADM1278_PMON_CONTROL		0xd3
+#define ADM1278_PMON_CONFIG		0xd4
+#define ADM1278_CFG_TSFLT		BIT(15)
+#define ADM1278_CFG_SIMULTANEOUS	BIT(14)
+#define ADM1278_CFG_PMON_MODE		BIT(4)
+#define ADM1278_CFG_TEMP1_EN		BIT(3)
+#define ADM1278_CFG_VIN_EN		BIT(2)
+#define ADM1278_CFG_VOUT_EN		BIT(1)
+#define ADM1278_PEAK_TEMPERATURE	0xd7
+
+#define ADM1278_R_SENSE	1000	/* R_sense resistor value in microohms */
+
+static int r_sense = ADM1278_R_SENSE;
+module_param(r_sense, int, 0644);
+MODULE_PARM_DESC(r_sense, "Rsense resistor value in microohms");
+
 struct adm1275_data {
 	int id;
 	bool have_oc_fault;
@@ -186,6 +202,11 @@ static int adm1275_read_word_data(struct i2c_client *client, int page, int reg)
 	case PMBUS_VIRT_READ_VIN_MAX:
 		ret = pmbus_read_word_data(client, 0, ADM1275_PEAK_VIN);
 		break;
+	case PMBUS_VIRT_READ_TEMP_MAX:
+		if (data->id != adm1278)
+			return -ENODATA;
+		ret = pmbus_read_word_data(client, 0, ADM1278_PEAK_TEMPERATURE);
+		break;
 	case PMBUS_VIRT_READ_PIN_MIN:
 		if (!data->have_pin_min)
 			return -ENXIO;
@@ -199,6 +220,7 @@ static int adm1275_read_word_data(struct i2c_client *client, int page, int reg)
 	case PMBUS_VIRT_RESET_IOUT_HISTORY:
 	case PMBUS_VIRT_RESET_VOUT_HISTORY:
 	case PMBUS_VIRT_RESET_VIN_HISTORY:
+	case PMBUS_VIRT_RESET_TEMP_HISTORY:
 		break;
 	case PMBUS_VIRT_RESET_PIN_HISTORY:
 		if (!data->have_pin_max)
@@ -239,6 +261,10 @@ static int adm1275_write_word_data(struct i2c_client *client, int page, int reg,
 	case PMBUS_VIRT_RESET_VIN_HISTORY:
 		ret = pmbus_write_word_data(client, 0, ADM1275_PEAK_VIN, 0);
 		break;
+	case PMBUS_VIRT_RESET_TEMP_HISTORY:
+		ret = pmbus_write_word_data(client, 0, ADM1278_PEAK_TEMPERATURE,
+						0);
+		break;
 	case PMBUS_VIRT_RESET_PIN_HISTORY:
 		ret = pmbus_write_word_data(client, 0, ADM1276_PEAK_PIN, 0);
 		if (!ret && data->have_pin_min)
@@ -312,6 +338,7 @@ static const struct i2c_device_id adm1275_id[] = {
 	{ "adm1075", adm1075 },
 	{ "adm1275", adm1275 },
 	{ "adm1276", adm1276 },
+	{ "adm1278", adm1278 },
 	{ "adm1293", adm1293 },
 	{ "adm1294", adm1294 },
 	{ }
@@ -321,12 +348,12 @@ MODULE_DEVICE_TABLE(i2c, adm1275_id);
 static int adm1275_probe(struct i2c_client *client,
 			 const struct i2c_device_id *id)
 {
-	u8 block_buffer[I2C_SMBUS_BLOCK_MAX + 1];
+	/* u8 block_buffer[I2C_SMBUS_BLOCK_MAX + 1]; */
 	int config, device_config;
 	int ret;
 	struct pmbus_driver_info *info;
 	struct adm1275_data *data;
-	const struct i2c_device_id *mid;
+	/* const struct i2c_device_id *mid; */
 	const struct coefficients *coefficients;
 	int vindex = -1, voindex = -1, cindex = -1, pindex = -1;
 
@@ -335,6 +362,11 @@ static int adm1275_probe(struct i2c_client *client,
 				     | I2C_FUNC_SMBUS_BLOCK_DATA))
 		return -ENODEV;
 
+	/* i2c_aspeed driver does not handle
+	 * i2c_smbus_read_block_data() correctly.
+	 * Disable the code until been fixed.
+	 */
+#if 0
 	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, block_buffer);
 	if (ret < 0) {
 		dev_err(&client->dev, "Failed to read Manufacturer ID\n");
@@ -363,6 +395,7 @@ static int adm1275_probe(struct i2c_client *client,
 		dev_notice(&client->dev,
 			   "Device mismatch: Configured %s, detected %s\n",
 			   id->name, mid->name);
+#endif
 
 	config = i2c_smbus_read_byte_data(client, ADM1275_PMON_CONFIG);
 	if (config < 0)
@@ -377,7 +410,12 @@ static int adm1275_probe(struct i2c_client *client,
 	if (!data)
 		return -ENOMEM;
 
-	data->id = mid->driver_data;
+	/* i2c_aspeed driver does not handle
+	 * i2c_smbus_read_block_data() correctly.
+	 * Disable the code until been fixed.
+	 */
+	/* data->id = mid->driver_data; */
+	data->id = adm1278;
 
 	info = &data->info;
 
@@ -460,6 +498,62 @@ static int adm1275_probe(struct i2c_client *client,
 			info->func[0] |=
 			  PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT;
 		break;
+	case adm1278:
+		ret = i2c_smbus_write_byte_data(client,
+			ADM1278_PMON_CONTROL, 0);
+		if (ret < 0)
+			return ret;
+		ret = i2c_smbus_read_word_data(client, ADM1275_PMON_CONFIG);
+		ret = i2c_smbus_write_word_data(client, ADM1275_PMON_CONFIG,
+						ADM1278_CFG_PMON_MODE |
+						ADM1278_CFG_TEMP1_EN |
+						ADM1278_CFG_VIN_EN |
+						ADM1278_CFG_VOUT_EN);
+		if (ret < 0)
+			return ret;
+		ret = i2c_smbus_read_word_data(client, ADM1275_PMON_CONFIG);
+		dev_dbg(&client->dev, "adm1278 config: 0x%x\n", ret);
+		ret = i2c_smbus_write_byte_data(client,
+			ADM1278_PMON_CONTROL, 1);
+		if (ret < 0)
+			return ret;
+
+		info->func[0] |= PMBUS_HAVE_VIN
+			| PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
+			| PMBUS_HAVE_PIN
+			| PMBUS_HAVE_STATUS_INPUT
+			| PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
+
+		data->have_oc_fault = false;
+		data->have_uc_fault = false;
+		data->have_vout = true;
+		data->have_vaux_status = false;
+		data->have_mfr_vaux_status = false;
+		data->have_iout_min = false;
+		data->have_pin_min = false;
+		data->have_pin_max = true;
+
+		info->m[PSC_VOLTAGE_IN] = 19599;
+		info->b[PSC_VOLTAGE_IN] = 0;
+		info->R[PSC_VOLTAGE_IN] = -2;
+
+		info->m[PSC_VOLTAGE_OUT] = 19599;
+		info->b[PSC_VOLTAGE_OUT] = 0;
+		info->R[PSC_VOLTAGE_OUT] = -2;
+
+		info->m[PSC_CURRENT_OUT] = 800 * r_sense / 1000;
+		info->b[PSC_CURRENT_OUT] = 20475;
+		info->R[PSC_CURRENT_OUT] = -1;
+
+		info->m[PSC_POWER] = 6123 * r_sense / 1000;
+		info->b[PSC_POWER] = 0;
+		info->R[PSC_POWER] = -2;
+
+		info->format[PSC_TEMPERATURE] = direct;
+		info->m[PSC_TEMPERATURE] = 42;
+		info->b[PSC_TEMPERATURE] = 31880;
+		info->R[PSC_TEMPERATURE] = -1;
+		break;
 	case adm1293:
 	case adm1294:
 		data->have_iout_min = true;
-- 
1.9.1
