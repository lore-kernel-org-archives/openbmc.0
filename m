Return-Path: <sam@mendozajonas.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mendozajonas.com
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=sam@mendozajonas.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="PtCegRWl"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ofOjZyLQ"; dkim-atps=neutral
X-Greylist: delayed 517 seconds by postgrey-1.36 at bilbo;
 Mon, 15 Jan 2018 17:07:56 AEDT
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zKjZN4JxszF0dM
 for <openbmc@lists.ozlabs.org>; Mon, 15 Jan 2018 17:07:56 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 952AB20996;
 Mon, 15 Jan 2018 00:59:15 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute2.internal (MEProxy); Mon, 15 Jan 2018 00:59:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=cs7C6Lt7bTGI/qHeX
 awDQqEQ79z4Wbi+dVtflwgC7EU=; b=PtCegRWlC//EhNZkhUiWMFgFhSgJOpzBD
 w4BI5xwQlZqVVIAxMQcvc5E4zp3c3N4qmK8zW1coPFzeB9B2r9f8XzL5p4cmPOau
 /VFx05raEr7xY+zGznhB+Gzc58Jm3CzXH9Z2nsYbHJXqdA3nG3/mSWN4HVYnpvct
 NG4vWl+ay/HxCgYFU/pkBqlRqAXRRSkZhhoisjj2RDAEirwpwndEcfs7TSiif6Uw
 VIA1chVnJsu/ug+xiE8jxk+0eTi+U0JBnMx69ZS0NvNmtetbn4SzMviLa7K1ZTZU
 9vTw00XJT8l9m4TzdxFidIWYLCcR4en44xLRS990CrXJ+zTTt8j5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=cs7C6Lt7bTGI/qHeX
 awDQqEQ79z4Wbi+dVtflwgC7EU=; b=ofOjZyLQILc5lZDwQ+L2JAouC67FFTNdY
 wqlaQ62oergpa28a2VoR2p+rXODZESIl0SZTM9mYXdUalDQAjjjH6afEeji+Tlg+
 FXxkdCNKf7iot6E8t/vac33VV9iSeMfcrQjYSBefuR9UmweeCUMj5cfpie+k9y0F
 pZ0YdReTsduSIcgrzqEPIsbT6b1scmP3YYfFaaf/mvgPZShv9YsDtgCWHQKUCuCl
 WWh4jSd38d9NXuAiCRrCPwuNpMbjEnLIyNiYoIssTl2LEJy76vBW+zqYzbdX+Ill
 FGv+Dbn79OUMBHKLrROLaF3oZMM2FTPVBHQ20WfB+Xjjg/f+HYf/w==
X-ME-Sender: <xms:M0NcWj7EqRugtNo73x5CK04V4BIAZZy4X0N6HmHkwdx7VPnJTWJcng>
Received: from v4.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7632E24741;
 Mon, 15 Jan 2018 00:59:13 -0500 (EST)
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org
Cc: Samuel Mendoza-Jonas <sam@mendozajonas.com>,
 Jean Delvare <jdelvare@suse.com>, linux-kernel@vger.kernel.org,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: [PATCH] hwmon: (pmbus/ir35221) Remove unnecessary scaling
Date: Mon, 15 Jan 2018 16:58:58 +1100
Message-Id: <20180115055858.1188-1-sam@mendozajonas.com>
X-Mailer: git-send-email 2.15.1
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
X-List-Received-Date: Mon, 15 Jan 2018 06:07:58 -0000

The ir35221 datasheet describes specific scaling factors for a number of
commands which the current driver applies when reading.
However now that the ir35221 has been tested on machines with more
easily verifiable readings these descriptions have turned out to be
superfluous and reading each command according to the linear format is
sufficient.

Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
---
 drivers/hwmon/pmbus/ir35221.c | 189 ------------------------------------------
 1 file changed, 189 deletions(-)

diff --git a/drivers/hwmon/pmbus/ir35221.c b/drivers/hwmon/pmbus/ir35221.c
index 8b906b44484b..977315b0fd90 100644
--- a/drivers/hwmon/pmbus/ir35221.c
+++ b/drivers/hwmon/pmbus/ir35221.c
@@ -25,168 +25,19 @@
 #define IR35221_MFR_IOUT_VALLEY		0xcb
 #define IR35221_MFR_TEMP_VALLEY		0xcc
 
