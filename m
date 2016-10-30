Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x241.google.com (mail-oi0-x241.google.com
 [IPv6:2607:f8b0:4003:c06::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t6Wrb3Wb0zDvNj
 for <openbmc@lists.ozlabs.org>; Mon, 31 Oct 2016 09:10:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=Z2zXMRmx; 
 dkim-atps=neutral
Received: by mail-oi0-x241.google.com with SMTP id 62so5826184oif.1
 for <openbmc@lists.ozlabs.org>; Sun, 30 Oct 2016 15:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=qqJdfuFAIq097trcBhGJODJk/AieVOAzVKP9mSrWhyI=;
 b=Z2zXMRmxojMNYoCKHdfmhbyoXNGFPTJ2Sn2FvjcM+sRPfYEN8Ng95jdX3PazwhmWdE
 EfPKyil0YMnXPN0sZfWxPSvXU8VWnHeJeRG7PVdSNmqIXPjW/IM+bA69yXOCuEUaEf6S
 E1h6aNsYceOrjjEKt4GQSttXfG4pjpIyQ8TBb4UpCXLVO6K9lTCdDnckqT3Kg0qt4bRA
 kvOP9afv5Kn+1CHRUaL4UMKYNl8IQNoaamXGFQhh8Ig+UvsQbU43YVlsTsuOu+wAMkYr
 ZYY4sPQDMzLioKCeeomXn8Va80fY8E2jIw1DogZLhez6kpHOGPkadghSs56XZXgolMof
 BrPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=qqJdfuFAIq097trcBhGJODJk/AieVOAzVKP9mSrWhyI=;
 b=fB9UwSJ862ygtp7gEULFWSHF8ekr5J3eMnqw1J3gtFgbwbPh7hTB7PNIbTjm0I0DWO
 TNhMbKu4QUSheXR1xJp8KZSgJmto1/wT9kzIUMrUK294E/N4j5urTyATl+cU5QDaFd3S
 eq06tGfrrJ3GJLWLkBJ3/uT51VSS/Lsa6yWkfnJpbR2AjsItR/sotcwC2ojJigby1f8G
 4AVoAC7g4BuDAWXhzRcZBg1hi1jKBjCzLZoJjTAIF9mXuYvH64RWm2TinvFAWuef+gUZ
 uBXyxjnk3JO3/e8KqZDkZpSyRePzK4Mhn+jD305Z2Ndvtd6XG8RHIqGagCRi/0Veapg6
 50yw==
X-Gm-Message-State: ABUngvfMMbrzTqxWYFxvz0tJCfUv5JBYseUYwxuN/u/Au9yuEsJOE9wVGSS1D/hr5GOBew==
X-Received: by 10.157.11.23 with SMTP id a23mr18059589ota.117.1477865405788;
 Sun, 30 Oct 2016 15:10:05 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id q59sm7585484ota.20.2016.10.30.15.10.04
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sun, 30 Oct 2016 15:10:05 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Chris Bostic <cbostic@us.ibm.com>
Subject: [PATCH linux v6 17/18] drivers/fsi: Add client driver register
 utilities
Date: Sun, 30 Oct 2016 17:09:19 -0500
Message-Id: <1477865379-11566-18-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Sun, 30 Oct 2016 22:10:08 -0000

From: Chris Bostic <cbostic@us.ibm.com>

Add driver_register and driver_unregister wrappers for FSI.

Signed-off-by: Chris Bostic <cbostic@us.ibm.com>

---

V4 - Separate out SCOM client driver registration for a follow
     on patch.

V5 - Rename fsidrv_register, fsidrv_unregster to fsi_drv_register,
     fsi_drv_unregister.

   - Add module_fsi_driver() macro for clients that just need
     to do boilerplate registration

V6 - Rename fsi_drv_register/unregister to fsi_driver_register/..
---
 drivers/fsi/fsi-core.c | 18 ++++++++++++++++++
 include/linux/fsi.h    | 12 ++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 6ac239a..88002fc 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -458,6 +458,24 @@ static int fsi_bus_match(struct device *dev, struct device_driver *drv)
 	return 0;
 }
 
+int fsi_driver_register(struct fsi_driver *fsi_drv)
+{
+	if (!fsi_drv)
+		return -EINVAL;
+	if (!fsi_drv->id_table)
+		return -EINVAL;
+
+	return driver_register(&fsi_drv->drv);
+}
+EXPORT_SYMBOL_GPL(fsi_driver_register);
+
+void fsi_driver_unregister(struct fsi_driver *fsi_drv)
+{
+	driver_unregister(&fsi_drv->drv);
+}
+EXPORT_SYMBOL_GPL(fsi_driver_unregister);
+
+
 struct bus_type fsi_bus_type = {
 	.name		= "fsi",
 	.match		= fsi_bus_match,
diff --git a/include/linux/fsi.h b/include/linux/fsi.h
index 47af0af..62453b7 100644
--- a/include/linux/fsi.h
+++ b/include/linux/fsi.h
@@ -55,6 +55,18 @@ struct fsi_driver {
 #define to_fsi_dev(devp) container_of(devp, struct fsi_device, dev)
 #define to_fsi_drv(drvp) container_of(drvp, struct fsi_driver, drv)
 
+extern int fsi_driver_register(struct fsi_driver *);
+extern void fsi_driver_unregister(struct fsi_driver *);
+
+/* module_fsi_driver() - Helper macro for drivers that don't do
+ * anything special in module init/exit.  This eliminates a lot of
+ * boilerplate.  Each module may only use this macro once, and
+ * calling it replaces module_init() and module_exit()
+ */
+#define module_fsi_driver(__fsi_driver) \
+		module_driver(__fsi_driver, fsi_driver_register, \
+				fsi_driver_unregister)
+
 extern struct bus_type fsi_bus_type;
 
 #endif /* LINUX_FSI_H */
-- 
1.8.2.2
