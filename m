Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-it0-x243.google.com (mail-it0-x243.google.com
 [IPv6:2607:f8b0:4001:c0b::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sznhg2qx9zDt2L
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 10:09:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=mZ2piPTJ; 
 dkim-atps=neutral
Received: by mail-it0-x243.google.com with SMTP id e203so3157192itc.1
 for <openbmc@lists.ozlabs.org>; Wed, 19 Oct 2016 16:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=V97o/W9Bq8RC2bxTUubm8h9U8GhLI6Gi+nED7Qff9Ys=;
 b=mZ2piPTJC1OhznmOCTDGmnSKy4pKNqntjky9T5felSBSYotiO05fCIedvYr3rc0hub
 ArG0VSABG663E/CnYBoo//UFPrca7kef7S0sh6VoTV9DCwdIfydggIiZcIfGCak82vSm
 1Hzw+nbWVT7W7Qlyh+wqxYgKYDDBeVzR5WzQ2czVwh2ir3k7JzgSMWvROQnlXO+RgMGM
 WiFkbU5vBIgCkCECPBJqSOFQpikScydmVJt0D8YixIxPfAsy6SMjI/ulrtptcvVjvqpF
 zKrD2XMKM0iPGzwB30zPZ9/rBUHsOZ/nNBaI+C4vQyjJP4H3/iMSS4hPMtocX3UTjcET
 WQGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=V97o/W9Bq8RC2bxTUubm8h9U8GhLI6Gi+nED7Qff9Ys=;
 b=krqNEHnHUOTCuyFeSKyYjg3ovB1q8Ztd8+JT4aATvVl9zFvO2deNon2QLM1Q75ppMF
 Bc/DR6re1cyCjt//8OjlUzvrd5gxMnD/cSnnljXVsbmVq79DglXlbLn24buQOvarZLOi
 u7agkL/u7JbdAUwNqw1IZaxU5uC4u+onQpNHYr9h90zCtkh50hgBRFatHCcu8j/CUZwP
 TENLHgfis19f7uHTQ3TqburoF6H4UTohnPr2QSGTUydoe1cef5tvJtAiyGEeoRWk7Dp8
 ikYYjS3n+EUP/gMuqgg6OqmiremQ/mwd7E+GVnkSQMMbA3s4t5H2LtMt9IfL26i0NP8L
 8G4w==
X-Gm-Message-State: AA6/9Rmhg7JoSOS6uS9YQoafjipw3FzJNzrSeCkii6E7SrtrKke2MRTNEg9p2JFv04SpQw==
X-Received: by 10.157.16.81 with SMTP id o17mr4384752oto.207.1476918593415;
 Wed, 19 Oct 2016 16:09:53 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id n196sm15487618oig.8.2016.10.19.16.09.52
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Wed, 19 Oct 2016 16:09:53 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH linux v5 03/18] fsi: add driver to device matches
Date: Wed, 19 Oct 2016 18:09:31 -0500
Message-Id: <1476918586-13475-4-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Wed, 19 Oct 2016 23:09:56 -0000

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
