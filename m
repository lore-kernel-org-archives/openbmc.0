Return-Path: <andrew@aj.id.au>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wsBsN5pQWzDq5W
 for <openbmc@lists.ozlabs.org>; Tue, 20 Jun 2017 12:40:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="TzauKrIP"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="RvxQYGU5"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9F1D620B25;
 Mon, 19 Jun 2017 22:40:21 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 19 Jun 2017 22:40:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc:x-sasl-enc; s=fm1; bh=veDGA0/XMSwD9ja5qjZ0lfAQjSMGP2
 VlFw4fUR4pPKU=; b=TzauKrIP39W54jQkypsfRxPjRGoD3ypWyL0brTrvOrjCVj
 EKVqIqsgDb0ZdpDH87c7e64BTQAi3ZppDU1AcsdExnJulh0pSEwx4ZCAyx6jESCs
 tXB56IuGVfxd5qHWTyUlWoFVt/rDn+00G7hdMI/tsbt1jwnIJFPo0gii1fla7hEQ
 Q7putwU4KBlfIY8Cb/L44V7yhWm9yq+DwFFVIteCKoHn/h7ua9kD1eCco9iY8fEV
 4Lkls7N0cCg4Xp37UAdS6uWJwrZv4yitVRVDX5HtiMuz6V0tCkwUF5kxnmCMJDBd
 gQXlyeut3u3t4Y6AttNSeZFWqFLfbSNnN0kU/CjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=veDGA0
 /XMSwD9ja5qjZ0lfAQjSMGP2VlFw4fUR4pPKU=; b=RvxQYGU5PAHtsoAVH3O1E2
 tWFfGrVPxUEqe0P9A9T3/Zi8JBYXuL8/pTlmq+/65LeXFFfrEwj2C5zoWUFhPRoW
 5nhaiZcVIrn8K0ol0aZCW+jollENtCK5AUTCl08nlcw36pJtstYbxUUqB5A8339W
 9e7xQnl7kVwgBuynFNDqmP5NzBavFFTQrl8gqD2U5aI1LBnWmIXLm0fIMeTqIh3T
 HS4Tl4bsX5LGKnacL6bkwKlMuy6COYngqDXatmo2Cpymaq/fGMGbnbtUlKJs4T5Q
 Vo0A1Eu7w4bSnMKCDEWCQzMxzxuFmqgNGlX0XzVQgvlcl8EJ6qxqPpM66dxcyLkw
 ==
X-ME-Sender: <xms:FYtIWYoAKMavGo2seSwpvuq5-Pd6d3Ix15BWzXsJ0Gb0-qj67q21Xw>
X-Sasl-enc: FEedt3lRmgD77pXfKf1NGFyHbj/N7lNZ1bwC8xmZgrPl 1497926420
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id A66477E545;
 Mon, 19 Jun 2017 22:40:18 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 msbarth@linux.vnet.ibm.com, cbostic@linux.vnet.ibm.com, spinler@us.ibm.com
Subject: [PATCH linux dev-4.10] hwmon: max31785: Enable dual rotor if
 functionality is detected
Date: Tue, 20 Jun 2017 12:09:41 +0930
Message-Id: <20170620023941.21081-1-andrew@aj.id.au>
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
X-List-Received-Date: Tue, 20 Jun 2017 02:40:26 -0000

The MFR_FAN_CONFIG command contains a bit (12) to enable or disable the
second rotor measurement. Ensure we set it if we detect the 0x3040
MFR_REVISION_ID.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/hwmon/max31785.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/max31785.c b/drivers/hwmon/max31785.c
index ecece346be28..73680954f664 100644
--- a/drivers/hwmon/max31785.c
+++ b/drivers/hwmon/max31785.c
@@ -39,6 +39,7 @@
 #define MAX31785_REG_MFR_MODEL			0x9a
 #define MAX31785_REG_MFR_REVISION		0x9b
 #define MAX31785_REG_MFR_FAN_CONFIG		0xf1
+#define	 MAX31785_REG_MFR_FAN_CONFIG_DUAL_TACH	BIT(12)
 #define MAX31785_REG_READ_FAN_PWM		0xf3
 
 /* Fan Config register bits */
@@ -81,13 +82,13 @@ struct max31785 {
 	/* Registers */
 	u8	fan_config[NR_CHANNEL];
 	u16	fan_command[NR_CHANNEL];
-	u8	mfr_fan_config[NR_CHANNEL];
+	u16	mfr_fan_config[NR_CHANNEL];
 	u8	fault_status[NR_CHANNEL];
 	u16	pwm[NR_CHANNEL];
 	u16	tach_rpm[NR_CHANNEL * 2];
 };
 
-static inline bool max31785_has_fast_rotor(struct max31785 *data)
+static inline bool max31785_has_dual_rotor(struct max31785 *data)
 {
 	return !!(data->capabilities & MAX31785_CAP_FAST_ROTOR);
 }
@@ -188,7 +189,7 @@ static int max31785_update_fan_speed(struct max31785 *data, u8 fan)
 	if (rc)
 		return rc;
 
-	if (max31785_has_fast_rotor(data)) {
+	if (max31785_has_dual_rotor(data)) {
 		rc = max31785_smbus_read_long_data(data->client,
 				MAX31785_REG_FAN_SPEED_1);
 		if (rc < 0)
@@ -429,12 +430,23 @@ static int max31785_init_fans(struct max31785 *data)
 			return rv;
 		data->fan_command[i] = rv;
 
-		rv = max31785_read_fan_byte(client, i,
+		rv = max31785_read_fan_word(client, i,
 				MAX31785_REG_MFR_FAN_CONFIG);
 		if (rv < 0)
 			return rv;
 		data->mfr_fan_config[i] = rv;
 
+		if (max31785_has_dual_rotor(data)) {
+			rv |= MAX31785_REG_MFR_FAN_CONFIG_DUAL_TACH;
+			data->mfr_fan_config[i] = rv;
+
+			rv = max31785_write_fan_word(client, i,
+					MAX31785_REG_MFR_FAN_CONFIG,
+					data->mfr_fan_config[i]);
+			if (rv < 0)
+				return rv;
+		}
+
 		if (!((data->fan_config[i]
 			& MAX31785_FAN_CFG_CONTROL_MODE_RPM)
 			|| is_automatic_control_mode(data, i))) {
@@ -799,7 +811,7 @@ static int max31785_probe(struct i2c_client *client,
 	if (rc < 0)
 		return rc;
 
-	if (max31785_has_fast_rotor(data))
+	if (max31785_has_dual_rotor(data))
 		chip = &max31785_chip_info_0x3040;
 	else
 		chip = &max31785_chip_info_0x3030;
-- 
2.11.0
