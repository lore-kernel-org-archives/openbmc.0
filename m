Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com
 [IPv6:2607:f8b0:4003:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t6WrD2dvtzDvNj
 for <openbmc@lists.ozlabs.org>; Mon, 31 Oct 2016 09:09:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=f+Bq50eX; 
 dkim-atps=neutral
Received: by mail-oi0-x243.google.com with SMTP id 62so5825258oif.1
 for <openbmc@lists.ozlabs.org>; Sun, 30 Oct 2016 15:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=K3fTJrdyzT7h+kStPLVUlg/ayQvOw8y3pGZvpxmcrrM=;
 b=f+Bq50eXk7u1PQKh+LnEWdJak3Sy0B07NpaSd3ymDwqzptF1+DXe3o9CJGnzLHE0TC
 AIPcsHcvmxpJK+ezkqrx/oixsiXlOCQGZbsOC6VfvZDRhlWA3JpI6iy2zKu1is7nWRDp
 wNwhWa0SmrXt3W4LptuJfhr8A2A9/p1Ec8IN9wZE7jFPzBrDF9VlaejfHod555gSfkcK
 CXXRaFqlztL3KaZk/eeWazSniS/AvUMamKzSDi9wFB/6Ss0Vr/2AggaJ5trMUQsMxLWA
 4cOZRyQdB2YOYccLBxQf43djmOxAAAC9WuUgQV+R3iObWQtO9M/Z2VrNZDoS3utoncWE
 4cNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=K3fTJrdyzT7h+kStPLVUlg/ayQvOw8y3pGZvpxmcrrM=;
 b=lyfx/mcS7UWc5t/eu9Fn1eDMMsVFU1i3M2xspKr9fluegqGTifhKzki+ev4dGaZp60
 jnjl+oLn9vzkObliuoouPgqgLRX9aeDlAQZEoKPyjlgCIzf82d8yIsuURmf8ieWDReKV
 Mx91cs8/l3qFrpqjQ6wR3iKyU/rWQeaMNxHZw/JyfQs6TWzx2caApP14tzpYSgIqrFlQ
 YGPHZsnOAVojZOUKfxmrfRICfzXMhEoGZI9HknhtLEOakZfGCzbKs1n2ClsxpCUUQbzr
 4iUU15CSPMrQ4j6h9INp50iL8vo1+gEgREerYcXHzw7x0Bpa92HJt5pjh0BLakoFGV1U
 lNbQ==
X-Gm-Message-State: ABUngvdeJpW1V1UuMygKS/rv2iFcGeLji6MSPrBKzKXUOfttQZkqGkMBCr/6pLfY49dqAA==
X-Received: by 10.202.84.86 with SMTP id i83mr24291196oib.114.1477865386604;
 Sun, 30 Oct 2016 15:09:46 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id q59sm7585484ota.20.2016.10.30.15.09.45
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sun, 30 Oct 2016 15:09:45 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH linux v6 01/18] fsi: Add empty fsi bus definitions
Date: Sun, 30 Oct 2016 17:09:03 -0500
Message-Id: <1477865379-11566-2-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailer: git-send-email 2.7.4 (Apple Git-66)
In-Reply-To: <1477865379-11566-1-git-send-email-christopher.lee.bostic@gmail.com>
References: <1477865379-11566-1-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Sun, 30 Oct 2016 22:09:48 -0000
X-List-Received-Date: Sun, 30 Oct 2016 22:09:48 -0000

From: Jeremy Kerr <jk@ozlabs.org>

This change adds the initial (empty) fsi bus definition, and introduces
drivers/fsi/.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 drivers/Kconfig        |  2 ++
 drivers/Makefile       |  1 +
 drivers/fsi/Kconfig    | 12 ++++++++++++
 drivers/fsi/Makefile   |  2 ++
 drivers/fsi/fsi-core.c | 38 ++++++++++++++++++++++++++++++++++++++
 include/linux/fsi.h    | 23 +++++++++++++++++++++++
 6 files changed, 78 insertions(+)
 create mode 100644 drivers/fsi/Kconfig
 create mode 100644 drivers/fsi/Makefile
 create mode 100644 drivers/fsi/fsi-core.c
 create mode 100644 include/linux/fsi.h

diff --git a/drivers/Kconfig b/drivers/Kconfig
index e1e2066..117ca14c 100644
--- a/drivers/Kconfig
+++ b/drivers/Kconfig
@@ -202,4 +202,6 @@ source "drivers/hwtracing/intel_th/Kconfig"
 
 source "drivers/fpga/Kconfig"
 
+source "drivers/fsi/Kconfig"
+
 endmenu
diff --git a/drivers/Makefile b/drivers/Makefile
index 0b6f3d6..7a1c96f 100644
--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -173,3 +173,4 @@ obj-$(CONFIG_STM)		+= hwtracing/stm/
 obj-$(CONFIG_ANDROID)		+= android/
 obj-$(CONFIG_NVMEM)		+= nvmem/
 obj-$(CONFIG_FPGA)		+= fpga/
+obj-$(CONFIG_FSI)		+= fsi/
diff --git a/drivers/fsi/Kconfig b/drivers/fsi/Kconfig
new file mode 100644
index 0000000..04c1a0e
--- /dev/null
+++ b/drivers/fsi/Kconfig
@@ -0,0 +1,12 @@
+#
+# FSI subsystem
+#
+
+menu "FSI support"
+
+config FSI
+	tristate "FSI support"
+	---help---
+	  FSI - the FRU Support Interface - is a simple bus for low-level
+	  access to POWER-based hardware.
+endmenu
diff --git a/drivers/fsi/Makefile b/drivers/fsi/Makefile
new file mode 100644
index 0000000..db0e5e7
--- /dev/null
+++ b/drivers/fsi/Makefile
@@ -0,0 +1,2 @@
+
+obj-$(CONFIG_FSI) += fsi-core.o
diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
new file mode 100644
index 0000000..3e45306
--- /dev/null
+++ b/drivers/fsi/fsi-core.c
@@ -0,0 +1,38 @@
+/*
+ * FSI core driver
+ *
+ * Copyright (C) IBM Corporation 2016
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/device.h>
+#include <linux/fsi.h>
+#include <linux/module.h>
+
+/* FSI core & Linux bus type definitions */
+
+struct bus_type fsi_bus_type = {
+	.name		= "fsi",
+};
+EXPORT_SYMBOL_GPL(fsi_bus_type);
+
+static int fsi_init(void)
+{
+	return bus_register(&fsi_bus_type);
+}
+
+static void fsi_exit(void)
+{
+	bus_unregister(&fsi_bus_type);
+}
+
+module_init(fsi_init);
+module_exit(fsi_exit);
diff --git a/include/linux/fsi.h b/include/linux/fsi.h
new file mode 100644
index 0000000..8e8bdea
--- /dev/null
+++ b/include/linux/fsi.h
@@ -0,0 +1,23 @@
+/*
+ * FSI device & driver interfaces
+ *
+ * Copyright (C) IBM Corporation 2016
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#ifndef LINUX_FSI_H
+#define LINUX_FSI_H
+
+#include <linux/device.h>
+
+extern struct bus_type fsi_bus_type;
+
+#endif /* LINUX_FSI_H */
-- 
1.8.2.2
