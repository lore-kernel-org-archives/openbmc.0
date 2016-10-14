Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-pa0-x241.google.com (mail-pa0-x241.google.com
 [IPv6:2607:f8b0:400e:c03::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3swhjh6N5JzDt4h
 for <openbmc@lists.ozlabs.org>; Sat, 15 Oct 2016 09:15:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=cwg9P761; 
 dkim-atps=neutral
Received: by mail-pa0-x241.google.com with SMTP id os4so2458535pac.3
 for <openbmc@lists.ozlabs.org>; Fri, 14 Oct 2016 15:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=UMtP0jgsLfFY2L+xgQOZn9EF88jTMovfMQRiIvtQ3g8=;
 b=cwg9P7618/lEMex6mfZab58Sv0ckG0NkGHWPgZ69VjBe2Eh9XbDmdD5DCgp4hvQ4A3
 36mPM/ZsTcjm0akO96bhO4nEsrMrxMZ8n8Wz8EEGhzd4BEtXmeA9SlydxU78XSob8BhO
 GQJuXr91BgmcF/0GgJhelCr32yrwJg7BpcJGjDPKpaLSmswDaGoFQo4MQSqh7NWOTuXx
 USycfSSEbCTGSOFW4vEOEzckeWg43TgUUFqigfRwSBgBjkOo2xjuwkMd2G9b9UwUWXQs
 D6Wo9T0oeZHlWjeqP2dJIayrNs9R4D5vKj9B2udNQ03eOIC2/29FsbUdXKAlPj4E1w0Z
 ggjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=UMtP0jgsLfFY2L+xgQOZn9EF88jTMovfMQRiIvtQ3g8=;
 b=U1jdifJ7uhsUrmUv4+IeJwR1tm2mZz/h2CUOc2TUDtRIQWPI5cdcSnQZBkoHZmLViB
 7IMvQ8yKV1A+Z81taoBkj9S2OCSjN8m/+nimR+1mQrvQcr4h03WBeIpAg7gflsL36+31
 CnzKOjlE1XL6TsIl8Fup0dN0FI8wr6GgFSmoa5ravtjAHnr5VUQa2uGNDElX9Ee2fzhV
 98bmBhIdWLS7hibvLXOwA0gZGuJaz4at5qrZak8lF1fAUoiGE7ajlZ0U3KQ+OoDPKWBd
 SEMkeR8WfXpGQYEzLrP1WjS9rK7mWnygCs3CEEOgBEVCAK/CUjvTu9Cxb/54K3WxebrN
 3UZw==
X-Gm-Message-State: AA6/9Rn11gllLyj+CI+fkzLVFt8/pVoXEPhIAPUYqcXf/qVH/C+qjy2aqeQIrO/3oUZbbg==
X-Received: by 10.67.30.170 with SMTP id kf10mr17775692pad.81.1476483303145;
 Fri, 14 Oct 2016 15:15:03 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id p7sm29848874paa.3.2016.10.14.15.15.02
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Fri, 14 Oct 2016 15:15:02 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH linux v4 12/20] fsi: Add device read/write/peek functions
Date: Fri, 14 Oct 2016 17:14:34 -0500
Message-Id: <1476483282-85971-13-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailer: git-send-email 2.7.4 (Apple Git-66)
In-Reply-To: <1476483282-85971-1-git-send-email-christopher.lee.bostic@gmail.com>
References: <1476483282-85971-1-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Fri, 14 Oct 2016 22:15:05 -0000

From: Jeremy Kerr <jk@ozlabs.org>

This change introduces the fsi device API: simple read, write and peek
accessors for the devices' address spaces.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 drivers/fsi/fsi-core.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/fsi.h    |  7 ++++++-
 2 files changed, 50 insertions(+), 1 deletion(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 63d26b5..10bf817 100644
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
@@ -99,6 +136,13 @@ static int fsi_slave_read(struct fsi_slave *slave, uint32_t addr,
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
