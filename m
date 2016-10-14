Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-pf0-x244.google.com (mail-pf0-x244.google.com
 [IPv6:2607:f8b0:400e:c00::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3swhjf4kHhzDt4v
 for <openbmc@lists.ozlabs.org>; Sat, 15 Oct 2016 09:15:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=w1PPcSm2; 
 dkim-atps=neutral
Received: by mail-pf0-x244.google.com with SMTP id 128so7976340pfz.1
 for <openbmc@lists.ozlabs.org>; Fri, 14 Oct 2016 15:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=bxEqnA/yyPq/VWP2/7tNrEYHytB6CJh4ph8PR9kRf20=;
 b=w1PPcSm2w+P+7LbipqlTcx1rsgZqLY0icYBw8UX5B1LlcbIT3THNDeNyGdjPUEvkae
 cHcDsJnZ735EPUArGdVfd6UunDKpXTXSJt40RImTlK4WHxgZm9UrVsGAI8YFnwuZKpuy
 CSaRVMBu8hBCiXQ6HHsHuZJoBDllqg1CQA8BVEH9ZJTyiMJq6Qm9PQInx/a0BCn/qD28
 W6Sx3WjW91VEh5UtEyzOe6aGOjL7laJo0TE4P5Mm66aqq91ucptdMq3/Pjz4QbG6Cn0q
 i6tgnaODu0H6k9AvQSMvpIHJvfRAq2I2ZQrqTmm4UdpL6ecxi3D/EQm/3dZ8XPy08/gO
 vWTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=bxEqnA/yyPq/VWP2/7tNrEYHytB6CJh4ph8PR9kRf20=;
 b=hGgZClFWmMDh8rgaynrGJ2MIM82+Rea5GTxhttcVb5QMdvtIig0PF2hvYdWQkdApAS
 FKzdAsmdUcBTHjgNN6rkfDKsukB9VM9xf4A+08fxjfLsx/7jqiKIOm+OmCXYuWxAVNh9
 nF5//A65m4xpTf57KRtkYHi/lIWKIQcuiplzsGX96oVAUKzep3rf1eP+XTdWoWe+eOTM
 UveFAH2xUbdurxNwZw/ruusA8EFfAqLX7gOykt1BaNzy53Ikfe4kv6rKpko5ZTKKp9sn
 wjjljneX/oI+f0i040ALaAS/7hsI6WCh0Y8OT4cgft/SveIRaT7Cc1Cw4XVx6v16/9+S
 xFFA==
X-Gm-Message-State: AA6/9Rm8YRWfmZ+Z4Lc0rpYPya8wqCxnf+ZMcsuJOn3pe3yonBf4/FyB6Weu+ow/T14fYQ==
X-Received: by 10.99.60.19 with SMTP id j19mr17601584pga.8.1476483301091;
 Fri, 14 Oct 2016 15:15:01 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id p7sm29848874paa.3.2016.10.14.15.15.00
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Fri, 14 Oct 2016 15:15:00 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH linux v4 10/20] fsi: Implement slave initialisation
Date: Fri, 14 Oct 2016 17:14:32 -0500
Message-Id: <1476483282-85971-11-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Fri, 14 Oct 2016 22:15:03 -0000

From: Jeremy Kerr <jk@ozlabs.org>

Create fsi_slave devices during the master scan.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 drivers/fsi/fsi-core.c | 50 ++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 48 insertions(+), 2 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 24538ae..49a8e14 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -18,6 +18,7 @@
 #include <linux/device.h>
 #include <linux/fsi.h>
 #include <linux/module.h>
+#include <linux/slab.h>
 
 #include "fsi-master.h"
 
@@ -58,12 +59,57 @@ static bool check_crc4(uint32_t x)
 }
 
 /* FSI slave support */
+
+static void fsi_slave_release(struct device *dev)
+{
+	struct fsi_slave *slave = to_fsi_slave(dev);
+	kfree(slave);
+}
+
 static int fsi_slave_init(struct fsi_master *master,
 		int link, uint8_t slave_id)
 {
-	/* todo: initialise slave device, perform engine scan */
+	struct fsi_slave *slave;
+	uint32_t chip_id;
+	int rc;
+
+	rc = master->read(master, link, slave_id, 0, &chip_id, sizeof(chip_id));
+	if (rc) {
+		dev_warn(master->dev, "can't read slave %02x:%02x: %d\n",
+				link, slave_id, rc);
+		return -ENODEV;
+	}
+
+	chip_id = be32_to_cpu(chip_id);
+	if (!check_crc4(chip_id)) {
+		dev_warn(master->dev, "slave %02x:%02x: invalid chip id CRC!\n",
+				link, slave_id);
+		return -EIO;
+	}
+
+	pr_debug("fsi: found chip %08x at %02x:%02x:%02x\n",
+			master->idx, chip_id, link, slave_id);
+
+	/* we can communicate with a slave; create devices and scan */
+	slave = kzalloc(sizeof(*slave), GFP_KERNEL);
+	if (!slave)
+		return -ENOMEM;
+
+	slave->master = master;
+	slave->id = slave_id;
+	slave->dev.parent = master->dev;
+	slave->dev.release = fsi_slave_release;
+
+	dev_set_name(&slave->dev, "slave@%02x:%02x", link, slave_id);
+	rc = device_register(&slave->dev);
+	if (rc < 0) {
+		dev_warn(master->dev, "failed to create slave device: %d\n",
+				rc);
+		put_device(&slave->dev);
+		return rc;
+	}
 
-	return -ENODEV;
+	return rc;
 }
 
 /* FSI master support */
-- 
1.8.2.2
