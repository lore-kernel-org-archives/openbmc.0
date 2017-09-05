Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="cqDjsNHL"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="hnWIimj3"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xmdd0398MzDrFq
 for <openbmc@lists.ozlabs.org>; Tue,  5 Sep 2017 17:29:08 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 1B8FC20C35;
 Tue,  5 Sep 2017 03:29:06 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Tue, 05 Sep 2017 03:29:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=mS7W3/
 7QWdcTwvHRrZLqgIEGuWPbKGr3+dnX5fA3h6w=; b=cqDjsNHLOThV0AlYGJ9N+e
 wvUfJYN5So1dAWG/E/DxTVnCl8VNCmX+q0bMTm+A6xgX1mOFdSSEuf72+hhFblJY
 uI0Ij8CDfwfGOGrYrLaFgf+bdERSWBiMFZWA7Wk/g7WaugGCJ/3Von3+fpHShqK0
 lg0EGUFFqBvRQTJpqs/6m9yACBbNklFWlaPbYM2jzxp3p92/1W3nYQ+Jkn89Gd4n
 9RWHGf15Lk+36aZIwbMxOUGI2HH07bHQ3Lf1RGJZnOJ8g8IpWACvVT8sJ0Bnaddv
 NSjgIp7tcdLr7hAYUaQTVHh8fk91SN4vYTe1cOGyg1a+ss1xNKLjtVZR3ordEABg
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=mS7W3/7QWdcTwvHRrZLqgIEGuWPbKGr3+dnX5fA3h
 6w=; b=hnWIimj3Q7Eb4Y7U1h3p1qCBh+EzZ6HUcrzymrrBKd8nmPOZbfD7RsYJ/
 /YSUzb94/fV9mN99rOxaO6mbVsFrg3Q1t0TIzkUbbT9/kqjVQWHsUEwLWaDRescs
 RODdlIBDW2ff2VDFsKQmb4fsGw5l4AUgdKQw3lMlp3u1hmSzV82WsYdSol3p34yc
 HtMB7FX/E01NJsb4Cj2fGatZaPtkjcJ1jNrba+4eWGxu0utxowsDL+dae18xrxEr
 UTqvLrsCWUHp0FvLaYIYDDsq5YYH1PVPgSRtXjXFpgQBJbkgN+GYRuGkm/wwyyqW
 DsLve2P/8SLFQ1wIVuY+tGfQYQZbw==
X-ME-Sender: <xms:QlKuWZCjSJihDqFTn9-jH6QDBMr8DaJYGXlwkPdIxWENTTbfFBkETw>
X-Sasl-enc: OoDaXuAFja7TuCcgwJ+sXNBuj9AkM81Jvmnfk4+erKHl 1504596544
Received: from keelia.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0360D7FA83;
 Tue,  5 Sep 2017 03:29:03 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Cc: Andrew Jeffery <andrew@aj.id.au>,
	joel@jms.id.au
Subject: [PATCH 1/3] hwmon: pmbus: Make reg check and clear faults functions
 return errors
Date: Tue,  5 Sep 2017 17:28:26 +1000
Message-Id: <20170905072828.8749-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170905072828.8749-1-andrew@aj.id.au>
References: <20170905072828.8749-1-andrew@aj.id.au>
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
X-List-Received-Date: Tue, 05 Sep 2017 07:29:09 -0000

Some functions exposed by pmbus core conflated errors that occurred when
setting the page to access with errors that occurred when accessing
registers in a page. In some cases, this caused legitimate errors to be
hidden under the guise of the register not being supported.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 Documentation/hwmon/pmbus-core   |  12 ++--
 drivers/hwmon/pmbus/pmbus.h      |   6 +-
 drivers/hwmon/pmbus/pmbus_core.c | 115 +++++++++++++++++++++++++++++----------
 3 files changed, 95 insertions(+), 38 deletions(-)

