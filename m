Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 651021A074D
 for <openbmc@lists.ozlabs.org>; Thu, 12 Nov 2015 22:06:46 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447323630383434.46392019030793;
 Thu, 12 Nov 2015 02:20:30 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: adamliyi <adamliyi@msn.com>
Subject: [PATCH kernel-hwmon-occ 07/10] make it work with two socket machine
 (two occ)
Date: Thu, 12 Nov 2015 05:20:09 -0500
Message-Id: <1447323612-15427-8-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447323612-15427-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1447323612-15427-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 12 Nov 2015 11:06:47 -0000

From: adamliyi <adamliyi@msn.com>

---
 occ.c | 393 +++++++++++++++++++++++++++++++++++++++---------------------------
 1 file changed, 234 insertions(+), 159 deletions(-)

diff --git a/occ.c b/occ.c
index adf773b..7ae59e6 100644
--- a/occ.c
+++ b/occ.c
@@ -1,5 +1,5 @@
 /*
- * BMC OCC HWMON driver - read Power8 OCC (On Chip Controller) sensor data via i2c.
+ * Open BMC OCC HWMON driver - read Power8 OCC (On Chip Controller) sensor data via i2c.
  *
  * Copyright (c) 2015 IBM (Alvin Wang, Li Yi) 
  *
@@ -30,7 +30,7 @@
 #include <linux/of.h>
 #include <linux/delay.h>
 
-#define DEBUG    1
+//#define DEBUG    1
 
 /* ------------------------------------------------------------*/
 /* OCC sensor data format */
@@ -108,7 +108,7 @@ struct occ_drv_data {
 	struct mutex		update_lock;
 	char			valid;		/* !=0 if sensor data are valid */
 	unsigned long		last_updated;	/* In jiffies */
-	unsigned long		sample_time;	/* In jiffies */
+	unsigned long		sample_time;	/* Mininum timer interval for sampling In jiffies */
 	occ_response_t		*occ_resp;
 };
 
@@ -141,7 +141,6 @@ struct occ_drv_data {
 #define OCC_COMMAND_ADDR 0xFFFF6000
 #define OCC_RESPONSE_ADDR 0xFFFF7000
 
-
 static int deinit_occ_resp_buf(occ_response_t *p)
 {
 	int b;
@@ -157,6 +156,8 @@ static int deinit_occ_resp_buf(occ_response_t *p)
 			kfree(p->data.blocks[b].sensor);
 		if (!p->data.blocks[b].powr)	
 			kfree(p->data.blocks[b].powr);
+		if (!p->data.blocks[b].caps)	
+			kfree(p->data.blocks[b].caps);
 	}
 
 	kfree(p->data.blocks);
@@ -173,7 +174,7 @@ static ssize_t occ_i2c_read(struct i2c_client *client, char *buf, size_t count)
 	if (count > 8192)
 		count = 8192;
 
-	pr_debug("i2c_read: reading %zu bytes.\n", count);
+	//printk("i2c_read: reading %zu bytes @0x%x.\n", count, client->addr);
 	ret = i2c_master_recv(client, buf, count);
 	return ret;
 }
@@ -185,7 +186,7 @@ static ssize_t occ_i2c_write(struct i2c_client *client, const char *buf, size_t
 	if (count > 8192)
 		count = 8192;
 
-	pr_debug("i2c_write: writing %zu bytes.\n", count);
+	//printk("i2c_write: writing %zu bytes @0x%x.\n", count, client->addr);
 	ret = i2c_master_send(client, buf, count);
 	return ret;
 }
