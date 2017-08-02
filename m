Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xMkyK0KhHzDsQq
 for <openbmc@lists.ozlabs.org>; Wed,  2 Aug 2017 17:16:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="apOCoVcA"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="pTKeoF/q"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 08B1F2097B;
 Wed,  2 Aug 2017 03:16:39 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Wed, 02 Aug 2017 03:16:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=sq+OGd
 /uBTY/p1vNePM4I1k99Rymb6C+94g5CoZh+34=; b=apOCoVcAdOWbpHtTvvocUO
 ahxfbgLHYyblhuLlpCG6ciXPWIHJve15uv3dP4VtqYbHhZK5gGrup8Tl1hTtr9Ge
 TP2GcBC6W7NxZX9BJOmXY+/IvqchdvWwmQV9Nxba8xqlMpN5UlckqwKmOvqhCU5N
 FJrtKNKrBC3vZBgJgvst98cJFns2LcIYov+nNB3ZLj5fWHUFYrDQF3SpvcH4bk6i
 +6LW6yd/OuTfdcwUprb2JIf/HdnPnLCQT4xIjg+E6EkkP3LiJx23h+Qyt5NBUL7p
 xzK1bxN4nxmT+xlfMWjKKrbovsnWdOwxeQsnHJkixw+g+JPIqqlPOMfMYQsw2WWw
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=sq+OGd/uBTY/p1vNePM4I1k99Rymb6C+94g5CoZh+
 34=; b=pTKeoF/qzgASTUpdCog62diycVg8C9egl/s4Pu4YOqFYiPVI4QIMrR8w1
 Rq4jIn4ako1rZ3lrNnHufOB4iz22SqLZC5CNAM3Ihi1R7SG9E2lJvjPYBBugl3eY
 Nur76brHyOBj9YvoUHzBIYUSQxmf/w3NX/PclF2MIJ3/lMlhHqf/soSkenXJue7g
 ydch25mqz57SHHJtFdlQwn1H5VcB6/OSaOAPBYyo+OmCB1ULah7pRJGNjV0M1zhe
 GSItkLpwFehHTSws7J3Ve/5E2R/zfPld9jAh8gZyLPEbmpilso/YTsCRZKc48eVo
 LX3a5ktK+xVOUJ5qQ+8gCgmw+92tA==
X-ME-Sender: <xms:VnyBWUvO0WdGfzmMp8Wje4Bi2_enCfrfd9b2Xlmb-mQNppxNAlIdWg>
X-Sasl-enc: 86hbikUcdHVVHLCidKZzWJbrX+vQ1aYQOAPD+4oPqRzn 1501658198
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0EB227E335;
 Wed,  2 Aug 2017 03:16:33 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, robh+dt@kernel.org, mark.rutland@arm.com,
 jdelvare@suse.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, joel@jms.id.au, mspinler@linux.vnet.ibm.com,
 msbarth@linux.vnet.ibm.com, openbmc@lists.ozlabs.org
Subject: [PATCH v2 4/4] pmbus: max31785: Work around back-to-back writes with
 FAN_CONFIG_1_2
Date: Wed,  2 Aug 2017 16:45:41 +0930
Message-Id: <20170802071541.3121-5-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170802071541.3121-1-andrew@aj.id.au>
References: <20170802071541.3121-1-andrew@aj.id.au>
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
X-List-Received-Date: Wed, 02 Aug 2017 07:16:42 -0000

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
index c2b693badcea..509b1a5a49b9 100644
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
+ * The max31785_*_write_*_data() functions should be used at any point where
+ * the prior write is to FAN_CONFIG_1_2.
+ */
+static int max31785_i2c_smbus_write_byte_data(struct i2c_client *client,
+					      int command, u16 data)
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
+static int max31785_i2c_smbus_write_word_data(struct i2c_client *client,
+					      int command, u16 data)
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
+static int max31785_pmbus_write_word_data(struct i2c_client *client, int page,
+					  int command, u16 data)
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
 
+static int max31785_update_fan(struct i2c_client *client, int page,
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
+	rv = max31785_pmbus_write_word_data(client, page, PMBUS_FAN_COMMAND_1,
+					    command);
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
+		return max31785_update_fan(client, page, PB_FAN_1_RPM,
+					   PB_FAN_1_RPM, word);
+	case PMBUS_VIRT_PWM_1:
+	{
+		u32 command = word;
+
+		command *= 100;
+		command /= 255;
+		return max31785_update_fan(client, page, 0, PB_FAN_1_RPM,
+					   command);
+	}
 	case PMBUS_VIRT_PWM_ENABLE_1:
 		if (word >= ARRAY_SIZE(max31785_pwm_modes))
 			return -EINVAL;
 
-		return pmbus_update_fan(client, page, 0, 0, PB_FAN_1_RPM,
-					max31785_pwm_modes[word]);
+		return max31785_update_fan(client, page, 0, PB_FAN_1_RPM,
+					   max31785_pwm_modes[word]);
 	default:
 		break;
 	}
@@ -262,7 +348,7 @@ static int max31785_of_fan_config(struct i2c_client *client,
 		return -ENXIO;
 	}
 
-	ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
+	ret = max31785_i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
 	if (ret < 0)
 		return ret;
 
@@ -419,7 +505,8 @@ static int max31785_of_fan_config(struct i2c_client *client,
 	if (ret < 0)
 		return ret;
 
-	ret = i2c_smbus_write_word_data(client, MFR_FAN_CONFIG, mfr_cfg);
+	ret = max31785_i2c_smbus_write_word_data(client, MFR_FAN_CONFIG,
+						 mfr_cfg);
 	if (ret < 0)
 		return ret;
 
@@ -473,7 +560,7 @@ static int max31785_of_tmp_config(struct i2c_client *client,
 		return -ENXIO;
 	}
 
-	ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
+	ret = max31785_i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
 	if (ret < 0)
 		return ret;
 
@@ -631,7 +718,8 @@ static int max31785_probe(struct i2c_client *client,
 		if (!have_fan || fan_configured)
 			continue;
 
-		ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, i);
+		ret = max31785_i2c_smbus_write_byte_data(client, PMBUS_PAGE,
+							 i);
 		if (ret < 0)
 			return ret;
 
@@ -640,8 +728,9 @@ static int max31785_probe(struct i2c_client *client,
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
2.11.0
