Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x241.google.com (mail-oi0-x241.google.com
 [IPv6:2607:f8b0:4003:c06::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3srtt60nNDzDrWp
 for <openbmc@lists.ozlabs.org>; Sun,  9 Oct 2016 04:39:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=zHB1d8YT; 
 dkim-atps=neutral
Received: by mail-oi0-x241.google.com with SMTP id i127so3748916oia.0
 for <openbmc@lists.ozlabs.org>; Sat, 08 Oct 2016 10:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=UMtP0jgsLfFY2L+xgQOZn9EF88jTMovfMQRiIvtQ3g8=;
 b=zHB1d8YTqRzxF5LdI+WjPVh3qYNQtFyBHf1g1gh5z2Bo/1/NS/xBv6a9ILnoK9iC5D
 ERG3rZH6nfgVgd60Vic8xiipiRJVVE19Fmsn4Ow1c2MBAtjg104bgD35jk3QVZsE3Rsa
 c9ARGbWEoxBLiJqLSwvb0G8HhBi6DnZBAr5Aw433eHpDeb/1oLKhqBbZi9G4K/7Y1C0z
 FhyvM6vfzFk2wnEvYn13QmjRW5lx76qjIBl91kxxxrbTIe8GZArwhrX/mSscavk7/BWJ
 2x2daQ+pvKCNd5ywUNfJKVprYs4N44MtIfJjrXBNhoTsRlGmCHQAeF0GVxuZlKjDlQmP
 M0qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=UMtP0jgsLfFY2L+xgQOZn9EF88jTMovfMQRiIvtQ3g8=;
 b=flJ+AqAuaSZr2NBm2H8iMhgjAMlOjaxpCX4i1b8oL48kCB5OFip4BHD6UTq1I09by4
 Y4GkBBtpiCsseXzoB/jBmlstBe+ekAsgGzgsRYg8yaDkq3hXPzJ5QgVXHJLkbECSbapW
 aLx6ZhmjEztKZcgFqK5bSvZUCIiVbKAUujnNBfAZ9ToYkJtVGQdoMpjpmp/epzclkNsX
 XODa0Fw1JrB2wEh5/sBO2bYa0eCfMBMNRnFPipYMuvjbB4PcxMv2+MZ4ml6Qb4rcQ+GL
 zS61GWtIrZ7xX8t9ePDm0M8vZlZI2fO81x+QI+27ESbf+15Twnxlm10faVUyxAlRGcMc
 wcCQ==
X-Gm-Message-State: AA6/9RnTM0XN7pxck3t20d2uXmG8/9ufh658Zty/sLowufkJ9d4Tr/FcpSgxgTCCmb0gAQ==
X-Received: by 10.157.11.133 with SMTP id 5mr15177164oth.107.1475948348329;
 Sat, 08 Oct 2016 10:39:08 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id g17sm8025290otd.38.2016.10.08.10.39.07
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sat, 08 Oct 2016 10:39:07 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH linux v2 12/17] fsi: Add device read/write/peek functions
Date: Sat,  8 Oct 2016 12:38:48 -0500
Message-Id: <1475948333-55960-13-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Sat, 08 Oct 2016 17:39:10 -0000

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
