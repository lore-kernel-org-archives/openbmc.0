Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com
 [IPv6:2607:f8b0:4003:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3srtt454T6zDrWf
 for <openbmc@lists.ozlabs.org>; Sun,  9 Oct 2016 04:39:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=HHH7Og0c; 
 dkim-atps=neutral
Received: by mail-oi0-x243.google.com with SMTP id h186so5451405oia.3
 for <openbmc@lists.ozlabs.org>; Sat, 08 Oct 2016 10:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=bxEqnA/yyPq/VWP2/7tNrEYHytB6CJh4ph8PR9kRf20=;
 b=HHH7Og0cyRtdUDkcIKETw39yoZnyeNyl3/ycF5iGJ3hEcC+8YRJOfB2A6Vqs1YZwzU
 JBXMF4jgrWljVo6JQQcCMcXi4rUh0wmGh+Dps3vv2SBD1JQkbfG6zoGFTheYNcxhRfmZ
 xToyXdPW2/Rh8/VLb2BzVNOdjJvjSD8jIAQMciZMdxk8sL/SlYZiX+0BgKPXaPl3ioUJ
 UfyEZwXBmW9mTMNv5MG7RG83+PZNgTsPvQT7xYXjAj6EALSBBcBjjfKhpF8zk4WSgjCN
 7wQBypUAKeduFn4wXIFUwTmzNMEdsQgU91TU3uJvZbhTHlLIHFeu7JnYTJT2i5WWEHce
 /Dlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=bxEqnA/yyPq/VWP2/7tNrEYHytB6CJh4ph8PR9kRf20=;
 b=Vn37/Pv3wGYlQ8syn4in5DyoP3vqDMUhhfEbSd0lSGeouTigBGbUnIu550sIxVdbEy
 oFK0pUkjDY2SQCjnXKxpncXw8bYX3SIBPcXoTUo/hsV5xFof4POei8sa2LJV8yqKSbp3
 4Qp/jp40SoO1LFYI+AKg66H9UOnTC1iPeZuAO45RnDohp8gMTKTdH3NzO5ROoRDI42q4
 uI8sU4zYUbuvngd/VoR84JQvBEXa/excz06SpJcDaxYAjjingf6Eviz2u/8szIXXmjrj
 p9TFPv8RkhNuKJJWgdEGWlDOy+pozSDcAlZg7ICEgq8lIQxf1td7fLMIHOqT35e5pcwK
 ulSg==
X-Gm-Message-State: AA6/9RkkSWWbj/wxlD7D8CCcgkZVQz2Ny8v6hYB2pOMhg4MXkEsn7BmUNKOn6YHXiAO9og==
X-Received: by 10.157.56.179 with SMTP id p48mr13752454otc.22.1475948346852;
 Sat, 08 Oct 2016 10:39:06 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id g17sm8025290otd.38.2016.10.08.10.39.06
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sat, 08 Oct 2016 10:39:06 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH linux v2 10/17] fsi: Implement slave initialisation
Date: Sat,  8 Oct 2016 12:38:46 -0500
Message-Id: <1475948333-55960-11-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Sat, 08 Oct 2016 17:39:09 -0000

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
