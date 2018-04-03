Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="N2MBzTvq"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="jNwRO2Ye"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40Frz55FM9zF23F
 for <openbmc@lists.ozlabs.org>; Wed,  4 Apr 2018 00:27:45 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 8F52F2104B;
 Tue,  3 Apr 2018 10:27:43 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 03 Apr 2018 10:27:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=7tywdUCwOxiiUCGam
 4SHfIg6d1Ge0B3QZie78TaiqAA=; b=N2MBzTvqUyHxOUJiqxB79hR/u24FoJCio
 ZJowZQdzLI1Tqmviv3+5TaQCQJuTZjDCCysnyDRX/gBZ2PJ5NVm/mI4WZeJuqf9o
 bIISk9nlbYoA2UtJIMlx20uUEF3eu/DpbQ6OTZsngPiN8VjyyVOBCKrd8mpGPY1e
 JD3KtsFFWGrxFP2dIJ2OA37d12w07CEa5SS13JXv1iD411AsUyONEVJPQzTY2KAM
 C/yZs3BY/3bK2zIYTO5UAm2ocU+/QfG5CRSUYjQb44zYbxlH0l21YHgZQpxkW0rd
 r3Jij2fj3Pfi8I6LtJK9baJydyJsLXHceUtiFF4J6/7r0VV20yrZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=7tywdUCwOxiiUCGam4SHfIg6d1Ge0B3QZie78TaiqAA=; b=jNwRO2Ye
 R2YLqSIfM5fNAsA4D++QLDMZkTDz53+2RFWA1h72AowELs+M/wPEW9moWO0vAa8b
 EiduqJ2M27hJ6U2KUOTucd7XUsX+lKFgM+2Pu+EO99Z0SAc+vb2E6Hqyjlqy+2am
 htuI6fzUYtKVccTQiY9YBAC6uqKY3tqge8Xt5hT0d3z1Kl3/Bzg8JWks4mTnwxrZ
 PK6CIRlNYHJPRgSK8w1ubg0qzPCpSeiQD3d1MQUATerrmKeOlsOo0qk68rbX9ds0
 bc8QUPqD2Bit3BFd0ErGDtRTqY23Pp7wxbCLIpGZU+Y/diQ8VR+W5FDW0Q5wMOsW
 +LfJoDzJUN+jUw==
X-ME-Sender: <xms:X4_DWhKpw98fSCGMwbu5XaVpjhDv1mLooQmQtz55WgtunXdX763rIw>
Received: from dave.aj.id.au (202-161-9-32.dyn.iinet.net.au [202.161.9.32])
 by mail.messagingengine.com (Postfix) with ESMTPA id BCF7410269;
 Tue,  3 Apr 2018 10:27:41 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13 5/5] pmbus (max31785): Wrap all I2C accessors
 in one-shot failure handlers
Date: Tue,  3 Apr 2018 23:56:55 +0930
Message-Id: <20180403142655.16681-6-andrew@aj.id.au>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180403142655.16681-1-andrew@aj.id.au>
References: <20180403142655.16681-1-andrew@aj.id.au>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Apr 2018 14:27:46 -0000

The MAX31785(A) has shown erratic behaviour across multiple system
designs, unexpectedly clock stretching and NAKing transactions. Perform
a one-shot retry if necessary for all access attempts.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/hwmon/pmbus/max31785.c | 207 ++++++++++++++++++++++++++++++++---------
 1 file changed, 165 insertions(+), 42 deletions(-)

