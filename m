Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com
 [IPv6:2607:f8b0:4003:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3srtt86NgqzDrWy
 for <openbmc@lists.ozlabs.org>; Sun,  9 Oct 2016 04:39:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=NI7VSl79; 
 dkim-atps=neutral
Received: by mail-oi0-x243.google.com with SMTP id h186so5451498oia.3
 for <openbmc@lists.ozlabs.org>; Sat, 08 Oct 2016 10:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=bR8HV4g2KPUWabIxnRLH4RqRs4Ld2trHJNu7L2uJNBs=;
 b=NI7VSl79rzE5yVB9lR63YIuy9z0EU0ikqAZ/91Pc8Cq4RP83nFjtpW0LiIHxlZAzdI
 MPfLg0k7zrwwqJD6/LPgss2E780O98vOCTAlylSgvufdZ4IbIvHnW4nQ/+GwQxj78UvB
 pKEyIf/Y4YHYG3ctRoKAhJKDU7Xy0YSDXESb0DtvyPF0fUBSVhaUILcm2nMLgpS27zTu
 ZxT+FCs2zHEmgxvBUd7N88dSI+/FRxLyUcsHRL4aiR5LD5w1f7P7s/uI1AupKT3qQuQf
 YbITj68zS6IrYFIFJyzQ2lV/TK0pllefE9+9rtI+gMxNq6uc3IWReDnsJisdGlwfJPHd
 3TGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=bR8HV4g2KPUWabIxnRLH4RqRs4Ld2trHJNu7L2uJNBs=;
 b=XWHgmlGOFxyUFOcBjbYS7A9ClrdsF0R3PZs8EavemU8VuUVj+dNHqaSEMaIsw6TnqJ
 oczo6nKrLA5/jFiiXnu5Chq8aa9LqmUHWiLkqpkZHBkWWkLnbsok9nP/msf7LWtffGog
 hm5I8kJXv8coRebYktAGq/gMhoB1Eh/2zgp3+WjzRs36U+ub/+M1a033FBm9fOfHcBxN
 sGIYJeNmMXu959ghh/g6Ryi2t36ozLtpJ6SurcvHdQx3l4OClpWQzFMKKz1CUD2IaPGg
 lTqNAwY1DB8hXCj/V4Ql2Ah6+phUe2Il3OHiBDvSYqJ6qFrIbySvM9pBwCHULTDpkHsH
 ppCQ==
X-Gm-Message-State: AA6/9Rk8T/40LqfiIm+GQ2DNqWE+o3RYXOgiVkH4mCmR3swxFX3y3TOfM6GeDVSNIPAfMg==
X-Received: by 10.157.22.203 with SMTP id s11mr15404464ots.229.1475948351179; 
 Sat, 08 Oct 2016 10:39:11 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id g17sm8025290otd.38.2016.10.08.10.39.10
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sat, 08 Oct 2016 10:39:10 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Chris Bostic <cbostic@us.ibm.com>
Subject: [PATCH linux v2 16/17] drivers/fsi: Set up CFAMs for communication
Date: Sat,  8 Oct 2016 12:38:52 -0500
Message-Id: <1475948333-55960-17-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailer: git-send-email 2.7.4 (Apple Git-66)
In-Reply-To: <1475948333-55960-1-git-send-email-christopher.lee.bostic@gmail.com>
References: <1475948333-55960-1-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Sat, 08 Oct 2016 17:39:13 -0000

From: Chris Bostic <cbostic@us.ibm.com>

Issue break command to reset CFAM logic and set ID as appropriate
for a particular master type.  Begin definition of the slave
engine register set and accessors.

Signed-off-by: Chris Bostic <cbostic@us.ibm.com>
---
 drivers/fsi/fsi-core.c        | 58 +++++++++++++++++++++++++++++++++++++++-
 drivers/fsi/fsi-master-fake.c | 19 +++++++++++++
 drivers/fsi/fsi-master-gpio.c | 31 ++++++++++++++++++++++
 drivers/fsi/fsi-master.h      |  5 ++++
 drivers/fsi/fsi-slave.h       | 62 +++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 174 insertions(+), 1 deletion(-)
 create mode 100644 drivers/fsi/fsi-slave.h

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 0da8cf0..ac8c287 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -22,6 +22,7 @@
 
 #include "fsi-master.h"
 #include "fsi-cfam.h"
+#include "fsi-slave.h"
 
 #define FSI_N_SLAVES	4
 
@@ -224,13 +225,68 @@ static void fsi_slave_release(struct device *dev)
 	kfree(slave);
 }
 
