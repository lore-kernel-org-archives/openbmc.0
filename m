Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-it0-x243.google.com (mail-it0-x243.google.com
 [IPv6:2607:f8b0:4001:c0b::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sznhn6bS7zDvV5
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 10:10:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=LVzztNE4; 
 dkim-atps=neutral
Received: by mail-it0-x243.google.com with SMTP id e203so3157550itc.1
 for <openbmc@lists.ozlabs.org>; Wed, 19 Oct 2016 16:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=9qsNP9Hx/or9SoOeiUfyCx+AghsxKbzcIIzZKVI2NpU=;
 b=LVzztNE4Y1NRrX8hic2vuw8SIM5g5PWLOPqLz4igJ2wWmBkZJhHVsMfwy1R4gZHSy9
 WO2P+9ncJqJkRDu7VTJRomts924sSTdaT5YHpGRafwhLBC009JCWZ2DzKvRgHEABlJHx
 Qm/tizz3kGEDVA529UH1WiC7hOJX0IiLS1/LVv18lfSkHFuroe1850oO5zWiSHDrzWWX
 qzD2P2L7tUbbV+z+TBTnYdeVzaC7ofGvPo0CyGK7P7Y31YP3XMwRfhiiJGy8wmot6n1C
 w6cgWz8jwNo8Bg5/cwcgaPlwkSuzQBTbwOM1GSKwmyUEO0zQEFmnL2Retqv4jWoN4OmZ
 5krQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=9qsNP9Hx/or9SoOeiUfyCx+AghsxKbzcIIzZKVI2NpU=;
 b=nI43aOksPdZoNdcQE1EfiEaGxXEfTWoqxRiHjtcMfoKtsnZqB1F6w9UaAs2HXY5q66
 zbyyAEM5rHNgHrwCI9oboXBukYCy6Z+Xfc1aLgM8iNjxfxQJXFfXaAwsM1ISewVTZoY1
 uimoT0YRQEREv4/RG8aSw6UxaRzDBHQYBD3vKPbcPAMTL9ADlq4AWA5zc76Dqiqc0AcN
 rJcfbp+eWyonHwKsvtR6UnuV7YrYpq6IcR38e+sJQj0y+iOEzuvGaBkMKJAbL4eCFVO2
 ZRxlvAnqayj/aDXVP6ixv8VJUc4r/AShuG9+4QAQ660Zftp1ddW/lSzfLs5leAe3VZDT
 OVxA==
X-Gm-Message-State: AA6/9RkwUY2/zbo0GEzDJccJnAI5FSq3A3d7QA5d2cKYvKygVypEX+nbf9abG+voPZChLA==
X-Received: by 10.202.73.214 with SMTP id w205mr5960157oia.106.1476918600197; 
 Wed, 19 Oct 2016 16:10:00 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id n196sm15487618oig.8.2016.10.19.16.09.59
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Wed, 19 Oct 2016 16:09:59 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Chris Bostic <cbostic@us.ibm.com>
Subject: [PATCH linux v5 13/18] drivers/fsi: Set up links for slave
 communication
Date: Wed, 19 Oct 2016 18:09:41 -0500
Message-Id: <1476918586-13475-14-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Wed, 19 Oct 2016 23:10:02 -0000

From: Chris Bostic <cbostic@us.ibm.com>

Enable each link and send a break command in preparation
for scanning each link for slaves.

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

Signed-off-by: Chris Bostic <cbostic@us.ibm.com>
---
 drivers/fsi/fsi-core.c   | 42 ++++++++++++++++++++++++++++++++++++++++--
 drivers/fsi/fsi-master.h |  2 ++
 2 files changed, 42 insertions(+), 2 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 565c7e3..81ed444 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -287,13 +287,51 @@ static int fsi_slave_init(struct fsi_master *master,
 
 /* FSI master support */
 
+static int fsi_master_link_enable(struct fsi_master *master, int link)
+{
+	if (master->link_enable)
+		return master->link_enable(master, link);
+
+	return -EINVAL;
+}
+
+/*
+ * Issue a break command on this link
+ */
+static int fsi_master_break(struct fsi_master *master, int link)
+{
+	int rc;
+
+	if (!master->send_break)
+		return -EINVAL;
+
+	rc = master->send_break(master, link);
+	if (rc)
+		dev_info(master->dev, "break failed with:%d\n", rc);
+
+	return rc;
+}
+
 static int fsi_master_scan(struct fsi_master *master)
 {
-	int link, slave_id;
+	int link, slave_id, rc;
 
-	for (link = 0; link < master->n_links; link++)
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
 		for (slave_id = 0; slave_id < FSI_N_SLAVES; slave_id++)
 			fsi_slave_init(master, link, slave_id);
+	}
 
 	return 0;
 
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
