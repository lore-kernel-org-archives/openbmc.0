Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t6Wrt4J3VzDvXl
 for <openbmc@lists.ozlabs.org>; Mon, 31 Oct 2016 09:10:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=0kwzcUf8; 
 dkim-atps=neutral
Received: by mail-oi0-x242.google.com with SMTP id v84so2662163oie.2
 for <openbmc@lists.ozlabs.org>; Sun, 30 Oct 2016 15:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=D3AxEvUEVE4FrzO0T+SjpFnrsP+z24wfI2EyATOqTTQ=;
 b=0kwzcUf8WRBTjE6Ifcb9vr68+mpR3Q0Sn/syG9nyIEB3dv7BcCk+9Ob0Adja3ajYU7
 IzLMF4oyRqv8hdaEykLP9+w5LlJhE/Ua4AC8qjYDldl/6CMGIzT6SAym6VprGmiHtDiS
 zTXQA6MYZ/NM+BuPXeTQgGcT7KvHh1DQyjW12+pBjkYrYgg2SebLDcOwdmg9Bazy+5qo
 AOVBD/AyD2ohgKsBX+Hcx78VmZHS6+Z9dKkkdpzUqiHCmozbxFc2U84bsO5HgPRZnFlg
 padkukjw3mpWD7Kfi45/ooBlSZ907l3KgftC+l/Ijqcqlwt9hmH84rsCPjcMAW2iUnGc
 /jHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=D3AxEvUEVE4FrzO0T+SjpFnrsP+z24wfI2EyATOqTTQ=;
 b=au2LBnOsiKe9ajB3ERR1j4KVvjUW29hIBdbLcN0ZjB3DZdEHFZrrU/qq61BSByceEv
 uGLOm2ZVpDN5PmBwwGFOQCecfDT6g9B0FTbGWSrmg0CH3BvAyLx8DJxcCMQr7Q79d1bL
 omC5U7oiAEi0p2uOx0S6PpAfFqXekstxDNp5eAVSCZIoohGNm4blwt6wRJ5Dbo55E7aS
 jj4NNh90fl98iltvZ4r54Pg7dacQ6z2mfzf//jivdqc99nR6UyrHVjsEevXp4PHTO8q+
 ZSvC4TCJO7KesQ3EC2QEEf7FzaTACNekbDujZXBr0Z8jfQPsy7mSpcp3GBBnWQzz2uMj
 nYSA==
X-Gm-Message-State: ABUngvcGywHwlYfBVYFwMAK+Cf4L0Hssn6Ir2IZgcfIrSe2SnRUAT7qCi56Q0qDx8ZoX/g==
X-Received: by 10.202.56.132 with SMTP id f126mr24647804oia.73.1477865420850; 
 Sun, 30 Oct 2016 15:10:20 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id q59sm7585484ota.20.2016.10.30.15.10.19
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sun, 30 Oct 2016 15:10:20 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Jeremy Kerr <jk@ozlabs.org>, Chris Bostic <cbostic@us.ibm.com>
Subject: [PATCH linux v6 11/18] fsi: scan slaves & register devices
Date: Sun, 30 Oct 2016 17:09:32 -0500
Message-Id: <1477865379-11566-31-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailer: git-send-email 2.7.4 (Apple Git-66)
In-Reply-To: <1477865379-11566-1-git-send-email-christopher.lee.bostic@gmail.com>
References: <1477865379-11566-1-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Sun, 30 Oct 2016 22:10:23 -0000

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
