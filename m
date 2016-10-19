Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-it0-x242.google.com (mail-it0-x242.google.com
 [IPv6:2607:f8b0:4001:c0b::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sznhm2SGhzDvWr
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 10:10:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=aU7QmEkA; 
 dkim-atps=neutral
Received: by mail-it0-x242.google.com with SMTP id e203so3157484itc.1
 for <openbmc@lists.ozlabs.org>; Wed, 19 Oct 2016 16:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=D3AxEvUEVE4FrzO0T+SjpFnrsP+z24wfI2EyATOqTTQ=;
 b=aU7QmEkAFzn8v+xHu4uEhFeVp2gVuKWhPLan/0yECLxtaCSF5D5L2f72Y/MxRaMkQp
 FvNMy4yXRIhqz266bfCqKPfewyWhmpPYYDLuzBJHjUUv+PF7XjkkdEXpfT+hAIj6X2yW
 HUpvi7CQ1CCzZzV2ZQNcR2If/o3/sdYuPY5FyR3yDMslVy2PiktQLbpUg1EOr7Epl38b
 j9J+COtZ0xJ66IeTCS3PzTWlouyCKN5DeaQ16hVfYa+KpAcqeboVCu88d1J5YoJ1S1g0
 jR72nRciQ+sjUUkSHsEGE42kqLyppuDSasag+c/7uVolfoE/fSsB70th+irkXmMSUyAr
 Nmdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=D3AxEvUEVE4FrzO0T+SjpFnrsP+z24wfI2EyATOqTTQ=;
 b=DY8xoQpMvGL2gvTbxLgjE76aUJIB7idzBgB+9Qja/pxq9aiuwDa4yB4tLy8BAOXk7U
 ckYTObYHtY/lPv5+oSdStOxaT703tzSpM/UXPMDBQxPdYndL+E2UFrWo/dKXYFksuG6+
 4+bMEAEVF7fZoIP5IkJw8TdweCGzzXmTHVKksfjOWeQSCXvfPgTF8DoB/g7QsStjHojl
 nAX5ipe197BV4OejzSvGU1B/Kuvk9f8+pGf2Oub3hwVGCEM8nrbs0cR7e1G3HL97Je79
 xtbsWtnRTwMXIBfWUWqQB0ea+Y9rt6l/mfnEImKe9Q1gmRhm38yJGQqXaMmdeVAzk4tY
 kXzA==
X-Gm-Message-State: AA6/9Rmba68IilVdq9VwvOHfcokNWToaBkRws9+DE4rKklmcZI27mNAuhoDyex1gSddHLg==
X-Received: by 10.202.86.22 with SMTP id k22mr6154893oib.70.1476918598545;
 Wed, 19 Oct 2016 16:09:58 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id n196sm15487618oig.8.2016.10.19.16.09.57
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Wed, 19 Oct 2016 16:09:58 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Jeremy Kerr <jk@ozlabs.org>, Chris Bostic <cbostic@us.ibm.com>
Subject: [PATCH linux v5 11/18] fsi: scan slaves & register devices
Date: Wed, 19 Oct 2016 18:09:39 -0500
Message-Id: <1476918586-13475-12-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailer: git-send-email 2.7.4 (Apple Git-66)
In-Reply-To: <1476918586-13475-1-git-send-email-christopher.lee.bostic@gmail.com>
References: <1476918586-13475-1-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Wed, 19 Oct 2016 23:10:00 -0000

From: Jeremy Kerr <jk@ozlabs.org>

Now that we have fsi_slave devices, scan each for endpoints, and
register them on the fsi bus.

Includes contributions from Chris Bostic <cbostic@us.ibm.com>.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
Signed-off-by: Chris Bostic <cbostic@us.ibm.com>
---
 drivers/fsi/fsi-core.c | 128 ++++++++++++++++++++++++++++++++++++++++++++++++-
 include/linux/fsi.h    |   4 ++
 2 files changed, 131 insertions(+), 1 deletion(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 4282370..50e0616 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -24,6 +24,16 @@
 
 #define FSI_N_SLAVES	4
 
+#define FSI_SLAVE_CONF_NEXT_MASK	0x80000000
+#define FSI_SLAVE_CONF_SLOTS_MASK	0x00ff0000
+#define FSI_SLAVE_CONF_SLOTS_SHIFT	16
+#define FSI_SLAVE_CONF_VERSION_MASK	0x0000f000
+#define FSI_SLAVE_CONF_VERSION_SHIFT	12
+#define FSI_SLAVE_CONF_TYPE_MASK	0x00000ff0
+#define FSI_SLAVE_CONF_TYPE_SHIFT	4
+
+static const int engine_page_size = 0x400;
+
 static atomic_t master_idx = ATOMIC_INIT(-1);
 
 struct fsi_slave {
@@ -35,6 +45,30 @@ struct fsi_slave {
 
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
@@ -61,6 +95,97 @@ static bool check_crc4_u32(uint32_t x)
 }
 
 /* FSI slave support */
+static int fsi_slave_read(struct fsi_slave *slave, uint32_t addr,
+		void *val, size_t size)
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
+		uint8_t slots, version, type;
+		struct fsi_device *dev;
+
+		rc = fsi_slave_read(slave, (i + 1) * sizeof(conf),
+				&conf, sizeof(conf));
+		if (rc) {
+			dev_warn(&slave->dev,
+					"error reading slave registers\n");
+			return -1;
+		}
+
+		conf = be32_to_cpu(conf);
+
+		if (!check_crc4_u32(conf)) {
+			dev_warn(&slave->dev,
+				"crc error in slave register at 0x%04x\n",
+					i);
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
 
 static void fsi_slave_release(struct device *dev)
 {
@@ -112,7 +237,8 @@ static int fsi_slave_init(struct fsi_master *master,
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
