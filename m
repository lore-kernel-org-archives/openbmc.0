Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x244.google.com (mail-oi0-x244.google.com
 [IPv6:2607:f8b0:4003:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMXsn3xD2zDvjG
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 13:41:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="su2DoUci"; 
 dkim-atps=neutral
Received: by mail-oi0-x244.google.com with SMTP id v84so20145760oie.2
 for <openbmc@lists.ozlabs.org>; Sun, 20 Nov 2016 18:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=dsqbufwQtEnK4Gn3ooeW2Wwi3w1WF4YAl6jatH1drTc=;
 b=su2DoUci6uUCJIB40bxFAessQ0a5dAVnpL0zz2knqOdBmqBJ32ATG+MPfPe58XIX19
 UB9sPbkN5lIEFaWEQXGl6a+CoVB9h9WcBl5Nk00cZ2ImAu9KFL5BDbRhZTHaXg41IG4k
 rLQA9Q6H2V6RmqvpZVBJ7UyJFqZWUiFl2emaRU1rC7DTdZwLMWu4m4Qt56KuFKH97mqo
 zYQX8XfmPry8kbHdiBZrCRWsDHArz8aHaNKH0SKdcYrbnoABvk1AAlzt7/FMp9PfZLzD
 4DcwoA1Hajhrpp7AoodS/Bxb/Nz13GvZznNrwIVTdpmoo513kaj5pbl88gRtIfvNEy8a
 dp/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=dsqbufwQtEnK4Gn3ooeW2Wwi3w1WF4YAl6jatH1drTc=;
 b=WvjJLZOpIxLaOdGfILLsJrtYzoyVgV6fQqka9lowpQHcSwbkMU05Ifzm5RFtc7efmI
 TyhDSsJgpNEUKHhMjU4hl/0x0csqD9ISoauv8pw89/hC6RJCnUCB3bYtjdwsU7E5t3Nc
 6RakE5yUqsCEmBBK8UPuteuNkT1TbsaoEzIGLBteREoYgZN0dRM+JpFiCft3pgZbCw9W
 7vfGL0j2VaeoH/4fXkTY6WvCIDV0onX790H+GsHp4wU+xApt1PHUAE4xeUvEjLRL0yvE
 NVNCl5fkyJQuoI4jv2wDELwnBsxm6+MHQadi6W5hezvbY0VqDUtiYa8nhj6RbZLJIihn
 GoDg==
X-Gm-Message-State: AKaTC026OSyXd5xrnkv4k/FLeB8E7PiVT8zfJVO0ShGemaGEsZw7jMplLaXAbgfoXhGONw==
X-Received: by 10.157.63.100 with SMTP id m91mr7586895otc.245.1479696075857;
 Sun, 20 Nov 2016 18:41:15 -0800 (PST)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id 73sm6432307otf.16.2016.11.20.18.41.14
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sun, 20 Nov 2016 18:41:15 -0800 (PST)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org, gustavo.padovan@collabora.co.uk,
 gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch, jthumshirn@suse.de,
 dan.j.williams@intel.com, sre@kernel.org, clg@kaod.org,
 k.kozlowski@samsung.com
Cc: jk@ozlabs.org, joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 benh@kernel.crashing.org, alistair@popple.id.au,
 Chris Bostic <cbostic@us.ibm.com>
Subject: [PATCH linux 17/19] drivers/fsi: Add client driver register utilities
Date: Sun, 20 Nov 2016 20:40:46 -0600
Message-Id: <1479696048-75851-18-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailer: git-send-email 2.7.4 (Apple Git-66)
In-Reply-To: <1479696048-75851-1-git-send-email-christopher.lee.bostic@gmail.com>
References: <1479696048-75851-1-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailman-Approved-At: Mon, 21 Nov 2016 13:57:37 +1100
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
X-List-Received-Date: Mon, 21 Nov 2016 02:41:18 -0000

From: Chris Bostic <cbostic@us.ibm.com>

Add driver_register and driver_unregister wrappers for FSI.

Signed-off-by: Chris Bostic <cbostic@us.ibm.com>
---
 drivers/fsi/fsi-core.c | 17 +++++++++++++++++
 include/linux/fsi.h    | 12 ++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 3667cff..249f5f2 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -496,6 +496,23 @@ static int fsi_bus_match(struct device *dev, struct device_driver *drv)
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
 struct bus_type fsi_bus_type = {
 	.name		= "fsi",
 	.match		= fsi_bus_match,
diff --git a/include/linux/fsi.h b/include/linux/fsi.h
index 6a36530..cab812d 100644
--- a/include/linux/fsi.h
+++ b/include/linux/fsi.h
@@ -56,6 +56,18 @@ struct fsi_driver {
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
