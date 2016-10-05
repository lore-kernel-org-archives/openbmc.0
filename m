Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sq7MC0lsYzDrPc
 for <openbmc@lists.ozlabs.org>; Thu,  6 Oct 2016 07:54:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=TRwJGn/Z; 
 dkim-atps=neutral
Received: by mail-oi0-x242.google.com with SMTP id r132so13011083oig.1
 for <openbmc@lists.ozlabs.org>; Wed, 05 Oct 2016 13:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=QmDxrh5KKGc7DHlY0IY0kBOGY89kSqep8NwHFnM9gk0=;
 b=TRwJGn/Zv5SJ8kh24GQdwM8ACpqSRdUZSCH+cyY/kpJy8pXP1qeOrbSM4xLZPGEDVE
 2nD6afga2MSkxnucXbRqApBN0kZzOeXda04GJDFW5N3Ab97dIJrd7nGGEd7ndlmaxBVr
 r5IaeA4wPvIZoOV9P+GwforFtIjqzIWzzS2v9JLMH5q+WEmtYiAVj/sEwh516QzTnzsV
 P28bjL6qJfRibGKYTLLSt7iKaiUrlOahM70wIF9OCjSiUQk48p1KZS6WkJ5BbKE2FcJ4
 50WEIpeI9qYgl632rTE5eriOuTe+aJwwcWyHUo/f3w4mkYG+tC+kKv0cU/bMrKuVtYfI
 gfFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=QmDxrh5KKGc7DHlY0IY0kBOGY89kSqep8NwHFnM9gk0=;
 b=gWi8wUOnReq986aN9nCqYOCo4ja/9HRVij2lx9ggH5RQZiEDvubmwYFB5piCKDenIi
 2J2KRMG1JCfowJ6uN1Tdgjo/u6edvO97K+H+qMPyZA8/bpEuLkLVZN7zrvhtebBGEWqR
 SBMNX4wrI7lgu2n2noFnHWGTjLmnVSIy+UvUTiLbYgCjUluYjzLs+lnTNoWp08OSWBf3
 dQlX7hzeB4DJg3eXUKjQPNA3aUGCaIhY9Gb97Sf83vumjgrXQUWIf8KieJBLtBaHwvAA
 92pq2S9IgJYnAWChPv81Znvw/0EKFwMq7nZxoUj6n/I+v48exsUJo/HnOciFt14fROH4
 uqXA==
X-Gm-Message-State: AA6/9RnqTQY4+7mLpRoZ/NJ4gyDpReg2L2kv8r0vsLzFA2lKUlrLJnxIQackiF2m15hnMQ==
X-Received: by 10.202.89.66 with SMTP id n63mr9808012oib.90.1475700885240;
 Wed, 05 Oct 2016 13:54:45 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id i18sm3206459oib.12.2016.10.05.13.54.44
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Wed, 05 Oct 2016 13:54:44 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Chris Bostic <cbostic@us.ibm.com>
Subject: [PATCH linux 15/15] drivers/fsi: Initialize CFAMs for read/write
 access
Date: Wed,  5 Oct 2016 15:54:28 -0500
Message-Id: <1475700868-75737-16-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailer: git-send-email 2.7.4 (Apple Git-66)
In-Reply-To: <1475700868-75737-1-git-send-email-christopher.lee.bostic@gmail.com>
References: <1475700868-75737-1-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Wed, 05 Oct 2016 20:54:48 -0000

From: Chris Bostic <cbostic@us.ibm.com>

Send break command to CFAMs to reset their logic.  If break
fails this serves as an indication there is no CFAM present.
Set various slave engine mode register defaults.

Add new fields to struct fsi_master to manage hardware
workarounds for break ids, target addresses and cfam IDs.

Limit each link scan to one CFAM.  Due to limitations in
hardware break commands only one can be recognized per link.

Signed-off-by: Chris Bostic <cbostic@us.ibm.com>
---
 drivers/fsi/fsi-cfam.h        |  1 +
 drivers/fsi/fsi-core.c        | 58 +++++++++++++++++++++++++++++++++++++++-
 drivers/fsi/fsi-master-fake.c |  3 +++
 drivers/fsi/fsi-master-gpio.c |  3 +++
 drivers/fsi/fsi-master.h      |  5 ++++
 drivers/fsi/fsi-slave.h       | 62 +++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 131 insertions(+), 1 deletion(-)
 create mode 100644 drivers/fsi/fsi-slave.h

