Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x244.google.com (mail-oi0-x244.google.com
 [IPv6:2607:f8b0:4003:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sq7MB20T6zDrPP
 for <openbmc@lists.ozlabs.org>; Thu,  6 Oct 2016 07:54:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=VQMDtt9q; 
 dkim-atps=neutral
Received: by mail-oi0-x244.google.com with SMTP id d132so3133221oib.2
 for <openbmc@lists.ozlabs.org>; Wed, 05 Oct 2016 13:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ZKcvWTr39yMtU2FrmDkKkCvgrqi/DIQxB6Xdy0xG4QY=;
 b=VQMDtt9qc0agDD2+obXJgoj5V0Q+ARBLLSr3OVjTOychfz4sFd4LjXajrS1i6C61se
 YMZAJO92zxSWDbz76047Z45boC7zrf+2W75o9VJ1fQifxkdyz8w6KdpiAHFvXMtGuDl4
 h/z6yejZU+LCP0QhYYcZ4Bg2nYKPvfl4HviEsQIFGhmgqdEDyzlavxdqK1gg8I7pwi1o
 gijCU41SEX8LA11OWcq27Dv32NAni8LFQiBtMJETfmEZ/iUWJTmGccSdDAq5er3G79qv
 gZUSf/rDmHDirysL8O83pqI3fe93aMbwaOL6VQU1bwIsMLd9+LlQUpJOo/Ada6DUK1A5
 g/nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ZKcvWTr39yMtU2FrmDkKkCvgrqi/DIQxB6Xdy0xG4QY=;
 b=LjZJCgIIXMTP9b2OJ3dX7BC3DIYGBe7hTcLG/ZjhPhoXfoN2gsvXdt1ao5lr59UwYT
 EtPSsgsnOrkRsLahAQCURcNr/5lURawk9VR+2/kdHuBKIkEgiv0GcyzIGk6H5HXMbAdy
 tSyGBKhm2VL5jJEID+72juVwxyoZ3fVjl2POAYDXBR7yCMNYMn0mhyn5Tay1e/HpU59w
 ccbtUI4DkXZP78m+LEWVym9UefrTvffMaZXHUthj+8xgwMfjql+actka8RIFfaBLt2E1
 O+m/gJpEzbqRFIURKDpSA1s+v6r51PIrRo3mNAj6lIlywisf52RX87ItWYqD53RaJs7E
 IgSQ==
X-Gm-Message-State: AA6/9RkCZFJvPGTXHP0Tn05uPbhVBJS5PceF6XtcWgimR6eIvXWwJ757Wn+4dGTMFxOL+w==
X-Received: by 10.202.46.200 with SMTP id u191mr8877272oiu.149.1475700884489; 
 Wed, 05 Oct 2016 13:54:44 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id i18sm3206459oib.12.2016.10.05.13.54.43
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Wed, 05 Oct 2016 13:54:44 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Chris Bostic <cbostic@us.ibm.com>
Subject: [PATCH linux 14/15] drivers/fsi: Rename slave to cfam
Date: Wed,  5 Oct 2016 15:54:27 -0500
Message-Id: <1475700868-75737-15-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Wed, 05 Oct 2016 20:54:47 -0000

From: Chris Bostic <cbostic@us.ibm.com>

Suggested changes to the patch set so far as provided by Jeremy Kerr.
Rename slave to cfam to distinguish between the slave engine and its
containing cfam.  A few formatting changes to make checkpatch accept
patches 0001-0013.

Signed-off-by: Chris Bostic <cbostic@us.ibm.com>
---
 drivers/fsi/fsi-cfam.h        |  71 +++++++++++++++++++++
 drivers/fsi/fsi-core.c        | 144 ++++++++++++++++++------------------------
 drivers/fsi/fsi-master-fake.c |   4 +-
 drivers/fsi/fsi-master-gpio.c |   4 +-
 drivers/fsi/fsi-master.h      |   4 +-
 include/linux/fsi.h           |   2 +-
 6 files changed, 140 insertions(+), 89 deletions(-)
 create mode 100644 drivers/fsi/fsi-cfam.h

diff --git a/drivers/fsi/fsi-cfam.h b/drivers/fsi/fsi-cfam.h
new file mode 100644
index 0000000..a542f60
--- /dev/null
+++ b/drivers/fsi/fsi-cfam.h
@@ -0,0 +1,71 @@
+/*
+ * FSI CFAM definitions
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
+#ifndef DRIVERS_FSI_CFAM_H
+#define DRIVERS_FSI_CFAM_H
+
+#include <linux/device.h>
+
+#include "fsi-master.h"
+
+#define FSI_SLAVE_ENG_ID	2
+
+#define FSI_MAX_CFAMS_PER_LINK	4
+#define FSI_CFAM_SIZE		(FSI_LINK_SIZE / FSI_MAX_CFAMS_PER_LINK)
+#define FSI_PEEK_BASE		0x410
+
+/* Config space decoding */
+#define FSI_CFG_NEXT_MASK	0x80000000
+#define FSI_CFG_SLOT_MASK	0x00ff0000
+#define FSI_CFG_SLOT_SHIFT	16
+#define FSI_CFG_VERS_MASK	0x0000f000
+#define FSI_CFG_VERS_SHIFT	12
+#define FSI_CFG_TYPE_MASK	0x00000ff0
+#define FSI_CFG_TYPE_SHIFT	4
+
+/*
+ * Return number of slots in the configuration word
+ */
+static inline uint8_t fsi_cfg_slot(uint32_t x)
+{
+	return (x & FSI_CFG_SLOT_MASK) >> FSI_CFG_SLOT_SHIFT;
+}
+
+/*
+ * Return version in the configuration word
+ */
+static inline uint8_t fsi_cfg_version(uint32_t x)
+{
+	return (x & FSI_CFG_VERS_MASK) >> FSI_CFG_VERS_SHIFT;
+}
+
+/*
+ * Return type field in the configuration word
+ */
+static inline uint8_t fsi_cfg_type(uint32_t x)
+{
+	return (x & FSI_CFG_TYPE_MASK) >> FSI_CFG_TYPE_SHIFT;
+}
+
+struct fsi_cfam {
+	struct device		dev;
+	struct fsi_master	*master;
+	uint8_t			link;
+	uint8_t			id;
+};
+
+#define to_fsi_cfam(d) container_of(d, struct fsi_cfam, dev)
+
+#endif /* DRIVERS_FSI_MASTER_H */
diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 10bf817..a7f23a5 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -21,16 +21,7 @@
 #include <linux/slab.h>
 
 #include "fsi-master.h"
-
-#define FSI_N_SLAVES	4
-
-#define FSI_SLAVE_CONF_NEXT_MASK	0x80000000
-#define FSI_SLAVE_CONF_SLOTS_MASK	0x00ff0000
-#define FSI_SLAVE_CONF_SLOTS_SHIFT	16
-#define FSI_SLAVE_CONF_VERSION_MASK	0x0000f000
-#define FSI_SLAVE_CONF_VERSION_SHIFT	12
-#define FSI_SLAVE_CONF_TYPE_MASK	0x00000ff0
-#define FSI_SLAVE_CONF_TYPE_SHIFT	4
+#include "fsi-cfam.h"
 
 #define FSI_PEEK_BASE			0x410
 
@@ -38,18 +29,9 @@ static const int engine_page_size = 0x400;
 
 static atomic_t master_idx = ATOMIC_INIT(-1);
 
-struct fsi_slave {
-	struct device		dev;
-	struct fsi_master	*master;
-	int			link;
-	uint8_t			id;
-};
-
-#define to_fsi_slave(d) container_of(d, struct fsi_slave, dev)
-
-static int fsi_slave_read(struct fsi_slave *slave, uint32_t addr,
+static int fsi_cfam_read(struct fsi_cfam *cfam, uint32_t addr,
 		void *val, size_t size);
-static int fsi_slave_write(struct fsi_slave *slave, uint32_t addr,
+static int fsi_cfam_write(struct fsi_cfam *cfam, uint32_t addr,
 		const void *val, size_t size);
 
 /* FSI endpoint-device support */
@@ -62,7 +44,7 @@ int fsi_device_read(struct fsi_device *dev, uint32_t addr, void *val,
 	if (addr + size > dev->size)
 		return -EINVAL;
 
-	return fsi_slave_read(dev->slave, dev->addr + addr, val, size);
+	return fsi_cfam_read(dev->cfam, dev->addr + addr, val, size);
 }
 
 int fsi_device_write(struct fsi_device *dev, uint32_t addr, const void *val,
@@ -74,14 +56,14 @@ int fsi_device_write(struct fsi_device *dev, uint32_t addr, const void *val,
 	if (addr + size > dev->size)
 		return -EINVAL;
 
-	return fsi_slave_write(dev->slave, dev->addr + addr, val, size);
+	return fsi_cfam_write(dev->cfam, dev->addr + addr, val, size);
 }
 
 int fsi_device_peek(struct fsi_device *dev, void *val)
 {
 	uint32_t addr = FSI_PEEK_BASE + ((dev->unit - 2) * sizeof(uint32_t));
 
-	return fsi_slave_read(dev->slave, addr, val, sizeof(uint32_t));
+	return fsi_cfam_read(dev->cfam, addr, val, sizeof(uint32_t));
 }
 
 static void fsi_device_release(struct device *_device)
@@ -90,7 +72,7 @@ static void fsi_device_release(struct device *_device)
 	kfree(device);
 }
 
-static struct fsi_device *fsi_create_device(struct fsi_slave *slave)
+static struct fsi_device *fsi_create_device(struct fsi_cfam *cfam)
 {
 	struct fsi_device *dev;
 
@@ -98,7 +80,7 @@ static struct fsi_device *fsi_create_device(struct fsi_slave *slave)
 	if (!dev)
 		return NULL;
 
-	dev->dev.parent = &slave->dev;
+	dev->dev.parent = &cfam->dev;
 	dev->dev.bus = &fsi_bus_type;
 	dev->dev.release = fsi_device_release;
 
@@ -128,22 +110,22 @@ static bool check_crc4(uint32_t x)
 	return crc4(x) == 0;
 }
 
-/* FSI slave support */
-static int fsi_slave_read(struct fsi_slave *slave, uint32_t addr,
+/* FSI CFAM support */
+static int fsi_cfam_read(struct fsi_cfam *cfam, uint32_t addr,
 		void *val, size_t size)
 {
-	return slave->master->read(slave->master, slave->link,
-			slave->id, addr, val, size);
+	return cfam->master->read(cfam->master, cfam->link,
+			cfam->id, addr, val, size);
 }
 
-static int fsi_slave_write(struct fsi_slave *slave, uint32_t addr,
+static int fsi_cfam_write(struct fsi_cfam *cfam, uint32_t addr,
 		const void *val, size_t size)
 {
-	return slave->master->write(slave->master, slave->link,
-			slave->id, addr, val, size);
+	return cfam->master->write(cfam->master, cfam->link,
+			cfam->id, addr, val, size);
 }
 
-static int fsi_slave_scan(struct fsi_slave *slave)
+static int fsi_cfam_scan(struct fsi_cfam *cfam)
 {
 	uint32_t engine_addr;
 	uint32_t conf;
@@ -157,40 +139,37 @@ static int fsi_slave_scan(struct fsi_slave *slave)
 	 * skip the chip ID entry at the start of the address space.
 	 */
 	engine_addr = engine_page_size * 3;
-	for (i = 2; i < engine_page_size / sizeof(uint32_t); i++) {
+	for (i = FSI_SLAVE_ENG_ID; i < engine_page_size / sizeof(uint32_t);
+							i++) {
 		uint8_t slots, version, type;
 		struct fsi_device *dev;
 
-		rc = fsi_slave_read(slave, (i + 1) * sizeof(conf),
+		rc = fsi_cfam_read(cfam, (i + 1) * sizeof(conf),
 				&conf, sizeof(conf));
 		if (rc) {
-			dev_warn(&slave->dev,
-					"error reading slave registers\n");
+			dev_warn(&cfam->dev,
+					"error reading cfam registers\n");
 			return -1;
 		}
 
 		conf = be32_to_cpu(conf);
 
 		if (!check_crc4(conf)) {
-			dev_warn(&slave->dev,
-				"crc error in slave register at 0x%04x\n",
+			dev_warn(&cfam->dev,
+				"crc error in cfam register at 0x%04x\n",
 					i);
 			return -1;
 		}
+		slots = fsi_cfg_slot(conf);
+		version = fsi_cfg_version(conf);
+		type = fsi_cfg_type(conf);
 
-		slots = (conf & FSI_SLAVE_CONF_SLOTS_MASK)
-			>> FSI_SLAVE_CONF_SLOTS_SHIFT;
-		version = (conf & FSI_SLAVE_CONF_VERSION_MASK)
-			>> FSI_SLAVE_CONF_VERSION_SHIFT;
-		type = (conf & FSI_SLAVE_CONF_TYPE_MASK)
-			>> FSI_SLAVE_CONF_TYPE_SHIFT;
-
-		/* Unused address areas are marked by a zero type value; this
-		 * skips the defined address areas */
+		/* Unused address areas are marked by a zero type value; */
+		/* This skips the defined address areas */
 		if (type != 0) {
 
 			/* create device */
-			dev = fsi_create_device(slave);
+			dev = fsi_create_device(cfam);
 			if (!dev)
 				return -ENOMEM;
 
@@ -200,82 +179,83 @@ static int fsi_slave_scan(struct fsi_slave *slave)
 			dev->addr = engine_addr;
 			dev->size = slots * engine_page_size;
 
-			dev_info(&slave->dev,
+			dev_info(&cfam->dev,
 			"engine[%i]: type %x, version %x, addr %x size %x\n",
 					dev->unit, dev->engine_type, version,
 					dev->addr, dev->size);
 
 			device_initialize(&dev->dev);
 			dev_set_name(&dev->dev, "%02x:%02x:%02x:%02x",
-					slave->master->idx, slave->link,
-					slave->id, i - 2);
+					cfam->master->idx, cfam->link,
+					cfam->id, i - 2);
 
 			rc = device_add(&dev->dev);
 			if (rc) {
-				dev_warn(&slave->dev, "add failed: %d\n", rc);
+				dev_warn(&cfam->dev, "add failed: %d\n", rc);
 				put_device(&dev->dev);
 			}
 		}
 
 		engine_addr += slots * engine_page_size;
 
-		if (!(conf & FSI_SLAVE_CONF_NEXT_MASK))
+		if (!(conf & FSI_CFG_NEXT_MASK))
 			break;
 	}
 
 	return 0;
 }
 
-static void fsi_slave_release(struct device *dev)
+static void fsi_cfam_release(struct device *dev)
 {
-	struct fsi_slave *slave = to_fsi_slave(dev);
-	kfree(slave);
+	struct fsi_cfam *cfam = to_fsi_cfam(dev);
+
+	kfree(cfam);
 }
 
-static int fsi_slave_init(struct fsi_master *master,
-		int link, uint8_t slave_id)
+static int fsi_cfam_init(struct fsi_master *master,
+		int link, uint8_t cfam_id)
 {
-	struct fsi_slave *slave;
+	struct fsi_cfam *cfam = NULL;
 	uint32_t chip_id;
 	int rc;
 
-	rc = master->read(master, link, slave_id, 0, &chip_id, sizeof(chip_id));
+	rc = master->read(master, link, cfam_id, 0, &chip_id, sizeof(chip_id));
 	if (rc) {
-		dev_warn(master->dev, "can't read slave %02x:%02x: %d\n",
-				link, slave_id, rc);
+		dev_warn(master->dev, "can't read cfam %02x:%02x: %d\n",
+				link, cfam_id, rc);
 		return -ENODEV;
 	}
 
 	chip_id = be32_to_cpu(chip_id);
 	if (!check_crc4(chip_id)) {
-		dev_warn(master->dev, "slave %02x:%02x: invalid chip id CRC!\n",
-				link, slave_id);
+		dev_warn(master->dev, "cfam %02x:%02x: invalid chip id CRC!\n",
+				link, cfam_id);
 		return -EIO;
 	}
 
 	pr_debug("fsi: found chip %08x at %02x:%02x:%02x\n",
-			master->idx, chip_id, link, slave_id);
+			master->idx, chip_id, link, cfam_id);
 
-	/* we can communicate with a slave; create devices and scan */
-	slave = kzalloc(sizeof(*slave), GFP_KERNEL);
-	if (!slave)
+	/* we can communicate with a cfam; create devices and scan */
+	cfam = kzalloc(sizeof(*cfam), GFP_KERNEL);
+	if (!cfam)
 		return -ENOMEM;
 
-	slave->master = master;
-	slave->id = slave_id;
-	slave->dev.parent = master->dev;
-	slave->dev.release = fsi_slave_release;
+	cfam->master = master;
+	cfam->id = cfam_id;
+	cfam->dev.parent = master->dev;
+	cfam->dev.release = fsi_cfam_release;
 
-	dev_set_name(&slave->dev, "slave@%02x:%02x", link, slave_id);
-	rc = device_register(&slave->dev);
+	dev_set_name(&cfam->dev, "cfam@%02x:%02x", link, cfam_id);
+	rc = device_register(&cfam->dev);
 	if (rc < 0) {
-		dev_warn(master->dev, "failed to create slave device: %d\n",
+		dev_warn(master->dev, "failed to create cfam device: %d\n",
 				rc);
-		put_device(&slave->dev);
+		put_device(&cfam->dev);
 		return rc;
 	}
 
-	fsi_slave_scan(slave);
+	fsi_cfam_scan(cfam);
 	return 0;
 }
 
@@ -283,11 +263,11 @@ static int fsi_slave_init(struct fsi_master *master,
 
 static int fsi_master_scan(struct fsi_master *master)
 {
-	int link, slave_id;
+	int link, cfam_id;
 
 	for (link = 0; link < master->n_links; link++)
-		for (slave_id = 0; slave_id < FSI_N_SLAVES; slave_id++)
-			fsi_slave_init(master, link, slave_id);
+		for (cfam_id = 0; cfam_id < FSI_MAX_CFAMS_PER_LINK; cfam_id++)
+			fsi_cfam_init(master, link, cfam_id);
 
 	return 0;
 
diff --git a/drivers/fsi/fsi-master-fake.c b/drivers/fsi/fsi-master-fake.c
index 50aac0b..658a5f6 100644
--- a/drivers/fsi/fsi-master-fake.c
+++ b/drivers/fsi/fsi-master-fake.c
@@ -29,7 +29,7 @@ const uint8_t data[] = {
 
 
 static int fsi_master_fake_read(struct fsi_master *_master, int link,
-		uint8_t slave, uint32_t addr, void *val, size_t size)
+		uint8_t cfam, uint32_t addr, void *val, size_t size)
 {
 	if (link != 0)
 		return -ENODEV;
@@ -43,7 +43,7 @@ static int fsi_master_fake_read(struct fsi_master *_master, int link,
 }
 
 static int fsi_master_fake_write(struct fsi_master *_master, int link,
-		uint8_t slave, uint32_t addr, const void *val, size_t size)
+		uint8_t cfam, uint32_t addr, const void *val, size_t size)
 {
 	if (link != 0)
 		return -ENODEV;
diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
index 3855829..3e1aeb6 100644
--- a/drivers/fsi/fsi-master-gpio.c
+++ b/drivers/fsi/fsi-master-gpio.c
@@ -22,7 +22,7 @@ struct fsi_gpio_msg {
 };
 
 static int fsi_master_gpio_read(struct fsi_master *_master, int link,
-		uint8_t slave, uint32_t addr, void *val, size_t size)
+		uint8_t cfam, uint32_t addr, void *val, size_t size)
 {
 	struct fsi_master_gpio *master = to_fsi_master_gpio(_master);
 
@@ -37,7 +37,7 @@ static int fsi_master_gpio_read(struct fsi_master *_master, int link,
 }
 
 static int fsi_master_gpio_write(struct fsi_master *_master, int link,
-		uint8_t slave, uint32_t addr, const void *val, size_t size)
+		uint8_t cfam, uint32_t addr, const void *val, size_t size)
 {
 	struct fsi_master_gpio *master = to_fsi_master_gpio(_master);
 
diff --git a/drivers/fsi/fsi-master.h b/drivers/fsi/fsi-master.h
index e75a810..4cdc4b4 100644
--- a/drivers/fsi/fsi-master.h
+++ b/drivers/fsi/fsi-master.h
@@ -24,10 +24,10 @@ struct fsi_master {
 	int		idx;
 	int		n_links;
 	int		(*read)(struct fsi_master *, int link,
-				uint8_t slave, uint32_t addr,
+				uint8_t cfam, uint32_t addr,
 				void *val, size_t size);
 	int		(*write)(struct fsi_master *, int link,
-				uint8_t slave, uint32_t addr,
+				uint8_t cfam, uint32_t addr,
 				const void *val, size_t size);
 };
 
diff --git a/include/linux/fsi.h b/include/linux/fsi.h
index 47af0af..c919058 100644
--- a/include/linux/fsi.h
+++ b/include/linux/fsi.h
@@ -23,7 +23,7 @@ struct fsi_device {
 	u8			engine_type;
 	u8			version;
 	u8			unit;
-	struct fsi_slave	*slave;
+	struct fsi_cfam		*cfam;
 	uint32_t		addr;
 	uint32_t		size;
 };
-- 
1.8.2.2
