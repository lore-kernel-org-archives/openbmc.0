Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x244.google.com (mail-oi0-x244.google.com
 [IPv6:2607:f8b0:4003:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sq7M13W8mzDrPG
 for <openbmc@lists.ozlabs.org>; Thu,  6 Oct 2016 07:54:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=nwU7vUoB; 
 dkim-atps=neutral
Received: by mail-oi0-x244.google.com with SMTP id o93so4737277oik.0
 for <openbmc@lists.ozlabs.org>; Wed, 05 Oct 2016 13:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=V97o/W9Bq8RC2bxTUubm8h9U8GhLI6Gi+nED7Qff9Ys=;
 b=nwU7vUoBtRv7KeyP6P2D/oCKY3GwpVe0Yg3/f84SznzdkTYr2iswjzkpsAwx73nMGa
 bFlUo2otpMixbMX1vfHc63zBQVvpzPi1yIzrvLgE029BaVtRGnF65tihkScZexar11R9
 BNaLZCk8pXH8I5zpi+6vDOL/EuSNjZAnCTfl54qvrPNuKhnO6JFZxbu2hbirYe6H83/i
 thP4dFzgihwb/FGPJnsqNwDT75sndgArPpYTYFUpX3nOG8eNc3eMsK1CjnTTdXoVW/g9
 qdkc7dE3tIZemVVt7XXyL1fhg5kYkiZ9EKUpHiejG9Ca+E/xu0OPNdM4wGyIdpJ1V6iI
 7KWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=V97o/W9Bq8RC2bxTUubm8h9U8GhLI6Gi+nED7Qff9Ys=;
 b=PlqeXWZ7qjEEMxZEwJc97yADoq1IYoHhl5gi9dO7TCt3dfVp5ukxn8a71ZSebEKuZP
 jvRFCxYJtkvhsdVDi/Lmxl7OTTyiRplGM1xDyXjB86djlv6eXncJn4h/uyBhjS1ruMG+
 e27B4qLFxgpRngv0iVQZIdBd7351OPb5zaBDJgeain9GlZcQmWOjH/1YY2EWZpFfGUGs
 BCq2E1qXTab3kilBAnGczeb7fKl9J0Bl4txkKZfuB71ZuaOiVWhnyaA4fBh2lofD5Ffz
 9IPeFjL6Ao1y/Nn0Q6caUgjReN4TfCvDZp5PmKCLIvhsEDG3uddY/6qUFsUIZSaXkAkh
 2F1w==
X-Gm-Message-State: AA6/9RnDGL8USmjrG210Za9iYadDvhNcVk7QJblxyHcS7jWlx0eVYyZFO74RCh2VIgmvhg==
X-Received: by 10.157.52.188 with SMTP id g57mr6678407otc.125.1475700875818;
 Wed, 05 Oct 2016 13:54:35 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id i18sm3206459oib.12.2016.10.05.13.54.35
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Wed, 05 Oct 2016 13:54:35 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH linux 03/15] fsi: add driver to device matches
Date: Wed,  5 Oct 2016 15:54:16 -0500
Message-Id: <1475700868-75737-4-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailer: git-send-email 2.7.4 (Apple Git-66)
In-Reply-To: <1475700868-75737-1-git-send-email-christopher.lee.bostic@gmail.com>
References: <1475700868-75737-1-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Wed, 05 Oct 2016 20:54:38 -0000

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
