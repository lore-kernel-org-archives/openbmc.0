Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x244.google.com (mail-oi0-x244.google.com
 [IPv6:2607:f8b0:4003:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMXsf66QTzDvjC
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 13:41:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="UzvYt8eK"; 
 dkim-atps=neutral
Received: by mail-oi0-x244.google.com with SMTP id f201so16439790oib.0
 for <openbmc@lists.ozlabs.org>; Sun, 20 Nov 2016 18:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=hU3d8CA45zgwytV2GotonKnV0YqicfvDl4E6cdvb37Y=;
 b=UzvYt8eKDtppezZ3ZMeUX2vzGcMxHSbA1E33MjM+cTuiT8hAA5F/R7aHd6/J+k4kF4
 1z6oyal35LWeG4/RjGXMBS0u8DEXFpoBMUpEeMX5EK4Zw6sWATf7uBWWwhFjcYB7OuEF
 qmfdz1I5KSsm8mpeNEmL4wkT36H4TrcMHwy/tqfrLJo7RcMuDEx+x/kYtjPSs0xf5Dzn
 IBgZulrS7shPiaKkVopKTnt6IN95tDEjp5AAe91WmLPjlleruH/QKnatOZOeGdAoSf0O
 AK/L20+0mCOTYRU5jOUO+CRRZ2hm7N1DcFpnCoPU5A6rMgRPTB3mxh1lwN7NlYm97qyG
 ohYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=hU3d8CA45zgwytV2GotonKnV0YqicfvDl4E6cdvb37Y=;
 b=X03nrof3qmIFRoiRut8bQ0RDgSklFo1H5YfWs5eM2JnVYAhhK6Zjx0JV7VfQi+CBwX
 STKaz2mtDPLPuuW+/9xgTksnCxo9rKwmZv2eGSXyPOYLRmhpEX4g938zZsCnVNeJ5mi6
 usFrC757Q7owj9zfQgf+EMN+wwRFHqdCw8P/wtgWjXqY7rBAnjn5DAFmgQP99yu51QNZ
 0if5a1hqVVRayQEOO+hUChkNCT8/jtyvyyXSBjFFW3yRI+ra2R2jfg2GtAmkEXZvE9jn
 xG+osMJL0B6x5fBKrv8aYkXFLReOlom8xy3FTxGMn8jatXZ6N7EtswlXZW2+ask8dQA+
 M6ew==
X-Gm-Message-State: AKaTC03+PS6bAy+/87p8AAow3cACSO7Gc7b+TRZHliii1He+ELVjDiGs2/OYmES3bR40Xw==
X-Received: by 10.157.39.2 with SMTP id r2mr7510354ota.203.1479696069124;
 Sun, 20 Nov 2016 18:41:09 -0800 (PST)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id 73sm6432307otf.16.2016.11.20.18.41.08
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sun, 20 Nov 2016 18:41:08 -0800 (PST)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org, gustavo.padovan@collabora.co.uk,
 gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch, jthumshirn@suse.de,
 dan.j.williams@intel.com, sre@kernel.org, clg@kaod.org,
 k.kozlowski@samsung.com
Cc: jk@ozlabs.org, joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 benh@kernel.crashing.org, alistair@popple.id.au,
 Chris Bostic <cbostic@us.ibm.com>
Subject: [PATCH linux 11/19] fsi: scan slaves & register devices
Date: Sun, 20 Nov 2016 20:40:40 -0600
Message-Id: <1479696048-75851-12-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailer: git-send-email 2.7.4 (Apple Git-66)
In-Reply-To: <1479696048-75851-1-git-send-email-christopher.lee.bostic@gmail.com>
References: <1479696048-75851-1-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailman-Approved-At: Mon, 21 Nov 2016 13:57:36 +1100
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
X-List-Received-Date: Mon, 21 Nov 2016 02:41:11 -0000

From: Jeremy Kerr <jk@ozlabs.org>

Now that we have fsi_slave devices, scan each for endpoints, and
register them on the fsi bus.

Includes contributions from Chris Bostic <cbostic@us.ibm.com>

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
Signed-off-by: Chris Bostic <cbostic@us.ibm.com>
---
 drivers/fsi/fsi-core.c | 136 +++++++++++++++++++++++++++++++++++++++++++++++--
 include/linux/fsi.h    |   4 ++
 2 files changed, 136 insertions(+), 4 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 2aa6394..c7c8bad 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -23,9 +23,19 @@
 #include "fsi-master.h"
 
 #define FSI_N_SLAVES	4
-#define FSI_SLAVE_CONF_CRC_SHIFT        4
-#define FSI_SLAVE_CONF_CRC_MASK         0x0000000f
-#define FSI_SLAVE_CONF_DATA_BITS        28
+
+#define FSI_SLAVE_CONF_NEXT_MASK	0x80000000
+#define FSI_SLAVE_CONF_SLOTS_MASK	0x00ff0000
+#define FSI_SLAVE_CONF_SLOTS_SHIFT	16
+#define FSI_SLAVE_CONF_VERSION_MASK	0x0000f000
+#define FSI_SLAVE_CONF_VERSION_SHIFT	12
+#define FSI_SLAVE_CONF_TYPE_MASK	0x00000ff0
+#define FSI_SLAVE_CONF_TYPE_SHIFT	4
+#define FSI_SLAVE_CONF_CRC_SHIFT	4
+#define FSI_SLAVE_CONF_CRC_MASK		0x0000000f
+#define FSI_SLAVE_CONF_DATA_BITS	28
+
+static const int engine_page_size = 0x400;
 
 static atomic_t master_idx = ATOMIC_INIT(-1);
 
@@ -38,6 +48,30 @@ struct fsi_slave {
 
 #define to_fsi_slave(d) container_of(d, struct fsi_slave, dev)
 
+/* FSI endpoint-device support */
+
+static void fsi_device_release(struct device *_device)
+{
+	struct fsi_device *device = to_fsi_dev(_device);
+
+	kfree(device);
+}
+
+static struct fsi_device *fsi_create_device(struct fsi_slave *slave)
+{
+	struct fsi_device *dev;
+
+	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
+	if (!dev)
+		return NULL;
+
+	dev->dev.parent = &slave->dev;
+	dev->dev.bus = &fsi_bus_type;
+	dev->dev.release = fsi_device_release;
+
+	return dev;
+}
+
 /* crc helpers */
 static const uint8_t crc4_tab[] = {
 	0x0, 0x7, 0xe, 0x9, 0xb, 0xc, 0x5, 0x2,
@@ -61,6 +95,99 @@ EXPORT_SYMBOL_GPL(fsi_crc4);
 
 /* FSI slave support */
 
+static int fsi_slave_read(struct fsi_slave *slave, uint32_t addr,
+			void *val, size_t size)
+{
+	return slave->master->read(slave->master, slave->link,
+			slave->id, addr, val, size);
+}
+
+static int fsi_slave_scan(struct fsi_slave *slave)
+{
+	uint32_t engine_addr;
+	uint32_t conf;
+	int rc, i;
+
+	/*
+	 * scan engines
+	 *
+	 * We keep the peek mode and slave engines for the core; so start
+	 * at the third slot in the configuration table. We also need to
+	 * skip the chip ID entry at the start of the address space.
+	 */
+	engine_addr = engine_page_size * 3;
+	for (i = 2; i < engine_page_size / sizeof(uint32_t); i++) {
+		uint8_t slots, version, type, crc;
+		struct fsi_device *dev;
+
+		rc = fsi_slave_read(slave, (i + 1) * sizeof(conf),
+				&conf, sizeof(conf));
+		if (rc) {
+			dev_warn(&slave->dev,
+				"error reading slave registers\n");
+			return -1;
+		}
+
+		crc = fsi_crc4(0, conf >> FSI_SLAVE_CONF_CRC_SHIFT,
+				FSI_SLAVE_CONF_DATA_BITS);
+		if (crc != (conf & FSI_SLAVE_CONF_CRC_MASK)) {
+			dev_warn(&slave->dev,
+				"crc error in slave register at 0x%04x\n",
+				i);
+			return -1;
+		}
+
+		slots = (conf & FSI_SLAVE_CONF_SLOTS_MASK)
+			>> FSI_SLAVE_CONF_SLOTS_SHIFT;
+		version = (conf & FSI_SLAVE_CONF_VERSION_MASK)
+			>> FSI_SLAVE_CONF_VERSION_SHIFT;
+		type = (conf & FSI_SLAVE_CONF_TYPE_MASK)
+			>> FSI_SLAVE_CONF_TYPE_SHIFT;
+
+		/*
+		 * Unused address areas are marked by a zero type value; this
+		 * skips the defined address areas
+		 */
+		if (type != 0) {
+
+			/* create device */
+			dev = fsi_create_device(slave);
+			if (!dev)
+				return -ENOMEM;
+
+			dev->slave = slave;
+			dev->engine_type = type;
+			dev->version = version;
+			dev->unit = i;
+			dev->addr = engine_addr;
+			dev->size = slots * engine_page_size;
+
+			dev_info(&slave->dev,
+			"engine[%i]: type %x, version %x, addr %x size %x\n",
+					dev->unit, dev->engine_type, version,
+					dev->addr, dev->size);
+
+			device_initialize(&dev->dev);
+			dev_set_name(&dev->dev, "%02x:%02x:%02x:%02x",
+					slave->master->idx, slave->link,
+					slave->id, i - 2);
+
+			rc = device_add(&dev->dev);
+			if (rc) {
+				dev_warn(&slave->dev, "add failed: %d\n", rc);
+				put_device(&dev->dev);
+			}
+		}
+
+		engine_addr += slots * engine_page_size;
+
+		if (!(conf & FSI_SLAVE_CONF_NEXT_MASK))
+			break;
+	}
+
+	return 0;
+}
+
 static void fsi_slave_release(struct device *dev)
 {
 	struct fsi_slave *slave = to_fsi_slave(dev);
@@ -112,7 +239,8 @@ static int fsi_slave_init(struct fsi_master *master,
 		return rc;
 	}
 
-	return rc;
+	fsi_slave_scan(slave);
+	return 0;
 }
 
 /* FSI master support */
diff --git a/include/linux/fsi.h b/include/linux/fsi.h
index 6d843d4..dfd3513 100644
--- a/include/linux/fsi.h
+++ b/include/linux/fsi.h
@@ -22,6 +22,10 @@ struct fsi_device {
 	struct device		dev;
 	u8			engine_type;
 	u8			version;
+	u8			unit;
+	struct fsi_slave	*slave;
+	uint32_t		addr;
+	uint32_t		size;
 };
 
 struct fsi_device_id {
-- 
1.8.2.2