@@ -201,6 +202,7 @@ static int occ_getscom(struct i2c_client *client, uint32_t address, uint32_t *va
 	address = address << 1;
 	
 	ret = occ_i2c_write(client, address_buf, sizeof(address));
+	/* FIXME: ast i2c driver does not read corret value */
 	//if (ret != sizeof(address))
 	//	return -I2C_WRITE_ERROR;
 	
@@ -337,7 +339,7 @@ static int parse_occ_response(char* d, occ_response_t* o)
 	if (o->data.blocks == NULL)
 		return -ENOMEM;
   	
-	printk("Reading %d sensor blocks\n", o->data.num_of_sensor_blocks);
+	//printk("Reading %d sensor blocks\n", o->data.num_of_sensor_blocks);
 	for(b = 0; b < o->data.num_of_sensor_blocks; b++) {
 		/* 8-byte sensor block head */
 		strncpy(&o->data.blocks[b].sensor_type[0], (const char*)&d[dnum], 4);
@@ -347,9 +349,9 @@ static int parse_occ_response(char* d, occ_response_t* o)
 		o->data.blocks[b].num_of_sensors = d[dnum+7];
 		dnum = dnum + 8;
 		
-		printk("sensor block[%d]: type: %s, num_of_sensors: %d, sensor_length: %u\n",
-			b, o->data.blocks[b].sensor_type, o->data.blocks[b].num_of_sensors,
-			o->data.blocks[b].sensor_length);
+		//printk("sensor block[%d]: type: %s, num_of_sensors: %d, sensor_length: %u\n",
+			//b, o->data.blocks[b].sensor_type, o->data.blocks[b].num_of_sensors,
+			//o->data.blocks[b].sensor_length);
 	
 		/* empty sensor block */	
 		if (o->data.blocks[b].num_of_sensors <= 0)
@@ -372,8 +374,8 @@ static int parse_occ_response(char* d, occ_response_t* o)
 					o->data.blocks[b].sensor[s].sensor_id | d[dnum+1];
 				o->data.blocks[b].sensor[s].value = d[dnum+2] << 8;
 				o->data.blocks[b].sensor[s].value = o->data.blocks[b].sensor[s].value | d[dnum+3];
-				printk("sensor[%d]-[%d]: id: %u, value: %u\n",
-					b, s, o->data.blocks[b].sensor[s].sensor_id, o->data.blocks[b].sensor[s].value);
+				//printk("sensor[%d]-[%d]: id: %u, value: %u\n",
+				//	b, s, o->data.blocks[b].sensor[s].sensor_id, o->data.blocks[b].sensor[s].value);
 				dnum = dnum + o->data.blocks[b].sensor_length;
 			}
 		}
@@ -394,8 +396,8 @@ static int parse_occ_response(char* d, occ_response_t* o)
 					o->data.blocks[b].sensor[s].sensor_id | d[dnum+1];
 				o->data.blocks[b].sensor[s].value = d[dnum+2] << 8;
 				o->data.blocks[b].sensor[s].value = o->data.blocks[b].sensor[s].value | d[dnum+3];
-				printk("sensor[%d]-[%d]: id: %u, value: %u\n",
-					b, s, o->data.blocks[b].sensor[s].sensor_id, o->data.blocks[b].sensor[s].value);
+				//printk("sensor[%d]-[%d]: id: %u, value: %u\n",
+				//	b, s, o->data.blocks[b].sensor[s].sensor_id, o->data.blocks[b].sensor[s].value);
 				dnum = dnum + o->data.blocks[b].sensor_length;
 			}
 		}
@@ -423,8 +425,8 @@ static int parse_occ_response(char* d, occ_response_t* o)
 				o->data.blocks[b].powr[s].value = d[dnum+10] << 8;
 				o->data.blocks[b].powr[s].value = o->data.blocks[b].powr[s].value | d[dnum+11];
 				
-				printk("sensor[%d]-[%d]: id: %u, value: %u\n",
-					b, s, o->data.blocks[b].powr[s].sensor_id, o->data.blocks[b].powr[s].value);
+				//printk("sensor[%d]-[%d]: id: %u, value: %u\n",
+				//	b, s, o->data.blocks[b].powr[s].sensor_id, o->data.blocks[b].powr[s].value);
 				
 				dnum = dnum + o->data.blocks[b].sensor_length;
 			}
@@ -454,31 +456,30 @@ static int parse_occ_response(char* d, occ_response_t* o)
 				o->data.blocks[b].caps[s].user_powerlimit = o->data.blocks[b].caps[s].user_powerlimit| d[dnum+11];
 
 				dnum = dnum + o->data.blocks[b].sensor_length;
-				printk("CAPS sensor #%d:\n", s);
-				printk("curr_powercap is %x \n", o->data.blocks[b].caps[s].curr_powercap);
-				printk("curr_powerreading is %x \n", o->data.blocks[b].caps[s].curr_powerreading);
-				printk("norm_powercap is %x \n", o->data.blocks[b].caps[s].norm_powercap);
-				printk("max_powercap is %x \n", o->data.blocks[b].caps[s].max_powercap);
-				printk("min_powercap is %x \n", o->data.blocks[b].caps[s].min_powercap);
-				printk("user_powerlimit is %x \n", o->data.blocks[b].caps[s].user_powerlimit);
+				//printk("CAPS sensor #%d:\n", s);
+				//printk("curr_powercap is %x \n", o->data.blocks[b].caps[s].curr_powercap);
+				//printk("curr_powerreading is %x \n", o->data.blocks[b].caps[s].curr_powerreading);
+				//printk("norm_powercap is %x \n", o->data.blocks[b].caps[s].norm_powercap);
+				//printk("max_powercap is %x \n", o->data.blocks[b].caps[s].max_powercap);
+				//printk("min_powercap is %x \n", o->data.blocks[b].caps[s].min_powercap);
+				//printk("user_powerlimit is %x \n", o->data.blocks[b].caps[s].user_powerlimit);
 			}
 		
 		}
 		else {
       			printk("ERROR: sensor type %s not supported\n", o->data.blocks[b].sensor_type);
-      			continue;
-			/* FIX: ignore wrong sensor type? */
-			//ret = -1;
-			//goto abort;
+			ret = -1;
+			goto abort;
 		}
 	}
 