diff --git a/Documentation/hwmon/pmbus-core b/Documentation/hwmon/pmbus-core
index 31e4720fed18..1057e61a15d4 100644
--- a/Documentation/hwmon/pmbus-core
+++ b/Documentation/hwmon/pmbus-core
@@ -218,17 +218,17 @@ Specifically, it provides the following information.
   This function calls the device specific write_byte function if defined.
   Therefore, it must _not_ be called from that function.
 
-  bool pmbus_check_byte_register(struct i2c_client *client, int page, int reg);
+  int pmbus_check_byte_register(struct i2c_client *client, int page, int reg);
 
-  Check if byte register exists. Return true if the register exists, false
-  otherwise.
+  Check if byte register exists. Returns 1 if the register exists, 0 if it does
+  not, and less than zero on an unexpected error.
   This function calls the device specific write_byte function if defined to
   obtain the chip status. Therefore, it must _not_ be called from that function.
 
-  bool pmbus_check_word_register(struct i2c_client *client, int page, int reg);
+  int pmbus_check_word_register(struct i2c_client *client, int page, int reg);
 
-  Check if word register exists. Return true if the register exists, false
-  otherwise.
+  Check if word register exists. Returns 1 if the register exists, 0 if it does
+  not, and less than zero on an unexpected error.
   This function calls the device specific write_byte function if defined to
   obtain the chip status. Therefore, it must _not_ be called from that function.
 
diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index a863b8fed16f..f8d7a7e0dce0 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -442,9 +442,9 @@ int pmbus_update_byte_data(struct i2c_client *client, int page, u8 reg,
 			   u8 mask, u8 value);
 int pmbus_update_fan(struct i2c_client *client, int page, int id,
 		     u8 config, u8 mask, u16 command);
-void pmbus_clear_faults(struct i2c_client *client);
-bool pmbus_check_byte_register(struct i2c_client *client, int page, int reg);
-bool pmbus_check_word_register(struct i2c_client *client, int page, int reg);
+int pmbus_clear_faults(struct i2c_client *client);
+int pmbus_check_byte_register(struct i2c_client *client, int page, int reg);
+int pmbus_check_word_register(struct i2c_client *client, int page, int reg);
 int pmbus_do_probe(struct i2c_client *client, const struct i2c_device_id *id,
 		   struct pmbus_driver_info *info);
 int pmbus_do_remove(struct i2c_client *client);
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index f72f966f5251..b71d214d1510 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -450,18 +450,24 @@ static int pmbus_get_fan_command(struct i2c_client *client, int page, int id,
 				     pmbus_fan_command_registers[id]);
 }
 
-static void pmbus_clear_fault_page(struct i2c_client *client, int page)
+static int pmbus_clear_fault_page(struct i2c_client *client, int page)
 {
-	_pmbus_write_byte(client, page, PMBUS_CLEAR_FAULTS);
+	return _pmbus_write_byte(client, page, PMBUS_CLEAR_FAULTS);
 }
 
-void pmbus_clear_faults(struct i2c_client *client)
+int pmbus_clear_faults(struct i2c_client *client)
 {
 	struct pmbus_data *data = i2c_get_clientdata(client);
+	int rv;
 	int i;
 
-	for (i = 0; i < data->info->pages; i++)
-		pmbus_clear_fault_page(client, i);
+	for (i = 0; i < data->info->pages; i++) {
+		rv = pmbus_clear_fault_page(client, i);
+		if (rv)
+			return rv;
+	}
+
+	return 0;
 }
 EXPORT_SYMBOL_GPL(pmbus_clear_faults);
 
@@ -479,19 +485,36 @@ static int pmbus_check_status_cml(struct i2c_client *client)
 	return 0;
 }
 
