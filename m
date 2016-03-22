Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qTlkY3GN0zDqFd
 for <openbmc@lists.ozlabs.org>; Tue, 22 Mar 2016 19:10:45 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1458634240756543.9346379964496;
 Tue, 22 Mar 2016 01:10:40 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux] hwmon: power8_occ_i2c: Add more hwmon sysfs attribute
 definition to support more sensors
Date: Tue, 22 Mar 2016 03:10:29 -0500
Message-Id: <1458634229-22400-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1458634229-22400-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1458634229-22400-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 22 Mar 2016 08:10:46 -0000

From: Yi Li <adamliyi@msn.com>

This patch fixes issue: https://github.com/openbmc/skeleton/issues/58

The hwmon sys attributes are created using statically defined arrays.
Some POWER CPU has 10-core, while some POWER CPU has 12-core.
The more cores, the more OCC sensors. E.g, for 12-core CPU,
there will be 28 temperature sensors. The statically defined
array will overflow in this case.

This is a temporary fix. Will need to generate the hwmon sysfs attributes
dynamically.
---
 drivers/hwmon/power8_occ_i2c.c | 52 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 51 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/power8_occ_i2c.c b/drivers/hwmon/power8_occ_i2c.c
index c9c70d1..3505fe7 100644
--- a/drivers/hwmon/power8_occ_i2c.c
+++ b/drivers/hwmon/power8_occ_i2c.c
@@ -831,6 +831,16 @@ static struct sensor_device_attribute temp_input[] = {
 	SENSOR_ATTR(temp20_input, S_IRUGO, show_occ_temp_input, NULL, 19),
 	SENSOR_ATTR(temp21_input, S_IRUGO, show_occ_temp_input, NULL, 20),
 	SENSOR_ATTR(temp22_input, S_IRUGO, show_occ_temp_input, NULL, 21),
+	SENSOR_ATTR(temp23_input, S_IRUGO, show_occ_temp_input, NULL, 22),
+	SENSOR_ATTR(temp24_input, S_IRUGO, show_occ_temp_input, NULL, 23),
+	SENSOR_ATTR(temp25_input, S_IRUGO, show_occ_temp_input, NULL, 24),
+	SENSOR_ATTR(temp26_input, S_IRUGO, show_occ_temp_input, NULL, 25),
+	SENSOR_ATTR(temp27_input, S_IRUGO, show_occ_temp_input, NULL, 26),
+	SENSOR_ATTR(temp28_input, S_IRUGO, show_occ_temp_input, NULL, 27),
+	SENSOR_ATTR(temp29_input, S_IRUGO, show_occ_temp_input, NULL, 28),
+	SENSOR_ATTR(temp30_input, S_IRUGO, show_occ_temp_input, NULL, 29),
+	SENSOR_ATTR(temp31_input, S_IRUGO, show_occ_temp_input, NULL, 30),
+	SENSOR_ATTR(temp32_input, S_IRUGO, show_occ_temp_input, NULL, 31),
 };
 
 static struct sensor_device_attribute temp_label[] = {
@@ -856,7 +866,16 @@ static struct sensor_device_attribute temp_label[] = {
 	SENSOR_ATTR(temp20_label, S_IRUGO, show_occ_temp_label, NULL, 19),
 	SENSOR_ATTR(temp21_label, S_IRUGO, show_occ_temp_label, NULL, 20),
 	SENSOR_ATTR(temp22_label, S_IRUGO, show_occ_temp_label, NULL, 21),
-
+	SENSOR_ATTR(temp23_label, S_IRUGO, show_occ_temp_label, NULL, 22),
+	SENSOR_ATTR(temp24_label, S_IRUGO, show_occ_temp_label, NULL, 23),
+	SENSOR_ATTR(temp25_label, S_IRUGO, show_occ_temp_label, NULL, 24),
+	SENSOR_ATTR(temp26_label, S_IRUGO, show_occ_temp_label, NULL, 25),
+	SENSOR_ATTR(temp27_label, S_IRUGO, show_occ_temp_label, NULL, 26),
+	SENSOR_ATTR(temp28_label, S_IRUGO, show_occ_temp_label, NULL, 27),
+	SENSOR_ATTR(temp29_label, S_IRUGO, show_occ_temp_label, NULL, 28),
+	SENSOR_ATTR(temp30_label, S_IRUGO, show_occ_temp_label, NULL, 29),
+	SENSOR_ATTR(temp31_label, S_IRUGO, show_occ_temp_label, NULL, 30),
+	SENSOR_ATTR(temp32_label, S_IRUGO, show_occ_temp_label, NULL, 31),
 };
 
 #define TEMP_UNIT_ATTRS(X)                      \
@@ -889,6 +908,16 @@ static struct attribute *occ_temp_attr[][3] = {
 	TEMP_UNIT_ATTRS(19),
 	TEMP_UNIT_ATTRS(20),
 	TEMP_UNIT_ATTRS(21),
+	TEMP_UNIT_ATTRS(22),
+	TEMP_UNIT_ATTRS(23),
+	TEMP_UNIT_ATTRS(24),
+	TEMP_UNIT_ATTRS(25),
+	TEMP_UNIT_ATTRS(26),
+	TEMP_UNIT_ATTRS(27),
+	TEMP_UNIT_ATTRS(28),
+	TEMP_UNIT_ATTRS(29),
+	TEMP_UNIT_ATTRS(30),
+	TEMP_UNIT_ATTRS(31),
 };
 
 static const struct attribute_group occ_temp_attr_group[] = {
@@ -914,6 +943,16 @@ static const struct attribute_group occ_temp_attr_group[] = {
 	{ .attrs = occ_temp_attr[19] },
 	{ .attrs = occ_temp_attr[20] },
 	{ .attrs = occ_temp_attr[21] },
+	{ .attrs = occ_temp_attr[22] },
+	{ .attrs = occ_temp_attr[23] },
+	{ .attrs = occ_temp_attr[24] },
+	{ .attrs = occ_temp_attr[25] },
+	{ .attrs = occ_temp_attr[26] },
+	{ .attrs = occ_temp_attr[27] },
+	{ .attrs = occ_temp_attr[28] },
+	{ .attrs = occ_temp_attr[29] },
+	{ .attrs = occ_temp_attr[30] },
+	{ .attrs = occ_temp_attr[31] },
 };
 
 
@@ -928,6 +967,8 @@ static struct sensor_device_attribute freq_input[] = {
 	SENSOR_ATTR(freq8_input, S_IRUGO, show_occ_freq_input, NULL, 7),
 	SENSOR_ATTR(freq9_input, S_IRUGO, show_occ_freq_input, NULL, 8),
 	SENSOR_ATTR(freq10_input, S_IRUGO, show_occ_freq_input, NULL, 9),
+	SENSOR_ATTR(freq11_input, S_IRUGO, show_occ_freq_input, NULL, 10),
+	SENSOR_ATTR(freq12_input, S_IRUGO, show_occ_freq_input, NULL, 11),
 };
 
 static struct sensor_device_attribute freq_label[] = {
@@ -941,6 +982,8 @@ static struct sensor_device_attribute freq_label[] = {
 	SENSOR_ATTR(freq8_label, S_IRUGO, show_occ_freq_label, NULL, 7),
 	SENSOR_ATTR(freq9_label, S_IRUGO, show_occ_freq_label, NULL, 8),
 	SENSOR_ATTR(freq10_label, S_IRUGO, show_occ_freq_label, NULL, 9),
+	SENSOR_ATTR(freq11_label, S_IRUGO, show_occ_freq_label, NULL, 10),
+	SENSOR_ATTR(freq12_label, S_IRUGO, show_occ_freq_label, NULL, 11),
 
 };
 
@@ -962,6 +1005,8 @@ static struct attribute *occ_freq_attr[][3] = {
 	FREQ_UNIT_ATTRS(7),
 	FREQ_UNIT_ATTRS(8),
 	FREQ_UNIT_ATTRS(9),
+	FREQ_UNIT_ATTRS(10),
+	FREQ_UNIT_ATTRS(11),
 };
 
 static const struct attribute_group occ_freq_attr_group[] = {
@@ -975,6 +1020,8 @@ static const struct attribute_group occ_freq_attr_group[] = {
 	{ .attrs = occ_freq_attr[7] },
 	{ .attrs = occ_freq_attr[8] },
 	{ .attrs = occ_freq_attr[9] },
+	{ .attrs = occ_freq_attr[10] },
+	{ .attrs = occ_freq_attr[11] },
 };
 
 static struct sensor_device_attribute_2 caps_curr_powercap[] = {
@@ -1318,6 +1365,7 @@ static ssize_t set_occ_online(struct device *dev,
 
 		err = occ_create_hwmon_attribute(dev);
 		if (err) {
+			dev_err(dev, "ERROR: cannot create sysfs attr\n");
 			hwmon_device_unregister(data->hwmon_dev);
 			return err;
 		}
@@ -1328,6 +1376,8 @@ static ssize_t set_occ_online(struct device *dev,
 		if (data->occ_online == 0)
 			return count;
 
+		dev_dbg(dev, "occ unregister hwmon @0x%x\n",
+				data->client->addr);
 		occ_remove_sysfs_files(data->hwmon_dev);
 		hwmon_device_unregister(data->hwmon_dev);
 		data->hwmon_dev = NULL;
-- 
2.7.1
