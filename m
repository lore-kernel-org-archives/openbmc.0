Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-pf0-x243.google.com (mail-pf0-x243.google.com
 [IPv6:2607:f8b0:400e:c00::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3swhjn0shRzDt4v
 for <openbmc@lists.ozlabs.org>; Sat, 15 Oct 2016 09:15:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=oLIxOFkv; 
 dkim-atps=neutral
Received: by mail-pf0-x243.google.com with SMTP id r16so7968239pfg.3
 for <openbmc@lists.ozlabs.org>; Fri, 14 Oct 2016 15:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ruRhrZffHmxHlnas148NtEG8ndEN+JChEsHhLJ6lFYw=;
 b=oLIxOFkvQ8zBooJp3VlMxEL2Uy4hseBef+Kh0ptWfNuwV3m7hQxHyNJGp5Ss3iaJy8
 HtR85rlmRenKsfElU4YiPvP42yUKkMIUnfS+n24f3kNE9BBt39uafd1+I+22UNF1hYv0
 vrx/MJmGKK0Bx3Jgo4+6RwgN0VxyNhOgj2J6aSMUW8JyLFJCot0nS89Hiw1YC5hkxfrz
 rC+EIeSmJKncXEhq1KY+v9kaIgEbq4Nd9cjwPrpp6zHPnbKWWL+Q/4j0J2BzpzIisW1Z
 BlbWMPACJpu3GpYXDD1+aYULEeei+uDpUf5CeOPU9215C8dpBZ8JAdzf0ZJL6ybgvPFr
 C2Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ruRhrZffHmxHlnas148NtEG8ndEN+JChEsHhLJ6lFYw=;
 b=MJItLtXpJnnNKvBVB/c1Ppnp1CsQowjjIj4rlOykc4KNnuDAAK05EMq1tQ7VeCujFw
 Qw/NhSsO4g6fsjIcdpdkNDqnoxL8vlBYBC28DpoOf+qAglUAfVoz2J5pePxQUNjHmt/u
 aVaYDCbREF4ytuMJNzB6ajVFQdY1sD29NB9rd5Bir+8ENy1d3vcKK50F7+V5HRyKIXlX
 xSarGezQlVQv4BUCebC0bjUQI3lb8qkMVHV/tdP231OBPNtZBUxMn+yyfDVwiFWYeGrj
 yzVHl/cWFCN5QV0BiR6jP/oA8PSoJQJqw60t5z8BxkvGqKWdphNGBPmQ6N82dKYXVRlM
 yJZA==
X-Gm-Message-State: AA6/9RnhFLjDGUUL1+/Lv5rGQdGYHPsREcWnHnCGWelvjQhSZF2Z9EdsJJcU4MJcDZw0eg==
X-Received: by 10.98.138.79 with SMTP id y76mr21768659pfd.158.1476483307548;
 Fri, 14 Oct 2016 15:15:07 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id p7sm29848874paa.3.2016.10.14.15.15.06
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Fri, 14 Oct 2016 15:15:07 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Chris Bostic <cbostic@us.ibm.com>
Subject: [PATCH linux v4 16/20] drivers/fsi: Set up links for slave
 communication
Date: Fri, 14 Oct 2016 17:14:38 -0500
Message-Id: <1476483282-85971-17-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Fri, 14 Oct 2016 22:15:09 -0000

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
 drivers/fsi/fsi-core.c        | 43 ++++++++++++++++++++++++++++++++++++++++---
 drivers/fsi/fsi-master-gpio.c | 31 +++++++++++++++++++++++++++++++
 drivers/fsi/fsi-master.h      |  2 ++
 3 files changed, 73 insertions(+), 3 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 5cbe78d..0195373 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -287,16 +287,53 @@ static int fsi_slave_init(struct fsi_master *master,
 
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
+	rc =  master->send_break(master, link);
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
+				"Enable of link:%d failed with:%d\n", link, rc);
+			continue;
+		}
+		rc = fsi_master_break(master, link);
+		if (rc) {
+			dev_dbg(master->dev,
+				"break to link:%d failed with:%d\n", link, rc);
+			continue;
+		}
 		for (slave_id = 0; slave_id < FSI_N_SLAVES; slave_id++)
 			fsi_slave_init(master, link, slave_id);
+	}
 
 	return 0;
-
 }
 
 int fsi_master_register(struct fsi_master *master)
diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
index 5c3d5cd..f8e5ca4 100644
--- a/drivers/fsi/fsi-master-gpio.c
+++ b/drivers/fsi/fsi-master-gpio.c
@@ -50,6 +50,35 @@ static int fsi_master_gpio_write(struct fsi_master *_master, int link,
 	return 0;
 }
 
+/*
+ * Issue a break command on link
+ */
+static int fsi_master_gpio_break(struct fsi_master *_master, int link)
+{
+	struct fsi_master_gpio *master = to_fsi_master_gpio(_master);
+
+	if (link != 0)
+		return -ENODEV;
+
+	/* todo: send the break pattern over gpio */
+	(void)master;
+
+	return 0;
+}
+
+static int fsi_master_gpio_link_enable(struct fsi_master *_master, int link)
+{
+	struct fsi_master_gpio *master = to_fsi_master_gpio(_master);
+
+	if (link != 0)
+		return -ENODEV;
+
+	/* todo: set the enable pin */
+	(void)master;
+
+	return 0;
+}
+
 static int fsi_master_gpio_probe(struct platform_device *pdev)
 {
 	struct fsi_master_gpio *master;
@@ -71,6 +100,8 @@ static int fsi_master_gpio_probe(struct platform_device *pdev)
 
 	master->master.read = fsi_master_gpio_read;
 	master->master.write = fsi_master_gpio_write;
+	master->master.send_break = fsi_master_gpio_break;
+	master->master.link_enable = fsi_master_gpio_link_enable;
 
 	return fsi_master_register(&master->master);
 }
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
