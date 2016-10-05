Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x244.google.com (mail-oi0-x244.google.com
 [IPv6:2607:f8b0:4003:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sq7M5539szDrPK
 for <openbmc@lists.ozlabs.org>; Thu,  6 Oct 2016 07:54:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=FxuZ1NBn; 
 dkim-atps=neutral
Received: by mail-oi0-x244.google.com with SMTP id r132so13010972oig.1
 for <openbmc@lists.ozlabs.org>; Wed, 05 Oct 2016 13:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=N5NyQzJ6e/fsN4DqXJuw05apVoemhSyo9MmjGC3YLog=;
 b=FxuZ1NBnbhvwayjRLFQ1L8kaLt6g8Gj3Bsmyshly+x8gVcr0CMGqf3iLUGM2OsqR80
 xltJ/Y+ygbYD5CplTiSngSrNHqYtRvDZMhY0HfJ/Hi6gn7F2qB9O2YfIyPFdPDahQb0C
 g/w/KBCJLEhTaL3V5RL6giiwUyZ6rFfn1E2oEcr9yiqpy94QzTfIRkuYvrrxLiQx56Ku
 v0oFxbykclh2/lJI2eSfjkMvR6XOIz01/O94f6L4z89I2dtCK4TQNlSKIr1kyxWz4xvF
 RKtM+TfO1s0IuMhNJJSL2Cqb50I2Of0h8gs5xYAjgl4LmU/OYaQ5kF7oedq8iaKBf7ux
 oxsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=N5NyQzJ6e/fsN4DqXJuw05apVoemhSyo9MmjGC3YLog=;
 b=BESu/yRPTdN9nxELhZ7NnmsFf3LpHORE1vqAtDhPbhFlcj6ceCr/ESzAGlvwyJRXHQ
 bjzMlTl4PEpTmrrsW1wZQEuo00wU0s8kU5kLnseqCl7v8nwwCXJGRYnHX5plAE6LGW2W
 kjukIGTBouPNs/KjuTzxV992wpO7/5kB6aSRAla2Zhkkbc2TUXXTUIZl8/ZLFdn0okvq
 +iOr32SdH83rk76U7m/Rge+ScNFavKgsEybanXVN9WVVas6qdHu2AyND4ISkRKYO2zXx
 Ug3cLt+71srYC8pEp1CS3brQalRQ4PWzx6yQsK4ZgvbPPaMpPV7iIuzkiEQh7PkZQiMH
 LrbQ==
X-Gm-Message-State: AA6/9RmkAxuwfXCXlIOX4HMR21U3DbdWrzA/eZiHsiPpYpnvDn/y7QuTQIKrUw+kdA6WqA==
X-Received: by 10.157.52.67 with SMTP id v61mr7417500otb.181.1475700880039;
 Wed, 05 Oct 2016 13:54:40 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id i18sm3206459oib.12.2016.10.05.13.54.39
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Wed, 05 Oct 2016 13:54:39 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH linux 08/15] fsi: Add empty master scan
Date: Wed,  5 Oct 2016 15:54:21 -0500
Message-Id: <1475700868-75737-9-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Wed, 05 Oct 2016 20:54:42 -0000

From: Jeremy Kerr <jk@ozlabs.org>

When a new fsi master is added, we will need to scan its links, and
slaves attached to those links. This change introduces a little shell to
iterate the links, which we will populate with the actual slave scan in
a later change.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 drivers/fsi/fsi-core.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 7df4291..9744a55 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -21,6 +21,8 @@
 
 #include "fsi-master.h"
 
+#define FSI_N_SLAVES	4
+
 static atomic_t master_idx = ATOMIC_INIT(-1);
 
 struct fsi_slave {
@@ -32,12 +34,34 @@ struct fsi_slave {
 
 #define to_fsi_slave(d) container_of(d, struct fsi_slave, dev)
 
+/* FSI slave support */
+static int fsi_slave_init(struct fsi_master *master,
+		int link, uint8_t slave_id)
+{
+	/* todo: initialise slave device, perform engine scan */
+
+	return -ENODEV;
+}
+
 /* FSI master support */
 
+static int fsi_master_scan(struct fsi_master *master)
+{
+	int link, slave_id;
+
+	for (link = 0; link < master->n_links; link++)
+		for (slave_id = 0; slave_id < FSI_N_SLAVES; slave_id++)
+			fsi_slave_init(master, link, slave_id);
+
+	return 0;
+
+}
+
 int fsi_master_register(struct fsi_master *master)
 {
 	master->idx = atomic_inc_return(&master_idx);
 	get_device(master->dev);
+	fsi_master_scan(master);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(fsi_master_register);
-- 
1.8.2.2