-	return ret;
+	return 0;
 abort:
 	deinit_occ_resp_buf(o);
 	return ret;  
 }
 
+/* used for testing */
 char fake_occ_rsp[OCC_DATA_MAX] = {
 0x69, 0x00, 0x00, 0x00, 0xa4, 0xc3, 0x00, 0x03, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 0x00, 0x00, 0x00, 0x00, 0x00, 0x6f, 0x70, 0x5f, 0x6f, 0x63, 0x63, 0x5f, 0x31, 0x35, 0x30, 0x37,
@@ -492,7 +493,7 @@ char fake_occ_rsp[OCC_DATA_MAX] = {
 0x52,0x00,0x01,0x0c, 0x00,0x43,0x41,0x50, 0x53,0x00,0x01,0x0c, 0x01,0x00,0x00,0x00,    
 0x00,0x04,0xb0,0x09, 0x60,0x04,0x4c,0x00, 0x00,0x17,0xc5,}; 
 
-#define DUMP_RAW 1
+//#define DUMP_RAW 1
 
 static int occ_get_all(struct i2c_client *client, occ_response_t *occ_resp)
 {
@@ -523,7 +524,8 @@ static int occ_get_all(struct i2c_client *client, occ_response_t *occ_resp)
 	// Trigger ATTN
 	occ_putscom(client, ATTN_DATA, 0x01010000, 0x00000000);
 
-    	// TODO: check command status Refere to "1.6.2 OCC Command/Response Sequence" in OCC_OpenPwr_FW_Interfaces1.2.pdf
+    	// TODO: check command status Refere to 
+	// "1.6.2 OCC Command/Response Sequence" in OCC_OpenPwr_FW_Interfaces1.2.pdf
     	// Use sleep as workaround
 	//msleep(2000);
 
@@ -531,14 +533,13 @@ static int occ_get_all(struct i2c_client *client, occ_response_t *occ_resp)
 	occ_putscom(client, OCB_ADDRESS, OCC_RESPONSE_ADDR, 0x00000000);
 	occ_getscomb(client, OCB_DATA, occ_data, 0);
 
-
 	/* FIXME: use fake data to test driver without hw */
 	//printk("i2c-occ: using FAKE occ data\n");
 	//memcpy(&occ_data[0], &fake_occ_rsp[0], sizeof(occ_data));
 	
 	num_bytes = get_occdata_length(occ_data);
 	
-	printk("OCC data length: %d\n", num_bytes);
+	//printk("OCC data length: %d\n", num_bytes);
 
 #ifdef DUMP_RAW
 	int i = 0;
@@ -549,12 +550,9 @@ static int occ_get_all(struct i2c_client *client, occ_response_t *occ_resp)
 	}
 	printk("\n");
 #endif
-
-
 	
 	if (num_bytes > OCC_DATA_MAX) {
       		printk("ERROR: OCC data length must be < 4KB\n");
-		/* yi: debug */
 		return -1;
 	}
 	
@@ -580,7 +578,7 @@ static int occ_get_all(struct i2c_client *client, occ_response_t *occ_resp)
 	//memcpy(&occ_data[0], &fake_occ_rsp[0], sizeof(occ_data));
 	
 	ret = parse_occ_response(occ_data, occ_resp);
-	
+
 	return ret;	
 }
 
@@ -595,8 +593,6 @@ static int occ_update_device(struct device *dev)
 
 	if (time_after(jiffies, data->last_updated + data->sample_time)
 	    || !data->valid) {
-		dev_dbg(&client->dev, "Starting occ update\n");
-
 		deinit_occ_resp_buf(data->occ_resp);
 		
 		ret = occ_get_all(client, data->occ_resp);
@@ -610,131 +606,138 @@ static int occ_update_device(struct device *dev)
 }
 
 /* ----------------------------------------------------------------------*/
-/* sysfs interface */
+/* sysfs attributes for hwmon */
 
