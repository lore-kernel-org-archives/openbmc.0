Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-qk0-x242.google.com (mail-qk0-x242.google.com
 [IPv6:2607:f8b0:400d:c09::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sKJ114h7jzDrd3
 for <openbmc@lists.ozlabs.org>; Thu, 25 Aug 2016 05:54:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=mlP3bGbw; 
 dkim-atps=neutral
Received: by mail-qk0-x242.google.com with SMTP id o1so2012611qkd.2
 for <openbmc@lists.ozlabs.org>; Wed, 24 Aug 2016 12:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=a6lQiRgdjzbksujOFryl48vBZEluniYagidB8m8bGbQ=;
 b=mlP3bGbwGTGiNPX3RNYfMxefLHVLTvj3Ultg9cTb8mvVj+h1wn02o/kjmKP+iBnFU5
 p4PcwKxTg1CncEW8exHLW1oa3JpvcPJOhmW5UurpsmP+vS5yJ6dcoeP8hbIOeW9PpkNc
 PMhRT1HSz4cutwRZ7qtLG0PdhEHjq8YQ1XMhMZuuzk0bjrYEvRVC5EcCGFAaPzNak0AT
 lCBuJGtLhE+iV4ZYi7VhP7Fh16j2MTcfbrkI0DoCRVqnNmr2LWrFG4JfPXAU+s0D7ajN
 e0E8WsPgcdAQXnthiqpmuVlhUwkJx+QdDzB7piWjGDHjbdjyR/GQiu1huz2XofM6YTks
 hutg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=a6lQiRgdjzbksujOFryl48vBZEluniYagidB8m8bGbQ=;
 b=lMyr5rGrHgyDv2A1CvobrE+JnLhNvcVcDPZLXkjuQ+HOom03ehY44HMPmqdo9tcbJy
 1z31aFpYYmemH74Ujn/ncDW9y3GradSc353serX7RPjcTpRBg3mUmGXJVx68sfrsTn+p
 SKrPNWu5CyjKZIA9zx/x24BYn+4fUkbia486oUkwfIU9hgOXwhSRQIn/HmIHmila/wAO
 J3TAyBi/sb5Vwp8UoDumozA21hJoPSEa6jYet76iZrx5/zW7MFZNP3BhwcR5BpVV5CeY
 /35boMMSdEIklIDRv/3rsNo7+X3Ry//rCZdWwSgckp6NdRl6jDJCuYM0yvZ+JVmpJkrI
 3UUg==
X-Gm-Message-State: AE9vXwOLZxo49QnWDjZzF9eU0aY9ulIFPpWSQ7wKOfyBVIfx+/grQDO/gQQTRJGKk3UIQg==
X-Received: by 10.55.97.11 with SMTP id v11mr6046465qkb.27.1472068467484;
 Wed, 24 Aug 2016 12:54:27 -0700 (PDT)
Received: from christophersmbp.austin.ibm.com ([32.97.110.51])
 by smtp.gmail.com with ESMTPSA id n6sm3544238qkf.36.2016.08.24.12.54.26
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Wed, 24 Aug 2016 12:54:27 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux v5 5/7] drivers/fsi: Add FSI bus type and hook into LDM
Date: Wed, 24 Aug 2016 14:54:10 -0500
Message-Id: <1472068452-32048-6-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Wed, 24 Aug 2016 19:54:30 -0000

From: Chris Bostic <cbostic@us.ibm.com>

Add FSI bus type.  Add fsi device registration hooks into the LDM
Provide bus match/probe/remove/etc... callbacks for the LDM to invoke.

Signed-off-by: Chris Bostic <cbostic@us.ibm.com>
---
 drivers/fsi/fsi.h     |  42 ++++++++++++++++
 drivers/fsi/fsiinit.c |   6 +++
 drivers/fsi/ldm.c     | 136 ++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 184 insertions(+)

diff --git a/drivers/fsi/fsi.h b/drivers/fsi/fsi.h
index b723208..67d4666 100644
--- a/drivers/fsi/fsi.h
+++ b/drivers/fsi/fsi.h
@@ -28,6 +28,20 @@ struct fsi_engine_id {
 	u8 engine_vendor;
 };
 
+/*
+ * Bit fields to search for device/driver match. A driver may handle several
+ * engines. If a driver handles all versions, just specify the type and
+ * set match_flags to FSI_ENGINE_ID_MATCH_TYPE.
+ * If a driver handles only certain versions, specify type and engine and
+ * set match_flags to FSI_ENGINE_ID_MATCH_TYPE | FSI_ENGINE_ID_MATCH_VERSION.
+ * Set the engine_vendor identifier and FSI_ENGINE_ID_MATCH_VENDOR if a
+ * certain vendor has to be supported.
+ */
+#define FSI_ENGINE_ID_MATCH_NONE	0	/* Last entry in chain */
+#define FSI_ENGINE_ID_MATCH_TYPE	1	/* Match the type */
+#define FSI_ENGINE_ID_MATCH_VERSION	2	/* Match the version */
+#define FSI_ENGINE_ID_MATCH_VENDOR	4	/* Match the vendor */
+
 /* Location information for a FSI device */
 struct fsimap {
 	u8 link;			/* Master link # */
@@ -40,6 +54,18 @@ struct fsimap {
 	u16 kb_off;			/* CFAM config table offset data */
 };
 
+#define FSI_DEV_MEMRES		1	/* Physical address of device */
+#define FSI_DEV_IRQRES		2	/* IRQ resource */
+#define FSI_DEV_VARES		3	/* Virtual address of device */
+#define FSI_DEV_NONE		4	/* Empty indicator */
+#define FSI_DEV_PSEUDO		5	/* Pseudo engine */
+#define FSI_DEV_IRQ		6	/* Has an IRQ */
+#define FSI_DEV_ACTIVE		7	/* Is activated */
+#define FSI_DEV_RLS_SLV		8	/* Release slave */
+#define FSI_DEV_PROBE_OK	9	/* Probe succeeded */
+#define FSI_DEV_PROBE_ERR	10	/* Probe failed */
+
+
 struct fsidevice {
 	struct fsi_engine_id id;	/* Engine type/version */
 	u32 irq_start;			/* IRQ Number */
@@ -47,6 +73,22 @@ struct fsidevice {
 	struct fsidevice *parent;	/* Parent of this device */
 	struct device dev;		/* LDM entry for bus */
 	struct fsimap map;		/* Address & location info */
+	unsigned long state;		/* flags for state */
 };
 
+#define to_fsidevice(x)	container_of((x), struct fsidevice, dev)
+
+/*
+ * FSI driver type
+ */
+struct fsidriver {
+	struct module *owner;		/* Module owner */
+	struct fsi_engine_id *idlist;	/* List of IDs, terminated by */
+					/*   FSI_ENGINE_ID_MATCH_NONE */
+	struct device_driver driver;	/* LDM hook */
+	int (*reset)(void *);		/* Client defined reset method */
+};
+
+#define to_fsidriver(x)	container_of((x), struct fsidriver, driver)
+
 #endif /* DRIVERS_FSI_H */
diff --git a/drivers/fsi/fsiinit.c b/drivers/fsi/fsiinit.c
index eaa3582..d83992e 100644
--- a/drivers/fsi/fsiinit.c
+++ b/drivers/fsi/fsiinit.c
@@ -53,6 +53,12 @@ static int fsi_start(void)
 		goto err;
 	}
 	fsimaster_start(&fsidd.pri_master);
+
+	if (fsibus_init()) {		/* Create the FSI bus */
+		rc = -ENFILE;
+		goto err;
+	}
+
 	dev_dbg(&fsidd.dev, "FSI DD v%d installation ok\n", FSIDD_VERNO);
 	return rc;
 
diff --git a/drivers/fsi/ldm.c b/drivers/fsi/ldm.c
index 4a2f90b..9fe10b3 100644
--- a/drivers/fsi/ldm.c
+++ b/drivers/fsi/ldm.c
@@ -10,6 +10,7 @@
  * as published by the Free Software Foundation; either version
  * 2 of the License, or (at your option) any later version.
  */
+#include <linux/blkdev.h>
 #include "fsi.h"
 #include "fsi_private.h"
 
@@ -27,3 +28,138 @@ int fsidev_register(struct fsidevice *fsidev, struct device_attribute **ap)
 	return 0;
 }
 EXPORT_SYMBOL(fsidev_register);
+
+/*
+ * FSI bus functions.
+ */
+
+/*
+ * Call a client's probe function if available
+ */
+static int fsi_bus_probe(struct device *dev)
+{
+	struct fsidevice *fsidev = to_fsidevice(dev);
+	struct device_driver *drv = dev->driver;
+	struct fsidriver *fsidrv = to_fsidriver(dev->driver);
+	int rc = -ENOENT;
+
+	dev_dbg(dev, "probe >> fsidrv:%p probe:%p resume:%p\n",
+		fsidrv, drv->probe, drv->resume);
+
+	if (!drv->probe)
+		goto err;
+	rc = drv->probe(dev);
+	dev_dbg(dev, "drv->probe rc:%d\n", rc);
+	if (rc) {
+		/* Device unsupported or error in probe call back */
+		if (rc != -ENODEV && rc != -ENXIO && rc != -ENOLINK) {
+			set_bit(FSI_DEV_PROBE_ERR, &fsidev->state);
+			goto err;
+		}
+	}
+	set_bit(FSI_DEV_PROBE_OK, &fsidev->state);
+	rc = 1;
+
+	if (rc > 0 && drv->resume) {
+		rc = drv->resume(dev);
+		dev_dbg(dev, "probe resume rc:%d\n", rc);
+	}
+	rc = 0;
+err:
+	dev_dbg(dev, "probe << rc:%d\n", rc);
+	return rc;
+
+}
+
+static int fsi_bus_remove(struct device *dev)
+{
+	dev_dbg(dev, "remove:%p %s\n", dev, dev_name(dev));
+	return 0;
+}
+
+static void fsi_bus_shutdown(struct device *dev)
+{
+	dev_dbg(dev, "shutdown:%p %s\n", dev, dev_name(dev));
+}
+
+/*
+ * Check if a particular engine matches the driver's list of supported devices.
+ */
+static int fsi_bus_match(struct device *dev, struct device_driver *drv)
+{
+	struct fsidevice *fsidev = to_fsidevice(dev);
+	struct fsidriver *fsidrv = to_fsidriver(drv);
+	int match_ok = 0;
+	struct fsi_engine_id *idlist = fsidrv->idlist;
+
+	for (; idlist->match_flags != FSI_ENGINE_ID_MATCH_NONE; ++idlist) {
+		match_ok = 0;
+
+		if ((idlist->match_flags & FSI_ENGINE_ID_MATCH_TYPE) != 0
+		&& fsidev->id.engine_type == idlist->engine_type)
+			match_ok = 1;
+
+		if (match_ok
+		&& (idlist->match_flags & FSI_ENGINE_ID_MATCH_VERSION) != 0)
+			match_ok =
+			fsidev->id.engine_version == idlist->engine_version;
+
+		if (match_ok
+		&& (idlist->match_flags & FSI_ENGINE_ID_MATCH_VENDOR) != 0)
+			match_ok =
+			fsidev->id.engine_vendor == idlist->engine_vendor;
+
+		if (match_ok)
+			break;
+	}
+	dev_dbg(dev,
+		"match type:%02x version:%d vendor:%d match_ok:%d\n",
+		fsidev->id.engine_type, fsidev->id.engine_version,
+		fsidev->id.engine_vendor, match_ok);
+
+	return match_ok;
+}
+
+
+static int fsi_bus_uevent(struct device *dev, struct kobj_uevent_env *env)
+{
+
+	dev_dbg(dev, "%s device:%p\n", dev_name(dev), dev);
+	if (MAJOR(dev->devt)) {
+		if (add_uevent_var(env, "MAJOR=%u", MAJOR(dev->devt)))
+			return -ENOMEM;
+		if (add_uevent_var(env, "MINOR=%u", MINOR(dev->devt)))
+			return -ENOMEM;
+	}
+
+	/* Add bus name of physical device */
+	if (dev->bus) {
+		if (add_uevent_var(env, "PHYSDEVBUS=%s", dev->bus->name))
+			return -ENOMEM;
+	}
+
+	/* Add driver name of physical device */
+	if (dev->driver) {
+		if (add_uevent_var(env, "PHYSDEVDRIVER=%s", dev->driver->name))
+			return -ENOMEM;
+	}
+	return 0;
+};
+
+struct bus_type fsi_bus_type = {
+	.name = "fsi",
+	.match = fsi_bus_match,
+	.uevent = fsi_bus_uevent,
+	.probe = fsi_bus_probe,
+	.remove = fsi_bus_remove,
+	.shutdown = fsi_bus_shutdown,
+};
+EXPORT_SYMBOL(fsi_bus_type);
+
+/*
+ * Create and install the FSI bus
+ */
+int fsibus_init(void)
+{
+	return bus_register(&fsi_bus_type);
+}
-- 
1.8.2.2
