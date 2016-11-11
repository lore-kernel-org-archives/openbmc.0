Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tFRNr2Q2yzDvp1
 for <openbmc@lists.ozlabs.org>; Fri, 11 Nov 2016 15:13:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="RDMEYTrk"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="m/uN5Mt3"; dkim-atps=neutral
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 4FBEB214F5;
 Thu, 10 Nov 2016 23:13:30 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute5.internal (MEProxy); Thu, 10 Nov 2016 23:13:30 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:in-reply-to:message-id:references
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=olSIAsGoDBQEj7H2P5umsvVMdTk=; b=RDMEYT
 rk/LFt4MBKmaccO1wWQsBSo/icfIb1dhRhxI6Ws4Q4Nr45pjR7ix9u4xPiSAdnfT
 Mcztj6dBnZOnU9QPAT2kZD+Df4wDJwFzIgQlBi9R1+2Mm/xPDcCpOq0C0JRjrRKo
 CIoCFjz65OQKvHgyMEV10GIYZ9m1JwwbLqrPI=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:in-reply-to
 :message-id:references:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=olSIAsGoDBQEj7
 H2P5umsvVMdTk=; b=m/uN5Mt3gZY15QNGp4DTh69BJt4DqYbhKzZVWwMjVqOs2r
 4br1PrsK0mBg1vOef3h6g1gtHY0D9JklGoPz2QOBfqFpmGBtBG+iKEpvHoc9Hfcm
 xYHUZbQ0I6gYLNiVOm7T6dzrkYIR17pF409Oor5lVgcxNvqRh/lYbWh4+05po=
X-ME-Sender: <xms:akUlWLdcesa7UyMElxXEMGKlJRHclGZV01OjpQxm1S6qAcg9K5pKDw>
X-Sasl-enc: LDkKAp3LNwgL4mc54rh/+4L6VPogkqKHUG/5zRPKmRMF 1478837609
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id D91377F06F;
 Thu, 10 Nov 2016 23:13:27 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: eajames.ibm@gmail.com,
	Joel Stanley <joel@jms.id.au>
Cc: "Edward A . James" <eajames@us.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [RFC PATCH linux 4/9] hwmon: occ: Add I2C SCOM transport
 implementation
Date: Fri, 11 Nov 2016 14:42:11 +1030
Message-Id: <f9d045f67c7c79bbe7299cffd829d0848154a46c.1478835488.git.andrew@aj.id.au>
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
X-List-Received-Date: Fri, 11 Nov 2016 04:13:32 -0000

The BMC queries the OCC on POWER8 chips with SCOMs over I2C.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/hwmon/occ/occ_scom_i2c.c | 68 ++++++++++++++++++++++++++++++++++++++++
 drivers/hwmon/occ/occ_scom_i2c.h | 20 ++++++++++++
 2 files changed, 88 insertions(+)
 create mode 100644 drivers/hwmon/occ/occ_scom_i2c.c
 create mode 100644 drivers/hwmon/occ/occ_scom_i2c.h

diff --git a/drivers/hwmon/occ/occ_scom_i2c.c b/drivers/hwmon/occ/occ_scom_i2c.c
new file mode 100644
index 000000000000..b1a060331c4a
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
+#define OCC_I2C_NAME	"occ-p8-i2c"
+
+int occ_i2c_getscom(void *bus, u32 address, u8 *data, size_t offset)
+{
+	ssize_t rc;
+	u64 buf;
+	struct i2c_client *client = bus;
+
+	rc = i2c_master_send(client, (const char *)&address, sizeof(u32));
+	if (rc != sizeof(u32))
+		return -SCOM_WRITE_ERROR;
+
+	rc = i2c_master_recv(client, (char *)&buf, sizeof(u64));
+	if (rc != sizeof(u64))
+		return -SCOM_READ_ERROR;
+
+	*((u64 *)&data[offset]) = be64_to_cpu(buf);
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
+		return -SCOM_WRITE_ERROR;
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
index 000000000000..92225f4cd584
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
2.9.3
