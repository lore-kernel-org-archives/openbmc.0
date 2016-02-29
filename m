Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id CD2311A0B52
 for <openbmc@lists.ozlabs.org>; Mon, 29 Feb 2016 22:00:53 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1456743644552489.58971822328715;
 Mon, 29 Feb 2016 03:00:44 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux] hwmon: fix occ hwmon driver compile warning message
Date: Mon, 29 Feb 2016 05:00:42 -0600
Message-Id: <1456743642-23362-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1456743642-23362-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1456743642-23362-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Mon, 29 Feb 2016 11:00:54 -0000

From: Yi Li <adamliyi@msn.com>

Fixed warning message when compiling occ hwmon driver.
The issue is tracked by: https://github.com/openbmc/linux/issues/44

Signed-off-by: Yi Li <adamliyi@msn.com>
---
 drivers/hwmon/power8_occ_i2c.c | 54 ++++++++++++++++++++++++++++--------------
 1 file changed, 36 insertions(+), 18 deletions(-)

diff --git a/drivers/hwmon/power8_occ_i2c.c b/drivers/hwmon/power8_occ_i2c.c
index c9c70d1..37280a5 100644
--- a/drivers/hwmon/power8_occ_i2c.c
+++ b/drivers/hwmon/power8_occ_i2c.c
@@ -348,7 +348,7 @@ err:
 
 static inline uint16_t get_occdata_length(uint8_t *data)
 {
-	return be16_to_cpup(&data[RESP_DATA_LENGTH]);
+	return be16_to_cpup((const __be16 *)&data[RESP_DATA_LENGTH]);
 }
 
 static int parse_occ_response(struct i2c_client *client,
@@ -421,8 +421,11 @@ static int parse_occ_response(struct i2c_client *client,
 			resp->freq_block_id = b;
 			for (s = 0; s < num_of_sensors; s++) {
 				f_sensor = &resp->blocks[b].sensor[s];
-				f_sensor->sensor_id = be16_to_cpup(&data[dnum]);
-				f_sensor->value = be16_to_cpup(&data[dnum+2]);
+				f_sensor->sensor_id =
+					be16_to_cpup((const __be16 *)
+							&data[dnum]);
+				f_sensor->value = be16_to_cpup((const __be16 *)
+							&data[dnum+2]);
 				dev_dbg(&client->dev,
 					"sensor[%d]-[%d]: id: %u, value: %u\n",
 					b, s, f_sensor->sensor_id,
@@ -438,8 +441,11 @@ static int parse_occ_response(struct i2c_client *client,
 			resp->temp_block_id = b;
 			for (s = 0; s < num_of_sensors; s++) {
 				t_sensor = &resp->blocks[b].sensor[s];
-				t_sensor->sensor_id = be16_to_cpup(&data[dnum]);
-				t_sensor->value = be16_to_cpup(&data[dnum+2]);
+				t_sensor->sensor_id =
+					be16_to_cpup((const __be16 *)
+							&data[dnum]);
+				t_sensor->value = be16_to_cpup((const __be16 *)
+							&data[dnum+2]);
 				dev_dbg(&client->dev,
 					"sensor[%d]-[%d]: id: %u, value: %u\n",
 					b, s, t_sensor->sensor_id,
@@ -455,12 +461,17 @@ static int parse_occ_response(struct i2c_client *client,
 			resp->power_block_id = b;
 			for (s = 0; s < num_of_sensors; s++) {
 				p_sensor = &resp->blocks[b].power[s];
-				p_sensor->sensor_id = be16_to_cpup(&data[dnum]);
+				p_sensor->sensor_id =
+					be16_to_cpup((const __be16 *)
+							&data[dnum]);
 				p_sensor->update_tag =
-					be32_to_cpup(&data[dnum+2]);
+					be32_to_cpup((const __be32 *)
+							&data[dnum+2]);
 				p_sensor->accumulator =
-					be32_to_cpup(&data[dnum+6]);
-				p_sensor->value = be16_to_cpup(&data[dnum+10]);
+					be32_to_cpup((const __be32 *)
+							&data[dnum+6]);
+				p_sensor->value = be16_to_cpup((const __be16 *)
+							&data[dnum+10]);
 
 				dev_dbg(&client->dev,
 					"sensor[%d]-[%d]: id: %u, value: %u\n",
@@ -479,17 +490,23 @@ static int parse_occ_response(struct i2c_client *client,
 			for (s = 0; s < num_of_sensors; s++) {
 				c_sensor = &resp->blocks[b].caps[s];
 				c_sensor->curr_powercap =
-					be16_to_cpup(&data[dnum]);
+					be16_to_cpup((const __be16 *)
+							&data[dnum]);
 				c_sensor->curr_powerreading =
-					be16_to_cpup(&data[dnum+2]);
+					be16_to_cpup((const __be16 *)
+							&data[dnum+2]);
 				c_sensor->norm_powercap =
-					be16_to_cpup(&data[dnum+4]);
+					be16_to_cpup((const __be16 *)
+							&data[dnum+4]);
 				c_sensor->max_powercap =
-					be16_to_cpup(&data[dnum+6]);
+					be16_to_cpup((const __be16 *)
+							&data[dnum+6]);
 				c_sensor->min_powercap =
-					be16_to_cpup(&data[dnum+8]);
+					be16_to_cpup((const __be16 *)
+							&data[dnum+8]);
 				c_sensor->user_powerlimit =
-					be16_to_cpup(&data[dnum+10]);
+					be16_to_cpup((const __be16 *)
+							&data[dnum+10]);
 
 				dnum = dnum + sensor_length;
 				dev_dbg(&client->dev, "CAPS sensor #%d:\n", s);
@@ -539,6 +556,7 @@ static uint8_t occ_send_cmd(struct i2c_client *client, uint8_t seq,
 	uint16_t checksum;
 	int i;
 
+	length = cpu_to_le16(length);
 	cmd1 = (seq << 24) | (type << 16) | length;
 	memcpy(&cmd2, data, length);
 	cmd2 <<= ((4 - length) * 8);
@@ -1132,7 +1150,6 @@ static ssize_t set_user_powercap(struct device *hwmon_dev,
 	struct occ_drv_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
 	uint16_t val;
-	uint32_t powercap;
 	uint8_t resp[8];
 	int err;
 
@@ -1140,8 +1157,9 @@ static ssize_t set_user_powercap(struct device *hwmon_dev,
 	if (err)
 		return err;
 
-	dev_dbg(dev, "set user powercap to: %lu\n", val);
-	err = occ_send_cmd(client, 0, 0x22, 2, &val, resp);
+	dev_dbg(dev, "set user powercap to: %u\n", val);
+	val = cpu_to_le16(val);
+	err = occ_send_cmd(client, 0, 0x22, 2, (uint8_t *)&val, resp);
 	if (err != 0) {
 		dev_err(dev, "Set User Powercap: wrong return status: %x\n",
 			err);
-- 
2.7.1
