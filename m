Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com
 [IPv6:2607:f8b0:4003:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3srtt26JVlzDrWR
 for <openbmc@lists.ozlabs.org>; Sun,  9 Oct 2016 04:39:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=TmRaT6Te; 
 dkim-atps=neutral
Received: by mail-oi0-x243.google.com with SMTP id i127so3748856oia.0
 for <openbmc@lists.ozlabs.org>; Sat, 08 Oct 2016 10:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=N5NyQzJ6e/fsN4DqXJuw05apVoemhSyo9MmjGC3YLog=;
 b=TmRaT6TeUhGpQ1bqZ8y+RI+KqeWxOlDVaSCuPt4zisy4e7j19QveSiG0Uy4hhksQD2
 3hjo17MQAoPWtTkLo+l9N4TbR62n8AzPUK3mdvAbw4ncW7DOYOriGkZlXYwzQfpxoNoT
 gYI5FHOMvTDX+mJD+fUr6M3GSAoTIZddng9SPDjsNWj4g9eNGU/4LH6WtAsAvU4JBPVa
 qKLsiq4aUIyNgCXwU7bprtQFWK/3cdD1EHVGSZGZPwkyyh1snj7cEKNHZ0UlkMtYGqIc
 cAf4LmSGmUES59FAobEHTYJcmb0OGdAHS9zwCLsHwGMVQH3Eg0omaUkJrnflmd4JnRxk
 udiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=N5NyQzJ6e/fsN4DqXJuw05apVoemhSyo9MmjGC3YLog=;
 b=DK+ETXfc1T0MXfhudMx8Pk5IOjxy8iMEwvboF1BznrNd/QcemqNiWyQe3aywH3gGQv
 UFoa99Lvx54TwI7ceNagJRg5scsuv6ESVi9NHCyQGZ7nXZZ6wA9SnMt+GWcZOYlgcubD
 xcbtA5oaSV+gzu/0PFp813jC4HyMaamy8xn4WRMxm/qfn5OAmav9PHQ8TXZKYH/T+ds0
 x0P1MDGd0Rfle0Hssu3CzbAnW/zbAmToRvXQLq+LQnA0oP1XjoVjkhsyAf2aSXRcG39X
 31h10JW7WF3AatYUjXMisStJJK3NTq4FIPGA6aqZp1BZhbox5GdlBRdxHlpjnlHpFb8L
 LG9w==
X-Gm-Message-State: AA6/9RkDxbQ2IfYV9ZBAvMjF3BQuviJHspQafq17iUWDUiQB+slIOpNNbJxZ+M+6YS652w==
X-Received: by 10.157.9.183 with SMTP id q52mr14462971otd.130.1475948345237;
 Sat, 08 Oct 2016 10:39:05 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id g17sm8025290otd.38.2016.10.08.10.39.04
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sat, 08 Oct 2016 10:39:04 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH linux v2 08/17] fsi: Add empty master scan
Date: Sat,  8 Oct 2016 12:38:44 -0500
Message-Id: <1475948333-55960-9-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Sat, 08 Oct 2016 17:39:07 -0000

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
