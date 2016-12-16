Return-Path: <eajames.ibm@gmail.com>
Received: from mail-io0-x243.google.com (mail-io0-x243.google.com
 [IPv6:2607:f8b0:4001:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tgMWh2JNdzDrPL
 for <openbmc@lists.ozlabs.org>; Sat, 17 Dec 2016 07:35:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="FMvlS47n"; 
 dkim-atps=neutral
Received: by mail-io0-x243.google.com with SMTP id p13so13143303ioi.0
 for <openbmc@lists.ozlabs.org>; Fri, 16 Dec 2016 12:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=AygQPmVIulEjnaXBG2DT7A/48UZa9deEAplCifh4Sg8=;
 b=FMvlS47nVZMFexaUbPUzsU3ZO8i0DvbqlsaU3+6+lZzzWDW7R+LO1d+xRuhooTjMTE
 73R5x8cBEjO876TyRf8YErr1xlJXxKhPJeKChBsD92AdKmh7IPHaBzheVmxoQo6SfKIs
 6EdAwahLFnnh7wpItEJbw9LH5j71Dr3UGIhlEa2peSp3V/REJydYNk7EkKsqz4xsJL5l
 LJHbadmdYEbJ6wsoqbIIUHE7GeSRHLCSuOt1mYGOvSZLQcK+u8+tOCanCG/gNE1SDBq4
 gf1BA+MB4gnUmy3Bx/UwpydefuDBXypxNILYTfkdcWL6P4SsEoTYBc9UFoZM2nPGj3BG
 tLAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=AygQPmVIulEjnaXBG2DT7A/48UZa9deEAplCifh4Sg8=;
 b=IjnoTQYQ2YhOFZipubsL4VXsbcObL69O0ly9Ehb2xjTlaulkB9eExVtf77AXU01rVb
 XepGYbBt5PT49hTh++VXqLh37QsstPwP4yJY0IDKYLTFJ2jUraqTCvPlcvgEsAON9EHz
 t+y3any/A0IaQt4SeztmfqMBbGPKGauKDxp1DbgVDW03f+w3Cn57TGyRPptMdY7crFYt
 56N+alsz0jBLEXXplwAfoUxc4p6r0ECGzyAdLjLD8fqmE0dAujVSzcgtKArzYJXMZ4jb
 IwSI+MtIZFvoSmqG2Hte9IlPT9fboM9DEyFWOOqAm0dRTN/EXorEZDVgA0kRvq8+dp46
 Aekw==
X-Gm-Message-State: AIkVDXLGHGfZog5aiprjvyiTcsqF8XX39umNAa33nsk3n7G5xcNZEQsRlBtEI33N36Ellg==
X-Received: by 10.107.50.75 with SMTP id y72mr5442396ioy.22.1481920525670;
 Fri, 16 Dec 2016 12:35:25 -0800 (PST)
Received: from eajames-austin-w350.austin.ibm.com ([32.97.110.57])
 by smtp.gmail.com with ESMTPSA id p77sm3292860iod.35.2016.12.16.12.35.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 16 Dec 2016 12:35:24 -0800 (PST)
From: eajames.ibm@gmail.com
To: openbmc@lists.ozlabs.org
Cc: andrew@aj.id.au,
	joel@jms.id.au,
	"Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux 3/7] hwmon: occ: Add I2C transport implementation for
 SCOM operations
Date: Fri, 16 Dec 2016 14:35:19 -0600
Message-Id: <1481920519-6834-1-git-send-email-eajames.ibm@gmail.com>
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
X-List-Received-Date: Fri, 16 Dec 2016 20:35:28 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Add functions to send SCOM operations over I2C bus. The BMC can
communicate with the Power8 host processor over I2C, but needs to use SCOM
operations in order to access the OCC register space.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/hwmon/occ/occ_scom_i2c.c | 67 ++++++++++++++++++++++++++++++++++++++++
 drivers/hwmon/occ/occ_scom_i2c.h | 26 ++++++++++++++++
 2 files changed, 93 insertions(+)
 create mode 100644 drivers/hwmon/occ/occ_scom_i2c.c
 create mode 100644 drivers/hwmon/occ/occ_scom_i2c.h

diff --git a/drivers/hwmon/occ/occ_scom_i2c.c b/drivers/hwmon/occ/occ_scom_i2c.c
new file mode 100644
index 0000000..70e0f51
--- /dev/null
+++ b/drivers/hwmon/occ/occ_scom_i2c.c
@@ -0,0 +1,67 @@
+/*
+ * occ_scom_i2c.c - hwmon OCC driver
+ *
+ * This file contains the functions for performing SCOM operations over I2C bus
+ * to access the OCC.
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
+int occ_i2c_getscom(void *bus, u32 address, u8 *data)
+{
+	ssize_t rc;
+	u64 buf;
+	struct i2c_client *client = bus;
+
+	rc = i2c_master_send(client, (const char *)&address, sizeof(u32));
+	if (rc != sizeof(u32))
+		return -EIO;
+
+	rc = i2c_master_recv(client, (char *)&buf, sizeof(u64));
+	if (rc != sizeof(u64))
+		return -EIO;
+
+	*((u64 *)data) = be64_to_cpu(buf);
+
+	return 0;
+}
+EXPORT_SYMBOL(occ_i2c_getscom);
+
+int occ_i2c_putscom(void *bus, u32 address, u32 data0, u32 data1)
+{
+	u32 buf[3];
+	ssize_t rc;
+	struct i2c_client *client = bus;
+
+	buf[0] = address;
+	buf[1] = data1;
+	buf[2] = data0;
+
+	rc = i2c_master_send(client, (const char *)buf, sizeof(u32) * 3);
+	if (rc != sizeof(u32) * 3)
+		return -EIO;
+
+	return 0;
+}
+EXPORT_SYMBOL(occ_i2c_putscom);
+
+MODULE_AUTHOR("Eddie James <eajames@us.ibm.com>");
+MODULE_DESCRIPTION("I2C OCC SCOM transport");
+MODULE_LICENSE("GPL");
diff --git a/drivers/hwmon/occ/occ_scom_i2c.h b/drivers/hwmon/occ/occ_scom_i2c.h
new file mode 100644
index 0000000..204eb4f
--- /dev/null
+++ b/drivers/hwmon/occ/occ_scom_i2c.h
@@ -0,0 +1,26 @@
+/*
+ * occ_scom_i2c.h - hwmon OCC driver
+ *
+ * This file contains function protoypes for peforming SCOM operations over I2C
+ * bus to access the OCC.
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
+#ifndef __OCC_SCOM_I2C_H__
+#define __OCC_SCOM_I2C_H__
+
+int occ_i2c_getscom(void *bus, u32 address, u8 *data);
+int occ_i2c_putscom(void *bus, u32 address, u32 data0, u32 data1);
+
+#endif /* __OCC_SCOM_I2C_H__ */
-- 
1.9.1