-static int print_occ_resp(char *buf, occ_response_t *p, int index)
+static ssize_t show_occ_temp_input(struct device *dev, struct device_attribute *da, char *buf)
 {
-	int i = 0;
-	int j = 0;
-	sensor_data_block *block;
+	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
+	int n = attr->index; 	
+	struct occ_drv_data *data = dev_get_drvdata(dev);
+	int ret = 0;
 	occ_sensor *sensor;
-	powr_sensor *powr;
-
-	printk("occ hwmon all: index: %d\n", index);
-	printk("------------- above are debug message, bellow is real output------------\n");	
-	sprintf(buf, "Dump all sensor data from OCC - Todo\n");
+	int val = 0;
+	
+	ret = occ_update_device(dev);
 
-	return 0;
-#if 0
-	sprintf(buf, "num_of_sensor_blocks: %u\n", p->data.num_of_sensor_blocks);
-	for (i = 0; i < p->data.num_of_sensor_blocks; i++)
+	if (ret != 0)
 	{
-		block = &p->data.blocks[i];
-		if (block == NULL)
-			continue;
-
-		snprintf(buf, sizeof(block->sensor_type), "sensor_type: %s\n", block->sensor_type);
-		sprintf(buf, "num_of_sensors: %u\n", block->num_of_sensors);
-		sprintf(buf, "sensor_length: %u\n", block->sensor_length);
-		
-		if (block->sensor_length == 0)
-			continue;
+		/* FIXME: to test fake data */
+		printk("ERROR: cannot get occ sensor data: %d\n", ret);
+		return ret;
+	}
+	
+	if (data->occ_resp->data.blocks == NULL ||
+		data->occ_resp->data.blocks[data->occ_resp->temp_block_id].sensor == NULL)
+		return -1;
 
-		if (strcmp(block->sensor_type, "TEMP") == 0)
-		{
-			for (j = 0; j < block->num_of_sensors; j++)
-			{
-				sensor = &block->sensor[j];
-				if (sensor == NULL)
-					continue;
+	//printk("block_id: %d, sensor: %d\n", data->occ_resp->temp_block_id, n -1);	
+	sensor = &data->occ_resp->data.blocks[data->occ_resp->temp_block_id].sensor[n - 1];
+	val = sensor->value;
+	//printk("temp%d sensor value: %d\n", n, val);
 
-				sprintf(buf, "sensor_id: %u\n", sensor->sensor_id);
-				sprintf(buf, "value: %u\n", sensor->value);
-			}
-		}
+	//printk("------------- above are debug message, bellow is real output------------\n");	
+	return sprintf(buf, "%d\n", val);
+}
 
+static ssize_t show_occ_temp_label(struct device *dev, struct device_attribute *da, char *buf)
+{
+	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
+	int n = attr->index; 	
+	struct occ_drv_data *data = dev_get_drvdata(dev);
+	int ret = 0;
+	occ_sensor *sensor;
+	int val = 0;
+	
+	ret = occ_update_device(dev);
 
-		if (strcmp(block->sensor_type, "FREQ") == 0)
-		{
-			for (j = 0; j < block->num_of_sensors; j++)
-			{
-				sensor = &block->sensor[j];
-				if (sensor == NULL)
-					continue;
-				
-				sprintf(buf, "sensor_id: %u\n", sensor->sensor_id);
-				sprintf(buf, "value: %u\n", sensor->value);
-			}
+	if (ret != 0)
+	{
+		/* FIXME: to test fake data */
+		printk("ERROR: cannot get occ sensor data: %d\n", ret);
+		return ret;
+	}
+	
+	if (data->occ_resp->data.blocks == NULL ||
+		data->occ_resp->data.blocks[data->occ_resp->temp_block_id].sensor == NULL)
+		return -1;
 
-		}
+	//printk("temp_block_id: %d, sensor: %d\n", data->occ_resp->temp_block_id, n -1);	
+	sensor = &data->occ_resp->data.blocks[data->occ_resp->temp_block_id].sensor[n - 1];
+	val = sensor->sensor_id;
+	//printk("temp%d sensor id: %d\n", n, val);
 
-		if (strcmp(block->sensor_type, "POWR") == 0)
-		{
-			for (j = 0; j < block->num_of_sensors; j++)
-			{
-				powr = &block->powr[j];
-				if (powr == NULL)
-					continue;
-
-				sprintf(buf, "sensor_id: %u\n", powr->sensor_id);
-				sprintf(buf, "value: %u\n", powr->value);
-				sprintf(buf, "update_tag: %u\n", powr->update_tag);
-				sprintf(buf, "accumulator: %u\n", powr->accumulator);
-			}
-		}
-	}
-	return 0;
-#endif	
+	//printk("------------- above are debug message, bellow is real output------------\n");	
+	return sprintf(buf, "%d\n", val);
 }
 
