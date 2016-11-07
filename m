Return-Path: <eajames.ibm@gmail.com>
Received: from mail-it0-x242.google.com (mail-it0-x242.google.com
 [IPv6:2607:f8b0:4001:c0b::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tCSwn6fQ3zDvQ3
 for <openbmc@lists.ozlabs.org>; Tue,  8 Nov 2016 10:15:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="neGDOw/U"; 
 dkim-atps=neutral
Received: by mail-it0-x242.google.com with SMTP id n68so4943094itn.3
 for <openbmc@lists.ozlabs.org>; Mon, 07 Nov 2016 15:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id;
 bh=L/WHvtYSdSGk26T7ef3TdWwDvFjvq03GEuWbuw+cW98=;
 b=neGDOw/Urjz3DNkRS+CNYvdPpuNNYCfyoSS9t8XKvtedA4E2YKfk9ODmnNYnZt4h51
 tAoXtLJBNnso+ADqNXq0NxMkBM+5xllc7qjxAW8mHC8hGo+47SbErr2cfeb48k1UaHJv
 t9iHG3GCdtVNnIxd/d6qljyUp0ObOmJz8Dk5sOIgfzDUtRfAxo1HTE7l9QT6XqHshG6B
 T8HhjH/omFITcK2PkOMfz8FA193mTYA6OWfOdnkW+dVgK9tIQHtv7cqNlCRG/2Rn1t4g
 hxvPG4ANk7klqOz/EFJnLVjq1tPxU8THjXA9HQ5hUbf5ZuGa5x00SkTgGCr91AEZKivi
 fItQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=L/WHvtYSdSGk26T7ef3TdWwDvFjvq03GEuWbuw+cW98=;
 b=WvZCrdyRuLZX4Wu9U1KExQ73aITWUZKhrO0bhVKfyxPDRQmZoDWaQ5xkYAQL6krJRE
 bVM16SMj42rMXGELQ87LTd0IVQTNTgeJ74XbSwdXjO7n2E4Wwpznn2kGXIcVH7tUXdja
 1va4bt11QsR1WYWyrSC3lUPr59Pdp04sndePZiDqsjE0lZRIE79lAt0wmbhJqFZHU3fj
 aKf0X3ly4X16K29oqfAe2S3CpYvfqFvBfJFyS3KqIvphxCciTuUJyv8DcxoHUG5WMHDv
 Vc8C0srHYOt+FEfxLgHZUkdaUfEmAZq2Oa0+WP3N3Cpjqkb6Cgs7Hx9P+7f67xqJBVrD
 y38A==
X-Gm-Message-State: ABUngveTOYqCFp1uwUqLNyau+Ur0LcM6PLHVcN50fh/JOa3dFzj3Wnh7Njnms8FgoRcJUQ==
X-Received: by 10.107.164.4 with SMTP id n4mr1357814ioe.216.1478560551710;
 Mon, 07 Nov 2016 15:15:51 -0800 (PST)
Received: from eajames-austin-w350.austin.ibm.com ([32.97.110.57])
 by smtp.gmail.com with ESMTPSA id c9sm11037843ioc.37.2016.11.07.15.15.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 07 Nov 2016 15:15:50 -0800 (PST)
From: eajames.ibm@gmail.com
To: openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux v5 2/5] drivers: Add hwmon occ driver framework
Date: Mon,  7 Nov 2016 17:15:41 -0600
Message-Id: <1478560541-23950-1-git-send-email-eajames.ibm@gmail.com>
X-Mailer: git-send-email 1.9.1
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
X-List-Received-Date: Mon, 07 Nov 2016 23:15:54 -0000

From: "Edward A. James" <eajames@us.ibm.com>

create i2c layer for accessing OCC over i2c bus
create p8 and p9 specific layers for different OCC versions

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 .../devicetree/bindings/i2c/i2c-ibm-occ.txt        | 13 ++++
 drivers/hwmon/Kconfig                              |  2 +
 drivers/hwmon/Makefile                             |  1 +
 drivers/hwmon/occ/Kconfig                          | 15 +++++
 drivers/hwmon/occ/Makefile                         |  1 +
 drivers/hwmon/occ/occ.c                            | 45 +++++++++++++
 drivers/hwmon/occ/occ.h                            | 28 ++++++++
 drivers/hwmon/occ/occ_i2c.c                        | 77 ++++++++++++++++++++++
 drivers/hwmon/occ/p8.c                             | 39 +++++++++++
 drivers/hwmon/occ/p8.h                             | 27 ++++++++
 drivers/hwmon/occ/p9.c                             | 39 +++++++++++
 drivers/hwmon/occ/p9.h                             | 27 ++++++++
 12 files changed, 314 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-ibm-occ.txt
 create mode 100644 drivers/hwmon/occ/Kconfig
 create mode 100644 drivers/hwmon/occ/Makefile
 create mode 100644 drivers/hwmon/occ/occ.c
 create mode 100644 drivers/hwmon/occ/occ.h
 create mode 100644 drivers/hwmon/occ/occ_i2c.c
 create mode 100644 drivers/hwmon/occ/p8.c
 create mode 100644 drivers/hwmon/occ/p8.h
 create mode 100644 drivers/hwmon/occ/p9.c
 create mode 100644 drivers/hwmon/occ/p9.h

diff --git a/Documentation/devicetree/bindings/i2c/i2c-ibm-occ.txt b/Documentation/devicetree/bindings/i2c/i2c-ibm-occ.txt
new file mode 100644
index 0000000..7d73dd6
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/i2c-ibm-occ.txt
@@ -0,0 +1,13 @@
+HWMON i2c driver for IBM POWER CPU OCC (On Chip Controller)
+
+Required properties:
+ - compatible: must be "ibm,occ-i2c"
+ - reg: physical address
+
+Example:
+i2c3: i2c-bus@100 {
+	occ@50 {
+		compatible = "ibm,occ-i2c";
+		reg = <0x50>;
+	};
+};
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 367496c..f4b0180 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1226,6 +1226,8 @@ config SENSORS_NSA320
 	  This driver can also be built as a module. If so, the module
 	  will be called nsa320-hwmon.
 
+source drivers/hwmon/occ/Kconfig
+
 config SENSORS_PCF8591
 	tristate "Philips PCF8591 ADC/DAC"
 	depends on I2C
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index d7ccb02..ab1c121 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -165,6 +165,7 @@ obj-$(CONFIG_SENSORS_WM831X)	+= wm831x-hwmon.o
 obj-$(CONFIG_SENSORS_WM8350)	+= wm8350-hwmon.o
 
 obj-$(CONFIG_PMBUS)		+= pmbus/
+obj-$(CONFIG_OCC)		+= occ/
 
 ccflags-$(CONFIG_HWMON_DEBUG_CHIP) := -DDEBUG
 
diff --git a/drivers/hwmon/occ/Kconfig b/drivers/hwmon/occ/Kconfig
new file mode 100644
index 0000000..628fd6e
--- /dev/null
+++ b/drivers/hwmon/occ/Kconfig
@@ -0,0 +1,15 @@
+#
+# On Chip Controller configuration
+#
+
+config OCC
+	tristate "On Chip Controller driver"
+	help
+	  If you say yes here you get support to monitor Power CPU
+	  sensors via the On Chip Controller (OCC).
+
+	  Generally this is used by management controllers such as a BMC
+	  on an OpenPower system.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called occ.
diff --git a/drivers/hwmon/occ/Makefile b/drivers/hwmon/occ/Makefile
new file mode 100644
index 0000000..87c191a
--- /dev/null
+++ b/drivers/hwmon/occ/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_OCC) += occ.o occ_i2c.o p8.o p9.o
diff --git a/drivers/hwmon/occ/occ.c b/drivers/hwmon/occ/occ.c
new file mode 100644
index 0000000..4969915
--- /dev/null
+++ b/drivers/hwmon/occ/occ.c
@@ -0,0 +1,45 @@
+/*
+ * occ.c - OCC hwmon driver
+ *
+ * This file contains the methods and data structures for the OCC hwmon driver.
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
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/slab.h>
+#include <linux/jiffies.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/err.h>
+#include <linux/mutex.h>
+#include <linux/delay.h>
+#include <linux/kernel.h>
+#include <linux/device.h>
+
+#include "occ.h"
+
+int occ_start(struct device *dev)
+{
+	return 0;
+}
+
+int occ_stop(struct device *dev)
+{
+	return 0;
+}
+
+MODULE_AUTHOR("Eddie James <eajames@us.ibm.com>");
+MODULE_DESCRIPTION("BMC OCC hwmon driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/hwmon/occ/occ.h b/drivers/hwmon/occ/occ.h
new file mode 100644
index 0000000..736d3b9
--- /dev/null
+++ b/drivers/hwmon/occ/occ.h
@@ -0,0 +1,28 @@
+/*
+ * occ.h - hwmon OCC driver
+ *
+ * This file contains data structures and function prototypes for common access
+ * between different bus protocols and host systems.
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
+#ifndef __OCC_H__
+#define __OCC_H__
+
+struct device;
+
+int occ_start(struct device *dev);
+int occ_stop(struct device *dev);
+
+#endif /* __OCC_H__ */
diff --git a/drivers/hwmon/occ/occ_i2c.c b/drivers/hwmon/occ/occ_i2c.c
new file mode 100644
index 0000000..7659ea1
--- /dev/null
+++ b/drivers/hwmon/occ/occ_i2c.c
@@ -0,0 +1,77 @@
+/*
+ * occ_i2c.c - hwmon OCC driver
+ *
+ * This file contains the i2c layer for accessing the OCC over i2c bus.
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
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/slab.h>
+#include <linux/i2c.h>
+#include <linux/err.h>
+#include <linux/of.h>
+#include <linux/kernel.h>
+#include <linux/device.h>
+
+#include "p8.h"
+
+#define OCC_I2C_NAME	"occ-p8-i2c"
+
+static int occ_i2c_probe(struct i2c_client *client,
+			 const struct i2c_device_id *id)
+{
+	return p8_occ_start(&client->dev);
+}
+
+static int occ_i2c_remove(struct i2c_client *client)
+{
+	return p8_occ_stop(&client->dev);
+}
+
+/* used by old-style board info. */
+static const struct i2c_device_id occ_ids[] = {
+	{ OCC_I2C_NAME, 0 },
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, occ_ids);
+
+/* used by device table */
+static const struct of_device_id occ_of_match[] = {
+	{ .compatible = "ibm,occ-i2c" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, occ_of_match);
+
+/*
+ * i2c-core uses i2c-detect() to detect device in below address list.
+ * If exists, address will be assigned to client.
+ * It is also possible to read address from device table.
+ */
+static const unsigned short normal_i2c[] = {0x50, 0x51, I2C_CLIENT_END };
+
+static struct i2c_driver occ_i2c_driver = {
+	.class = I2C_CLASS_HWMON,
+	.driver = {
+		.name = OCC_I2C_NAME,
+		.pm = NULL,
+		.of_match_table = occ_of_match,
+	},
+	.probe = occ_i2c_probe,
+	.remove = occ_i2c_remove,
+	.id_table = occ_ids,
+	.address_list = normal_i2c,
+};
+
+module_i2c_driver(occ_i2c_driver);
diff --git a/drivers/hwmon/occ/p8.c b/drivers/hwmon/occ/p8.c
new file mode 100644
index 0000000..6d854bc
--- /dev/null
+++ b/drivers/hwmon/occ/p8.c
@@ -0,0 +1,39 @@
+/*
+ * p8.c - OCC hwmon driver
+ *
+ * This file contains the Power8-specific methods and data structures for
+ * the OCC hwmon driver.
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
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/slab.h>
+#include <linux/err.h>
+#include <linux/of.h>
+#include <linux/kernel.h>
+#include <linux/device.h>
+#include <linux/platform_device.h>
+
+#include "occ.h"
+
+int p8_occ_start(struct device *dev)
+{
+	return occ_start(dev);
+}
+
+int p8_occ_stop(struct device *dev)
+{
+	return occ_stop(dev);
+}
diff --git a/drivers/hwmon/occ/p8.h b/drivers/hwmon/occ/p8.h
new file mode 100644
index 0000000..e6941e4
--- /dev/null
+++ b/drivers/hwmon/occ/p8.h
@@ -0,0 +1,27 @@
+/*
+ * p8.h - OCC hwmon driver
+ *
+ * This file contains Power8-specific function prototypes
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
+#ifndef __P8_H__
+#define __P8_H__
+
+struct device;
+
+int p8_occ_start(struct device *dev);
+int p8_occ_stop(struct device *dev);
+
+#endif /* __P8_H__ */
diff --git a/drivers/hwmon/occ/p9.c b/drivers/hwmon/occ/p9.c
new file mode 100644
index 0000000..065d9bb
--- /dev/null
+++ b/drivers/hwmon/occ/p9.c
@@ -0,0 +1,39 @@
+/*
+ * p9.c - OCC hwmon driver
+ *
+ * This file contains the Power9-specific methods and data structures for
+ * the OCC hwmon driver.
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
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/slab.h>
+#include <linux/i2c.h>
+#include <linux/err.h>
+#include <linux/of.h>
+#include <linux/kernel.h>
+#include <linux/device.h>
+
+#include "occ.h"
+
+int p9_occ_start(struct device *dev)
+{
+	return occ_start(dev);
+}
+
+int p9_occ_stop(struct device *dev)
+{
+	return occ_stop(dev);
+}
diff --git a/drivers/hwmon/occ/p9.h b/drivers/hwmon/occ/p9.h
new file mode 100644
index 0000000..62fe95a
--- /dev/null
+++ b/drivers/hwmon/occ/p9.h
@@ -0,0 +1,27 @@
+/*
+ * p9.h - OCC hwmon driver
+ *
+ * This file contains Power9-specific function prototypes
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
+#ifndef __P9_H__
+#define __P9_H__
+
+struct device;
+
+int p9_occ_start(struct device *dev);
+int p9_occ_stop(struct device *dev);
+
+#endif /* __P9_H__ */
-- 
1.9.1
