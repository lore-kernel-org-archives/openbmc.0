Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="HfRfRgWh"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="E511VXuH"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yWLhs2fWJzDrKq
 for <openbmc@lists.ozlabs.org>; Tue,  7 Nov 2017 18:31:41 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3019220CAA;
 Tue,  7 Nov 2017 02:31:39 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Tue, 07 Nov 2017 02:31:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Pm6FbV1V70XrSaaFf
 0zIbGYJZWE7QSQiDtSClCmkKPg=; b=HfRfRgWhTw6OlZQB5L2GVw5qYqccs7+ua
 BJiJEbMs6rZrRwtob+1xU+li4uwurCljoBk5QqhrEKM01xj/REyO+tdVGbPDDBZV
 Har2ZtJYWsIUIUHPmLyJC+Thk3FxH0hObQ64PsVnUZcfb9Q5w+dkZoQxLUI0nujE
 hMPw5V7TIt4Qk58DLbSMjXTqxlD56Fzcpjidk1Tk3YbgJ1/UKohx44oSIzSCOJcJ
 CkVfsxCmPGMsVzqvzG9bDQIyBOFovtxXe1TuNwRdGXW2/8rIuzeP0Rr8zHK3knBE
 Mj3FWGI1RcQep2MhFp2UzNDc1aW4BcUnvaOdsuOJ0r+uhG1KPgS6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=Pm6FbV1V70XrSaaFf0zIbGYJZWE7QSQiDtSClCmkKPg=; b=E511VXuH
 vDJBnkVGeCz7QTHCO0s7iCSjN+ltKgm2SmeUYGimrxKhulZqB/ZDatuub1vJ8veD
 PebC4fLlssN+diErjLbUi9WaVtIcvs9/XVFf7PF7c4gW9nmNU9I0LSTIZN/5Hs6y
 KdOrx2HXj5Yfixrve8ACgCYEmts2kasN1pOvGCKKv+oNJ7a0aLeQW89S+GjlKTtC
 08U1a6tXrw2EZTmz8NIeGcPn+ZyBNKxDDF2oI3KZjvGp6Dtq60dpFMvvX4PHmvfn
 wc5ODqGXifWsrHxflfT8XsF9qPsbmDcrEPaqmxOqkK8U1TIKC7zrrgnfzp1yPw1g
 2lT6N0m5/0Smrw==
X-ME-Sender: <xms:W2EBWt03PQGl89PFQK0dCnJ0Cc4yrSdNZgGagbDxuyenM7JQjgOYPg>
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9EFD12494B;
 Tue,  7 Nov 2017 02:31:37 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13 06/23] pmbus: max31785: Work around
 back-to-back writes with FAN_CONFIG_1_2
Date: Tue,  7 Nov 2017 18:00:29 +1030
Message-Id: <20171107073046.13319-7-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20171107073046.13319-1-andrew@aj.id.au>
References: <20171107073046.13319-1-andrew@aj.id.au>
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
X-List-Received-Date: Tue, 07 Nov 2017 07:31:42 -0000

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
Reviewed-by: Joel Stanley <joel@jms.id.au>
[joel: make data argument to write_byte function a u8]
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/hwmon/pmbus/max31785.c | 105 +++++++++++++++++++++++++++++++++++++----
 1 file changed, 97 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/pmbus/max31785.c b/drivers/hwmon/pmbus/max31785.c
index c2b693badcea..6a0d289ad346 100644
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
+					      int command, u8 data)
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
