Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x241.google.com (mail-oi0-x241.google.com
 [IPv6:2607:f8b0:4003:c06::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t6WrT5SRdzDvXl
 for <openbmc@lists.ozlabs.org>; Mon, 31 Oct 2016 09:10:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=QF0wwIG4; 
 dkim-atps=neutral
Received: by mail-oi0-x241.google.com with SMTP id i127so8937768oia.0
 for <openbmc@lists.ozlabs.org>; Sun, 30 Oct 2016 15:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=H0a9CyEe1rSA91LmRC5np98xWuZQEugAz+ebSOsMmBg=;
 b=QF0wwIG4/DvgV1CUP8lyq8EjeVpqmmHakmVb0nmh8zEzYGESpxBptrq4rTeVb6QA6a
 4PzQZeNCQGmEIJytP2PxosXp9mR8u6Ao9+uyu4pBt6kY3Rg3op9Lp4UtykVjydgOjaqc
 9etEuEINv0p1JxrLMGZUyDjLI4tU3qKYYPMnenpTHZNc3L4c4CInu+9MO+nu41RKZjmy
 j0pm6AOcLDnXGAd8kt5gaMJMDdHYSmsxNnsucOceHMevt1uU8VG9Le/FrA7BERgZ7CoH
 aFThBRZuoP+eZrd7rGOQ8A1XBYLg3xch7+eYM7AFArNoVDqBCRy/Rh4y0MNl0xgTX/AE
 Qp2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=H0a9CyEe1rSA91LmRC5np98xWuZQEugAz+ebSOsMmBg=;
 b=E7TjvcSXnkVuqgAc7WwMo3VuRjAzcDefipMmK2VzaJq9osOGjwqWjrR/PPraCLtxDM
 7xMYTgX3ik3H0x9lWlfDER8qSm8lqlEPUi+pGbmwz+dx1AajLokC30GVBMH5I1Nje2AA
 RJhGiSHNQqYmKLQZ4NtAxnzAwdtECJPpHFvHxiwZSHbRetM9e1D0YsyYu9+uN0bw+/tR
 5aNue0fuHu01s+rtt9we8Fm+oIV9Jj+pzSSmfeu7dIevf70FrZzwLSUf6jG4JdMEwCpD
 fq48LUY1yEo+/Jw/7Ghn9Q9MB3+vWWASNoGKecBGUMkB83+FJgDn+p5TjnzrmUuLJJOZ
 d6hQ==
X-Gm-Message-State: ABUngvcxNq6axncbIZpMDo340s4B74k8aQhPPp6l8PG7DWzu++mPyPkqxsVbMwzfZgHIfQ==
X-Received: by 10.202.88.84 with SMTP id m81mr22856542oib.147.1477865399784;
 Sun, 30 Oct 2016 15:09:59 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id q59sm7585484ota.20.2016.10.30.15.09.58
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sun, 30 Oct 2016 15:09:59 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH linux v6 12/18] fsi: Add device read/write/peek functions
Date: Sun, 30 Oct 2016 17:09:14 -0500
Message-Id: <1477865379-11566-13-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Sun, 30 Oct 2016 22:10:02 -0000

From: Jeremy Kerr <jk@ozlabs.org>

This change introduces the fsi device API: simple read, write and peek
accessors for the devices' address spaces.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 drivers/fsi/fsi-core.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/fsi.h    |  7 ++++++-
 2 files changed, 50 insertions(+), 1 deletion(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 50e0616..565c7e3 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -32,6 +32,8 @@
 #define FSI_SLAVE_CONF_TYPE_MASK	0x00000ff0
 #define FSI_SLAVE_CONF_TYPE_SHIFT	4
 
+#define FSI_PEEK_BASE			0x410
+
 static const int engine_page_size = 0x400;
 
 static atomic_t master_idx = ATOMIC_INIT(-1);
@@ -45,7 +47,42 @@ struct fsi_slave {
 
 #define to_fsi_slave(d) container_of(d, struct fsi_slave, dev)
 
+static int fsi_slave_read(struct fsi_slave *slave, uint32_t addr,
+		void *val, size_t size);
+static int fsi_slave_write(struct fsi_slave *slave, uint32_t addr,
+		const void *val, size_t size);
+
 /* FSI endpoint-device support */
+int fsi_device_read(struct fsi_device *dev, uint32_t addr, void *val,
+		size_t size)
+{
+	if (addr > dev->size)
+		return -EINVAL;
+
+	if (addr + size > dev->size)
+		return -EINVAL;
+
+	return fsi_slave_read(dev->slave, dev->addr + addr, val, size);
+}
+
+int fsi_device_write(struct fsi_device *dev, uint32_t addr, const void *val,
+		size_t size)
+{
+	if (addr > dev->size)
+		return -EINVAL;
+
+	if (addr + size > dev->size)
+		return -EINVAL;
+
+	return fsi_slave_write(dev->slave, dev->addr + addr, val, size);
+}
+
+int fsi_device_peek(struct fsi_device *dev, void *val)
+{
+	uint32_t addr = FSI_PEEK_BASE + ((dev->unit - 2) * sizeof(uint32_t));
+
+	return fsi_slave_read(dev->slave, addr, val, sizeof(uint32_t));
+}
 
 static void fsi_device_release(struct device *_device)
 {
@@ -102,6 +139,13 @@ static int fsi_slave_read(struct fsi_slave *slave, uint32_t addr,
 			slave->id, addr, val, size);
 }
 
+static int fsi_slave_write(struct fsi_slave *slave, uint32_t addr,
+		const void *val, size_t size)
+{
+	return slave->master->write(slave->master, slave->link,
+			slave->id, addr, val, size);
+}
+
 static int fsi_slave_scan(struct fsi_slave *slave)
 {
 	uint32_t engine_addr;
diff --git a/include/linux/fsi.h b/include/linux/fsi.h
index dfd3513..47af0af 100644
--- a/include/linux/fsi.h
+++ b/include/linux/fsi.h
@@ -28,6 +28,12 @@ struct fsi_device {
 	uint32_t		size;
 };
 
+extern int fsi_device_read(struct fsi_device *dev, uint32_t addr,
+		void *val, size_t size);
+extern int fsi_device_write(struct fsi_device *dev, uint32_t addr,
+		const void *val, size_t size);
+extern int fsi_device_peek(struct fsi_device *dev, void *val);
+
 struct fsi_device_id {
 	u8	engine_type;
 	u8	version;
@@ -41,7 +47,6 @@ struct fsi_device_id {
 #define FSI_DEVICE_VERSIONED(t, v) \
 	.engine_type = (t), .version = (v),
 
-
 struct fsi_driver {
 	struct device_driver		drv;
 	const struct fsi_device_id	*id_table;
-- 
1.8.2.2
