Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3srtsz2df8zDrWR
 for <openbmc@lists.ozlabs.org>; Sun,  9 Oct 2016 04:39:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=Me71Zh8B; 
 dkim-atps=neutral
Received: by mail-oi0-x242.google.com with SMTP id r132so5441433oig.1
 for <openbmc@lists.ozlabs.org>; Sat, 08 Oct 2016 10:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=V97o/W9Bq8RC2bxTUubm8h9U8GhLI6Gi+nED7Qff9Ys=;
 b=Me71Zh8BEbpNZlknN8BV/o2SR+1zGTJ0xwJk3qcrBfOuo3QgoKV1spyH7gYv+qE3NQ
 FGZdQPHrEBc08gk//2zDUvDIysHTp5qd6MB1n8bzijktbMy1xsM97HlH2wZeRyAgFRNX
 +RZwKDq2O7zHJqKAe15du0LLjWkdshbxjD1PeRfY9Nh2GyyuA+aG1lNXMyZmdrRhpI8z
 HPo769ShrvUO66MlyrWErfASK1HTSH4rElqXrrOd2cPRTjl4ziKHu22c8fJY0t0qvbfa
 jl7QccFMSbz1ZxfFWnrizO4mwSegZZ936Z36X4tNvcUYcvmdQgqGsydUxZyalgWeojjk
 Q/3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=V97o/W9Bq8RC2bxTUubm8h9U8GhLI6Gi+nED7Qff9Ys=;
 b=ePESKNUUoankJy3wUJjSQmf6eFgXI0KxghEzqD0XU8PFyhHsn5QeUPiKn6TFa4MW5o
 WZjaRO3KXywruVwL+6o6miq7coMiv0XKcE5le+7SZ7aa3XEu6s/C4P+qY+z0lVUAwQO2
 /NN6yv0d5bIwNkjtbmVtL0A7z33y1qawqNIAmsfZttPg2oLoJtYVfs/03dmy4Rs4za1s
 52yo6aagu3hGwumlZntBj1KRFkjuDByFrkRkSzbfNTDEXjfv7G7sKceJukiVMcUWTJv6
 kZpn2Qf3NpzoTONA5dDvE4ZIq446VI9z7soW8ZIWK4HBcY4yWDz5Y8AnFXRKwAQsB+6V
 rRUQ==
X-Gm-Message-State: AA6/9RncYiPxXGiu3kf0uwe+8yLT8eVYFJI77FLP9XMEWH7HCfGb7TIpe8XXPAIUl1rLtg==
X-Received: by 10.157.17.183 with SMTP id v52mr13839905otf.249.1475948341714; 
 Sat, 08 Oct 2016 10:39:01 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id g17sm8025290otd.38.2016.10.08.10.39.01
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sat, 08 Oct 2016 10:39:01 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH linux v2 03/17] fsi: add driver to device matches
Date: Sat,  8 Oct 2016 12:38:39 -0500
Message-Id: <1475948333-55960-4-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Sat, 08 Oct 2016 17:39:03 -0000

From: Jeremy Kerr <jk@ozlabs.org>

Driver bind to devices based on the engine types & (optional) versions.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 drivers/fsi/fsi-core.c | 21 +++++++++++++++++++++
 include/linux/fsi.h    | 21 +++++++++++++++++++--
 2 files changed, 40 insertions(+), 2 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 3e45306..3d55bd5 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -19,8 +19,29 @@
 
 /* FSI core & Linux bus type definitions */
 
+static int fsi_bus_match(struct device *dev, struct device_driver *drv)
+{
+	struct fsi_device *fsi_dev = to_fsi_dev(dev);
+	struct fsi_driver *fsi_drv = to_fsi_drv(drv);
+	const struct fsi_device_id *id;
+
+	if (!fsi_drv->id_table)
+		return 0;
+
+	for (id = fsi_drv->id_table; id->engine_type; id++) {
+		if (id->engine_type != fsi_dev->engine_type)
+			continue;
+		if (id->version == FSI_VERSION_ANY ||
+				id->version == fsi_dev->version)
+			return 1;
+	}
+
+	return 0;
+}
+
 struct bus_type fsi_bus_type = {
 	.name		= "fsi",
+	.match		= fsi_bus_match,
 };
 EXPORT_SYMBOL_GPL(fsi_bus_type);
 
diff --git a/include/linux/fsi.h b/include/linux/fsi.h
index 66dcf25..6d843d4 100644
--- a/include/linux/fsi.h
+++ b/include/linux/fsi.h
@@ -19,11 +19,28 @@
 #include <linux/device.h>
 
 struct fsi_device {
-	struct device dev;
+	struct device		dev;
+	u8			engine_type;
+	u8			version;
 };
 
+struct fsi_device_id {
+	u8	engine_type;
+	u8	version;
+};
+
+#define FSI_VERSION_ANY		0
+
+#define FSI_DEVICE(t) \
+	.engine_type = (t), .version = FSI_VERSION_ANY,
+
+#define FSI_DEVICE_VERSIONED(t, v) \
+	.engine_type = (t), .version = (v),
+
+
 struct fsi_driver {
-	struct device_driver drv;
+	struct device_driver		drv;
+	const struct fsi_device_id	*id_table;
 };
 
 #define to_fsi_dev(devp) container_of(devp, struct fsi_device, dev)
-- 
1.8.2.2
