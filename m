Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x241.google.com (mail-oi0-x241.google.com
 [IPv6:2607:f8b0:4003:c06::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMXsT71GCzDvjC
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 13:41:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="MmZ0UECs"; 
 dkim-atps=neutral
Received: by mail-oi0-x241.google.com with SMTP id m75so1348066oig.1
 for <openbmc@lists.ozlabs.org>; Sun, 20 Nov 2016 18:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=V97o/W9Bq8RC2bxTUubm8h9U8GhLI6Gi+nED7Qff9Ys=;
 b=MmZ0UECsb6iF/kubKRRkJNlE4uDdcLJu+pgGDrlGM4DaL9sCxhZR0d/bbDLtdGCQDU
 +e7Ti13a8KCtWkI5piIT5Vrl/ndyZ/EbegJDkpB0U6j4Ca3QcbUEmEEWF5+Yxl98Y8Tb
 yWLE8v3eDg/3mpiB46YzYqED6CUKggLxq63MsirwesjSortMzVXHX/MLHt7TshSbd3nH
 P1qs35bRDu6ypFM+hQl0i1X3gWEwXlgVuN3858++Ma25zgWxGfGQbEAfVfGofsW+417n
 zlExKhpCaRPo9Ic5nAP6Qp9ubBGF6LyKGNFf/ksF/EEMdjTS5j/IdNe7hc1W275+QQW6
 vnxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=V97o/W9Bq8RC2bxTUubm8h9U8GhLI6Gi+nED7Qff9Ys=;
 b=EYL8mq9cPILa4hjB+7m8zKFLt3d8ocE47pxkrXBI359Oxvfcc5UNw22FXlXSVgcuit
 WfB0rXqsUMOod3GbcVdiRP09WpvxeqFGA/VlDLgt6XPHlRLAW0MdjvRagI+a7IF//KrP
 m87Qe53haAbOsxjPbfhI6Pwl5tze1t+lwjo8H1Eenox2Ziq/mBxUatRcN+x12AeVtcS+
 6mEYot43/YgYyf+fTC1qec4YWgz0K9iYMPjyT3ZCA5xbwojSqJhSzkGCZm4RVxZOjc9L
 rkeCU83eDuaHun/+cXYCJl+xluQhFaDN2KUw63AKTyZQndMR7EFNKXWRN1cOnH38naQo
 GzPw==
X-Gm-Message-State: AKaTC000PDnrw+PlcT6Hv/gfxAjEfnqA4n5hDLBDXzCJwfPOHqmUKAO3/2SC65L5iNtr2Q==
X-Received: by 10.157.10.136 with SMTP id 8mr6696713otq.119.1479696060171;
 Sun, 20 Nov 2016 18:41:00 -0800 (PST)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id 73sm6432307otf.16.2016.11.20.18.40.59
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sun, 20 Nov 2016 18:40:59 -0800 (PST)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org, gustavo.padovan@collabora.co.uk,
 gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch, jthumshirn@suse.de,
 dan.j.williams@intel.com, sre@kernel.org, clg@kaod.org,
 k.kozlowski@samsung.com
Cc: jk@ozlabs.org, joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 benh@kernel.crashing.org, alistair@popple.id.au
Subject: [PATCH linux 03/19] fsi: add driver to device matches
Date: Sun, 20 Nov 2016 20:40:32 -0600
Message-Id: <1479696048-75851-4-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailer: git-send-email 2.7.4 (Apple Git-66)
In-Reply-To: <1479696048-75851-1-git-send-email-christopher.lee.bostic@gmail.com>
References: <1479696048-75851-1-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailman-Approved-At: Mon, 21 Nov 2016 13:57:36 +1100
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
X-List-Received-Date: Mon, 21 Nov 2016 02:41:02 -0000

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
