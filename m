Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tFRP76LH6zDvns
 for <openbmc@lists.ozlabs.org>; Fri, 11 Nov 2016 15:13:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="KfL1oIJE"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="qz5qDGFe"; dkim-atps=neutral
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id D964920D1A;
 Thu, 10 Nov 2016 23:13:45 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute5.internal (MEProxy); Thu, 10 Nov 2016 23:13:45 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:in-reply-to:message-id:references
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=Zb4td7NO3FJOZyNkUO36tby9zVM=; b=KfL1oI
 JEc1JFFCuidOyg3Mx5f64HueKrN3mlLSI+yyORLjdwT074Xd2yP2iZJv+gUUgfGE
 mcSCKVsNRZt8ZPURAUM0A//WQBG6vhPw0/BZ16JihvLhR98kXPVBM2HM5pck1tMd
 2HnVr7WYZloW7DMqPipiopN8r+mMNqCbzK/rs=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:in-reply-to
 :message-id:references:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=Zb4td7NO3FJOZy
 NkUO36tby9zVM=; b=qz5qDGFeIGL49/lpyHr0fYMW23i3fLHPX8Y7AHIoBjti5m
 MIrnHLwm9cmadOWYvZfpnZFey1ZLeyuIAlIzNT8SQleIcg7ETmtRyqoouocPRmbf
 nHbg/NaYV3VF5HbRrl3JFf0BrNEKiT0Ak1T+0uxK3noe69vCUjorxsK2jgIAQ=
X-ME-Sender: <xms:eUUlWH7s7f0gHATjm7ahzMtdWbW3vtBXUq6kYAKmNNB_vTniqFvfdA>
X-Sasl-enc: yLthgfPxWFN5vi/QXjPd65diTHFzSBEa7jKGJ30Oh1gk 1478837625
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7A98F7F079;
 Thu, 10 Nov 2016 23:13:43 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: eajames.ibm@gmail.com,
	Joel Stanley <joel@jms.id.au>
Cc: "Edward A . James" <eajames@us.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [RFC PATCH linux 9/9] wip: hwmon: occ: Add sketch of the hwmon
 implementation for the P9 OCC
Date: Fri, 11 Nov 2016 14:42:16 +1030
Message-Id: <89c567400dbd58b02a90720004eacb27d5c58ed1.1478835488.git.andrew@aj.id.au>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1478835488.git.andrew@aj.id.au>
References: <cover.1478835488.git.andrew@aj.id.au>
In-Reply-To: <cover.1478835488.git.andrew@aj.id.au>
References: <1478560512-23791-1-git-send-email-eajames.ibm@gmail.com>
 <cover.1478835488.git.andrew@aj.id.au>
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
X-List-Received-Date: Fri, 11 Nov 2016 04:13:48 -0000

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/hwmon/occ/Kconfig      |  9 ++++
 drivers/hwmon/occ/Makefile     |  1 +
 drivers/hwmon/occ/occ_p9_fsi.c | 93 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 103 insertions(+)
 create mode 100644 drivers/hwmon/occ/occ_p9_fsi.c

diff --git a/drivers/hwmon/occ/Kconfig b/drivers/hwmon/occ/Kconfig
index 085e1f370c42..97b97b391bf9 100644
--- a/drivers/hwmon/occ/Kconfig
+++ b/drivers/hwmon/occ/Kconfig
@@ -26,4 +26,13 @@ config SENSORS_PPC_OCC_P8_I2C
 	  This driver can also be built as a module. If so, the module will be
 	  called occ-p8-i2c.
 
+config SENSORS_PPC_OCC_P9_FSI
+	tristate "POWER9 OCC hwmon support"
+	help
+	  Provide a hwmon sysfs interface for the POWER9 On-Chip Controller,
+	  exposing temperature, frequency and power measurements.
+
+	  This driver can also be built as a module. If so, the module will be
+	  called occ-p9-fsi.
+
 endif
diff --git a/drivers/hwmon/occ/Makefile b/drivers/hwmon/occ/Makefile
index 05a84e987127..77e47e10195e 100644
--- a/drivers/hwmon/occ/Makefile
+++ b/drivers/hwmon/occ/Makefile
@@ -1,2 +1,3 @@
 obj-$(CONFIG_SENSORS_PPC_OCC) += occ.o occ_sysfs.o
 obj-$(CONFIG_SENSORS_PPC_OCC_P8_I2C) += occ_scom_i2c.o occ_p8.o occ_p8_i2c.o
+obj-$(CONFIG_SENSORS_PPC_OCC_P9_FSI) += occ_p9.o occ_p9_fsi.o
diff --git a/drivers/hwmon/occ/occ_p9_fsi.c b/drivers/hwmon/occ/occ_p9_fsi.c
new file mode 100644
index 000000000000..2f651d1b16bf
--- /dev/null
+++ b/drivers/hwmon/occ/occ_p9_fsi.c
@@ -0,0 +1,93 @@
+/*
+ * occ_p9_fsi.c - hwmon OCC driver
+ *
+ * Copyright 2016 IBM Corp.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/err.h>
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/slab.h>
+#include <linux/err.h>
+#include <linux/of.h>
+#include <linux/kernel.h>
+#include <linux/device.h>
+
+#include "scom.h"
+#include "occ_p9.h"
+#include "occ_sysfs.h"
+
+#define OCC_I2C_NAME	"occ-p9-fsi"
+
+static char *caps_sensor_names[] = {
+	"curr_powercap",
+	"curr_powerreading",
+	"norm_powercap",
+	"max_powercap",
+	"min_powercap",
+	"user_powerlimit"
+};
+
+int p9_fsi_getscom(void *bus, u32 address, u8 *data, size_t offset)
+{
+	return -SCOM_READ_ERROR;
+}
+
+int p9_fsi_putscom(void *bus, u32 address, u32 data0, u32 data1)
+{
+	return -SCOM_WRITE_ERROR;
+}
+
+static struct occ_bus_ops p9_bus_ops = {
+	.getscom = p9_fsi_getscom,
+	.putscom = p9_fsi_putscom,
+};
+
+static struct occ_sysfs_config p9_sysfs_config = {
+	.num_caps_fields = ARRAY_SIZE(caps_sensor_names),
+	.caps_names = caps_sensor_names,
+};
+
+int occ_p9_probe(struct device *dev, void *client)
+{
+	struct occ *occ;
+	struct occ_sysfs *hwmon;
+
+	occ = occ_p9_start(dev, client, p9_bus_ops);
+	if (IS_ERR(occ))
+		return PTR_ERR(occ);
+
+	hwmon = occ_sysfs_start(dev, occ, &p9_sysfs_config);
+	if (IS_ERR(hwmon))
+		return PTR_ERR(hwmon);
+
+	return 0;
+}
+
+int occ_p9_remove(void)
+{
+	struct occ *occ = NULL;
+
+	return occ_p9_stop(occ);
+}
+
+/* used by device table */
+static const struct of_device_id occ_of_match[] = {
+	{ .compatible = "ibm,occ-p9-fsi" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, occ_of_match);
+
+MODULE_AUTHOR("Eddie James <eajames@us.ibm.com>");
+MODULE_DESCRIPTION("BMC P9 OCC hwmon driver");
+MODULE_LICENSE("GPL");
-- 
2.9.3
