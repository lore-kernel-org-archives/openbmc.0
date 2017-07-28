Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xJvKL2PLfzDrS6
 for <openbmc@lists.ozlabs.org>; Sat, 29 Jul 2017 02:23:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="qbd6IXAw"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="mOFr65H5"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 569FE209F7;
 Fri, 28 Jul 2017 12:23:16 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Fri, 28 Jul 2017 12:23:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=2s4jxR
 nRmdaYIazH7QsBLquYB7+2M4teSUyFA3JQr/Y=; b=qbd6IXAw1kL5Ncg7V2AiO2
 L0lyv/xBJBpTZ9T9u8E9GHqwyxvgYi9jLXcyf7y36bZkf3UQIZpd5/3dCjQSDBo5
 ujdPAcnHT1rRc9avANy6GmqWqGbSZe5TC6sEqtsG/K7LtWtMeoP++0eBQOk0qeZN
 8rR7mOKVIKDsGQcyDLVeFHpQN5A5SPdhuCP0ZE3S0nQDyNl4dMT+fnzJpQkp97L3
 VH/acxVKxXFgezQLiS9IHTvmrQRkEEiSrdccKRFa5lLeYmrnFQPVepuAT90nf2gl
 9JkUcrCzcoJW3Mld8kNZxr8PcevZ8ll6QDhu/OPr2qI/5eUlQIyxKL8UYZ7ep45Q
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=2s4jxRnRmdaYIazH7QsBLquYB7+2M4teSUyFA3JQr
 /Y=; b=mOFr65H5favHXZWcOn9+YlCrWWj146ZxtkL9bP0xQZL158kgH8+IBPQs2
 a3YGqHydsRE+58KbIf/by0PUI/dCn/XebAXYePGxS2sn8n5NSzSdw7ELPSQzdJvj
 7klf/SpawfvxN74ylNwMNbGIOue3DdLQL8WNsUvUK4U3/MlGoHEBhuV93Us2x6ip
 kmI3nb4M+4BWrVEoW59eI4TGgbkllv7YY9n+V/bKZujEy3GiWCbTZup6/IjKq40Z
 Ymp+NVud90RKo8nRkZ/qhwuBK5pWOkb2P1GKrnMlBkri6DtgXnfboB4tyfH7IUbE
 xDwdinX9pq+dvtujDN4cF5U3rUvSg==
