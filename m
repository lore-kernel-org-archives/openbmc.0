Return-Path: <andrew@aj.id.au>
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x5mx90ZzhzDqBr
 for <openbmc@lists.ozlabs.org>; Mon, 10 Jul 2017 23:57:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="cy5WGCYG"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="O4FcwCzC"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C5AC8209FD;
 Mon, 10 Jul 2017 09:57:14 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 10 Jul 2017 09:57:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=OP6MpW
 8JP2n3JdcbQNI3DLqM1cbzARHgzD9togk0ASU=; b=cy5WGCYG3LHdN9UchqxcbC
 YYUSfNhvgGxZzhdtLWE71lxJczYC/ImNq21H+eq14/uOCt3Azwp2Jx3l8uvhabT3
 un5G1Q1zd1DOpmkF0CDtbWQ805xuBddbWRrZeqJ2ovIP7v4q9yh1/FcAHZqE6dc7
 Gvo2VvVeI7b4oIbKh3VtvAp/VhGmMb59MdBlBDT7JV11rpmn03K9hnyIaIB1fvee
 /KdvNeJ+8NZ6jU+SVEVukCoOWg6NpzlbV7PKm3jfBJcNpfeg1etNd9gybUgkY32F
 pciXZx/nNiUaB+MHN7SqLNozVJ0Es+5u/Wg+L4ls9kYgUW+SLZRYr5XazgO+D1yw
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=OP6MpW8JP2n3JdcbQNI3DLqM1cbzARHgzD9togk0A
 SU=; b=O4FcwCzCs11TvcMDRVebor82oN+rgKVPxXoRhStX0r0ygOo1rUb0vnwBh
 QFNl6cQuZNZCZAqPn6Wkzxc2fNJ2b/DrIRxl+uIESnon4xL/t0bJW9PBH5QKg5fH
 GZ861+NuiHrGCxjWNOlQtaZ2rljKR6zIhstWqKFsS2l2wjSOrRBp1QiYowybIbWs
 obdSoIPwdsCiA/KcrSn3821UWZG6+KXZGu2cS1d2GA5rZJtCT4UQIh1572rcu965
 rn8uRCLbo9Zmp8l4AvsROAgYxla9Hq+JNg5clj75i2OTXibr55WTtZeiAy97DA4R
 oWR2wAMR/9BjsO9/LdEKN8WxnA2SQ==
