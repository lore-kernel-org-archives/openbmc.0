Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="ETJmF1rP"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Y4pjL4JO"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ygrDB26sWzDrTx
 for <openbmc@lists.ozlabs.org>; Tue, 21 Nov 2017 14:09:46 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C89E020C68;
 Mon, 20 Nov 2017 22:09:43 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 20 Nov 2017 22:09:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=QSKRLyKyODl7SPbIXrvvzJvIxueFaP1a8z1DQGMjr
 +8=; b=ETJmF1rPbPTLYxOA6Vs9AlEUjnUkURlwlf/i/79J8rxGNAhJ/hL2dh2c9
 qTHNJt7LH2kLwsxslOIyj1cwLwB0luZ6xGuca6CMIIYZxuvQbgRpUpuY6m5YSBz2
 2mZK2+E+kNv8PXVnkHltBvRvM+5UvQLtQoOcc4howXmVj2rKkb+wImiy4T4MHFH/
 wA++b1tbgWn0NcGorhAgCQbAKgcFqvKmXbqpz9/Y3EwaVqEPg0yklSERkLsXTcOJ
 gN2xMO+mjvRQIn2FnhOfPxfdp0FUorZE4Ug+TgmbwarTlgJiK+6YX1BFs6uZpX5C
 JTIQ1wJhTCv6ngfg26sEsUxZgGWIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=QSKRLyKyODl7SPbIX
 rvvzJvIxueFaP1a8z1DQGMjr+8=; b=Y4pjL4JOHRgZoSelJijv9UOpZiCWbzst6
 Hrwv7UYXZzBbhwaV1h1jGrLxpOpWiaCBm5cWTV1yLIlbhh3aniNN3eiADTSld0XE
 yyIKZ6pTf9tVwjeeyd9XDePGUhtekdcxbgoF44QwpgpcbKKvJoX6vWIXfkPRezXW
 19jM+xR+cfvjI7DpoIKKQjAT2WMQtiBEEki35GRHZjravI4yvLbSGaEd5UKwmMWc
 UJjOlhuVUxLyq1c05/99rK5qNC1FSY9Ju1vfTXcVA4QWJ/5ASyaoa3IC5SKHSOWc
 slTwMO0e5SYb8XjW5whfa17Jh2dPUPcod5NYDWCEzeh5gD4Lyz6ow==
