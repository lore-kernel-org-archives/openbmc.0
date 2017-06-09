Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wkTVh1rqHzDq5b
 for <openbmc@lists.ozlabs.org>; Fri,  9 Jun 2017 14:15:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="KZZxJdLu"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="gWrETpym"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 98FE020AE9;
 Fri,  9 Jun 2017 00:15:53 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Fri, 09 Jun 2017 00:15:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=rPK6Gg
 l2L+LNjKBV3oerAOZETc39TuXvhtnB03SYDYA=; b=KZZxJdLuzKM2KCnYz406r4
 vNHUK49MNgNvfZlHhN7Q4yy3FbzYkI0gBoHg2eRv83Wou6ESt8jomW+WAst11yT5
 0/sgmDUnwCTkwjwo4vwmXmqI+H+jJgSppe9HLjdidf69kwts8vFfpGwoqekFMpnV
 4H1elZgd8mQyMDoZvIOlRWngsFrC/Gd2yRhC8fzgLMifvYNYhaEmWiLRWcaxsBHQ
 pyBz/3vbhUtIye7kkmM+IkLaLTkD5M6O/H6ZW5fMVJ5BLUzbaQlaji0YY69KTbCX
 7me7f5HIUT6JzX7VwfFP676RxsyoJyrXwfKjzficLCfNbtn1Xq4kMy8rHtDc9IAQ
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=rPK6Ggl2L+LNjKBV3oerAOZETc39TuXvhtnB03SYD
 YA=; b=gWrETpymI8KlqOsk3jUSYh00NGeWUdrVEMhGNcKFKOVz50b10RplGL6bP
 T5WN26SM2/ROHyicdwEkd4JoRy4tQBe0hy7LbBa25thQAS4F1BB3hqfj/U+KR5GA
 +Wj1OMP4IdLBVSQgEgUIkW+C+UYSfiRbKnbHYaPqRkJMEdG9kNtvS98Ll/mbfauW
 BZYEX6DvoBgK7F/3Q4NPFIx3zqAupkf6/ioEguz2GxGwzYWL7YHgJ2Sa77y3n+yK
 e9/KlNiO2WKSsX61x6piTWSeci6YtbN87QVzO5YQtIb9hvma2VyFJts2on4M0kFz
 +ZlVo3E2EbcYcsm8Goch/Jd4UDveg==
X-ME-Sender: <xms:-SA6WatbYUxlDG7AXffCX2vxFPpbhBqZCPvOc_UOuAkfvMa2EITR3Q>
X-Sasl-enc: WHfqp/eFVwBszxACPuIE792QDPdDroviPfw4N4SWN9Ah 1496981752
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id AD6A92479C;
 Fri,  9 Jun 2017 00:15:51 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>, msbarth@linux.vnet.ibm.com,
 openbmc@lists.ozlabs.org
Subject: [PATCH v2 1/3] hwmon: max31785: Clean up uninitialised values
Date: Fri,  9 Jun 2017 13:44:55 +0930
Message-Id: <20170609041457.31708-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170609041457.31708-1-andrew@aj.id.au>
References: <20170609041457.31708-1-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 09 Jun 2017 04:15:57 -0000

I observed an issue during subsequent testing where `cat(1)` on the pwm
attributes would occasionally return with an error:

         root@witherspoon:/sys/bus/i2c/drivers/max31785/3-0052/hwmon/hwmon1# cat pwm1
         cat: read error: Operation not supported
         root@witherspoon:/sys/bus/i2c/drivers/max31785/3-0052/hwmon/hwmon1# cat pwm1_enable
         cat: read error: Operation not supported

Given the attributes are present, this operation should indeed be
supported. Initialise the pwm return variables and audit the rest of
the implementation for similar issues.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/hwmon/max31785.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/hwmon/max31785.c b/drivers/hwmon/max31785.c
index fc03b7c8e723..ffa2f6c948d5 100644
--- a/drivers/hwmon/max31785.c
+++ b/drivers/hwmon/max31785.c
@@ -238,8 +238,7 @@ static struct max31785 *max31785_update_device(struct device *dev)
 		if (rv < 0)
 			goto abort;
 
