Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMXsl0lw1zDvjC
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 13:41:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="KxVKo+rf"; 
 dkim-atps=neutral
Received: by mail-oi0-x242.google.com with SMTP id u15so754201oie.3
 for <openbmc@lists.ozlabs.org>; Sun, 20 Nov 2016 18:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=gu5eOFu24WxKPpGKjV0VLGyrtMn5FNHAIJj8MeSlpa4=;
 b=KxVKo+rfgH318RdzUTZeWjjhUB3g0ESYzpBhoJ+IqyYjGZLdw5WwSgsvPUV0WXOwUa
 iYV+zR514lQ5axRhRPhnEeoNoVWH81d6U0Dwhh6xjKWzeVPQi8irKQ2SnDAFifuUmfOe
 ELAZKnO3IxrWnxyWxiyfM/GfJAwiTQrH5ry6EmmGPen6yFPgNZ3ZC70FKkMJiTBVDLWp
 DMNJa6wvNIijp+0dZIYfyter8oKOUNMHVBaNMJs0H5/ZMluWRWYc4a6W+z1b/NMdCUgJ
 WPIK/DoxN5pj/fj5rIe1vBRh6o6zK6Zm6iinWo04sueqGQsylgbux1mtiCRnZO97rZTH
 ohdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=gu5eOFu24WxKPpGKjV0VLGyrtMn5FNHAIJj8MeSlpa4=;
 b=DjOoFX+DW8skZe7toi2ZLvYHDmE8ye8EfKjBaokZFctjs3auyhcvdM5a2S07++gCLh
 dNNKzvIbA467kywj6zfKU93G1uy6qry3aR8sQSPQzlxrN1yQ6WOTBnv77tih32tYFrPL
 LEZQSJRqEu3P37E4bI+aLkLGNM4lwgTGCe6mKJtxuzhWNYVg35nlf9d2quR3wWBtjjVP
 omU9Dn5LwHgyP7S038voTVFK64J9bw7fqYvGafqeNfvew+lJ9ttUVBRGlY3rGTkcJIOs
 XvsrdpPb4yErP/+symPJsS+V4eWvHNMlVCfFZi8XsN6tOX6HZUutrT7n8jjbqBtyZ1x7
 cUqA==
X-Gm-Message-State: AKaTC00YXpL5S4G5nzDYZrDCUjsY2yQORC+vzB9SMTcIPKXYopl0RSZKtuwwFeyQJqiEfw==
X-Received: by 10.157.1.36 with SMTP id 33mr7940362otu.65.1479696073415;
 Sun, 20 Nov 2016 18:41:13 -0800 (PST)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id 73sm6432307otf.16.2016.11.20.18.41.12
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sun, 20 Nov 2016 18:41:12 -0800 (PST)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org, gustavo.padovan@collabora.co.uk,
 gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch, jthumshirn@suse.de,
 dan.j.williams@intel.com, sre@kernel.org, clg@kaod.org,
 k.kozlowski@samsung.com
Cc: jk@ozlabs.org, joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 benh@kernel.crashing.org, alistair@popple.id.au,
 Chris Bostic <cbostic@us.ibm.com>
Subject: [PATCH linux 15/19] drivers/fsi: Add master unscan
Date: Sun, 20 Nov 2016 20:40:44 -0600
Message-Id: <1479696048-75851-16-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailer: git-send-email 2.7.4 (Apple Git-66)
In-Reply-To: <1479696048-75851-1-git-send-email-christopher.lee.bostic@gmail.com>
References: <1479696048-75851-1-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailman-Approved-At: Mon, 21 Nov 2016 13:57:36 +1100
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
X-List-Received-Date: Mon, 21 Nov 2016 02:41:15 -0000

From: Chris Bostic <cbostic@us.ibm.com>

Allow a master to undo a previous scan.  Should a master scan a bus
twice it will need to ensure it doesn't double register any
previously detected device.