X-ME-Sender: <xms:uodjWbsyhtkTcqT3KaxAXsud_6lGyg0u0dwlshVly_e0El65FlUtuw>
X-Sasl-enc: /fZ3ONtNE8UldCxgIZsADilewBnmOvJ8aNUndhZI81ju 1499695033
Received: from keelia.aj.id.au (220-253-43-190.dyn.iinet.net.au
 [220.253.43.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4D14A7E2B6;
 Mon, 10 Jul 2017 09:57:11 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, jdelvare@suse.com,
 linux-kernel@vger.kernel.org, joel@jms.id.au, openbmc@lists.ozlabs.org,
 msbarth@linux.vnet.ibm.com, mspinler@linux.vnet.ibm.com
Subject: [RFC PATCH 4/4] pmbus: Add MAX31785 driver
Date: Mon, 10 Jul 2017 23:26:18 +0930
Message-Id: <20170710135618.13661-5-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170710135618.13661-1-andrew@aj.id.au>
References: <20170710135618.13661-1-andrew@aj.id.au>
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
X-List-Received-Date: Mon, 10 Jul 2017 13:57:17 -0000

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/hwmon/pmbus/Kconfig    |  10 ++
 drivers/hwmon/pmbus/Makefile   |   1 +
 drivers/hwmon/pmbus/max31785.c | 201 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 212 insertions(+)
 create mode 100644 drivers/hwmon/pmbus/max31785.c

diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index cad1229b7e17..5f2f3c6c7499 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -95,6 +95,16 @@ config SENSORS_MAX20751
 	  This driver can also be built as a module. If so, the module will
 	  be called max20751.
 
+config SENSORS_MAX31785
+	tristate "Maxim MAX31785 and compatibles"
+	default n
+	help
+	  If you say yes here you get hardware monitoring support for Maxim
+	  MAX31785.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called max31785.
+
 config SENSORS_MAX34440
 	tristate "Maxim MAX34440 and compatibles"
 	default n
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index 24ff7ee7f8bb..acba1be0d9ad 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -10,6 +10,7 @@ obj-$(CONFIG_SENSORS_PMBUS)	+= pmbus.o
 # obj-$(CONFIG_SENSORS_LTC3815)	+= ltc3815.o
 # obj-$(CONFIG_SENSORS_MAX16064)	+= max16064.o
 # obj-$(CONFIG_SENSORS_MAX20751)	+= max20751.o
+obj-$(CONFIG_SENSORS_MAX31785)	+= max31785.o
 # obj-$(CONFIG_SENSORS_MAX34440)	+= max34440.o
 # obj-$(CONFIG_SENSORS_MAX8688)	+= max8688.o
 # obj-$(CONFIG_SENSORS_TPS40422)	+= tps40422.o
diff --git a/drivers/hwmon/pmbus/max31785.c b/drivers/hwmon/pmbus/max31785.c
new file mode 100644
index 000000000000..8432ed5a0ad6
--- /dev/null
+++ b/drivers/hwmon/pmbus/max31785.c
@@ -0,0 +1,201 @@
+/*
+ * Copyright (C) 2017 IBM Corp.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include "pmbus.h"
+
+enum max31785_regs {
+	PMBUS_MFR_FAN_CONFIG		= 0xF1,
+	PMBUS_MFR_READ_FAN_PWM		= 0xF3,
+	PMBUS_MFR_FAN_FAULT_LIMIT	= 0xF5,
+	PMBUS_MFR_FAN_WARN_LIMIT	= 0xF6,
+	PMBUS_MFR_FAN_PWM_AVG		= 0xF8,
+};
+
+static const struct pmbus_coeffs fan_coeffs[] = {
+	[percent]	= { .m = 1, .b = 0, .R = 2 },
+	[rpm]		= { .m = 1, .b = 0, .R = 0 },
+};
+
+static const struct pmbus_coeffs *max31785_get_fan_coeffs(
+		const struct pmbus_driver_info *info, int index,
+		enum pmbus_fan_mode mode, int command)
+{
+	switch (command) {
+	case PMBUS_FAN_COMMAND_1:
+	case PMBUS_MFR_FAN_FAULT_LIMIT:
+	case PMBUS_MFR_FAN_WARN_LIMIT:
+		return &fan_coeffs[mode];
+	case PMBUS_READ_FAN_SPEED_1:
+		return &fan_coeffs[rpm];
+	case PMBUS_MFR_FAN_PWM_AVG:
+		return &fan_coeffs[percent];
+	default:
+		break;
+	}
+
+	return NULL;
+}
+
+static int max31785_get_pwm_mode(int id, u8 fan_config, u16 fan_command)
+{
+	enum pmbus_fan_mode mode;
+
+	/* MAX31785 only supports fan 1 on the fan pages */
+	if (WARN_ON(id > 0))
+		return -ENODEV;
+
+	mode = (fan_config & PB_FAN_1_RPM) ? rpm : percent;
+
+	switch (mode) {
+	case percent:
+		if (fan_command >= 0x8000)
+			return 2;
+		else if (fan_command >= 0x2711)
+			return 0;
+		else
+			return 1;
+	case rpm:
+		if (fan_command >= 0x8000)
+			return 2;
+		else
+			return 1;
+		break;
+	}
+
+	return 0;
+}
+
+static const int max31785_pwm_modes[] = { 0x7fff, 0x2710, 0xffff };
+
+int max31785_set_pwm_mode(int id, long mode, u8 *fan_config, u16 *fan_command)
+{
+	/* MAX31785 only supports fan 1 on the fan pages */
+	if (WARN_ON(id > 0))
+		return -ENODEV;
+
+	*fan_config &= ~PB_FAN_1_RPM;
+
+	if (mode >= ARRAY_SIZE(max31785_pwm_modes))
+		return -ENOTSUPP;
+
+	*fan_command = max31785_pwm_modes[mode];
+
+	return 0;
+}
+
+static struct pmbus_driver_info max31785_info = {
+	.pages = 23,
+
+	.get_fan_coeffs = max31785_get_fan_coeffs,
+	.get_pwm_mode = max31785_get_pwm_mode,
+	.set_pwm_mode = max31785_set_pwm_mode,
+
+	.format[PSC_FAN] = direct,
+	.func[0] = PMBUS_HAVE_FAN12 | PMBUS_HAVE_STATUS_FAN12,
+	.func[1] = PMBUS_HAVE_FAN12 | PMBUS_HAVE_STATUS_FAN12,
+	.func[2] = PMBUS_HAVE_FAN12 | PMBUS_HAVE_STATUS_FAN12,
+	.func[3] = PMBUS_HAVE_FAN12 | PMBUS_HAVE_STATUS_FAN12,
+	.func[4] = PMBUS_HAVE_FAN12 | PMBUS_HAVE_STATUS_FAN12,
+	.func[5] = PMBUS_HAVE_FAN12 | PMBUS_HAVE_STATUS_FAN12,
+
+	.format[PSC_TEMPERATURE] = direct,
+	.coeffs[PSC_TEMPERATURE].m = 1,
+	.coeffs[PSC_TEMPERATURE].b = 0,
+	.coeffs[PSC_TEMPERATURE].R = 2,
+	.func[6]  = PMBUS_HAVE_STATUS_TEMP,
+	.func[7]  = PMBUS_HAVE_STATUS_TEMP,
+	.func[8]  = PMBUS_HAVE_STATUS_TEMP,
+	.func[9]  = PMBUS_HAVE_STATUS_TEMP,
+	.func[10] = PMBUS_HAVE_STATUS_TEMP,
+	.func[11] = PMBUS_HAVE_STATUS_TEMP,
+	.func[12] = PMBUS_HAVE_STATUS_TEMP,
+	.func[13] = PMBUS_HAVE_STATUS_TEMP,
+	.func[14] = PMBUS_HAVE_STATUS_TEMP,
+	.func[15] = PMBUS_HAVE_STATUS_TEMP,
+	.func[16] = PMBUS_HAVE_STATUS_TEMP,
+
+	.format[PSC_VOLTAGE_OUT] = direct,
+	.coeffs[PSC_VOLTAGE_OUT].m = 1,
+	.coeffs[PSC_VOLTAGE_OUT].b = 0,
+	.coeffs[PSC_VOLTAGE_OUT].R = 0,
+	.func[17] = PMBUS_HAVE_STATUS_VOUT,
+	.func[18] = PMBUS_HAVE_STATUS_VOUT,
+	.func[19] = PMBUS_HAVE_STATUS_VOUT,
+	.func[20] = PMBUS_HAVE_STATUS_VOUT,
+	.func[21] = PMBUS_HAVE_STATUS_VOUT,
+	.func[22] = PMBUS_HAVE_STATUS_VOUT,
+};
+
+#define MFR_FAN_CONFIG_TSFO		BIT(9)
+#define MFR_FAN_CONFIG_TACHO		BIT(8)
+
+static int max31785_probe(struct i2c_client *client,
+			  const struct i2c_device_id *id)
+{
+	int rv;
+	int i;
+
+	rv = pmbus_do_probe(client, id, &max31785_info);
+	if (rv < 0)
+		return rv;
+
+	for (i = 0; i < max31785_info.pages; i++) {
+		int reg;
+
+		if (!(max31785_info.func[i] & (PMBUS_HAVE_FAN12)))
+			continue;
+
+		reg = pmbus_read_word_data(client, i, PMBUS_MFR_FAN_CONFIG);
+		if (reg < 0)
+			continue;
+
+		/*
+		 * XXX: Purely for RFC/testing purposes, don't ramp fans on fan
+		 * or temperature sensor fault, or a failure to write
+		 * FAN_COMMAND_1 inside a 10s window (watchdog mode).
+		 *
+		 * The TSFO bit controls both ramping on temp sensor failure
+		 * AND whether FAN_COMMAND_1 is in watchdog mode.
+		 */
+		reg = (reg | MFR_FAN_CONFIG_TSFO | MFR_FAN_CONFIG_TACHO);
+		reg &= 0xffff;
+
+		rv = pmbus_write_word_data(client, i, PMBUS_MFR_FAN_CONFIG,
+					   reg);
+	}
+
+	return 0;
+}
+
+static const struct i2c_device_id max31785_id[] = {
+	{ "max31785", 0 },
+	{ },
+};
+
+MODULE_DEVICE_TABLE(i2c, max31785_id);
+
+static struct i2c_driver max31785_driver = {
+	.driver = {
+		.name = "max31785",
+	},
+	.probe = max31785_probe,
+	.remove = pmbus_do_remove,
+	.id_table = max31785_id,
+};
+
+module_i2c_driver(max31785_driver);
+
+MODULE_AUTHOR("Andrew Jeffery <andrew@aj.id.au>");
+MODULE_DESCRIPTION("PMBus driver for the Maxim MAX31785");
+MODULE_LICENSE("GPL");
-- 
2.11.0