diff --git a/drivers/fsi/fsi-cfam.h b/drivers/fsi/fsi-cfam.h
index a542f60..628c5de 100644
--- a/drivers/fsi/fsi-cfam.h
+++ b/drivers/fsi/fsi-cfam.h
@@ -25,6 +25,7 @@
 #define FSI_MAX_CFAMS_PER_LINK	4
 #define FSI_CFAM_SIZE		(FSI_LINK_SIZE / FSI_MAX_CFAMS_PER_LINK)
 #define FSI_PEEK_BASE		0x410
+#define FSI_SLAVE_BASE		0x800
 
 /* Config space decoding */
 #define FSI_CFG_NEXT_MASK	0x80000000
diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index a7f23a5..41c5a78 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -19,9 +19,11 @@
 #include <linux/fsi.h>
 #include <linux/module.h>
 #include <linux/slab.h>
+#include <linux/delay.h>
 
 #include "fsi-master.h"
 #include "fsi-cfam.h"
+#include "fsi-slave.h"
 
 #define FSI_PEEK_BASE			0x410
 
@@ -212,13 +214,67 @@ static void fsi_cfam_release(struct device *dev)
 	kfree(cfam);
 }
 
+/*
+ * Issue a break command to this link
+ */
+static int fsi_master_break(struct fsi_master *master, int link)
+{
+	int rc;
+	uint32_t cmd = FSI_CMD_BREAK;
+
+	rc = master->write(master, link, master->break_id, master->break_offset,
+			   &cmd, sizeof(cmd));
+	if (rc) {
+		dev_warn(master->dev, "break to %02x:%02x failed\n",
+			 link, master->break_id);
+		return -ENODEV;
+	}
+	udelay(200);		/* wait for logic reset to take effect */
+
+	rc = master->read(master, link, master->break_id,
+			  FSI_SLAVE_BASE + FSI_SMODE, &cmd, sizeof(cmd));
+	dev_info(master->dev, "smode after break:%08x rc:%d\n", cmd, rc);
+	if (rc) {
+		dev_warn(master->dev, "read smode after break failed\n");
+		return -ENODEV;
+	}
+
+	return rc;
+}
+
+static void set_smode_defaults(struct fsi_master *master, uint32_t *smode)
+{
+	*smode = FSI_SMODE_WSC | FSI_SMODE_ECRC
+		| fsi_smode_echodly(0xf) | fsi_smode_senddly(0xf)
+		| fsi_smode_lbcrr(1) | fsi_smode_sid(master->cfam_id);
+}
+
 static int fsi_cfam_init(struct fsi_master *master,
 		int link, uint8_t cfam_id)
 {
 	struct fsi_cfam *cfam = NULL;
-	uint32_t chip_id;
+	uint32_t chip_id, smode;
 	int rc;
 
+	/*
+	 * todo: Due to CFAM hardware issues related to BREAK commands we're
+	 * limited to only one CFAM per link.  This can be removed once
+	 * issue is resolved.
+	 */
+	if (cfam_id > 0)
+		return 0;
+
+	rc = fsi_master_break(master, link);
+	if (rc) {
+		dev_warn(master->dev, "no cfam detected at %02x:%02x\n",
+				link, cfam_id);
+		return -ENODEV;
+	}
+
+	set_smode_defaults(master, &smode);
+	rc = master->write(master, link, master->break_id,
+			   FSI_SLAVE_BASE + FSI_SMODE, &smode, sizeof(smode));
+
 	rc = master->read(master, link, cfam_id, 0, &chip_id, sizeof(chip_id));
 	if (rc) {
 		dev_warn(master->dev, "can't read cfam %02x:%02x: %d\n",
diff --git a/drivers/fsi/fsi-master-fake.c b/drivers/fsi/fsi-master-fake.c
index 658a5f6..3663a0a 100644
--- a/drivers/fsi/fsi-master-fake.c
+++ b/drivers/fsi/fsi-master-fake.c
@@ -63,6 +63,9 @@ static int fsi_master_fake_probe(struct platform_device *pdev)
 	master->n_links = 1;
 	master->read = fsi_master_fake_read;
 	master->write = fsi_master_fake_write;
+	master->cfam_id = 0;
+	master->break_id = 0;
+	master->break_offset = 0;
 
 	return fsi_master_register(master);
 }
diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
index 3e1aeb6..9769960 100644
--- a/drivers/fsi/fsi-master-gpio.c
+++ b/drivers/fsi/fsi-master-gpio.c
@@ -71,6 +71,9 @@ static int fsi_master_gpio_probe(struct platform_device *pdev)
 
 	master->master.read = fsi_master_gpio_read;
 	master->master.write = fsi_master_gpio_write;
+	master->master.cfam_id = 0;
+	master->master.break_id = 0;
+	master->master.break_offset = 0;
 
 	return fsi_master_register(&master->master);
 }
diff --git a/drivers/fsi/fsi-master.h b/drivers/fsi/fsi-master.h
index 4cdc4b4..41a5dc5 100644
--- a/drivers/fsi/fsi-master.h
+++ b/drivers/fsi/fsi-master.h
@@ -19,10 +19,15 @@
 
 #include <linux/device.h>
 
+#define	FSI_CMD_BREAK		0xc0de0000	/* Break command */
+
 struct fsi_master {
 	struct device	*dev;
 	int		idx;
 	int		n_links;
+	int		cfam_id;	/* 1 CFAM per link hw workaround */
+	int		break_id;	/* Break to this CFAM ID */
+	uint32_t	break_offset;	/* Where to write break */
 	int		(*read)(struct fsi_master *, int link,
 				uint8_t cfam, uint32_t addr,
 				void *val, size_t size);
diff --git a/drivers/fsi/fsi-slave.h b/drivers/fsi/fsi-slave.h
new file mode 100644
index 0000000..ea7a760
--- /dev/null
+++ b/drivers/fsi/fsi-slave.h
@@ -0,0 +1,62 @@
+/*
+ * FSI slave engine definitions.
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
+#ifndef DRIVERS_FSI_SLAVE_H
+#define DRIVERS_FSI_SLAVE_H
+
+/*
+ * FSI slave engine control register offsets
+ */
+#define	FSI_SMODE		0x0	/* R/W: Mode register */
+
+/*
+ * SMODE fields
+ */
+#define	FSI_SMODE_WSC		0x80000000	/* Warm start completed */
+#define	FSI_SMODE_ECRC		0x20000000	/* Enable hardware CRC check */
+#define	FSI_SMODE_SID_SHIFT	24		/* ID shift */
+#define	FSI_SMODE_SID_MASK	3		/* ID mask */
+#define	FSI_SMODE_ED_SHIFT	20		/* Echo delay shift */
+#define	FSI_SMODE_ED_MASK	0xf		/* Echo delay mask */
+#define	FSI_SMODE_SD_SHIFT	16		/* Send delay shift */
+#define	FSI_SMODE_SD_MASK	0xf		/* Send delay mask */
+#define	FSI_SMODE_LBCRR_SHIFT	8		/* Clock rate ratio shift */
+#define	FSI_SMODE_LBCRR_MASK	0xf		/* Clock rate ratio mask */
+
+/* Encode slave local bus echo delay */
+static inline uint32_t fsi_smode_echodly(int x)
+{
+	return (x & FSI_SMODE_ED_MASK) << FSI_SMODE_ED_SHIFT;
+}
+
+/* Encode slave local bus send delay */
+static inline uint32_t fsi_smode_senddly(int x)
+{
+	return (x & FSI_SMODE_SD_MASK) << FSI_SMODE_SD_SHIFT;
+}
+
+/* Encode slave local bus clock rate ratio */
+static inline uint32_t fsi_smode_lbcrr(int x)
+{
+	return (x & FSI_SMODE_LBCRR_MASK) << FSI_SMODE_LBCRR_SHIFT;
+}
+
+/* Encode slave ID */
+static inline uint32_t fsi_smode_sid(int x)
+{
+	return (x & FSI_SMODE_SID_MASK) << FSI_SMODE_SID_SHIFT;
+}
+
+#endif /* DRIVERS_FSI_SLAVE_H */
-- 
1.8.2.2
