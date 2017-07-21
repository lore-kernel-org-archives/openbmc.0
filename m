Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xDHBP5TwpzDqs2
 for <openbmc@lists.ozlabs.org>; Fri, 21 Jul 2017 14:01:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="AtoOXwZT"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="e32T6jCx"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 16114209CC;
 Fri, 21 Jul 2017 00:01:13 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Fri, 21 Jul 2017 00:01:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc:x-sasl-enc; s=fm1; bh=3Wwah4FeQvdAKHpwg8s4/3bm6ud6Ap
 Xu6dFRcsOdjVQ=; b=AtoOXwZTPPA6ppTBNpot+P28w8cdjiLkoAPqKrXR81rCQS
 uWS3SONzAb+syFefEe+6J9+if6CQg/lq6m7r2xQi7djTRlzdvSqa1gyVxQEbR5IB
 mAPaOBfZWIMANi8pDybxeToTRUtG1WHmQU3kFxgWykNcmNzRNo5xehNpYSpCOyBs
 LOmHtFparS2XExPnMKYpZGVOnFs3D9mTEUrTpqwDaevMP4WKRUi2FTR9smTv2rZ7
 /OezHJ8JrqLRwUBnQeZ2y2Q6CbYFRv5OIvvfL1VSVJFuwsNObyXxh+TiKDl0SsJ2
 UQONIO4uaE17hoIbaFVqqQveZIbqwDUmJlsNCZQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=3Wwah4
 FeQvdAKHpwg8s4/3bm6ud6ApXu6dFRcsOdjVQ=; b=e32T6jCxCm/WNUOlU5M1Vs
 mWnRE4wiZI3vWttuEkiMu2hXbraKQYroOGYIyeutyd8pflwMDmgRKy1KH27WNRpK
 SyaB2mLfOEcwsjOpNBumSVPqOld7BndBQcJ5pgcUgZvGhuHZ5f8wj+yOgX9Oz6UC
 APTaIRCvNbpAgzI55nKPG2v7JTlZnQZ8co0L5o1Ieeqt7jKG8KWPKlSQk7vThkoz
 ozkTLFMlW2BwERiUfjN+3MFEUz8RUmcW+jYCjZDWVR6qzO3EQcnk+9RGsn3LJ9fY
 odS+q80oGwLzjsMY/aZzp8Ef3mtm/VqdoQvM4Dcr+jdwjHPlFqKau7DZKA9MO+ZQ
 ==
X-ME-Sender: <xms:iXxxWVpLijF80Sj1eaQ10mFM30zaneXqGU6gMSXMxoA7kfBC8Q1vLA>
X-Sasl-enc: K2Nwwaq3JedNoUHYHufamO+4xriFLdgU2zj6hoGoEUdt 1500609672
Received: from keelia.aj.id.au (ppp118-210-176-216.bras2.adl6.internode.on.net
 [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id AE8A47E43A;
 Fri, 21 Jul 2017 00:01:10 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>, bradleyb@fuzziesquirrel.com,
 openbmc@lists.ozlabs.org
Subject: [PATCH] max31785: Fix fan configuration at probe and runtime
Date: Fri, 21 Jul 2017 13:30:31 +0930
Message-Id: <20170721040031.8390-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
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
X-List-Received-Date: Fri, 21 Jul 2017 04:01:19 -0000

Several issues regarding configuration were present:

1. Failure to probe if MFR_FAN_CONFIG was non-zero
2. Failure to configure DUAL_TACH mode in MFR_FAN_CONFIG
3. Failure to configure RPM or PWM mode on attribute writes

Combined these prevented fanX_input attributes reporting expected
values for the second rotors.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/hwmon/max31785.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/max31785.c b/drivers/hwmon/max31785.c
index 4c858c5234c6..011354df587d 100644
--- a/drivers/hwmon/max31785.c
+++ b/drivers/hwmon/max31785.c
@@ -297,6 +297,11 @@ static ssize_t max31785_fan_set_target(struct max31785 *data, int channel,
 
 	mutex_lock(&data->lock);
 
+	data->fan_config[channel] |= MAX31785_FAN_CFG_CONTROL_MODE_RPM;
+	rc = max31785_write_fan_byte(data->client, channel,
+				MAX31785_REG_FAN_CONFIG_1_2,
+				data->fan_config[channel]);
+
 	/* Write new RPM value */
 	data->fan_command[channel] = rpm;
 	rc = max31785_write_fan_word(data->client, channel,
@@ -342,6 +347,11 @@ static ssize_t max31785_pwm_set(struct max31785 *data, int channel, long pwm)
 
 	mutex_lock(&data->lock);
 
+	data->fan_config[channel] &= ~MAX31785_FAN_CFG_CONTROL_MODE_RPM;
+	rc = max31785_write_fan_byte(data->client, channel,
+				MAX31785_REG_FAN_CONFIG_1_2,
+				data->fan_config[channel]);
+
 	/* Write new PWM value */
 	data->fan_command[channel] = pwm * MAX31785_FAN_COMMAND_PWM_RATIO;
 	rc = max31785_write_fan_word(data->client, channel,
@@ -458,7 +468,7 @@ static int max31785_init_fans(struct max31785 *data)
 		}
 	}
 
-	return rv;
+	return 0;
 }
 
 /* Return 0 if detection is successful, -ENODEV otherwise */
@@ -840,14 +850,14 @@ static int max31785_probe(struct i2c_client *client,
 	if (rc)
 		return rc;
 
-	rc = max31785_init_fans(data);
-	if (rc)
-		return rc;
-
 	rc = max31785_get_capabilities(data);
 	if (rc < 0)
 		return rc;
 
+	rc = max31785_init_fans(data);
+	if (rc)
+		return rc;
+
 	if (max31785_has_dual_rotor(data))
 		chip = &max31785_chip_info_0x3040;
 	else
-- 
2.11.0