-static long ir35221_reg2data(int data, enum pmbus_sensor_classes class)
-{
-	s16 exponent;
-	s32 mantissa;
-	long val;
-
-	/* We only modify LINEAR11 formats */
-	exponent = ((s16)data) >> 11;
-	mantissa = ((s16)((data & 0x7ff) << 5)) >> 5;
-
-	val = mantissa * 1000L;
-
-	/* scale result to micro-units for power sensors */
-	if (class == PSC_POWER)
-		val = val * 1000L;
-
-	if (exponent >= 0)
-		val <<= exponent;
-	else
-		val >>= -exponent;
-
-	return val;
-}
-
-#define MAX_MANTISSA	(1023 * 1000)
-#define MIN_MANTISSA	(511 * 1000)
-
-static u16 ir35221_data2reg(long val, enum pmbus_sensor_classes class)
-{
-	s16 exponent = 0, mantissa;
-	bool negative = false;
-
-	if (val == 0)
-		return 0;
-
-	if (val < 0) {
-		negative = true;
-		val = -val;
-	}
-
-	/* Power is in uW. Convert to mW before converting. */
-	if (class == PSC_POWER)
-		val = DIV_ROUND_CLOSEST(val, 1000L);
-
-	/* Reduce large mantissa until it fits into 10 bit */
-	while (val >= MAX_MANTISSA && exponent < 15) {
-		exponent++;
-		val >>= 1;
-	}
-	/* Increase small mantissa to improve precision */
-	while (val < MIN_MANTISSA && exponent > -15) {
-		exponent--;
-		val <<= 1;
-	}
-
-	/* Convert mantissa from milli-units to units */
-	mantissa = DIV_ROUND_CLOSEST(val, 1000);
-
-	/* Ensure that resulting number is within range */
-	if (mantissa > 0x3ff)
-		mantissa = 0x3ff;
-
-	/* restore sign */
-	if (negative)
-		mantissa = -mantissa;
-
-	/* Convert to 5 bit exponent, 11 bit mantissa */
-	return (mantissa & 0x7ff) | ((exponent << 11) & 0xf800);
-}
-
-static u16 ir35221_scale_result(s16 data, int shift,
-				enum pmbus_sensor_classes class)
-{
-	long val;
-
-	val = ir35221_reg2data(data, class);
-
-	if (shift < 0)
-		val >>= -shift;
-	else
-		val <<= shift;
-
-	return ir35221_data2reg(val, class);
-}
-
 static int ir35221_read_word_data(struct i2c_client *client, int page, int reg)
 {
 	int ret;
 
 	switch (reg) {
-	case PMBUS_IOUT_OC_FAULT_LIMIT:
-	case PMBUS_IOUT_OC_WARN_LIMIT:
-		ret = pmbus_read_word_data(client, page, reg);
-		if (ret < 0)
-			break;
-		ret = ir35221_scale_result(ret, 1, PSC_CURRENT_OUT);
-		break;
-	case PMBUS_VIN_OV_FAULT_LIMIT:
-	case PMBUS_VIN_OV_WARN_LIMIT:
-	case PMBUS_VIN_UV_WARN_LIMIT:
-		ret = pmbus_read_word_data(client, page, reg);
-		ret = ir35221_scale_result(ret, -4, PSC_VOLTAGE_IN);
-		break;
-	case PMBUS_IIN_OC_WARN_LIMIT:
-		ret = pmbus_read_word_data(client, page, reg);
-		if (ret < 0)
-			break;
-		ret = ir35221_scale_result(ret, -1, PSC_CURRENT_IN);
-		break;
-	case PMBUS_READ_VIN:
-		ret = pmbus_read_word_data(client, page, PMBUS_READ_VIN);
-		if (ret < 0)
-			break;
-		ret = ir35221_scale_result(ret, -5, PSC_VOLTAGE_IN);
-		break;
-	case PMBUS_READ_IIN:
-		ret = pmbus_read_word_data(client, page, PMBUS_READ_IIN);
-		if (ret < 0)
-			break;
-		if (page == 0)
-			ret = ir35221_scale_result(ret, -4, PSC_CURRENT_IN);
-		else
-			ret = ir35221_scale_result(ret, -5, PSC_CURRENT_IN);
-		break;
-	case PMBUS_READ_POUT:
-		ret = pmbus_read_word_data(client, page, PMBUS_READ_POUT);
-		if (ret < 0)
-			break;
-		ret = ir35221_scale_result(ret, -1, PSC_POWER);
-		break;
-	case PMBUS_READ_PIN:
-		ret = pmbus_read_word_data(client, page, PMBUS_READ_PIN);
-		if (ret < 0)
-			break;
-		ret = ir35221_scale_result(ret, -1, PSC_POWER);
-		break;
-	case PMBUS_READ_IOUT:
-		ret = pmbus_read_word_data(client, page, PMBUS_READ_IOUT);
-		if (ret < 0)
-			break;
-		if (page == 0)
-			ret = ir35221_scale_result(ret, -1, PSC_CURRENT_OUT);
-		else
-			ret = ir35221_scale_result(ret, -2, PSC_CURRENT_OUT);
-		break;
 	case PMBUS_VIRT_READ_VIN_MAX:
 		ret = pmbus_read_word_data(client, page, IR35221_MFR_VIN_PEAK);
-		if (ret < 0)
-			break;
-		ret = ir35221_scale_result(ret, -5, PSC_VOLTAGE_IN);
 		break;
 	case PMBUS_VIRT_READ_VOUT_MAX:
 		ret = pmbus_read_word_data(client, page, IR35221_MFR_VOUT_PEAK);
 		break;
 	case PMBUS_VIRT_READ_IOUT_MAX:
 		ret = pmbus_read_word_data(client, page, IR35221_MFR_IOUT_PEAK);
-		if (ret < 0)
-			break;
-		if (page == 0)
-			ret = ir35221_scale_result(ret, -1, PSC_CURRENT_IN);
-		else
-			ret = ir35221_scale_result(ret, -2, PSC_CURRENT_IN);
 		break;
 	case PMBUS_VIRT_READ_TEMP_MAX:
 		ret = pmbus_read_word_data(client, page, IR35221_MFR_TEMP_PEAK);
@@ -194,9 +45,6 @@ static int ir35221_read_word_data(struct i2c_client *client, int page, int reg)
 	case PMBUS_VIRT_READ_VIN_MIN:
 		ret = pmbus_read_word_data(client, page,
 					   IR35221_MFR_VIN_VALLEY);
-		if (ret < 0)
-			break;
-		ret = ir35221_scale_result(ret, -5, PSC_VOLTAGE_IN);
 		break;
 	case PMBUS_VIRT_READ_VOUT_MIN:
 		ret = pmbus_read_word_data(client, page,
@@ -205,12 +53,6 @@ static int ir35221_read_word_data(struct i2c_client *client, int page, int reg)
 	case PMBUS_VIRT_READ_IOUT_MIN:
 		ret = pmbus_read_word_data(client, page,
 					   IR35221_MFR_IOUT_VALLEY);
-		if (ret < 0)
-			break;
-		if (page == 0)
-			ret = ir35221_scale_result(ret, -1, PSC_CURRENT_IN);
-		else
-			ret = ir35221_scale_result(ret, -2, PSC_CURRENT_IN);
 		break;
 	case PMBUS_VIRT_READ_TEMP_MIN:
 		ret = pmbus_read_word_data(client, page,
@@ -224,36 +66,6 @@ static int ir35221_read_word_data(struct i2c_client *client, int page, int reg)
 	return ret;
 }
 
-static int ir35221_write_word_data(struct i2c_client *client, int page, int reg,
-				   u16 word)
-{
-	int ret;
-	u16 val;
-
-	switch (reg) {
-	case PMBUS_IOUT_OC_FAULT_LIMIT:
-	case PMBUS_IOUT_OC_WARN_LIMIT:
-		val = ir35221_scale_result(word, -1, PSC_CURRENT_OUT);
-		ret = pmbus_write_word_data(client, page, reg, val);
-		break;
-	case PMBUS_VIN_OV_FAULT_LIMIT:
-	case PMBUS_VIN_OV_WARN_LIMIT:
-	case PMBUS_VIN_UV_WARN_LIMIT:
-		val = ir35221_scale_result(word, 4, PSC_VOLTAGE_IN);
-		ret = pmbus_write_word_data(client, page, reg, val);
-		break;
-	case PMBUS_IIN_OC_WARN_LIMIT:
-		val = ir35221_scale_result(word, 1, PSC_CURRENT_IN);
-		ret = pmbus_write_word_data(client, page, reg, val);
-		break;
-	default:
-		ret = -ENODATA;
-		break;
-	}
-
-	return ret;
-}
-
 static int ir35221_probe(struct i2c_client *client,
 			 const struct i2c_device_id *id)
 {
@@ -292,7 +104,6 @@ static int ir35221_probe(struct i2c_client *client,
 	if (!info)
 		return -ENOMEM;
 
-	info->write_word_data = ir35221_write_word_data;
 	info->read_word_data = ir35221_read_word_data;
 
 	info->pages = 2;
-- 
2.15.1