X-ME-Sender: <xms:95gTWj23Hs1QI8n9IXq0AmNsbq2-YWAwz1G0ilK7T8orIOrVwbAG0w>
Received: from dave.base64.com.au (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id C447E7FACA;
 Mon, 20 Nov 2017 22:09:41 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 Stephanie Swanson <swanman@us.ibm.com>
Subject: [PATCH linux dev-4.10] pmbus (max31785): Wrap all I2C accessors in
 one-shot failure handlers
Date: Tue, 21 Nov 2017 13:38:58 +1030
Message-Id: <20171121030858.14542-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.14.1
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
X-List-Received-Date: Tue, 21 Nov 2017 03:09:47 -0000

I've observed and have had reported to me errors returned beyond the initial
strong pattern of consecutive accesses to the FAN_CONFIG* and FAN_COMMAND*
registers. Given there's now no obvious pattern, just wrap everything in a
one-shot failure handler.

Cc: Stephanie Swanson <swanman@us.ibm.com>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/hwmon/pmbus/max31785.c | 143 ++++++++++++++++++++++++-----------------
 1 file changed, 84 insertions(+), 59 deletions(-)

diff --git a/drivers/hwmon/pmbus/max31785.c b/drivers/hwmon/pmbus/max31785.c
index c862ab51e3af..de62456496d7 100644
--- a/drivers/hwmon/pmbus/max31785.c
+++ b/drivers/hwmon/pmbus/max31785.c
@@ -51,50 +51,68 @@ enum max31785_regs {
 /*
  * MAX31785 dragons ahead
  *
- * It seems there's an undocumented timing constraint when performing
- * back-to-back writes where the first write is to FAN_CONFIG_1_2. The device
- * provides no indication of this besides NACK'ing master Txs; no bits are set
- * in STATUS_BYTE to suggest anything has gone wrong.
- *
- * Given that, do a one-shot retry of the write.
- *
- * The max31785_*_write_*_data() functions should be used at any point where
- * the prior write is to FAN_CONFIG_1_2.
+ * We see weird issues where some transfers fail. There doesn't appear to be
+ * any pattern to the problem, so below we wrap all the read/write calls with a
+ * retry. The device provides no indication of this besides NACK'ing master
+ * Txs; no bits are set in STATUS_BYTE to suggest anything has gone wrong.
  */
+
+#define max31785_retry(_func, ...) ({					\
+	/* All relevant functions return int, sue me */			\
+	int _ret = _func(__VA_ARGS__);					\
+	if (_ret == -EIO)						\
+		_ret = _func(__VA_ARGS__);				\
+	_ret;								\
+})
+
+static int max31785_i2c_smbus_read_byte_data(struct i2c_client *client,
+					      int command)
+{
+	return max31785_retry(i2c_smbus_read_byte_data, client, command);
+}
+
 static int max31785_i2c_smbus_write_byte_data(struct i2c_client *client,
 					      int command, u8 data)
 {
-	int ret;
-
-	ret = i2c_smbus_write_byte_data(client, command, data);
-	if (ret == -EIO)
-		ret = i2c_smbus_write_byte_data(client, command, data);
-
-	return ret;
+	return max31785_retry(i2c_smbus_write_byte_data, client, command, data);
 }
 
 static int max31785_i2c_smbus_write_word_data(struct i2c_client *client,
 					      int command, u16 data)
 {
-	int ret;
+	return max31785_retry(i2c_smbus_write_word_data, client, command, data);
+}
 
-	ret = i2c_smbus_write_word_data(client, command, data);
-	if (ret == -EIO)
-		ret = i2c_smbus_write_word_data(client, command, data);
+static int max31785_pmbus_write_byte(struct i2c_client *client, int page,
+				     u8 value)
+{
+	return max31785_retry(pmbus_write_byte, client, page, value);
+}
 
