Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-it0-x243.google.com (mail-it0-x243.google.com
 [IPv6:2607:f8b0:4001:c0b::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sznhr3TjwzDvX8
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 10:10:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=dpGsRHgY; 
 dkim-atps=neutral
Received: by mail-it0-x243.google.com with SMTP id 66so3132204itl.3
 for <openbmc@lists.ozlabs.org>; Wed, 19 Oct 2016 16:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ZdtWBlSuOmm5kDKfqQBUA6p2kpdbB6LR2d3dhCSvgxE=;
 b=dpGsRHgYrcowocXEw5ecE/8/Id0++6k3KBEukiXlceT2FXkND9Ey/JU3Ku0aPT46PL
 gUCZsIcpJnEu4AeIpJ9jFpk9n/tLxROy8ezAOg9BFf9I9BJ/xevgkpdtfDoydUaM8qix
 dx5++5KriLeet87ecbGQCPKYa8UBdTL55rXGnK0KZQ2rMwAaV6YGBozEtlhns4x7xxHM
 Z5wqWybP/LrC5gtzOjUYOCAkp3UCFTrT/0zSGWr3LOR6VcZmKcCAOIMa7W+T2bZO+tyr
 6wnMQd9UCTEkUzNlwSl5dZctYeL5HvhwwKLz7gBltisKSRHsQI1ZDxt9KYpl2KswABjg
 SA0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ZdtWBlSuOmm5kDKfqQBUA6p2kpdbB6LR2d3dhCSvgxE=;
 b=ii5WaE9wL+KlBvVfN0bmEbz6GMHs+EtdJv4ak+LzDVXyudmXiIVE27uUMji8pf3eE4
 2c879sm2eGmqyKm040GRquvLOZqOV+j8CNwPJp4Im4XHfjlQ02pPD9xmIl7NsKafY9lF
 zxjJmOczVPSfy1mWY9U8PgTvnJ9PkhR0e9IGk3ZYATM+Y+beaScxAY/URri60amKsa4q
 xnQKHWcBs0veYswEx5gS5G7S9eEo6QWfjm6vAcG82asP4/XPId06mjhtjo4LCrxdLOsG
 +vooF9VPCS3I3MVR5Ggi8EK/7u+ajG5o8MgU9R3sBxlUPjRG+sKe5N7oGt+cRgYvuBda
 0luQ==
X-Gm-Message-State: AA6/9RlU84Owbl+0BPiYvOj/LngBgS2fyN2g1jNR1ZKiHGtr7t+MbBZlL5Kz8fPfswOYQg==
X-Received: by 10.202.216.131 with SMTP id p125mr6271596oig.121.1476918602812; 
 Wed, 19 Oct 2016 16:10:02 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id n196sm15487618oig.8.2016.10.19.16.10.02
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Wed, 19 Oct 2016 16:10:02 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Chris Bostic <cbostic@us.ibm.com>
Subject: [PATCH linux v5 16/18] drivers/fsi: Add client driver register
 utilities
Date: Wed, 19 Oct 2016 18:09:44 -0500
Message-Id: <1476918586-13475-17-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Wed, 19 Oct 2016 23:10:05 -0000

From: Chris Bostic <cbostic@us.ibm.com>

Add driver_register and driver_unregister wrappers for FSI.

V4 - Separate out SCOM client driver registration for a follow
     on patch.

V5 - Rename fsidrv_register, fsidrv_unregster to fsi_drv_register,
     fsi_drv_unregister.

   - Add module_fsi_driver() macro for clients that just need
     to do boilerplate registration

Signed-off-by: Chris Bostic <cbostic@us.ibm.com>
---
 drivers/fsi/fsi-core.c | 17 +++++++++++++++++
 include/linux/fsi.h    | 12 ++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index ed0d20f..704c473 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -456,6 +456,23 @@ static int fsi_bus_match(struct device *dev, struct device_driver *drv)
 	return 0;
 }
 
+int fsi_drv_register(struct fsi_driver *fsi_drv)
+{
+	if (!fsi_drv)
+		return -EINVAL;
+	if (!fsi_drv->id_table)
+		return -EINVAL;
+
+	return driver_register(&fsi_drv->drv);
+}
+EXPORT_SYMBOL_GPL(fsi_drv_register);
+
+void fsi_drv_unregister(struct fsi_driver *fsi_drv)
+{
+	driver_unregister(&fsi_drv->drv);
+}
+EXPORT_SYMBOL_GPL(fsi_drv_unregister);
+
 struct bus_type fsi_bus_type = {
 	.name		= "fsi",
 	.match		= fsi_bus_match,
diff --git a/include/linux/fsi.h b/include/linux/fsi.h
index 47af0af..3235dcc 100644
--- a/include/linux/fsi.h
+++ b/include/linux/fsi.h
@@ -55,6 +55,18 @@ struct fsi_driver {
 #define to_fsi_dev(devp) container_of(devp, struct fsi_device, dev)
 #define to_fsi_drv(drvp) container_of(drvp, struct fsi_driver, drv)
 
+extern int fsi_drv_register(struct fsi_driver *);
+extern void fsi_drv_unregister(struct fsi_driver *);
+
+/* module_fsi_driver() - Helper macro for drivers that don't do
+ * anything special in module init/exit.  This eliminates a lot of
+ * boilerplate.   Each module may only use this macro once, and
+ * calling it replaces module_init() and module_exit()
+ */
+#define module_fsi_driver(__fsi_driver) \
+	module_driver(__fsi_driver, fsi_drv_register, \
+			fsi_drv_unregister)
+
 extern struct bus_type fsi_bus_type;
 
 #endif /* LINUX_FSI_H */
-- 
1.8.2.2
