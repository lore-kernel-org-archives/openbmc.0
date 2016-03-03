Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id EEB7B1A035C
 for <openbmc@lists.ozlabs.org>; Thu,  3 Mar 2016 21:10:37 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 145699983469255.440420820137774;
 Thu, 3 Mar 2016 02:10:34 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux v2 2/2] hwmon: Hide error message in OCC hwmon driver
Date: Thu,  3 Mar 2016 04:10:31 -0600
Message-Id: <1456999831-12589-3-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1456999831-12589-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1456999831-12589-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 03 Mar 2016 10:10:38 -0000

From: Yi Li <adamliyi@msn.com>

This patch fixed issue in: https://github.com/openbmc/openbmc/issues/191

User application will poll OCC when host is powered off. OCC can handle
the poll request, but no sensor data will be responded. Currently OCC driver
will report error message when reading sysfs hwmon sensor attribute in this case.
The error message is harmless but is anoying.

This patch hides the error message. Reading sysfs hwmon attribute in this case
will still get an error code, but no more error message.

Signed-off-by: Yi Li <adamliyi@msn.com>
---
 drivers/hwmon/power8_occ_i2c.c | 32 +++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/hwmon/power8_occ_i2c.c b/drivers/hwmon/power8_occ_i2c.c
index 37280a5..6352487c 100644
--- a/drivers/hwmon/power8_occ_i2c.c
+++ b/drivers/hwmon/power8_occ_i2c.c
@@ -370,7 +370,7 @@ static int parse_occ_response(struct i2c_client *client,
 
 	/* check if the data is valid */
 	if (strncmp(&data[SENSOR_STR_OFFSET], "SENSOR", 6) != 0) {
-		dev_err(&client->dev,
+		dev_dbg(&client->dev,
 			"ERROR: no SENSOR String in response\n");
 		ret = -1;
 		goto err;
@@ -378,7 +378,7 @@ static int parse_occ_response(struct i2c_client *client,
 
 	sensor_block_num = data[SENSOR_BLOCK_NUM_OFFSET];
 	if (sensor_block_num == 0) {
-		dev_err(&client->dev, "ERROR: SENSOR block num is 0\n");
+		dev_dbg(&client->dev, "ERROR: SENSOR block num is 0\n");
 		ret = -1;
 		goto err;
 	}
@@ -526,7 +526,7 @@ static int parse_occ_response(struct i2c_client *client,
 			}
 
 		} else {
-			dev_err(&client->dev,
+			dev_dbg(&client->dev,
 				"ERROR: sensor type %s not supported\n",
 				resp->blocks[b].sensor_type);
 			ret = -1;
@@ -617,13 +617,13 @@ static int occ_get_all(struct i2c_client *client, struct occ_response *occ_resp)
 	dev_dbg(&client->dev, "OCC data length: %d\n", num_bytes);
 
 	if (num_bytes > OCC_DATA_MAX) {
-		dev_err(&client->dev, "ERROR: OCC data length must be < 4KB\n");
+		dev_dbg(&client->dev, "ERROR: OCC data length must be < 4KB\n");
 		ret = -EINVAL;
 		goto out;
 	}
 
 	if (num_bytes <= 0) {
-		dev_err(&client->dev, "ERROR: OCC data length is zero\n");
+		dev_dbg(&client->dev, "ERROR: OCC data length is zero\n");
 		ret = -EINVAL;
 		goto out;
 	}
@@ -670,7 +670,7 @@ static void *occ_get_sensor(struct device *hwmon_dev, enum sensor_t t)
 
 	ret = occ_update_device(dev);
 	if (ret != 0) {
-		dev_err(dev, "ERROR: cannot get occ sensor data: %d\n", ret);
+		dev_dbg(dev, "ERROR: cannot get occ sensor data: %d\n", ret);
 		return NULL;
 	}
 
@@ -1161,10 +1161,12 @@ static ssize_t set_user_powercap(struct device *hwmon_dev,
 	val = cpu_to_le16(val);
 	err = occ_send_cmd(client, 0, 0x22, 2, (uint8_t *)&val, resp);
 	if (err != 0) {
-		dev_err(dev, "Set User Powercap: wrong return status: %x\n",
+		dev_dbg(dev,
+			"ERROR: Set User Powercap: wrong return status: %x\n",
 			err);
 		if (err == 0x13)
-			dev_err(dev, "invalid powercap value: %x\n", val);
+			dev_info(dev,
+				"ERROR: set invalid powercap value: %x\n", val);
 		return -EINVAL;
 	}
 	data->user_powercap = val;
@@ -1219,7 +1221,7 @@ static int occ_create_hwmon_attribute(struct device *dev)
 
 	ret = occ_update_device(dev);
 	if (ret != 0) {
-		dev_err(dev, "ERROR: cannot get occ sensor data: %d\n", ret);
+		dev_dbg(dev, "ERROR: cannot get occ sensor data: %d\n", ret);
 		return ret;
 	}
 
@@ -1244,7 +1246,8 @@ static int occ_create_hwmon_attribute(struct device *dev)
 			ret = sysfs_create_group(&drv_data->hwmon_dev->kobj,
 				&occ_temp_attr_group[i]);
 			if (ret) {
-				dev_err(dev, "error create temp sysfs entry\n");
+				dev_dbg(dev,
+					"ERROR: cannot create sysfs entry\n");
 				goto error;
 			}
 		}
@@ -1258,7 +1261,8 @@ static int occ_create_hwmon_attribute(struct device *dev)
 			ret = sysfs_create_group(&drv_data->hwmon_dev->kobj,
 				&occ_freq_attr_group[i]);
 			if (ret) {
-				dev_err(dev, "error create freq sysfs entry\n");
+				dev_dbg(dev,
+					"ERROR: cannot create sysfs entry\n");
 				goto error;
 			}
 		}
@@ -1272,7 +1276,8 @@ static int occ_create_hwmon_attribute(struct device *dev)
 			ret = sysfs_create_group(&drv_data->hwmon_dev->kobj,
 				&occ_power_attr_group[i]);
 			if (ret) {
-				dev_err(dev, "error create power sysfs entry\n");
+				dev_dbg(dev,
+					"ERROR: cannot create sysfs entry\n");
 				goto error;
 			}
 		}
@@ -1286,7 +1291,8 @@ static int occ_create_hwmon_attribute(struct device *dev)
 			ret = sysfs_create_group(&drv_data->hwmon_dev->kobj,
 				&occ_caps_attr_group[i]);
 			if (ret) {
-				dev_err(dev, "error create caps sysfs entry\n");
+				dev_dbg(dev,
+					"ERROR: cannot create sysfs entry\n");
 				goto error;
 			}
 		}
-- 
2.7.1
