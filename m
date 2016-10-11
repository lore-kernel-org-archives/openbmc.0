Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com
 [IPv6:2607:f8b0:4003:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3str510pMdzDswn
 for <openbmc@lists.ozlabs.org>; Wed, 12 Oct 2016 08:40:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=a8vULKul; 
 dkim-atps=neutral
Received: by mail-oi0-x243.google.com with SMTP id p136so2125705oic.1
 for <openbmc@lists.ozlabs.org>; Tue, 11 Oct 2016 14:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Md562CW+NCfz7XUaTA1Wb986QsQq1gS7h/ICx1/BsEk=;
 b=a8vULKul8Y8igoCMPYC5njX9HhSNrQUhCmD30rdN9wmArdOrMHGfFvN9iQMU9D1Lja
 AwGac6+vo00/BfckKIYwkIaD3SvdexyubMJuwOXqirT8m0VJQN0qaWGDi9P6bQWTVkby
 lElN4qigmJUefN1seF/CU4zH9NUaqWKYU9cuCj7lRvRbtPUikvIQ/0GOzaAvWp3KIIl6
 PfghyGBuEon2p2Vy5ojBHb8/Ls/n2djNktK261kPTFJTC3ZU5UD/ohDN90xQF7fIjrB3
 Q+JSo8r5M+n0awFuTxIXOSWxZrVIl+XSRl2Wtnd+SC4mFP5A9eyUTOuSb12dTMY5j4kK
 iWEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Md562CW+NCfz7XUaTA1Wb986QsQq1gS7h/ICx1/BsEk=;
 b=EblhBhtkrV/Cor2ST/m2tPXwMzO7XtVdtqi8OMVgglT/jhUc6Qgl7UHKMThrJ7P2Ay
 zPhmMPWUPW85OLmbqmlrU7MXIaf19fILA2S+Z3OeENqu2l/bn222eggtDO/dc9VnUqZn
 +q1zCf8N6WBrActlc+NFor5xiznMJO8Y8fmKW5pujmFdbstPNBoYVAwipPVUf1dVdnuc
 79w+azUuaykyKBm/+nzKsj2Vm4uwYl7DI+EZrwfZlpsdyJ1/2ZZ0l6yTIqwsV4FZD4Ui
 QTKgSE3vQJdx/JdFOYh6y0tyc28wOSqN/xd01pEwvKf/6n0KPtsuBADZe9md49ZcvA8N
 6X2w==
X-Gm-Message-State: AA6/9RnRYfFActFI+CLNbWtyTX9J/ADepWLhTjBGBt1yNBzsisq+t+OWSRCh0bkqDtWyrw==
X-Received: by 10.202.214.69 with SMTP id n66mr4356022oig.82.1476222019367;
 Tue, 11 Oct 2016 14:40:19 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id h91sm1811153oth.40.2016.10.11.14.40.18
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Tue, 11 Oct 2016 14:40:19 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Chris Bostic <cbostic@us.ibm.com>
Subject: [PATCH linux v3 16/18] drivers/fsi: Set up CFAMs for communication
Date: Tue, 11 Oct 2016 16:40:01 -0500
Message-Id: <1476222003-99697-17-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailer: git-send-email 2.7.4 (Apple Git-66)
In-Reply-To: <1476222003-99697-1-git-send-email-christopher.lee.bostic@gmail.com>
References: <1476222003-99697-1-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Tue, 11 Oct 2016 21:40:22 -0000

From: Chris Bostic <cbostic@us.ibm.com>

Issue break command to reset CFAM logic and set ID as appropriate
for a particular master type.  Begin definition of the slave
engine register set and accessors.

V3 - Remove definition of BREAK command from fsi-master.h

   - Remove definitions of fsi_master_fake for set_smode and
     break

   - Remove master->set_smode master dependent function and
     moved to a generic base master set_smode.

   - Add fsi_master_link_enable with master type dependencies

Signed-off-by: Chris Bostic <cbostic@us.ibm.com>
---
 drivers/fsi/fsi-core.c        | 75 +++++++++++++++++++++++++++++++++++++++++--
 drivers/fsi/fsi-master-fake.c |  2 ++
 drivers/fsi/fsi-master-gpio.c | 33 +++++++++++++++++++
 drivers/fsi/fsi-master.h      |  2 ++
 drivers/fsi/fsi-slave.h       | 62 +++++++++++++++++++++++++++++++++++
 5 files changed, 171 insertions(+), 3 deletions(-)
 create mode 100644 drivers/fsi/fsi-slave.h

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 0da8cf0..c5e7441 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -22,6 +22,7 @@
 
 #include "fsi-master.h"
 #include "fsi-cfam.h"
+#include "fsi-slave.h"
 
 #define FSI_N_SLAVES	4
 
@@ -224,13 +225,66 @@ static void fsi_slave_release(struct device *dev)
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
+		| fsi_smode_lbcrr(1) | fsi_smode_sid(0);
+}
+
+static int fsi_master_set_smode(struct fsi_master *master, int link)
+{
+	uint32_t smode;
+	int rc;
+
+	set_smode_defaults(master, &smode);
+	rc = master->write(master, link, 0, FSI_SLAVE_BASE + FSI_SMODE,
+			&smode, sizeof(smode));
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
@@ -273,13 +327,28 @@ static int fsi_slave_init(struct fsi_master *master,
 
 /* FSI master support */
 
+static int fsi_master_link_enable(struct fsi_master *master, int link)
+{
+	int rc;
+
+	if (master->link_enable)
+		rc = master->link_enable(master, link);
+
+	return rc;
+}
+
 static int fsi_master_scan(struct fsi_master *master)
 {
-	int link, slave_id;
+	int link, slave_id, rc;
+
+	for (link = 0; link < master->n_links; link++) {
+		rc = fsi_master_link_enable(master, link);
+		if (rc)
+			continue;
 
-	for (link = 0; link < master->n_links; link++)
 		for (slave_id = 0; slave_id < FSI_N_SLAVES; slave_id++)
 			fsi_slave_init(master, link, slave_id);
+	}
 
 	return 0;
 
diff --git a/drivers/fsi/fsi-master-fake.c b/drivers/fsi/fsi-master-fake.c
index ec1ed5e..c7ad631 100644
--- a/drivers/fsi/fsi-master-fake.c
+++ b/drivers/fsi/fsi-master-fake.c
@@ -63,6 +63,8 @@ static int fsi_master_fake_probe(struct platform_device *pdev)
 	master->n_links = 1;
 	master->read = fsi_master_fake_read;
 	master->write = fsi_master_fake_write;
+	master->send_break = NULL;
+	master->link_enable = NULL;
 
 	return fsi_master_register(master);
 }
diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
index 5c3d5cd..166370a 100644
--- a/drivers/fsi/fsi-master-gpio.c
+++ b/drivers/fsi/fsi-master-gpio.c
@@ -7,6 +7,8 @@
 #include <linux/module.h>
 
 #include "fsi-master.h"
+#include "fsi-cfam.h"
+#include "fsi-slave.h"
 
 struct fsi_master_gpio {
 	struct fsi_master	master;
@@ -50,6 +52,35 @@ static int fsi_master_gpio_write(struct fsi_master *_master, int link,
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
+static int fsi_master_gpio_link_enable(struct fsi_master *_master, int link)
+{
+	struct fsi_master_gpio *master = to_fsi_master_gpio(_master);
+
+	if (link != 0)
+		return -ENODEV;
+
+	/* todo: set the enable pin */
+	(void)master;
+
+	return 0;
+}
+
 static int fsi_master_gpio_probe(struct platform_device *pdev)
 {
 	struct fsi_master_gpio *master;
@@ -71,6 +102,8 @@ static int fsi_master_gpio_probe(struct platform_device *pdev)
 
 	master->master.read = fsi_master_gpio_read;
 	master->master.write = fsi_master_gpio_write;
+	master->master.send_break = fsi_master_gpio_break;
+	master->master.link_enable = fsi_master_gpio_link_enable;
 
 	return fsi_master_register(&master->master);
 }
diff --git a/drivers/fsi/fsi-master.h b/drivers/fsi/fsi-master.h
index e75a810..94a0671 100644
--- a/drivers/fsi/fsi-master.h
+++ b/drivers/fsi/fsi-master.h
@@ -29,6 +29,8 @@ struct fsi_master {
 	int		(*write)(struct fsi_master *, int link,
 				uint8_t slave, uint32_t addr,
 				const void *val, size_t size);
+	int		(*send_break)(struct fsi_master *, int link);
+	int		(*link_enable)(struct fsi_master *, int link);
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