-	return ret;
+static int max31785_pmbus_read_byte_data(struct i2c_client *client, int page,
+					  int command)
+{
+	return max31785_retry(pmbus_read_byte_data, client, page, command);
+}
+
+static int max31785_pmbus_write_byte_data(struct i2c_client *client, int page,
+					  int command, u16 data)
+{
+	return max31785_retry(pmbus_write_byte_data, client, page, command,
+			      data);
+}
+
+static int max31785_pmbus_read_word_data(struct i2c_client *client, int page,
+					  int command)
+{
+	return max31785_retry(pmbus_read_word_data, client, page, command);
 }
 
 static int max31785_pmbus_write_word_data(struct i2c_client *client, int page,
 					  int command, u16 data)
 {
-	int ret;
-
-	ret = pmbus_write_word_data(client, page, command, data);
-	if (ret == -EIO)
-		ret = pmbus_write_word_data(client, page, command, data);
-
-	return ret;
+	return max31785_retry(pmbus_write_word_data, client, page, command,
+			      data);
 }
 
 static int max31785_read_byte_data(struct i2c_client *client, int page,
@@ -103,24 +121,25 @@ static int max31785_read_byte_data(struct i2c_client *client, int page,
 	switch (reg) {
 	case PMBUS_VOUT_MODE:
 		if (page < MAX31785_NR_PAGES)
-			return -ENODATA;
+			return max31785_pmbus_read_byte_data(client, page, reg);
 
 		return -ENOTSUPP;
 	case PMBUS_FAN_CONFIG_12:
 		if (page < MAX31785_NR_PAGES)
-			return -ENODATA;
+			return max31785_pmbus_read_byte_data(client, page, reg);
 
-		return pmbus_read_byte_data(client, page - MAX31785_NR_PAGES,
-					    reg);
+		return max31785_pmbus_read_byte_data(client,
+						     page - MAX31785_NR_PAGES,
+						     reg);
 	}
 
-	return -ENODATA;
+	return max31785_pmbus_read_byte_data(client, page, reg);
 }
 
 static int max31785_write_byte(struct i2c_client *client, int page, u8 value)
 {
 	if (page < MAX31785_NR_PAGES)
-		return -ENODATA;
+		return max31785_pmbus_write_byte(client, page, value);
 
 	return -ENOTSUPP;
 }
@@ -168,11 +187,13 @@ static int max31785_get_pwm(struct i2c_client *client, int page)
 	int config;
 	int command;
 
-	config = pmbus_read_byte_data(client, page, PMBUS_FAN_CONFIG_12);
+	config = max31785_pmbus_read_byte_data(client, page,
+					       PMBUS_FAN_CONFIG_12);
 	if (config < 0)
 		return config;
 
-	command = pmbus_read_word_data(client, page, PMBUS_FAN_COMMAND_1);
+	command = max31785_pmbus_read_word_data(client, page,
+						PMBUS_FAN_COMMAND_1);
 	if (command < 0)
 		return command;
 
@@ -193,11 +214,13 @@ static int max31785_get_pwm_mode(struct i2c_client *client, int page)
 	int config;
 	int command;
 
-	config = pmbus_read_byte_data(client, page, PMBUS_FAN_CONFIG_12);
+	config = max31785_pmbus_read_byte_data(client, page,
+					       PMBUS_FAN_CONFIG_12);
 	if (config < 0)
 		return config;
 
-	command = pmbus_read_word_data(client, page, PMBUS_FAN_COMMAND_1);
+	command = max31785_pmbus_read_word_data(client, page,
+						PMBUS_FAN_COMMAND_1);
 	if (command < 0)
 		return command;
 
@@ -224,15 +247,14 @@ static int max31785_read_word_data(struct i2c_client *client, int page,
 		u32 val;
 
 		if (page < MAX31785_NR_PAGES)
-			return -ENODATA;
+			return max31785_pmbus_read_word_data(client, page, reg);
 
 		rv = max31785_read_long_data(client, page - MAX31785_NR_PAGES,
 					     reg, &val);
 		if (rv < 0)
 			return rv;
 
-		rv = (val >> 16) & 0xffff;
-		break;
+		return (val >> 16) & 0xffff;
 	}
 	case PMBUS_VIRT_PWM_1:
 		if (page >= MAX31785_NR_PAGES)
@@ -244,19 +266,21 @@ static int max31785_read_word_data(struct i2c_client *client, int page,
 
 		rv *= 255;
 		rv /= 100;
-		break;
+
+		return rv;
 	case PMBUS_VIRT_PWM_ENABLE_1:
 		if (page >= MAX31785_NR_PAGES)
 			return -ENOTSUPP;
 
-		rv = max31785_get_pwm_mode(client, page);
-		break;
+		return max31785_get_pwm_mode(client, page);
 	default:
-		rv = (page >= MAX31785_NR_PAGES) ? -ENXIO : -ENODATA;
+		if (page >= MAX31785_NR_PAGES)
+			return -ENXIO;
+
 		break;
 	}
 
-	return rv;
+	return max31785_pmbus_read_word_data(client, page, reg);
 }
 
 static int max31785_update_fan(struct i2c_client *client, int page,
@@ -265,15 +289,15 @@ static int max31785_update_fan(struct i2c_client *client, int page,
 	int from, rv;
 	u8 to;
 
-	from = pmbus_read_byte_data(client, page, PMBUS_FAN_CONFIG_12);
+	from = max31785_pmbus_read_byte_data(client, page, PMBUS_FAN_CONFIG_12);
 	if (from < 0)
 		return from;
 
 	to = (from & ~mask) | (config & mask);
 
 	if (to != from) {
-		rv = pmbus_write_byte_data(client, page, PMBUS_FAN_CONFIG_12,
-					   to);
+		rv = max31785_pmbus_write_byte_data(client, page,
+						    PMBUS_FAN_CONFIG_12, to);
 		if (rv < 0)
 			return rv;
 	}
@@ -315,7 +339,7 @@ static int max31785_write_word_data(struct i2c_client *client, int page,
 		break;
 	}
 
-	return -ENODATA;
+	return max31785_pmbus_write_word_data(client, page, reg, word);
 }
 
 /*
@@ -352,7 +376,7 @@ static int max31785_of_fan_config(struct i2c_client *client,
 	if (ret < 0)
 		return ret;
 
-	pb_cfg = i2c_smbus_read_byte_data(client, PMBUS_FAN_CONFIG_12);
+	pb_cfg = max31785_i2c_smbus_read_byte_data(client, PMBUS_FAN_CONFIG_12);
 	if (pb_cfg < 0)
 		return pb_cfg;
 
@@ -378,7 +402,7 @@ static int max31785_of_fan_config(struct i2c_client *client,
 	} else if (!strcmp("lock", sval)) {
 		mfr_cfg |= MFR_FAN_CONFIG_ROTOR;
 
-		ret = i2c_smbus_write_word_data(client, MFR_FAN_FAULT_LIMIT, 1);
+		ret = max31785_i2c_smbus_write_word_data(client, MFR_FAN_FAULT_LIMIT, 1);
 		if (ret < 0)
 			return ret;
 
@@ -501,7 +525,7 @@ static int max31785_of_fan_config(struct i2c_client *client,
 	if (of_property_read_bool(child, "maxim,fan-fault-pin-mon"))
 		mfr_fault_resp |= MFR_FAULT_RESPONSE_MONITOR;
 
-	ret = i2c_smbus_write_byte_data(client, PMBUS_FAN_CONFIG_12,
+	ret = max31785_i2c_smbus_write_byte_data(client, PMBUS_FAN_CONFIG_12,
 					pb_cfg & ~PB_FAN_1_INSTALLED);
 	if (ret < 0)
 		return ret;
@@ -511,12 +535,13 @@ static int max31785_of_fan_config(struct i2c_client *client,
 	if (ret < 0)
 		return ret;
 
-	ret = i2c_smbus_write_byte_data(client, MFR_FAULT_RESPONSE,
-					mfr_fault_resp);
+	ret = max31785_i2c_smbus_write_byte_data(client, MFR_FAULT_RESPONSE,
+						 mfr_fault_resp);
 	if (ret < 0)
 		return ret;
 
-	ret = i2c_smbus_write_byte_data(client, PMBUS_FAN_CONFIG_12, pb_cfg);
+	ret = max31785_i2c_smbus_write_byte_data(client, PMBUS_FAN_CONFIG_12,
+						 pb_cfg);
 	if (ret < 0)
 		return ret;
 
@@ -585,7 +610,7 @@ static int max31785_of_tmp_config(struct i2c_client *client,
 		}
 	}
 
-	ret = i2c_smbus_write_word_data(client, MFR_TEMP_SENSOR_CONFIG,
+	ret = max31785_i2c_smbus_write_word_data(client, MFR_TEMP_SENSOR_CONFIG,
 					mfr_tmp_cfg);
 	if (ret < 0)
 		return ret;
@@ -672,7 +697,7 @@ static int max31785_probe(struct i2c_client *client,
 
 	*info = max31785_info;
 
-	ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, 255);
+	ret = max31785_i2c_smbus_write_byte_data(client, PMBUS_PAGE, 255);
 	if (ret < 0)
 		return ret;
 
@@ -724,7 +749,7 @@ static int max31785_probe(struct i2c_client *client,
 		if (ret < 0)
 			return ret;
 
-		ret = i2c_smbus_read_byte_data(client, PMBUS_FAN_CONFIG_12);
+		ret = max31785_i2c_smbus_read_byte_data(client, PMBUS_FAN_CONFIG_12);
 		if (ret < 0)
 			return ret;
 
-- 
2.14.1
