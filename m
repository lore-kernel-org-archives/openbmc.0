Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="LQ4174/T"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="T1RNcqay"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z1J1J2TdfzDsSh
 for <openbmc@lists.ozlabs.org>; Wed, 20 Dec 2017 00:00:50 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id BAD272082E;
 Tue, 19 Dec 2017 08:00:47 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Tue, 19 Dec 2017 08:00:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=WPyMLdI0aQOfMhYi9hXSuPoCMZcylMmMhJQQhgt9t
 V8=; b=LQ4174/T63waI912ufE6EOUB0euCH08KN2+qypv4teKJRoE9qGPaZTJC3
 u6zpjDTelA/AWNCJXHTNsz2JqGMb+G2b8ja6CiFAw1Cd9iZd5Grh5gUrLxMu4xWx
 8zaDRjQxuaBjouBS81EzZG4x7oh1zCsl8T/0Lv3dHrKcl1ntf8Q6JhsqUdGfs1sp
 FXYtO29DOS6Uwgg9xztJDzmsIqLuFcEhJ9Gwm+RSRyUJoxLWMDEpoxHUN9ihnEOG
 4JLhElgqGpzJc5cR7pl7QLRhemTemGhabEZC22AcilvSSC6R3bR3G3TzBojye5KL
 l0wyqusw/R6CtrjhRwldKduuAX+iQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=WPyMLdI0aQOfMhYi9
 hXSuPoCMZcylMmMhJQQhgt9tV8=; b=T1RNcqayym0Vnt8AshK8zh/DqeTkCYBzK
 2YwhmmWrYg1Kggc3PrC/pWEj7uglbbeDIUkjkd5uCEAVmsoaubxtWW2Vm+GvNf2/
 jDAxxU40jUXFbcPxM/z5se2dGOcsFrsZSZ/YDvxtvBPvlrQRqDiAEEKpRsZ1rwnP
 HbK9MBtrGlmNtqjRCDNXrdsYUb/s6i3aOC4kZkPPZ9GXzv4ajEFCiTQnAiKsnLZ1
 U7vJn4+FCJHnYt0hQT/09CDdUENkxjQcnGdJpbFcE2FBbkby+x1nfmWpQ7KLKtWr
 jfTiOu8lN3CLX6I6ESgzvWhFaVW7TAn/jhWVnUy27o1hjgiiylOQA==
X-ME-Sender: <xms:fw05Wu93ZsSggW9KYAwOJkjBGCizFr7WyzbdayqeDsHfZ7cJaceePw>
Received: from dave.aj.id.au (220-253-44-183.dyn.iinet.net.au [220.253.44.183])
 by mail.messagingengine.com (Postfix) with ESMTPA id D87FE2420E;
 Tue, 19 Dec 2017 08:00:44 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Cc: Andrew Jeffery <andrew@aj.id.au>,
 Matthew Barth <msbarth@linux.vnet.ibm.com>, joel@jms.id.au,
 Andrew Geissler <geissonator@gmail.com>,
 Stephanie Swanson <swanman@us.ibm.com>
Subject: [PATCH linux dev-4.10 v2] pmbus (max31785): Wrap all I2C accessors in
 one-shot failure handlers
Date: Tue, 19 Dec 2017 23:30:05 +1030
Message-Id: <20171219130005.13374-1-andrew@aj.id.au>
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
X-List-Received-Date: Tue, 19 Dec 2017 13:00:54 -0000

I've observed and have had reported to me errors returned beyond the initial
strong pattern of consecutive accesses to the FAN_CONFIG* and FAN_COMMAND*
registers. Given there's now no obvious pattern, just wrap everything in a
one-shot failure handler.

Cc: Stephanie Swanson <swanman@us.ibm.com>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
In v2:

* Rebase on the tip of dev-4.10
* Fix openbmc/openbmc 2715[1], which affected v1

[1] https://github.com/openbmc/openbmc/issues/2715

Issue 2715 was a result of type mismatch between the {read,write}_word_data()
callbacks and the pmbus_{read,write}_word_data() helper functions, where the
latter takes u8s as arguments whilst the former ints for page and reg. The
combined issues of PMBus virtual registers using values exceeding 0x100 and
incomplete handling of necessary registers in the
max31785_{read,write}_word_data() implementations lead to out-of-range register
addresses being passed to pmbus_read_word_data(). Such reads will return values
with all bits set, which when interpreted as a signed value gives -1.

