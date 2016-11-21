Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMXsh67tNzDvjG
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 13:41:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="RjZY0cFR"; 
 dkim-atps=neutral
Received: by mail-oi0-x242.google.com with SMTP id v84so20145565oie.2
 for <openbmc@lists.ozlabs.org>; Sun, 20 Nov 2016 18:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ZMuQaxjjJHAHvW49YfJCEASqPB3QW2O5TTxDUSf32z4=;
 b=RjZY0cFR6Jq0Un7dNNFf9SfLNnzKxZGc1YwCfH3oMVZma9nOJ1352f5jVsWBMYUfih
 Gp2lqIrEPPQv/QYiwZIgQ53mEENc0HCfCq+TNTWrtVsI6L1+A+eWNpewHi+T+wBc0T3o
 AwjmA53x8JO3NQL5k4c13fxn7vVmr64GpEvSEL1y6PEVIrsIXOT3VSN8dFgiPOnYh8UD
 rfouydCqU6FEdQYlm0xRsDXDjS5lmt0X+6yq37cAYM+DF+NFGOccIZ5Q8uvZnFqj97TH
 bCzO2AO1IiLHms19EY9CqLPJfzK1iybvQfbQuzVeV5kj/HoaspssZzSzdtYWInc5nfSh
 5aUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ZMuQaxjjJHAHvW49YfJCEASqPB3QW2O5TTxDUSf32z4=;
 b=ey2d34kTpYE9grBtGP6NY1MypxIiG5nSWhA1YwdL8Sey/zWLP0oV9hKzVAleg3r3YM
 BlqwRzCN6TpMUxVyEnJ0O9xZf8Yqmd3ESwa80/+XvpSikM75X60TD1x83FJNg5d+nHZE
 XpaimE8jCR9U0UjYxegS1YDMnEnL6jLUHeu/sFtFvd7Ho9SLcu+5J2oPYDAUnGAdgUe6
 3QlM/3I3JUX1rXACHisbpSUKtd1SeaGQI+XzsOggeptdakCLEgQfb11A/vmM5rkPn4S9
 HNJyap+YQEqTqZsflu8evgxmj6BPQpkQb8OQl5dgL0BgsaLnimmw8IL8ib4QbTxOlhVL
 oWzw==
X-Gm-Message-State: AKaTC01rwcFBCifu0HuAY6mKQckWZs6tbG0rPOenaabahM7pPI6MZnKiCT5Hm9l0cwvBAw==
X-Received: by 10.157.47.136 with SMTP id r8mr7156326otb.20.1479696071167;
 Sun, 20 Nov 2016 18:41:11 -0800 (PST)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id 73sm6432307otf.16.2016.11.20.18.41.10
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sun, 20 Nov 2016 18:41:10 -0800 (PST)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org, gustavo.padovan@collabora.co.uk,
 gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch, jthumshirn@suse.de,
 dan.j.williams@intel.com, sre@kernel.org, clg@kaod.org,
 k.kozlowski@samsung.com
Cc: jk@ozlabs.org, joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 benh@kernel.crashing.org, alistair@popple.id.au,
 Chris Bostic <cbostic@us.ibm.com>
Subject: [PATCH linux 13/19] drivers/fsi: Set up links for slave communication
Date: Sun, 20 Nov 2016 20:40:42 -0600
Message-Id: <1479696048-75851-14-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Mon, 21 Nov 2016 02:41:13 -0000

From: Chris Bostic <cbostic@us.ibm.com>

Enable each link and send a break command in preparation
for scanning each link for slaves.

Signed-off-by: Chris Bostic <cbostic@us.ibm.com>
---
 drivers/fsi/fsi-core.c   | 39 ++++++++++++++++++++++++++++++++++++---
 drivers/fsi/fsi-master.h |  2 ++
 2 files changed, 38 insertions(+), 3 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index e7a3e57..15ebb22 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -292,16 +292,49 @@ static int fsi_slave_init(struct fsi_master *master,
 
 /* FSI master support */
 
+static int fsi_master_link_enable(struct fsi_master *master, int link)
+{
+	if (master->link_enable)
+		return master->link_enable(master, link);
+
+	return 0;
+}
+
+/*
+ * Issue a break command on this link
+ */
+static int fsi_master_break(struct fsi_master *master, int link)
+{
+	if (master->send_break)
+		return master->send_break(master, link);
+
+	return 0;
+}
+
 static int fsi_master_scan(struct fsi_master *master)
 {
-	int link, slave_id;
+	int link, slave_id, rc;
+
+	for (link = 0; link < master->n_links; link++) {
+		rc = fsi_master_link_enable(master, link);
+		if (rc) {
+			dev_dbg(master->dev,
+				"enable link:%d failed with:%d\n", link, rc);
+			continue;
+		}
+		rc = fsi_master_break(master, link);
+		if (rc) {
+			dev_dbg(master->dev,
+				"Break to link:%d failed with:%d\n", link, rc);
+			continue;
+		}
 
-	for (link = 0; link < master->n_links; link++)
 		for (slave_id = 0; slave_id < FSI_N_SLAVES; slave_id++)
 			fsi_slave_init(master, link, slave_id);
 
-	return 0;
+	}
 
+	return 0;
 }
 
 int fsi_master_register(struct fsi_master *master)
diff --git a/drivers/fsi/fsi-master.h b/drivers/fsi/fsi-master.h
index cafb433..56aad0e 100644
--- a/drivers/fsi/fsi-master.h
+++ b/drivers/fsi/fsi-master.h
@@ -29,6 +29,8 @@ struct fsi_master {
 	int		(*write)(struct fsi_master *, int link,
 				uint8_t slave, uint32_t addr,
 				const void *val, size_t size);
+	int		(*send_break)(struct fsi_master *, int link);
+	int		(*link_enable)(struct fsi_master *, int link);
 };
 
 extern int fsi_master_register(struct fsi_master *master);
-- 
1.8.2.2
