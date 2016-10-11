Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com
 [IPv6:2607:f8b0:4003:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3str4w6ZPRzDsrT
 for <openbmc@lists.ozlabs.org>; Wed, 12 Oct 2016 08:40:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=lb3WXO4g; 
 dkim-atps=neutral
Received: by mail-oi0-x243.google.com with SMTP id i127so2272041oia.0
 for <openbmc@lists.ozlabs.org>; Tue, 11 Oct 2016 14:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=bxEqnA/yyPq/VWP2/7tNrEYHytB6CJh4ph8PR9kRf20=;
 b=lb3WXO4gKnJWGp1qkg0GRi12jjgcJekRARduMy8H7tewSUr2onpdJs6ycOwy9C1ClJ
 l5C9EXInOoGXTtH9QLezQ0II2JnVocypn5VM8El3SV+m58lw0zVwhU8UUap4v8MAxsCp
 ayO3bzmHyqRCyMPFfBqy5Wsvno74Dyx5ptHGzqsL7plPzOKUIQVYWJKt4WxOZ0wkW+C6
 F3oopGhrY0eNYecJ9eqJ8xdnnVU7cg6n3EKSPsAES8cREKwUJQf4ENOrc3+TbII0RQqA
 iSLXTGXuinG4eo07bD/I9rBwyf/K3Ahw3SwWB6VNle1pD9uLjZru3AZ4l4kL1qnDESS+
 Dvuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=bxEqnA/yyPq/VWP2/7tNrEYHytB6CJh4ph8PR9kRf20=;
 b=EMDSP19ECHstK4HN8qbEDfevMbLVZ0hs83oZgLpYAjFt/B8mEPiQ7Ty1dxYl2FAK7u
 4AlviIUTC6Sruwf0NYxVHO/E54QMEer2bZrgb0DeNqWCD5w4awzTLkJrZGZ0g2I5O6S3
 ojRCoNQ6aUXazWX+JQ72ersq5c58euEp8fI+E5DBFsPWL+eFSMfMIota4shdEioRO/gs
 sdjrr1nu70eOlXfp0bYiRSR5Ig1zl2aA0I9aJplmwZ0QTUE0OVcUZSjnVEaZAk0YXjLF
 QuB/VN/SvNqPQZPIjSFZ/rIV38Y/8A8ISqj8G9hGSoOQMhG7Xa1/7/4UTa7brjN2nymS
 I+7w==
X-Gm-Message-State: AA6/9RkZqPGPjd8VR7UgQ8QG5NccwTYHPsI8Vsb2q2oFZJQxh7cikBTXQKZWixvXYfl+qg==
X-Received: by 10.157.39.136 with SMTP id c8mr3351544otb.180.1476222015222;
 Tue, 11 Oct 2016 14:40:15 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id h91sm1811153oth.40.2016.10.11.14.40.14
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Tue, 11 Oct 2016 14:40:14 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH linux v3 10/18] fsi: Implement slave initialisation
Date: Tue, 11 Oct 2016 16:39:55 -0500
Message-Id: <1476222003-99697-11-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Tue, 11 Oct 2016 21:40:17 -0000

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
