Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="UaLjUQG4"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="HkIg/BAx"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40Fryz0V4LzF1pj
 for <openbmc@lists.ozlabs.org>; Wed,  4 Apr 2018 00:27:38 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 7952C2104B;
 Tue,  3 Apr 2018 10:27:36 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 03 Apr 2018 10:27:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=NM6M/q+R43pvL2UJX
 7auVIc8H6Fo28j8owtMxFKOncs=; b=UaLjUQG4WAtkCAkswHYGN8g/bQmD6yqJv
 oe25Lizwr6m2iTkETSnWmU6v6YDr8GUlX+Y+0HxFKr4AlgH0DIyCur2DIPUKaE80
 xA2ePM/2PjtVb5bU4vZgEe3ddkyZ5M+trsXssWNQSDAHot8HehDMqYDhUOwv6jXh
 IBjAyvfafDL1vMg0snjlGdQnkSu7BufWRud8sr/FCYfywsVuC44LxlQ/eGZ4W57k
 8Hnts5PAQ/jK+HDTsbU/njhHRzMxY4wAXI3+sde8sZPnAv7lYLDhaXKHIogV9eYq
 byCqyuCXG/MInwbUpY2LbjidFxuDkRLnJkvUtipfed4QlTQsTYQIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=NM6M/q+R43pvL2UJX7auVIc8H6Fo28j8owtMxFKOncs=; b=HkIg/BAx
 LuthO0Ovaee85pxrHgvqgp4P0poGVSODOxqHJPyggWQ35BC1rigoGrhtPtFSs1AD
 h2qcB5emtXtrAHsXqtw1koqzDA0/ZrGPgOFRKhCFaNW+w+YKzMe3hv4f/ZeXbfKW
 wKzI01RV5yE04q3OIOIFIBVV0HOCVIEIKjhVinfBpL8r6GL82veltH5+SGLC9fx+
 K7I/Ocqx4FONCFO4aNeZ/azGn/eQh3vPN/umQDv5xIr0luHaIrHJwne/Gc3sHL/k
 8YkYDk2lA3lCkC4j59xT2/SxK23uh968AooDRfIS1sZdhzoa7vOZgj7diFUnCUFC
 MsPtVywaYQzPDg==
X-ME-Sender: <xms:WI_DWpqrVb93LSgPDisbssB_5zIH2psY1TE4PT45KyVSNKRqiSot0g>
Received: from dave.aj.id.au (202-161-9-32.dyn.iinet.net.au [202.161.9.32])
 by mail.messagingengine.com (Postfix) with ESMTPA id 458921028C;
 Tue,  3 Apr 2018 10:27:34 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13 2/5] pmbus (max31785): Add support for
 devicetree configuration
Date: Tue,  3 Apr 2018 23:56:52 +0930
Message-Id: <20180403142655.16681-3-andrew@aj.id.au>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180403142655.16681-1-andrew@aj.id.au>
References: <20180403142655.16681-1-andrew@aj.id.au>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Apr 2018 14:27:40 -0000

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/hwmon/pmbus/max31785.c | 318 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 318 insertions(+)

diff --git a/drivers/hwmon/pmbus/max31785.c b/drivers/hwmon/pmbus/max31785.c
index bffab449be39..9a7e745b6b31 100644
--- a/drivers/hwmon/pmbus/max31785.c
+++ b/drivers/hwmon/pmbus/max31785.c
@@ -16,13 +16,23 @@
 
 enum max31785_regs {
 	MFR_REVISION		= 0x9b,
+	MFR_FAULT_RESPONSE	= 0xd9,
+	MFR_TEMP_SENSOR_CONFIG	= 0xf0,
 	MFR_FAN_CONFIG		= 0xf1,
+	MFR_FAN_FAULT_LIMIT	= 0xf5,
 };
 
 #define MAX31785			0x3030
 #define MAX31785A			0x3040
 
 #define MFR_FAN_CONFIG_DUAL_TACH	BIT(12)
