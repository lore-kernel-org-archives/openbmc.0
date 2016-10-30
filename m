Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x244.google.com (mail-oi0-x244.google.com
 [IPv6:2607:f8b0:4003:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t6WrW74p6zDvQZ
 for <openbmc@lists.ozlabs.org>; Mon, 31 Oct 2016 09:10:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=FZ35vgqr; 
 dkim-atps=neutral
Received: by mail-oi0-x244.google.com with SMTP id 128so1107768oih.3
 for <openbmc@lists.ozlabs.org>; Sun, 30 Oct 2016 15:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=zbQegva7OnNn9VAz6Z6a3/DpgylcOPrvEpKm60BYNNE=;
 b=FZ35vgqrisvqTl+TJnKbtK6wmaoofTLsXQOQsZW93wJ4TD4UOo2gVwJPAHQWTio+7W
 wBaUCRqTcqV9VKwC5V4WOvf7DXVJ6s0U3wS1kPochHaRC7VjxoMQxyEWeN5sg6lY50or
 XVphYMrWH0pDmaWmZjfmzkZquFSa+//RJLskwTYZJpDIa7vOiomdhmMYwehNbDJhdiN+
 hHHwVDEp4IExAuIi6IsNhUTxxVwFF1cbX5mYTJeVVRv0B0Y5LYcI5BsOOK54sb5OVLwA
 /mqsCJNjfo5bTcTeD1qbV4ok3H51uDcqKGJbD/NGTkC4+dEcSsZIi0DCj2jro13rT0UY
 pL6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=zbQegva7OnNn9VAz6Z6a3/DpgylcOPrvEpKm60BYNNE=;
 b=crrgEBMsDd2eL9zgqsL5qePif9RAJQKYEO7p+D6asVFc9cNLcbzBKo41xXP0/PXmqc
 hWEn/YkkiPY4NIV5rlJo0j3PuDwNxc19I8PwTWWT2Eheh/un/swHVT5IH5w1V57ybu2J
 OzqvgvUY8xtxMTzec+rxAQB8vww2JyCPReTlaBYAvUBZhnDUE95M6EJ0xGmy1pUZGDfS
 +/e6ZJAnaOvB4wmCEOS254dASi1Ud6CDYvTEwDCbwamHA/a+yXoXxtkQEphDq3S2eiDU
 ojn+LjJnohA9f9XhpYefD2vzZqfxZVE/38vikUr5Ev2pIPVETLQbbACmKyCP8x6FG8XU
 IFoQ==
X-Gm-Message-State: ABUngveo4gb10lKJnt1L1gjfCfWkuyc580AXmcDbQA6WRbyFXcMqtCzg1IesSGZ5MJLKRQ==
X-Received: by 10.157.12.5 with SMTP id 5mr17266144otr.45.1477865402146;
 Sun, 30 Oct 2016 15:10:02 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id q59sm7585484ota.20.2016.10.30.15.10.01
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sun, 30 Oct 2016 15:10:01 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Chris Bostic <cbostic@us.ibm.com>
Subject: [PATCH linux v6 14/18] drivers/fsi: Set up links for slave
 communication
Date: Sun, 30 Oct 2016 17:09:16 -0500
Message-Id: <1477865379-11566-15-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Sun, 30 Oct 2016 22:10:05 -0000

From: Chris Bostic <cbostic@us.ibm.com>

Enable each link and send a break command in preparation
for scanning each link for slaves.

Signed-off-by: Chris Bostic <cbostic@us.ibm.com>

---

V3 - Remove definition of BREAK command from fsi-master.h

   - Remove definitions of fsi_master_fake for set_smode
     and break

   - Remove master->set_smode master dependent function and
     moved to a generic base master set_smode.

   - Add fsi_master_link_enable with master type dependencies

V4 - Remove all references to set smode

   - Remove file fsi-slave.h

   - Move link break and enable up into master scan

   - Change rc = func(); return rc; coding to return func();
     Note this is still in place in fsi_master_send_break in
     anticipation of changes coming up in next patch of this
     series.

   - Fix comment spelling error

   - Use dev_dbg instead of dev_info when link enable or break
     fails

   - Remove explicit set of master->break and
     master->link_enable to NULL due to kzalloc

v6 - Don't return error if master->link_enable or
     master->break are not defined.
---
 drivers/fsi/fsi-core.c   | 38 +++++++++++++++++++++++++++++++++++---
 drivers/fsi/fsi-master.h |  2 ++
 2 files changed, 37 insertions(+), 3 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 95e867e..7fc15ab 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -288,16 +288,48 @@ static int fsi_slave_init(struct fsi_master *master,
 
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
+				"Enable link:%d failed with:%d\n", link, rc);
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
+	}
 
 	return 0;
-
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
