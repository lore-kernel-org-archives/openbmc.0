Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x244.google.com (mail-oi0-x244.google.com
 [IPv6:2607:f8b0:4003:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sq7M753BvzDrPG
 for <openbmc@lists.ozlabs.org>; Thu,  6 Oct 2016 07:54:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=Hf+TwpFU; 
 dkim-atps=neutral
Received: by mail-oi0-x244.google.com with SMTP id h186so12302120oia.3
 for <openbmc@lists.ozlabs.org>; Wed, 05 Oct 2016 13:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=5/l9GSguLmdsNaTyjE0TJqyq8mDG562gCo7EDwgmE4E=;
 b=Hf+TwpFUUcuECaGxxmq6UJJusrDsXS26pYDl54gO5Vfd1GtskZ+ls87/Mta80rAGAx
 KeNVEw2jcjaO6nxycKUA1RKzVsgDZuQkN3JT20dYJ8/M76tTqjqU6RrVtSktNMHEFb+Z
 v+ZO4CpXdX0dG0Nxnb0p2UWAdoU4fF0wsnYE+GSMYloGSwIDQlBLsyscLKLxJmNUfEzK
 bVolLJy8Mcn32YLjTRehuwY9Wu+lqZFJDol2NYnxT2nq7r5jmSTrzr69n1Y2NLY2qtko
 QRsEgTGZMVEE8lsj+U7deyz2rlwAg6AyU8l6GUivAeq2KqvTusUdJpaI6TZ0FzBegvAS
 OV4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=5/l9GSguLmdsNaTyjE0TJqyq8mDG562gCo7EDwgmE4E=;
 b=SlH07yDxjpqHez64Tsrr0dUxOODRN4Ne6gLFBUcqWt7hE4c/x1/pugfiiwb0iFKz2B
 hugyLcPj6KY1n1wApfDCyiMrEIxppEP3WKmSfkqK8ntfq6Kh0s6WJJx5IYqOebmjTjL5
 yk3vdOKqwNcIdr/nJ+slO/Ac7sCHNMlM7ywvI3h4jMqECIJopo92jPMij1eW/OUa4au6
 C6yM39V3BVKi98cOnW0FnwFWy2e1fAPeIEsYFKWmgMRHhbMihO/L05kADuTbj9OhVtcX
 8sOey5wYQgD/OhNKQOz5iXCk8Lpq0qnFVvxWOFN2Mu1YEbRDm6jWZ9jWnDrdphoPK0iC
 aIkg==
X-Gm-Message-State: AA6/9RklkpGALO2/jhKh4zr1UsuqQvK9ZYdtsWfmJSGFqjcSWZup4mVwrqmGRuYtqEhUrw==
X-Received: by 10.202.225.196 with SMTP id y187mr9363580oig.131.1475700881999; 
 Wed, 05 Oct 2016 13:54:41 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id i18sm3206459oib.12.2016.10.05.13.54.41
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Wed, 05 Oct 2016 13:54:41 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH linux 11/15] fsi: scan slaves & register devices
Date: Wed,  5 Oct 2016 15:54:24 -0500
Message-Id: <1475700868-75737-12-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Wed, 05 Oct 2016 20:54:44 -0000

From: Jeremy Kerr <jk@ozlabs.org>

Now that we have fsi_slave devices, scan each for endpoints, and
register them on the fsi bus.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 drivers/fsi/fsi-core.c | 125 ++++++++++++++++++++++++++++++++++++++++++++++++-
 include/linux/fsi.h    |   4 ++
 2 files changed, 128 insertions(+), 1 deletion(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 49a8e14..63d26b5 100644
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
@@ -35,6 +45,29 @@ struct fsi_slave {
 
 #define to_fsi_slave(d) container_of(d, struct fsi_slave, dev)
 
+/* FSI endpoint-device support */
+
+static void fsi_device_release(struct device *_device)
+{
+	struct fsi_device *device = to_fsi_dev(_device);
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
@@ -59,6 +92,95 @@ static bool check_crc4(uint32_t x)
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
+		if (!check_crc4(conf)) {
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
+		/* Unused address areas are marked by a zero type value; this
+		 * skips the defined address areas */
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
@@ -109,7 +231,8 @@ static int fsi_slave_init(struct fsi_master *master,
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
