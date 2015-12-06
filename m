Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id A9FAD1A0359
 for <openbmc@lists.ozlabs.org>; Mon,  7 Dec 2015 03:50:28 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1449420625066605.010451635093;
 Sun, 6 Dec 2015 08:50:25 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: adamliyi <adamliyi@msn.com>
Subject: [PATCH openbmc 8/8] 1. Add a R/W attribute "update_interval". By
 default,
 it is set to 1000ms. This defines the minimum interval occ driver poll occ for
 latest sensor data. When reading occ hwmon attributes within the
 update_interval,
 the driver will no poll occ and it returns sendor data from cached data.
Date: Sun,  6 Dec 2015 11:50:18 -0500
Message-Id: <1449420618-3202-9-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1449420618-3202-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1449420618-3202-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sun, 06 Dec 2015 16:50:29 -0000

From: adamliyi <adamliyi@msn.com>

You can do e.g. "echo 5000 > /sys/class/hwmon0/update_interval" to change it to 5000ms.

2. Revise code based on Jeremy's comments.
The driver name is changed to occ_i2c.c

3. This patch will be removed when the occ_i2c driver is merged into Linux tree.
---
 .../linux/linux-obmc/occ_hwmon.patch               | 1667 +++++++++-----------
 1 file changed, 728 insertions(+), 939 deletions(-)

diff --git a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/occ_hwmon.patch b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/occ_hwmon.patch
index 612214d..0e803b7 100644
--- a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/occ_hwmon.patch
+++ b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/occ_hwmon.patch
@@ -1,41 +1,45 @@
 diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
-index e13c902..38aff0c 100644
+index e13c902..7c74854 100644
 --- a/drivers/hwmon/Kconfig
 +++ b/drivers/hwmon/Kconfig
-@@ -1167,6 +1167,13 @@ config SENSORS_NCT7904
+@@ -1167,6 +1167,16 @@ config SENSORS_NCT7904
  	  This driver can also be built as a module.  If so, the module
  	  will be called nct7904.
  
 +config SENSORS_OCC
-+	tristate "OCC sensor driver for IBM Power CPU"
++	tristate "OCC sensor BMC driver"
 +	depends on I2C
 +	help
-+	  If you say yes here you get support for driver to read sensors in 
-+	  IBM Power CPU On-Chip-Controller. module will be called occ.
++	  If you say yes here you get support for BMC to monitor IBM
++	  Power CPU sensors via the On-Chip-Controller (OCC).
++
++	  This driver can aslo be built as a module. If so, the module
++	  will be called occ_i2c.
 +
  config SENSORS_PCF8591
  	tristate "Philips PCF8591 ADC/DAC"
  	depends on I2C
 diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
-index 9e0f3dd..53dc3b3 100644
+index 9e0f3dd..d6fa923 100644
 --- a/drivers/hwmon/Makefile
 +++ b/drivers/hwmon/Makefile
 @@ -123,6 +123,7 @@ obj-$(CONFIG_SENSORS_NCT6775)	+= nct6775.o
  obj-$(CONFIG_SENSORS_NCT7802)	+= nct7802.o
  obj-$(CONFIG_SENSORS_NCT7904)	+= nct7904.o
  obj-$(CONFIG_SENSORS_NTC_THERMISTOR)	+= ntc_thermistor.o
-+obj-$(CONFIG_SENSORS_OCC)	+= occ.o
++obj-$(CONFIG_SENSORS_OCC)	+= occ_i2c.o
  obj-$(CONFIG_SENSORS_PC87360)	+= pc87360.o
  obj-$(CONFIG_SENSORS_PC87427)	+= pc87427.o
  obj-$(CONFIG_SENSORS_PCF8591)	+= pcf8591.o
-diff --git a/drivers/hwmon/occ.c b/drivers/hwmon/occ.c
+diff --git a/drivers/hwmon/occ_i2c.c b/drivers/hwmon/occ_i2c.c
 new file mode 100644
-index 0000000..f265ff3
+index 0000000..7a5755d
 --- /dev/null
-+++ b/drivers/hwmon/occ.c
-@@ -0,0 +1,1529 @@
++++ b/drivers/hwmon/occ_i2c.c
+@@ -0,0 +1,1315 @@
 +/*
-+ * Open BMC OCC HWMON driver - read Power8 OCC (On Chip Controller) sensor data via i2c.
++ * BMC OCC HWMON driver - read IBM Power8 OCC (On Chip Controller)
++ * sensor data via i2c.
 + *
 + * Copyright (c) 2015 IBM (Alvin Wang, Li Yi)
 + *
@@ -48,10 +52,6 @@ index 0000000..f265ff3
 + * but WITHOUT ANY WARRANTY; without even the implied warranty of
 + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 + * GNU General Public License for more details.
-+ *
-+ * You should have received a copy of the GNU General Public License
-+ * along with this program; if not, write to the Free Software
-+ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
 + */
 +
 +#include <linux/module.h>
@@ -65,44 +65,63 @@ index 0000000..f265ff3
 +#include <linux/mutex.h>
 +#include <linux/of.h>
 +#include <linux/delay.h>
++#include <linux/kernel.h>
++#include <linux/device.h>
++
++
++#define OCC_I2C_ADDR 0x50
++#define OCC_I2C_NAME "occ-i2c"
++
++#define OCC_DATA_MAX	4096 /* 4KB at most */
++/* i2c read and write occ sensors */
++#define I2C_READ_ERROR	1
++#define I2C_WRITE_ERROR	2
++
++/* To generate attn to OCC */
++#define ATTN_DATA	0x0006B035
++/* For BMC to read/write SRAM */
++#define OCB_ADDRESS		0x0006B070
++#define OCB_DATA		0x0006B075
++#define OCB_STATUS_CONTROL_AND	0x0006B072
++#define OCB_STATUS_CONTROL_OR	0x0006B073
++#define OCC_COMMAND_ADDR	0xFFFF6000
++#define OCC_RESPONSE_ADDR	0xFFFF7000
 +
-+//#define DEBUG    1
 +
-+/* ------------------------------------------------------------*/
 +/* OCC sensor data format */
-+typedef struct {
++struct occ_sensor {
 +	uint16_t sensor_id;
 +	uint16_t value;
-+} occ_sensor;
++};
 +
-+typedef struct {
++struct power_sensor {
 +	uint16_t sensor_id;
 +	uint32_t update_tag;
 +	uint32_t accumulator;
 +	uint16_t value;
-+} powr_sensor;
++};
 +
-+typedef struct {
++struct caps_sensor {
 +	uint16_t curr_powercap;
 +	uint16_t curr_powerreading;
 +	uint16_t norm_powercap;
 +	uint16_t max_powercap;
 +	uint16_t min_powercap;
 +	uint16_t user_powerlimit;
-+} caps_sensor;
++};
 +
-+typedef struct {
-+	char sensor_type[5];
++struct sensor_data_block {
++	uint8_t sensor_type[4];
 +	uint8_t reserved0;
 +	uint8_t sensor_format;
 +	uint8_t sensor_length;
 +	uint8_t num_of_sensors;
-+	occ_sensor *sensor;
-+	powr_sensor *powr;
-+	caps_sensor *caps;
-+} sensor_data_block;
++	struct occ_sensor *sensor;
++	struct power_sensor *power;
++	struct caps_sensor *caps;
++};
 +
-+typedef struct {
++struct occ_poll_header {
 +	uint8_t status;
 +	uint8_t ext_status;
 +	uint8_t occs_present;
@@ -115,510 +134,484 @@ index 0000000..f265ff3
 +	uint16_t error_log_length;
 +	uint8_t reserved2;
 +	uint8_t reserved3;
-+	char occ_code_level[17];
-+	char sensor_eye_catcher[7];
-+	uint8_t num_of_sensor_blocks;
++	uint8_t occ_code_level[16];
++	uint8_t sensor_eye_catcher[6];
++	uint8_t sensor_block_num;
 +	uint8_t sensor_data_version;
-+	sensor_data_block* blocks;
-+} occ_poll_data;
++};
 +
-+typedef struct {
++struct occ_response {
 +	uint8_t sequence_num;
 +	uint8_t cmd_type;
 +	uint8_t rtn_status;
 +	uint16_t data_length;
-+	occ_poll_data data;
++	struct occ_poll_header header;
++	struct sensor_data_block *blocks;
 +	uint16_t chk_sum;
 +	int temp_block_id;
 +	int freq_block_id;
 +	int power_block_id;
 +	int caps_block_id;
-+} occ_response_t;
-+
-+//static occ_response_t occ_resp;
++};
 +
-+/* Each client has this additional data */
++/* data private to each client */
 +struct occ_drv_data {
 +	struct i2c_client	*client;
 +	struct device		*hwmon_dev;
 +	struct mutex		update_lock;
-+	char			valid;		/* !=0 if sensor data are valid */
-+	unsigned long		last_updated;	/* In jiffies */
-+	unsigned long		sample_time;	/* Mininum timer interval for sampling In jiffies */
-+	occ_response_t		occ_resp;
++	bool			valid;
++	unsigned long		last_updated;
++	/* Minimum timer interval for sampling In jiffies */
++	unsigned long		update_interval;
++	struct occ_response	occ_resp;
 +};
 +
-+/*-----------------------------------------------------------------------*/
-+/* i2c read and write occ sensors */
-+
-+#define OCC_DATA_MAX 4096 /* 4KB at most */
-+#define I2C_STATUS_REG 0x000d0001
-+#define I2C_ERROR_REG  0x000d0002
-+#define I2C_READ_ERROR 1
-+#define I2C_WRITE_ERROR 2
-+#define I2C_DATABUFFER_SIZE_ERROR 3
-+
-+/*
-+#define SCOM_OCC_SRAM_WOX  0x0006B013
-+#define SCOM_OCC_SRAM_WAND 0x0006B012
-+#define SCOM_OCC_SRAM_ADDR 0x0006B010
-+#define SCOM_OCC_SRAM_DATA 0x0006B015
-+*/
-+
-+// To generate attn to OCC
-+#define ATTN_DATA                0x0006B035
-+
-+// For BMC to read/write SRAM
-+#define OCB_ADDRESS              0x0006B070
-+#define OCB_DATA                 0x0006B075
-+#define OCB_STATUS_CONTROL_AND   0x0006B072
-+#define OCB_STATUS_CONTROL_OR    0x0006B073
-+
-+#define OCC_COMMAND_ADDR 0xFFFF6000
-+#define OCC_RESPONSE_ADDR 0xFFFF7000
++enum sensor_t {
++	freq,
++	temp,
++	power,
++	caps
++};
 +
