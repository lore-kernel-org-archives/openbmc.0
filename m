Return-Path: <3eJmvXAcKB1UI1AGHE13BB381.zB9BC1Ay9z85FGF.BM8xyF.BE3@flex--venture.bounces.google.com>
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=flex--venture.bounces.google.com
 (client-ip=2607:f8b0:4864:20::44a; helo=mail-pf1-x44a.google.com;
 envelope-from=3ejmvxackb1ui1aghe13bb381.zb9bc1ay9z85fgf.bm8xyf.be3@flex--venture.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="dAA7wpXn"; 
 dkim-atps=neutral
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com
 [IPv6:2607:f8b0:4864:20::44a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44gBNN2LYmzDqS4
 for <openbmc@lists.ozlabs.org>; Fri, 12 Apr 2019 05:46:04 +1000 (AEST)
Received: by mail-pf1-x44a.google.com with SMTP id u78so4866509pfa.12
 for <openbmc@lists.ozlabs.org>; Thu, 11 Apr 2019 12:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=bOUegwfXNh+pk6vbSUWT6G5mVy/gXi/mLOHQhF5Bjt0=;
 b=dAA7wpXnFR6NeHp85zjUKRWGrZYLALZe2dD4DnQfx8Yuev/kP9HntOLNQ2p01uJVWj
 g+01KKD2R1GDt34AXmFHV2ELytvrH0dc5SrFX12w/Pp6tz6TAdQEXE5E3WOO7l/3ibiY
 dpWiEdQxnqDDAat2s5GyQdiycWgzoeX9O0s32D+CXlZVK7p5wxb3qaCUdbQxWSurJhQy
 1m1pxS+IyOV6hrDZZb54VSDk6QEMHWGdB0kDklDGqK/2KFZ6utbzxHDTChI/x7EQgAUR
 3qIlUP6JSxMDcTztzV4sqNkVQ/vauanq4CHU2plHuLdXmqKlH/qYslNPVNSmIqYZg3om
 NLDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=bOUegwfXNh+pk6vbSUWT6G5mVy/gXi/mLOHQhF5Bjt0=;
 b=l9Jt7UMCKryVBcv093Mp2PKYDg5jDyt0CjHNjDVqqhs9SPcJDWqudrggX/r/hKwaa/
 PnEhfKUD6TqsDytC+kgs3UFlfbFRq4i0frA98VU1eJcWr+4oLo55VM5dkYtMd/RSQqS5
 la6qdCZKOUv/eqUZyWK1+YDZVywu5oey7i//0Qz+8NJ0PgWMVg7GkAddHXaQNpxRv2HP
 BQcwTVofxfwJLt068mYkIWNWyy8/Q3LOgW+xfGH76CaTcF8PoyCe3ElQUPvCYqxqC3TB
 j/Mr8hQGj7wO/6qpcsPqdVSrNXp7nodr7vREqa6qM2NEWL+emuRJ7r1f1w3ZvDIQhmuv
 tilg==
X-Gm-Message-State: APjAAAXd4GJXH5r5ymT+ZR7EHevROBNGR44FX/vjcumwYI5JmAogLfZy
 OiRFmoKRv8ptC2Urww0yQIiZgTqR/tLR
X-Google-Smtp-Source: APXvYqxRv7bNpVeflft6+0QvV/fOQh1EigiInIv32etcLfOCnFILwHxDTW2vk9Jpr2ym/Xw+1JTAaPCU3/ir
X-Received: by 2002:a62:d241:: with SMTP id c62mr1542920pfg.110.1555011960787; 
 Thu, 11 Apr 2019 12:46:00 -0700 (PDT)
Date: Thu, 11 Apr 2019 12:45:57 -0700
Message-Id: <20190411194557.65574-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.21.0.392.gf8f6787159e-goog
Subject: [PATCH dev-5.0] hwmon: (pmbus/ir38064): Add driver for Infineon
 IR38064 Voltage Regulator
From: Patrick Venture <venture@google.com>
To: venture@google.com, joel@jms.id.au, andrew@aj.id.au
Cc: Maxim Sloyko <maxims@google.com>, openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Apr 2019 19:46:13 -0000

From: Maxim Sloyko <maxims@google.com>

Add the pmbus driver for the Infineon ir38064 voltage regulator.

Signed-off-by: Maxim Sloyko <maxims@google.com>
Signed-off-by: Patrick Venture <venture@google.com>
---
 drivers/hwmon/pmbus/Kconfig   |  9 ++++++
 drivers/hwmon/pmbus/Makefile  |  1 +
 drivers/hwmon/pmbus/ir38064.c | 60 +++++++++++++++++++++++++++++++++++
 3 files changed, 70 insertions(+)
 create mode 100644 drivers/hwmon/pmbus/ir38064.c

diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 15c197f1c4c4..b6c228a55da2 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -64,6 +64,15 @@ config SENSORS_ISL68137
 	  This driver can also be built as a module. If so, the module will
 	  be called isl68137.
 
+config SENSORS_IR38064
+	tristate "Infineon IR38064"
+	help
+	  If you say yes here you get hardware monitoring support for Infineon
+	  IR38064.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called ir38064.
+
 config SENSORS_LM25066
 	tristate "National Semiconductor LM25066 and compatibles"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index 0684b35216da..8ee236b1d986 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -9,6 +9,7 @@ obj-$(CONFIG_SENSORS_ADM1275)	+= adm1275.o
 obj-$(CONFIG_SENSORS_IBM_CFFPS)	+= ibm-cffps.o
 obj-$(CONFIG_SENSORS_IR35221)	+= ir35221.o
 obj-$(CONFIG_SENSORS_ISL68137)	+= isl68137.o
+obj-$(CONFIG_SENSORS_IR38064)	+= ir38064.o
 obj-$(CONFIG_SENSORS_LM25066)	+= lm25066.o
 obj-$(CONFIG_SENSORS_LTC2978)	+= ltc2978.o
 obj-$(CONFIG_SENSORS_LTC3815)	+= ltc3815.o
diff --git a/drivers/hwmon/pmbus/ir38064.c b/drivers/hwmon/pmbus/ir38064.c
new file mode 100644
index 000000000000..4b957ebb6fa7
--- /dev/null
+++ b/drivers/hwmon/pmbus/ir38064.c
@@ -0,0 +1,60 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Hardware monitoring driver for Infineon IR38064
+ *
+ * Copyright (c) 2017 Google Inc
+ *
+ */
+
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include "pmbus.h"
+
+static struct pmbus_driver_info ir38064_info = {
+	.pages = 1,
+	.format[PSC_VOLTAGE_IN] = linear,
+	.format[PSC_VOLTAGE_OUT] = direct,
+	.format[PSC_CURRENT_OUT] = linear,
+	.format[PSC_POWER] = linear,
+	.format[PSC_TEMPERATURE] = linear,
+	.m[PSC_VOLTAGE_OUT] = 256,
+	.b[PSC_VOLTAGE_OUT] = 0,
+	.R[PSC_VOLTAGE_OUT] = 0,
+	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT
+	    | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP
+	    | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
+	    | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT
+	    | PMBUS_HAVE_POUT,
+};
+
+static int ir38064_probe(struct i2c_client *client,
+			 const struct i2c_device_id *id)
+{
+	return pmbus_do_probe(client, id, &ir38064_info);
+}
+
+static const struct i2c_device_id ir38064_id[] = {
+	{"ir38064", 0},
+	{}
+};
+
+MODULE_DEVICE_TABLE(i2c, ir38064_id);
+
+/* This is the driver that will be inserted */
+static struct i2c_driver ir38064_driver = {
+	.driver = {
+		   .name = "ir38064",
+		   },
+	.probe = ir38064_probe,
+	.remove = pmbus_do_remove,
+	.id_table = ir38064_id,
+};
+
+module_i2c_driver(ir38064_driver);
+
+MODULE_AUTHOR("Maxim Sloyko <maxims@google.com>");
+MODULE_DESCRIPTION("PMBus driver for Infineon IR38064");
+MODULE_LICENSE("GPL");
-- 
2.21.0.392.gf8f6787159e-goog