X-ME-Sender: <xms:9GR7WXUPFM5LMN67B4tEYpBiVKvmpS3BUqvWckWLym7Ztf1zfUKasQ>
X-Sasl-enc: MikwdrJ69imulQBIzrE1AHUeFVUv8WGOAypnDOii5VXN 1501258995
Received: from keelia.au.ibm.com
 (ppp118-210-176-216.bras2.adl6.internode.on.net [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1518C7E351;
 Fri, 28 Jul 2017 12:23:13 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>, mspinler@linux.vnet.ibm.com,
 msbarth@linux.vnet.ibm.com, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 6/6] pmbus: max31785: Work around back-to-back
 writes with FAN_CONFIG_1_2
Date: Sat, 29 Jul 2017 01:52:49 +0930
Message-Id: <20170728162249.9145-7-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170728162249.9145-1-andrew@aj.id.au>
References: <20170728162249.9145-1-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 28 Jul 2017 16:23:18 -0000

Testing of the pmbus max31785 driver implementation revealed occasional
NACKs from the device. Attempting the same transaction immediately after
the failure appears to always succeed. The NACK has consistently been
observed to happen on the second write of back-to-back writes to the
device, where the first write is to FAN_CONFIG_1_2. The NACK occurs
against the first data byte transmitted by the master on the second
write. The behaviour has the hallmarks of a PMBus Device Busy response,
but the busy bit is not set in the status byte.

Work around this undocumented behaviour by retrying any back-to-back
writes that occur after first writing FAN_CONFIG_1_2.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/hwmon/pmbus/max31785.c | 105 +++++++++++++++++++++++++++++++++++++----
 1 file changed, 97 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/pmbus/max31785.c b/drivers/hwmon/pmbus/max31785.c
index a86919bc7294..1911658ffcf6 100644
--- a/drivers/hwmon/pmbus/max31785.c
+++ b/drivers/hwmon/pmbus/max31785.c
@@ -48,6 +48,55 @@ enum max31785_regs {
 
 #define MAX31785_NR_PAGES		23
 
+/*
+ * MAX31785 dragons ahead
+ *
+ * It seems there's an undocumented timing constraint when performing
+ * back-to-back writes where the first write is to FAN_CONFIG_1_2. The device
+ * provides no indication of this besides NACK'ing master Txs; no bits are set
+ * in STATUS_BYTE to suggest anything has gone wrong.
+ *
+ * Given that, do a one-shot retry of the write.
+ *
+ * The __max31785_*_write_*_data() functions should be used at any point where
+ * the prior write is to FAN_CONFIG_1_2.
+ */
+static int __max31785_i2c_smbus_write_byte_data(struct i2c_client *client,
+						int command, u16 data)
+{
+	int ret;
+
+	ret = i2c_smbus_write_byte_data(client, command, data);
+	if (ret == -EIO)
+		ret = i2c_smbus_write_byte_data(client, command, data);
+
+	return ret;
+}
+
+static int __max31785_i2c_smbus_write_word_data(struct i2c_client *client,
+						int command, u16 data)
+{
+	int ret;
+
+	ret = i2c_smbus_write_word_data(client, command, data);
+	if (ret == -EIO)
+		ret = i2c_smbus_write_word_data(client, command, data);
+
+	return ret;
+}
+
+static int __max31785_pmbus_write_word_data(struct i2c_client *client, int page,
+					    int command, u16 data)
+{
+	int ret;
+
+	ret = pmbus_write_word_data(client, page, command, data);
+	if (ret == -EIO)
+		ret = pmbus_write_word_data(client, page, command, data);
+
+	return ret;
+}
+
 static int max31785_read_byte_data(struct i2c_client *client, int page,
 				   int reg)
 {
@@ -210,6 +259,31 @@ static int max31785_read_word_data(struct i2c_client *client, int page,
 	return rv;
 }
 
+static int __max31785_update_fan(struct i2c_client *client, int page,
+			       u8 config, u8 mask, u16 command)
+{
+	int from, rv;
+	u8 to;
+
+	from = pmbus_read_byte_data(client, page, PMBUS_FAN_CONFIG_12);
+	if (from < 0)
+		return from;
+
+	to = (from & ~mask) | (config & mask);
+
+	if (to != from) {
+		rv = pmbus_write_byte_data(client, page, PMBUS_FAN_CONFIG_12,
+					   to);
+		if (rv < 0)
+			return rv;
+	}
+
+	rv = __max31785_pmbus_write_word_data(client, page, PMBUS_FAN_COMMAND_1,
+					      command);
+
+	return rv;
+}
+
 static const int max31785_pwm_modes[] = { 0x7fff, 0x2710, 0xffff };
 
 static int max31785_write_word_data(struct i2c_client *client, int page,
@@ -219,12 +293,24 @@ static int max31785_write_word_data(struct i2c_client *client, int page,
 		return -ENXIO;
 
 	switch (reg) {
+	case PMBUS_VIRT_FAN_TARGET_1:
+		return __max31785_update_fan(client, page, PB_FAN_1_RPM,
+					     PB_FAN_1_RPM, word);
+	case PMBUS_VIRT_PWM_1:
+	{
+		u32 command = word;
+
+		command *= 100;
+		command /= 255;
+		return __max31785_update_fan(client, page, 0, PB_FAN_1_RPM,
+					     command);
+	}
 	case PMBUS_VIRT_PWM_ENABLE_1:
 		if (word >= ARRAY_SIZE(max31785_pwm_modes))
 			return -EINVAL;
 
-		return pmbus_update_fan(client, page, 0, 0, PB_FAN_1_RPM,
-					max31785_pwm_modes[word]);
+		return __max31785_update_fan(client, page, 0, PB_FAN_1_RPM,
+					     max31785_pwm_modes[word]);
 	default:
 		break;
 	}
@@ -262,7 +348,7 @@ static int max31785_of_fan_config(struct i2c_client *client,
 		return -ENXIO;
 	}
 
-	ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
+	ret = __max31785_i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
 	if (ret < 0)
 		return ret;
 
@@ -421,7 +507,8 @@ static int max31785_of_fan_config(struct i2c_client *client,
 	if (ret < 0)
 		return ret;
 
-	ret = i2c_smbus_write_word_data(client, MFR_FAN_CONFIG, mfr_cfg);
+	ret = __max31785_i2c_smbus_write_word_data(client, MFR_FAN_CONFIG,
+						   mfr_cfg);
 	if (ret < 0)
 		return ret;
 
@@ -475,7 +562,7 @@ static int max31785_of_tmp_config(struct i2c_client *client,
 		return -ENXIO;
 	}
 
-	ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
+	ret = __max31785_i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
 	if (ret < 0)
 		return ret;
 
@@ -633,7 +720,8 @@ static int max31785_probe(struct i2c_client *client,
 		if (!have_fan || fan_configured)
 			continue;
 
-		ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, i);
+		ret = __max31785_i2c_smbus_write_byte_data(client, PMBUS_PAGE,
+							   i);
 		if (ret < 0)
 			return ret;
 
@@ -642,8 +730,9 @@ static int max31785_probe(struct i2c_client *client,
 			return ret;
 
 		ret &= ~PB_FAN_1_INSTALLED;
-		ret = i2c_smbus_write_word_data(client, PMBUS_FAN_CONFIG_12,
-						ret);
+		ret = __max31785_i2c_smbus_write_word_data(client,
+							   PMBUS_FAN_CONFIG_12,
+							   ret);
 		if (ret < 0)
 			return ret;
 	}
-- 
2.11.0