-/* sysfs attributes for hwmon */
-static ssize_t show_occ_data(struct device *dev, struct device_attribute *da, char *buf)
+static ssize_t show_occ_power_label(struct device *dev, struct device_attribute *da, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
 	int n = attr->index; 	
 	struct occ_drv_data *data = dev_get_drvdata(dev);
 	int ret = 0;
-
+	powr_sensor *sensor;
+	int val = 0;
+	
 	ret = occ_update_device(dev);
 
-	if (ret != 0);
+	if (ret != 0)
 	{
 		/* FIXME: to test fake data */
-		//printk("ERROR: cannot get occ sensor data\n");
-		//return ret;
+		printk("ERROR: cannot get occ sensor data: %d\n", ret);
+		return ret;
 	}
+	
+	//printk("power_block_id: %d, sensor: %d\n", data->occ_resp->power_block_id, n -1);	
+	
+	if (data->occ_resp->data.blocks == NULL ||
+		data->occ_resp->data.blocks[data->occ_resp->power_block_id].powr == NULL) 
+		return -1;
+	
+	sensor = &data->occ_resp->data.blocks[data->occ_resp->power_block_id].powr[n - 1];
+	val = sensor->sensor_id;
+	//printk("power%d sensor id: %d\n", n, val);
 
-	return print_occ_resp(buf, data->occ_resp, n);
+	//printk("------------- above are debug message, bellow is real output------------\n");	
+	return sprintf(buf, "%d\n", val);
 }
 
-static ssize_t show_occ_temp(struct device *dev, struct device_attribute *da, char *buf)
+
+static ssize_t show_occ_power_input(struct device *dev, struct device_attribute *da, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
 	int n = attr->index; 	
 	struct occ_drv_data *data = dev_get_drvdata(dev);
 	int ret = 0;
-	occ_sensor *sensor;
+	powr_sensor *sensor;
 	int val = 0;
 	
 	ret = occ_update_device(dev);
 
-	if (ret != 0);
+	if (ret != 0)
 	{
 		/* FIXME: to test fake data */
-		//printk("ERROR: cannot get occ sensor data\n");
-		//return ret;
+		printk("ERROR: cannot get occ sensor data: %d\n", ret);
+		return ret;
 	}
+	
+	//printk("power block_id: %d, sensor: %d\n", data->occ_resp->power_block_id, n -1);	
+	
+	if (data->occ_resp->data.blocks == NULL ||
+		data->occ_resp->data.blocks[data->occ_resp->power_block_id].powr == NULL) 
+		return -1;
+	
 
-	printk("temp_block_id: %d, sensor: %d\n", data->occ_resp->temp_block_id, n -1);	
-	sensor = &data->occ_resp->data.blocks[data->occ_resp->temp_block_id].sensor[n - 1];
+	sensor = &data->occ_resp->data.blocks[data->occ_resp->power_block_id].powr[n - 1];
 	val = sensor->value;
-	printk("temp%d sensor value\n", n, val);
+	//printk("power%d sensor value: %d\n", n, val);
 
-	printk("------------- above are debug message, bellow is real output------------\n");	
+	//printk("------------- above are debug message, bellow is real output------------\n");	
 	return sprintf(buf, "%d\n", val);
 }
 
-static ssize_t show_occ_temp_label(struct device *dev, struct device_attribute *da, char *buf)
+
+static ssize_t show_occ_freq_label(struct device *dev, struct device_attribute *da, char *buf)
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
 	int n = attr->index; 	
@@ -745,33 +748,67 @@ static ssize_t show_occ_temp_label(struct device *dev, struct device_attribute *
 	
 	ret = occ_update_device(dev);
 
-	if (ret != 0);
+	if (ret != 0)
 	{
 		/* FIXME: to test fake data */
-		//printk("ERROR: cannot get occ sensor data\n");
-		//return ret;
+		printk("ERROR: cannot get occ sensor data: %d\n", ret);
+		return ret;
 	}
 	
-	sensor = &data->occ_resp->data.blocks[data->occ_resp->temp_block_id].sensor[n - 1];
+	if (data->occ_resp->data.blocks == NULL ||
+		data->occ_resp->data.blocks[data->occ_resp->freq_block_id].sensor == NULL) 
+		return -1;
+
+	//printk("freq_block_id: %d, sensor: %d\n", data->occ_resp->freq_block_id, n -1);	
+	sensor = &data->occ_resp->data.blocks[data->occ_resp->freq_block_id].sensor[n - 1];
 	val = sensor->sensor_id;
-	printk("temp%d sensor id\n", n, val);
-	printk("------------- above are debug message, bellow is real output------------\n");	
-	
-	return sprintf(buf, "sensor id: %d\n", val);
+	//printk("freq%d sensor id: %d\n", n, val);
+
+	//printk("------------- above are debug message, bellow is real output------------\n");	
+	return sprintf(buf, "%d\n", val);
 }
 
 
