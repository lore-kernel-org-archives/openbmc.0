Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x244.google.com (mail-oi0-x244.google.com
 [IPv6:2607:f8b0:4003:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sq7M05YT0zDrPG
 for <openbmc@lists.ozlabs.org>; Thu,  6 Oct 2016 07:54:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=oCyxQXqD; 
 dkim-atps=neutral
Received: by mail-oi0-x244.google.com with SMTP id d132so3133043oib.2
 for <openbmc@lists.ozlabs.org>; Wed, 05 Oct 2016 13:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=qBdxgDogQkodLoIyvzMztGk09+tWxV3I1wNUQoeyZGc=;
 b=oCyxQXqDxXoVcFCPtZgpwPP/jTlBLRJ7s28/zDm2wxsYvvKpA5SICsz2+BQYYPHzDy
 PC3O5vhXnuEFYX61lGXIBmfZ06FowOrKItbm73S+c/Edex5WjiB29D1NyzNvQsEo/fv0
 /2qBBOVyBoJq1jMGTeO4Of0uP1mBARk/cZqG1pxfrdGFDbxG3ggQRmGszLHNl/1hu8p4
 rGRPhu6TdYQtRMwE0pI2jtc9xZJDcVMYxBaZmE0hct1GARRtoolfzAeCjO8kpG9U0JeD
 iXnDN4JfgetDuWFBwGpURwRPU65h7gxDiP+BHbE9fsJ+Zvg+iwpzQ+Xm7TI6irGDH97w
 GFEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=qBdxgDogQkodLoIyvzMztGk09+tWxV3I1wNUQoeyZGc=;
 b=k4m4NONSqriVEsJWN0Bf1CU1v4KKOEpzSwM20lVr5sTfLZ4BR0q9BRRDlptlI3jRx/
 4+rWmBi0gnfGg7otDIptHLos+MTEFdj9SNDKcr2If+M7Z62DbyITOIV0rPu1LXg89+pJ
 yJHSf5LerdUTSiH+D5rKEUEv4wHwENh1F6qE/R0bgS68Kd3mt5rKv7bZwL+OV4KDDCHE
 V6SCER66KxQzCCUCtpryiScYMzIxLValn+T3zVwGjXzHmmsGSUN4PkpaWAC9UmRI312W
 XLG9qNsesUYHuLl0EDYB79aR1gQ2WotmvIIgt0Wm0kNvQPGBHOfcOqqCQSoZ2tQntW4Z
 5giA==
X-Gm-Message-State: AA6/9Rl32PQg0cSlcSdvviWS3boEzGpZ3GVb8FZSXeJb3FzV65DG7P6hIclvrQti8lX/ag==
X-Received: by 10.157.56.179 with SMTP id p48mr6658230otc.22.1475700875115;
 Wed, 05 Oct 2016 13:54:35 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id i18sm3206459oib.12.2016.10.05.13.54.34
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Wed, 05 Oct 2016 13:54:34 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH linux 02/15] fsi: Add device & driver definitions
Date: Wed,  5 Oct 2016 15:54:15 -0500
Message-Id: <1475700868-75737-3-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Wed, 05 Oct 2016 20:54:37 -0000

From: Jeremy Kerr <jk@ozlabs.org>

Add structs for fsi devices & drivers, and struct device conversion
functions.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 include/linux/fsi.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/linux/fsi.h b/include/linux/fsi.h
index 8e8bdea..66dcf25 100644
--- a/include/linux/fsi.h
+++ b/include/linux/fsi.h
@@ -18,6 +18,17 @@
 
 #include <linux/device.h>
 
+struct fsi_device {
+	struct device dev;
+};
+
+struct fsi_driver {
+	struct device_driver drv;
+};
+
+#define to_fsi_dev(devp) container_of(devp, struct fsi_device, dev)
+#define to_fsi_drv(drvp) container_of(drvp, struct fsi_driver, drv)
+
 extern struct bus_type fsi_bus_type;
 
 #endif /* LINUX_FSI_H */
-- 
1.8.2.2
