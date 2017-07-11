Return-Path: <xow@google.com>
Received: from mail-pg0-x22f.google.com (mail-pg0-x22f.google.com
 [IPv6:2607:f8b0:400e:c05::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x63Gn2G7yzDq66
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jul 2017 10:43:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="e+Eu7hey"; 
 dkim-atps=neutral
Received: by mail-pg0-x22f.google.com with SMTP id k14so57758896pgr.0
 for <openbmc@lists.ozlabs.org>; Mon, 10 Jul 2017 17:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UvdbvzPiX4W9ybRF0F8tlxjU0gaiSnm2xCdz7ozABvk=;
 b=e+Eu7hey9DM2DJEytBXUIZk749TMLOw9Ola0MD65m4lnsBU9NT8JF9+SqW6lg85InC
 Hs142iV6o7EOt/Nuv3zAFxtQs2aakcnYvwfmYicnf1YNWvzzUpnHAaH+F7/631m/i0oI
 lKsvcuM3OjC9LlVYYtZU8wUtCaOjejBN2Mwzp1lUPP0Wa4VDm2aI0JnrABZ4LKgZW75b
 WfA7DCzv2dCXXRvhk0QgDMrLyqohG2tIPa707VPcFtiIJCvm5Ci/1q7IjDPsHnG9eHrp
 FuPOsru0VgE3MPYsGD8Vi9pMk0/bx1PVOYLHlC43JNlpeOgfnaATYdWi7NgX166S0rdS
 Ccrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UvdbvzPiX4W9ybRF0F8tlxjU0gaiSnm2xCdz7ozABvk=;
 b=mY2C68IxvjKLIZIhOm1XpVHpKrywBEzqWdAoB/ihWw5Xg0RS+OFQzp1ey2BIjqcL2v
 BAdwVl/OATEh89YEYmDOwSPYzYdnCPfBsm65zepiItwosvSnkqjNosU8jQbs+DIsapje
 yicfevrAyZTJ6kosgRuR5CXOylQgD5BqoflYl3HlRuh1meeC7s1c9ygYTtUukfGJF9fJ
 BCp/GCak1q95mMIPBS1phGVrUJk6XDgOS8uJoNHKWvG8KUPj2ZjvWLIPiEAutVgQUsE8
 xGoBKp3xeRo3auEu+dqGJy+5GMqcY49wxuL90bOhJboO0URArh2NorDZ/SOhVJfQA5IO
 hpiA==
X-Gm-Message-State: AIVw112k139yD0yoxosAt7u5fzYTZtZmhTmUo8aSlORXv9hajqQ/p+9j
 qFiNTcZvvlFH//NYz5B0fQ==
X-Received: by 10.84.172.131 with SMTP id n3mr20548914plb.14.1499733806821;
 Mon, 10 Jul 2017 17:43:26 -0700 (PDT)
Received: from pewter.svl.corp.google.com ([100.123.242.121])
 by smtp.gmail.com with ESMTPSA id k194sm21956146pgc.31.2017.07.10.17.43.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 10 Jul 2017 17:43:25 -0700 (PDT)
From: Xo Wang <xow@google.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux 1/4] HWMon Driver for Intersil ISL68137 PWM Controller
Date: Mon, 10 Jul 2017 17:42:58 -0700
Message-Id: <20170711004301.10515-2-xow@google.com>
X-Mailer: git-send-email 2.13.2.725.g09c95d1e9-goog
In-Reply-To: <20170711004301.10515-1-xow@google.com>
References: <20170711004301.10515-1-xow@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Tue, 11 Jul 2017 00:43:30 -0000

From: Maxim Sloyko <maxims@google.com>

Signed-off-by: Maxim Sloyko <maxims@google.com>
---
 drivers/hwmon/pmbus/Kconfig    | 10 +++++
 drivers/hwmon/pmbus/Makefile   |  1 +
 drivers/hwmon/pmbus/isl68137.c | 86 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 97 insertions(+)
 create mode 100644 drivers/hwmon/pmbus/isl68137.c

diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 68d717a3fd59..e4f101e0c504 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -47,6 +47,16 @@ config SENSORS_IR35221
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
 	default n
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index 75bb7ca619d9..252048a8985a 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -6,6 +6,7 @@ obj-$(CONFIG_PMBUS)		+= pmbus_core.o
 obj-$(CONFIG_SENSORS_PMBUS)	+= pmbus.o
 obj-$(CONFIG_SENSORS_ADM1275)	+= adm1275.o
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
2.13.2.725.g09c95d1e9-goog
