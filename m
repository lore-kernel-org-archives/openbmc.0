Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com
 [IPv6:2607:f8b0:4003:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3srtt73n0hzDrWS
 for <openbmc@lists.ozlabs.org>; Sun,  9 Oct 2016 04:39:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=X0NEWwy4; 
 dkim-atps=neutral
Received: by mail-oi0-x243.google.com with SMTP id i127so3748939oia.0
 for <openbmc@lists.ozlabs.org>; Sat, 08 Oct 2016 10:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=42OvQihmRSPWTiN4RyOrsz/BOXFX8iDJ7350OLTLKv4=;
 b=X0NEWwy4rLYjvZY2V1OV5yIAXxWVniCLReTNUA2YlmZwkny7JLQJ5l88SLDtcNYHYl
 A1oZ9BR8SCKB5vtISYnVaaozXNRDn26YNGN6utUQjCErhHeAbA2eO4zuCd2aSve/BLJM
 q6tuOMtrleZ5J6rEZw1qasNoBOwzJRKvc0zdSntgTnOzjR67t4lq5Zy2N5spYxfPKCLp
 psEMR5TjzVMOIpdj/MOzIP66Zq0BTfFiTP53PkGDS58g38gE/Xvh32qUqJQxCvG3z6Fy
 ffgkzgnaMlrwnyq5Gb+LBCyIQvMb71uSN0w2bAmP1Mnu1HlNeYPqFcSY3LbZzf1/p/6p
 OHGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=42OvQihmRSPWTiN4RyOrsz/BOXFX8iDJ7350OLTLKv4=;
 b=OwXmCOCS7rGdnDUwkiOvH1SwLJsqy4MZEaox9VtI5T+XcW+ix1pnY+GmLMK4uJxips
 S/8dgCqp/Up/Gn44XjiWIyRVPUSm+6W4mbrVpNwUCGryecjFvRwuqtXbNcTBJf6YaVeX
 yVQt7wZdXFBgE+B03bBivmhjSTmVO58n/3QL4DPlK5uT9W53qjDEOkBY7tM0YgmRZKy6
 rwaCXYzjS0e1oOOK47pQcgc8JauWhlIR347+a3j7GZijh/W8njyRV23r07NwiOj446Fi
 QCarYucAkBtS4PFTXyWysim0F0d6LJpgetso6Y+qLbi/uqE6qiRIqqPdIyzaqrsGshBP
 8vuw==
X-Gm-Message-State: AA6/9Rnh9pKtUMTOMEdmeLI6kSKjR//0G6AkL9NRxdQMWMuhpK2jTq0kymsHryJo2bqAzA==
X-Received: by 10.157.44.103 with SMTP id f94mr2710059otb.140.1475948349734;
 Sat, 08 Oct 2016 10:39:09 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id g17sm8025290otd.38.2016.10.08.10.39.09
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sat, 08 Oct 2016 10:39:09 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Chris Bostic <cbostic@us.ibm.com>
Subject: [PATCH linux v2 14/17] drivers/fsi: Fix some text formatting
Date: Sat,  8 Oct 2016 12:38:50 -0500
Message-Id: <1475948333-55960-15-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailer: git-send-email 2.7.4 (Apple Git-66)
In-Reply-To: <1475948333-55960-1-git-send-email-christopher.lee.bostic@gmail.com>
References: <1475948333-55960-1-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Sat, 08 Oct 2016 17:39:12 -0000

From: Chris Bostic <cbostic@us.ibm.com>

Cleaned up a few formatting warnings like blank lines at EOF
and block comment style.

Signed-off-by: Chris Bostic <cbostic@us.ibm.com>
---
 drivers/fsi/fsi-core.c        | 8 ++++++--
 drivers/fsi/fsi-master-fake.c | 1 -
 drivers/fsi/fsi-master-gpio.c | 1 -
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 10bf817..a3a860a 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -87,6 +87,7 @@ int fsi_device_peek(struct fsi_device *dev, void *val)
 static void fsi_device_release(struct device *_device)
 {
 	struct fsi_device *device = to_fsi_dev(_device);
+
 	kfree(device);
 }
 
@@ -185,8 +186,10 @@ static int fsi_slave_scan(struct fsi_slave *slave)
 		type = (conf & FSI_SLAVE_CONF_TYPE_MASK)
 			>> FSI_SLAVE_CONF_TYPE_SHIFT;
 
-		/* Unused address areas are marked by a zero type value; this
-		 * skips the defined address areas */
+		/*
+		 * Unused address areas are marked by a zero type value; this
+		 * skips the defined address areas
+		 */
 		if (type != 0) {
 
 			/* create device */
@@ -229,6 +232,7 @@ static int fsi_slave_scan(struct fsi_slave *slave)
 static void fsi_slave_release(struct device *dev)
 {
 	struct fsi_slave *slave = to_fsi_slave(dev);
+
 	kfree(slave);
 }
 
diff --git a/drivers/fsi/fsi-master-fake.c b/drivers/fsi/fsi-master-fake.c
index 50aac0b..ec1ed5e 100644
--- a/drivers/fsi/fsi-master-fake.c
+++ b/drivers/fsi/fsi-master-fake.c
@@ -93,4 +93,3 @@ static int __init fsi_master_fake_init(void)
 }
 
 module_init(fsi_master_fake_init);
-
diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
index 3855829..5c3d5cd 100644
--- a/drivers/fsi/fsi-master-gpio.c
+++ b/drivers/fsi/fsi-master-gpio.c
@@ -89,4 +89,3 @@ static struct platform_driver fsi_master_gpio_driver = {
 };
 
 module_platform_driver(fsi_master_gpio_driver);
-
-- 
1.8.2.2