-static SENSOR_DEVICE_ATTR(all, S_IRUGO, show_occ_data, NULL, 0);
-static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, show_occ_temp, NULL, 1);
-static SENSOR_DEVICE_ATTR(temp2_input, S_IRUGO, show_occ_temp, NULL, 2);
-static SENSOR_DEVICE_ATTR(temp3_input, S_IRUGO, show_occ_temp, NULL, 3);
-static SENSOR_DEVICE_ATTR(temp4_input, S_IRUGO, show_occ_temp, NULL, 4);
-static SENSOR_DEVICE_ATTR(temp5_input, S_IRUGO, show_occ_temp, NULL, 5);
-static SENSOR_DEVICE_ATTR(temp6_input, S_IRUGO, show_occ_temp, NULL, 6);
-static SENSOR_DEVICE_ATTR(temp7_input, S_IRUGO, show_occ_temp, NULL, 7);
-static SENSOR_DEVICE_ATTR(temp8_input, S_IRUGO, show_occ_temp, NULL, 8);
-static SENSOR_DEVICE_ATTR(temp9_input, S_IRUGO, show_occ_temp, NULL, 9);
-static SENSOR_DEVICE_ATTR(temp10_input, S_IRUGO, show_occ_temp, NULL, 10);
+static ssize_t show_occ_freq_input(struct device *dev, struct device_attribute *da, char *buf)
+{
+	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
+	int n = attr->index; 	
+	struct occ_drv_data *data = dev_get_drvdata(dev);
+	int ret = 0;
+	occ_sensor *sensor;
+	int val = 0;
+	
+	ret = occ_update_device(dev);
+
+	if (ret != 0)
+	{
+		/* FIXME: to test fake data */
+		printk("ERROR: cannot get occ sensor data: %d\n", ret);
+		return ret;
+	}
+	
+	if (data->occ_resp->data.blocks == NULL ||
+		data->occ_resp->data.blocks[data->occ_resp->freq_block_id].sensor == NULL)
+		return -1;
+
+	//printk("block_id: %d, sensor: %d\n", data->occ_resp->freq_block_id, n -1);	
+	sensor = &data->occ_resp->data.blocks[data->occ_resp->freq_block_id].sensor[n - 1];
+	val = sensor->value;
+	//printk("freq%d sensor value: %d\n", n, val);
+
+	//printk("------------- above are debug message, bellow is real output------------\n");	
+	return sprintf(buf, "%d\n", val);
+}
+
+static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, show_occ_temp_input, NULL, 1);
+static SENSOR_DEVICE_ATTR(temp2_input, S_IRUGO, show_occ_temp_input, NULL, 2);
+static SENSOR_DEVICE_ATTR(temp3_input, S_IRUGO, show_occ_temp_input, NULL, 3);
+static SENSOR_DEVICE_ATTR(temp4_input, S_IRUGO, show_occ_temp_input, NULL, 4);
+static SENSOR_DEVICE_ATTR(temp5_input, S_IRUGO, show_occ_temp_input, NULL, 5);
+static SENSOR_DEVICE_ATTR(temp6_input, S_IRUGO, show_occ_temp_input, NULL, 6);
+static SENSOR_DEVICE_ATTR(temp7_input, S_IRUGO, show_occ_temp_input, NULL, 7);
+static SENSOR_DEVICE_ATTR(temp8_input, S_IRUGO, show_occ_temp_input, NULL, 8);
+static SENSOR_DEVICE_ATTR(temp9_input, S_IRUGO, show_occ_temp_input, NULL, 9);
 static SENSOR_DEVICE_ATTR(temp1_label, S_IRUGO, show_occ_temp_label, NULL, 1);
 static SENSOR_DEVICE_ATTR(temp2_label, S_IRUGO, show_occ_temp_label, NULL, 2);
 static SENSOR_DEVICE_ATTR(temp3_label, S_IRUGO, show_occ_temp_label, NULL, 3);