I've given this some light testing - though a bit more than I gave the original
spin. I looks okay to me, but could do with some testing from others.

 drivers/hwmon/pmbus/max31785.c | 151 +++++++++++++++++++++++++----------------
 1 file changed, 92 insertions(+), 59 deletions(-)

diff --git a/drivers/hwmon/pmbus/max31785.c b/drivers/hwmon/pmbus/max31785.c
index c862ab51e3af..2ad43b04ca96 100644
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
 
@@ -224,16 +247,17 @@ static int max31785_read_word_data(struct i2c_client *client, int page,
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
+	case PMBUS_VIRT_FAN_TARGET_1:
+		return -ENODATA;
 	case PMBUS_VIRT_PWM_1:
 		if (page >= MAX31785_NR_PAGES)
 			return -ENOTSUPP;
@@ -244,19 +268,24 @@ static int max31785_read_word_data(struct i2c_client *client, int page,
 
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
+	if (reg < PMBUS_VIRT_BASE)
+		return max31785_pmbus_read_word_data(client, page, reg);
+
+	return -ENXIO;
 }
 
 static int max31785_update_fan(struct i2c_client *client, int page,
@@ -265,15 +294,15 @@ static int max31785_update_fan(struct i2c_client *client, int page,
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
@@ -315,7 +344,10 @@ static int max31785_write_word_data(struct i2c_client *client, int page,
 		break;
 	}
 
-	return -ENODATA;
+	if (reg < PMBUS_VIRT_BASE)
+		return max31785_pmbus_write_word_data(client, page, reg, word);
+
+	return -ENXIO;
 }
 
 /*
@@ -352,7 +384,7 @@ static int max31785_of_fan_config(struct i2c_client *client,
 	if (ret < 0)
 		return ret;
 
-	pb_cfg = i2c_smbus_read_byte_data(client, PMBUS_FAN_CONFIG_12);
+	pb_cfg = max31785_i2c_smbus_read_byte_data(client, PMBUS_FAN_CONFIG_12);
 	if (pb_cfg < 0)
 		return pb_cfg;
 
@@ -378,7 +410,7 @@ static int max31785_of_fan_config(struct i2c_client *client,
 	} else if (!strcmp("lock", sval)) {
 		mfr_cfg |= MFR_FAN_CONFIG_ROTOR;
 
-		ret = i2c_smbus_write_word_data(client, MFR_FAN_FAULT_LIMIT, 1);
+		ret = max31785_i2c_smbus_write_word_data(client, MFR_FAN_FAULT_LIMIT, 1);
 		if (ret < 0)
 			return ret;
 
@@ -501,7 +533,7 @@ static int max31785_of_fan_config(struct i2c_client *client,
 	if (of_property_read_bool(child, "maxim,fan-fault-pin-mon"))
 		mfr_fault_resp |= MFR_FAULT_RESPONSE_MONITOR;
 
-	ret = i2c_smbus_write_byte_data(client, PMBUS_FAN_CONFIG_12,
+	ret = max31785_i2c_smbus_write_byte_data(client, PMBUS_FAN_CONFIG_12,
 					pb_cfg & ~PB_FAN_1_INSTALLED);
 	if (ret < 0)
 		return ret;
@@ -511,12 +543,13 @@ static int max31785_of_fan_config(struct i2c_client *client,
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
 
@@ -585,7 +618,7 @@ static int max31785_of_tmp_config(struct i2c_client *client,
 		}
 	}
 
-	ret = i2c_smbus_write_word_data(client, MFR_TEMP_SENSOR_CONFIG,
+	ret = max31785_i2c_smbus_write_word_data(client, MFR_TEMP_SENSOR_CONFIG,
 					mfr_tmp_cfg);
 	if (ret < 0)
 		return ret;
@@ -672,7 +705,7 @@ static int max31785_probe(struct i2c_client *client,
 
 	*info = max31785_info;
 
-	ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, 255);
+	ret = max31785_i2c_smbus_write_byte_data(client, PMBUS_PAGE, 255);
 	if (ret < 0)
 		return ret;
 
@@ -724,7 +757,7 @@ static int max31785_probe(struct i2c_client *client,
 		if (ret < 0)
 			return ret;
 
-		ret = i2c_smbus_read_byte_data(client, PMBUS_FAN_CONFIG_12);
+		ret = max31785_i2c_smbus_read_byte_data(client, PMBUS_FAN_CONFIG_12);
 		if (ret < 0)
 			return ret;
 
-- 
2.14.1
