Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (bilbo.ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y5g3x6360zDqY1
 for <openbmc@lists.ozlabs.org>; Tue,  3 Oct 2017 11:33:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="pdTL/Ppg"; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1023)
 id 3y5g3x51tdz9t5s; Tue,  3 Oct 2017 11:33:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1506990781; bh=U0lw5i4h7fGZbauRyTlZYuuAQvDULA6de+x8E37Z/+U=;
 h=From:To:Cc:Subject:Date:From;
 b=pdTL/PpgiR5mgTZ3JbAZ6wklxOiNcFhdP/RWUoNUazMjb5tDkNJsaDG3+4YSQkJgk
 J0bcLq0PKWnSVsVYL/izoKfCcgSaVpom4adZ3p3fv1di+pc0EhPs8tddsBQdXbyHXa
 BFbCE4o+UA+OuUgpATerb6ie5yNhQUlfubWwoBNAyTtgcgrBUSXk0HAen6Z4SanRPj
 8dOaqD1XH4S5tTpF36YxfuX+VwXWw35II1jgldBXG8KaFlkYFw9XBs6O13WC2HUfX1
 XuFJl37SE9ki8+EHps5u+ne0aUzlCcb7MhFDDPTQP7UwSO9fNW9xHI3NmfnFEzSbtX
 kEKquT4255KIA==
From: Jeremy Kerr <jk@ozlabs.org>
To: openbmc@lists.ozlabs.org
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH] fsi/master: Clarify master lifetimes & fix use-after-free in
 hub master
Date: Tue,  3 Oct 2017 08:32:23 +0800
Message-Id: <1506990743-1455-1-git-send-email-jk@ozlabs.org>
X-Mailer: git-send-email 2.7.4
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Oct 2017 00:33:02 -0000

Once we call fsi_master_unregister, the core will put_device,
potentially freeing the hub master. This change adds a comment
explaining the lifetime of an allocated fsi_master.

We then add a reference from the driver to the hub master, so it stays
around until we've finished ->remove().

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 drivers/fsi/fsi-master-hub.c | 19 ++++++++++++++++---
 drivers/fsi/fsi-master.h     | 15 +++++++++++++++
 2 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/drivers/fsi/fsi-master-hub.c b/drivers/fsi/fsi-master-hub.c
index 5e4cd31..614d5f5 100644
--- a/drivers/fsi/fsi-master-hub.c
+++ b/drivers/fsi/fsi-master-hub.c
@@ -288,10 +288,19 @@ static int hub_master_probe(struct device *dev)
 	hub_master_init(hub);
 
 	rc = fsi_master_register(&hub->master);
-	if (!rc)
-		return 0;
+	if (rc)
+		goto err_release;
+
+	/* At this point, fsi_master_register performs the device_initialize(),
+	 * and holds the sole reference on master.dev. This means the device
+	 * will be freed (via ->release) during any subsequent call to
+	 * fsi_master_unregister.  We add our own reference to it here, so we
+	 * can perform cleanup (in _remove()) without it being freed before
+	 * we're ready.
+	 */
+	get_device(&hub->master.dev);
+	return 0;
 
-	kfree(hub);
 err_release:
 	fsi_slave_release_range(fsi_dev->slave, FSI_HUB_LINK_OFFSET,
 			FSI_HUB_LINK_SIZE * links);
@@ -306,6 +315,10 @@ static int hub_master_remove(struct device *dev)
 	fsi_slave_release_range(hub->upstream->slave, hub->addr, hub->size);
 	of_node_put(hub->master.dev.of_node);
 
+	/* master.dev will likely be ->release()ed after this, which free()s
+	 * the hub */
+	put_device(&hub->master.dev);
+
 	return 0;
 }
 
diff --git a/drivers/fsi/fsi-master.h b/drivers/fsi/fsi-master.h
index 546257d..1530ab2 100644
--- a/drivers/fsi/fsi-master.h
+++ b/drivers/fsi/fsi-master.h
@@ -37,6 +37,21 @@ struct fsi_master {
 
 #define dev_to_fsi_master(d) container_of(d, struct fsi_master, dev)
 
+/**
+ * fsi_master registration & lifetime: the fsi_master_register() and
+ * fsi_master_unregister() functions will take ownership of the master, and
+ * ->dev in particular. The registration path performs a get_device(), which
+ * takes the first reference on the device. Similarly, the unregistration path
+ * performs a put_device(), which may well drop the last reference.
+ *
+ * This means that master implementations *may* need to hold their own
+ * reference (via get_device()) on master->dev. In particular, if the device's
+ * ->release callback frees the fsi_master, then fsi_master_unregister will
+ * invoke this free if no other reference is held.
+ *
+ * The same applies for the error path of fsi_master_register; if the call
+ * fails, dev->release will have been invoked.
+ */
 extern int fsi_master_register(struct fsi_master *master);
 extern void fsi_master_unregister(struct fsi_master *master);
 
-- 
2.7.4
