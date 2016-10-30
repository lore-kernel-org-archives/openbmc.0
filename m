Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t6WrN4ZRtzDvXq
 for <openbmc@lists.ozlabs.org>; Mon, 31 Oct 2016 09:09:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=ZEN67hHo; 
 dkim-atps=neutral
Received: by mail-oi0-x242.google.com with SMTP id 128so1107473oih.3
 for <openbmc@lists.ozlabs.org>; Sun, 30 Oct 2016 15:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=N5NyQzJ6e/fsN4DqXJuw05apVoemhSyo9MmjGC3YLog=;
 b=ZEN67hHoEncKaMzkyVWuE5VIHM5Rtlw7rFU3isLB6Ad23/C/NJ1sfl9NaD1rXX7Dp0
 xFOPsnX5bMhi2DUmu8ThkxFIO7mRm97xjygRfcnBN9l8NzH7qPF/VIS1HdbJWh3F4rzc
 gIykrbkbAe5fUed4xEtqInkVkRInk7ERzltWjJP0/ymdccTCxb3mjLezJ0lhaHLOrHkC
 ++6uQfGZN3IF+TKc8TnGCcoZgJ/zjvMxKVi9Bgl6zPCdgGOHstdp8cnf6LAL55MhafDr
 +MC+KL7+GvRtaaxQbJEfkWUBjwl+OOyid7GXQWTmS2xSdH051V+P0/YAvN5g/2Z0sYQR
 7VQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=N5NyQzJ6e/fsN4DqXJuw05apVoemhSyo9MmjGC3YLog=;
 b=WvH9GLCX2U3lmzD2EtFTBduqauCmutHDiYUGeSt8HHjpDCThxmKdBbc1LwjQ6wEb21
 rHHtlY6WhwXm/wJ18Pq61rOxYvKjZR+a8Px9rMQGqzUXzmC336h7KN6HeT1Qh3OO3nkj
 JSuwU2dE4Vpd5WjnxEl+lv7182JUmUJsF1NO3Sk0uSqN+2Cixe5gyj6dhCg7j7bFBcRZ
 MB1C5i4hXbnqLFAu0wGavwwBQw5+BgWP6nuknpwHOU8Ye87BDUGUgH5+zlEWLgb1BjjD
 k2b6YZ+NYFpSnKnoD2GSYWRtxFaFXf7an40qoly2G9HuHNFLKrdNB5/KpsbrgTOXnT4f
 8kAA==
X-Gm-Message-State: ABUngvfoVrEEgLecGuod+aRPeMNVMHxkxYyvT27SeuTiPyG1mVyfiF9elQuaAfmvjtPg9g==
X-Received: by 10.202.61.2 with SMTP id k2mr12134668oia.44.1477865394949;
 Sun, 30 Oct 2016 15:09:54 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id q59sm7585484ota.20.2016.10.30.15.09.53
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sun, 30 Oct 2016 15:09:54 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH linux v6 08/18] fsi: Add empty master scan
Date: Sun, 30 Oct 2016 17:09:10 -0500
Message-Id: <1477865379-11566-9-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Sun, 30 Oct 2016 22:09:57 -0000

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
