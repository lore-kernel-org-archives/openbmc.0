Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wfDfw0zYmzDqLj
 for <openbmc@lists.ozlabs.org>; Fri,  2 Jun 2017 16:23:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="q/M8ypXN"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="mDxusCBe"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 692AA20861;
 Fri,  2 Jun 2017 02:23:17 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Fri, 02 Jun 2017 02:23:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=L31WVa
 PztfTv2UP1XrNhtO1qZtt8S4FHD29Px7uJJgo=; b=q/M8ypXNbl4hIgLn6flTiK
 je1gkNQ6g/8qfyBPByhg72T9Lm0GhyPF3xGQvE6Oy0xrGEeFiKtxVn2C8bq9m7hy
 +3oJBemMJRsaUDdY5Oky+I/9vRSXJeikhjdOYXEbUf17bAMfWaWY8M1jUiYLPWd4
 GIQme/7GHwli4qr6cqZrt0DUTyZ1Pdft9hrusYar0V9qzl1VhSOcjeNXRnTSBPt9
 Zw95rrdFFXiwYXwiWByhUErx88YEq23usPKc6RtGwtypNc02sY65BKycL+gJGveB
 xQcs1zLABXJZSv6ZbM9u6WWes8gbJlCCY1rdjY8kUZWTa71CZVmWqj7A6SOi3jgA
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=L31WVaPztfTv2UP1XrNhtO1qZtt8S4FHD29Px7uJJ
 go=; b=mDxusCBeRh9m7Hp/Ox06ZbypWteklIFzyophYs7IuIRtRBe05SRk02EqG
 Ox72/GMzgCWQremwZgT6p/pFwY8KWvb9Q6RNDW/IDwdSD/u5Ym0uFZetT1e3w62M
 1UMELqY1nPpgMyk1Bz+0o1ndWfLfGRHuHNbwzE6V1b8cMTM5D27stjYyzMJamu04
 vH2qan+maIZrIlu3w76rfRF71Bebe1zn7dHTIIEnp1AEBYrt6ZBLGBezpzoTsqtd
 iGPvgOf/Zw/Cx5a8XuxM7qZ9dSc6h3BXETsptC8kuFy4tPS5xnmoaem9aptODJWC
 Ern7HUugCEO/uphIb7D6folpNwV/g==
X-ME-Sender: <xms:VQQxWeu6I69-6uDpIf-lWswuXx5q9HE-d3WwA3yifvQHGdI9kOv3_g>
X-Sasl-enc: sTa3c6aq/GXhyQmbDbHWyb4CeAva6vlWR0v63Z7AD/S2 1496384596
Received: from keelia.base64.com.au (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id B1579240F6;
 Fri,  2 Jun 2017 02:23:14 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: tpearson@raptorengineering.com,
 Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org,
 msbarth@linux.vnet.ibm.com, Andrew Jeffery <andrew@aj.id.au>
Subject: [RFC PATCH linux dev-4.10 7/7] hwmon: max31785: Provide config of
 fault pin behavior
Date: Fri,  2 Jun 2017 15:52:07 +0930
Message-Id: <20170602062208.15999-8-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170602062208.15999-1-andrew@aj.id.au>
References: <20170602062208.15999-1-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 02 Jun 2017 06:23:20 -0000

From: Christopher Bostic <cbostic@linux.vnet.ibm.com>

Provide interface to set behavior when FAULT pin is asserted.
When enabled force fan to 100% PWM duty cycle.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
[Andrew Jeffery: Make it apply to reworked driver]
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/hwmon/max31785.c | 71 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/drivers/hwmon/max31785.c b/drivers/hwmon/max31785.c
index fb971277165c..06e1708608d7 100644
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
 
@@ -678,6 +682,69 @@ static const struct hwmon_chip_info max31785_chip_info = {
 	.info = max31785_info,
 };
 
+static ssize_t max31785_fault_resp_store(struct device *dev,
+				struct device_attribute *attr, const char *buf,
+				size_t count)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	int rv;
+
+	rv = max31785_set_page(client, 0);
+	if (rv < 0)
+		return rv;
+
+	rv = i2c_smbus_read_byte_data(client, MAX31785_REG_MFR_FAULT_RESP);
+	if (rv < 0)
+		return rv;
+
+	if (!strncmp(buf, "on", strlen("on"))) {
+		if (!(rv & MAX31785_FAULT_RESP_PIN_MONITOR)) {
+			rv |= MAX31785_FAULT_RESP_PIN_MONITOR;
+			rv = i2c_smbus_write_byte_data(client,
+					MAX31785_REG_MFR_FAULT_RESP, rv);
+			if (rv < 0)
+				return rv;
+		}
+	} else if (!strncmp(buf, "off", strlen("off"))) {
+		if (rv & MAX31785_FAULT_RESP_PIN_MONITOR) {
+			rv &= ~MAX31785_FAULT_RESP_PIN_MONITOR;
+			rv = i2c_smbus_write_byte_data(client,
+					MAX31785_REG_MFR_FAULT_RESP, rv);
+			if (rv < 0)
+				return rv;
+		}
+	} else {
+		dev_warn(dev, "Unknown fault response type: [%s]\n", buf);
+		return -EINVAL;
+	}
+	return count;
+}
+
+static ssize_t max31785_fault_resp_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	int rv;
+
+	rv = max31785_set_page(client, 0);
+	if (rv < 0)
+		return rv;
+
+	rv = i2c_smbus_read_byte_data(client, MAX31785_REG_MFR_FAULT_RESP);
+	if (rv < 0)
+		return rv;
+
+	if (rv & MAX31785_FAULT_RESP_PIN_MONITOR)
+		rv = sprintf(buf, "on\n");
+	else
+		rv = sprintf(buf, "off\n");
+
+	return rv;
+}
+
+static DEVICE_ATTR(fault_resp, 0644, max31785_fault_resp_show,
+		max31785_fault_resp_store);
+
 static SENSOR_DEVICE_ATTR(fan1_input_fast, 0444, max31785_fan_get_fast,
 		NULL, 0);
 static SENSOR_DEVICE_ATTR(fan2_input_fast, 0444, max31785_fan_get_fast,
@@ -751,6 +818,10 @@ static int max31785_probe(struct i2c_client *client,
 	if (data->capabilities & MAX31785_CAP_FAST_ROTOR)
 		extra_groups = max31785_groups;
 
+	rc = device_create_file(dev, &dev_attr_fault_resp);
+	if (rc)
+		return rc;
+
 	hwmon_dev = devm_hwmon_device_register_with_info(dev,
 			client->name, data, &max31785_chip_info, extra_groups);
 
-- 
2.11.0