-static bool pmbus_check_register(struct i2c_client *client,
+static int pmbus_check_register(struct i2c_client *client,
 				 int (*func)(struct i2c_client *client,
 					     int page, int reg),
 				 int page, int reg)
 {
+	struct pmbus_data *data;
+	int check;
 	int rv;
-	struct pmbus_data *data = i2c_get_clientdata(client);
 
-	rv = func(client, page, reg);
-	if (rv >= 0 && !(data->flags & PMBUS_SKIP_STATUS_CHECK))
-		rv = pmbus_check_status_cml(client);
-	pmbus_clear_fault_page(client, -1);
-	return rv >= 0;
+	data = i2c_get_clientdata(client);
+
+	/*
+	 * pmbus_set_page() guards transactions on the requested page matching
+	 * the current page. This may be done in the execution of func(), but
+	 * at that point a set-page error is conflated with accessing a
+	 * non-existent register.
+	 */
+	rv = pmbus_set_page(client, page);
+	if (rv < 0)
+		return rv;
+
+	check = func(client, page, reg);
+	if (check >= 0 && !(data->flags & PMBUS_SKIP_STATUS_CHECK))
+		check = pmbus_check_status_cml(client);
+
+	rv = pmbus_clear_fault_page(client, -1);
+	if (rv < 0)
+		return rv;
+
+	return check >= 0;
 }
 
 static bool pmbus_check_status_register(struct i2c_client *client, int page)
@@ -511,13 +534,13 @@ static bool pmbus_check_status_register(struct i2c_client *client, int page)
 	return status >= 0;
 }
 
-bool pmbus_check_byte_register(struct i2c_client *client, int page, int reg)
+int pmbus_check_byte_register(struct i2c_client *client, int page, int reg)
 {
 	return pmbus_check_register(client, _pmbus_read_byte_data, page, reg);
 }
 EXPORT_SYMBOL_GPL(pmbus_check_byte_register);
 
-bool pmbus_check_word_register(struct i2c_client *client, int page, int reg)
+int pmbus_check_word_register(struct i2c_client *client, int page, int reg)
 {
 	return pmbus_check_register(client, _pmbus_read_word_data, page, reg);
 }
@@ -553,7 +576,7 @@ static struct pmbus_data *pmbus_update_device(struct device *dev)
 
 	mutex_lock(&data->update_lock);
 	if (time_after(jiffies, data->last_updated + HZ) || !data->valid) {
-		int i, j;
+		int i, j, ret;
 
 		for (i = 0; i < info->pages; i++) {
 			data->status[PB_STATUS_BASE + i]
@@ -586,7 +609,13 @@ static struct pmbus_data *pmbus_update_device(struct device *dev)
 							    sensor->page,
 							    sensor->reg);
 		}
-		pmbus_clear_faults(client);
+
+		ret = pmbus_clear_faults(client);
+		if (ret < 0) {
+			mutex_unlock(&data->update_lock);
+			return ERR_PTR(ret);
+		}
+
 		data->last_updated = jiffies;
 		data->valid = 1;
 	}
