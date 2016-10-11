Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3str4y26vlzDsrX
 for <openbmc@lists.ozlabs.org>; Wed, 12 Oct 2016 08:40:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=ybIqYY7c; 
 dkim-atps=neutral
Received: by mail-oi0-x242.google.com with SMTP id d132so2259917oib.2
 for <openbmc@lists.ozlabs.org>; Tue, 11 Oct 2016 14:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=UMtP0jgsLfFY2L+xgQOZn9EF88jTMovfMQRiIvtQ3g8=;
 b=ybIqYY7ctMN6OZ9SXKRhIp1ZhxGK69zJv+e9Si5IFcPIXVKXVuKIaJHVBDujLV/a/e
 dy0CVIqwUiqHG126eE2tqk0YalpPSqER/6e8/rXSB+0IUaHfNyze/gmXhEEKEeA2kEkK
 GLcbYwjOlthrHJH//OESvpF0bBU/46vxNkCnXZuyNH1Ol2Q5ixsZMyuO7L8Wwwer3Lz2
 +l+SWPgOy1ZRdtze5hvJdnrdXt7AAN2f7IeuBHiGr22Z+f8Sga6weEVH6UM8uK/aBGiD
 NVPNlCtsjDalwgBB5HJDjCwlJL+DdN3JtkhpiJrEJEOJ+FF/pxZ66nZfvvtPcoD4vEAn
 biVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=UMtP0jgsLfFY2L+xgQOZn9EF88jTMovfMQRiIvtQ3g8=;
 b=i+Bb5fovQfS/EDhijwIm0GTT0gmRJA/KRxQJ2SUBQdC0ZppqNEbrl0YgUB26MMiQEt
 HeHrTZtqNzcDs7Yc3PNGq0ug0MyxdDkhiK7p+Ky0qs6/Hk7zk4XV972bEWZ2guWv8/7a
 JaoHg/9x2I+kmarGjLuxIh5ec+Gy0sEoK6DoGXJohKhGswgyCAoMkRMirnUhAv8sep4X
 +8cMDs7vPf4ZaznZuSVeMvJjO7oUE5Jihay7ds5MSeSh3ouwAcCAD4dBJRfFWuoE5eLA
 eOz5Kv2s2+Ruhb6EZ8oQ9d/AgmXzZ428rz7owiWYbn33JgH5DHIbA7K6UVieQ0uraqVk
 AGZw==
X-Gm-Message-State: AA6/9Rmzn/s4Q/6EYcaCWpU2gTo1EGV4xt7L7AoXW2r0rvwWEwMAGedBtUE6NW8S0EMZDA==
X-Received: by 10.157.43.11 with SMTP id o11mr3326834otb.58.1476222016597;
 Tue, 11 Oct 2016 14:40:16 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id h91sm1811153oth.40.2016.10.11.14.40.16
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Tue, 11 Oct 2016 14:40:16 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH linux v3 12/18] fsi: Add device read/write/peek functions
Date: Tue, 11 Oct 2016 16:39:57 -0500
Message-Id: <1476222003-99697-13-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Tue, 11 Oct 2016 21:40:18 -0000

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
