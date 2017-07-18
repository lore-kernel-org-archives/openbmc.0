Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xBQp64B1ZzDrFC
 for <openbmc@lists.ozlabs.org>; Tue, 18 Jul 2017 13:37:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="mhR8lH9/"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="fbyAU6nC"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 7936120A39;
 Mon, 17 Jul 2017 23:37:16 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 17 Jul 2017 23:37:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=NoixzF
 53FncwIe8ZeBtiuINoPGGM6N7xrlYxQA1CRnU=; b=mhR8lH9/T+CdGx2wUrqDkW
 LaalZ143ENFtePv8KE11SztAP2Q+aUIIrEdOBnE0A7bZByZYULziTbAdEpCYav3x
 IIxQx4hmELFl5GT2JrzR1fNMUr/OZVKPFWH42/NF9d3G5+GKLHVVKCR+ZbmBsYM/
 6bF3Gt5XP/sj46NqioYwFAoFtrLzpjxlh4j3eZwFF/C2XcHQfnsZAwTpb4x/xO/8
 a36CA/nBDaj/fn1iDMR7XYMVoSud8v8vpTZ5aTFPBjtuLr58J15z0+TEj9d4FC7t
 r8raPJEltx8N5iw1E7scAkxt3iHwH2yydRiDw948OB8HOwldONye9k5s0Agldo3Q
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=NoixzF53FncwIe8ZeBtiuINoPGGM6N7xrlYxQA1CR
 nU=; b=fbyAU6nCtjmraKMVeNSbQm2wrrimaTIRKXp+0eFu3TCBVVthkxjhUwFvk
 zCBU880uW3/sKFPPHrlJ0b6ddrgZhanDRermXbj8ZBmLKmxwPvHJv1HAKm2/x9iv
 FImyHRy+p45XrW0u5dLUt4Uj+JK+Xa1ch/ZqjCTh0ONj3MoFd4W/mTx8ryA1Bm6S
 yydECq/2UxDJZzmbuUvefaVFU6M07Okl1iMpufyq3SAVESKo2rxJyhWy1JY7HolK
 KR8FtauzVbyf7StWRnEvRrOrkOJiLCe/aeXWc0Y8ehHUDgPOCql8UxMDCnkxl/Cz
 Ek8DHNkwYFKBJlMlDmuV7X7Zwg1aA==
X-ME-Sender: <xms:bIJtWUabOBdobiMmgOrnemqRmvMJYeFWe3Xke3jTgkj5pvEfT6P9KQ>
X-Sasl-enc: xRKKvMW2Gu9gxHPoGECaiciJSe+c2zn+V1pVweF1vJ9W 1500349035
Received: from keelia.base64.com.au (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8C36D7E65E;
 Mon, 17 Jul 2017 23:37:12 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, jdelvare@suse.com,
 linux-kernel@vger.kernel.org, joel@jms.id.au, openbmc@lists.ozlabs.org,
 msbarth@linux.vnet.ibm.com, mspinler@linux.vnet.ibm.com
Subject: [RFC PATCH v2 2/3] pmbus: Add and expose pmbus_get_info()
Date: Tue, 18 Jul 2017 13:06:52 +0930
Message-Id: <20170718033653.10298-3-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170718033653.10298-1-andrew@aj.id.au>
References: <20170718033653.10298-1-andrew@aj.id.au>
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
X-List-Received-Date: Tue, 18 Jul 2017 03:37:18 -0000

This allows the caller to hoist themselves out to a containing
structure in e.g. the read/write callbacks without exposing struct
pmbus_data.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
New since v1.

 drivers/hwmon/pmbus/pmbus.h      | 1 +
 drivers/hwmon/pmbus/pmbus_core.c | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index 226a37bd525f..8b3a0d43d94d 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -420,6 +420,7 @@ extern const struct regulator_ops pmbus_regulator_ops;
 
 /* Function declarations */
 
+const struct pmbus_driver_info *pmbus_get_info(struct i2c_client *client);
 void pmbus_clear_cache(struct i2c_client *client);
 int pmbus_set_page(struct i2c_client *client, u8 page);
 int pmbus_read_word_data(struct i2c_client *client, u8 page, u8 reg);
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 712a8b6c4bd6..87ad612e4924 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -140,6 +140,12 @@ static const int pmbus_fan_command_registers[] = {
 	PMBUS_FAN_COMMAND_4,
 };
 
+const struct pmbus_driver_info *pmbus_get_info(struct i2c_client *client)
+{
+	return ((struct pmbus_data *)i2c_get_clientdata(client))->info;
+}
+EXPORT_SYMBOL_GPL(pmbus_get_info);
+
 void pmbus_clear_cache(struct i2c_client *client)
 {
 	struct pmbus_data *data = i2c_get_clientdata(client);
-- 
2.11.0
