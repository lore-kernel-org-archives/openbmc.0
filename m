Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-pf0-x241.google.com (mail-pf0-x241.google.com
 [IPv6:2607:f8b0:400e:c00::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3swhjV2yhDzDt3S
 for <openbmc@lists.ozlabs.org>; Sat, 15 Oct 2016 09:14:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=ACjU3HUf; 
 dkim-atps=neutral
Received: by mail-pf0-x241.google.com with SMTP id i85so4554355pfa.0
 for <openbmc@lists.ozlabs.org>; Fri, 14 Oct 2016 15:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=V97o/W9Bq8RC2bxTUubm8h9U8GhLI6Gi+nED7Qff9Ys=;
 b=ACjU3HUfU7578mw1bkfWDVTbrTQOkbxwU65Ihy04Jdl10injw3Ho67GKGaPmGXkGwP
 ANJtDYDotarekVyjWv9SSjCVyoCWStHyNAxDcKXtGbfFzw9Hlzb9jTn9mhMhRptDN+AR
 WicDZAEqxNuIfyop/D56Vr6StfcDPz8dw6dHCrXZCodquA3h9UoTMYDJLR+9Qf0aC1xA
 +2OZ3XYvfagJuwwSMoYfDXrgHHgbxGOvAwJY/tnTFrapTGOq7SG75CmSEZMR4QDevDK/
 vXErf3iUClJOLLXG12IMArL3RfwLofKqL668Ldgy8/Qv+k05W5/DOEPOVkc7G4E/TgTD
 Cxpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=V97o/W9Bq8RC2bxTUubm8h9U8GhLI6Gi+nED7Qff9Ys=;
 b=LdSctKUh7STZc6kpvQWWD8fLnvpgRD+R/HH5mKdlgqqVnSgxkZvfxVf1Xg3SAkdT+z
 utFVt9uLc/NIt0aly0PQMyo/NzxN3Cmr6EF/58yi86RU59vZcuQovXNYIUi1d1df99nr
 ozhYVuePFGW16InsoxqjXxuxZVhsYC6VER0MkdqJUGtbUuHQnahBPp70G4psNpZcqZxf
 +mLuubgDY/K1yVgWWFNRjMILnW7OB4dbQJUiHiVy4vzGx9v8EV9qJviE8hiZHbNZuGhi
 5+KwW+d3xLQAexke6S96mvBnwe0bPf4PJEnyRgup9GuGz07QabgeTUFfuZj5hRxfI/pW
 Xqtg==
X-Gm-Message-State: AA6/9RnOWBYKV2+xtqQuTleNQZtY7rREsXmIlOjgDObvW37uAoZcnRL2fxXoh56nwV1hCw==
X-Received: by 10.98.80.2 with SMTP id e2mr21747120pfb.183.1476483292874;
 Fri, 14 Oct 2016 15:14:52 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id p7sm29848874paa.3.2016.10.14.15.14.51
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Fri, 14 Oct 2016 15:14:52 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH linux v4 03/20] fsi: add driver to device matches
Date: Fri, 14 Oct 2016 17:14:25 -0500
Message-Id: <1476483282-85971-4-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Fri, 14 Oct 2016 22:14:54 -0000

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
