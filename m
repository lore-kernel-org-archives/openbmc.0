Return-Path: <benh@kernel.crashing.org>
Authentication-Results: lists.ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41ZRh53LdtzDqCG;
 Tue, 24 Jul 2018 15:27:32 +1000 (AEST)
Received: from pasglop.ozlabs.ibm.com (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w6O55JLL028169;
 Tue, 24 Jul 2018 00:05:36 -0500
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: openbmc@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>, linux-aspeed@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>, Eddie James <eajames@linux.vnet.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH 5/5] fsi: Prevent multiple concurrent rescans
Date: Tue, 24 Jul 2018 15:05:19 +1000
Message-Id: <20180724050519.31920-6-benh@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180724050519.31920-1-benh@kernel.crashing.org>
References: <20180724050519.31920-1-benh@kernel.crashing.org>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Jul 2018 05:27:34 -0000

The bus scanning process isn't terribly good at parallel attempts
at rescanning the same bus. Let's have a per-master mutex protecting
the scanning process.

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 drivers/fsi/fsi-core.c   | 16 ++++++++++++++--
 drivers/fsi/fsi-master.h |  2 ++
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index dea5bd48acc5..2c31563fdcae 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -1203,8 +1203,14 @@ static void fsi_master_unscan(struct fsi_master *master)
 
 int fsi_master_rescan(struct fsi_master *master)
 {
+	int rc;
+
+	mutex_lock(&master->scan_lock);
 	fsi_master_unscan(master);
-	return fsi_master_scan(master);
+	rc = fsi_master_scan(master);
+	mutex_unlock(&master->scan_lock);
+
+	return rc;
 }
 EXPORT_SYMBOL_GPL(fsi_master_rescan);
 
@@ -1240,6 +1246,7 @@ int fsi_master_register(struct fsi_master *master)
 	int rc;
 	struct device_node *np;
 
+	mutex_init(&master->scan_lock);
 	master->idx = ida_simple_get(&master_ida, 0, INT_MAX, GFP_KERNEL);
 	dev_set_name(&master->dev, "fsi%d", master->idx);
 
@@ -1264,8 +1271,11 @@ int fsi_master_register(struct fsi_master *master)
 	}
 
 	np = dev_of_node(&master->dev);
-	if (!of_property_read_bool(np, "no-scan-on-init"))
+	if (!of_property_read_bool(np, "no-scan-on-init")) {
+		mutex_lock(&master->scan_lock);
 		fsi_master_scan(master);
+		mutex_unlock(&master->scan_lock);
+	}
 
 	return 0;
 }
@@ -1278,7 +1288,9 @@ void fsi_master_unregister(struct fsi_master *master)
 		master->idx = -1;
 	}
 
+	mutex_lock(&master->scan_lock);
 	fsi_master_unscan(master);
+	mutex_unlock(&master->scan_lock);
 	device_unregister(&master->dev);
 }
 EXPORT_SYMBOL_GPL(fsi_master_unregister);
diff --git a/drivers/fsi/fsi-master.h b/drivers/fsi/fsi-master.h
index f653f75da7be..040a7d4cf717 100644
--- a/drivers/fsi/fsi-master.h
+++ b/drivers/fsi/fsi-master.h
@@ -18,6 +18,7 @@
 #define DRIVERS_FSI_MASTER_H
 
 #include <linux/device.h>
+#include <linux/mutex.h>
 
 /* Various protocol delays */
 #define	FSI_ECHO_DELAY_CLOCKS	16	/* Number clocks for echo delay */
@@ -59,6 +60,7 @@ struct fsi_master {
 	int		idx;
 	int		n_links;
 	int		flags;
+	struct mutex	scan_lock;
 	int		(*read)(struct fsi_master *, int link, uint8_t id,
 				uint32_t addr, void *val, size_t size);
 	int		(*write)(struct fsi_master *, int link, uint8_t id,
-- 
2.17.1