@@ -922,6 +951,9 @@ static ssize_t pmbus_show_boolean(struct device *dev,
 	struct pmbus_data *data = pmbus_update_device(dev);
 	int val;
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	val = pmbus_get_boolean(data, boolean, attr->index);
 	if (val < 0)
 		return val;
@@ -934,6 +966,9 @@ static ssize_t pmbus_show_sensor(struct device *dev,
 	struct pmbus_data *data = pmbus_update_device(dev);
 	struct pmbus_sensor *sensor = to_pmbus_sensor(devattr);
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	if (sensor->data < 0)
 		return sensor->data;
 
@@ -1169,7 +1204,11 @@ static int pmbus_add_limit_attrs(struct i2c_client *client,
 	struct pmbus_sensor *curr;
 
 	for (i = 0; i < nlimit; i++) {
-		if (pmbus_check_word_register(client, page, l->reg)) {
+		ret = pmbus_check_word_register(client, page, l->reg);
+		if (ret < 0)
+			return ret;
+
+		if (ret) {
 			curr = pmbus_add_sensor(data, name, l->attr, index,
 						page, l->reg, attr->class,
 						attr->update || l->update,
@@ -1216,19 +1255,25 @@ static int pmbus_add_sensor_attrs_one(struct i2c_client *client,
 	if (!base)
 		return -ENOMEM;
 	if (attr->sfunc) {
+		int check;
+
 		ret = pmbus_add_limit_attrs(client, data, info, name,
 					    index, page, base, attr);
 		if (ret < 0)
 			return ret;
+
+		check = pmbus_check_status_register(client, page);
+		if (check < 0)
+			return check;
+
 		/*
 		 * Add generic alarm attribute only if there are no individual
 		 * alarm attributes, if there is a global alarm bit, and if
 		 * the generic status register (word or byte, depending on
 		 * which global bit is set) for this page is accessible.
 		 */
-		if (!ret && attr->gbit &&
-		    (!upper || (upper && data->has_status_word)) &&
-		    pmbus_check_status_register(client, page)) {
+		if (!ret && attr->gbit && check &&
+			(!upper || (upper && data->has_status_word))) {
 			ret = pmbus_add_boolean(data, name, "alarm", index,
 						NULL, NULL,
 						PB_STATUS_BASE + page,
@@ -1817,8 +1862,12 @@ static int pmbus_add_fan_attributes(struct i2c_client *client,
 			if (!(info->func[page] & pmbus_fan_flags[f]))
 				break;
 
-			if (!pmbus_check_word_register(client, page,
-						       pmbus_fan_registers[f]))
+			ret = pmbus_check_word_register(client, page,
+						       pmbus_fan_registers[f]);
+			if (ret < 0)
+				return ret;
+
+			if (!ret)
 				break;
 
 			/*
@@ -1850,9 +1899,13 @@ static int pmbus_add_fan_attributes(struct i2c_client *client,
 			 * Each fan status register covers multiple fans,
 			 * so we have to do some magic.
 			 */
-			if ((info->func[page] & pmbus_fan_status_flags[f]) &&
-			    pmbus_check_byte_register(client,
-					page, pmbus_fan_status_registers[f])) {
+			ret =  pmbus_check_byte_register(client, page,
+						pmbus_fan_status_registers[f]);
+			if (ret < 0)
+				return ret;
+
+			if ((info->func[page] & pmbus_fan_status_flags[f])
+					&& ret) {
 				int base;
 
 				if (f > 1)	/* fan 3, 4 */
@@ -1918,10 +1971,13 @@ static int pmbus_identify_common(struct i2c_client *client,
 				 struct pmbus_data *data, int page)
 {
 	int vout_mode = -1;
+	int rv;
 
-	if (pmbus_check_byte_register(client, page, PMBUS_VOUT_MODE))
+	rv = pmbus_check_byte_register(client, page, PMBUS_VOUT_MODE);
+	if (rv == 1)
 		vout_mode = _pmbus_read_byte_data(client, page,
 						  PMBUS_VOUT_MODE);
+
 	if (vout_mode >= 0 && vout_mode != 0xff) {
 		/*
 		 * Not all chips support the VOUT_MODE command,
@@ -1947,8 +2003,7 @@ static int pmbus_identify_common(struct i2c_client *client,
 		}
 	}
 
-	pmbus_clear_fault_page(client, page);
-	return 0;
+	return pmbus_clear_fault_page(client, page);
 }
 
 static int pmbus_read_status_byte(struct i2c_client *client, int page)
@@ -1990,7 +2045,9 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
 	if (ret >= 0 && (ret & PB_CAPABILITY_ERROR_CHECK))
 		client->flags |= I2C_CLIENT_PEC;
 
-	pmbus_clear_faults(client);
+	ret = pmbus_clear_faults(client);
+	if (ret < 0)
+		return ret;
 
 	if (info->identify) {
 		ret = (*info->identify)(client, info);
-- 
2.11.0
