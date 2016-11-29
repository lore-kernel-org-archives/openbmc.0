Return-Path: <eajames.ibm@gmail.com>
Received: from mail-qt0-x244.google.com (mail-qt0-x244.google.com
 [IPv6:2607:f8b0:400d:c0d::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tSzcc4L2pzDvw6
 for <openbmc@lists.ozlabs.org>; Wed, 30 Nov 2016 10:03:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="FvralyyA"; 
 dkim-atps=neutral
Received: by mail-qt0-x244.google.com with SMTP id n34so17532897qtb.3
 for <openbmc@lists.ozlabs.org>; Tue, 29 Nov 2016 15:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id;
 bh=8G8yoXtrAkuTQN2AwvXNK+JsHtsVgk2yLwDiLz3dEuY=;
 b=FvralyyAajpU0pwYzumsc181QZi8gMkFCvG7sfnnzxMNtACZhAfKsMSoa1Be42UxF3
 CroXo2Lv9qX+LtaqpJOyZtLusQ9hEmqxRrleLtsPFfjBDyO7L43/lx1MjGtPZr+JRZNn
 DM6AYP+Flu4TNbINOgeV4lj/2kaXgP7cEaj/FSzu5GzDQGR9hwr2UfAmCOEJv6ph0osh
 un6j/6L9oUpr72kcLoMU95Y0ILmJ2HPkpSeq0YFfJ3ff3U9s/wKfuYvNsYRjXWz+e9QA
 ZaDLFBX1zuOI+Au4NRpMzvoKkGejizEscPPkKE+LrAVjJ8U0pushSuuPQvaSX+93TxXC
 eFBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=8G8yoXtrAkuTQN2AwvXNK+JsHtsVgk2yLwDiLz3dEuY=;
 b=SMqN/F+ApU6vkk+Gj463nJr9ceZJ6sn3i+cYocG5dFclH79AW3mpcQ3T+evvLI/Sys
 AQEmY5ov683k1PBPJGQEQ96EHzPIFspW0x2WAKurO1pwkBRpevv90vCl34Z1o4mXz2P3
 /RVP64jf1U36feF62CoMAsIz46zJ06vYBxyub1Zc+dnzJ8RfhnwJJ+pHvkSuVQ8NbUHP
 7LzoCWxNbZ/sN4kRbTdyxt/aTh7DUkILflOF/wc0ldWOn+W2OHgPRXFKhU0PYvEeLn8+
 cdWEeNPeAQF2EFmUfs7VV2qMXoXu0KOEz4xLntS/oZpb4xE1eVg3gct6PkE1ToYnp9Yf
 fOIA==
X-Gm-Message-State: AKaTC02wdHRv9KqoQjbE4vJJQKy31L3t5G1npx3kgQe/0u2B6yvfG09R+zpToEVXu5IIKQ==
X-Received: by 10.237.62.209 with SMTP id o17mr26563251qtf.190.1480460622313; 
 Tue, 29 Nov 2016 15:03:42 -0800 (PST)
Received: from eajames-austin-w350.austin.ibm.com ([32.97.110.52])
 by smtp.gmail.com with ESMTPSA id w8sm32016267qta.25.2016.11.29.15.03.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 29 Nov 2016 15:03:41 -0800 (PST)
From: eajames.ibm@gmail.com
To: openbmc@lists.ozlabs.org
Cc: andrew@aj.id.au,
	joel@jms.id.au,
	"Edward A. James" <eajames@us.ibm.com>
Subject: [RFC PATCH linux v6 4/9] hwmon: occ: Add I2C SCOM transport
 implementation
Date: Tue, 29 Nov 2016 17:03:35 -0600
Message-Id: <1480460615-28732-1-git-send-email-eajames.ibm@gmail.com>
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
X-List-Received-Date: Tue, 29 Nov 2016 23:03:45 -0000

From: "Edward A. James" <eajames@us.ibm.com>

The BMC queries the OCC on POWER8 chips with SCOMs over I2C.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/occ/occ_scom_i2c.c | 68 ++++++++++++++++++++++++++++++++++++++++
 drivers/hwmon/occ/occ_scom_i2c.h | 20 ++++++++++++
 2 files changed, 88 insertions(+)
 create mode 100644 drivers/hwmon/occ/occ_scom_i2c.c
 create mode 100644 drivers/hwmon/occ/occ_scom_i2c.h

diff --git a/drivers/hwmon/occ/occ_scom_i2c.c b/drivers/hwmon/occ/occ_scom_i2c.c
new file mode 100644
index 0000000..e1bb363
--- /dev/null
+++ b/drivers/hwmon/occ/occ_scom_i2c.c
@@ -0,0 +1,68 @@
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
+#include <linux/i2c.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+
+#include "scom.h"
+#include "occ_scom_i2c.h"
+
+#define OCC_I2C_NAME   "occ-p8-i2c"
+
+int occ_i2c_getscom(void *bus, u32 address, u8 *data, size_t offset)
+{
+       ssize_t rc;
+       u64 buf;
+       struct i2c_client *client = bus;
+
+       rc = i2c_master_send(client, (const char *)&address, sizeof(u32));
+       if (rc != sizeof(u32))
+               return -SCOM_WRITE_ERROR;
+
+       rc = i2c_master_recv(client, (char *)&buf, sizeof(u64));
+       if (rc != sizeof(u64))
+               return -SCOM_READ_ERROR;
+
+       *((u64 *)&data[offset]) = be64_to_cpu(buf);
+
+       return 0;
+}
+EXPORT_SYMBOL(occ_i2c_getscom);
+
+int occ_i2c_putscom(void *bus, u32 address, u32 data0, u32 data1)
+{
+       u32 buf[3];
+       ssize_t rc;
+       struct i2c_client *client = bus;
+
+       buf[0] = address;
+       buf[1] = data1;
+       buf[2] = data0;
+
+       rc = i2c_master_send(client, (const char *)buf, sizeof(u32) * 3);
+       if (rc != sizeof(u32) * 3)
+               return -SCOM_WRITE_ERROR;
+
+       return 0;
+}
+EXPORT_SYMBOL(occ_i2c_putscom);
+
+MODULE_AUTHOR("Eddie James <eajames@us.ibm.com>");
+MODULE_DESCRIPTION("I2C OCC SCOM transport");
+MODULE_LICENSE("GPL");
diff --git a/drivers/hwmon/occ/occ_scom_i2c.h b/drivers/hwmon/occ/occ_scom_i2c.h
new file mode 100644
index 0000000..92225f4
--- /dev/null
+++ b/drivers/hwmon/occ/occ_scom_i2c.h
@@ -0,0 +1,20 @@
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
+int occ_i2c_getscom(void *bus, u32 address, u8 *data, size_t offset);
+int occ_i2c_putscom(void *bus, u32 address, u32 data0, u32 data1);
-- 
1.9.1