@@ -781,10 +818,26 @@ static SENSOR_DEVICE_ATTR(temp6_label, S_IRUGO, show_occ_temp_label, NULL, 6);
 static SENSOR_DEVICE_ATTR(temp7_label, S_IRUGO, show_occ_temp_label, NULL, 7);
 static SENSOR_DEVICE_ATTR(temp8_label, S_IRUGO, show_occ_temp_label, NULL, 8);
 static SENSOR_DEVICE_ATTR(temp9_label, S_IRUGO, show_occ_temp_label, NULL, 9);
-static SENSOR_DEVICE_ATTR(temp10_label, S_IRUGO, show_occ_temp_label, NULL, 10);
+
+static SENSOR_DEVICE_ATTR(power1_input, S_IRUGO, show_occ_power_input, NULL, 1);
+static SENSOR_DEVICE_ATTR(power1_label, S_IRUGO, show_occ_power_label, NULL, 1);
+static SENSOR_DEVICE_ATTR(power2_input, S_IRUGO, show_occ_power_input, NULL, 2);
+static SENSOR_DEVICE_ATTR(power2_label, S_IRUGO, show_occ_power_label, NULL, 2);
+static SENSOR_DEVICE_ATTR(power3_input, S_IRUGO, show_occ_power_input, NULL, 3);
+static SENSOR_DEVICE_ATTR(power3_label, S_IRUGO, show_occ_power_label, NULL, 3);
+static SENSOR_DEVICE_ATTR(power4_input, S_IRUGO, show_occ_power_input, NULL, 4);
+static SENSOR_DEVICE_ATTR(power4_label, S_IRUGO, show_occ_power_label, NULL, 4);
+
+static SENSOR_DEVICE_ATTR(freq1_input, S_IRUGO, show_occ_freq_input, NULL, 1);
+static SENSOR_DEVICE_ATTR(freq1_label, S_IRUGO, show_occ_freq_label, NULL, 1);
+static SENSOR_DEVICE_ATTR(freq2_input, S_IRUGO, show_occ_freq_input, NULL, 2);
+static SENSOR_DEVICE_ATTR(freq2_label, S_IRUGO, show_occ_freq_label, NULL, 2);
+static SENSOR_DEVICE_ATTR(freq3_input, S_IRUGO, show_occ_freq_input, NULL, 3);
+static SENSOR_DEVICE_ATTR(freq3_label, S_IRUGO, show_occ_freq_label, NULL, 3);
+static SENSOR_DEVICE_ATTR(freq4_input, S_IRUGO, show_occ_freq_input, NULL, 4);
+static SENSOR_DEVICE_ATTR(freq4_label, S_IRUGO, show_occ_freq_label, NULL, 4);
 
 static struct attribute *occ_attrs[] = {
-	&sensor_dev_attr_all.dev_attr.attr,
 	&sensor_dev_attr_temp1_input.dev_attr.attr,
 	&sensor_dev_attr_temp2_input.dev_attr.attr,
 	&sensor_dev_attr_temp3_input.dev_attr.attr,
@@ -794,7 +847,6 @@ static struct attribute *occ_attrs[] = {
 	&sensor_dev_attr_temp7_input.dev_attr.attr,
 	&sensor_dev_attr_temp8_input.dev_attr.attr,
 	&sensor_dev_attr_temp9_input.dev_attr.attr,
-	&sensor_dev_attr_temp10_input.dev_attr.attr,
 	&sensor_dev_attr_temp1_label.dev_attr.attr,
 	&sensor_dev_attr_temp2_label.dev_attr.attr,
 	&sensor_dev_attr_temp3_label.dev_attr.attr,
@@ -804,7 +856,22 @@ static struct attribute *occ_attrs[] = {
 	&sensor_dev_attr_temp7_label.dev_attr.attr,
 	&sensor_dev_attr_temp8_label.dev_attr.attr,
 	&sensor_dev_attr_temp9_label.dev_attr.attr,
-	&sensor_dev_attr_temp10_label.dev_attr.attr,
+	&sensor_dev_attr_power1_input.dev_attr.attr,
+	&sensor_dev_attr_power2_input.dev_attr.attr,
+	&sensor_dev_attr_power3_input.dev_attr.attr,
+	&sensor_dev_attr_power4_input.dev_attr.attr,
+	&sensor_dev_attr_power1_label.dev_attr.attr,
+	&sensor_dev_attr_power2_label.dev_attr.attr,
+	&sensor_dev_attr_power3_label.dev_attr.attr,
+	&sensor_dev_attr_power4_label.dev_attr.attr,
+	&sensor_dev_attr_freq1_input.dev_attr.attr,
+	&sensor_dev_attr_freq2_input.dev_attr.attr,
+	&sensor_dev_attr_freq3_input.dev_attr.attr,
+	&sensor_dev_attr_freq4_input.dev_attr.attr,
+	&sensor_dev_attr_freq1_label.dev_attr.attr,
+	&sensor_dev_attr_freq2_label.dev_attr.attr,
+	&sensor_dev_attr_freq3_label.dev_attr.attr,
+	&sensor_dev_attr_freq4_label.dev_attr.attr,
 
 	NULL
 };
@@ -820,12 +887,13 @@ enum occ_type {
 	occ_id,
 };
 
-
 static int occ_probe(struct i2c_client *client, const struct i2c_device_id *id)
 {
 	struct device *dev = &client->dev;
 	struct occ_drv_data *data;
 	unsigned long funcs;
+	struct device_node *np = dev->of_node;
+	u32 pval = 0;
 
 	data = devm_kzalloc(dev, sizeof(struct occ_drv_data), GFP_KERNEL);
 	if (!data)
@@ -837,32 +905,34 @@ static int occ_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	mutex_init(&data->update_lock);
 	data->sample_time = HZ;
 
-	//if (i2cdev_check_addr(client->adapter, OCC_I2C_ADDR))
-	//	return -EBUSY;
+	/* Yi: i2c-core should assign address to 
+	 * client when detection - but it does not work  FIXME  */
+	//client->addr = OCC_I2C_ADDR;
 
-	client->addr = OCC_I2C_ADDR;
-	
+	/* Yi: read address from device table */
+	if (of_property_read_u32(np, "reg", &pval)) {
+		dev_err(&client->dev, "invalid reg\n");
+	}
+	client->addr = pval;
+		
 	/* configure the driver */
-	//dev_dbg(dev, "occ i2c register hwmon\n");
-	printk("occ i2c register hwmon\n");
+	dev_dbg(dev, "occ register hwmon @0x%x\n", client->addr);
 
 	data->hwmon_dev = hwmon_device_register_with_groups(dev, "occ",
 							    data, occ_groups);
 	if (IS_ERR(data->hwmon_dev))
 		return PTR_ERR(data->hwmon_dev);
 
-	//dev_info(dev, "%s: sensor '%s'\n",
-	//	 dev_name(data->hwmon_dev), client->name);
-	printk("%s: sensor '%s'\n",
+	dev_dbg(dev, "%s: sensor '%s'\n",
 		 dev_name(data->hwmon_dev), client->name);
 
 	funcs = i2c_get_functionality(client->adapter);
-	
-	dev_info(dev, "i2c adaptor supports function: 0x%lx\n", funcs); 
+	//dev_info(dev, "i2c adaptor supports function: 0x%lx\n", funcs); 
 
-	occ_check_i2c_errors(client);
-	//dev_info(dev, "occ i2c driver ready\n");
-	printk("occ i2c driver ready\n");
+	/* Yi: seems always error? disable for now */
+	//occ_check_i2c_errors(client);
+	
+	dev_info(dev, "occ i2c driver ready: i2c addr@0x%x\n", client->addr);
 
 	return 0;
 }
@@ -878,6 +948,7 @@ static int occ_remove(struct i2c_client *client)
 	return 0;
 }
 
+/* used for old-style board info */
 static const struct i2c_device_id occ_ids[] = {
 	{ OCC_I2C_NAME, occ_id, },
 	{ /* LIST END */ }
@@ -915,12 +986,16 @@ static const struct dev_pm_ops occ_dev_pm_ops = {
 #define OCC_DEV_PM_OPS NULL
 #endif /* CONFIG_PM */
 
-static const unsigned short normal_i2c[] = {0x50, I2C_CLIENT_END };
+/* Yi: i2c-core uses i2c-detect() to detect device in bellow address list. 
+   If exists, address will be assigned to client.
+ * It is also possible to read address from device table. */
+static const unsigned short normal_i2c[] = {0x50, 0x51, I2C_CLIENT_END };
 
 /* Return 0 if detection is successful, -ENODEV otherwise */
 static int occ_detect(struct i2c_client *new_client,
                        struct i2c_board_info *info)
 {
+	/* i2c-core need this function to create new device */
 	strncpy(info->type, OCC_I2C_NAME, sizeof(OCC_I2C_NAME));
 	return 0;
 }
@@ -942,7 +1017,7 @@ static struct i2c_driver occ_driver = {
 module_i2c_driver(occ_driver);
 
 #if 0
-
+/* Create new i2c device */
 static struct i2c_board_info my_dev_info[] __initdata = {
 	{
 		I2C_BOARD_INFO(OCC_I2C_NAME, 0x50),
-- 
2.6.3
