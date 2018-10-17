Return-Path: <3CL7HWwUKB4cv5y9trzzrwp.nzxz0pymxnwt343.zAwlm3.z2r@flex--kunyi.bounces.google.com>
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=flex--kunyi.bounces.google.com
 (client-ip=2607:f8b0:4864:20::d4a; helo=mail-io1-xd4a.google.com;
 envelope-from=3cl7hwwukb4cv5y9trzzrwp.nzxz0pymxnwt343.zawlm3.z2r@flex--kunyi.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ZaatQBdn"; 
 dkim-atps=neutral
Received: from mail-io1-xd4a.google.com (mail-io1-xd4a.google.com
 [IPv6:2607:f8b0:4864:20::d4a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42b6ww6RY6zF3Kr
 for <openbmc@lists.ozlabs.org>; Thu, 18 Oct 2018 09:56:10 +1100 (AEDT)
Received: by mail-io1-xd4a.google.com with SMTP id l21-v6so12260836ioc.21
 for <openbmc@lists.ozlabs.org>; Wed, 17 Oct 2018 15:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:cc;
 bh=HFH3AFRn4plN0Si/b0ikFRnPPozJbTcZzpeAPcHPMWQ=;
 b=ZaatQBdnBnOKW5Ql2CgoeEA8Cjl0skNn2QKOr7xjebIj9PBqdKtGxMCUshfRnjhlgn
 Ifs3CmJjq4ZkHYZ4DdqMYo1I9xbwx/WD6Wrv2GW8TUprCTgaUSWfTY3a8JwywycC7DEP
 Cp/HmwHGOhVrDXUJtgwPMIDNQhkeC0fzC5kG4+UODAWi90JYyW+QFL/UVIbTkXS0fcPS
 0n+WNuwFy0TDMZ4d/TVWGYajyivD2JwcUWLrPb/J9wSwa75/Mk9EkrYC0rafgqP9G9bj
 DOramXfEObWO5QRuaSQ8v+UdJA5aOnNEHUK5Q+IN8z1mdHjqqTrU6Kld8+q4uSQDIDDt
 7QAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:cc;
 bh=HFH3AFRn4plN0Si/b0ikFRnPPozJbTcZzpeAPcHPMWQ=;
 b=S1QngQWRSgd7CV4VIu4X1j6waDOvPLNdIUrKdybT8HCFVjZATaF+WbE0yw4wPXd6z3
 P6QyqyVE22vl/KMPsW4RSpe6eAvlE1bZW+3LSgy6I3B8CRQqsANmJCTkhfDsc6tp06Ld
 uIQEQ5z1TbqSM3mVaLHw7SE5IZf9EY3vcZtthx6oEGbrhS44Xu6mcVZsMbJ70vBx6s9n
 dmlmZkkwYaabZALgmfvrgFgWj93G7ZrtWm1ZbntzOmtpzxlsh2klzM91+5lEYc/IfZd/
 YSwaQ/jH3+EE6bl3Y71nROtTCbFcDJ37cE0chYWodyQOGRtwlxj1s2jIzz86vx+HFlQa
 cPGQ==
X-Gm-Message-State: ABuFfohZmW2sL55erJ+7eDdLFIwPOmgj3fpMj6pPVfTbCtUmubHGakC7
 eJ0uBwtr5ZjTUOdCYk/PvGRUvj0VRJaCLN2AGXK2L5DlX4sf02tnVTMm0vYo6sOiw5radfaQs5x
 Hmnj+OBj4FCzkIvdeX20HqlxsCHNZ7+1Vj6Db0tgtgQX4kdaCqge8GCkLxtJgkw==
X-Google-Smtp-Source: ACcGV639C6jVTR3DXnh6bINSUTWpQnaSJXO55GuTeRVF+kPtWY/GC99luCDlRmLrugjAGPTqpoXvCoj6wQ==
X-Received: by 2002:a24:2153:: with SMTP id
 e80-v6mr22088599ita.1.1539816968731; 
 Wed, 17 Oct 2018 15:56:08 -0700 (PDT)
Date: Wed, 17 Oct 2018 15:56:02 -0700
Message-Id: <20181017225603.7782-1-kunyi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.19.1.331.ge82ca0e54c-goog
Subject: [PATCH 1/2] hwmon: (pmbus): Add driver for Intersil ISL68137
From: Kun Yi <kunyi@google.com>
Cc: openbmc@lists.ozlabs.org, kunyi@google.com, 
 Maxim Sloyko <maxims@google.com>, Guenter Roeck <linux@roeck-us.net>,
 Jean Delvare <jdelvare@suse.com>, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
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
X-List-Received-Date: Wed, 17 Oct 2018 22:56:17 -0000

From: Maxim Sloyko <maxims@google.com>

Intersil ISL68137 is a digital output 7-phase configurable PWM
controller with an AVSBus interface.

Signed-off-by: Maxim Sloyko <maxims@google.com>
Signed-off-by: Kun Yi <kunyi@google.com>
---
 drivers/hwmon/pmbus/Kconfig    | 10 ++++
 drivers/hwmon/pmbus/Makefile   |  1 +
 drivers/hwmon/pmbus/isl68137.c | 86 ++++++++++++++++++++++++++++++++++
 3 files changed, 97 insertions(+)
 create mode 100644 drivers/hwmon/pmbus/isl68137.c

diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 629cb45f8557..15c197f1c4c4 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -54,6 +54,16 @@ config SENSORS_IR35221
 	  This driver can also be built as a module. If so, the module will
 	  be called ir35521.
 
+config SENSORS_ISL68137
+	tristate "Intersil ISL68137"
+	default y
+	help
+	  If you say yes here you get hardware monitoring support for Intersil
+	  ISL68137.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called isl68137.
+
 config SENSORS_LM25066
 	tristate "National Semiconductor LM25066 and compatibles"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index ea0e39518c21..0684b35216da 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_SENSORS_PMBUS)	+= pmbus.o
 obj-$(CONFIG_SENSORS_ADM1275)	+= adm1275.o
 obj-$(CONFIG_SENSORS_IBM_CFFPS)	+= ibm-cffps.o
 obj-$(CONFIG_SENSORS_IR35221)	+= ir35221.o
+obj-$(CONFIG_SENSORS_ISL68137)	+= isl68137.o
 obj-$(CONFIG_SENSORS_LM25066)	+= lm25066.o
 obj-$(CONFIG_SENSORS_LTC2978)	+= ltc2978.o
 obj-$(CONFIG_SENSORS_LTC3815)	+= ltc3815.o
diff --git a/drivers/hwmon/pmbus/isl68137.c b/drivers/hwmon/pmbus/isl68137.c
new file mode 100644
index 000000000000..2a5322e4a286
--- /dev/null
+++ b/drivers/hwmon/pmbus/isl68137.c
@@ -0,0 +1,86 @@
+/*
+ * Hardware monitoring driver for Intersil ISL68137
+ *
+ * Copyright (c) 2017 Google Inc
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include "pmbus.h"
+
+static struct pmbus_driver_info isl68137_info = {
+	.pages = 2,
+	.format[PSC_VOLTAGE_IN] = direct,
+	.format[PSC_VOLTAGE_OUT] = direct,
+	.format[PSC_CURRENT_IN] = direct,
+	.format[PSC_CURRENT_OUT] = direct,
+	.format[PSC_POWER] = direct,
+	.format[PSC_TEMPERATURE] = direct,
+	.m[PSC_VOLTAGE_IN] = 1,
+	.b[PSC_VOLTAGE_IN] = 0,
+	.R[PSC_VOLTAGE_IN] = 3,
+	.m[PSC_VOLTAGE_OUT] = 1,
+	.b[PSC_VOLTAGE_OUT] = 0,
+	.R[PSC_VOLTAGE_OUT] = 3,
+	.m[PSC_CURRENT_IN] = 1,
+	.b[PSC_CURRENT_IN] = 0,
+	.R[PSC_CURRENT_IN] = 2,
+	.m[PSC_CURRENT_OUT] = 1,
+	.b[PSC_CURRENT_OUT] = 0,
+	.R[PSC_CURRENT_OUT] = 1,
+	.m[PSC_POWER] = 1,
+	.b[PSC_POWER] = 0,
+	.R[PSC_POWER] = 0,
+	.m[PSC_TEMPERATURE] = 1,
+	.b[PSC_TEMPERATURE] = 0,
+	.R[PSC_TEMPERATURE] = 0,
+	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_IIN | PMBUS_HAVE_PIN
+	    | PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_TEMP | PMBUS_HAVE_TEMP2
+	    | PMBUS_HAVE_TEMP3 | PMBUS_HAVE_STATUS_TEMP
+	    | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
+	    | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_POUT,
+	.func[1] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
+	    | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_POUT,
+};
+
+static int isl68137_probe(struct i2c_client *client,
+			  const struct i2c_device_id *id)
+{
+	return pmbus_do_probe(client, id, &isl68137_info);
+}
+
+static const struct i2c_device_id isl68137_id[] = {
+	{"isl68137", 0},
+	{}
+};
+
+MODULE_DEVICE_TABLE(i2c, isl68137_id);
+
+/* This is the driver that will be inserted */
+static struct i2c_driver isl68137_driver = {
+	.driver = {
+		   .name = "isl68137",
+		   },
+	.probe = isl68137_probe,
+	.remove = pmbus_do_remove,
+	.id_table = isl68137_id,
+};
+
+module_i2c_driver(isl68137_driver);
+
+MODULE_AUTHOR("Maxim Sloyko <maxims@google.com>");
+MODULE_DESCRIPTION("PMBus driver for Intersil ISL68137");
+MODULE_LICENSE("GPL");
-- 
2.19.1.331.ge82ca0e54c-goog