diff --git a/drivers/hwmon/pmbus/max31785.c b/drivers/hwmon/pmbus/max31785.c
index 9a7e745b6b31..3fb111c6d528 100644
--- a/drivers/hwmon/pmbus/max31785.c
+++ b/drivers/hwmon/pmbus/max31785.c
@@ -37,29 +37,105 @@ enum max31785_regs {
 #define MAX31785_NR_PAGES		23
 #define MAX31785_NR_FAN_PAGES		6
 
+/*
+ * MAX31785 dragons ahead
+ *
+ * We see weird issues where some transfers fail. There doesn't appear to be
+ * any pattern to the problem, so below we wrap all the read/write calls with a
+ * retry. The device provides no indication of this besides NACK'ing master
+ * Txs; no bits are set in STATUS_BYTE to suggest anything has gone wrong.
+ */
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
+
+static int max31785_i2c_smbus_write_byte_data(struct i2c_client *client,
+					      int command, u16 data)
+{
+	return max31785_retry(i2c_smbus_write_byte_data, client, command, data);
+}
+
+static int max31785_i2c_smbus_read_word_data(struct i2c_client *client,
+					     int command)
+{
+	return max31785_retry(i2c_smbus_read_word_data, client, command);
+}
+
+static int max31785_i2c_smbus_write_word_data(struct i2c_client *client,
+					      int command, u16 data)
+{
+	return max31785_retry(i2c_smbus_write_word_data, client, command, data);
+}
+
+static int max31785_pmbus_write_byte(struct i2c_client *client, int page,
+				     u8 value)
+{
+	return max31785_retry(pmbus_write_byte, client, page, value);
+}
+
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
+}
+
+static int max31785_pmbus_write_word_data(struct i2c_client *client, int page,
+					  int command, u16 data)
+{
+	return max31785_retry(pmbus_write_word_data, client, page, command,
+			      data);
+}
+
 static int max31785_read_byte_data(struct i2c_client *client, int page,
 				   int reg)
 {
-	if (page < MAX31785_NR_PAGES)
-		return -ENODATA;
-
 	switch (reg) {
 	case PMBUS_VOUT_MODE:
-		return -ENOTSUPP;
+		if (page >= MAX31785_NR_PAGES)
+			return -ENOTSUPP;
+		break;
 	case PMBUS_FAN_CONFIG_12:
-		return pmbus_read_byte_data(client, page - MAX31785_NR_PAGES,
-					    reg);
+		if (page >= MAX31785_NR_PAGES)
+			return max31785_pmbus_read_byte_data(client,
+					page - MAX31785_NR_PAGES,
+					reg);
+		break;
 	}
 
-	return -ENODATA;
+	return max31785_pmbus_read_byte_data(client, page, reg);
 }
 
 static int max31785_write_byte(struct i2c_client *client, int page, u8 value)
 {
-	if (page < MAX31785_NR_PAGES)
-		return -ENODATA;
+	if (page >= MAX31785_NR_PAGES)
+		return -ENOTSUPP;
 
-	return -ENOTSUPP;
+	return max31785_pmbus_write_byte(client, page, value);
 }
 
 static int max31785_read_long_data(struct i2c_client *client, int page,
@@ -120,11 +196,13 @@ static int max31785_get_pwm_mode(struct i2c_client *client, int page)
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
 
@@ -148,15 +226,14 @@ static int max31785_read_word_data(struct i2c_client *client, int page,
 	switch (reg) {
 	case PMBUS_READ_FAN_SPEED_1:
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
 	case PMBUS_FAN_COMMAND_1:
 		/*
 		 * PMBUS_FAN_COMMAND_x is probed to judge whether or not to
@@ -164,20 +241,28 @@ static int max31785_read_word_data(struct i2c_client *client, int page,
 		 *
 		 * Don't expose fan_target attribute for virtual pages.
 		 */
-		rv = (page >= MAX31785_NR_PAGES) ? -ENOTSUPP : -ENODATA;
+		if (page >= MAX31785_NR_PAGES)
+			return -ENOTSUPP;
 		break;
+	case PMBUS_VIRT_FAN_TARGET_1:
+		if (page >= MAX31785_NR_PAGES)
+			return -ENOTSUPP;
+
+		return -ENODATA;
 	case PMBUS_VIRT_PWM_1:
-		rv = max31785_get_pwm(client, page);
-		break;
+		return max31785_get_pwm(client, page);
 	case PMBUS_VIRT_PWM_ENABLE_1:
-		rv = max31785_get_pwm_mode(client, page);
-		break;
+		return max31785_get_pwm_mode(client, page);
 	default:
-		rv = -ENODATA;
+		if (page >= MAX31785_NR_PAGES)
+			return -ENXIO;
 		break;
 	}
 
-	return rv;
+	if (reg >= PMBUS_VIRT_BASE)
+		return -ENXIO;
+
+	return max31785_pmbus_read_word_data(client, page, reg);
 }
 
 static inline u32 max31785_scale_pwm(u32 sensor_val)
@@ -201,6 +286,31 @@ static inline u32 max31785_scale_pwm(u32 sensor_val)
 	return (sensor_val * 100) / 255;
 }
 