-+static int deinit_occ_resp_buf(occ_response_t *p)
++static void deinit_occ_resp_buf(struct occ_response *p)
 +{
 +	int b;
 +
-+	if (p == NULL)
-+		return 0;
++	if (!p)
++		return;
 +
-+	if (p->data.blocks == NULL)
-+		return 0;
++	if (!p->blocks)
++		return;
 +
-+	for(b = 0; b < p->data.num_of_sensor_blocks; b++) {
-+		if (!p->data.blocks[b].sensor)
-+			kfree(p->data.blocks[b].sensor);
-+		if (!p->data.blocks[b].powr)
-+			kfree(p->data.blocks[b].powr);
-+		if (!p->data.blocks[b].caps)
-+			kfree(p->data.blocks[b].caps);
++	for (b = 0; b < p->header.sensor_block_num; b++) {
++		if (p->blocks[b].sensor)
++			kfree(p->blocks[b].sensor);
++		if (p->blocks[b].power)
++			kfree(p->blocks[b].power);
++		if (p->blocks[b].caps)
++			kfree(p->blocks[b].caps);
 +	}
 +
-+	kfree(p->data.blocks);
++	kfree(p->blocks);
 +
 +	memset(p, 0, sizeof(*p));
-+
-+
-+	return 0;
++	p->freq_block_id = -1;
++	p->temp_block_id = -1;
++	p->power_block_id = -1;
++	p->caps_block_id = -1;
 +}
 +
-+static ssize_t occ_i2c_read(struct i2c_client *client, char *buf, size_t count)
++static ssize_t occ_i2c_read(struct i2c_client *client, void *buf, size_t count)
 +{
-+	int ret = 0;
++	if (count > OCC_DATA_MAX)
++		count = OCC_DATA_MAX;
 +
-+	if (count > 8192)
-+		count = 8192;
-+
-+	//printk("i2c_read: reading %zu bytes @0x%x.\n", count, client->addr);
-+	ret = i2c_master_recv(client, buf, count);
-+	return ret;
++	dev_dbg(&client->dev, "i2c_read: reading %zu bytes @0x%x.\n",
++		count, client->addr);
++	return i2c_master_recv(client, buf, count);
 +}
 +
-+static ssize_t occ_i2c_write(struct i2c_client *client, const char *buf, size_t count)
++static ssize_t occ_i2c_write(struct i2c_client *client, const void *buf,
++				size_t count)
 +{
-+	int ret = 0;
-+
-+	if (count > 8192)
-+		count = 8192;
++	if (count > OCC_DATA_MAX)
++		count = OCC_DATA_MAX;
 +
-+	//printk("i2c_write: writing %zu bytes @0x%x.\n", count, client->addr);
-+	ret = i2c_master_send(client, buf, count);
-+	return ret;
++	dev_dbg(&client->dev, "i2c_write: writing %zu bytes @0x%x.\n",
++		count, client->addr);
++	return i2c_master_send(client, buf, count);
 +}
 +
-+/* read two 4-byte value */
-+static int occ_getscom(struct i2c_client *client, uint32_t address, uint32_t *value0, uint32_t *value1)
++/* read 8-byte value and put into data[offset] */
++static int occ_getscomb(struct i2c_client *client, uint32_t address,
++		uint8_t *data, int offset)
 +{
-+	uint32_t ret = 0;
++	uint32_t ret;
 +	char buf[8];
-+	const char* address_buf = (const char*)&address;
++	int i = 0;
 +
-+	//P8 i2c slave requires address to be shifted by 1
++	/* P8 i2c slave requires address to be shifted by 1 */
 +	address = address << 1;
 +
-+	ret = occ_i2c_write(client, address_buf, sizeof(address));
-+	/* FIXME: ast i2c driver does not read corret value */
-+	//if (ret != sizeof(address))
-+	//	return -I2C_WRITE_ERROR;
++	ret = occ_i2c_write(client, &address,
++		sizeof(address));
++
++	if (ret != sizeof(address))
++		return -I2C_WRITE_ERROR;
 +
 +	ret = occ_i2c_read(client, buf, sizeof(buf));
-+	//if (ret != sizeof(buf))
-+	//	return -I2C_READ_ERROR;
++	if (ret != sizeof(buf))
++		return -I2C_READ_ERROR;
 +
-+	memcpy(value1, &buf[0], sizeof(*value1));
-+	memcpy(value0, &buf[4], sizeof(*value0));
++	for (i = 0; i < 8; i++)
++		data[offset + i] = buf[7 - i];
 +
 +	return 0;
 +}
 +
-+/* read 8-byte value and put into data[offset] */
-+static int occ_getscomb(struct i2c_client *client, uint32_t address, char* data, int offset)
++static int occ_putscom(struct i2c_client *client, uint32_t address,
++		uint32_t data0, uint32_t data1)
 +{
-+	uint32_t ret = 0;
-+	const char* address_buf = (const char*)&address;
-+	char buf[8];
-+	int b = 0;
++	uint32_t buf[3];
++	uint32_t ret;
 +
-+	//P8 i2c slave requires address to be shifted by 1
++	/* P8 i2c slave requires address to be shifted by 1 */
 +	address = address << 1;
 +
-+	ret = occ_i2c_write(client, address_buf, sizeof(address));
-+	//if (ret != sizeof(address))
-+	//	return -I2C_WRITE_ERROR;
++	buf[0] = address;
++	buf[1] = data1;
++	buf[2] = data0;
 +
-+	ret = occ_i2c_read(client, buf, sizeof(buf));
-+	//if (ret != sizeof(buf))
-+	//	return -I2C_READ_ERROR;
-+
-+	for (b = 0; b < 8; b++) {
-+		data[offset + b] = buf[7 - b];
-+	}
++	ret = occ_i2c_write(client, buf, sizeof(buf));
++	if (ret != sizeof(buf))
++		return I2C_WRITE_ERROR;
 +
 +	return 0;
 +}
 +
-+static int occ_putscom(struct i2c_client *client, uint32_t address, uint32_t data0, uint32_t data1)
++static inline uint16_t get_occdata_length(uint8_t *d)
 +{
-+	const char* address_buf = (const char*)&address;
-+	const char* d0 = (const char*)&data0;
-+	const char* d1 = (const char*)&data1;
-+	char buf[12];
-+	uint32_t ret = 0;
-+
-+	//P8 i2c slave requires address to be shifted by 1
-+	address = address << 1;
-+
-+	memcpy(&buf[0], address_buf, sizeof(address));
-+	memcpy(&buf[4], d1, sizeof(data1));
-+	memcpy(&buf[8],	d0, sizeof(data0));
-+
-+	ret = occ_i2c_write(client, buf, sizeof(buf));
-+	//if (ret != sizeof(buf))
-+	//	return I2C_WRITE_ERROR;
-+
-+	return 0;
++        return (d[3] << 8) | d[4];
 +}
 +
-+static int occ_check_i2c_errors(struct i2c_client *client)
++static int occ_renew_sensor(struct occ_response *o, uint8_t sensor_length,
++	uint8_t num_of_sensors, enum sensor_t t, int block)
 +{
-+	uint32_t v0;
-+	uint32_t v1;
-+
-+	occ_getscom(client, I2C_STATUS_REG, &v0, &v1);
-+	if (v0 != 0x80000000) {
-+		printk("ERROR present in P8 I2C Slave.  Clearing...\n");
-+		occ_putscom(client, I2C_ERROR_REG, 0x00000000, 0x00000000);
-+		occ_putscom(client, I2C_STATUS_REG, 0x00000000, 0x00000000);
++	void *sensor;
++	int ret;
++
++	switch (t) {
++	case temp:
++		sensor = o->temp_block_id == -1 ? NULL :
++		o->blocks[o->temp_block_id].sensor;
++		break;
++	case freq:
++		sensor = o->freq_block_id == -1 ? NULL :
++		o->blocks[o->freq_block_id].sensor;
++		break;
++	case power:
++		sensor = o->power_block_id == -1 ? NULL :
++		o->blocks[o->power_block_id].power;
++		break;
++	case caps:
++		sensor = o->caps_block_id == -1 ? NULL :
++		o->blocks[o->caps_block_id].caps;
++		break;
++	default:
++		sensor = NULL;
++		break;
++	}
++
++	/* empty sensor block, release older sensor data */
++	if (num_of_sensors == 0 || sensor_length == 0) {
++		if (sensor)
++			kfree(sensor);
 +		return -1;
 +	}
 +
++	switch (t) {
++	case temp:
++		if (!sensor || num_of_sensors !=
++			o->blocks[o->temp_block_id].num_of_sensors) {
++			if (sensor)
++				kfree(sensor);
++			o->blocks[block].sensor =
++				//kzalloc(sizeof(struct occ_sensor) *
++				//	num_of_sensors, GFP_KERNEL);
++				kcalloc(num_of_sensors,
++					sizeof(struct occ_sensor), GFP_KERNEL);
++			if (!o->blocks[block].sensor) {
++				ret = -ENOMEM;
++				goto err;
++			}
++		}
++		break;
++	case freq:
++		if (!sensor || num_of_sensors !=
++			o->blocks[o->freq_block_id].num_of_sensors) {
++			if (sensor)
++				kfree(sensor);
++			o->blocks[block].sensor =
++				//kzalloc(sizeof(struct occ_sensor) *
++				//	num_of_sensors, GFP_KERNEL);
++				kcalloc(num_of_sensors,
++					sizeof(struct occ_sensor), GFP_KERNEL);
++			if (!o->blocks[block].sensor) {
++				ret = -ENOMEM;
++				goto err;
++			}
++		}
++		break;
++	case power:
++		if (!sensor || num_of_sensors !=
++			o->blocks[o->power_block_id].num_of_sensors) {
++			if (sensor)
++				kfree(sensor);
++			o->blocks[block].power =
++				//kzalloc(sizeof(struct power_sensor) *
++				//	num_of_sensors, GFP_KERNEL);
++				kcalloc(num_of_sensors,
++				sizeof(struct power_sensor), GFP_KERNEL);
++			if (!o->blocks[block].power) {
++				ret = -ENOMEM;
++				goto err;
++			}
++		}
++		break;
++	case caps:
++		if (!sensor || num_of_sensors !=
++			o->blocks[o->caps_block_id].num_of_sensors) {
++			if (sensor)
++				kfree(sensor);
++			o->blocks[block].caps =
++				//kzalloc(sizeof(struct caps_sensor) *
++				//	num_of_sensors, GFP_KERNEL);
++				kcalloc(num_of_sensors,
++					sizeof(struct caps_sensor), GFP_KERNEL);
++			if (!o->blocks[block].caps) {
++				ret = -ENOMEM;
++				goto err;
++			}
++		}
++		break;
++	default:
++		sensor = NULL;
++		break;
++	}
++
 +	return 0;
++err:
++	deinit_occ_resp_buf(o);
++	return ret;
 +}
 +
-+
-+static inline uint16_t get_occdata_length(char* d)
++/* refer to OCC interface document for Poll Return Packet format */
++#define RESP_HEADER_OFFSET	5
++#define SENSOR_STR_OFFSET	37
++#define SENSOR_BLOCK_NUM_OFFSET	43
++#define SENSOR_BLOCK_OFFSET	45
++static int parse_occ_response(struct i2c_client *client,
++		uint8_t *d, struct occ_response *o)
 +{
-+	uint16_t data_length = 0;
-+
-+	data_length = d[3] << 8;
-+	data_length = data_length | d[4];
-+	return data_length;
-+}
-+
++	int b;
++	int s;
++	int ret;
++	int dnum = SENSOR_BLOCK_OFFSET;
++	struct occ_sensor *f_sensor;
++	struct occ_sensor *t_sensor;
++	struct power_sensor *p_sensor;
++	struct caps_sensor *c_sensor;
++	uint8_t sensor_block_num;
++	uint8_t sensor_type[4];
++	uint8_t sensor_format;
++	uint8_t sensor_length;
++	uint8_t num_of_sensors;
 +
-+static int parse_occ_response(char* d, occ_response_t* o)
-+{
-+	int b = 0;
-+	int s = 0;
-+	int ret = 0;
-+	int dnum = 45;
-+
-+	o->sequence_num = d[0];
-+	o->cmd_type = d[1];
-+	o->rtn_status = d[2];
-+	o->data_length = d[3] << 8;
-+	o->data_length = o->data_length | d[4];
-+	o->data.status = d[5];
-+	o->data.ext_status = d[6];
-+	o->data.occs_present = d[7];
-+	o->data.config = d[8];
-+	o->data.occ_state = d[9];
-+	o->data.reserved0 = d[10];
-+	o->data.reserved1 = d[11];
-+	o->data.error_log_id = d[12];
-+	o->data.error_log_addr_start = d[13] << 24;
-+	o->data.error_log_addr_start = o->data.error_log_addr_start | d[14] << 16;
-+	o->data.error_log_addr_start = o->data.error_log_addr_start | d[15] << 8;
-+	o->data.error_log_addr_start = o->data.error_log_addr_start | d[16];
-+	o->data.error_log_length = d[17] << 8;
-+	o->data.error_log_length = o->data.error_log_length | d[18];
-+	o->data.reserved2 = d[19];
-+	o->data.reserved3 = d[20];
-+	strncpy(&o->data.occ_code_level[0], (const char*)&d[21], 16);
-+	strncpy(&o->data.sensor_eye_catcher[0], (const char*)&d[37], 6);
-+	o->data.sensor_eye_catcher[6]='\0';
-+	o->data.num_of_sensor_blocks=d[43];
-+	o->data.sensor_data_version = d[44];
-+
-+	if (strcmp(o->data.sensor_eye_catcher, "SENSOR") != 0) {
-+		printk("ERROR: SENSOR not found at byte 37 (%s)\n",o->data.sensor_eye_catcher);
-+		return -1;
++	/* check if the data is valid */
++	if (strncmp(&d[SENSOR_STR_OFFSET], "SENSOR", 6) != 0) {
++		dev_err(&client->dev,
++			"ERROR: SENSOR String in response\n");
++		ret = -1;
++		goto err;
++        }
++
++	sensor_block_num = d[SENSOR_BLOCK_NUM_OFFSET];
++	if (sensor_block_num == 0) {
++		dev_err(&client->dev, "ERROR: SENSOR block num is 0\n");
++		ret = -1;
++		goto err;
 +	}
 +
-+	if (o->data.num_of_sensor_blocks == 0) {
-+		printk("ERROR: SENSOR block num is 0\n");
-+		return -1;
++	/* if sensor block has changed, re-malloc */
++	if (sensor_block_num != o->header.sensor_block_num) {
++		deinit_occ_resp_buf(o);
++		//o->blocks = kzalloc(sizeof(struct sensor_data_block) *
++		//		sensor_block_num, GFP_KERNEL);
++		o->blocks = kcalloc(sensor_block_num,
++			sizeof(struct sensor_data_block), GFP_KERNEL);
++		if (!o->blocks)
++			return -ENOMEM;
 +	}
 +
-+	o->data.blocks = kzalloc(sizeof(sensor_data_block) * o->data.num_of_sensor_blocks, GFP_KERNEL);
-+	if (o->data.blocks == NULL)
-+		return -ENOMEM;
++	memcpy(&o->header, &d[RESP_HEADER_OFFSET], sizeof(o->header));
++	o->header.error_log_addr_start =
++		be32_to_cpu(o->header.error_log_addr_start);
++	o->header.error_log_length = be16_to_cpu(o->header.error_log_length);
 +
-+	//printk("Reading %d sensor blocks\n", o->data.num_of_sensor_blocks);
-+	o->temp_block_id = -1;
-+	o->freq_block_id = -1;
-+	o->power_block_id = -1;
-+	o->caps_block_id = -1;
-+	for(b = 0; b < o->data.num_of_sensor_blocks; b++) {
++	dev_dbg(&client->dev, "Reading %d sensor blocks\n",
++		o->header.sensor_block_num);
++	for (b = 0; b < sensor_block_num; b++) {
 +		/* 8-byte sensor block head */
-+		strncpy(&o->data.blocks[b].sensor_type[0], (const char*)&d[dnum], 4);
-+		o->data.blocks[b].reserved0 = d[dnum+4];
-+		o->data.blocks[b].sensor_format = d[dnum+5];
-+		o->data.blocks[b].sensor_length = d[dnum+6];
-+		o->data.blocks[b].num_of_sensors = d[dnum+7];
++		strncpy(sensor_type, &d[dnum], 4);
++		sensor_format = d[dnum+5];
++		sensor_length = d[dnum+6];
++		num_of_sensors = d[dnum+7];
 +		dnum = dnum + 8;
 +
-+		//printk("sensor block[%d]: type: %s, num_of_sensors: %d, sensor_length: %u\n",
-+			//b, o->data.blocks[b].sensor_type, o->data.blocks[b].num_of_sensors,
-+			//o->data.blocks[b].sensor_length);
-+
-+		/* empty sensor block */
-+		if (o->data.blocks[b].num_of_sensors <= 0)
-+			continue;
-+		if (o->data.blocks[b].sensor_length == 0)
-+			continue;
++		dev_dbg(&client->dev,
++			"sensor block[%d]: type: %s, num_of_sensors: %d\n",
++			b, sensor_type, num_of_sensors);
 +
-+		if (strcmp(o->data.blocks[b].sensor_type, "FREQ") == 0) {
-+			o->data.blocks[b].sensor =
-+				kzalloc(sizeof(occ_sensor) * o->data.blocks[b].num_of_sensors, GFP_KERNEL);
++		if (strncmp(sensor_type, "FREQ", 4) == 0) {
++			ret = occ_renew_sensor(o, sensor_length,
++				num_of_sensors, freq, b);
++			if (ret)
++				continue;
 +
-+			if (o->data.blocks[b].sensor == NULL) {
-+				ret = -ENOMEM;
-+				goto abort;
-+			}
 +			o->freq_block_id = b;
-+			for (s = 0; s < o->data.blocks[b].num_of_sensors; s++) {
-+				o->data.blocks[b].sensor[s].sensor_id = d[dnum] << 8;
-+				o->data.blocks[b].sensor[s].sensor_id =
-+					o->data.blocks[b].sensor[s].sensor_id | d[dnum+1];
-+				o->data.blocks[b].sensor[s].value = d[dnum+2] << 8;
-+				o->data.blocks[b].sensor[s].value = o->data.blocks[b].sensor[s].value | d[dnum+3];
-+				//printk("sensor[%d]-[%d]: id: %u, value: %u\n",
-+				//	b, s, o->data.blocks[b].sensor[s].sensor_id, o->data.blocks[b].sensor[s].value);
-+				dnum = dnum + o->data.blocks[b].sensor_length;
-+			}
-+		}
-+		else if (strcmp(o->data.blocks[b].sensor_type, "TEMP") == 0) {
-+
-+			o->data.blocks[b].sensor =
-+				kzalloc(sizeof(occ_sensor) * o->data.blocks[b].num_of_sensors, GFP_KERNEL);
-+
-+			if (o->data.blocks[b].sensor == NULL) {
-+				ret = -ENOMEM;
-+				goto abort;
++			for (s = 0; s < num_of_sensors; s++) {
++				f_sensor = &o->blocks[b].sensor[s];
++				f_sensor->sensor_id = (d[dnum]<<8) | d[dnum+1];
++				f_sensor->value = (d[dnum+2]<<8) | d[dnum+3];
++				dev_dbg(&client->dev,
++					"sensor[%d]-[%d]: id: %u, value: %u\n",
++					b, s, f_sensor->sensor_id,
++					f_sensor->value);
++				dnum = dnum + sensor_length;
 +			}
++		} else if (strncmp(sensor_type, "TEMP", 4) == 0) {
++			ret = occ_renew_sensor(o, sensor_length,
++				num_of_sensors, temp, b);
++			if (ret)
++				continue;
 +
 +			o->temp_block_id = b;
-+			for (s = 0; s < o->data.blocks[b].num_of_sensors; s++) {
-+				o->data.blocks[b].sensor[s].sensor_id = d[dnum] << 8;
-+				o->data.blocks[b].sensor[s].sensor_id =
-+					o->data.blocks[b].sensor[s].sensor_id | d[dnum+1];
-+				o->data.blocks[b].sensor[s].value = d[dnum+2] << 8;
-+				o->data.blocks[b].sensor[s].value = o->data.blocks[b].sensor[s].value | d[dnum+3];
-+				//printk("sensor[%d]-[%d]: id: %u, value: %u\n",
-+				//	b, s, o->data.blocks[b].sensor[s].sensor_id, o->data.blocks[b].sensor[s].value);
-+				dnum = dnum + o->data.blocks[b].sensor_length;
++			for (s = 0; s < num_of_sensors; s++) {
++				t_sensor = &o->blocks[b].sensor[s];
++				t_sensor->sensor_id = (d[dnum]<<8) | d[dnum+1];
++				t_sensor->value = (d[dnum+2] << 8) | d[dnum+3];
++				dev_dbg(&client->dev,
++					"sensor[%d]-[%d]: id: %u, value: %u\n",
++					b, s, t_sensor->sensor_id,
++					t_sensor->value);
++				dnum = dnum + sensor_length;
 +			}
-+		}
-+		else if (strcmp(o->data.blocks[b].sensor_type, "POWR") == 0) {
-+
-+			o->data.blocks[b].powr =
-+				kzalloc(sizeof(powr_sensor) * o->data.blocks[b].num_of_sensors, GFP_KERNEL);
++		} else if (strncmp(sensor_type, "POWR", 4) == 0) {
++			ret = occ_renew_sensor(o, sensor_length,
++				num_of_sensors, power, b);
++			if (ret)
++				continue;
 +
-+			if (o->data.blocks[b].powr == NULL) {
-+				ret = -ENOMEM;
-+				goto abort;
-+			}
 +			o->power_block_id = b;
-+			for (s = 0; s < o->data.blocks[b].num_of_sensors; s++) {
-+				o->data.blocks[b].powr[s].sensor_id = d[dnum] << 8;
-+				o->data.blocks[b].powr[s].sensor_id = o->data.blocks[b].powr[s].sensor_id | d[dnum+1];
-+				o->data.blocks[b].powr[s].update_tag = d[dnum+2] << 24;
-+				o->data.blocks[b].powr[s].update_tag = o->data.blocks[b].powr[s].update_tag | d[dnum+3] << 16;
-+				o->data.blocks[b].powr[s].update_tag = o->data.blocks[b].powr[s].update_tag | d[dnum+4] << 8;
-+				o->data.blocks[b].powr[s].update_tag = o->data.blocks[b].powr[s].update_tag | d[dnum+5];
-+				o->data.blocks[b].powr[s].accumulator = d[dnum+6] << 24;
-+				o->data.blocks[b].powr[s].accumulator = o->data.blocks[b].powr[s].accumulator | d[dnum+7] << 16;
-+				o->data.blocks[b].powr[s].accumulator = o->data.blocks[b].powr[s].accumulator | d[dnum+8] << 8;
-+				o->data.blocks[b].powr[s].accumulator = o->data.blocks[b].powr[s].accumulator | d[dnum+9];
-+				o->data.blocks[b].powr[s].value = d[dnum+10] << 8;
-+				o->data.blocks[b].powr[s].value = o->data.blocks[b].powr[s].value | d[dnum+11];
-+
-+				//printk("sensor[%d]-[%d]: id: %u, value: %u\n",
-+				//	b, s, o->data.blocks[b].powr[s].sensor_id, o->data.blocks[b].powr[s].value);
-+
-+				dnum = dnum + o->data.blocks[b].sensor_length;
++			for (s = 0; s < num_of_sensors; s++) {
++				p_sensor = &o->blocks[b].power[s];
++				p_sensor->sensor_id = (d[dnum]<<8) | d[dnum+1];
++				p_sensor->update_tag =
++					(d[dnum+2] << 24) | (d[dnum+3] << 16) |
++					(d[dnum+4] << 8) | d[dnum+5];
++				p_sensor->accumulator =
++					(d[dnum+6] << 24) | (d[dnum+7] << 16) |
++					(d[dnum+8] << 8) | d[dnum+9];
++				p_sensor->value =
++					(d[dnum+10] << 8) | d[dnum+11];
++
++				dev_dbg(&client->dev,
++					"sensor[%d]-[%d]: id: %u, value: %u\n",
++					b, s, p_sensor->sensor_id,
++					p_sensor->value);
++
++				dnum = dnum + sensor_length;
 +			}
-+		}
-+		else if (strcmp(o->data.blocks[b].sensor_type, "CAPS") == 0) {
-+
-+			o->data.blocks[b].caps =
-+				kzalloc(sizeof(caps_sensor) * o->data.blocks[b].num_of_sensors, GFP_KERNEL);
++		} else if (strncmp(sensor_type, "CAPS", 4) == 0) {
++			ret = occ_renew_sensor(o, sensor_length,
++				num_of_sensors, caps, b);
++			if (ret)
++				continue;
 +
-+			if (o->data.blocks[b].caps == NULL) {
-+				ret = -ENOMEM;
-+				goto abort;
-+			}
 +			o->caps_block_id = b;
-+			for (s = 0; s < o->data.blocks[b].num_of_sensors; s++) {
-+				o->data.blocks[b].caps[s].curr_powercap = d[dnum] << 8;
-+				o->data.blocks[b].caps[s].curr_powercap = o->data.blocks[b].caps[s].curr_powercap | d[dnum+1];
-+				o->data.blocks[b].caps[s].curr_powerreading = d[dnum+2] << 8;
-+				o->data.blocks[b].caps[s].curr_powerreading = o->data.blocks[b].caps[s].curr_powerreading | d[dnum+3];
-+				o->data.blocks[b].caps[s].norm_powercap = d[dnum+4] << 8;
-+				o->data.blocks[b].caps[s].norm_powercap = o->data.blocks[b].caps[s].norm_powercap | d[dnum+5];
-+				o->data.blocks[b].caps[s].max_powercap = d[dnum+6] << 8;
-+				o->data.blocks[b].caps[s].max_powercap = o->data.blocks[b].caps[s].max_powercap| d[dnum+7];
-+				o->data.blocks[b].caps[s].min_powercap = d[dnum+8] << 8;
-+				o->data.blocks[b].caps[s].min_powercap = o->data.blocks[b].caps[s].min_powercap| d[dnum+9];
-+				o->data.blocks[b].caps[s].user_powerlimit = d[dnum+10] << 8;
-+				o->data.blocks[b].caps[s].user_powerlimit = o->data.blocks[b].caps[s].user_powerlimit| d[dnum+11];
-+
-+				dnum = dnum + o->data.blocks[b].sensor_length;
-+				//printk("CAPS sensor #%d:\n", s);
-+				//printk("curr_powercap is %x \n", o->data.blocks[b].caps[s].curr_powercap);
-+				//printk("curr_powerreading is %x \n", o->data.blocks[b].caps[s].curr_powerreading);
-+				//printk("norm_powercap is %x \n", o->data.blocks[b].caps[s].norm_powercap);
-+				//printk("max_powercap is %x \n", o->data.blocks[b].caps[s].max_powercap);
-+				//printk("min_powercap is %x \n", o->data.blocks[b].caps[s].min_powercap);
-+				//printk("user_powerlimit is %x \n", o->data.blocks[b].caps[s].user_powerlimit);
++			for (s = 0; s < num_of_sensors; s++) {
++				c_sensor = &o->blocks[b].caps[s];
++				c_sensor->curr_powercap =
++					(d[dnum] << 8) | d[dnum+1];
++				c_sensor->curr_powerreading =
++					(d[dnum+2] << 8) | d[dnum+3];
++				c_sensor->norm_powercap =
++					(d[dnum+4] << 8) | d[dnum+5];
++				c_sensor->max_powercap =
++					(d[dnum+6] << 8) | d[dnum+7];
++				c_sensor->min_powercap =
++					(d[dnum+8] << 8) | d[dnum+9];
++				c_sensor->user_powerlimit =
++					(d[dnum+10] << 8) | d[dnum+11];
++
++				dnum = dnum + sensor_length;
++				dev_dbg(&client->dev, "CAPS sensor #%d:\n", s);
++				dev_dbg(&client->dev, "curr_powercap is %x\n",
++					c_sensor->curr_powercap);
++				dev_dbg(&client->dev,
++					"curr_powerreading is %x\n",
++					c_sensor->curr_powerreading);
++				dev_dbg(&client->dev, "norm_powercap is %x\n",
++					c_sensor->norm_powercap);
++				dev_dbg(&client->dev, "max_powercap is %x\n",
++					c_sensor->max_powercap);
++				dev_dbg(&client->dev, "min_powercap is %x\n",
++					c_sensor->min_powercap);
++				dev_dbg(&client->dev, "user_powerlimit is %x\n",
++					c_sensor->user_powerlimit);
 +			}
 +
-+		}
-+		else {
-+			printk("ERROR: sensor type %s not supported\n", o->data.blocks[b].sensor_type);
++		} else {
++			dev_err(&client->dev,
++				"ERROR: sensor type %s not supported\n",
++				o->blocks[b].sensor_type);
 +			ret = -1;
-+			goto abort;
++			goto err;
 +		}
++
++		strncpy(o->blocks[b].sensor_type, sensor_type, 4);
++		o->blocks[b].sensor_format = sensor_format;
++		o->blocks[b].sensor_length = sensor_length;
++		o->blocks[b].num_of_sensors = num_of_sensors;
 +	}
 +
 +	return 0;
-+abort:
++err:
 +	deinit_occ_resp_buf(o);
 +	return ret;
 +}
 +
-+/* used for testing */
-+char fake_occ_rsp[OCC_DATA_MAX] = {
-+0x69, 0x00, 0x00, 0x00, 0xa4, 0xc3, 0x00, 0x03, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-+0x00, 0x00, 0x00, 0x00, 0x00, 0x6f, 0x70, 0x5f, 0x6f, 0x63, 0x63, 0x5f, 0x31, 0x35, 0x30, 0x37,
-+0x31, 0x36, 0x61, 0x00, 0x00, 0x53, 0x45, 0x4e, 0x53, 0x4f, 0x52, 0x04, 0x01, 0x54, 0x45, 0x4d,
-+0x50, 0x00, 0x01, 0x04, 0x0a, 0x00 ,0x6a, 0x00, 0x00, 0x00, 0x6c, 0x00, 0x00, 0x00, 0x6d, 0x00,
-+0x00,0x00,0x6e,0x00, 0x00,0x00,0x6f,0x00, 0x00,0x00,0x70,0x00, 0x00,0x00,0x71,0x00,
-+0x00,0x00,0x73,0x00, 0x00,0x00,0x74,0x00, 0x00,0x00,0x75,0x00, 0x00,0x46,0x52,0x45,
-+0x51,0x00,0x01,0x04, 0x0a,0x00,0x76,0x00, 0x00,0x00,0x78,0x00, 0x00,0x00,0x79,0x00,
-+0x00,0x00,0x7a,0x00, 0x00,0x00,0x7b,0x00, 0x00,0x00,0x7c,0x00, 0x00,0x00,0x7d,0x00,
-+0x00,0x00,0x7f,0x00, 0x00,0x00,0x80,0x00, 0x00,0x00,0x81,0x00, 0x00,0x50,0x4f,0x57,
-+0x52,0x00,0x01,0x0c, 0x00,0x43,0x41,0x50, 0x53,0x00,0x01,0x0c, 0x01,0x00,0x00,0x00,
-+0x00,0x04,0xb0,0x09, 0x60,0x04,0x4c,0x00, 0x00,0x17,0xc5,};
-+
-+//#define DUMP_RAW 1
-+
-+static int occ_get_all(struct i2c_client *client, occ_response_t *occ_resp)
++static int occ_get_all(struct i2c_client *client, struct occ_response *occ_resp)
 +{
-+	char occ_data[OCC_DATA_MAX];
-+	uint16_t num_bytes = 0;
-+	int b = 0;
-+	int ret = 0;
-+/*
-+	//Procedure to access SRAM where OCC data is located
-+	occ_putscom(client, SCOM_OCC_SRAM_WOX, 0x08000000, 0x00000000);
-+	occ_putscom(client, SCOM_OCC_SRAM_WAND, 0xFBFFFFFF, 0xFFFFFFFF);
-+	occ_putscom(client, SCOM_OCC_SRAM_ADDR, OCC_RESPONSE_ADDR, 0x00000000);
-+	occ_putscom(client, SCOM_OCC_SRAM_ADDR, OCC_RESPONSE_ADDR, 0x00000000);
-+
-+	occ_getscomb(client, SCOM_OCC_SRAM_DATA, occ_data, 0);
-+
-+*/
++	uint8_t occ_data[OCC_DATA_MAX];
++	uint16_t num_bytes;
++	int b;
++	int ret;
 +
-+	// Init OCB
++	/* Init OCB */
 +	occ_putscom(client, OCB_STATUS_CONTROL_OR,  0x08000000, 0x00000000);
 +	occ_putscom(client, OCB_STATUS_CONTROL_AND, 0xFBFFFFFF, 0xFFFFFFFF);
 +
-+	// Send poll command to OCC
++	/* Send poll command to OCC */
 +	occ_putscom(client, OCB_ADDRESS, OCC_COMMAND_ADDR, 0x00000000);
 +	occ_putscom(client, OCB_ADDRESS, OCC_COMMAND_ADDR, 0x00000000);
 +	occ_putscom(client, OCB_DATA, 0x00000001, 0x10001100);
 +
-+	// Trigger ATTN
++	/* Trigger ATTN */
 +	occ_putscom(client, ATTN_DATA, 0x01010000, 0x00000000);
 +
-+	// TODO: check command status Refere to
-+	// "1.6.2 OCC Command/Response Sequence" in OCC_OpenPwr_FW_Interfaces1.2.pdf
-+	// Use sleep as workaround
-+	//msleep(2000);
-+
-+	// Get response data
++	/* Get response data */
 +	occ_putscom(client, OCB_ADDRESS, OCC_RESPONSE_ADDR, 0x00000000);
 +	occ_getscomb(client, OCB_DATA, occ_data, 0);
 +
-+	/* FIXME: use fake data to test driver without hw */
-+	//printk("i2c-occ: using FAKE occ data\n");
-+	//memcpy(&occ_data[0], &fake_occ_rsp[0], sizeof(occ_data));
-+
 +	num_bytes = get_occdata_length(occ_data);
 +
-+	//printk("OCC data length: %d\n", num_bytes);
-+
-+#ifdef DUMP_RAW
-+	int i = 0;
-+	printk("\nRAW data\n==================\n");
-+	for (i = 0; i < 8; i++) {
-+		if(i == 4) printk("  ");
-+		printk("%02x", occ_data[i]);
-+	}
-+	printk("\n");
-+#endif
++	dev_dbg(&client->dev, "OCC data length: %d\n", num_bytes);
 +
 +	if (num_bytes > OCC_DATA_MAX) {
-+		printk("ERROR: OCC data length must be < 4KB\n");
++		dev_err(&client->dev, "ERROR: OCC data length must be < 4KB\n");
 +		return -1;
 +	}
 +
 +	if (num_bytes <= 0) {
-+		printk("ERROR: OCC data length is zero\n");
++		dev_err(&client->dev, "ERROR: OCC data length is zero\n");
 +		return -1;
 +	}
 +
-+	for (b = 8; b < num_bytes + 8; b = b + 8) {
-+		//occ_getscomb(client, SCOM_OCC_SRAM_DATA, occ_data, b);
++	for (b = 8; b < num_bytes + 8; b = b + 8)
 +		occ_getscomb(client, OCB_DATA, occ_data, b);
-+#ifdef DUMP_RAW
-+	for (i = 0; i < 8; i++) {
-+		if(i == 4) printk("  ");
-+		printk("%02x", occ_data[b+i]);
-+	}
-+	printk("\n");
-+#endif
-+
-+	}
 +
-+	/* FIXME: use fake data to test driver without hw */
-+	//memcpy(&occ_data[0], &fake_occ_rsp[0], sizeof(occ_data));
-+
-+	ret = parse_occ_response(occ_data, occ_resp);
++	ret = parse_occ_response(client, occ_data, occ_resp);
 +
 +	return ret;
 +}
@@ -632,405 +625,257 @@ index 0000000..f265ff3
 +
 +	mutex_lock(&data->update_lock);
 +
-+	if (time_after(jiffies, data->last_updated + data->sample_time)
++	if (time_after(jiffies, data->last_updated + data->update_interval)
 +	    || !data->valid) {
-+		deinit_occ_resp_buf(&data->occ_resp);
-+
++		data->valid = 1;
 +		ret = occ_get_all(client, &data->occ_resp);
-+
++		if (ret)
++			data->valid = 0;
 +		data->last_updated = jiffies;
-+		data->valid = 1;
 +	}
 +	mutex_unlock(&data->update_lock);
 +
 +	return ret;
 +}
 +
-+/* ----------------------------------------------------------------------*/
-+/* sysfs attributes for hwmon */
 +
-+static ssize_t show_occ_temp_input(struct device *hwmon_dev, struct device_attribute *da, char *buf)
++static void* occ_get_sensor(struct device *hwmon_dev, enum sensor_t t)
 +{
-+	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
-+	int n = attr->index;
-+	struct device * dev = hwmon_dev->parent;
++	struct device *dev = hwmon_dev->parent;
 +	struct occ_drv_data *data = dev_get_drvdata(dev);
-+	int ret = 0;
-+	occ_sensor *sensor;
-+	int val = 0;
++	int ret;
++	void *sensor;
 +
 +	ret = occ_update_device(dev);
-+
-+	if (ret != 0)
-+	{
-+		/* FIXME: to test fake data */
-+		printk("ERROR: cannot get occ sensor data: %d\n", ret);
-+		return ret;
++	if (ret != 0) {
++		dev_err(dev, "ERROR: cannot get occ sensor data: %d\n", ret);
++		return NULL;
 +	}
 +
-+	if (data->occ_resp.data.blocks == NULL ||
-+		data->occ_resp.data.blocks[data->occ_resp.temp_block_id].sensor == NULL)
-+		return -1;
-+
-+	//printk("block_id: %d, sensor: %d\n", data->occ_resp.temp_block_id, n -1);
-+	sensor = &data->occ_resp.data.blocks[data->occ_resp.temp_block_id].sensor[n - 1];
-+	/* in millidegree Celsius */
-+	val = sensor->value * 1000;
-+	//printk("temp%d sensor value: %d\n", n, val);
++	if (!data->occ_resp.blocks)
++		return NULL;
++
++	switch (t) {
++	case temp:
++		sensor = data->occ_resp.temp_block_id == -1 ? NULL :
++		data->occ_resp.blocks[data->occ_resp.temp_block_id].sensor;
++		break;
++	case freq:
++		sensor = data->occ_resp.freq_block_id == -1 ? NULL :
++		data->occ_resp.blocks[data->occ_resp.freq_block_id].sensor;
++		break;
++	case power:
++		sensor = data->occ_resp.power_block_id == -1 ? NULL :
++		data->occ_resp.blocks[data->occ_resp.power_block_id].power;
++		break;
++	case caps:
++		sensor = data->occ_resp.caps_block_id == -1 ? NULL :
++		data->occ_resp.blocks[data->occ_resp.caps_block_id].caps;
++		break;
++	default:
++		sensor = NULL;
++		break;
++	}
 +
-+	//printk("------------- above are debug message, bellow is real output------------\n");
-+	return sprintf(buf, "%d\n", val);
++	return sensor;
 +}
 +
-+static ssize_t show_occ_temp_label(struct device *hwmon_dev, struct device_attribute *da, char *buf)
++/* sysfs attributes for hwmon */
++static ssize_t show_occ_temp_input(struct device *hwmon_dev,
++		struct device_attribute *da, char *buf)
 +{
 +	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
 +	int n = attr->index;
-+	struct device *dev = hwmon_dev->parent;
-+	struct occ_drv_data *data = dev_get_drvdata(dev);
-+	int ret = 0;
-+	occ_sensor *sensor;
-+	int val = 0;
++	struct occ_sensor *sensor;
++	int val;
 +
-+	ret = occ_update_device(dev);
++	sensor = occ_get_sensor(hwmon_dev, temp);
++	if (!sensor)
++		val = -1;
++	else
++		/* in millidegree Celsius */
++		val = sensor[n].value * 1000;
 +
-+	if (ret != 0)
-+	{
-+		/* FIXME: to test fake data */
-+		printk("ERROR: cannot get occ sensor data: %d\n", ret);
-+		return ret;
-+	}
-+
-+	if (data->occ_resp.data.blocks == NULL ||
-+		data->occ_resp.data.blocks[data->occ_resp.temp_block_id].sensor == NULL)
-+		return -1;
-+
-+	//printk("temp_block_id: %d, sensor: %d\n", data->occ_resp.temp_block_id, n -1);
-+	sensor = &data->occ_resp.data.blocks[data->occ_resp.temp_block_id].sensor[n - 1];
-+	val = sensor->sensor_id;
-+	//printk("temp%d sensor id: %d\n", n, val);
-+
-+	//printk("------------- above are debug message, bellow is real output------------\n");
 +	return sprintf(buf, "%d\n", val);
 +}
 +
-+static ssize_t show_occ_power_label(struct device *hwmon_dev, struct device_attribute *da, char *buf)
++static ssize_t show_occ_temp_label(struct device *hwmon_dev,
++		struct device_attribute *da, char *buf)
 +{
 +	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
 +	int n = attr->index;
-+	struct device *dev = hwmon_dev->parent;
-+	struct occ_drv_data *data = dev_get_drvdata(dev);
-+	int ret = 0;
-+	powr_sensor *sensor;
-+	int val = 0;
-+
-+	ret = occ_update_device(dev);
-+
-+	if (ret != 0)
-+	{
-+		/* FIXME: to test fake data */
-+		printk("ERROR: cannot get occ sensor data: %d\n", ret);
-+		return ret;
-+	}
-+
-+	//printk("power_block_id: %d, sensor: %d\n", data->occ_resp.power_block_id, n -1);
-+
-+	if (data->occ_resp.data.blocks == NULL ||
-+		data->occ_resp.data.blocks[data->occ_resp.power_block_id].powr == NULL)
-+		return -1;
++	struct occ_sensor *sensor;
++	int val;
 +
-+	sensor = &data->occ_resp.data.blocks[data->occ_resp.power_block_id].powr[n - 1];
-+	val = sensor->sensor_id;
-+	//printk("power%d sensor id: %d\n", n, val);
++	sensor = occ_get_sensor(hwmon_dev, temp);
++	if (!sensor)
++		val = -1;
++	else
++		val = sensor[n].sensor_id;
 +
-+	//printk("------------- above are debug message, bellow is real output------------\n");
 +	return sprintf(buf, "%d\n", val);
 +}
 +
-+
-+static ssize_t show_occ_power_input(struct device *hwmon_dev, struct device_attribute *da, char *buf)
++static ssize_t show_occ_power_label(struct device *hwmon_dev,
++		struct device_attribute *da, char *buf)
 +{
 +	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
 +	int n = attr->index;
-+	struct device *dev = hwmon_dev->parent;
-+	struct occ_drv_data *data = dev_get_drvdata(dev);
-+	int ret = 0;
-+	powr_sensor *sensor;
-+	int val = 0;
++	struct power_sensor *sensor;
++	int val;
 +
-+	ret = occ_update_device(dev);
-+
-+	if (ret != 0)
-+	{
-+		/* FIXME: to test fake data */
-+		printk("ERROR: cannot get occ sensor data: %d\n", ret);
-+		return ret;
-+	}
++	sensor = occ_get_sensor(hwmon_dev, power);
++	if (!sensor)
++		val = -1;
++	else
++		val = sensor[n].sensor_id;
 +
-+	//printk("power block_id: %d, sensor: %d\n", data->occ_resp.power_block_id, n -1);
++	return sprintf(buf, "%d\n", val);
++}
 +
-+	if (data->occ_resp.data.blocks == NULL ||
-+		data->occ_resp.data.blocks[data->occ_resp.power_block_id].powr == NULL)
-+		return -1;
 +
++static ssize_t show_occ_power_input(struct device *hwmon_dev,
++		struct device_attribute *da, char *buf)
++{
++	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
++	int n = attr->index;
++	struct power_sensor *sensor;
++	int val;
 +
-+	sensor = &data->occ_resp.data.blocks[data->occ_resp.power_block_id].powr[n - 1];
-+	val = sensor->value;
-+	//printk("power%d sensor value: %d\n", n, val);
++	sensor = occ_get_sensor(hwmon_dev, power);
++	if (!sensor)
++		val = -1;
++	else
++		val = sensor[n].value;
 +
-+	//printk("------------- above are debug message, bellow is real output------------\n");
 +	return sprintf(buf, "%d\n", val);
 +}
 +
 +
-+static ssize_t show_occ_freq_label(struct device *hwmon_dev, struct device_attribute *da, char *buf)
++static ssize_t show_occ_freq_label(struct device *hwmon_dev,
++		struct device_attribute *da, char *buf)
 +{
 +	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
 +	int n = attr->index;
-+	struct device *dev = hwmon_dev->parent;
-+	struct occ_drv_data *data = dev_get_drvdata(dev);
-+	int ret = 0;
-+	occ_sensor *sensor;
-+	int val = 0;
-+
-+	ret = occ_update_device(dev);
++	struct occ_sensor *sensor;
++	int val;
 +
-+	if (ret != 0)
-+	{
-+		/* FIXME: to test fake data */
-+		printk("ERROR: cannot get occ sensor data: %d\n", ret);
-+		return ret;
-+	}
++	sensor = occ_get_sensor(hwmon_dev, freq);
++	if (!sensor)
++		val = -1;
++	else
++		val = sensor[n].sensor_id;
 +
-+	if (data->occ_resp.data.blocks == NULL ||
-+		data->occ_resp.data.blocks[data->occ_resp.freq_block_id].sensor == NULL)
-+		return -1;
-+
-+	//printk("freq_block_id: %d, sensor: %d\n", data->occ_resp.freq_block_id, n -1);
-+	sensor = &data->occ_resp.data.blocks[data->occ_resp.freq_block_id].sensor[n - 1];
-+	val = sensor->sensor_id;
-+	//printk("freq%d sensor id: %d\n", n, val);
-+
-+	//printk("------------- above are debug message, bellow is real output------------\n");
 +	return sprintf(buf, "%d\n", val);
 +}
 +
 +
-+static ssize_t show_occ_freq_input(struct device *hwmon_dev, struct device_attribute *da, char *buf)
++static ssize_t show_occ_freq_input(struct device *hwmon_dev,
++		struct device_attribute *da, char *buf)
 +{
 +	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
 +	int n = attr->index;
-+	struct device *dev = hwmon_dev->parent;
-+	struct occ_drv_data *data = dev_get_drvdata(dev);
-+	int ret = 0;
-+	occ_sensor *sensor;
-+	int val = 0;
-+
-+	ret = occ_update_device(dev);
++	struct occ_sensor *sensor;
++	int val;
 +
-+	if (ret != 0)
-+	{
-+		/* FIXME: to test fake data */
-+		printk("ERROR: cannot get occ sensor data: %d\n", ret);
-+		return ret;
-+	}
-+
-+	if (data->occ_resp.data.blocks == NULL ||
-+		data->occ_resp.data.blocks[data->occ_resp.freq_block_id].sensor == NULL)
-+		return -1;
++	sensor = occ_get_sensor(hwmon_dev, freq);
++	if (!sensor)
++		val = -1;
++	else
++		val = sensor[n].value;
 +
-+	//printk("block_id: %d, sensor: %d\n", data->occ_resp.freq_block_id, n -1);
-+	sensor = &data->occ_resp.data.blocks[data->occ_resp.freq_block_id].sensor[n - 1];
-+	val = sensor->value;
-+	//printk("freq%d sensor value: %d\n", n, val);
-+
-+	//printk("------------- above are debug message, bellow is real output------------\n");
 +	return sprintf(buf, "%d\n", val);
 +}
 +
-+static ssize_t show_occ_caps(struct device *hwmon_dev, struct device_attribute *da, char *buf)
++static ssize_t show_occ_caps(struct device *hwmon_dev,
++		struct device_attribute *da, char *buf)
 +{
 +	struct sensor_device_attribute_2 *attr = to_sensor_dev_attr_2(da);
 +	int nr = attr->nr;
 +	int n = attr->index;
-+	struct device *dev = hwmon_dev->parent;
-+	struct occ_drv_data *data = dev_get_drvdata(dev);
-+	int ret = 0;
-+	caps_sensor *sensor;
-+	int val = 0;
++	struct caps_sensor *sensor;
++	int val;
 +
-+	ret = occ_update_device(dev);
-+	if (ret != 0)
-+	{
-+		/* FIXME: to test fake data */
-+		printk("ERROR: cannot get occ sensor data: %d\n", ret);
-+		return ret;
++	sensor = occ_get_sensor(hwmon_dev, caps);
++	if (!sensor) {
++		val = -1;
++		return sprintf(buf, "%d\n", val);
 +	}
 +
-+	//printk("block_id: %d, sensor: %d, nr: %d\n", data->occ_resp.caps_block_id, n - 1, nr);
-+	if (data->occ_resp.data.blocks == NULL ||
-+		data->occ_resp.data.blocks[data->occ_resp.caps_block_id].caps == NULL)
-+		return -1;
-+
-+	sensor = &data->occ_resp.data.blocks[data->occ_resp.caps_block_id].caps[n - 1];
-+
 +	switch (nr) {
-+		case 0:
-+			val = sensor->curr_powercap;
-+			break;
-+		case 1:
-+			val = sensor->curr_powerreading;
-+			break;
-+		case 2:
-+			val = sensor->norm_powercap;
-+			break;
-+		case 3:
-+			val = sensor->max_powercap;
-+			break;
-+		case 4:
-+			val = sensor->min_powercap;
-+			break;
-+		case 5:
-+			val = sensor->user_powerlimit;
-+			break;
-+		default:
-+			val = 0;
++	case 0:
++		val = sensor[n].curr_powercap;
++		break;
++	case 1:
++		val = sensor[n].curr_powerreading;
++		break;
++	case 2:
++		val = sensor[n].norm_powercap;
++		break;
++	case 3:
++		val = sensor[n].max_powercap;
++		break;
++	case 4:
++		val = sensor[n].min_powercap;
++		break;
++	case 5:
++		val = sensor[n].user_powerlimit;
++		break;
++	default:
++		val = -1;
 +	}
 +
-+	//printk("caps%d sensor value: %d, nr: %d\n", n, val, nr);
-+
-+	//printk("------------- above are debug message, bellow is real output------------\n");
 +	return sprintf(buf, "%d\n", val);
 +}
 +
-+#if 0
-+static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, show_occ_temp_input, NULL, 1);
-+static SENSOR_DEVICE_ATTR(temp2_input, S_IRUGO, show_occ_temp_input, NULL, 2);
-+static SENSOR_DEVICE_ATTR(temp3_input, S_IRUGO, show_occ_temp_input, NULL, 3);
-+static SENSOR_DEVICE_ATTR(temp4_input, S_IRUGO, show_occ_temp_input, NULL, 4);
-+static SENSOR_DEVICE_ATTR(temp5_input, S_IRUGO, show_occ_temp_input, NULL, 5);
-+static SENSOR_DEVICE_ATTR(temp6_input, S_IRUGO, show_occ_temp_input, NULL, 6);
-+static SENSOR_DEVICE_ATTR(temp7_input, S_IRUGO, show_occ_temp_input, NULL, 7);
-+static SENSOR_DEVICE_ATTR(temp8_input, S_IRUGO, show_occ_temp_input, NULL, 8);
-+static SENSOR_DEVICE_ATTR(temp9_input, S_IRUGO, show_occ_temp_input, NULL, 9);
-+static SENSOR_DEVICE_ATTR(temp1_label, S_IRUGO, show_occ_temp_label, NULL, 1);
-+static SENSOR_DEVICE_ATTR(temp2_label, S_IRUGO, show_occ_temp_label, NULL, 2);
-+static SENSOR_DEVICE_ATTR(temp3_label, S_IRUGO, show_occ_temp_label, NULL, 3);
-+static SENSOR_DEVICE_ATTR(temp4_label, S_IRUGO, show_occ_temp_label, NULL, 4);
-+static SENSOR_DEVICE_ATTR(temp5_label, S_IRUGO, show_occ_temp_label, NULL, 5);
-+static SENSOR_DEVICE_ATTR(temp6_label, S_IRUGO, show_occ_temp_label, NULL, 6);
-+static SENSOR_DEVICE_ATTR(temp7_label, S_IRUGO, show_occ_temp_label, NULL, 7);
-+static SENSOR_DEVICE_ATTR(temp8_label, S_IRUGO, show_occ_temp_label, NULL, 8);
-+static SENSOR_DEVICE_ATTR(temp9_label, S_IRUGO, show_occ_temp_label, NULL, 9);
-+
-+static SENSOR_DEVICE_ATTR(power1_input, S_IRUGO, show_occ_power_input, NULL, 1);
-+static SENSOR_DEVICE_ATTR(power1_label, S_IRUGO, show_occ_power_label, NULL, 1);
-+static SENSOR_DEVICE_ATTR(power2_input, S_IRUGO, show_occ_power_input, NULL, 2);
-+static SENSOR_DEVICE_ATTR(power2_label, S_IRUGO, show_occ_power_label, NULL, 2);
-+static SENSOR_DEVICE_ATTR(power3_input, S_IRUGO, show_occ_power_input, NULL, 3);
-+static SENSOR_DEVICE_ATTR(power3_label, S_IRUGO, show_occ_power_label, NULL, 3);
-+static SENSOR_DEVICE_ATTR(power4_input, S_IRUGO, show_occ_power_input, NULL, 4);
-+static SENSOR_DEVICE_ATTR(power4_label, S_IRUGO, show_occ_power_label, NULL, 4);
-+
-+static SENSOR_DEVICE_ATTR(freq1_input, S_IRUGO, show_occ_freq_input, NULL, 1);
-+static SENSOR_DEVICE_ATTR(freq1_label, S_IRUGO, show_occ_freq_label, NULL, 1);
-+static SENSOR_DEVICE_ATTR(freq2_input, S_IRUGO, show_occ_freq_input, NULL, 2);
-+static SENSOR_DEVICE_ATTR(freq2_label, S_IRUGO, show_occ_freq_label, NULL, 2);
-+static SENSOR_DEVICE_ATTR(freq3_input, S_IRUGO, show_occ_freq_input, NULL, 3);
-+static SENSOR_DEVICE_ATTR(freq3_label, S_IRUGO, show_occ_freq_label, NULL, 3);
-+static SENSOR_DEVICE_ATTR(freq4_input, S_IRUGO, show_occ_freq_input, NULL, 4);
-+static SENSOR_DEVICE_ATTR(freq4_label, S_IRUGO, show_occ_freq_label, NULL, 4);
-+
-+static struct attribute *occ_attrs[] = {
-+	&sensor_dev_attr_temp1_input.dev_attr.attr,
-+	&sensor_dev_attr_temp2_input.dev_attr.attr,
-+	&sensor_dev_attr_temp3_input.dev_attr.attr,
-+	&sensor_dev_attr_temp4_input.dev_attr.attr,
-+	&sensor_dev_attr_temp5_input.dev_attr.attr,
-+	&sensor_dev_attr_temp6_input.dev_attr.attr,
-+	&sensor_dev_attr_temp7_input.dev_attr.attr,
-+	&sensor_dev_attr_temp8_input.dev_attr.attr,
-+	&sensor_dev_attr_temp9_input.dev_attr.attr,
-+	&sensor_dev_attr_temp1_label.dev_attr.attr,
-+	&sensor_dev_attr_temp2_label.dev_attr.attr,
-+	&sensor_dev_attr_temp3_label.dev_attr.attr,
-+	&sensor_dev_attr_temp4_label.dev_attr.attr,
-+	&sensor_dev_attr_temp5_label.dev_attr.attr,
-+	&sensor_dev_attr_temp6_label.dev_attr.attr,
-+	&sensor_dev_attr_temp7_label.dev_attr.attr,
-+	&sensor_dev_attr_temp8_label.dev_attr.attr,
-+	&sensor_dev_attr_temp9_label.dev_attr.attr,
-+	&sensor_dev_attr_power1_input.dev_attr.attr,
-+	&sensor_dev_attr_power2_input.dev_attr.attr,
-+	&sensor_dev_attr_power3_input.dev_attr.attr,
-+	&sensor_dev_attr_power4_input.dev_attr.attr,
-+	&sensor_dev_attr_power1_label.dev_attr.attr,
-+	&sensor_dev_attr_power2_label.dev_attr.attr,
-+	&sensor_dev_attr_power3_label.dev_attr.attr,
-+	&sensor_dev_attr_power4_label.dev_attr.attr,
-+	&sensor_dev_attr_freq1_input.dev_attr.attr,
-+	&sensor_dev_attr_freq2_input.dev_attr.attr,
-+	&sensor_dev_attr_freq3_input.dev_attr.attr,
-+	&sensor_dev_attr_freq4_input.dev_attr.attr,
-+	&sensor_dev_attr_freq1_label.dev_attr.attr,
-+	&sensor_dev_attr_freq2_label.dev_attr.attr,
-+	&sensor_dev_attr_freq3_label.dev_attr.attr,
-+	&sensor_dev_attr_freq4_label.dev_attr.attr,
-+
-+	NULL
-+};
-+ATTRIBUTE_GROUPS(occ);
-+
-+#endif
-+
 +static struct sensor_device_attribute temp_input[] = {
-+	SENSOR_ATTR(temp1_input, S_IRUGO, show_occ_temp_input, NULL, 1),
-+	SENSOR_ATTR(temp2_input, S_IRUGO, show_occ_temp_input, NULL, 2),
-+	SENSOR_ATTR(temp3_input, S_IRUGO, show_occ_temp_input, NULL, 3),
-+	SENSOR_ATTR(temp4_input, S_IRUGO, show_occ_temp_input, NULL, 4),
-+	SENSOR_ATTR(temp5_input, S_IRUGO, show_occ_temp_input, NULL, 5),
-+	SENSOR_ATTR(temp6_input, S_IRUGO, show_occ_temp_input, NULL, 6),
-+	SENSOR_ATTR(temp7_input, S_IRUGO, show_occ_temp_input, NULL, 7),
-+	SENSOR_ATTR(temp8_input, S_IRUGO, show_occ_temp_input, NULL, 8),
-+	SENSOR_ATTR(temp9_input, S_IRUGO, show_occ_temp_input, NULL, 9),
-+	SENSOR_ATTR(temp10_input, S_IRUGO, show_occ_temp_input, NULL, 10),
-+	SENSOR_ATTR(temp11_input, S_IRUGO, show_occ_temp_input, NULL, 11),
-+	SENSOR_ATTR(temp12_input, S_IRUGO, show_occ_temp_input, NULL, 12),
-+	SENSOR_ATTR(temp13_input, S_IRUGO, show_occ_temp_input, NULL, 13),
-+	SENSOR_ATTR(temp14_input, S_IRUGO, show_occ_temp_input, NULL, 14),
-+	SENSOR_ATTR(temp15_input, S_IRUGO, show_occ_temp_input, NULL, 15),
-+	SENSOR_ATTR(temp16_input, S_IRUGO, show_occ_temp_input, NULL, 16),
-+	SENSOR_ATTR(temp17_input, S_IRUGO, show_occ_temp_input, NULL, 17),
-+	SENSOR_ATTR(temp18_input, S_IRUGO, show_occ_temp_input, NULL, 18),
-+	SENSOR_ATTR(temp19_input, S_IRUGO, show_occ_temp_input, NULL, 19),
-+	SENSOR_ATTR(temp20_input, S_IRUGO, show_occ_temp_input, NULL, 20),
-+	SENSOR_ATTR(temp21_input, S_IRUGO, show_occ_temp_input, NULL, 21),
-+	SENSOR_ATTR(temp22_input, S_IRUGO, show_occ_temp_input, NULL, 22),
++	SENSOR_ATTR(temp1_input, S_IRUGO, show_occ_temp_input, NULL, 0),
++	SENSOR_ATTR(temp2_input, S_IRUGO, show_occ_temp_input, NULL, 1),
++	SENSOR_ATTR(temp3_input, S_IRUGO, show_occ_temp_input, NULL, 2),
++	SENSOR_ATTR(temp4_input, S_IRUGO, show_occ_temp_input, NULL, 3),
++	SENSOR_ATTR(temp5_input, S_IRUGO, show_occ_temp_input, NULL, 4),
++	SENSOR_ATTR(temp6_input, S_IRUGO, show_occ_temp_input, NULL, 5),
++	SENSOR_ATTR(temp7_input, S_IRUGO, show_occ_temp_input, NULL, 6),
++	SENSOR_ATTR(temp8_input, S_IRUGO, show_occ_temp_input, NULL, 7),
++	SENSOR_ATTR(temp9_input, S_IRUGO, show_occ_temp_input, NULL, 8),
++	SENSOR_ATTR(temp10_input, S_IRUGO, show_occ_temp_input, NULL, 9),
++	SENSOR_ATTR(temp11_input, S_IRUGO, show_occ_temp_input, NULL, 10),
++	SENSOR_ATTR(temp12_input, S_IRUGO, show_occ_temp_input, NULL, 11),
++	SENSOR_ATTR(temp13_input, S_IRUGO, show_occ_temp_input, NULL, 12),
++	SENSOR_ATTR(temp14_input, S_IRUGO, show_occ_temp_input, NULL, 13),
++	SENSOR_ATTR(temp15_input, S_IRUGO, show_occ_temp_input, NULL, 14),
++	SENSOR_ATTR(temp16_input, S_IRUGO, show_occ_temp_input, NULL, 15),
++	SENSOR_ATTR(temp17_input, S_IRUGO, show_occ_temp_input, NULL, 16),
++	SENSOR_ATTR(temp18_input, S_IRUGO, show_occ_temp_input, NULL, 17),
++	SENSOR_ATTR(temp19_input, S_IRUGO, show_occ_temp_input, NULL, 18),
++	SENSOR_ATTR(temp20_input, S_IRUGO, show_occ_temp_input, NULL, 19),
++	SENSOR_ATTR(temp21_input, S_IRUGO, show_occ_temp_input, NULL, 20),
++	SENSOR_ATTR(temp22_input, S_IRUGO, show_occ_temp_input, NULL, 21),
 +};
 +
 +static struct sensor_device_attribute temp_label[] = {
-+	SENSOR_ATTR(temp1_label, S_IRUGO, show_occ_temp_label, NULL, 1),
-+	SENSOR_ATTR(temp2_label, S_IRUGO, show_occ_temp_label, NULL, 2),
-+	SENSOR_ATTR(temp3_label, S_IRUGO, show_occ_temp_label, NULL, 3),
-+	SENSOR_ATTR(temp4_label, S_IRUGO, show_occ_temp_label, NULL, 4),
-+	SENSOR_ATTR(temp5_label, S_IRUGO, show_occ_temp_label, NULL, 5),
-+	SENSOR_ATTR(temp6_label, S_IRUGO, show_occ_temp_label, NULL, 6),
-+	SENSOR_ATTR(temp7_label, S_IRUGO, show_occ_temp_label, NULL, 7),
-+	SENSOR_ATTR(temp8_label, S_IRUGO, show_occ_temp_label, NULL, 8),
-+	SENSOR_ATTR(temp9_label, S_IRUGO, show_occ_temp_label, NULL, 9),
-+	SENSOR_ATTR(temp10_label, S_IRUGO, show_occ_temp_label, NULL, 10),
-+	SENSOR_ATTR(temp11_label, S_IRUGO, show_occ_temp_label, NULL, 11),
-+	SENSOR_ATTR(temp12_label, S_IRUGO, show_occ_temp_label, NULL, 12),
-+	SENSOR_ATTR(temp13_label, S_IRUGO, show_occ_temp_label, NULL, 13),
-+	SENSOR_ATTR(temp14_label, S_IRUGO, show_occ_temp_label, NULL, 14),
-+	SENSOR_ATTR(temp15_label, S_IRUGO, show_occ_temp_label, NULL, 15),
-+	SENSOR_ATTR(temp16_label, S_IRUGO, show_occ_temp_label, NULL, 16),
-+	SENSOR_ATTR(temp17_label, S_IRUGO, show_occ_temp_label, NULL, 17),
-+	SENSOR_ATTR(temp18_label, S_IRUGO, show_occ_temp_label, NULL, 18),
-+	SENSOR_ATTR(temp19_label, S_IRUGO, show_occ_temp_label, NULL, 19),
-+	SENSOR_ATTR(temp20_label, S_IRUGO, show_occ_temp_label, NULL, 20),
-+	SENSOR_ATTR(temp21_label, S_IRUGO, show_occ_temp_label, NULL, 21),
-+	SENSOR_ATTR(temp22_label, S_IRUGO, show_occ_temp_label, NULL, 22),
++	SENSOR_ATTR(temp1_label, S_IRUGO, show_occ_temp_label, NULL, 0),
++	SENSOR_ATTR(temp2_label, S_IRUGO, show_occ_temp_label, NULL, 1),
++	SENSOR_ATTR(temp3_label, S_IRUGO, show_occ_temp_label, NULL, 2),
++	SENSOR_ATTR(temp4_label, S_IRUGO, show_occ_temp_label, NULL, 3),
++	SENSOR_ATTR(temp5_label, S_IRUGO, show_occ_temp_label, NULL, 4),
++	SENSOR_ATTR(temp6_label, S_IRUGO, show_occ_temp_label, NULL, 5),
++	SENSOR_ATTR(temp7_label, S_IRUGO, show_occ_temp_label, NULL, 6),
++	SENSOR_ATTR(temp8_label, S_IRUGO, show_occ_temp_label, NULL, 7),
++	SENSOR_ATTR(temp9_label, S_IRUGO, show_occ_temp_label, NULL, 8),
++	SENSOR_ATTR(temp10_label, S_IRUGO, show_occ_temp_label, NULL, 9),
++	SENSOR_ATTR(temp11_label, S_IRUGO, show_occ_temp_label, NULL, 10),
++	SENSOR_ATTR(temp12_label, S_IRUGO, show_occ_temp_label, NULL, 11),
++	SENSOR_ATTR(temp13_label, S_IRUGO, show_occ_temp_label, NULL, 12),
++	SENSOR_ATTR(temp14_label, S_IRUGO, show_occ_temp_label, NULL, 13),
++	SENSOR_ATTR(temp15_label, S_IRUGO, show_occ_temp_label, NULL, 14),
++	SENSOR_ATTR(temp16_label, S_IRUGO, show_occ_temp_label, NULL, 15),
++	SENSOR_ATTR(temp17_label, S_IRUGO, show_occ_temp_label, NULL, 16),
++	SENSOR_ATTR(temp18_label, S_IRUGO, show_occ_temp_label, NULL, 17),
++	SENSOR_ATTR(temp19_label, S_IRUGO, show_occ_temp_label, NULL, 18),
++	SENSOR_ATTR(temp20_label, S_IRUGO, show_occ_temp_label, NULL, 19),
++	SENSOR_ATTR(temp21_label, S_IRUGO, show_occ_temp_label, NULL, 20),
++	SENSOR_ATTR(temp22_label, S_IRUGO, show_occ_temp_label, NULL, 21),
 +
 +};
 +
@@ -1093,29 +938,29 @@ index 0000000..f265ff3
 +
 +
 +static struct sensor_device_attribute freq_input[] = {
-+	SENSOR_ATTR(freq1_input, S_IRUGO, show_occ_freq_input, NULL, 1),
-+	SENSOR_ATTR(freq2_input, S_IRUGO, show_occ_freq_input, NULL, 2),
-+	SENSOR_ATTR(freq3_input, S_IRUGO, show_occ_freq_input, NULL, 3),
-+	SENSOR_ATTR(freq4_input, S_IRUGO, show_occ_freq_input, NULL, 4),
-+	SENSOR_ATTR(freq5_input, S_IRUGO, show_occ_freq_input, NULL, 5),
-+	SENSOR_ATTR(freq6_input, S_IRUGO, show_occ_freq_input, NULL, 6),
-+	SENSOR_ATTR(freq7_input, S_IRUGO, show_occ_freq_input, NULL, 7),
-+	SENSOR_ATTR(freq8_input, S_IRUGO, show_occ_freq_input, NULL, 8),
-+	SENSOR_ATTR(freq9_input, S_IRUGO, show_occ_freq_input, NULL, 9),
-+	SENSOR_ATTR(freq10_input, S_IRUGO, show_occ_freq_input, NULL, 10),
++	SENSOR_ATTR(freq1_input, S_IRUGO, show_occ_freq_input, NULL, 0),
++	SENSOR_ATTR(freq2_input, S_IRUGO, show_occ_freq_input, NULL, 1),
++	SENSOR_ATTR(freq3_input, S_IRUGO, show_occ_freq_input, NULL, 2),
++	SENSOR_ATTR(freq4_input, S_IRUGO, show_occ_freq_input, NULL, 3),
++	SENSOR_ATTR(freq5_input, S_IRUGO, show_occ_freq_input, NULL, 4),
++	SENSOR_ATTR(freq6_input, S_IRUGO, show_occ_freq_input, NULL, 5),
++	SENSOR_ATTR(freq7_input, S_IRUGO, show_occ_freq_input, NULL, 6),
++	SENSOR_ATTR(freq8_input, S_IRUGO, show_occ_freq_input, NULL, 7),
++	SENSOR_ATTR(freq9_input, S_IRUGO, show_occ_freq_input, NULL, 8),
++	SENSOR_ATTR(freq10_input, S_IRUGO, show_occ_freq_input, NULL, 9),
 +};
 +
 +static struct sensor_device_attribute freq_label[] = {
-+	SENSOR_ATTR(freq1_label, S_IRUGO, show_occ_freq_label, NULL, 1),
-+	SENSOR_ATTR(freq2_label, S_IRUGO, show_occ_freq_label, NULL, 2),
-+	SENSOR_ATTR(freq3_label, S_IRUGO, show_occ_freq_label, NULL, 3),
-+	SENSOR_ATTR(freq4_label, S_IRUGO, show_occ_freq_label, NULL, 4),
-+	SENSOR_ATTR(freq5_label, S_IRUGO, show_occ_freq_label, NULL, 5),
-+	SENSOR_ATTR(freq6_label, S_IRUGO, show_occ_freq_label, NULL, 6),
-+	SENSOR_ATTR(freq7_label, S_IRUGO, show_occ_freq_label, NULL, 7),
-+	SENSOR_ATTR(freq8_label, S_IRUGO, show_occ_freq_label, NULL, 8),
-+	SENSOR_ATTR(freq9_label, S_IRUGO, show_occ_freq_label, NULL, 9),
-+	SENSOR_ATTR(freq10_label, S_IRUGO, show_occ_freq_label, NULL, 10),
++	SENSOR_ATTR(freq1_label, S_IRUGO, show_occ_freq_label, NULL, 0),
++	SENSOR_ATTR(freq2_label, S_IRUGO, show_occ_freq_label, NULL, 1),
++	SENSOR_ATTR(freq3_label, S_IRUGO, show_occ_freq_label, NULL, 2),
++	SENSOR_ATTR(freq4_label, S_IRUGO, show_occ_freq_label, NULL, 3),
++	SENSOR_ATTR(freq5_label, S_IRUGO, show_occ_freq_label, NULL, 4),
++	SENSOR_ATTR(freq6_label, S_IRUGO, show_occ_freq_label, NULL, 5),
++	SENSOR_ATTR(freq7_label, S_IRUGO, show_occ_freq_label, NULL, 6),
++	SENSOR_ATTR(freq8_label, S_IRUGO, show_occ_freq_label, NULL, 7),
++	SENSOR_ATTR(freq9_label, S_IRUGO, show_occ_freq_label, NULL, 8),
++	SENSOR_ATTR(freq10_label, S_IRUGO, show_occ_freq_label, NULL, 9),
 +
 +};
 +
@@ -1153,22 +998,24 @@ index 0000000..f265ff3
 +};
 +
 +static struct sensor_device_attribute_2 caps_curr_powercap[] = {
-+	SENSOR_ATTR_2(caps_curr_powercap, S_IRUGO, show_occ_caps, NULL, 0, 1),
++	SENSOR_ATTR_2(caps_curr_powercap, S_IRUGO, show_occ_caps, NULL, 0, 0),
 +};
 +static struct sensor_device_attribute_2 caps_curr_powerreading[] = {
-+	SENSOR_ATTR_2(caps_curr_powerreading, S_IRUGO, show_occ_caps, NULL, 1, 1),
++	SENSOR_ATTR_2(caps_curr_powerreading, S_IRUGO,
++		show_occ_caps, NULL, 1, 0),
 +};
 +static struct sensor_device_attribute_2 caps_norm_powercap[] = {
-+	SENSOR_ATTR_2(caps_norm_powercap, S_IRUGO, show_occ_caps, NULL, 2, 1),
++	SENSOR_ATTR_2(caps_norm_powercap, S_IRUGO, show_occ_caps,
++		NULL, 2, 0),
 +};
 +static struct sensor_device_attribute_2 caps_max_powercap[] = {
-+	SENSOR_ATTR_2(caps_max_powercap, S_IRUGO, show_occ_caps, NULL, 3, 1),
++	SENSOR_ATTR_2(caps_max_powercap, S_IRUGO, show_occ_caps, NULL, 3, 0),
 +};
 +static struct sensor_device_attribute_2 caps_min_powercap[] = {
-+	SENSOR_ATTR_2(caps_min_powercap, S_IRUGO, show_occ_caps, NULL, 4, 1),
++	SENSOR_ATTR_2(caps_min_powercap, S_IRUGO, show_occ_caps, NULL, 4, 0),
 +};
 +static struct sensor_device_attribute_2 caps_user_powerlimit[] = {
-+	SENSOR_ATTR_2(caps_user_powerlimit, S_IRUGO, show_occ_caps, NULL, 5, 1),
++	SENSOR_ATTR_2(caps_user_powerlimit, S_IRUGO, show_occ_caps, NULL, 5, 0),
 +};
 +#define CAPS_UNIT_ATTRS(X)                      \
 +{	&caps_curr_powercap[X].dev_attr.attr,           \
@@ -1189,31 +1036,31 @@ index 0000000..f265ff3
 +};
 +
 +static struct sensor_device_attribute power_input[] = {
-+	SENSOR_ATTR(power1_input, S_IRUGO, show_occ_power_input, NULL, 1),
-+	SENSOR_ATTR(power2_input, S_IRUGO, show_occ_power_input, NULL, 2),
-+	SENSOR_ATTR(power3_input, S_IRUGO, show_occ_power_input, NULL, 3),
-+	SENSOR_ATTR(power4_input, S_IRUGO, show_occ_power_input, NULL, 4),
-+	SENSOR_ATTR(power5_input, S_IRUGO, show_occ_power_input, NULL, 5),
-+	SENSOR_ATTR(power6_input, S_IRUGO, show_occ_power_input, NULL, 6),
-+	SENSOR_ATTR(power7_input, S_IRUGO, show_occ_power_input, NULL, 7),
-+	SENSOR_ATTR(power8_input, S_IRUGO, show_occ_power_input, NULL, 8),
-+	SENSOR_ATTR(power9_input, S_IRUGO, show_occ_power_input, NULL, 9),
-+	SENSOR_ATTR(power10_input, S_IRUGO, show_occ_power_input, NULL, 10),
-+	SENSOR_ATTR(power11_input, S_IRUGO, show_occ_power_input, NULL, 11),
++	SENSOR_ATTR(power1_input, S_IRUGO, show_occ_power_input, NULL, 0),
++	SENSOR_ATTR(power2_input, S_IRUGO, show_occ_power_input, NULL, 1),
++	SENSOR_ATTR(power3_input, S_IRUGO, show_occ_power_input, NULL, 2),
++	SENSOR_ATTR(power4_input, S_IRUGO, show_occ_power_input, NULL, 3),
++	SENSOR_ATTR(power5_input, S_IRUGO, show_occ_power_input, NULL, 4),
++	SENSOR_ATTR(power6_input, S_IRUGO, show_occ_power_input, NULL, 5),
++	SENSOR_ATTR(power7_input, S_IRUGO, show_occ_power_input, NULL, 6),
++	SENSOR_ATTR(power8_input, S_IRUGO, show_occ_power_input, NULL, 7),
++	SENSOR_ATTR(power9_input, S_IRUGO, show_occ_power_input, NULL, 8),
++	SENSOR_ATTR(power10_input, S_IRUGO, show_occ_power_input, NULL, 9),
++	SENSOR_ATTR(power11_input, S_IRUGO, show_occ_power_input, NULL, 10),
 +};
 +
 +static struct sensor_device_attribute power_label[] = {
-+	SENSOR_ATTR(power1_label, S_IRUGO, show_occ_power_label, NULL, 1),
-+	SENSOR_ATTR(power2_label, S_IRUGO, show_occ_power_label, NULL, 2),
-+	SENSOR_ATTR(power3_label, S_IRUGO, show_occ_power_label, NULL, 3),
-+	SENSOR_ATTR(power4_label, S_IRUGO, show_occ_power_label, NULL, 4),
-+	SENSOR_ATTR(power5_label, S_IRUGO, show_occ_power_label, NULL, 5),
-+	SENSOR_ATTR(power6_label, S_IRUGO, show_occ_power_label, NULL, 6),
-+	SENSOR_ATTR(power7_label, S_IRUGO, show_occ_power_label, NULL, 7),
-+	SENSOR_ATTR(power8_label, S_IRUGO, show_occ_power_label, NULL, 8),
-+	SENSOR_ATTR(power9_label, S_IRUGO, show_occ_power_label, NULL, 9),
-+	SENSOR_ATTR(power10_label, S_IRUGO, show_occ_power_label, NULL, 10),
-+	SENSOR_ATTR(power11_label, S_IRUGO, show_occ_power_label, NULL, 11),
++	SENSOR_ATTR(power1_label, S_IRUGO, show_occ_power_label, NULL, 0),
++	SENSOR_ATTR(power2_label, S_IRUGO, show_occ_power_label, NULL, 1),
++	SENSOR_ATTR(power3_label, S_IRUGO, show_occ_power_label, NULL, 2),
++	SENSOR_ATTR(power4_label, S_IRUGO, show_occ_power_label, NULL, 3),
++	SENSOR_ATTR(power5_label, S_IRUGO, show_occ_power_label, NULL, 4),
++	SENSOR_ATTR(power6_label, S_IRUGO, show_occ_power_label, NULL, 5),
++	SENSOR_ATTR(power7_label, S_IRUGO, show_occ_power_label, NULL, 6),
++	SENSOR_ATTR(power8_label, S_IRUGO, show_occ_power_label, NULL, 7),
++	SENSOR_ATTR(power9_label, S_IRUGO, show_occ_power_label, NULL, 8),
++	SENSOR_ATTR(power10_label, S_IRUGO, show_occ_power_label, NULL, 9),
++	SENSOR_ATTR(power11_label, S_IRUGO, show_occ_power_label, NULL, 10),
 +};
 +
 +#define POWER_UNIT_ATTRS(X)                      \
@@ -1251,10 +1098,49 @@ index 0000000..f265ff3
 +	{ .attrs = occ_power_attr[10] },
 +};
 +
++static ssize_t show_update_interval(struct device *hwmon_dev,
++				struct device_attribute *attr, char *buf)
++{
++	struct device *dev = hwmon_dev->parent;
++	struct occ_drv_data *data = dev_get_drvdata(dev);
++
++        return sprintf(buf, "%u\n", jiffies_to_msecs(data->update_interval));
++}
++
++static ssize_t set_update_interval(struct device *hwmon_dev,
++				struct device_attribute *attr,
++				const char *buf, size_t count)
++{
++	struct device *dev = hwmon_dev->parent;
++	struct occ_drv_data *data = dev_get_drvdata(dev);
++        unsigned long val;
++        int err;
++
++        err = kstrtoul(buf, 10, &val);
++        if (err)
++                return err;
++
++	data->update_interval = msecs_to_jiffies(val);
++        return count;
++}
++static DEVICE_ATTR(update_interval, S_IWUSR | S_IRUGO,
++		show_update_interval, set_update_interval);
++
++static ssize_t show_name(struct device *hwmon_dev,
++				struct device_attribute *attr, char *buf)
++{
++        return sprintf(buf, "%s\n", OCC_I2C_NAME);
++}
++static DEVICE_ATTR(name, S_IRUGO, show_name, NULL);
++
++
 +static void occ_remove_sysfs_files(struct device *dev)
 +{
 +	int i = 0;
 +
++	device_remove_file(dev, &dev_attr_update_interval);
++	device_remove_file(dev, &dev_attr_name);
++
 +	for (i = 0; i < ARRAY_SIZE(occ_temp_attr_group); i++)
 +		sysfs_remove_group(&dev->kobj, &occ_temp_attr_group[i]);
 +
@@ -1273,35 +1159,49 @@ index 0000000..f265ff3
 +{
 +	/* The sensor number varies for different
 +	 * platform depending on core number. We'd better
-+	 * create them dynamically  */
-+	struct occ_drv_data *data = dev_get_drvdata(dev);
++	 * create them dynamically
++	 */
++	struct occ_drv_data *drv_data = dev_get_drvdata(dev);
 +	int i = 0;
 +	int num_of_sensors = 0;
 +	int ret = 0;
++	struct occ_response *rsp = NULL;
 +
 +	/* get sensor number from occ. */
++	rsp = &drv_data->occ_resp;
++
++	rsp->freq_block_id = -1;
++	rsp->temp_block_id = -1;
++	rsp->power_block_id = -1;
++	rsp->caps_block_id = -1;
++
 +	ret = occ_update_device(dev);
-+	if (ret != 0)
-+	{
-+		/* FIXME: to test fake data */
-+		printk("ERROR: cannot get occ sensor data: %d\n", ret);
++	if (ret != 0) {
++		dev_err(dev, "ERROR: cannot get occ sensor data: %d\n", ret);
 +		return ret;
 +	}
 +
-+	if (data->occ_resp.data.blocks == NULL)
++	if (!rsp->blocks)
 +		return -1;
 +
++	ret = device_create_file(drv_data->hwmon_dev,
++			&dev_attr_name);
++	if (ret)
++		goto error;
++
++	ret = device_create_file(drv_data->hwmon_dev,
++			&dev_attr_update_interval);
++	if (ret)
++		goto error;
++
 +	/* temp sensors */
-+	if (data->occ_resp.temp_block_id >= 0)
-+	{
-+		num_of_sensors = data->occ_resp.data.blocks[data->occ_resp.temp_block_id].num_of_sensors;
-+		for (i = 0; i < num_of_sensors; i++)
-+		{
-+			//printk("create temp group: %d\n", i);
-+			//ret = sysfs_create_group(&dev->kobj, &occ_temp_attr_group[i]);
-+			ret = sysfs_create_group(&data->hwmon_dev->kobj, &occ_temp_attr_group[i]);
-+			if (ret)
-+			{
++	if (rsp->temp_block_id >= 0) {
++		num_of_sensors =
++			rsp->blocks[rsp->temp_block_id].num_of_sensors;
++		for (i = 0; i < num_of_sensors; i++) {
++			ret = sysfs_create_group(&drv_data->hwmon_dev->kobj,
++				&occ_temp_attr_group[i]);
++			if (ret) {
 +				dev_err(dev, "error create temp sysfs entry\n");
 +				goto error;
 +			}
@@ -1309,16 +1209,13 @@ index 0000000..f265ff3
 +	}
 +
 +	/* freq sensors */
-+	if (data->occ_resp.freq_block_id >= 0)
-+	{
-+		num_of_sensors = data->occ_resp.data.blocks[data->occ_resp.freq_block_id].num_of_sensors;
-+		for (i = 0; i < num_of_sensors; i++)
-+		{
-+			//printk("create freq group: %d\n", i);
-+			//ret = sysfs_create_group(&dev->kobj, &occ_temp_attr_group[i]);
-+			ret = sysfs_create_group(&data->hwmon_dev->kobj, &occ_freq_attr_group[i]);
-+			if (ret)
-+			{
++	if (rsp->freq_block_id >= 0) {
++		num_of_sensors =
++			rsp->blocks[rsp->freq_block_id].num_of_sensors;
++		for (i = 0; i < num_of_sensors; i++) {
++			ret = sysfs_create_group(&drv_data->hwmon_dev->kobj,
++				&occ_freq_attr_group[i]);
++			if (ret) {
 +				dev_err(dev, "error create freq sysfs entry\n");
 +				goto error;
 +			}
@@ -1326,17 +1223,13 @@ index 0000000..f265ff3
 +	}
 +
 +	/* power sensors */
-+	//printk("power_block_id: %d\n", data->occ_resp.power_block_id);
-+	if (data->occ_resp.power_block_id >= 0)
-+	{
-+		num_of_sensors = data->occ_resp.data.blocks[data->occ_resp.power_block_id].num_of_sensors;
-+		for (i = 0; i < num_of_sensors; i++)
-+		{
-+			//printk("create power group: %d\n", i);
-+			//ret = sysfs_create_group(&dev->kobj, &occ_temp_attr_group[i]);
-+			ret = sysfs_create_group(&data->hwmon_dev->kobj, &occ_power_attr_group[i]);
-+			if (ret)
-+			{
++	if (rsp->power_block_id >= 0) {
++		num_of_sensors =
++			rsp->blocks[rsp->power_block_id].num_of_sensors;
++		for (i = 0; i < num_of_sensors; i++) {
++			ret = sysfs_create_group(&drv_data->hwmon_dev->kobj,
++				&occ_power_attr_group[i]);
++			if (ret) {
 +				dev_err(dev, "error create power sysfs entry\n");
 +				goto error;
 +			}
@@ -1344,17 +1237,13 @@ index 0000000..f265ff3
 +	}
 +
 +	/* caps sensors */
-+	//printk("caps_block_id: %d\n", data->occ_resp.caps_block_id);
-+	if (data->occ_resp.caps_block_id >= 0)
-+	{
-+		num_of_sensors = data->occ_resp.data.blocks[data->occ_resp.caps_block_id].num_of_sensors;
-+		for (i = 0; i < num_of_sensors; i++)
-+		{
-+			//printk("create caps group: %d\n", i);
-+			//ret = sysfs_create_group(&dev->kobj, &occ_temp_attr_group[i]);
-+			ret = sysfs_create_group(&data->hwmon_dev->kobj, &occ_caps_attr_group[i]);
-+			if (ret)
-+			{
++	if (rsp->caps_block_id >= 0) {
++		num_of_sensors =
++			rsp->blocks[rsp->caps_block_id].num_of_sensors;
++		for (i = 0; i < num_of_sensors; i++) {
++			ret = sysfs_create_group(&drv_data->hwmon_dev->kobj,
++				&occ_caps_attr_group[i]);
++			if (ret) {
 +				dev_err(dev, "error create caps sysfs entry\n");
 +				goto error;
 +			}
@@ -1363,15 +1252,12 @@ index 0000000..f265ff3
 +
 +	return 0;
 +error:
-+	occ_remove_sysfs_files(data->hwmon_dev);
++	occ_remove_sysfs_files(drv_data->hwmon_dev);
 +	return ret;
 +}
 +
-+/*-----------------------------------------------------------------------*/
 +/* device probe and removal */
 +
-+#define OCC_I2C_ADDR 0x50
-+#define OCC_I2C_NAME "occ-i2c"
 +
 +enum occ_type {
 +	occ_id,
@@ -1381,9 +1267,6 @@ index 0000000..f265ff3
 +{
 +	struct device *dev = &client->dev;
 +	struct occ_drv_data *data;
-+	unsigned long funcs;
-+	struct device_node *np = dev->of_node;
-+	//u32 pval = 0;
 +	int ret = 0;
 +
 +	data = devm_kzalloc(dev, sizeof(struct occ_drv_data), GFP_KERNEL);
@@ -1393,48 +1276,28 @@ index 0000000..f265ff3
 +	data->client = client;
 +	i2c_set_clientdata(client, data);
 +	mutex_init(&data->update_lock);
-+	data->sample_time = HZ;
-+
-+	/* Yi: i2c-core should assign address to
-+	 * client when detection - but it does not work  FIXME  */
-+	//client->addr = OCC_I2C_ADDR;
-+
-+	/* Yi: read address from device table */
-+	//if (of_property_read_u32(np, "reg", &pval)) {
-+	//	dev_err(&client->dev, "invalid reg\n");
-+	//}
-+	//client->addr = pval;
++	data->update_interval = HZ;
 +
 +	/* configure the driver */
-+	//dev_dbg(dev, "occ register hwmon @0x%x\n", client->addr);
-+	//data->hwmon_dev = hwmon_device_register_with_groups(dev, "occ",
-+	//						    data, occ_groups);
++	dev_dbg(dev, "occ register hwmon @0x%x\n", client->addr);
 +
-+	/* Yi: try to create sysfs attributes dynamically */
++	/* create sysfs attributes based on sensor number read from OCC */
 +	data->hwmon_dev = hwmon_device_register(dev);
 +	if (IS_ERR(data->hwmon_dev))
 +		return PTR_ERR(data->hwmon_dev);
 +
 +	ret = occ_create_sysfs_attribute(dev);
-+	if (ret)
-+	{
++	if (ret) {
 +		hwmon_device_unregister(data->hwmon_dev);
 +		return ret;
 +	}
 +
 +	data->hwmon_dev->parent = dev;
 +
-+	//dev_dbg(dev, "%s: sensor '%s'\n",
-+	//	 dev_name(data->hwmon_dev), client->name);
-+
-+	funcs = i2c_get_functionality(client->adapter);
-+	//dev_info(dev, "i2c adaptor supports function: 0x%lx\n", funcs);
-+
-+	/* Yi: seems always error? disable for now */
-+	//occ_check_i2c_errors(client);
++	dev_dbg(dev, "%s: sensor '%s'\n",
++		 dev_name(data->hwmon_dev), client->name);
 +
-+	//dev_info(dev, "occ i2c driver ready: i2c addr@0x%x\n", client->addr);
-+	printk("occ i2c driver ready: i2c addr@0x%x\n", client->addr);
++	dev_info(dev, "occ i2c driver ready: i2c addr@0x%x\n", client->addr);
 +
 +	return 0;
 +}
@@ -1446,120 +1309,46 @@ index 0000000..f265ff3
 +	/* free allocated sensor memory */
 +	deinit_occ_resp_buf(&data->occ_resp);
 +
-+	//occ_remove_sysfs_files(&client->dev);
 +	occ_remove_sysfs_files(data->hwmon_dev);
 +	hwmon_device_unregister(data->hwmon_dev);
 +	return 0;
 +}
 +
-+/* used for old-style board info */
++/* used by old-style board info. */
 +static const struct i2c_device_id occ_ids[] = {
-+	{ OCC_I2C_NAME, occ_id, },
-+	{ /* LIST END */ }
++        { OCC_I2C_NAME, occ_id, },
++        { /* LIST END */ }
 +};
 +MODULE_DEVICE_TABLE(i2c, occ_ids);
 +
++/* use by device table */
 +static const struct of_device_id i2c_occ_of_match[] = {
 +	{.compatible = "ibm,occ-i2c"},
 +	{},
 +};
-+
 +MODULE_DEVICE_TABLE(of, i2c_occ_of_match);
 +
-+#ifdef CONFIG_PM
-+static int occ_suspend(struct device *dev)
-+{
-+	//struct i2c_client *client = to_i2c_client(dev);
-+	/* TODO */
-+	return 0;
-+}
-+
-+static int occ_resume(struct device *dev)
-+{
-+	//struct i2c_client *client = to_i2c_client(dev);
-+	/* TODO */
-+	return 0;
-+}
-+
-+static const struct dev_pm_ops occ_dev_pm_ops = {
-+	.suspend	= occ_suspend,
-+	.resume		= occ_resume,
-+};
-+#define OCC_DEV_PM_OPS (&occ_dev_pm_ops)
-+#else
-+#define OCC_DEV_PM_OPS NULL
-+#endif /* CONFIG_PM */
-+
-+/* Yi: i2c-core uses i2c-detect() to detect device in bellow address list.
-+   If exists, address will be assigned to client.
-+ * It is also possible to read address from device table. */
++/* i2c-core uses i2c-detect() to detect device in bellow address list.
++ *  If exists, address will be assigned to client.
++ * It is also possible to read address from device table.
++ */
 +static const unsigned short normal_i2c[] = {0x50, 0x51, I2C_CLIENT_END };
 +
-+/* Return 0 if detection is successful, -ENODEV otherwise */
-+static int occ_detect(struct i2c_client *new_client,
-+		       struct i2c_board_info *info)
-+{
-+	/* i2c-core need this function to create new device */
-+	strncpy(info->type, OCC_I2C_NAME, sizeof(OCC_I2C_NAME));
-+	return 0;
-+}
-+
 +static struct i2c_driver occ_driver = {
 +	.class		= I2C_CLASS_HWMON,
 +	.driver = {
 +		.name	= OCC_I2C_NAME,
-+		.pm	= OCC_DEV_PM_OPS,
++		.pm	= NULL,
 +		.of_match_table = i2c_occ_of_match,
 +	},
 +	.probe		= occ_probe,
 +	.remove		= occ_remove,
-+	.id_table	= occ_ids,
++        .id_table       = occ_ids,
 +	.address_list	= normal_i2c,
-+	.detect		= occ_detect,
 +};
 +
 +module_i2c_driver(occ_driver);
 +
-+#if 0
-+/* Create new i2c device */
-+static struct i2c_board_info my_dev_info[] __initdata = {
-+	{
-+		I2C_BOARD_INFO(OCC_I2C_NAME, 0x50),
-+	},
-+};
-+
-+static struct i2c_client *my_client;
-+
-+static int occ_init(void)
-+{
-+	static int sys_adap_bus_num = 3;
-+	struct i2c_adapter* adap = i2c_get_adapter(sys_adap_bus_num);
-+
-+	if(adap==NULL) {
-+		printk("[OCC-DEBUG] i2c_get_adapter fail!\n");
-+		return -1;
-+	}
-+
-+	my_client = i2c_new_device(adap, &my_dev_info[0]);
-+	if( my_client==NULL ){
-+		printk("[OCC-DEBUG] i2c_new_device fail!\n");
-+		return -1;
-+	}
-+	i2c_put_adapter(adap);
-+	return i2c_add_driver(&occ_driver);
-+}
-+
-+static void __exit occ_exit(void)
-+{
-+	i2c_unregister_device(my_client);
-+	i2c_del_driver(&occ_driver);
-+}
-+
-+module_init(occ_init);
-+module_exit(occ_exit);
-+
-+#endif
-+
 +MODULE_AUTHOR("Li Yi <shliyi@cn.ibm.com>");
-+MODULE_DESCRIPTION("BMC OCC monitor driver");
++MODULE_DESCRIPTION("BMC OCC hwmon driver");
 +MODULE_LICENSE("GPL");
-- 
2.6.3
