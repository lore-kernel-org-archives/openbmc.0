Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com
 [IPv6:2607:f8b0:4003:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMXsg6jn7zDvjC
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 13:41:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="W5YjyGwb"; 
 dkim-atps=neutral
Received: by mail-oi0-x243.google.com with SMTP id u15so754074oie.3
 for <openbmc@lists.ozlabs.org>; Sun, 20 Nov 2016 18:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=acy+p5nLsWIw8Ox9MtIPR69Zjx+TBt/349Z52PQKWNQ=;
 b=W5YjyGwbnOETMVg7kZtkkfGuFZjcIm/hiaWZu4K1uqblCBNXpiWg/tTl4UGHKUEfmp
 lAhUe6VLdgT/i8a/k6gzmZLH4ff2NIwPsl6K/Stw3kUF5nvN8Ryr1wqIgN8zTuvo2dIy
 5HsG7J2cJVFL2E03jZOEel6LgczeVfTyf8OJH0yXVyjhvVsL/+EeXjNj7e5rV14NBSeE
 S9J1LC6hz2HyM/2BDBBX78bJVHbRlZ+bknER3NoDHLCVfwlHslO5cWewMFPyNlfywJEK
 lVAPEEPBLaabZN2LVhmdPL4z8jqEpUc+Khkr6VWgaOSc/2HTzBujJL14OQVmJ8Qu45aI
 Q25Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=acy+p5nLsWIw8Ox9MtIPR69Zjx+TBt/349Z52PQKWNQ=;
 b=F8XBC7pmd4EFushC50m5O3bNCPUD0RnZMlNy/Jt9sm/vTgLR92xzf0QWWLyBd8/JzW
 f9cqPB//G7wT9blPfoHvWPGy9njivqeDl2iaiFmyimscyXWFgtYlm3D2AWXomGEGL+6V
 J2rgvF1H+QgiSDtgU89ddrh7cN2bBcE2fv8N+cuIaIHWXLqZSgztE7GZnTqzgysckIuw
 Hk8W0ti755ZlfyBw7lEmp8HnYQLw19KSuP2bWQsmMZ+eZpZoTtSSILm1kHzjrXhtRikf
 harQ9u2qszwTerIOUYC+9QN6/8zp39wgKqlbi7DoS62LO/2f0N5/cu2Rx5/DERuoSYkA
 +OkA==
X-Gm-Message-State: AKaTC01GLNSdUuEU07TzMdlXxCvZaaDBSjPfpbwpGQo5skY03kgYFgltFuvNYI0lPJ2L9w==
X-Received: by 10.157.19.23 with SMTP id f23mr6894975ote.116.1479696070192;
 Sun, 20 Nov 2016 18:41:10 -0800 (PST)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id 73sm6432307otf.16.2016.11.20.18.41.09
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sun, 20 Nov 2016 18:41:09 -0800 (PST)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org, gustavo.padovan@collabora.co.uk,
 gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch, jthumshirn@suse.de,
 dan.j.williams@intel.com, sre@kernel.org, clg@kaod.org,
 k.kozlowski@samsung.com
Cc: jk@ozlabs.org, joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 benh@kernel.crashing.org, alistair@popple.id.au,
 Chris Bostic <cbostic@us.ibm.com>
Subject: [PATCH linux 12/19] fsi: Add device read/write/peek functions
Date: Sun, 20 Nov 2016 20:40:41 -0600
Message-Id: <1479696048-75851-13-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Mon, 21 Nov 2016 02:41:12 -0000

From: Jeremy Kerr <jk@ozlabs.org>

This change introduces the fsi device API: simple read, write and peek
accessors for the devices' address spaces.

Includes contributions from Chris Bostic <cbostic@us.ibm.com>

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
Signed-off-by: Chris Bostic <cbostic@us.ibm.com>
---
 drivers/fsi/fsi-core.c | 47 +++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/fsi.h    |  7 ++++++-
 2 files changed, 53 insertions(+), 1 deletion(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index c7c8bad..e7a3e57 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -35,6 +35,8 @@
 #define FSI_SLAVE_CONF_CRC_MASK		0x0000000f
 #define FSI_SLAVE_CONF_DATA_BITS	28
 
+#define FSI_PEEK_BASE			0x410
+
 static const int engine_page_size = 0x400;
 
 static atomic_t master_idx = ATOMIC_INIT(-1);
@@ -48,8 +50,46 @@ struct fsi_slave {
 
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
+EXPORT_SYMBOL_GPL(fsi_device_read);
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
+EXPORT_SYMBOL_GPL(fsi_device_write);
+
+int fsi_device_peek(struct fsi_device *dev, void *val)
+{
+	uint32_t addr = FSI_PEEK_BASE + ((dev->unit - 2) * sizeof(uint32_t));
+
+	return fsi_slave_read(dev->slave, addr, val, sizeof(uint32_t));
+}
+
 static void fsi_device_release(struct device *_device)
 {
 	struct fsi_device *device = to_fsi_dev(_device);
@@ -102,6 +142,13 @@ static int fsi_slave_read(struct fsi_slave *slave, uint32_t addr,
 			slave->id, addr, val, size);
 }
 
+static int fsi_slave_write(struct fsi_slave *slave, uint32_t addr,
+			const void *val, size_t size)
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