+static int max31785_update_fan(struct i2c_client *client, int page,
+			       u8 config, u8 mask, u16 command)
+{
+	int from, rv;
+	u8 to;
+
+	from = max31785_pmbus_read_byte_data(client, page, PMBUS_FAN_CONFIG_12);
+	if (from < 0)
+		return from;
+
+	to = (from & ~mask) | (config & mask);
+
+	if (to != from) {
+		rv = max31785_pmbus_write_byte_data(client, page,
+						    PMBUS_FAN_CONFIG_12, to);
+		if (rv < 0)
+			return rv;
+	}
+
+	rv = max31785_pmbus_write_word_data(client, page, PMBUS_FAN_COMMAND_1,
+					    command);
+
+	return rv;
+}
+
 static int max31785_pwm_enable(struct i2c_client *client, int page,
 				    u16 word)
 {
@@ -230,15 +340,18 @@ static int max31785_pwm_enable(struct i2c_client *client, int page,
 		return -EINVAL;
 	}
 
-	return pmbus_update_fan(client, page, 0, config, PB_FAN_1_RPM, rate);
+	return max31785_update_fan(client, page, config, PB_FAN_1_RPM, rate);
 }
 
 static int max31785_write_word_data(struct i2c_client *client, int page,
 				    int reg, u16 word)
 {
 	switch (reg) {
+	case PMBUS_VIRT_FAN_TARGET_1:
+		return max31785_update_fan(client, page, PB_FAN_1_RPM,
+					   PB_FAN_1_RPM, word);
 	case PMBUS_VIRT_PWM_1:
-		return pmbus_update_fan(client, page, 0, 0, PB_FAN_1_RPM,
+		return max31785_update_fan(client, page, 0, PB_FAN_1_RPM,
 					max31785_scale_pwm(word));
 	case PMBUS_VIRT_PWM_ENABLE_1:
 		return max31785_pwm_enable(client, page, word);
@@ -246,7 +359,10 @@ static int max31785_write_word_data(struct i2c_client *client, int page,
 		break;
 	}
 
-	return -ENODATA;
+	if (reg < PMBUS_VIRT_BASE)
+		return max31785_pmbus_write_word_data(client, page, reg, word);
+
+	return -ENXIO;
 }
 
 /*
@@ -279,11 +395,11 @@ static int max31785_of_fan_config(struct i2c_client *client,
 		return -ENXIO;
 	}
 
-	ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
+	ret = max31785_i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
 	if (ret < 0)
 		return ret;
 
-	pb_cfg = i2c_smbus_read_byte_data(client, PMBUS_FAN_CONFIG_12);
+	pb_cfg = max31785_i2c_smbus_read_byte_data(client, PMBUS_FAN_CONFIG_12);
 	if (pb_cfg < 0)
 		return pb_cfg;
 
@@ -309,7 +425,9 @@ static int max31785_of_fan_config(struct i2c_client *client,
 	} else if (!strcmp("lock", sval)) {
 		mfr_cfg |= MFR_FAN_CONFIG_ROTOR;
 
-		ret = i2c_smbus_write_word_data(client, MFR_FAN_FAULT_LIMIT, 1);
+		ret = max31785_i2c_smbus_write_word_data(client,
+							 MFR_FAN_FAULT_LIMIT,
+							 1);
 		if (ret < 0)
 			return ret;
 
@@ -423,21 +541,23 @@ static int max31785_of_fan_config(struct i2c_client *client,
 	if (of_property_read_bool(child, "maxim,fan-fault-pin-mon"))
 		mfr_fault_resp |= MFR_FAULT_RESPONSE_MONITOR;
 
-	ret = i2c_smbus_write_byte_data(client, PMBUS_FAN_CONFIG_12,
+	ret = max31785_i2c_smbus_write_byte_data(client, PMBUS_FAN_CONFIG_12,
 					pb_cfg & ~PB_FAN_1_INSTALLED);
 	if (ret < 0)
 		return ret;
 
-	ret = i2c_smbus_write_word_data(client, MFR_FAN_CONFIG, mfr_cfg);
+	ret = max31785_i2c_smbus_write_word_data(client, MFR_FAN_CONFIG,
+						 mfr_cfg);
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
 
@@ -482,7 +602,7 @@ static int max31785_of_tmp_config(struct i2c_client *client,
 		return -ENXIO;
 	}
 
-	ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
+	ret = max31785_i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
 	if (ret < 0)
 		return ret;
 
@@ -506,7 +626,7 @@ static int max31785_of_tmp_config(struct i2c_client *client,
 		i++;
 	}
 
-	ret = i2c_smbus_write_word_data(client, MFR_TEMP_SENSOR_CONFIG,
+	ret = max31785_i2c_smbus_write_word_data(client, MFR_TEMP_SENSOR_CONFIG,
 					mfr_tmp_cfg);
 	if (ret < 0)
 		return ret;
@@ -585,11 +705,11 @@ static int max31785_configure_dual_tach(struct i2c_client *client,
 	int i;
 
 	for (i = 0; i < MAX31785_NR_FAN_PAGES; i++) {
-		ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, i);
+		ret = max31785_i2c_smbus_write_byte_data(client, PMBUS_PAGE, i);
 		if (ret < 0)
 			return ret;
 
-		ret = i2c_smbus_read_word_data(client, MFR_FAN_CONFIG);
+		ret = max31785_i2c_smbus_read_word_data(client, MFR_FAN_CONFIG);
 		if (ret < 0)
 			return ret;
 
@@ -627,7 +747,7 @@ static int max31785_probe(struct i2c_client *client,
 
 	*info = max31785_info;
 
-	ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, 255);
+	ret = max31785_i2c_smbus_write_byte_data(client, PMBUS_PAGE, 255);
 	if (ret < 0)
 		return ret;
 
@@ -669,17 +789,20 @@ static int max31785_probe(struct i2c_client *client,
 		if (!have_fan || fan_configured)
 			continue;
 
-		ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, i);
+		ret = max31785_i2c_smbus_write_byte_data(client, PMBUS_PAGE,
+							 i);
 		if (ret < 0)
 			return ret;
 
-		ret = i2c_smbus_read_byte_data(client, PMBUS_FAN_CONFIG_12);
+		ret = max31785_i2c_smbus_read_byte_data(client,
+							PMBUS_FAN_CONFIG_12);
 		if (ret < 0)
 			return ret;
 
 		ret &= ~PB_FAN_1_INSTALLED;
-		ret = i2c_smbus_write_word_data(client, PMBUS_FAN_CONFIG_12,
-						ret);
+		ret = max31785_i2c_smbus_write_word_data(client,
+							 PMBUS_FAN_CONFIG_12,
+							 ret);
 		if (ret < 0)
 			return ret;
 	}
-- 
2.14.1
