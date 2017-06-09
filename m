Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wkTVm5xSCzDqLX
 for <openbmc@lists.ozlabs.org>; Fri,  9 Jun 2017 14:16:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Zb6IV3Vl"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="D8FxRrcr"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 21FF320AE2;
 Fri,  9 Jun 2017 00:15:58 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Fri, 09 Jun 2017 00:15:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=qTyRGW
 j195vSd7CqwGvi6ValCow0ozbwG2oRRtcdv6c=; b=Zb6IV3VlW8AQEr7Y747PEA
 5JoffnRAqcIeuGnmVfekoHNDAcPLDRsgV/2qyxXBlXdulLjETtBUfdiH8DXMXCci
 24VrhOfLMVfhAiz1G+ku3k+EkPQf/u6rX1eMAhGe3roglbD5/bxcy4IommypgLho
 38oW7PwBg2l12/j3wejJjqRJGZreXkEKB+2Pm+Xkv17wmMMubBaG0I6OVbgKOOud
 2wLGsOiWkD9SQmxGTImEZeDA2gCe3p2ssgr8V1ZixhscPXh82H72nfKOvR+wLTCg
 EhDmWt/Tbr5IBqf5Ejiqs7nbp7KK8xddqWEX1KcBirNCTCY3wnIJh4MrsPiHRyJg
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=qTyRGWj195vSd7CqwGvi6ValCow0ozbwG2oRRtcdv
 6c=; b=D8FxRrcrQzp9qmcFrvTy67ir+KCspYYr8CBGwLMBYh6H5m0t9rtcj1Vl+
 Pu6OIeKMUr3uxMDLbxCndULt4JEdWK23bJkYxdqvBhF+36R4fKECZc0eFJHidBLK
 b5mb4cJfKwX56HbCGefxS4x2j/5j/e0ipww0fWYkmWgZ2h1RpfJk8NvV+4x6Nc/e
 yJbuvb6mTm6VYXTTUvWX6TyKtu/mPNHZECrEsZMGijTcgzaj2FaDxb8/Ycr8fc6E
 6k0n+xiJP0pPkVI+84HIzSYSDVZfpSkwuVaqfNbFMO/usF9GUcJKFNjhxQfvQNsD
 i6chfwY0Gb3K5dms06WstiuyyE+Vg==
X-ME-Sender: <xms:_iA6WX3OAjIxDrPpvWrewKv-rWOcWukLunpzmLVkkoLcyTxkWellEQ>
X-Sasl-enc: 145qZe1Rw4jAxWo3qOjELL2levSDZgA0yNIqgh6US4Pl 1496981757
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 16D4F2479C;
 Fri,  9 Jun 2017 00:15:55 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 msbarth@linux.vnet.ibm.com, openbmc@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v2 3/3] hwmon: max31785: Provide config of fault pin behavior
Date: Fri,  9 Jun 2017 13:44:57 +0930
Message-Id: <20170609041457.31708-4-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 09 Jun 2017 04:16:01 -0000

From: Christopher Bostic <cbostic@linux.vnet.ibm.com>

Provide interface to set behavior when FAULT pin is asserted.
When enabled force fan to 100% PWM duty cycle.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
[Andrew Jeffery: Make it apply to reworked driver]
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/hwmon/max31785.c | 84 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/drivers/hwmon/max31785.c b/drivers/hwmon/max31785.c
index ecece346be28..b4a350477ee5 100644
--- a/drivers/hwmon/max31785.c
+++ b/drivers/hwmon/max31785.c
@@ -38,6 +38,7 @@
 #define MAX31785_REG_MFR_ID			0x99
 #define MAX31785_REG_MFR_MODEL			0x9a
 #define MAX31785_REG_MFR_REVISION		0x9b
+#define MAX31785_REG_MFR_FAULT_RESP		0xd9
 #define MAX31785_REG_MFR_FAN_CONFIG		0xf1
 #define MAX31785_REG_READ_FAN_PWM		0xf3
 
@@ -51,6 +52,9 @@
 /* Fan Status register bits */
 #define MAX31785_FAN_STATUS_FAULT_MASK		0x80
 
+/* Fault response register bits */
+#define MAX31785_FAULT_RESP_PIN_MONITOR		0x01
+
 /* Fan Command constants */
 #define MAX31785_FAN_COMMAND_PWM_RATIO		40
 
@@ -755,6 +759,82 @@ static const struct hwmon_chip_info max31785_chip_info_0x3040 = {
 	.info = max31785_info_0x3040,
 };
 
+static ssize_t max31785_fault_resp_store(struct device *dev,
+				struct device_attribute *attr, const char *buf,
+				size_t count)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct max31785 *data = dev_get_drvdata(dev);
+	int rv;
+
+	mutex_lock(&data->lock);
+
+	rv = max31785_set_page(client, 0);
+	if (rv < 0)
+		goto done;
+
+	rv = i2c_smbus_read_byte_data(client, MAX31785_REG_MFR_FAULT_RESP);
+	if (rv < 0)
+		goto done;
+
+	if (!strncmp(buf, "on", strlen("on"))) {
+		if (!(rv & MAX31785_FAULT_RESP_PIN_MONITOR)) {
+			rv |= MAX31785_FAULT_RESP_PIN_MONITOR;
+			rv = i2c_smbus_write_byte_data(client,
+					MAX31785_REG_MFR_FAULT_RESP, rv);
+			if (rv < 0)
+				goto done;
+		}
+	} else if (!strncmp(buf, "off", strlen("off"))) {
+		if (rv & MAX31785_FAULT_RESP_PIN_MONITOR) {
+			rv &= ~MAX31785_FAULT_RESP_PIN_MONITOR;
+			rv = i2c_smbus_write_byte_data(client,
+					MAX31785_REG_MFR_FAULT_RESP, rv);
+			if (rv < 0)
+				goto done;
+		}
+	} else {
+		dev_warn(dev, "Unknown fault response type: [%s]\n", buf);
+		rv = -EINVAL;
+	}
+
+done:
+	mutex_unlock(&data->lock);
+
+	return rv;
+}
+
+static ssize_t max31785_fault_resp_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	struct max31785 *data = max31785_update_device(dev);
+	struct i2c_client *client = to_i2c_client(dev);
+	int rv;
+
+	mutex_lock(&data->lock);
+
+	rv = max31785_set_page(client, 0);
+	if (rv < 0)
+		goto done;
+
+	rv = i2c_smbus_read_byte_data(client, MAX31785_REG_MFR_FAULT_RESP);
+	if (rv < 0)
+		goto done;
+
+	if (rv & MAX31785_FAULT_RESP_PIN_MONITOR)
+		rv = sprintf(buf, "on\n");
+	else
+		rv = sprintf(buf, "off\n");
+
+done:
+	mutex_unlock(&data->lock);
+
+	return rv;
+}
+
+static DEVICE_ATTR(fault_resp, 0644, max31785_fault_resp_show,
+		max31785_fault_resp_store);
+
 
 static int max31785_get_capabilities(struct max31785 *data)
 {
@@ -804,6 +884,10 @@ static int max31785_probe(struct i2c_client *client,
 	else
 		chip = &max31785_chip_info_0x3030;
 
+	rc = device_create_file(dev, &dev_attr_fault_resp);
+	if (rc)
+		return rc;
+
 	hwmon_dev = devm_hwmon_device_register_with_info(dev,
 			client->name, data, chip, NULL);
 
-- 
2.11.0