Signed-off-by: Chris Bostic <cbostic@us.ibm.com>
---
 drivers/fsi/fsi-core.c   | 36 +++++++++++++++++++++++++++++++++++-
 drivers/fsi/fsi-master.h |  2 ++
 include/linux/fsi.h      |  1 +
 3 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 059e967..3667cff 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -43,6 +43,8 @@ static const int engine_page_size = 0x400;
 static atomic_t master_idx = ATOMIC_INIT(-1);
 
 struct fsi_slave {
+	struct list_head	list_link;	/* Master's list of slaves */
+	struct list_head	my_engines;
 	struct device		dev;
 	struct fsi_master	*master;
 	int			link;
@@ -198,6 +200,8 @@ static int fsi_slave_scan(struct fsi_slave *slave)
 	uint32_t conf;
 	int rc, i;
 
+	INIT_LIST_HEAD(&slave->my_engines);
+
 	/*
 	 * scan engines
 	 *
@@ -266,7 +270,9 @@ static int fsi_slave_scan(struct fsi_slave *slave)
 			if (rc) {
 				dev_warn(&slave->dev, "add failed: %d\n", rc);
 				put_device(&dev->dev);
+				continue;
 			}
+			list_add(&dev->link, &slave->my_engines);
 		}
 
 		engine_addr += slots * engine_page_size;
@@ -359,7 +365,7 @@ static int fsi_slave_init(struct fsi_master *master,
 		put_device(&slave->dev);
 		return rc;
 	}
-
+	list_add(&slave->list_link, &master->my_slaves);
 	fsi_slave_scan(slave);
 	return 0;
 }
@@ -390,6 +396,11 @@ static int fsi_master_scan(struct fsi_master *master)
 	int link, slave_id, rc;
 	uint32_t smode;
 
+	if (!master->slave_list) {
+		INIT_LIST_HEAD(&master->my_slaves);
+		master->slave_list = true;
+	}
+
 	for (link = 0; link < master->n_links; link++) {
 		rc = fsi_master_link_enable(master, link);
 		if (rc) {
@@ -425,9 +436,31 @@ static int fsi_master_scan(struct fsi_master *master)
 	return 0;
 }
 
+static void fsi_master_unscan(struct fsi_master *master)
+{
+	struct fsi_slave *slave, *slave_tmp;
+	struct fsi_device *fsi_dev, *fsi_dev_tmp;
+
+	if (!master->slave_list)
+		return;
+
+	list_for_each_entry_safe(slave, slave_tmp, &master->my_slaves,
+							list_link) {
+		list_del(&slave->list_link);
+		list_for_each_entry_safe(fsi_dev, fsi_dev_tmp,
+					&slave->my_engines, link) {
+			list_del(&fsi_dev->link);
+			put_device(&fsi_dev->dev);
+		}
+		device_unregister(&slave->dev);
+	}
+	master->slave_list = false;
+}
+
 int fsi_master_register(struct fsi_master *master)
 {
 	master->idx = atomic_inc_return(&master_idx);
+	master->slave_list = false;
 	get_device(master->dev);
 	fsi_master_scan(master);
 	return 0;
@@ -436,6 +469,7 @@ EXPORT_SYMBOL_GPL(fsi_master_register);
 
 void fsi_master_unregister(struct fsi_master *master)
 {
+	fsi_master_unscan(master);
 	put_device(master->dev);
 }
 EXPORT_SYMBOL_GPL(fsi_master_unregister);
diff --git a/drivers/fsi/fsi-master.h b/drivers/fsi/fsi-master.h
index 56aad0e..454af2b 100644
--- a/drivers/fsi/fsi-master.h
+++ b/drivers/fsi/fsi-master.h
@@ -20,6 +20,8 @@
 #include <linux/device.h>
 
 struct fsi_master {
+	struct list_head my_slaves;
+	bool		slave_list;
 	struct device	*dev;
 	int		idx;
 	int		n_links;
diff --git a/include/linux/fsi.h b/include/linux/fsi.h
index 47af0af..6a36530 100644
--- a/include/linux/fsi.h
+++ b/include/linux/fsi.h
@@ -19,6 +19,7 @@
 #include <linux/device.h>
 
 struct fsi_device {
+	struct list_head	link;	/* for slave's list */
 	struct device		dev;
 	u8			engine_type;
 	u8			version;
-- 
1.8.2.2