-		if ((data->fan_config[i]
-					& MAX31785_FAN_CFG_CONTROL_MODE_RPM)
+		if ((data->fan_config[i] & MAX31785_FAN_CFG_CONTROL_MODE_RPM)
 				|| is_automatic_control_mode(data, i)) {
 			rv = max31785_read_fan_word(client, i,
 					MAX31785_REG_READ_FAN_PWM);
@@ -572,7 +571,7 @@ static int max31785_read_pwm(struct max31785 *data, u32 attr, int channel,
 {
 	bool is_auto;
 	bool is_rpm;
-	int rc;
+	int rc = 0;
 
 	mutex_lock(&data->lock);
 
@@ -618,7 +617,7 @@ static int max31785_read(struct device *dev, enum hwmon_sensor_types type,
 		u32 attr, int channel, long *val)
 {
 	struct max31785 *data;
-	int rc;
+	int rc = -EOPNOTSUPP;
 
 	data = max31785_update_device(dev);
 
@@ -631,7 +630,7 @@ static int max31785_read(struct device *dev, enum hwmon_sensor_types type,
 	case hwmon_pwm:
 		return max31785_read_pwm(data, attr, channel, val);
 	default:
-		rc = -EOPNOTSUPP;
+		break;
 	}
 
 	return rc;
@@ -640,7 +639,7 @@ static int max31785_read(struct device *dev, enum hwmon_sensor_types type,
 static int max31785_write_fan(struct max31785 *data, u32 attr, int channel,
 		long val)
 {
-	int rc;
+	int rc = -EOPNOTSUPP;
 
 	switch (attr) {
 		break;
@@ -649,7 +648,7 @@ static int max31785_write_fan(struct max31785 *data, u32 attr, int channel,
 	case hwmon_fan_target:
 		return max31785_fan_set_target(data, channel, val);
 	default:
-		rc = -EOPNOTSUPP;
+		break;
 	};
 
 	return rc;
@@ -658,7 +657,7 @@ static int max31785_write_fan(struct max31785 *data, u32 attr, int channel,
 static int max31785_write_pwm(struct max31785 *data, u32 attr, int channel,
 		long val)
 {
-	int rc;
+	int rc = -EOPNOTSUPP;
 
 	switch (attr) {
 	case hwmon_pwm_enable:
@@ -666,7 +665,7 @@ static int max31785_write_pwm(struct max31785 *data, u32 attr, int channel,
 	case hwmon_pwm_input:
 		return max31785_pwm_set(data, channel, val);
 	default:
-		rc = -EOPNOTSUPP;
+		break;
 	};
 
 	return rc;
@@ -676,7 +675,7 @@ static int max31785_write(struct device *dev, enum hwmon_sensor_types type,
 		u32 attr, int channel, long val)
 {
 	struct max31785 *data;
-	int rc;
+	int rc = -EOPNOTSUPP;
 
 	data = dev_get_drvdata(dev);
 
@@ -686,7 +685,7 @@ static int max31785_write(struct device *dev, enum hwmon_sensor_types type,
 	case hwmon_pwm:
 		return max31785_write_pwm(data, attr, channel, val);
 	default:
-		rc = -EOPNOTSUPP;
+		break;
 	}
 
 	return rc;
@@ -705,12 +704,17 @@ static umode_t max31785_is_visible(const void *_data,
 		case hwmon_fan_pulses:
 		case hwmon_fan_target:
 			return 0644;
+		default:
+			break;
 		};
+		break;
 	case hwmon_pwm:
 		return 0644;
 	default:
-		return 0;
+		break;
 	};
+
+	return 0;
 }
 
 static const struct hwmon_ops max31785_hwmon_ops = {
-- 
2.11.0