+/*
+ * Issue a break commad on this link
+ */
+static int fsi_master_break(struct fsi_master *master, int link)
+{
+	int rc = 0;
+
+	if (master->send_break)
+		rc = master->send_break(master, link);
+
+	return rc;
+}
+
+static void set_smode_defaults(struct fsi_master *master, uint32_t *smode)
+{
+	*smode = FSI_SMODE_WSC | FSI_SMODE_ECRC
+		| fsi_smode_echodly(0xf) | fsi_smode_senddly(0xf)
+		| fsi_smode_lbcrr(1);
+}
+
+static int fsi_master_set_smode(struct fsi_master *master, int link)
+{
+	uint32_t smode;
+	int rc;
+
+	if (!master->set_smode)
+		return -ENODEV;
+
+	set_smode_defaults(master, &smode);
+	rc = master->set_smode(master, link, smode);
+
+	return rc;
+}
+
 static int fsi_slave_init(struct fsi_master *master,
 		int link, uint8_t slave_id)
 {
-	struct fsi_slave *slave;
+	struct fsi_slave *slave = NULL;
 	uint32_t chip_id;
 	int rc;
 
+	/*
+	 * todo: Due to CFAM hardware issues related to BREAK commands we're
+	 * limited to only one CFAM per link. Once hardware fixes are available
+	 * this restriction can be removed.
+	 */
+	if (slave_id > 0)
+		return 0;
+
+	rc = fsi_master_break(master, link);
+	if (rc) {
+		dev_warn(master->dev, "no slave detected at %02x:%02x\n",
+				link, slave_id);
+		return -ENODEV;
+	}
+
+	rc = fsi_master_set_smode(master, link);
+	if (rc) {
+		dev_warn(master->dev, "failed to set smode id, rc:%d\n", rc);
+		return -ENODEV;
+	}
+
 	rc = master->read(master, link, slave_id, 0, &chip_id, sizeof(chip_id));
 	if (rc) {
 		dev_warn(master->dev, "can't read slave %02x:%02x: %d\n",
diff --git a/drivers/fsi/fsi-master-fake.c b/drivers/fsi/fsi-master-fake.c
index ec1ed5e..08a083a 100644
--- a/drivers/fsi/fsi-master-fake.c
+++ b/drivers/fsi/fsi-master-fake.c
@@ -51,6 +51,23 @@ static int fsi_master_fake_write(struct fsi_master *_master, int link,
 	return -EACCES;
 }
 
+static int fsi_master_fake_break(struct fsi_master *master, int link)
+{
+	if (link != 0)
+		return -ENODEV;
+
+	return 0;
+}
+
+static int fsi_master_fake_set_smode(struct fsi_master *master, int link,
+					uint32_t smode)
+{
+	if (link != 0)
+		return -ENODEV;
+
+	return 0;
+}
+
 static int fsi_master_fake_probe(struct platform_device *pdev)
 {
 	struct fsi_master *master;
@@ -63,6 +80,8 @@ static int fsi_master_fake_probe(struct platform_device *pdev)
 	master->n_links = 1;
 	master->read = fsi_master_fake_read;
 	master->write = fsi_master_fake_write;
+	master->send_break = fsi_master_fake_break;
+	master->set_smode = fsi_master_fake_set_smode;
 
 	return fsi_master_register(master);
 }
diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
index 5c3d5cd..3b2770d 100644
--- a/drivers/fsi/fsi-master-gpio.c
+++ b/drivers/fsi/fsi-master-gpio.c
@@ -7,6 +7,8 @@
 #include <linux/module.h>
 
 #include "fsi-master.h"
+#include "fsi-cfam.h"
+#include "fsi-slave.h"
 
 struct fsi_master_gpio {
 	struct fsi_master	master;
@@ -50,6 +52,33 @@ static int fsi_master_gpio_write(struct fsi_master *_master, int link,
 	return 0;
 }
 
+/*
+ * Issue a break command on link
+ */
+static int fsi_master_gpio_break(struct fsi_master *_master, int link)
+{
+	struct fsi_master_gpio *master = to_fsi_master_gpio(_master);
+
+	if (link != 0)
+		return -ENODEV;
+
+	/* todo: send the break pattern over gpio */
+	(void)master;
+
+	return 0;
+}
+
+static int fsi_master_gpio_set_smode(struct fsi_master *_master, int link,
+						uint32_t smode)
+{
+	int rc;
+
+	rc = _master->write(_master, link, 0, FSI_SLAVE_BASE + FSI_SMODE,
+			&smode, sizeof(smode));
+
+	return rc;
+}
+
 static int fsi_master_gpio_probe(struct platform_device *pdev)
 {
 	struct fsi_master_gpio *master;
@@ -71,6 +100,8 @@ static int fsi_master_gpio_probe(struct platform_device *pdev)
 
 	master->master.read = fsi_master_gpio_read;
 	master->master.write = fsi_master_gpio_write;
+	master->master.send_break = fsi_master_gpio_break;
+	master->master.set_smode = fsi_master_gpio_set_smode;
 
 	return fsi_master_register(&master->master);
 }
diff --git a/drivers/fsi/fsi-master.h b/drivers/fsi/fsi-master.h
index e75a810..73b62e0 100644
--- a/drivers/fsi/fsi-master.h
+++ b/drivers/fsi/fsi-master.h
@@ -19,6 +19,8 @@
 
 #include <linux/device.h>
 
+#define FSI_CMD_BREAK		0xc0de0000	/* Break command */
+
 struct fsi_master {
 	struct device	*dev;
 	int		idx;
@@ -29,6 +31,9 @@ struct fsi_master {
 	int		(*write)(struct fsi_master *, int link,
 				uint8_t slave, uint32_t addr,
 				const void *val, size_t size);
+	int		(*send_break)(struct fsi_master *, int link);
+	int		(*set_smode)(struct fsi_master *, int link,
+				uint32_t smode);
 };
 
 extern int fsi_master_register(struct fsi_master *master);
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
