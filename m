Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-qk0-x244.google.com (mail-qk0-x244.google.com
 [IPv6:2607:f8b0:400d:c09::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sKJ132LvkzDrdH
 for <openbmc@lists.ozlabs.org>; Thu, 25 Aug 2016 05:54:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=paktLiL+; 
 dkim-atps=neutral
Received: by mail-qk0-x244.google.com with SMTP id r128so2017777qkc.1
 for <openbmc@lists.ozlabs.org>; Wed, 24 Aug 2016 12:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=+TO88r+u0JkOKgbkx/kI1bjYxAtxOZT/gb+H4bLpdZ4=;
 b=paktLiL+/iiQN5jL7SeLMsT1w9AvWt1P0HkqKY5lyX3Vj6Gn/yOpt04duyXdc9FinP
 1CpdMMvtnTv/lj2Bz70HRJTtlhMFLJxd0LozX2x99YqQa1eo7D/qJ328xQHbuiqK311c
 vnd48/yyAXWnSh8zEOFtylSXyDKCp7HbCYCeM9Fs6hroBsdIauSkfxldG6VjkY9R5dou
 nmNh02aoDW3bNqYAV1U2HzLhPUachnN+DSsMYAlX8RjKc0b2FYw1Roj2ygmfzDCBaMxp
 PTIE3Zi/+C0+VZHSGHN7MBCDiWcWSaLmHWXwntNF/U5v+pV8g35B12BNffmjTPHztcJH
 +sdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=+TO88r+u0JkOKgbkx/kI1bjYxAtxOZT/gb+H4bLpdZ4=;
 b=ha4vcy4mbwChZvKtiEux2huUlVPVhVvV+3KqPf3fJTaCKMMPiHv9lsxD/MIyjD10vv
 0UgMpStLYs0gP7O5rPKXlmYemvYwGEFihKBmNzbZCTvCtvluVoq9bknEayyzS2qKV6Lj
 ENsIY5e1K/0/ULOdQNTj+wHk3l3p2MSD1bLQxLAr0rBrRfDIdEwTyah99FzxAgHKCqyr
 eJFIX8tGk4mQO9xq9mlW7xs5qTUg0xx/dXLRzlGLoeQcSPrCcMwqryVwGKJvjN5JAOSJ
 XBJV4HVGLzga+b3Q3S5Ty9r0gOW8qkvWnCvEVLvIQfExC42ztdX/WIh0cGh1JFyitVPb
 lFAQ==
X-Gm-Message-State: AE9vXwMpmRtQAceV6eNOSkW7i/caKBTdHHoFHIK4k14KRb3eAWYLCedPygy7WbXQxuUmOQ==
X-Received: by 10.55.220.132 with SMTP id v126mr5825726qki.127.1472068469361; 
 Wed, 24 Aug 2016 12:54:29 -0700 (PDT)
Received: from christophersmbp.austin.ibm.com ([32.97.110.51])
 by smtp.gmail.com with ESMTPSA id n6sm3544238qkf.36.2016.08.24.12.54.28
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Wed, 24 Aug 2016 12:54:28 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux v5 6/7] drivers/fsi: Add FSI Bus Support for Clients
Date: Wed, 24 Aug 2016 14:54:11 -0500
Message-Id: <1472068452-32048-7-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailer: git-send-email 2.7.4 (Apple Git-66)
In-Reply-To: <1472068452-32048-1-git-send-email-christopher.lee.bostic@gmail.com>
References: <1472068452-32048-1-git-send-email-christopher.lee.bostic@gmail.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Aug 2016 19:54:32 -0000

From: Chris Bostic <cbostic@us.ibm.com>

Provide means for a client to register with an FSI bus and get
notifications of hot plug events.  A client is a device driver that
needs access to a physical FSI bus in order to communicate with
hardware it controls.  Utilities added to allow client to retrieve
resource information on its hardware.

Signed-off-by: Chris Bostic <cbostic@us.ibm.com>
---
 drivers/fsi/fsi.h       |  15 +++++
 drivers/fsi/fsicfam.h   |   2 +
 drivers/fsi/fsiinit.c   |   8 +++
 drivers/fsi/ldm.c       | 161 +++++++++++++++++++++++++++++++++++++++++++++++-
 drivers/fsi/readwrite.c |   4 ++
 5 files changed, 188 insertions(+), 2 deletions(-)

diff --git a/drivers/fsi/fsi.h b/drivers/fsi/fsi.h
index 67d4666..f0ed5b7 100644
--- a/drivers/fsi/fsi.h
+++ b/drivers/fsi/fsi.h
@@ -65,6 +65,10 @@ struct fsimap {
 #define FSI_DEV_PROBE_OK	9	/* Probe succeeded */
 #define FSI_DEV_PROBE_ERR	10	/* Probe failed */
 
+struct fsi_resource {
+	u32 start;			/* Start of range */
+	u32 end;			/* End of range */
+};
 
 struct fsidevice {
 	struct fsi_engine_id id;	/* Engine type/version */
@@ -91,4 +95,15 @@ struct fsidriver {
 
 #define to_fsidriver(x)	container_of((x), struct fsidriver, driver)
 
+int fsidev_register(struct fsidevice *, struct device_attribute **);
+void fsidev_unregister(struct fsidevice *);
+int fsi_get_resource(struct fsidevice *, int, struct fsi_resource *);
+char *fsidevice_name(struct fsidevice *, const char *, const char *,
+		     char *, size_t);
+int fsidevice_get_minor(struct fsidevice *);
+int fsidrv_register(struct fsidriver *);
+void fsidrv_unregister(struct fsidriver *);
+void fsi_lock_mutex(void);
+void fsi_unlock_mutex(void);
+
 #endif /* DRIVERS_FSI_H */
diff --git a/drivers/fsi/fsicfam.h b/drivers/fsi/fsicfam.h
index dde7036..8ccff5c 100644
--- a/drivers/fsi/fsicfam.h
+++ b/drivers/fsi/fsicfam.h
@@ -43,4 +43,6 @@ struct fsicfam {			/* CFAM internal structure */
 int fsi_cfamirq_request(int, struct fsicfam *);
 void fsi_cfamirq_free(struct fsicfam *);
 
+#define FSI_CFAM_SLAVEIDX	2		/* Slave engine */
+
 #endif /* DRIVERS_FSICFAM_H */
diff --git a/drivers/fsi/fsiinit.c b/drivers/fsi/fsiinit.c
index d83992e..4941062 100644
--- a/drivers/fsi/fsiinit.c
+++ b/drivers/fsi/fsiinit.c
@@ -34,6 +34,14 @@ struct fsidd fsidd = {		/* FSI device driver structure definition */
 	.major = MKDEV(FSIDD_MAJOR, 0),
 };
 
+void fsi_lock_mutex(void)
+{
+}
+
+void fsi_unlock_mutex(void)
+{
+}
+
 static int fsi_start(void)
 {
 	int rc = 0;
diff --git a/drivers/fsi/ldm.c b/drivers/fsi/ldm.c
index 9fe10b3..cb6679f 100644
--- a/drivers/fsi/ldm.c
+++ b/drivers/fsi/ldm.c
@@ -13,6 +13,48 @@
 #include <linux/blkdev.h>
 #include "fsi.h"
 #include "fsi_private.h"
+#include "fsicfam.h"
+
+/*
+ * /sys/devices/ < name > format:
+ *
+ * fsi-LL.C.EE
+ *
+ * Where:
+ * L = link, C = CFAM, E = engine
+ *
+ * TODO: expand for cascaded and hub masters
+ */
+static void myname(struct fsidevice *fsidev)
+{
+	if (dev_name(&fsidev->dev))
+		return;
+
+	dev_set_name(&fsidev->dev, "fsi-%02d.%d.%02d",
+		     fsidev->map.link, fsidev->map.cfam, fsidev->map.eng);
+}
+
+/*
+ * Unregister a FSI device with the Linux device model
+ */
+void fsidev_unregister_nolock(struct fsidevice *fsidev)
+{
+
+	dev_dbg(&fsidev->dev, "fsidev_unregister fsidev:%p\n", fsidev);
+	if (!test_and_clear_bit(FSI_DEV_ACTIVE, &fsidev->state)) {
+		dev_dbg(&fsidev->dev, "fsidev_unregister build incomplete\n");
+		return;
+	}
+	device_unregister(&fsidev->dev);
+}
+
+void fsidev_unregister(struct fsidevice *fsidev)
+{
+	fsi_lock_mutex();
+	fsidev_unregister_nolock(fsidev);
+	fsi_unlock_mutex();
+}
+EXPORT_SYMBOL(fsidev_unregister);
 
 /*
  * Register a FSI device with the Linux device model
@@ -20,15 +62,101 @@
 int fsidev_register_nolock(struct fsidevice *fsidev,
 			   struct device_attribute **ap)
 {
-	return 0;
+	int rc, slave_idx;
+
+	dev_dbg(&fsidev->dev, "register >> %d.%d.%d\n",
+		fsidev->map.link, fsidev->map.cfam, fsidev->map.eng);
+	myname(fsidev);
+
+	rc = device_register(&fsidev->dev);
+	if (rc) {
+		dev_dbg(&fsidev->dev, "register dev_register error:%d\n", rc);
+		if (fsidev->dev.release)
+			fsidev->dev.release(&fsidev->dev);
+		return rc;
+	}
+	set_bit(FSI_DEV_ACTIVE, &fsidev->state);
+	if (test_bit(FSI_DEV_PROBE_ERR, &fsidev->state)) {
+		dev_dbg(&fsidev->dev, "register dev probe error\n");
+		slave_idx = (fsidev->map.eng == FSI_CFAM_SLAVEIDX);
+		rc = slave_idx ? -ENODEV : 0;
+		fsidev_unregister_nolock(fsidev);
+		return rc;
+	}
+	dev_dbg(&fsidev->dev, "register << %d.%d.%d success\n",
+		fsidev->map.link, fsidev->map.cfam, fsidev->map.eng);
+
+	return rc;
 }
 
 int fsidev_register(struct fsidevice *fsidev, struct device_attribute **ap)
 {
-	return 0;
+	int rc;
+
+	fsi_lock_mutex();
+	rc = fsidev_register_nolock(fsidev, ap);
+	fsi_unlock_mutex();
+
+	return rc;
 }
 EXPORT_SYMBOL(fsidev_register);
 
+int fsi_get_resource(struct fsidevice *fsidev, int idx,
+		     struct fsi_resource *res)
+{
+	switch (idx) {
+	case FSI_DEV_IRQRES:
+		if (fsidev->irq_start == 0)
+			res->end = 0;
+		else
+			res->end = fsidev->irq_start + fsidev->irq_range - 1;
+		break;
+	case FSI_DEV_MEMRES:
+		res->start = fsidev->map.va;
+		res->end = res->start + fsidev->map.kb * FSI_ENGINE_SIZE - 1;
+		break;
+	default:
+		return -EINVAL;
+	}
+	return 0;
+}
+EXPORT_SYMBOL(fsi_get_resource);
+
+/*
+ * Return the fsidevice full engine name.
+ * Name consists of:
+ * - prefix
+ * - link number
+ * - a dot '.'
+ * - cfam number
+ * - a dot '.'
+ * - engine number
+ * - postfix (client's choosing)
+ *
+ * Returns NULL if buffer space is insufficient.
+ */
+char *fsidevice_name(struct fsidevice *fsidev, const char *prefix,
+		     const char *postfix, char *buf, size_t len)
+{
+	int size;
+	struct fsimap *map = &fsidev->map;
+
+	size = snprintf(buf, len, "%sL%02dC%dE%02dP%s",
+			prefix, map->link, map->cfam, map->eng, postfix);
+
+	return (size >= len) ? NULL : buf;
+}
+EXPORT_SYMBOL(fsidevice_name);
+
+/*
+ * Retrieve minor number for the FSI device
+ */
+int fsidevice_get_minor(struct fsidevice *fsidev)
+{
+	return MINOR(fsidev->dev.devt);
+}
+EXPORT_SYMBOL(fsidevice_get_minor);
+
 /*
  * FSI bus functions.
  */
@@ -163,3 +291,32 @@ int fsibus_init(void)
 {
 	return bus_register(&fsi_bus_type);
 }
+
+/*
+ * Unregister a client FSI driver from the system
+ */
+void fsidrv_unregister(struct fsidriver *fsidrv)
+{
+	fsidrv->reset = NULL;
+	driver_unregister(&fsidrv->driver);
+}
+EXPORT_SYMBOL(fsidrv_unregister);
+
+/*
+ * Register a client FSI driver with the system
+ */
+int fsidrv_register(struct fsidriver *fsidrv)
+{
+	int rc = 0;
+
+	if (fsidrv->idlist == NULL)
+		return -EINVAL;
+	if (!fsidrv->driver.owner)
+		fsidrv->driver.owner = fsidrv->owner;
+
+	fsidrv->driver.bus = &fsi_bus_type;
+	rc = driver_register(&fsidrv->driver);
+
+	return rc;
+}
+EXPORT_SYMBOL(fsidrv_register);
diff --git a/drivers/fsi/readwrite.c b/drivers/fsi/readwrite.c
index 33d972c..3427e52 100644
--- a/drivers/fsi/readwrite.c
+++ b/drivers/fsi/readwrite.c
@@ -14,6 +14,10 @@
 #include "fsi_private.h"
 #include "fsimaster.h"
 
+/*
+ * Read/write functions to be used only by the FSI driver itself.  FSI clients
+ * will use separate interfaces
+ */
 int fsi_readw_int(struct fsimaster *master, u32 pa, u32 *value)
 {
 	return 0;
-- 
1.8.2.2
