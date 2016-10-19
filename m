Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-it0-x241.google.com (mail-it0-x241.google.com
 [IPv6:2607:f8b0:4001:c0b::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sznhl46NJzDvWg
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 10:09:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=H9Wq99FG; 
 dkim-atps=neutral
Received: by mail-it0-x241.google.com with SMTP id 66so3131950itl.3
 for <openbmc@lists.ozlabs.org>; Wed, 19 Oct 2016 16:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Jdp5c4+veAfWrvg4GEbViZVEuCmmmYtDvrPnTg7J91M=;
 b=H9Wq99FGQ4xODbw3NQNkm8t+aGX3cX7jb0PidHUjmhP5fqeQ2sBjmLqeXffdiVTwgj
 z1JwY+kbVVIV+kJ9K6hT8tELqM5KQHKsqxVL/olkENtLdyrnweG8OA163DLijQeWcyvC
 McDNkuBU4Q/jMBpJfk4KPvn4ZhDOjc4rf1tmJ9ypLO5wVJVt2+p/d05eZVrTDGGd9sj0
 wCNLdGu6jXYwowc3FAVNxzDYXBczZPkqBEDXUbhLVlYVB3YxG/e2jDA0OesjVel4tIUK
 Gofbat5+PtbKL8Rr2Y56AYMWjEHeBI1HxHl7irKYndh9OxMVYFmlE6xGcFKi0hyY0yuy
 hO3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Jdp5c4+veAfWrvg4GEbViZVEuCmmmYtDvrPnTg7J91M=;
 b=Coo7r5lSIFvb+4Y/mkY4BSMryoIjiEeHWcwNXqJxpurliOpLqev7UGekPXmZV/gLnL
 2CDErxxTcAkW3XVilwLufZwukdG6ssRk406LnIT1Tb8XTxHDdJJmTPZNMh9CzV7J5Jm2
 d2rtyuzqgI3cc4tQAzwsK2z5OpIN4UDFrmJR1C06ymjoOuH4Bo0XQJb61xWowl9fAALq
 lmHb0H+M1BOdMnOBT1whVYypmSXi41vkwBX/Z+4ipU+e7DnoqEYpKIJpnPbjIOm+CBTG
 3yKeO4hQd0VdM54HFD5YfxfCIn/wKIJW4njcU9qBT4S9V4yXe9Gujlzdy5R29lv7IJR7
 2MDQ==
X-Gm-Message-State: AA6/9RmYIR/BJJH4nUrpXif7uQp6rSt7aoBL8GC5Ai5j3f9x7MIpQdOZfZaqQ7+D6m0NIA==
X-Received: by 10.202.91.131 with SMTP id p125mr6185123oib.173.1476918597821; 
 Wed, 19 Oct 2016 16:09:57 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id n196sm15487618oig.8.2016.10.19.16.09.57
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Wed, 19 Oct 2016 16:09:57 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH linux v5 10/18] fsi: Implement slave initialisation
Date: Wed, 19 Oct 2016 18:09:38 -0500
Message-Id: <1476918586-13475-11-git-send-email-christopher.lee.bostic@gmail.com>
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

Create fsi_slave devices during the master scan.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 drivers/fsi/fsi-core.c | 51 ++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 49 insertions(+), 2 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 2d22320..4282370 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -18,6 +18,7 @@
 #include <linux/device.h>
 #include <linux/fsi.h>
 #include <linux/module.h>
+#include <linux/slab.h>
 
 #include "fsi-master.h"
 
@@ -60,12 +61,58 @@ static bool check_crc4_u32(uint32_t x)
 }
 
 /* FSI slave support */
+
+static void fsi_slave_release(struct device *dev)
+{
+	struct fsi_slave *slave = to_fsi_slave(dev);
+
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
+	if (!check_crc4_u32(chip_id)) {
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
