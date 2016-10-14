Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-pa0-x242.google.com (mail-pa0-x242.google.com
 [IPv6:2607:f8b0:400e:c03::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3swhjt0NZyzDt4k
 for <openbmc@lists.ozlabs.org>; Sat, 15 Oct 2016 09:15:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=SK/3VvrG; 
 dkim-atps=neutral
Received: by mail-pa0-x242.google.com with SMTP id os4so2458656pac.3
 for <openbmc@lists.ozlabs.org>; Fri, 14 Oct 2016 15:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Cvs4qGyyJ8k73q3cb8NM9OIBpM21D0okhHX/tEL1pEs=;
 b=SK/3VvrGC1IimBDFREcR9F59PtsLbNooVWNwUprGE20RciHk+nkcV2tiH7zze/uD8R
 Ezscdg/wjzLPldZ05mpULhDFIBMguhoHqrHs3cILPWiT6nueuv14WahJ1s6mllmkkY8k
 tPdNd6pfA7aXr1VUTfXoBFyfVbm3WaAl511Uhnv0fHAYkiL6L/Uv+KO3K/IY3LStJ5kF
 qTgubryeumN5kt9RFt1uGd6n8D8F0lCpUZd/G/24c84+6Q3UK/35VpxGpcsZxyS2SY3p
 zUf2PXBXSSSHrvsY9kUR/BKBnPYwVPjUtFIVOtnUrVLqZMCGig4Y6AOQ9NqItL+1vxK3
 tpwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Cvs4qGyyJ8k73q3cb8NM9OIBpM21D0okhHX/tEL1pEs=;
 b=l3AoCYebgupym13OKc2JMW1J8t+rEzRypq4GxTfIR2/REQycxuWVFx78b+D3Z19M7H
 BbnGQehQHrAG3vmJqSAGoV32yxpoKU5V8J5wesuEGR/sPywT+BmKJvAcWi/ZNM2OA5Vt
 ayty1dMMXMW1gXPQZGc653LV7i/jR0kdp4zzy6fEGmdu/iNrAVUdaAbhBzLEcAsJKBAW
 T9UE3XrAWKZ/w5G0VX3SDYIbbGv20ASOtO+C/hASzNXEePvPHeeWud3pC1nVR40VVGQ6
 t6JmHadtKb7tkOM+pIuk5DXRtsHzDUHqCCGyzabigzRLT4YaWSWTAqhdJTwjm2CGwtYw
 Qtwg==
X-Gm-Message-State: AA6/9RlUu6JgIB7l+/D6zSF1KOe80E6vh0/lEhiPQbT1pMiyASFx+XQ9ibtCxSiLhDFwhw==
X-Received: by 10.66.165.172 with SMTP id yz12mr17837590pab.208.1476483312235; 
 Fri, 14 Oct 2016 15:15:12 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id p7sm29848874paa.3.2016.10.14.15.15.11
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Fri, 14 Oct 2016 15:15:11 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Chris Bostic <cbostic@us.ibm.com>
Subject: [PATCH linux v4 19/20] drivers/fsi: Add client driver register
 utilities
Date: Fri, 14 Oct 2016 17:14:41 -0500
Message-Id: <1476483282-85971-20-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Fri, 14 Oct 2016 22:15:14 -0000

From: Chris Bostic <cbostic@us.ibm.com>

Add driver_register and driver_unregister wrappers for FSI.

V4 - Separated out SCOM client driver registration for a follow
     on patch.

Signed-off-by: Chris Bostic <cbostic@us.ibm.com>
---
 drivers/fsi/fsi-core.c | 17 +++++++++++++++++
 include/linux/fsi.h    |  3 +++
 2 files changed, 20 insertions(+)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 185aff4..38935c0 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -459,6 +459,23 @@ static int fsi_bus_match(struct device *dev, struct device_driver *drv)
 	return 0;
 }
 
+int fsidrv_register(struct fsi_driver *fsi_drv)
+{
+	if (!fsi_drv)
+		return -EINVAL;
+	if (!fsi_drv->id_table)
+		return -EINVAL;
+
+	return driver_register(&fsi_drv->drv);
+}
+EXPORT_SYMBOL_GPL(fsidrv_register);
+
+void fsidrv_unregister(struct fsi_driver *fsi_drv)
+{
+	driver_unregister(&fsi_drv->drv);
+}
+EXPORT_SYMBOL_GPL(fsidrv_unregister);
+
 struct bus_type fsi_bus_type = {
 	.name		= "fsi",
 	.match		= fsi_bus_match,
diff --git a/include/linux/fsi.h b/include/linux/fsi.h
index 47af0af..09670b7 100644
--- a/include/linux/fsi.h
+++ b/include/linux/fsi.h
@@ -55,6 +55,9 @@ struct fsi_driver {
 #define to_fsi_dev(devp) container_of(devp, struct fsi_device, dev)
 #define to_fsi_drv(drvp) container_of(drvp, struct fsi_driver, drv)
 
+extern int fsidrv_register(struct fsi_driver *);
+extern void fsidrv_unregister(struct fsi_driver *);
+
 extern struct bus_type fsi_bus_type;
 
 #endif /* LINUX_FSI_H */
-- 
1.8.2.2
