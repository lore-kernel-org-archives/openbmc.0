Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com
 [IPv6:2607:f8b0:4003:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t6WrG5xgLzDvNf
 for <openbmc@lists.ozlabs.org>; Mon, 31 Oct 2016 09:09:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=bZxqNrPU; 
 dkim-atps=neutral
Received: by mail-oi0-x243.google.com with SMTP id v84so2660840oie.2
 for <openbmc@lists.ozlabs.org>; Sun, 30 Oct 2016 15:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=V97o/W9Bq8RC2bxTUubm8h9U8GhLI6Gi+nED7Qff9Ys=;
 b=bZxqNrPUd+epWyc5h9inmDEi0DmopvfQFkc+8UJMU2uSIACXxp/OdvaVwQAhqfSSYB
 1eTErquEg7ljvX0xK0HVHbnhEpSodJNg0lysNuwrWUhvsE2iDo66V693eNo1Bb7C7wH4
 4H/vg2SBgkhUkRWJA6otwPPmS0g2X/LclOhFYLMBoePdqk8QyRy3V3f0UYr3PSusX+gy
 Ge0ACoKEFK+jMxmhsL7OfB/64edMwIZ6BcJcz17qRoGSx0c2iD92KTUZK09lZVjJEZgY
 e/x0X/VsenmVwa22/ZzQSIQoAI2MLPPyKnM9YBtU2g9j9xCg3RShONDSICztoHBFsSh4
 gVsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=V97o/W9Bq8RC2bxTUubm8h9U8GhLI6Gi+nED7Qff9Ys=;
 b=X7cHdNKz2vYXyrqA2XAicW63OZEj+klgBLFfqmbnPkjvhkyrZ8TblcygEPfVYQsoZz
 yVgIrC9mdAARKRGogumK8Ka8j97csBXUtJwMcFkkTrEXZpLEafacy0KLF1LnXvx5lHc8
 /UV6L4L/0eb24CUmMBNtw8zkK3MMPJ3LLX3UbilaftrAdbB0eC2CcribPrt93fU86pD1
 Qfb9MSinkuW9rputhjfinOvFhz1vVCCz706vDsf2OarnHx2BP9rPMEveXPpA+Hl9qIQa
 uUqMgUefSw25cghtL3muAt3ghgf+fW3MnhSIjWXb6LL1LLtBe6qNxwRZpyyhFDLcAs1u
 6xUw==
X-Gm-Message-State: ABUngvd2eEbFz5CkxIWEXettcbkb58kloaZcXJOsqJlV54woe0H5LfdDoMwO0AGR7ywcDQ==
X-Received: by 10.202.80.202 with SMTP id e193mr24516183oib.65.1477865389119; 
 Sun, 30 Oct 2016 15:09:49 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id q59sm7585484ota.20.2016.10.30.15.09.47
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sun, 30 Oct 2016 15:09:48 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH linux v6 03/18] fsi: add driver to device matches
Date: Sun, 30 Oct 2016 17:09:05 -0500
Message-Id: <1477865379-11566-4-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailer: git-send-email 2.7.4 (Apple Git-66)
In-Reply-To: <1477865379-11566-1-git-send-email-christopher.lee.bostic@gmail.com>
References: <1477865379-11566-1-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Sun, 30 Oct 2016 22:09:51 -0000
X-List-Received-Date: Sun, 30 Oct 2016 22:09:51 -0000

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