+#define MFR_FAN_CONFIG_TSFO		BIT(9)
+#define MFR_FAN_CONFIG_TACHO		BIT(8)
+#define MFR_FAN_CONFIG_HEALTH		BIT(4)
+#define MFR_FAN_CONFIG_ROTOR_HI_LO	BIT(3)
+#define MFR_FAN_CONFIG_ROTOR		BIT(2)
+
+#define MFR_FAULT_RESPONSE_MONITOR	BIT(0)
 
 #define MAX31785_NR_PAGES		23
 #define MAX31785_NR_FAN_PAGES		6
@@ -239,6 +249,271 @@ static int max31785_write_word_data(struct i2c_client *client, int page,
 	return -ENODATA;
 }
 
+/*
+ * Returns negative error codes if an unrecoverable problem is detected, 0 if a
+ * recoverable problem is detected, or a positive value on success.
+ */
+static int max31785_of_fan_config(struct i2c_client *client,
+				  struct pmbus_driver_info *info,
+				  struct device_node *child)
+{
+	int mfr_cfg = 0, mfr_fault_resp = 0, pb_cfg;
+	struct device *dev = &client->dev;
+	char *lock_polarity = NULL;
+	const char *sval;
+	u32 page;
+	u32 uval;
+	int ret;
+
+	if (!of_device_is_compatible(child, "pmbus-fan"))
+		return 0;
+
+	ret = of_property_read_u32(child, "reg", &page);
+	if (ret < 0) {
+		dev_err(&client->dev, "Missing valid reg property\n");
+		return ret;
+	}
+
+	if (!(info->func[page] & PMBUS_HAVE_FAN12)) {
+		dev_err(dev, "Page %d does not have fan capabilities\n", page);
+		return -ENXIO;
+	}
+
+	ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
+	if (ret < 0)
+		return ret;
+
+	pb_cfg = i2c_smbus_read_byte_data(client, PMBUS_FAN_CONFIG_12);
+	if (pb_cfg < 0)
+		return pb_cfg;
+
+	if (of_property_read_bool(child->parent, "use-stored-presence")) {
+		if (!(pb_cfg & PB_FAN_1_INSTALLED))
+			dev_info(dev, "Fan %d is configured but not installed\n",
+				 page);
+	} else {
+		pb_cfg |= PB_FAN_1_INSTALLED;
+	}
+
+	ret = of_property_read_string(child, "maxim,fan-rotor-input", &sval);
+	if (ret < 0) {
+		dev_err(dev, "Missing valid maxim,fan-rotor-input property for fan %d\n",
+				page);
+		return ret;
+	}
+
+	if (strcmp("tach", sval) && strcmp("lock", sval)) {
+		dev_err(dev, "maxim,fan-rotor-input has invalid value for fan %d: %s\n",
+				page, sval);
+		return -EINVAL;
+	} else if (!strcmp("lock", sval)) {
+		mfr_cfg |= MFR_FAN_CONFIG_ROTOR;
+
+		ret = i2c_smbus_write_word_data(client, MFR_FAN_FAULT_LIMIT, 1);
+		if (ret < 0)
+			return ret;
+
+		ret = of_property_read_string(child, "maxim,fan-lock-polarity",
+					      &sval);
+		if (ret < 0) {
+			dev_err(dev, "Missing valid maxim,fan-lock-polarity property for fan %d\n",
+					page);
+			return ret;
+		}
+
+		if (strcmp("low", sval) && strcmp("high", sval)) {
+			dev_err(dev, "maxim,fan-lock-polarity has invalid value for fan %d: %s\n",
+					page, lock_polarity);
+			return -EINVAL;
+		} else if (!strcmp("high", sval))
+			mfr_cfg |= MFR_FAN_CONFIG_ROTOR_HI_LO;
+	}
+
+	if (!of_property_read_string(child, "fan-mode", &sval)) {
+		if (!strcmp("rpm", sval))
+			pb_cfg |= PB_FAN_1_RPM;
+		else if (!strcmp("pwm", sval))
+			pb_cfg &= ~PB_FAN_1_RPM;
+		else {
+			dev_err(dev, "fan-mode has invalid value for fan %d: %s\n",
+					page, sval);
+			return -EINVAL;
+		}
+	}
+
+	ret = of_property_read_u32(child, "tach-pulses", &uval);
+	if (ret < 0) {
+		pb_cfg &= ~PB_FAN_1_PULSE_MASK;
+	} else if (uval && (uval - 1) < 4) {
+		pb_cfg = ((pb_cfg & ~PB_FAN_1_PULSE_MASK) | ((uval - 1) << 4));
+	} else {
+		dev_err(dev, "tach-pulses has invalid value for fan %d: %u\n",
+				page, uval);
+		return -EINVAL;
+	}
+
+	if (of_property_read_bool(child, "maxim,fan-health"))
+		mfr_cfg |= MFR_FAN_CONFIG_HEALTH;
+
+	if (of_property_read_bool(child, "maxim,fan-no-watchdog") ||
+		of_property_read_bool(child, "maxim,tmp-no-fault-ramp"))
+		mfr_cfg |= MFR_FAN_CONFIG_TSFO;
+
+	if (of_property_read_bool(child, "maxim,fan-dual-tach"))
+		mfr_cfg |= MFR_FAN_CONFIG_DUAL_TACH;
+
+	if (of_property_read_bool(child, "maxim,fan-no-fault-ramp"))
+		mfr_cfg |= MFR_FAN_CONFIG_TACHO;
+
+	if (!of_property_read_u32(child, "maxim,fan-startup", &uval)) {
+		uval /= 2;
+		if (uval < 5) {
+			mfr_cfg |= uval;
+		} else {
+			dev_err(dev, "maxim,fan-startup has invalid value for fan %d: %u\n",
+					page, uval);
+			return -EINVAL;
+		}
+	}
+
+	if (!of_property_read_u32(child, "maxim,fan-ramp", &uval)) {
+		if (uval < 8) {
+			mfr_cfg |= uval << 5;
+		} else {
+			dev_err(dev, "maxim,fan-ramp has invalid value for fan %d: %u\n",
+					page, uval);
+			return -EINVAL;
+		}
+	}
+
+	if (!of_property_read_u32(child, "maxim,tmp-hysteresis", &uval)) {
+		uval /= 2;
+		uval -= 1;
+		if (uval < 4) {
+			mfr_cfg |= uval << 10;
+		} else {
+			dev_err(dev, "maxim,tmp-hysteresis has invalid value for fan %d, %u\n",
+					page, uval);
+			return -EINVAL;
+		}
+	}
+
+	if (!of_property_read_u32(child, "maxim,fan-pwm-freq", &uval)) {
+		u16 val;
+
+		if (uval == 30) {
+			val = 0;
+		} else if (uval == 50) {
+			val = 1;
+		} else if (uval == 100) {
+			val = 2;
+		} else if (uval == 150) {
+			val = 3;
+		} else if (uval == 25000) {
+			val = 7;
+		} else {
+			dev_err(dev, "maxim,fan-pwm-freq has invalid value for fan %d: %u\n",
+					page, uval);
+			return -EINVAL;
+		}
+
+		mfr_cfg |= val << 13;
+	}
+
+	if (of_property_read_bool(child, "maxim,fan-fault-pin-mon"))
+		mfr_fault_resp |= MFR_FAULT_RESPONSE_MONITOR;
+
+	ret = i2c_smbus_write_byte_data(client, PMBUS_FAN_CONFIG_12,
+					pb_cfg & ~PB_FAN_1_INSTALLED);
+	if (ret < 0)
+		return ret;
+
+	ret = i2c_smbus_write_word_data(client, MFR_FAN_CONFIG, mfr_cfg);
+	if (ret < 0)
+		return ret;
+
+	ret = i2c_smbus_write_byte_data(client, MFR_FAULT_RESPONSE,
+					mfr_fault_resp);
+	if (ret < 0)
+		return ret;
+
+	ret = i2c_smbus_write_byte_data(client, PMBUS_FAN_CONFIG_12, pb_cfg);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * Fans are on pages 0 - 5. If the page property of a fan node is
+	 * greater than 5 we will have errored in checks above out above.
+	 * Therefore we don't need to cope with values up to 31, and the int
+	 * return type is enough.
+	 *
+	 * The bit mask return value is used to populate a bitfield of fans
+	 * who are both configured in the devicetree _and_ reported as
+	 * installed by the hardware. Any fans that are not configured in the
+	 * devicetree but are reported as installed by the hardware will have
+	 * their hardware configuration updated to unset the installed bit.
+	 */
+	return BIT(page);
+}
+
+static int max31785_of_tmp_config(struct i2c_client *client,
+				  struct pmbus_driver_info *info,
+				  struct device_node *child)
+{
+	struct device *dev = &client->dev;
+	struct device_node *np;
+	u16 mfr_tmp_cfg = 0;
+	u32 page;
+	u32 uval;
+	int ret;
+	int i;
+
+	if (!of_device_is_compatible(child, "pmbus-temperature"))
+		return 0;
+
+	ret = of_property_read_u32(child, "reg", &page);
+	if (ret < 0) {
+		dev_err(&client->dev, "Missing valid reg property\n");
+		return ret;
+	}
+
+	if (!(info->func[page] & PMBUS_HAVE_TEMP)) {
+		dev_err(dev, "Page %d does not have temp capabilities\n", page);
+		return -ENXIO;
+	}
+
+	ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
+	if (ret < 0)
+		return ret;
+
+	if (!of_property_read_u32(child, "maxim,tmp-offset", &uval)) {
+		if (uval < 32)
+			mfr_tmp_cfg |= uval << 10;
+	}
+
+	i = 0;
+	while ((np = of_parse_phandle(child, "maxim,tmp-fans", i))) {
+		if (of_property_read_u32(np, "reg", &uval)) {
+			dev_err(&client->dev, "Failed to read fan reg property for phandle index %d\n",
+					i);
+		} else {
+			if (uval < 6)
+				mfr_tmp_cfg |= BIT(uval);
+			else
+				dev_warn(&client->dev, "Invalid fan page: %d\n",
+						uval);
+		}
+		i++;
+	}
+
+	ret = i2c_smbus_write_word_data(client, MFR_TEMP_SENSOR_CONFIG,
+					mfr_tmp_cfg);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
 #define MAX31785_FAN_FUNCS \
 	(PMBUS_HAVE_FAN12 | PMBUS_HAVE_STATUS_FAN12 | PMBUS_HAVE_PWM12)
 
@@ -334,9 +609,12 @@ static int max31785_probe(struct i2c_client *client,
 			  const struct i2c_device_id *id)
 {
 	struct device *dev = &client->dev;
+	struct device_node *child;
 	struct pmbus_driver_info *info;
 	bool dual_tach = false;
+	u32 fans;
 	s64 ret;
+	int i;
 
 	if (!i2c_check_functionality(client->adapter,
 				     I2C_FUNC_SMBUS_BYTE_DATA |
@@ -366,6 +644,46 @@ static int max31785_probe(struct i2c_client *client,
 		return -ENODEV;
 	}
 
+	fans = 0;
+	for_each_child_of_node(dev->of_node, child) {
+		ret = max31785_of_fan_config(client, info, child);
+		if (ret < 0) {
+			of_node_put(child);
+			return ret;
+		}
+
+		if (ret)
+			fans |= ret;
+
+		ret = max31785_of_tmp_config(client, info, child);
+		if (ret < 0) {
+			of_node_put(child);
+			return ret;
+		}
+	}
+
+	for (i = 0; i < MAX31785_NR_PAGES; i++) {
+		bool have_fan = !!(info->func[i] & PMBUS_HAVE_FAN12);
+		bool fan_configured = !!(fans & BIT(i));
+
+		if (!have_fan || fan_configured)
+			continue;
+
+		ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, i);
+		if (ret < 0)
+			return ret;
+
+		ret = i2c_smbus_read_byte_data(client, PMBUS_FAN_CONFIG_12);
+		if (ret < 0)
+			return ret;
+
+		ret &= ~PB_FAN_1_INSTALLED;
+		ret = i2c_smbus_write_word_data(client, PMBUS_FAN_CONFIG_12,
+						ret);
+		if (ret < 0)
+			return ret;
+	}
+
 	if (dual_tach) {
 		ret = max31785_configure_dual_tach(client, info);
 		if (ret < 0)
-- 
2.14.1
